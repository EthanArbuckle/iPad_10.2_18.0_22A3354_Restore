@implementation PKPaymentRemoteAlertViewController

+ (id)groupsControllerWithSource:(int64_t)a3 hasUserBeenAuthenticated:(BOOL)a4 passUniqueID:(id)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _QWORD v19[2];
  _QWORD v20[3];

  v5 = a4;
  v20[2] = *MEMORY[0x1E0C80C00];
  v7 = a5;
  if (v7)
  {
    v8 = objc_alloc(MEMORY[0x1E0D66DB8]);
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v7, 0);
    v10 = (void *)objc_msgSend(v8, "initWithPassTypeMask:passFilters:allowedPassUniqueIDs:", -1, 0, v9);

  }
  else
  {
    if (a3)
    {
      v11 = 26;
      if (v5)
        v11 = 10;
      if (a3 != 1)
        v11 = 0;
      if (a3 == 5)
        v12 = 10;
      else
        v12 = v11;
    }
    else
    {
      if (PKUserIntentIsAvailable())
      {
        v13 = (void *)MEMORY[0x1E0D66A58];
        v14 = *MEMORY[0x1E0D698E8];
        v15 = *MEMORY[0x1E0D68858];
        v19[0] = *MEMORY[0x1E0D68AA0];
        v19[1] = v15;
        v16 = *MEMORY[0x1E0D68828];
        v20[0] = *MEMORY[0x1E0D68B18];
        v20[1] = v16;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "subject:sendEvent:", v14, v17);

      }
      if (v5)
        v12 = 8;
      else
        v12 = 24;
    }
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66DB8]), "initWithPassTypeMask:passFilters:allowedPassUniqueIDs:", -1, v12, 0);
  }
  objc_msgSend(v10, "setReorderingEnabled:", 0);

  return v10;
}

- (PKPaymentRemoteAlertViewController)init
{
  char *v2;
  void *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PKPaymentRemoteAlertViewController;
  v2 = -[PKPaymentRemoteAlertViewController init](&v11, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0D672B0]), "initWithDelegate:", v2);
    v6 = (void *)*((_QWORD *)v2 + 125);
    *((_QWORD *)v2 + 125) = v5;

    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v2[1112] = objc_msgSend(v7, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D46F90]) == 1;

    if (PKAccessPassVisibilityEnabled())
      v8 = v2[1112] == 0;
    else
      v8 = 0;
    v2[1128] = v8;
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__paymentDidReceiveSuccessfulTransactionNotification_, *MEMORY[0x1E0D6AD00], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__contactlessInterfaceSessionDidAuthorize_, *MEMORY[0x1E0D69C28], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__contactlessInterfaceSessionFinishTransaction_, *MEMORY[0x1E0D69C38], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_openApplication_, CFSTR("PKOpenApplicationNotification"), 0);
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)RestrictionChangedCallback, (CFStringRef)*MEMORY[0x1E0D69CC8], 0, (CFNotificationSuspensionBehavior)0);
    +[PKBacklightController sharedInstance](PKBacklightController, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "beginAllowingBacklightRamping:", v2);

    v2[1099] = 1;
    *(_DWORD *)(v2 + 1151) = 0;
    *((_QWORD *)v2 + 143) = 0;

  }
  return (PKPaymentRemoteAlertViewController *)v2;
}

- (void)dealloc
{
  void *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  CLInUseAssertion *passbookForegroundAssertion;
  CLInUseAssertion *v6;
  CLInUseAssertion *v7;
  dispatch_time_t v8;
  CLInUseAssertion *v9;
  objc_super v10;
  _QWORD block[4];
  CLInUseAssertion *v12;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x1E0D69CC8], 0);
  -[PKPaymentService setDelegate:](self->_paymentService, "setDelegate:", 0);
  passbookForegroundAssertion = self->_passbookForegroundAssertion;
  if (passbookForegroundAssertion)
  {
    v6 = passbookForegroundAssertion;
    v7 = self->_passbookForegroundAssertion;
    self->_passbookForegroundAssertion = 0;

    v8 = dispatch_time(0, (uint64_t)(*MEMORY[0x1E0D6A4D0] * 1000000000.0));
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__PKPaymentRemoteAlertViewController_dealloc__block_invoke;
    block[3] = &unk_1E3E612E8;
    v12 = v6;
    v9 = v6;
    dispatch_after(v8, MEMORY[0x1E0C80D38], block);

  }
  -[PKPaymentRemoteAlertViewController _invalidate](self, "_invalidate");
  v10.receiver = self;
  v10.super_class = (Class)PKPaymentRemoteAlertViewController;
  -[SBUIRemoteAlertServiceViewController dealloc](&v10, sel_dealloc);
}

uint64_t __45__PKPaymentRemoteAlertViewController_dealloc__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (void)_invalidate
{
  -[PKPaymentRemoteAlertViewController _invalidateForType:](self, "_invalidateForType:", 2);
}

- (void)_invalidateForType:(int64_t)a3
{
  int64_t invalidationStatus;
  NSObject *v6;
  PKPassGroupsViewController *passGroupsViewController;
  void *v8;
  void *v9;
  id staticGlyphResources;
  BSInvalidatable *lockButtonObserver;
  BSInvalidatable *v12;
  SBSAssertion *lockButtonAssertion;
  SBSAssertion *v14;
  void *v15;
  NSObject *v16;
  PKPassGroupsViewController *v17;
  PKAssertion *notificationSuppressionAssertion;
  int v19;
  PKPaymentRemoteAlertViewController *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  invalidationStatus = self->_invalidationStatus;
  if (invalidationStatus < a3)
  {
    self->_invalidationStatus = a3;
    if (a3 >= 1 && invalidationStatus <= 0)
    {
      PKLogFacilityTypeGetObject();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        passGroupsViewController = self->_passGroupsViewController;
        v19 = 134349312;
        v20 = self;
        v21 = 2050;
        v22 = passGroupsViewController;
        _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "PKPaymentRemoteAlertViewController (%{public}p:%{public}p): partially invalidated.", (uint8_t *)&v19, 0x16u);
      }

      -[PKPaymentRemoteAlertViewController view](self, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setUserInteractionEnabled:", 0);

      -[PKPassGroupsViewController partiallyInvalidate](self->_passGroupsViewController, "partiallyInvalidate");
      objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "pkui_resetSharedRootAuthenticationContext");

      staticGlyphResources = self->_staticGlyphResources;
      self->_staticGlyphResources = 0;

      lockButtonObserver = self->_lockButtonObserver;
      if (lockButtonObserver)
      {
        -[BSInvalidatable invalidate](lockButtonObserver, "invalidate");
        v12 = self->_lockButtonObserver;
        self->_lockButtonObserver = 0;

      }
      lockButtonAssertion = self->_lockButtonAssertion;
      if (lockButtonAssertion)
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          v19 = 134349312;
          v20 = self;
          v21 = 2050;
          v22 = lockButtonAssertion;
          _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "PKPaymentRemoteAlertViewController (%{public}p): Invalidating pre-arm assertion %{public}p.", (uint8_t *)&v19, 0x16u);
        }

        -[SBSAssertion invalidate](self->_lockButtonAssertion, "invalidate");
        v14 = self->_lockButtonAssertion;
        self->_lockButtonAssertion = 0;

      }
      if (self->_brightnessRampingAllowed)
      {
        +[PKBacklightController sharedInstance](PKBacklightController, "sharedInstance");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "endAllowingBacklightRamping:", self);

      }
      -[PKAuthorizationCoverSheetViewController invalidate](self->_coverSheetViewController, "invalidate");
      -[PKAuthenticator invalidate](self->_coverSheetAuthenticator, "invalidate");
      -[PKBackgroundContactlessInterfaceSessionController invalidate](self->_backgroundContactlessInterfaceSession, "invalidate");
    }
    if (a3 > 1 && invalidationStatus <= 1)
    {
      PKLogFacilityTypeGetObject();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = self->_passGroupsViewController;
        v19 = 134349312;
        v20 = self;
        v21 = 2050;
        v22 = v17;
        _os_log_impl(&dword_19D178000, v16, OS_LOG_TYPE_DEFAULT, "PKPaymentRemoteAlertViewController (%{public}p:%{public}p): invalidated.", (uint8_t *)&v19, 0x16u);
      }

      -[PKAssertion invalidate](self->_notificationSuppressionAssertion, "invalidate");
      notificationSuppressionAssertion = self->_notificationSuppressionAssertion;
      self->_notificationSuppressionAssertion = 0;

      -[PKPassGroupsViewController invalidate](self->_passGroupsViewController, "invalidate");
      objc_msgSend(MEMORY[0x1E0D66A58], "endSubjectReporting:", *MEMORY[0x1E0D698E8]);
    }
    -[PKPaymentRemoteAlertViewController _releaseUIBlockIfNeededTimeout:](self, "_releaseUIBlockIfNeededTimeout:", 0);
  }
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  objc_super v8;

  v4 = a4;
  v6 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKPaymentRemoteAlertViewController;
  -[PKPaymentRemoteAlertViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v8, sel_viewDidMoveToWindow_shouldAppearOrDisappear_, v6, v4);
  if (v6)
  {
    objc_msgSend(v6, "bounds");
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scale");
    PKSetDisplayProperties();

  }
}

- (void)loadView
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPaymentRemoteAlertViewController;
  -[PKPaymentRemoteAlertViewController loadView](&v5, sel_loadView);
  -[PKPaymentRemoteAlertViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKPassGroupStackView backgroundColor](PKPassGroupStackView, "backgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  objc_msgSend(v3, "setAutoresizingMask:", 0);
  -[PKPaymentRemoteAlertViewController _transitionToViewState:animated:](self, "_transitionToViewState:animated:", self->_state.screen, *(_QWORD *)&self->_state.appeared & 0xFFFFFFFFFFFF00FFLL | 0x100, self->_shouldViewAnimateIn);

}

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PKPaymentRemoteAlertViewController;
  -[PKPaymentRemoteAlertViewController viewDidLoad](&v2, sel_viewDidLoad);
  kdebug_trace();
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  PKPassGroupsViewController *passGroupsViewController;
  void *v13;
  void *v14;
  PKAuthorizationCoverSheetViewController *coverSheetViewController;
  void *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)PKPaymentRemoteAlertViewController;
  -[PKPaymentRemoteAlertViewController viewWillLayoutSubviews](&v17, sel_viewWillLayoutSubviews);
  -[PKPaymentRemoteAlertViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  passGroupsViewController = self->_passGroupsViewController;
  if (passGroupsViewController)
  {
    -[PKPassGroupsViewController view](passGroupsViewController, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFrame:", v5, v7, v9, v11);
    objc_msgSend(v13, "layoutIfNeeded");
    -[PKPassGroupsViewController groupStackView](self->_passGroupsViewController, "groupStackView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "layoutContentForCurrentPresentationState:", 0);

  }
  coverSheetViewController = self->_coverSheetViewController;
  if (coverSheetViewController)
  {
    -[PKAuthorizationCoverSheetViewController view](coverSheetViewController, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setFrame:", v5, v7, v9, v11);
    objc_msgSend(v16, "layoutIfNeeded");

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  CLInUseAssertion *v7;
  CLInUseAssertion *passbookForegroundAssertion;
  dispatch_time_t v9;
  void *v10;
  _QWORD block[5];
  _QWORD v12[4];
  id v13;
  id location;
  objc_super v15;

  v3 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKPaymentRemoteAlertViewController;
  -[PKPaymentRemoteAlertViewController viewWillAppear:](&v15, sel_viewWillAppear_);
  if (!self->_passbookForegroundAssertion)
  {
    v5 = (void *)MEMORY[0x1E0C9E3A8];
    PKPassKitCoreBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (CLInUseAssertion *)objc_msgSend(v5, "newAssertionForBundle:withReason:", v6, CFSTR("Passbook displaying UI for field"));
    passbookForegroundAssertion = self->_passbookForegroundAssertion;
    self->_passbookForegroundAssertion = v7;

  }
  if (self->_notificationSuppressionAssertion || self->_invalidationStatus)
  {
    if (!v3)
      goto LABEL_8;
  }
  else
  {
    objc_initWeak(&location, self);
    v10 = (void *)MEMORY[0x1E0D66B80];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __53__PKPaymentRemoteAlertViewController_viewWillAppear___block_invoke;
    v12[3] = &unk_1E3E6F340;
    objc_copyWeak(&v13, &location);
    objc_msgSend(v10, "acquireAssertionOfType:withReason:completion:", 4, CFSTR("Contactless Interface"), v12);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
    if (!v3)
      goto LABEL_8;
  }
  if (self->_shouldViewAnimateIn)
    -[PKPaymentRemoteAlertViewController _transitionToAppeared](self, "_transitionToAppeared");
LABEL_8:
  if (PKHomeButtonIsAvailable())
  {
    v9 = dispatch_time(0, 300000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__PKPaymentRemoteAlertViewController_viewWillAppear___block_invoke_53;
    block[3] = &unk_1E3E612E8;
    block[4] = self;
    dispatch_after(v9, MEMORY[0x1E0C80D38], block);
  }
  else
  {
    self->_processHomeButtonEvents = 1;
  }
}

void __53__PKPaymentRemoteAlertViewController_viewWillAppear___block_invoke(uint64_t a1, void *a2, void *a3)
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
  block[2] = __53__PKPaymentRemoteAlertViewController_viewWillAppear___block_invoke_2;
  block[3] = &unk_1E3E61EE8;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v12);
}

void __53__PKPaymentRemoteAlertViewController_viewWillAppear___block_invoke_2(uint64_t a1)
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
  if (WeakRetained && !WeakRetained[145])
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
      v7 = WeakRetained + 133;
      objc_msgSend(WeakRetained[133], "setInvalidationHandler:", 0);
      objc_msgSend(*v7, "invalidate");
      objc_storeStrong(v4 + 133, *(id *)(a1 + 32));
      v8 = *(void **)(a1 + 32);
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __53__PKPaymentRemoteAlertViewController_viewWillAppear___block_invoke_3;
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

void __53__PKPaymentRemoteAlertViewController_viewWillAppear___block_invoke_3(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  _QWORD *v4;

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = (void *)WeakRetained[133];
    WeakRetained[133] = 0;
    v4 = WeakRetained;

    WeakRetained = v4;
  }

}

uint64_t __53__PKPaymentRemoteAlertViewController_viewWillAppear___block_invoke_53(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 1098) = 1;
  return result;
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPaymentRemoteAlertViewController;
  -[PKPaymentRemoteAlertViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  kdebug_trace();
  -[PKPaymentRemoteAlertViewController _transitionToAppeared](self, "_transitionToAppeared");
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPaymentRemoteAlertViewController;
  -[PKPaymentRemoteAlertViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[PKPaymentRemoteAlertViewController _invalidateForType:](self, "_invalidateForType:", 1);
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
  v11.super_class = (Class)PKPaymentRemoteAlertViewController;
  -[PKPaymentRemoteAlertViewController viewDidDisappear:](&v11, sel_viewDidDisappear_, a3);
  passbookForegroundAssertion = self->_passbookForegroundAssertion;
  if (passbookForegroundAssertion)
  {
    v5 = passbookForegroundAssertion;
    v6 = self->_passbookForegroundAssertion;
    self->_passbookForegroundAssertion = 0;

    v7 = dispatch_time(0, (uint64_t)(*MEMORY[0x1E0D6A4D0] * 1000000000.0));
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__PKPaymentRemoteAlertViewController_viewDidDisappear___block_invoke;
    block[3] = &unk_1E3E612E8;
    v10 = v5;
    v8 = v5;
    dispatch_after(v7, MEMORY[0x1E0C80D38], block);

  }
  -[PKPaymentRemoteAlertViewController _invalidate](self, "_invalidate");
}

uint64_t __55__PKPaymentRemoteAlertViewController_viewDidDisappear___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (void)_transitionToAppeared
{
  $FF6CF3042C8DA242C3F3B4E6E2342FEC *p_state;
  NSObject *v4;
  int v5;
  PKPaymentRemoteAlertViewController *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  p_state = &self->_state;
  if (!self->_state.appeared)
  {
    PKLogFacilityTypeGetObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 134349056;
      v6 = self;
      _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "PKPaymentRemoteAlertViewController (%{public}p): appearing.", (uint8_t *)&v5, 0xCu);
    }

    -[PKPaymentRemoteAlertViewController _transitionToViewState:animated:](self, "_transitionToViewState:animated:", p_state->screen, *(_QWORD *)&p_state->appeared & 0xFFFFFFFFFFFFFF00 | 1, self->_shouldViewAnimateIn);
  }
}

- (void)_transitionToViewStateScreen:(int64_t)a3 animated:(BOOL)a4
{
  -[PKPaymentRemoteAlertViewController _transitionToViewState:animated:](self, "_transitionToViewState:animated:", a3, *(_QWORD *)&self->_state.appeared, a4);
}

- (void)_transitionToViewState:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v5;
  int64_t var0;
  $FF6CF3042C8DA242C3F3B4E6E2342FEC *p_state;
  int64_t screen;
  NSObject *v11;
  void *v12;
  int64_t v13;
  BOOL appeared;
  _BOOL4 v15;
  int v16;
  uint64_t v17;
  id v18;
  void (**v19)(_QWORD);
  PKAuthorizationCoverSheetViewController *coverSheetViewController;
  int v21;
  PKAuthorizationCoverSheetViewController *v22;
  _QWORD v23[4];
  PKAuthorizationCoverSheetViewController *v24;
  id v25;
  _QWORD aBlock[5];
  id v27;
  char v28;
  BOOL v29;
  uint8_t buf[4];
  PKPaymentRemoteAlertViewController *v31;
  __int16 v32;
  int64_t v33;
  __int16 v34;
  int v35;
  __int16 v36;
  unsigned int v37;
  uint64_t v38;

  v4 = a4;
  v5 = *(_QWORD *)&a3.var1;
  var0 = a3.var0;
  v38 = *MEMORY[0x1E0C80C00];
  p_state = &self->_state;
  screen = self->_state.screen;
  if ((a3.var0 != screen
     || a3.var1 != self->_state.appeared
     || ((*(_DWORD *)&a3.var1 >> 8) & 1) != self->_state.viewLoaded)
    && a3.var0 >= screen
    && self->_invalidationStatus == 0)
  {
    PKLogFacilityTypeGetObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349824;
      v31 = self;
      v32 = 2048;
      v33 = var0;
      v34 = 1024;
      v35 = v5 & 1;
      v36 = 1024;
      v37 = (v5 >> 8) & 1;
      _os_log_impl(&dword_19D178000, v11, OS_LOG_TYPE_DEFAULT, "PKPaymentRemoteAlertViewController (%{public}p): Transitioning to state (screen: %ld, appeared: %i, viewLoaded: %i)", buf, 0x22u);
    }

    if ((v5 & 0x100) != 0)
    {
      objc_initWeak((id *)buf, self);
      -[PKPaymentRemoteAlertViewController view](self, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = p_state->screen;
      appeared = p_state->appeared;
      p_state->screen = var0;
      *(_QWORD *)&p_state->appeared = v5;
      v15 = !appeared;
      v16 = v15 & v5;
      v17 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __70__PKPaymentRemoteAlertViewController__transitionToViewState_animated___block_invoke;
      aBlock[3] = &unk_1E3E74900;
      v28 = v15 & v5;
      v29 = v4;
      aBlock[4] = self;
      v18 = v12;
      v27 = v18;
      v19 = (void (**)(_QWORD))_Block_copy(aBlock);
      if ((v5 & 1) == 0)
        objc_msgSend(v18, "setHidden:", 1);
      if (var0 == 2)
      {
        -[PKPaymentRemoteAlertViewController _setupGroupControllerIfNeeded](self, "_setupGroupControllerIfNeeded");
        if (self->_passGroupsViewController)
        {
          v22 = self->_coverSheetViewController;
          if (v22)
          {
            coverSheetViewController = self->_coverSheetViewController;
            self->_coverSheetViewController = 0;

            if (v13 == 1 && v4)
            {
              v23[0] = v17;
              v23[1] = 3221225472;
              v23[2] = __70__PKPaymentRemoteAlertViewController__transitionToViewState_animated___block_invoke_2;
              v23[3] = &unk_1E3E61B68;
              objc_copyWeak(&v25, (id *)buf);
              v24 = v22;
              -[PKAuthorizationCoverSheetViewController fadeOutUIWithCompletion:](v24, "fadeOutUIWithCompletion:", v23);

              objc_destroyWeak(&v25);
            }
            else
            {
              -[PKPaymentRemoteAlertViewController _removeViewController:](self, "_removeViewController:", v22);
            }
            -[PKAuthorizationCoverSheetViewController invalidate](v22, "invalidate");
          }
          -[PKPaymentRemoteAlertViewController _insertViewControllerIfNeeded:](self, "_insertViewControllerIfNeeded:", self->_passGroupsViewController);
          if ((v5 & 0x10001) == 1)
            v21 = 1;
          else
            v21 = v16;
          if (v21 == 1)
          {
            p_state->hasShownPassGroups = 1;
            -[PKPaymentRemoteAlertViewController _startGroupControllerAnimated:completion:](self, "_startGroupControllerAnimated:completion:", v4, 0);
          }
          v19[2](v19);

        }
      }
      else if (var0 == 1)
      {
        -[PKPaymentRemoteAlertViewController _setupCoverSheetIfNeeded](self, "_setupCoverSheetIfNeeded");
        -[PKPaymentRemoteAlertViewController _insertViewControllerIfNeeded:](self, "_insertViewControllerIfNeeded:", self->_coverSheetViewController);
        if (v16)
          -[PKAuthorizationCoverSheetViewController fadeInUIAnimated:performSynchronizedAnimation:](self->_coverSheetViewController, "fadeInUIAnimated:performSynchronizedAnimation:", v4, v19);
      }

      objc_destroyWeak((id *)buf);
    }
    else
    {
      p_state->screen = var0;
      *(_QWORD *)&p_state->appeared = v5;
      if (var0 != 2)
      {
        if (var0 != 1)
          return;
        -[PKPaymentRemoteAlertViewController _setupCoverSheetIfNeeded](self, "_setupCoverSheetIfNeeded");
      }
      -[PKPaymentRemoteAlertViewController _setupGroupControllerIfNeeded](self, "_setupGroupControllerIfNeeded");
    }
  }
}

uint64_t __70__PKPaymentRemoteAlertViewController__transitionToViewState_animated___block_invoke(uint64_t result)
{
  if (*(_BYTE *)(result + 48))
  {
    if (*(_BYTE *)(result + 49))
      return objc_msgSend(*(id *)(result + 32), "_animateViewBackgroundColorIn:", *(_QWORD *)(result + 40));
    else
      return objc_msgSend(*(id *)(result + 40), "setHidden:", 0);
  }
  return result;
}

void __70__PKPaymentRemoteAlertViewController__transitionToViewState_animated___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_removeViewController:", *(_QWORD *)(a1 + 32));

}

- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)result
{
  objc_super v4;

  if (self->_passGroupsViewController != a3)
  {
    v4.receiver = self;
    v4.super_class = (Class)PKPaymentRemoteAlertViewController;
    -[PKPaymentRemoteAlertViewController sizeForChildContentContainer:withParentContainerSize:](&v4, sel_sizeForChildContentContainer_withParentContainerSize_, result.width, result.height);
  }
  return result;
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[PKPaymentRemoteAlertViewController _activeViewController](self, "_activeViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "supportedInterfaceOrientations");
  else
    v4 = 2;

  return v4;
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
  void *coverSheetViewController;

  if (!self->_state.screen)
    return 0;
  coverSheetViewController = self->_coverSheetViewController;
  if (!coverSheetViewController)
    coverSheetViewController = self->_passGroupsViewController;
  return coverSheetViewController;
}

- (id)childViewControllerForStatusBarStyle
{
  void *coverSheetViewController;

  if (!self->_state.screen)
    return 0;
  coverSheetViewController = self->_coverSheetViewController;
  if (!coverSheetViewController)
    coverSheetViewController = self->_passGroupsViewController;
  return coverSheetViewController;
}

- (void)didInvalidateForRemoteAlert
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPaymentRemoteAlertViewController;
  -[SBUIRemoteAlertServiceViewController didInvalidateForRemoteAlert](&v3, sel_didInvalidateForRemoteAlert);
  -[PKPaymentRemoteAlertViewController _invalidate](self, "_invalidate");
  -[PKPaymentRemoteAlertViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 0, 0);
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void **p_passUniqueIdentifier;
  NSString *passUniqueIdentifier;
  NSArray *fieldPassUniqueIdentifiers;
  PKFieldProperties *fieldProperties;
  PKFieldProperties *v16;
  PKFieldProperties *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  unint64_t presentationSource;
  const __CFString *v22;
  void *v23;
  PKFieldProperties *v24;
  BOOL v25;
  _QWORD *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  int64_t v30;
  BOOL v31;
  BOOL v32;
  BOOL v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  _QWORD v41[4];
  id v42;
  id v43;
  id v44;
  BOOL v45;
  BOOL v46;
  uint64_t v47;
  const __CFString *v48;
  uint8_t buf[4];
  PKPaymentRemoteAlertViewController *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v39 = a3;
  v37 = a4;
  PKLogFacilityTypeGetObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134349056;
    v50 = self;
    _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "PKPaymentRemoteAlertViewController (%{public}p): configuring.", buf, 0xCu);
  }

  -[PKPaymentRemoteAlertViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  self->_isLockScreenPresented = PKDeviceUILocked() != 0;
  objc_msgSend(v7, "setWallpaperStyle:withDuration:", 1, 0.0);
  objc_msgSend(v7, "setLaunchingInterfaceOrientation:", 1);
  objc_msgSend(v7, "setAllowsSiri:", 0);
  objc_msgSend(v7, "setDesiredHardwareButtonEvents:", 16);
  objc_msgSend(v7, "setSwipeDismissalStyle:", 1);
  objc_msgSend(v7, "setDismissalAnimationStyle:", 1);
  if (self->_isLockScreenPresented)
    objc_msgSend(v7, "setDesiredAutoLockDuration:", 30.0, v37);
  objc_msgSend(v39, "userInfo", v37);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueForKey:", *MEMORY[0x1E0D6ABD0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  self->_presentationSource = objc_msgSend(v9, "integerValue");

  objc_msgSend(v8, "valueForKey:", *MEMORY[0x1E0D6ABA0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  self->_presentationStartTime = objc_msgSend(v10, "integerValue");

  objc_msgSend(v8, "valueForKey:", *MEMORY[0x1E0D6AB68]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  self->_shouldViewAnimateIn = objc_msgSend(v11, "BOOLValue");

  p_passUniqueIdentifier = (void **)&self->_passUniqueIdentifier;
  passUniqueIdentifier = self->_passUniqueIdentifier;
  self->_passUniqueIdentifier = 0;

  fieldPassUniqueIdentifiers = self->_fieldPassUniqueIdentifiers;
  self->_fieldPassUniqueIdentifiers = 0;

  fieldProperties = self->_fieldProperties;
  self->_fieldProperties = 0;

  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D6AB80]);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (v40)
  {
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v40, 0);
    v16 = (PKFieldProperties *)objc_claimAutoreleasedReturnValue();
    v17 = self->_fieldProperties;
    self->_fieldProperties = v16;

  }
  objc_msgSend(v8, "valueForKey:", *MEMORY[0x1E0D6AB58]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = *MEMORY[0x1E0D698E8];
  objc_msgSend(MEMORY[0x1E0D66A58], "beginSubjectReporting:withArchivedParent:", *MEMORY[0x1E0D698E8], v18);
  v20 = (void *)MEMORY[0x1E0D66A58];
  v47 = *MEMORY[0x1E0D686A0];
  presentationSource = self->_presentationSource;
  if (presentationSource > 6)
    v22 = CFSTR("unknown");
  else
    v22 = off_1E3E74D08[presentationSource];
  v48 = v22;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "subject:sendEvent:", v19, v23);

  if ((unint64_t)(self->_presentationSource - 1) <= 5)
    objc_msgSend(MEMORY[0x1E0D6BFD8], "removeUserIntentAvailable");
  v24 = self->_fieldProperties;
  v25 = v24 == 0;
  if (v24)
    p_passUniqueIdentifier = (void **)&self->_fieldPassUniqueIdentifiers;
  v26 = (_QWORD *)MEMORY[0x1E0D6ABD8];
  if (!v25)
    v26 = (_QWORD *)MEMORY[0x1E0D6AB78];
  objc_msgSend(v8, "objectForKey:", *v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "copy");
  v29 = *p_passUniqueIdentifier;
  *p_passUniqueIdentifier = (void *)v28;

  v30 = self->_presentationSource;
  v31 = v30 == 5;
  v32 = v30 == 6;
  v33 = self->_showCoverSheet && v30 != 5 && (PKDeviceLocked() & 1) != 0 || v32;
  self->_showCoverSheet = v33;
  objc_initWeak((id *)buf, self);
  objc_msgSend(MEMORY[0x1E0D66A60], "shared");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __70__PKPaymentRemoteAlertViewController_configureWithContext_completion___block_invoke;
  v41[3] = &unk_1E3E74C00;
  objc_copyWeak(&v44, (id *)buf);
  v35 = v38;
  v43 = v35;
  v45 = v31;
  v46 = v32;
  v36 = v7;
  v42 = v36;
  objc_msgSend(v34, "isShieldRequiredWithCompletion:", v41);

  objc_destroyWeak(&v44);
  objc_destroyWeak((id *)buf);

}

void __70__PKPaymentRemoteAlertViewController_configureWithContext_completion___block_invoke(uint64_t a1, int a2)
{
  _BYTE *WeakRetained;
  _BYTE *v5;
  int v6;
  NSObject *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  int v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE v18[22];
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  const __CFString *v26;
  __int16 v27;
  const __CFString *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    if (WeakRetained[1128])
      v6 = 1;
    else
      v6 = a2;
    WeakRetained[1128] = v6;
    PKLogFacilityTypeGetObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      if (v6)
        v8 = CFSTR("Y");
      else
        v8 = CFSTR("N");
      if (PKAccessPassVisibilityEnabled())
        v9 = CFSTR("Y");
      else
        v9 = CFSTR("N");
      if (*(_BYTE *)(a1 + 56))
        v10 = CFSTR("Y");
      else
        v10 = CFSTR("N");
      v11 = *(unsigned __int8 *)(a1 + 57);
      if (v5[1097])
        v12 = CFSTR("Y");
      else
        v12 = CFSTR("N");
      *(_DWORD *)v18 = 134350594;
      if (v11)
        v13 = CFSTR("Y");
      else
        v13 = CFSTR("N");
      *(_QWORD *)&v18[4] = v5;
      if (a2)
        v14 = CFSTR("Y");
      else
        v14 = CFSTR("N");
      *(_WORD *)&v18[12] = 2112;
      *(_QWORD *)&v18[14] = v8;
      v19 = 2112;
      v20 = v9;
      v21 = 2112;
      v22 = v10;
      v23 = 2112;
      v24 = v12;
      v25 = 2112;
      v26 = v13;
      v27 = 2112;
      v28 = v14;
      _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "PKPaymentRemoteAlertViewController (%{public}p): Showing cover sheet: %@. FeatureEnabled: %@; isCompletedTransac"
        "tion: %@, isLockScreenPresented: %@, isBiometricRequest: %@, isShieldRequired: %@",
        v18,
        0x48u);
    }

    if (v5[1128])
      v15 = 1;
    else
      v15 = 2;
    objc_msgSend(v5, "_transitionToViewStateScreen:animated:", v15, v5[1096], *(_OWORD *)v18);
    objc_msgSend(v5, "_acquireStaticResources");
    objc_msgSend(v5, "_startBackgroundContactlessInterfaceSessionIfNeeded");
    v16 = *(_QWORD *)(a1 + 40);
    if (v16)
      (*(void (**)(void))(v16 + 16))();
    if (*((_QWORD *)v5 + 145))
      objc_msgSend(*(id *)(a1 + 32), "invalidate");
    else
      objc_msgSend(v5, "_dismissIfRestricted");
  }
  else
  {
    v17 = *(_QWORD *)(a1 + 40);
    if (v17)
      (*(void (**)(void))(v17 + 16))();
  }

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
    -[PKPaymentRemoteAlertViewController _dismissForSource:completion:](self, "_dismissForSource:completion:", 1, 0);
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

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  PKAuthorizationCoverSheetViewController *coverSheetViewController;
  int64_t presentationSource;
  BOOL v10;
  int IsAvailable;
  BOOL v12;
  NSObject *v13;
  void *v14;
  id blockingUIForUserAuthorizationCompletion;
  dispatch_time_t v16;
  _QWORD block[4];
  id v18;
  uint8_t buf[4];
  PKPaymentRemoteAlertViewController *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  coverSheetViewController = self->_coverSheetViewController;
  if (coverSheetViewController)
    -[PKAuthorizationCoverSheetViewController startEvaluation](coverSheetViewController, "startEvaluation");
  presentationSource = self->_presentationSource;
  v10 = presentationSource == 1 && !self->_shouldViewAnimateIn;
  if (!self->_showCoverSheet || self->_state.appeared)
    goto LABEL_8;
  IsAvailable = PKHomeButtonIsAvailable();
  v12 = !v10;
  if (!presentationSource)
    v12 = 0;
  if (v12 || !IsAvailable)
  {
LABEL_8:
    v7[2](v7);
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v20 = self;
      _os_log_impl(&dword_19D178000, v13, OS_LOG_TYPE_DEFAULT, "PKPaymentRemoteAlertViewController (%p): Blocking UI to collect user auth", buf, 0xCu);
    }

    self->_isBlockingUIForUserAuthorization = 1;
    v14 = _Block_copy(v7);
    blockingUIForUserAuthorizationCompletion = self->_blockingUIForUserAuthorizationCompletion;
    self->_blockingUIForUserAuthorizationCompletion = v14;

    objc_initWeak((id *)buf, self);
    v16 = dispatch_time(0, 300000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __81__PKPaymentRemoteAlertViewController_prepareForActivationWithContext_completion___block_invoke;
    block[3] = &unk_1E3E61310;
    objc_copyWeak(&v18, (id *)buf);
    dispatch_after(v16, MEMORY[0x1E0C80D38], block);
    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)buf);
  }

}

void __81__PKPaymentRemoteAlertViewController_prepareForActivationWithContext_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_releaseUIBlockIfNeededTimeout:", 1);

}

- (BOOL)_isInGroup
{
  void *v3;
  void *v4;
  BOOL v5;

  -[PKPassGroupsViewController groupsController](self->_passGroupsViewController, "groupsController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "groupAtIndex:", objc_msgSend(v3, "groupIndexForPassUniqueID:", self->_passUniqueIdentifier));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (unint64_t)objc_msgSend(v4, "passCount") > 1;

  return v5;
}

- (void)_setupGroupControllerIfNeeded
{
  uint64_t v3;
  int64_t presentationSource;
  void *v5;
  NSString *passUniqueIdentifier;
  void *v7;
  PKPassGroupsViewController *v8;
  PKPassGroupsViewController *passGroupsViewController;
  NSObject *v10;
  PKPassGroupsViewController *v11;
  NSObject *v12;
  PKPassGroupsViewController *v13;
  int v14;
  PKPaymentRemoteAlertViewController *v15;
  __int16 v16;
  PKPassGroupsViewController *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!self->_invalidationStatus && !self->_passGroupsViewController)
  {
    if ((PKAccessPassVisibilityEnabled() & 1) != 0)
      v3 = 1;
    else
      v3 = PKDeviceLocked() ^ 1;
    presentationSource = self->_presentationSource;
    v5 = (void *)objc_opt_class();
    if ((unint64_t)(presentationSource - 5) > 1)
      passUniqueIdentifier = 0;
    else
      passUniqueIdentifier = self->_passUniqueIdentifier;
    objc_msgSend(v5, "groupsControllerWithSource:hasUserBeenAuthenticated:passUniqueID:", self->_presentationSource, v3, passUniqueIdentifier);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PKPassGroupsViewController initWithGroupsController:style:]([PKPassGroupsViewController alloc], "initWithGroupsController:style:", v7, 1);
    passGroupsViewController = self->_passGroupsViewController;
    self->_passGroupsViewController = v8;

    -[PKPassGroupsViewController setAssertExpressAvailable:](self->_passGroupsViewController, "setAssertExpressAvailable:", self->_currentShowWhileLockedValue);
    if (objc_msgSend(v7, "groupCount"))
    {
      -[PKPassGroupsViewController setHandleFieldDetection:](self->_passGroupsViewController, "setHandleFieldDetection:", 0);
      -[PKPassGroupsViewController setSuppressedContent:](self->_passGroupsViewController, "setSuppressedContent:", 307);
      PKLogFacilityTypeGetObject();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = self->_passGroupsViewController;
        v14 = 134349312;
        v15 = self;
        v16 = 2050;
        v17 = v11;
        _os_log_impl(&dword_19D178000, v10, OS_LOG_TYPE_DEFAULT, "PKPaymentRemoteAlertViewController (%{public}p): created PKPassGroupsViewController %{public}p.", (uint8_t *)&v14, 0x16u);
      }

    }
    else
    {
      PKLogFacilityTypeGetObject();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v14 = 134349056;
        v15 = self;
        _os_log_impl(&dword_19D178000, v12, OS_LOG_TYPE_DEFAULT, "PKPaymentRemoteAlertViewController (%{public}p): Invaldiating due to no passes to show", (uint8_t *)&v14, 0xCu);
      }

      v13 = self->_passGroupsViewController;
      self->_passGroupsViewController = 0;

      if (self->_state.appeared)
        -[PKPaymentRemoteAlertViewController _dismissForSource:completion:](self, "_dismissForSource:completion:", 2, 0);
      else
        -[PKPaymentRemoteAlertViewController _invalidate](self, "_invalidate");
    }

  }
}

- (void)_startGroupControllerAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  PKAuthenticator *coverSheetAuthenticator;
  _QWORD v11[4];
  id v12;
  id v13;
  BOOL v14;
  _QWORD aBlock[4];
  id v16;
  id v17;
  id location;

  v4 = a3;
  v6 = a4;
  if (v4)
    -[PKPassGroupsViewController presentOffscreenAnimated:split:withCompletionHandler:](self->_passGroupsViewController, "presentOffscreenAnimated:split:withCompletionHandler:", 1, 1, 0);
  objc_initWeak(&location, self);
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __79__PKPaymentRemoteAlertViewController__startGroupControllerAnimated_completion___block_invoke;
  aBlock[3] = &unk_1E3E61C80;
  objc_copyWeak(&v17, &location);
  v8 = v6;
  v16 = v8;
  v9 = _Block_copy(aBlock);
  coverSheetAuthenticator = self->_coverSheetAuthenticator;
  if (coverSheetAuthenticator && self->_showCoverSheet)
  {
    v11[0] = v7;
    v11[1] = 3221225472;
    v11[2] = __79__PKPaymentRemoteAlertViewController__startGroupControllerAnimated_completion___block_invoke_2;
    v11[3] = &unk_1E3E74C28;
    objc_copyWeak(&v13, &location);
    v14 = v4;
    v12 = v9;
    -[PKAuthenticator accessExternalizedContextWithCompletion:](coverSheetAuthenticator, "accessExternalizedContextWithCompletion:", v11);

    objc_destroyWeak(&v13);
  }
  else
  {
    -[PKPaymentRemoteAlertViewController _presentPassAnimated:externalizedContext:completion:](self, "_presentPassAnimated:externalizedContext:completion:", v4, 0, v9);
  }

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

void __79__PKPaymentRemoteAlertViewController__startGroupControllerAnimated_completion___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  uint64_t v4;
  id *v5;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained[122], "setHandleFieldDetection:", WeakRetained[135] != (id)5);
    objc_msgSend(v5, "_presentHomeButtonDoubleTapAlertIfNecessary");
    v3 = v5;
    v4 = *(_QWORD *)(a1 + 32);
    if (v4)
    {
      (*(void (**)(uint64_t, id *))(v4 + 16))(v4, v5);
      v3 = v5;
    }
  }

}

void __79__PKPaymentRemoteAlertViewController__startGroupControllerAnimated_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_presentPassAnimated:externalizedContext:completion:", *(unsigned __int8 *)(a1 + 48), v4, *(_QWORD *)(a1 + 32));

}

- (void)_presentPassAnimated:(BOOL)a3 externalizedContext:(id)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  NSObject *v10;
  PKPassPresentationContext *v11;
  NSString *v12;
  void *v13;
  char v14;
  NSObject *v15;
  int v16;
  PKFieldProperties *fieldProperties;
  NSObject *v18;
  _BOOL4 v19;
  PKPassGroupsViewController *passGroupsViewController;
  PKFieldProperties *v21;
  NSArray *fieldPassUniqueIdentifiers;
  PKPassGroupsViewController *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[5];
  id v28;
  char v29;
  BOOL v30;
  id v31;
  uint8_t buf[4];
  PKPaymentRemoteAlertViewController *v33;
  uint64_t v34;

  v6 = a3;
  v34 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  if (self->_passUniqueIdentifier)
  {
    PKLogFacilityTypeGetObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v33 = self;
      _os_log_impl(&dword_19D178000, v10, OS_LOG_TYPE_DEFAULT, "PKPaymentRemoteAlertViewController (%p): presenting pass.", buf, 0xCu);
    }

    v11 = objc_alloc_init(PKPassPresentationContext);
    -[PKPassPresentationContext setFieldDetect:](v11, "setFieldDetect:", self->_presentationSource == 1);
    -[PKPassPresentationContext setPostPayment:](v11, "setPostPayment:", self->_presentationSource == 5);
    -[PKPassPresentationContext setPresentFanned:](v11, "setPresentFanned:", 1);
    v12 = self->_passUniqueIdentifier;
    -[PKPaymentRemoteAlertViewController view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[PKPassPresentationContext isPostPayment](v11, "isPostPayment")
      && !-[PKPaymentRemoteAlertViewController _isInGroup](self, "_isInGroup"))
    {
      objc_msgSend(v13, "setUserInteractionEnabled:", 0);
      v14 = 1;
    }
    else
    {
      v14 = 0;
    }

    v16 = 0;
  }
  else if (self->_presentationSource == 5)
  {
    PKLogFacilityTypeGetObject();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v33 = self;
      _os_log_impl(&dword_19D178000, v15, OS_LOG_TYPE_DEFAULT, "PKPaymentRemoteAlertViewController (%p): failed presentation for express payment. Dismissing remote interface.", buf, 0xCu);
    }

    v14 = 0;
    v12 = 0;
    v11 = 0;
    v16 = 1;
  }
  else
  {
    fieldProperties = self->_fieldProperties;
    PKLogFacilityTypeGetObject();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    if (fieldProperties)
    {
      if (v19)
      {
        *(_DWORD *)buf = 134217984;
        v33 = self;
        _os_log_impl(&dword_19D178000, v18, OS_LOG_TYPE_DEFAULT, "PKPaymentRemoteAlertViewController (%p): presenting pass for field.", buf, 0xCu);
      }

      passGroupsViewController = self->_passGroupsViewController;
      v21 = self->_fieldProperties;
      fieldPassUniqueIdentifiers = self->_fieldPassUniqueIdentifiers;
      v31 = 0;
      -[PKPassGroupsViewController presentationContextForFieldProperties:fieldPassUniqueIdentifiers:passUniqueIdentifierToPresent:](passGroupsViewController, "presentationContextForFieldProperties:fieldPassUniqueIdentifiers:passUniqueIdentifierToPresent:", v21, fieldPassUniqueIdentifiers, &v31);
      v11 = (PKPassPresentationContext *)objc_claimAutoreleasedReturnValue();
      v12 = (NSString *)v31;
      v16 = 0;
      v14 = 0;
    }
    else
    {
      if (v19)
      {
        *(_DWORD *)buf = 134217984;
        v33 = self;
        _os_log_impl(&dword_19D178000, v18, OS_LOG_TYPE_DEFAULT, "PKPaymentRemoteAlertViewController (%p): presenting table.", buf, 0xCu);
      }

      v11 = objc_alloc_init(PKPassPresentationContext);
      v16 = 0;
      v14 = 0;
      v12 = 0;
    }
  }
  -[PKPassPresentationContext setExternalizedAuthenticationContext:](v11, "setExternalizedAuthenticationContext:", v8);
  -[PKPassPresentationContext setBackgroundSession:](v11, "setBackgroundSession:", self->_backgroundContactlessInterfaceSession);
  if (v16)
  {
    -[PKPaymentRemoteAlertViewController _dismissForSource:completion:](self, "_dismissForSource:completion:", 0, v9);
  }
  else
  {
    v23 = self->_passGroupsViewController;
    if (v12)
    {
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __90__PKPaymentRemoteAlertViewController__presentPassAnimated_externalizedContext_completion___block_invoke;
      v27[3] = &unk_1E3E74C50;
      v27[4] = self;
      v28 = v9;
      v29 = v14;
      v30 = v6;
      -[PKPassGroupsViewController presentPassWithUniqueID:context:animated:completionHandler:](v23, "presentPassWithUniqueID:context:animated:completionHandler:", v12, v11, v6, v27);
      v24 = v28;
    }
    else
    {
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __90__PKPaymentRemoteAlertViewController__presentPassAnimated_externalizedContext_completion___block_invoke_77;
      v25[3] = &unk_1E3E614F0;
      v26 = v9;
      -[PKPassGroupsViewController presentOnscreen:context:withCompletionHandler:](v23, "presentOnscreen:context:withCompletionHandler:", v6, v11, v25);
      v24 = v26;
    }

  }
}

void __90__PKPaymentRemoteAlertViewController__presentPassAnimated_externalizedContext_completion___block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  uint64_t v5;
  id *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[5];
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (a2)
  {
    PKLogFacilityTypeGetObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134217984;
      v14 = v5;
      _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "PKPaymentRemoteAlertViewController (%p): Error: failed remote presentation for express or field detect.", buf, 0xCu);
    }

    v6 = *(id **)(a1 + 32);
    if (*(_BYTE *)(a1 + 48))
    {
      objc_msgSend(v6, "_dismissForSource:completion:", 0, 0);
    }
    else
    {
      objc_msgSend(v6[122], "groupStackView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "presentationState");
      if ((unint64_t)(v8 - 1) < 3 || v8 == 5 && objc_msgSend(v7, "modalGroupIndex") == 0x7FFFFFFFFFFFFFFFLL)
      {
        v9 = *(_QWORD *)(a1 + 32);
        v10 = *(void **)(v9 + 976);
        v11 = *(unsigned __int8 *)(a1 + 49);
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __90__PKPaymentRemoteAlertViewController__presentPassAnimated_externalizedContext_completion___block_invoke_76;
        v12[3] = &unk_1E3E62288;
        v12[4] = v9;
        objc_msgSend(v10, "presentOnscreen:context:withCompletionHandler:", v11, 0, v12);
      }

    }
  }
}

void __90__PKPaymentRemoteAlertViewController__presentPassAnimated_externalizedContext_completion___block_invoke_76(uint64_t a1)
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
    v4 = 134217984;
    v5 = v3;
    _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "PKPaymentRemoteAlertViewController (%p): backup presentation failed", (uint8_t *)&v4, 0xCu);
  }

}

uint64_t __90__PKPaymentRemoteAlertViewController__presentPassAnimated_externalizedContext_completion___block_invoke_77(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_setupCoverSheetIfNeeded
{
  PKAuthenticator *v3;
  PKAuthenticator *coverSheetAuthenticator;
  PKAuthorizationCoverSheetViewController *v5;
  PKAuthorizationCoverSheetViewController *coverSheetViewController;
  NSObject *v7;
  PKAuthorizationCoverSheetViewController *v8;
  int v9;
  PKPaymentRemoteAlertViewController *v10;
  __int16 v11;
  PKAuthorizationCoverSheetViewController *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!self->_invalidationStatus && !self->_coverSheetViewController)
  {
    if (!self->_coverSheetAuthenticator)
    {
      v3 = (PKAuthenticator *)objc_msgSend(objc_alloc(MEMORY[0x1E0D6BFD8]), "initWithDelegate:", 0);
      coverSheetAuthenticator = self->_coverSheetAuthenticator;
      self->_coverSheetAuthenticator = v3;

    }
    v5 = -[PKAuthorizationCoverSheetViewController initWithDelegate:authenticator:source:]([PKAuthorizationCoverSheetViewController alloc], "initWithDelegate:authenticator:source:", self, self->_coverSheetAuthenticator, self->_presentationSource);
    coverSheetViewController = self->_coverSheetViewController;
    self->_coverSheetViewController = v5;

    -[PKAuthorizationCoverSheetViewController setIsErrorRecovery:](self->_coverSheetViewController, "setIsErrorRecovery:", self->_presentationSource == 6);
    PKLogFacilityTypeGetObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = self->_coverSheetViewController;
      v9 = 134349312;
      v10 = self;
      v11 = 2050;
      v12 = v8;
      _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "PKPaymentRemoteAlertViewController (%{public}p): created PKAuthorizationCoverSheetViewController %{public}p.", (uint8_t *)&v9, 0x16u);
    }

  }
}

- (void)authorizationCoverSheetViewControllerDidCompleteWithSuccess:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const __CFString *v6;
  _BOOL4 v7;
  PKPaymentRemoteAlertViewController *v8;
  uint64_t v9;
  int v10;
  PKPaymentRemoteAlertViewController *v11;
  __int16 v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!self->_invalidationStatus)
  {
    v3 = a3;
    PKLogFacilityTypeGetObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = CFSTR("N");
      if (v3)
        v6 = CFSTR("Y");
      v10 = 134349314;
      v11 = self;
      v12 = 2112;
      v13 = v6;
      _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "PKPaymentRemoteAlertViewController (%{public}p): Cover Sheet did complete with success: %@", (uint8_t *)&v10, 0x16u);
    }

    if (!v3)
    {
      v8 = self;
      v9 = 5;
      goto LABEL_10;
    }
    v7 = -[PKPaymentRemoteAlertViewController _releaseUIBlockIfNeededTimeout:](self, "_releaseUIBlockIfNeededTimeout:", 0);
    if (self->_presentationSource == 6)
    {
      v8 = self;
      v9 = 6;
LABEL_10:
      -[PKPaymentRemoteAlertViewController _dismissForSource:completion:](v8, "_dismissForSource:completion:", v9, 0);
      return;
    }
    -[PKPaymentRemoteAlertViewController _transitionToViewStateScreen:animated:](self, "_transitionToViewStateScreen:animated:", 2, !v7);
  }
}

- (void)authorizationCoverSheetViewControllerDidGetBiometricUnavailableOrFailure
{
  if (!self->_invalidationStatus)
    -[PKPaymentRemoteAlertViewController _releaseUIBlockIfNeededTimeout:](self, "_releaseUIBlockIfNeededTimeout:", 0);
}

- (BOOL)_releaseUIBlockIfNeededTimeout:(BOOL)a3
{
  _BOOL4 isBlockingUIForUserAuthorization;
  NSObject *v5;
  id blockingUIForUserAuthorizationCompletion;
  int v8;
  PKPaymentRemoteAlertViewController *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  isBlockingUIForUserAuthorization = self->_isBlockingUIForUserAuthorization;
  if (self->_isBlockingUIForUserAuthorization)
  {
    if (a3)
    {
      PKLogFacilityTypeGetObject();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v8 = 134217984;
        v9 = self;
        _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "PKPaymentRemoteAlertViewController (%p): Timed out blocking UI", (uint8_t *)&v8, 0xCu);
      }

    }
    self->_isBlockingUIForUserAuthorization = 0;
    (*((void (**)(void))self->_blockingUIForUserAuthorizationCompletion + 2))();
    blockingUIForUserAuthorizationCompletion = self->_blockingUIForUserAuthorizationCompletion;
    self->_blockingUIForUserAuthorizationCompletion = 0;

  }
  return isBlockingUIForUserAuthorization;
}

- (void)_acquireStaticResources
{
  void *v3;
  id staticGlyphResources;
  void *v5;
  BSInvalidatable *v6;
  BSInvalidatable *lockButtonObserver;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  id v17;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint8_t buf[4];
  PKPaymentRemoteAlertViewController *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (!self->_invalidationStatus && !self->_hasAquiredStaticResources)
  {
    self->_hasAquiredStaticResources = 1;
    if ((objc_msgSend(MEMORY[0x1E0D67630], "isInFailForward") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0D6BFF0], "sharedStaticResources");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      staticGlyphResources = self->_staticGlyphResources;
      self->_staticGlyphResources = v3;

      if (PKUserIntentIsAvailable())
      {
        objc_msgSend(MEMORY[0x1E0DAAE70], "sharedInstance");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "beginConsumingPressesForButtonKind:eventConsumer:priority:", 2, self, 0);
        v6 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
        lockButtonObserver = self->_lockButtonObserver;
        self->_lockButtonObserver = v6;

        v19 = 0;
        v20 = &v19;
        v21 = 0x2020000000;
        v22 = 0;
        objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = MEMORY[0x1E0C809B0];
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __61__PKPaymentRemoteAlertViewController__acquireStaticResources__block_invoke;
        v18[3] = &unk_1E3E62060;
        v18[4] = &v19;
        v10 = objc_msgSend(v8, "beginBackgroundTaskWithName:expirationHandler:", CFSTR("PKPaymentRemoteAlertViewController"), v18);

        v20[3] = v10;
        PKLogFacilityTypeGetObject();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134349056;
          v24 = self;
          _os_log_impl(&dword_19D178000, v11, OS_LOG_TYPE_DEFAULT, "PKPaymentRemoteAlertViewController (%{public}p): Acquiring pre-arm assertion...", buf, 0xCu);
        }

        objc_initWeak((id *)buf, self);
        v14[0] = v9;
        v14[1] = 3221225472;
        v14[2] = __61__PKPaymentRemoteAlertViewController__acquireStaticResources__block_invoke_85;
        v14[3] = &unk_1E3E74C78;
        v12 = objc_alloc_init(MEMORY[0x1E0DAADF8]);
        v15 = v12;
        objc_copyWeak(&v17, (id *)buf);
        v13 = *MEMORY[0x1E0D6AB70];
        v16 = &v19;
        objc_msgSend(v12, "acquireWalletPreArmSuppressionAssertionForReason:completion:", v13, v14);
        objc_destroyWeak(&v17);

        objc_destroyWeak((id *)buf);
        _Block_object_dispose(&v19, 8);
      }
    }
  }
}

void __61__PKPaymentRemoteAlertViewController__acquireStaticResources__block_invoke(uint64_t a1)
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

void __61__PKPaymentRemoteAlertViewController__acquireStaticResources__block_invoke_85(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD block[4];
  id v7;
  uint64_t v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__PKPaymentRemoteAlertViewController__acquireStaticResources__block_invoke_2;
  block[3] = &unk_1E3E701D8;
  objc_copyWeak(&v9, (id *)(a1 + 48));
  v4 = *(_QWORD *)(a1 + 40);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v9);
}

void __61__PKPaymentRemoteAlertViewController__acquireStaticResources__block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  id *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  id *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (!WeakRetained)
  {
    PKLogFacilityTypeGetObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(id **)(a1 + 32);
      v15 = 134349056;
      v16 = v11;
      v8 = "PKPaymentRemoteAlertViewController: Ignoring pre-arm assertion %{public}p.";
      v9 = v5;
      v10 = 12;
      goto LABEL_7;
    }
LABEL_8:

    objc_msgSend(*(id *)(a1 + 32), "invalidate");
    goto LABEL_12;
  }
  v4 = WeakRetained[145];
  PKLogFacilityTypeGetObject();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      v7 = *(_QWORD *)(a1 + 32);
      v15 = 134349312;
      v16 = v3;
      v17 = 2050;
      v18 = v7;
      v8 = "PKPaymentRemoteAlertViewController (%{public}p): Ignoring pre-arm assertion %{public}p.";
      v9 = v5;
      v10 = 22;
LABEL_7:
      _os_log_impl(&dword_19D178000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v15, v10);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if (v6)
  {
    v12 = *(_QWORD *)(a1 + 32);
    v15 = 134349312;
    v16 = v3;
    v17 = 2050;
    v18 = v12;
    _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "PKPaymentRemoteAlertViewController (%{public}p): Acquired pre-arm assertion %{public}p.", (uint8_t *)&v15, 0x16u);
  }

  objc_storeStrong(v3 + 132, *(id *)(a1 + 32));
LABEL_12:
  v13 = *MEMORY[0x1E0DC4878];
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) != *MEMORY[0x1E0DC4878])
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "endBackgroundTask:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v13;
  }

}

- (void)_presentHomeButtonDoubleTapAlertIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  _QWORD v16[5];

  if (!self->_invalidationStatus
    && !self->_presentationSource
    && PKHomeButtonIsAvailable()
    && (PKContactlessInterfaceHomeButtonSourceHasOccurred() & 1) == 0)
  {
    v3 = (void *)MEMORY[0x1E0DC3450];
    PKLocalizedPaymentString(CFSTR("CONTACTLESS_INTERFACE_FIRST_HOME_BUTTON_DOUBLE_TAP_TITLE"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPaymentString(CFSTR("CONTACTLESS_INTERFACE_FIRST_HOME_BUTTON_DOUBLE_TAP_MESSAGE"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v4, v5, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)MEMORY[0x1E0DC3448];
    PKLocalizedPaymentString(CFSTR("CONTACTLESS_INTERFACE_FIRST_HOME_BUTTON_DOUBLE_TAP_SETTINGS_BUTTON"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __81__PKPaymentRemoteAlertViewController__presentHomeButtonDoubleTapAlertIfNecessary__block_invoke;
    v16[3] = &unk_1E3E61D68;
    v16[4] = self;
    objc_msgSend(v7, "actionWithTitle:style:handler:", v8, 0, v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x1E0DC3448];
    PKLocalizedPaymentString(CFSTR("CONTACTLESS_INTERFACE_FIRST_HOME_BUTTON_DOUBLE_TAP_DISMISS_BUTTON"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v9;
    v15[1] = 3221225472;
    v15[2] = __81__PKPaymentRemoteAlertViewController__presentHomeButtonDoubleTapAlertIfNecessary__block_invoke_3;
    v15[3] = &unk_1E3E61D68;
    v15[4] = self;
    objc_msgSend(v11, "actionWithTitle:style:handler:", v12, 1, v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "addAction:", v10);
    objc_msgSend(v6, "addAction:", v13);
    -[UIViewController pkui_frontMostViewController](self, "pkui_frontMostViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "presentViewController:animated:completion:", v6, 1, 0);

  }
}

void __81__PKPaymentRemoteAlertViewController__presentHomeButtonDoubleTapAlertIfNecessary__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=PASSBOOK"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0D22D88];
  v11[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
  v4 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __81__PKPaymentRemoteAlertViewController__presentHomeButtonDoubleTapAlertIfNecessary__block_invoke_2;
  v7[3] = &unk_1E3E61388;
  v8 = v2;
  v9 = v3;
  v5 = v3;
  v6 = v2;
  objc_msgSend(v4, "_dismissForSource:completion:", 3, v7);

}

void __81__PKPaymentRemoteAlertViewController__presentHomeButtonDoubleTapAlertIfNecessary__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "openSensitiveURL:withOptions:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

uint64_t __81__PKPaymentRemoteAlertViewController__presentHomeButtonDoubleTapAlertIfNecessary__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_dismissIfRestricted
{
  void *v3;
  void *v4;
  int v5;
  NSObject *v6;
  uint8_t v7[16];

  -[PKPaymentRemoteAlertViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
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

      -[PKPaymentRemoteAlertViewController _dismissForSource:completion:](self, "_dismissForSource:completion:", 2, 0);
    }
  }
}

- (void)_dismissForSource:(unint64_t)a3 completion:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void (**v11)(_QWORD);
  PKPassGroupsViewController *v12;
  PKPassGroupsViewController *i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  PKPassGroupsViewController *v25;
  PKAuthorizationCoverSheetViewController *v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  PKAuthorizationCoverSheetViewController *coverSheetViewController;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  void *v38;
  id *v39;
  _QWORD v41[4];
  PKPassGroupsViewController *v42;
  void (**v43)(_QWORD);
  BOOL v44;
  _QWORD v45[4];
  PKPassGroupsViewController *v46;
  _QWORD v47[4];
  PKPassGroupsViewController *v48;
  _QWORD v49[4];
  id v50;
  __int128 *v51;
  _QWORD v52[4];
  id v53;
  id v54;
  _BYTE *v55;
  _QWORD aBlock[4];
  id v57;
  _QWORD *v58;
  id v59;
  id location;
  _QWORD v61[3];
  char v62;
  _QWORD v63[5];
  const __CFString *v64;
  void *v65;
  __int128 v66;
  uint64_t v67;
  uint64_t v68;
  _BYTE buf[24];
  uint64_t v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  PKLogFacilityTypeGetObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134349312;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = a3;
    _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "PKPaymentRemoteAlertViewController (%{public}p): dismiss requested for %lu.", buf, 0x16u);
  }

  -[PKPaymentRemoteAlertViewController _invalidateForType:](self, "_invalidateForType:", 1);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v70 = *MEMORY[0x1E0DC4878];
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v63[0] = MEMORY[0x1E0C809B0];
  v63[1] = 3221225472;
  v63[2] = __67__PKPaymentRemoteAlertViewController__dismissForSource_completion___block_invoke;
  v63[3] = &unk_1E3E62060;
  v63[4] = buf;
  v9 = objc_msgSend(v7, "beginBackgroundTaskWithExpirationHandler:", v63);
  *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v9;

  -[PKPaymentRemoteAlertViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v61[0] = 0;
  v61[1] = v61;
  v61[2] = 0x2020000000;
  v62 = 0;
  objc_initWeak(&location, self);
  aBlock[0] = v8;
  aBlock[1] = 3221225472;
  aBlock[2] = __67__PKPaymentRemoteAlertViewController__dismissForSource_completion___block_invoke_2;
  aBlock[3] = &unk_1E3E74CA0;
  v58 = v61;
  v39 = &v59;
  objc_copyWeak(&v59, &location);
  v37 = v10;
  v57 = v37;
  v52[0] = v8;
  v52[1] = 3221225472;
  v52[2] = __67__PKPaymentRemoteAlertViewController__dismissForSource_completion___block_invoke_3;
  v52[3] = &unk_1E3E74CC8;
  v38 = _Block_copy(aBlock);
  v53 = v38;
  v55 = buf;
  v35 = v5;
  v54 = v35;
  v11 = (void (**)(_QWORD))_Block_copy(v52);
  if (self->_state.appeared)
  {
    -[PKPaymentRemoteAlertViewController _activeViewController](self, "_activeViewController", v35, v37, v38, &v59);
    v12 = (PKPassGroupsViewController *)objc_claimAutoreleasedReturnValue();
    for (i = 0; ; v12 = i)
    {
      -[PKPassGroupsViewController presentedViewController](v12, "presentedViewController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
        break;
      i = v14;

    }
    -[PKPaymentRemoteAlertViewController view](self, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "backgroundColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&v66 = 0;
    *((_QWORD *)&v66 + 1) = &v66;
    v67 = 0x2020000000;
    v68 = 0;
    objc_msgSend(v15, "traitCollection");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = v8;
    v49[1] = 3221225472;
    v49[2] = __67__PKPaymentRemoteAlertViewController__dismissForSource_completion___block_invoke_4;
    v49[3] = &unk_1E3E66238;
    v51 = &v66;
    v19 = v16;
    v50 = v19;
    PKUIPerformWithEffectiveTraitCollection(v18, v49);

    objc_msgSend(MEMORY[0x1E0D676D0], "springAnimationWithKeyPath:", CFSTR("backgroundColor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setAdditive:", 0);
    objc_msgSend(v20, "setFromValue:", *(_QWORD *)(*((_QWORD *)&v66 + 1) + 24));
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v20, "setToValue:", objc_msgSend(v21, "CGColor"));

    v22 = (id)objc_msgSend(v17, "pkui_addAdditiveAnimation:", v20);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setBackgroundColor:", v23);

    CGColorRelease(*(CGColorRef *)(*((_QWORD *)&v66 + 1) + 24));
    _Block_object_dispose(&v66, 8);

    -[PKPassGroupsViewController groupStackView](self->_passGroupsViewController, "groupStackView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setStaggerPileAnimations:", 0);

    if (a3 == 4 || v12 != self->_passGroupsViewController)
    {
      -[PKPaymentRemoteAlertViewController _activeViewController](self, "_activeViewController");
      v26 = (PKAuthorizationCoverSheetViewController *)objc_claimAutoreleasedReturnValue();
      v27 = v26 == self->_coverSheetViewController;

      if (v27)
      {
        coverSheetViewController = self->_coverSheetViewController;
        if (v12 == (PKPassGroupsViewController *)coverSheetViewController)
        {
          -[PKPassGroupsViewController fadeOutUIWithCompletion:](v12, "fadeOutUIWithCompletion:", v11);
          goto LABEL_23;
        }
        -[PKAuthorizationCoverSheetViewController fadeOutUIWithCompletion:](coverSheetViewController, "fadeOutUIWithCompletion:", 0);
        -[PKPassGroupsViewController view](v12, "view");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "layer");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v45[0] = v8;
        v45[1] = 3221225472;
        v45[2] = __67__PKPaymentRemoteAlertViewController__dismissForSource_completion___block_invoke_6;
        v45[3] = &unk_1E3E614F0;
        v46 = v11;
        objc_msgSend(v32, "pkui_animateToOpacity:withCompletion:", v45, 0.0);

        v25 = v46;
      }
      else
      {
        v25 = self->_passGroupsViewController;
        -[PKPassGroupsViewController view](v12, "view");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12 != v25)
        {
          -[PKPassGroupsViewController presentOffscreenAnimated:split:withCompletionHandler:](v25, "presentOffscreenAnimated:split:withCompletionHandler:", 0, 1, 0);
          -[PKPassGroupsViewController dismissViewControllerAnimated:completion:](v25, "dismissViewControllerAnimated:completion:", 1, 0);
        }
        objc_msgSend(v28, "layer");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (v29)
        {
          v41[0] = v8;
          v41[1] = 3221225472;
          v41[2] = __67__PKPaymentRemoteAlertViewController__dismissForSource_completion___block_invoke_7;
          v41[3] = &unk_1E3E653B0;
          v44 = v12 != v25;
          v42 = v25;
          v43 = v11;
          objc_msgSend(v29, "pkui_animateToOpacity:withCompletion:", v41, 0.0);

        }
        else
        {
          v11[2](v11);
        }

      }
    }
    else
    {
      v47[0] = v8;
      v47[1] = 3221225472;
      v47[2] = __67__PKPaymentRemoteAlertViewController__dismissForSource_completion___block_invoke_5;
      v47[3] = &unk_1E3E614F0;
      v48 = v11;
      -[PKPassGroupsViewController presentOffscreenAnimated:split:withCompletionHandler:](v12, "presentOffscreenAnimated:split:withCompletionHandler:", 1, 1, v47);
      v25 = v48;
    }

LABEL_23:
    goto LABEL_24;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v66) = 134349056;
    *(_QWORD *)((char *)&v66 + 4) = self;
    _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "PKPaymentRemoteAlertViewController (%{public}p): Skipping dismiss animation because UI is not shown", (uint8_t *)&v66, 0xCu);
  }

  v11[2](v11);
LABEL_24:
  v64 = CFSTR("source");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3, v35);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = v33;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v65, &v64, 1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1A1AE3A74](*MEMORY[0x1E0D683C8], v34);

  objc_destroyWeak(v39);
  objc_destroyWeak(&location);
  _Block_object_dispose(v61, 8);

  _Block_object_dispose(buf, 8);
}

void __67__PKPaymentRemoteAlertViewController__dismissForSource_completion___block_invoke(uint64_t a1)
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

uint64_t __67__PKPaymentRemoteAlertViewController__dismissForSource_completion___block_invoke_2(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  id WeakRetained;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 40) + 8);
  if (!*(_BYTE *)(v1 + 24))
  {
    v2 = result;
    *(_BYTE *)(v1 + 24) = 1;
    WeakRetained = objc_loadWeakRetained((id *)(result + 48));
    objc_msgSend(WeakRetained, "_invalidate");

    return objc_msgSend(*(id *)(v2 + 32), "invalidate");
  }
  return result;
}

uint64_t __67__PKPaymentRemoteAlertViewController__dismissForSource_completion___block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t result;

  (*(void (**)(void))(a1[4] + 16))();
  v2 = *MEMORY[0x1E0DC4878];
  if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) != *MEMORY[0x1E0DC4878])
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "endBackgroundTask:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24));

    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = v2;
  }
  result = a1[5];
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

CGColorRef __67__PKPaymentRemoteAlertViewController__dismissForSource_completion___block_invoke_4(uint64_t a1)
{
  CGColorRef result;

  result = CGColorRetain((CGColorRef)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "CGColor"));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __67__PKPaymentRemoteAlertViewController__dismissForSource_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __67__PKPaymentRemoteAlertViewController__dismissForSource_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __67__PKPaymentRemoteAlertViewController__dismissForSource_completion___block_invoke_7(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 48))
    objc_msgSend(*(id *)(a1 + 32), "presentOffscreenAnimated:split:withCompletionHandler:", 0, 1, 0);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (BOOL)_notificationIsFromChildViewController:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  PKPaymentRemoteAlertViewController *v7;
  PKPaymentRemoteAlertViewController *v8;
  uint64_t i;
  char v10;
  PKPaymentRemoteAlertViewController *v11;
  BOOL v12;
  BOOL v13;

  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  objc_msgSend(v4, "object");
  v7 = (PKPaymentRemoteAlertViewController *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((isKindOfClass & 1) != 0)
  {
    -[PKPaymentRemoteAlertViewController pkui_viewControllerFromResponderChain](v7, "pkui_viewControllerFromResponderChain");
    for (i = objc_claimAutoreleasedReturnValue(); ; i = objc_claimAutoreleasedReturnValue())
    {
      v11 = (PKPaymentRemoteAlertViewController *)i;

LABEL_7:
      v12 = v11 != 0;
      if (!v11 || v11 == self)
        break;
      v8 = v11;
      -[PKPaymentRemoteAlertViewController parentViewController](v11, "parentViewController");
    }
  }
  else
  {
    objc_opt_class();
    v10 = objc_opt_isKindOfClass();

    if ((v10 & 1) != 0)
    {
      objc_msgSend(v4, "object");
      v11 = (PKPaymentRemoteAlertViewController *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    v11 = 0;
    v12 = 0;
  }
  v13 = v11 == self && v12;

  return v13;
}

- (id)_activeViewController
{
  void *coverSheetViewController;

  coverSheetViewController = self->_coverSheetViewController;
  if (!coverSheetViewController)
    coverSheetViewController = self->_passGroupsViewController;
  return coverSheetViewController;
}

- (void)_insertViewControllerIfNeeded:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[PKPaymentRemoteAlertViewController viewIfLoaded](self, "viewIfLoaded");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v7, "parentViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      objc_msgSend(v7, "view");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentRemoteAlertViewController addChildViewController:](self, "addChildViewController:", v7);
      objc_msgSend(v4, "addSubview:", v6);
      objc_msgSend(v7, "didMoveToParentViewController:", self);
      -[PKPaymentRemoteAlertViewController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
      -[PKPaymentRemoteAlertViewController setNeedsUpdateOfSupportedInterfaceOrientations](self, "setNeedsUpdateOfSupportedInterfaceOrientations");
      objc_msgSend(v4, "setNeedsLayout");
      objc_msgSend(v4, "layoutIfNeeded");

    }
  }

}

- (void)_removeViewController:(id)a3
{
  void *v4;
  id v5;

  if (a3)
  {
    v5 = a3;
    -[PKPaymentRemoteAlertViewController removeChildViewController:](self, "removeChildViewController:", v5);
    objc_msgSend(v5, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromSuperview");

    objc_msgSend(v5, "didMoveToParentViewController:", 0);
  }
}

- (void)_animateViewBackgroundColorIn:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  CGColorRef (*v12)(uint64_t);
  void *v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v3 = a3;
  objc_msgSend(v3, "backgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  objc_msgSend(v3, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __68__PKPaymentRemoteAlertViewController__animateViewBackgroundColorIn___block_invoke;
  v13 = &unk_1E3E66238;
  v15 = &v16;
  v7 = v4;
  v14 = v7;
  PKUIPerformWithEffectiveTraitCollection(v6, &v10);

  objc_msgSend(v3, "setHidden:", 0, v10, v11, v12, v13);
  objc_msgSend(MEMORY[0x1E0D676D0], "springAnimationWithKeyPath:", CFSTR("backgroundColor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAdditive:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v8, "setFromValue:", objc_msgSend(v9, "CGColor"));

  objc_msgSend(v8, "setToValue:", v17[3]);
  objc_msgSend(v5, "addAnimation:forKey:", v8, CFSTR("backgroundColor"));
  CGColorRelease((CGColorRef)v17[3]);

  _Block_object_dispose(&v16, 8);
}

CGColorRef __68__PKPaymentRemoteAlertViewController__animateViewBackgroundColorIn___block_invoke(uint64_t a1)
{
  CGColorRef result;

  result = CGColorRetain((CGColorRef)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "CGColor"));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)_startBackgroundContactlessInterfaceSessionIfNeeded
{
  PKBackgroundContactlessInterfaceSessionController *v3;
  PKFieldProperties *fieldProperties;
  void *v5;
  PKBackgroundContactlessInterfaceSessionController *v6;
  PKBackgroundContactlessInterfaceSessionController *backgroundContactlessInterfaceSession;
  NSObject *v8;
  uint8_t v9[16];
  _QWORD v10[4];
  id v11;
  id location;

  if (self->_showCoverSheet)
  {
    objc_initWeak(&location, self);
    v3 = [PKBackgroundContactlessInterfaceSessionController alloc];
    fieldProperties = self->_fieldProperties;
    -[NSArray firstObject](self->_fieldPassUniqueIdentifiers, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __89__PKPaymentRemoteAlertViewController__startBackgroundContactlessInterfaceSessionIfNeeded__block_invoke;
    v10[3] = &unk_1E3E61310;
    objc_copyWeak(&v11, &location);
    v6 = -[PKBackgroundContactlessInterfaceSessionController initWithFieldProperties:forPassUniqueID:relinquishOwnership:](v3, "initWithFieldProperties:forPassUniqueID:relinquishOwnership:", fieldProperties, v5, v10);
    backgroundContactlessInterfaceSession = self->_backgroundContactlessInterfaceSession;
    self->_backgroundContactlessInterfaceSession = v6;

    if (self->_backgroundContactlessInterfaceSession)
    {
      PKLogFacilityTypeGetObject();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "PKPaymentRemoteAlertViewController: Starting background contactless interface session", v9, 2u);
      }

      -[PKBackgroundContactlessInterfaceSessionController start](self->_backgroundContactlessInterfaceSession, "start");
    }
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

void __89__PKPaymentRemoteAlertViewController__startBackgroundContactlessInterfaceSessionIfNeeded__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  uint8_t v6[16];

  PKLogFacilityTypeGetObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "PKPaymentRemoteAlertViewController: Relinquishing background contactless interface session", v6, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = (void *)*((_QWORD *)WeakRetained + 140);
    *((_QWORD *)WeakRetained + 140) = 0;

  }
}

- (void)consumeDoublePressUpForButtonKind:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0D66A58];
  v5 = *MEMORY[0x1E0D698E8];
  v6 = *MEMORY[0x1E0D68858];
  v10[0] = *MEMORY[0x1E0D68AA0];
  v10[1] = v6;
  v7 = *MEMORY[0x1E0D68828];
  v11[0] = *MEMORY[0x1E0D68B18];
  v11[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subject:sendEvent:", v5, v8);

  -[PKPassGroupsViewController presentedViewController](self->_passGroupsViewController, "presentedViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {

  }
  else if (!-[PKPassGroupsViewController presentingPass](self->_passGroupsViewController, "presentingPass"))
  {
    -[PKPassGroupsViewController presentDefaultPaymentPassInPaymentPresentationFromButton:withAnimated:completionHandler:](self->_passGroupsViewController, "presentDefaultPaymentPassInPaymentPresentationFromButton:withAnimated:completionHandler:", 1, 1, 0);
  }
}

- (void)_paymentDidReceiveSuccessfulTransactionNotification:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[PKPaymentRemoteAlertViewController _notificationIsFromChildViewController:](self, "_notificationIsFromChildViewController:", v4))
  {
    v5 = (void *)MEMORY[0x1E0D66A58];
    v6 = *MEMORY[0x1E0D698E8];
    v12 = *MEMORY[0x1E0D68E78];
    v13[0] = *MEMORY[0x1E0D68EB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "subject:sendEvent:", v6, v7);

    -[PKPassGroupsViewController groupStackView](self->_passGroupsViewController, "groupStackView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "object");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isViewCurrentlyPresentedFooterView:", v9))
    {
      objc_msgSend(v4, "userInfo");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "PKBoolForKey:", *MEMORY[0x1E0D6AD08]);

      if ((v11 & 1) == 0)
        -[PKPaymentRemoteAlertViewController _dismissForSource:completion:](self, "_dismissForSource:completion:", 0, 0);
    }

  }
}

- (void)_contactlessInterfaceSessionDidAuthorize:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  _DWORD v9[2];
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (-[PKPaymentRemoteAlertViewController _notificationIsFromChildViewController:](self, "_notificationIsFromChildViewController:", a3))
  {
    v4 = (void *)MEMORY[0x1E0D66A58];
    v5 = *MEMORY[0x1E0D698E8];
    v10 = *MEMORY[0x1E0D68E78];
    v11[0] = *MEMORY[0x1E0D68EA0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "subject:sendEvent:", v5, v6);

    if (self->_isLockScreenPresented)
    {
      PKLogFacilityTypeGetObject();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v9[0] = 67109120;
        v9[1] = 60;
        _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "Card Authorized. Setting Auto-Lock Duration to %d seconds.", (uint8_t *)v9, 8u);
      }

      -[PKPaymentRemoteAlertViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setDesiredAutoLockDuration:", 60.0);

    }
  }
}

- (void)_contactlessInterfaceSessionFinishTransaction:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  unint64_t presentationSource;
  const __CFString *v10;
  double v11;
  double v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint8_t buf[4];
  const __CFString *v20;
  __int16 v21;
  double v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  if (-[PKPaymentRemoteAlertViewController _notificationIsFromChildViewController:](self, "_notificationIsFromChildViewController:", a3))
  {
    v4 = (void *)MEMORY[0x1E0D66A58];
    v5 = *MEMORY[0x1E0D698E8];
    v23 = *MEMORY[0x1E0D68E78];
    v24[0] = *MEMORY[0x1E0D68EA8];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "subject:sendEvent:", v5, v6);

    v7 = objc_alloc(MEMORY[0x1E0D67708]);
    v8 = (void *)objc_msgSend(v7, "initWithIdentifier:bundleIdentifier:context:", *MEMORY[0x1E0D6BA08], *MEMORY[0x1E0D6B590], *MEMORY[0x1E0D6BA00]);
    objc_msgSend(v8, "donateSignalWithCompletion:", &__block_literal_global_176);
    if (self->_presentationStartTime)
    {
      presentationSource = self->_presentationSource;
      if (presentationSource > 6)
        v10 = CFSTR("unknown");
      else
        v10 = off_1E3E74D40[presentationSource];
      mach_absolute_time();
      PKSecondsFromMachTimeInterval();
      v12 = v11;
      PKLogFacilityTypeGetObject();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v20 = v10;
        v21 = 2048;
        v22 = v12;
        _os_log_impl(&dword_19D178000, v13, OS_LOG_TYPE_DEFAULT, "Contactless Interface Transaction Completed - Source: %@, Time: %g seconds", buf, 0x16u);
      }

      v14 = *MEMORY[0x1E0D683D0];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12, CFSTR("duration"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      MEMORY[0x1A1AE3A74](v14, v16);

    }
  }
}

void __84__PKPaymentRemoteAlertViewController__contactlessInterfaceSessionFinishTransaction___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  _BOOL4 v4;
  const char *v5;
  NSObject *v6;
  uint32_t v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      v8 = 138412290;
      v9 = v2;
      v5 = "TPSDiscoverabilitySignal - Failed to donate discoverability signal - contactless transaction: %@";
      v6 = v3;
      v7 = 12;
LABEL_6:
      _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v8, v7);
    }
  }
  else if (v4)
  {
    LOWORD(v8) = 0;
    v5 = "TPSDiscoverabilitySignal - Successfully donated discoverability signal - contactless transaction";
    v6 = v3;
    v7 = 2;
    goto LABEL_6;
  }

}

- (void)openApplication:(id)a3
{
  id v4;
  PKPaymentRemoteAlertViewController *v5;
  PKPaymentRemoteAlertViewController *v6;
  PKPaymentRemoteAlertViewController *v7;
  PKPaymentRemoteAlertViewController *v8;
  void *v9;
  PKPaymentRemoteAlertViewController *v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (PKPaymentRemoteAlertViewController *)objc_claimAutoreleasedReturnValue();
  v6 = self;
  if (v6)
  {
    v7 = v6;
    v8 = v6;
    while (1)
    {
      -[PKPaymentRemoteAlertViewController viewIfLoaded](v8, "viewIfLoaded");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "window");
      v10 = (PKPaymentRemoteAlertViewController *)objc_claimAutoreleasedReturnValue();

      if (v10)
        break;
      -[PKPaymentRemoteAlertViewController presentedViewController](v7, "presentedViewController");
      v10 = (PKPaymentRemoteAlertViewController *)objc_claimAutoreleasedReturnValue();

      if (v8 == v10)
      {

        goto LABEL_10;
      }
      v8 = v10;
      if (!v10)
        goto LABEL_11;
    }
    if (v10 == v5)
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __54__PKPaymentRemoteAlertViewController_openApplication___block_invoke;
      v11[3] = &unk_1E3E612E8;
      v12 = v4;
      -[PKPaymentRemoteAlertViewController _dismissForSource:completion:](v7, "_dismissForSource:completion:", 4, v11);

      v10 = v5;
    }
  }
  else
  {
LABEL_10:
    v8 = 0;
    v10 = 0;
  }
LABEL_11:

}

uint64_t __54__PKPaymentRemoteAlertViewController_openApplication___block_invoke(uint64_t a1)
{
  return PKOpenApplication(*(NSNotification **)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_blockingUIForUserAuthorizationCompletion, 0);
  objc_storeStrong((id *)&self->_backgroundContactlessInterfaceSession, 0);
  objc_storeStrong((id *)&self->_coverSheetAuthenticator, 0);
  objc_storeStrong((id *)&self->_fieldPropertiesLookupGroup, 0);
  objc_storeStrong((id *)&self->_notificationSuppressionAssertion, 0);
  objc_storeStrong((id *)&self->_lockButtonAssertion, 0);
  objc_storeStrong((id *)&self->_lockButtonObserver, 0);
  objc_storeStrong((id *)&self->_passbookForegroundAssertion, 0);
  objc_storeStrong((id *)&self->_passUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_fieldPassUniqueIdentifiers, 0);
  objc_storeStrong((id *)&self->_fieldProperties, 0);
  objc_storeStrong((id *)&self->_paymentService, 0);
  objc_storeStrong(&self->_staticGlyphResources, 0);
  objc_storeStrong((id *)&self->_coverSheetViewController, 0);
  objc_storeStrong((id *)&self->_passGroupsViewController, 0);
}

@end
