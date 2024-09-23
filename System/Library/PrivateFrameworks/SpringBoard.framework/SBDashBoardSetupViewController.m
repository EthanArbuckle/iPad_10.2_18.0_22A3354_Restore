@implementation SBDashBoardSetupViewController

- (SBDashBoardSetupViewController)initWithCoverSheetViewController:(id)a3
{
  id v4;
  void *v5;
  SBDashBoardSetupViewController *v6;

  v4 = a3;
  +[SBTelephonyManager sharedTelephonyManager](SBTelephonyManager, "sharedTelephonyManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SBDashBoardSetupViewController initWithCoverSheetViewController:telephonyManager:](self, "initWithCoverSheetViewController:telephonyManager:", v4, v5);

  return v6;
}

- (SBDashBoardSetupViewController)initWithCoverSheetViewController:(id)a3 telephonyManager:(id)a4
{
  id v6;
  id v7;
  SBDashBoardSetupViewController *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *queue;
  uint64_t v12;
  SBSetupManager *setupManager;
  void *v14;
  NSDictionary *v15;
  NSDictionary *storeRestrictedStrings;
  NSDictionary *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  UITapGestureRecognizer *pointerClickGestureRecognizer;
  uint64_t v22;
  UIHoverGestureRecognizer *hoverGestureRecognizer;
  void *v24;
  void *v25;
  id v27;
  objc_super v28;

  v6 = a3;
  v7 = a4;
  v28.receiver = self;
  v28.super_class = (Class)SBDashBoardSetupViewController;
  v8 = -[SBDashBoardSetupViewController init](&v28, sel_init);
  if (v8)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("com.apple.springboard.fetchappleaccount", v9);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v10;

    +[SBSetupManager sharedInstance](SBSetupManager, "sharedInstance");
    v12 = objc_claimAutoreleasedReturnValue();
    setupManager = v8->_setupManager;
    v8->_setupManager = (SBSetupManager *)v12;

    objc_storeWeak((id *)&v8->_coverSheetViewController, v6);
    objc_storeStrong((id *)&v8->_telephonyManager, a4);
    -[SBDashBoardSetupViewController _updateStringOrderingForLanguageChange](v8, "_updateStringOrderingForLanguageChange");
    v8->_customDelayDuration = 1.5;
    objc_msgSend(MEMORY[0x1E0D4F8F8], "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    LOBYTE(v9) = objc_msgSend(v14, "needOwnershipWarning:", &v27);
    v15 = (NSDictionary *)v27;
    v8->_isStoreRestricted = (char)v9;

    storeRestrictedStrings = v8->_storeRestrictedStrings;
    v8->_storeRestrictedStrings = v15;
    v17 = v15;

    -[SBDashBoardSetupViewController _checkIfActivationLocked](v8, "_checkIfActivationLocked");
    -[SBDashBoardSetupViewController setupView](v8, "setupView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "homeAffordanceView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "setSystemPointerInteractionEnabled:", 1);
    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", v8, sel__didClickHomeAffordance_);
    pointerClickGestureRecognizer = v8->_pointerClickGestureRecognizer;
    v8->_pointerClickGestureRecognizer = (UITapGestureRecognizer *)v20;

    -[UITapGestureRecognizer setDelegate:](v8->_pointerClickGestureRecognizer, "setDelegate:", v8);
    objc_msgSend(v19, "addGestureRecognizer:", v8->_pointerClickGestureRecognizer);
    v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA628]), "initWithTarget:action:", v8, sel__handleHoverEvent_);
    hoverGestureRecognizer = v8->_hoverGestureRecognizer;
    v8->_hoverGestureRecognizer = (UIHoverGestureRecognizer *)v22;

    -[SBDashBoardSetupViewController view](v8, "view");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addGestureRecognizer:", v8->_hoverGestureRecognizer);

    objc_msgSend((id)SBApp, "telephonyStateProvider");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v25, "addObserver:", v8);
    -[SBDashBoardSetupViewController _updateLanguageFromTelephony](v8, "_updateLanguageFromTelephony");

  }
  return v8;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend((id)SBApp, "telephonyStateProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)SBDashBoardSetupViewController;
  -[CSCoverSheetViewControllerBase dealloc](&v4, sel_dealloc);
}

- (void)_didClickHomeAffordance:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0D1BB48], "actionWithType:", 11);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CSCoverSheetViewControllerBase sendAction:](self, "sendAction:", v4);

}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  if (self->_pointerClickGestureRecognizer == a3)
    return objc_msgSend(a4, "_isPointerTouch");
  else
    return 0;
}

- (void)_handleHoverEvent:(id)a3
{
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  void *v9;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  unint64_t v19;
  _BOOL4 v20;
  _BOOL4 v21;
  id v22;
  CGPoint v23;
  CGRect v24;

  v22 = a3;
  if (objc_msgSend(v22, "state") == 2)
  {
    -[SBDashBoardSetupViewController setupView](self, "setupView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "locationInView:", v4);
    v6 = v5;
    v8 = v7;

    -[SBDashBoardSetupViewController setupView](self, "setupView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "homeAffordanceView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "extendedFrameForPointerAnimationSuppression");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v19 = -[SBDashBoardSetupViewController _componentsRelevantToPointerSuppression](self, "_componentsRelevantToPointerSuppression");
    v24.origin.x = v12;
    v24.origin.y = v14;
    v24.size.width = v16;
    v24.size.height = v18;
    v23.x = v6;
    v23.y = v8;
    v20 = CGRectContainsPoint(v24, v23);
    v21 = -[SBDashBoardSetupViewController isCyclingComponents:](self, "isCyclingComponents:", v19);
    if (v20)
    {
      if (v21)
        -[SBDashBoardSetupViewController _stopCyclingComponents:](self, "_stopCyclingComponents:", v19);
    }
    else if (!v21)
    {
      -[SBDashBoardSetupViewController _startCyclingComponents:withDelay:](self, "_startCyclingComponents:withDelay:", v19, 0.25);
    }

  }
}

- (unint64_t)_componentsRelevantToPointerSuppression
{
  return 6;
}

- (BOOL)handleEvent:(id)a3
{
  id v4;
  char v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SBDashBoardSetupViewController;
  if (!-[CSCoverSheetViewControllerBase handleEvent:](&v15, sel_handleEvent_, v4)
    || (objc_msgSend(v4, "isConsumable") & 1) == 0)
  {
    v6 = objc_msgSend(v4, "type");
    v5 = 0;
    if (v6 > 23)
    {
      if (v6 == 24)
      {
        -[SBDashBoardSetupViewController _startCyclingComponents:withDelay:](self, "_startCyclingComponents:withDelay:", -[SBDashBoardSetupViewController _componentsToStartCycling](self, "_componentsToStartCycling"), 0.5);
        -[SBDashBoardSetupViewController setupView](self, "setupView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setInfoButtonVisible:animated:withDelay:", 1, 1, 0.5);

        -[SBDashBoardSetupViewController setupView](self, "setupView");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setChildIconVisible:animated:withDelay:", 1, 1, 0.5);

        -[SBDashBoardSetupViewController _checkIfActivationLocked](self, "_checkIfActivationLocked");
      }
      else
      {
        if (v6 != 25)
          goto LABEL_14;
        -[SBDashBoardSetupViewController _stopCyclingComponents:](self, "_stopCyclingComponents:", 63);
        -[SBDashBoardSetupViewController setupView](self, "setupView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setInfoButtonVisible:animated:withDelay:", 0, 0, 0.0);

        -[SBDashBoardSetupViewController setupView](self, "setupView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setChildIconVisible:animated:withDelay:", 0, 0, 0.0);

      }
    }
    else
    {
      if (v6 != 1)
      {
        if (v6 != 8)
          goto LABEL_14;
        -[CSCoverSheetViewControllerBase rebuildAppearance](self, "rebuildAppearance");
      }
      -[SBDashBoardSetupViewController setupView](self, "setupView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CSCoverSheetViewControllerBase activeAppearance](self, "activeAppearance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "legibilitySettings");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setLegibilitySettings:", v9);

    }
    v5 = 0;
    goto LABEL_14;
  }
  v5 = objc_msgSend(v4, "isConsumable");
LABEL_14:

  return v5;
}

- (void)loadView
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
  _BOOL8 v12;
  SBDashBoardSetupView *v13;
  id WeakRetained;
  void *v15;
  SBDashBoardSetupView *v16;
  void *v17;
  NSObject *queue;
  SBDashBoardSetupView *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  SBDashBoardSetupViewController *v24;
  SBDashBoardSetupView *v25;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = SBFEffectiveHomeButtonType() == 2;
  v13 = [SBDashBoardSetupView alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_coverSheetViewController);
  objc_msgSend(WeakRetained, "coverSheetContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[SBDashBoardSetupView initWithFrame:usingHomeAffordance:coverSheetContext:isStoreRestricted:isSecurityResearchDevice:](v13, "initWithFrame:usingHomeAffordance:coverSheetContext:isStoreRestricted:isSecurityResearchDevice:", v12, v15, self->_isStoreRestricted, -[SBDashBoardSetupViewController _isSecurityResearchDevice](self, "_isSecurityResearchDevice"), v5, v7, v9, v11);

  -[SBDashBoardSetupView setAutoresizingMask:](v16, "setAutoresizingMask:", 18);
  -[SBDashBoardSetupView infoButton](v16, "infoButton");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addTarget:action:forControlEvents:", self, sel__infoButtonTapped_, 64);

  queue = self->_queue;
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __42__SBDashBoardSetupViewController_loadView__block_invoke;
  v23 = &unk_1E8E9E820;
  v24 = self;
  v25 = v16;
  v19 = v16;
  dispatch_async(queue, &v20);
  -[SBDashBoardSetupViewController setView:](self, "setView:", v19, v20, v21, v22, v23, v24);

}

void __42__SBDashBoardSetupViewController_loadView__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __42__SBDashBoardSetupViewController_loadView__block_invoke_2;
  v2[3] = &unk_1E8EA31A0;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "_retrieveChildIconIfNecessaryWithCompletion:", v2);

}

void __42__SBDashBoardSetupViewController_loadView__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __42__SBDashBoardSetupViewController_loadView__block_invoke_3;
    v5[3] = &unk_1E8E9E820;
    v6 = v3;
    v7 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], v5);

  }
}

void __42__SBDashBoardSetupViewController_loadView__block_invoke_3(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(*(id *)(a1 + 40), "setChildIconView:", v2);
  objc_msgSend(*(id *)(a1 + 40), "setChildIconVisible:animated:withDelay:", 1, 1, 0.0);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[SBDashBoardSetupViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSCoverSheetViewControllerBase registerView:forRole:](self, "registerView:forRole:", v3, 2);

  -[SBDashBoardSetupViewController _startCyclingComponents:withDelay:](self, "_startCyclingComponents:withDelay:", -[SBDashBoardSetupViewController _componentsToStartCycling](self, "_componentsToStartCycling"), self->_customDelayDuration);
  -[SBDashBoardSetupViewController setupView](self, "setupView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInfoButtonVisible:animated:withDelay:", 1, 1, self->_customDelayDuration);

  -[SBDashBoardSetupViewController setupView](self, "setupView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setChildIconVisible:animated:withDelay:", 1, 1, self->_customDelayDuration);

  -[SBDashBoardSetupViewController setOverrideUserInterfaceStyle:](self, "setOverrideUserInterfaceStyle:", 1);
  v6.receiver = self;
  v6.super_class = (Class)SBDashBoardSetupViewController;
  -[CSCoverSheetViewControllerBase viewDidLoad](&v6, sel_viewDidLoad);
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBDashBoardSetupViewController;
  -[CSCoverSheetViewControllerBase viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[SBDashBoardSetupViewController _startWifiScan](self, "_startWifiScan");
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBDashBoardSetupViewController;
  -[CSCoverSheetViewControllerBase viewDidAppear:](&v7, sel_viewDidAppear_, a3);
  -[SBDashBoardSetupViewController _startCyclingComponents:withDelay:](self, "_startCyclingComponents:withDelay:", -[SBDashBoardSetupViewController _componentsToStartCycling](self, "_componentsToStartCycling"), 0.5);
  -[SBDashBoardSetupViewController setupView](self, "setupView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInfoButtonVisible:animated:withDelay:", 1, 1, 0.5);

  -[SBDashBoardSetupViewController setupView](self, "setupView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setChildIconVisible:animated:withDelay:", 1, 1, 0.5);

  objc_msgSend(MEMORY[0x1E0D1BB48], "actionWithType:", 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSCoverSheetViewControllerBase sendAction:](self, "sendAction:", v6);

}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBDashBoardSetupViewController;
  -[CSCoverSheetViewControllerBase viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[SBDashBoardSetupViewController _stopCyclingComponents:](self, "_stopCyclingComponents:", 6);
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBDashBoardSetupViewController;
  -[CSCoverSheetViewControllerBase viewDidDisappear:](&v6, sel_viewDidDisappear_, a3);
  -[SBDashBoardSetupViewController _stopCyclingComponents:](self, "_stopCyclingComponents:", 63);
  -[SBDashBoardSetupViewController setupView](self, "setupView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInfoButtonVisible:animated:withDelay:", 0, 0, 0.0);

  -[SBDashBoardSetupViewController setupView](self, "setupView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setChildIconVisible:animated:withDelay:", 0, 0, 0.0);

  -[SBDashBoardSetupViewController _cancelWifiScan](self, "_cancelWifiScan");
}

- (void)_retrieveChildIconIfNecessaryWithCompletion:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D8D718], "current");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __78__SBDashBoardSetupViewController__retrieveChildIconIfNecessaryWithCompletion___block_invoke;
  v8[3] = &unk_1E8EA31F0;
  v9 = v4;
  v10 = v3;
  v6 = v3;
  v7 = v4;
  objc_msgSend(v5, "aa_primaryAppleAccountWithCompletion:", v8);

}

void __78__SBDashBoardSetupViewController__retrieveChildIconIfNecessaryWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  objc_class *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    SBLogDashBoard();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __78__SBDashBoardSetupViewController__retrieveChildIconIfNecessaryWithCompletion___block_invoke_cold_1();

    goto LABEL_5;
  }
  objc_msgSend(*(id *)(a1 + 32), "isChild");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8
    || (v9 = (void *)v8,
        objc_msgSend(v5, "appleID"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v10,
        v9,
        !v10))
  {
LABEL_5:
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_6;
  }
  v18 = 0;
  v19 = &v18;
  v20 = 0x2050000000;
  v11 = (void *)getAAUIProfilePictureStoreClass_softClass;
  v21 = getAAUIProfilePictureStoreClass_softClass;
  v12 = MEMORY[0x1E0C809B0];
  if (!getAAUIProfilePictureStoreClass_softClass)
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __getAAUIProfilePictureStoreClass_block_invoke;
    v17[3] = &unk_1E8E9ED40;
    v17[4] = &v18;
    __getAAUIProfilePictureStoreClass_block_invoke((uint64_t)v17);
    v11 = (void *)v19[3];
  }
  v13 = objc_retainAutorelease(v11);
  _Block_object_dispose(&v18, 8);
  v14 = objc_alloc_init(v13);
  objc_msgSend(v14, "setPictureDiameter:", 95.0);
  v15[0] = v12;
  v15[1] = 3221225472;
  v15[2] = __78__SBDashBoardSetupViewController__retrieveChildIconIfNecessaryWithCompletion___block_invoke_2;
  v15[3] = &unk_1E8EA31C8;
  v16 = *(id *)(a1 + 40);
  objc_msgSend(v14, "profilePictureForAccountOwnerWithCompletion:", v15);

LABEL_6:
}

void __78__SBDashBoardSetupViewController__retrieveChildIconIfNecessaryWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void (*v8)(void);

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    SBLogDashBoard();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __78__SBDashBoardSetupViewController__retrieveChildIconIfNecessaryWithCompletion___block_invoke_2_cold_1();

    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v8();

}

- (int64_t)presentationType
{
  return 2;
}

- (int64_t)presentationPriority
{
  return 8;
}

- (void)aggregateAppearance:(id)a3
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
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  objc_super v36;

  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)SBDashBoardSetupViewController;
  -[CSCoverSheetViewControllerBase aggregateAppearance:](&v36, sel_aggregateAppearance_, v4);
  v5 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(MEMORY[0x1E0D1BB88], "wallpaper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hidden:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithObject:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setComponents:", v8);

  objc_msgSend(MEMORY[0x1E0D1BB88], "homeAffordance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "priority:", 80);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSCoverSheetViewControllerBase appearanceIdentifier](self, "appearanceIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "hidden:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addComponent:", v13);

  objc_msgSend(MEMORY[0x1E0D1BB88], "footerCallToActionLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "priority:", 80);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "hidden:", 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addComponent:", v16);

  objc_msgSend(MEMORY[0x1E0D1BB88], "quickActions");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "priority:", 80);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "hidden:", 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addComponent:", v19);

  if (!_os_feature_enabled_impl() || self->_isStoreRestricted || self->_regulatoryInfoViewController)
  {
    objc_msgSend(MEMORY[0x1E0D1BB88], "background");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "priority:", 80);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "color:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addComponent:", v23);

  }
  else
  {
    v20 = (void *)objc_opt_new();
    objc_msgSend(v20, "priority:", 80);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "style:", &unk_1E91D0260);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addComponent:", v22);
  }

  if (self->_isActivationLocked && !BYSetupAssistantHasCompletedInitialRun() || self->_isStoreRestricted)
  {
    objc_msgSend(MEMORY[0x1E0D1BB88], "proudLock");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "priority:", 80);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "hidden:", 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addComponent:", v26);

  }
  if (!_os_feature_enabled_impl() || self->_isStoreRestricted || self->_regulatoryInfoViewController)
  {
    v27 = objc_alloc(MEMORY[0x1E0CEADE8]);
    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v27;
    v30 = 2;
  }
  else
  {
    v35 = objc_alloc(MEMORY[0x1E0CEADE8]);
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v35;
    v30 = 1;
  }
  v31 = (void *)objc_msgSend(v29, "initWithStyle:contentColor:", v30, v28);
  objc_msgSend(v4, "setLegibilitySettings:", v31);

  v32 = (void *)objc_opt_new();
  objc_msgSend(v32, "priority:", 80);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "shouldRenderInline:", 1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addComponent:", v34);

}

- (void)aggregateBehavior:(id)a3
{
  id v4;
  uint64_t v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SBDashBoardSetupViewController;
  -[CSCoverSheetViewControllerBase aggregateBehavior:](&v6, sel_aggregateBehavior_, v4);
  if (self->_activationInfoViewController)
    v5 = 9;
  else
    v5 = 10;
  objc_msgSend(v4, "setIdleTimerDuration:", v5);
  objc_msgSend(v4, "setIdleTimerMode:", 2);
  objc_msgSend(v4, "setIdleWarnMode:", 1);
  if (self->_isStoreRestricted)
    objc_msgSend(v4, "addRestrictedCapabilities:", 4152);

}

- (void)_startCyclingComponents:(unint64_t)a3 withDelay:(double)a4
{
  unint64_t v4;
  BOOL v5;
  void *v8;
  NSTimer *v9;
  NSTimer *cycleStartTimer;
  _QWORD v11[5];
  id v12;
  id location;

  v4 = self->_componentsToCycle | a3;
  self->_componentsToCycle = v4;
  v5 = self->_isCyclingComponents || v4 == 0;
  if (!v5 && !-[NSTimer isValid](self->_cycleStartTimer, "isValid"))
  {
    -[SBDashBoardSetupViewController _resetDisplayedLocalizedStringsImmediately:](self, "_resetDisplayedLocalizedStringsImmediately:", 0);
    if (a4 <= 0.0)
    {
      -[SBDashBoardSetupViewController _animateComponentsForNewCycle](self, "_animateComponentsForNewCycle");
    }
    else
    {
      objc_initWeak(&location, self);
      v8 = (void *)MEMORY[0x1E0C99E88];
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __68__SBDashBoardSetupViewController__startCyclingComponents_withDelay___block_invoke;
      v11[3] = &unk_1E8EA3218;
      objc_copyWeak(&v12, &location);
      v11[4] = self;
      objc_msgSend(v8, "scheduledTimerWithTimeInterval:repeats:block:", 0, v11, a4);
      v9 = (NSTimer *)objc_claimAutoreleasedReturnValue();
      cycleStartTimer = self->_cycleStartTimer;
      self->_cycleStartTimer = v9;

      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
    }
  }
}

void __68__SBDashBoardSetupViewController__startCyclingComponents_withDelay___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained[139], "invalidate");
    v3 = v4[139];
    v4[139] = 0;

    objc_msgSend(*(id *)(a1 + 32), "_animateComponentsForNewCycle");
    WeakRetained = v4;
  }

}

- (void)_animateComponentsForNewCycle
{
  id WeakRetained;
  char v4;
  void *v5;
  void *v6;
  int v7;
  unint64_t componentsToCycle;
  void *v9;
  unint64_t v10;
  _QWORD v11[4];
  id v12;
  id location;

  WeakRetained = objc_loadWeakRetained((id *)&self->_coverSheetViewController);
  v4 = objc_msgSend(WeakRetained, "isInScreenOffMode");

  -[SBDashBoardSetupViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[SBDashBoardSetupViewController _appearState](self, "_appearState");
  if ((v4 & 1) == 0 && v6 && v7 == 2)
  {
    componentsToCycle = self->_componentsToCycle;
    self->_isCyclingComponents = componentsToCycle != 0;
    if (componentsToCycle)
    {
      objc_initWeak(&location, self);
      -[SBDashBoardSetupViewController _updateDisplayedStrings](self, "_updateDisplayedStrings");
      -[SBDashBoardSetupViewController setupView](self, "setupView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = self->_componentsToCycle;
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __63__SBDashBoardSetupViewController__animateComponentsForNewCycle__block_invoke;
      v11[3] = &unk_1E8E9DF28;
      objc_copyWeak(&v12, &location);
      objc_msgSend(v9, "animateComponents:toActive:withCompletion:", v10, 1, v11);

      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    self->_isCyclingComponents = 0;
  }
}

void __63__SBDashBoardSetupViewController__animateComponentsForNewCycle__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_incrementLocalizedStringsForNewCycle");
    objc_msgSend(v2, "rebuildAppearance");
    objc_msgSend(v2, "_animateComponentsForNewCycle");
    WeakRetained = v2;
  }

}

- (BOOL)isCyclingComponents:(unint64_t)a3
{
  return (self->_componentsToCycle & a3) != 0;
}

- (void)_stopCyclingComponents:(unint64_t)a3
{
  BOOL v5;
  NSTimer *cycleStartTimer;
  void *v7;

  if (self->_isCyclingComponents)
  {
    if (a3)
    {
      v5 = (self->_componentsToCycle & ~a3) != 0;
      self->_componentsToCycle &= ~a3;
      self->_isCyclingComponents = v5;
      -[SBDashBoardSetupViewController setupView](self, "setupView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "animateComponents:toActive:withCompletion:", a3, 0, 0);

    }
  }
  else if (-[NSTimer isValid](self->_cycleStartTimer, "isValid", a3))
  {
    -[NSTimer invalidate](self->_cycleStartTimer, "invalidate");
    cycleStartTimer = self->_cycleStartTimer;
    self->_cycleStartTimer = 0;

  }
}

- (void)_incrementLocalizedStringsForNewCycle
{
  unint64_t v3;
  NSMutableArray *v4;
  NSMutableArray *currentStringsOrdering;

  v3 = self->_currentStringsIndex + 1;
  self->_currentStringsIndex = v3;
  if (v3 >= -[NSMutableArray count](self->_currentStringsOrdering, "count"))
  {
    v4 = (NSMutableArray *)-[NSArray mutableCopy](self->_stringsOrdering, "mutableCopy");
    currentStringsOrdering = self->_currentStringsOrdering;
    self->_currentStringsOrdering = v4;

    self->_currentStringsIndex = 0;
LABEL_5:
    if (!self->_shouldResetOrderingOnNextCycle)
      return;
    goto LABEL_6;
  }
  if (self->_currentStringsIndex <= 5)
    goto LABEL_5;
LABEL_6:
  -[SBDashBoardSetupViewController _resetDisplayedLocalizedStringsImmediately:](self, "_resetDisplayedLocalizedStringsImmediately:", 0);
}

- (void)_resetDisplayedLocalizedStringsImmediately:(BOOL)a3
{
  _BOOL4 v3;
  NSMutableArray *currentStringsOrdering;
  void *v6;
  id v7;

  v3 = a3;
  -[NSMutableArray removeObjectsInRange:](self->_currentStringsOrdering, "removeObjectsInRange:", 0, self->_currentStringsIndex);
  -[SBDashBoardSetupViewController _importantLanguageIdentifiers](self, "_importantLanguageIdentifiers");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeObjectsInArray:](self->_currentStringsOrdering, "removeObjectsInArray:", v7);
  currentStringsOrdering = self->_currentStringsOrdering;
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, objc_msgSend(v7, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray insertObjects:atIndexes:](currentStringsOrdering, "insertObjects:atIndexes:", v7, v6);

  self->_currentStringsIndex = 0;
  if (v3)
    -[SBDashBoardSetupViewController _updateDisplayedStrings](self, "_updateDisplayedStrings");
  self->_shouldResetOrderingOnNextCycle = 0;

}

- (void)_updateDisplayedStrings
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
  void *v12;
  id v13;
  uint64_t v14;
  __CFString *v15;
  __CFString *v16;
  __CFString *v17;
  __CFString *v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
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
  void *v33;
  void *v34;
  void *v35;
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
  _QWORD v48[2];

  v48[1] = *MEMORY[0x1E0C80C00];
  -[SBDashBoardSetupViewController setupView](self, "setupView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBDashBoardSetupViewController _currentLanguageIdentifier](self, "_currentLanguageIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB34D0];
  objc_msgSend(v5, "localizations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferredLocalizationsFromArray:forPreferences:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = (void *)v10;
  else
    v12 = v4;
  v13 = v12;

  v14 = SBFEffectiveHomeButtonType();
  if (v14 == 2)
    v15 = CFSTR("SWIPE_UP_TO_OPEN");
  else
    v15 = CFSTR("PRESS_HOME_TO_OPEN");
  v16 = CFSTR("Press home to open");
  if (v14 == 2)
    v16 = CFSTR("Swipe up to open");
  v17 = v16;
  v18 = v15;
  objc_msgSend(v5, "localizedStringForKey:value:table:localization:", CFSTR("GREETING"), CFSTR("Hello"), CFSTR("CoverSheetCommon"), v13);
  v19 = objc_claimAutoreleasedReturnValue();
  v47 = v5;
  objc_msgSend(v5, "localizedStringForKey:value:table:localization:", v18, v17, CFSTR("CoverSheetCommon"), v13);
  v20 = objc_claimAutoreleasedReturnValue();

  v45 = (void *)v19;
  objc_msgSend(v3, "setTitleString:forLanguage:", v19, v13);
  if (v21 < 1.5)
    v21 = 1.5;
  self->_customDelayDuration = v21;
  v44 = (void *)v20;
  v46 = v13;
  objc_msgSend(v3, "setCallToActionString:forLanguage:", v20, v13);
  if (self->_isStoreRestricted)
  {
    -[SBDashBoardSetupViewController _applicableIdentifierForDictionary:identifier:](self, "_applicableIdentifierForDictionary:identifier:", self->_storeRestrictedStrings, v4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary bs_safeDictionaryForKey:](self->_storeRestrictedStrings, "bs_safeDictionaryForKey:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing Title for %@ -> %@"), v4, v22);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing Body for %@ -> %@"), v4, v22);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing Link for %@ -> %@"), v4, v22);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    v43 = v23;
    objc_msgSend(v23, "bs_safeStringForKey:", *MEMORY[0x1E0D4F910]);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "bs_safeStringForKey:", *MEMORY[0x1E0D4F900]);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "bs_safeStringForKey:", *MEMORY[0x1E0D4F908]);
    v27 = v3;
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBDashBoardSetupViewController _displayStringForLocalizedString:fallbackString:](self, "_displayStringForLocalizedString:fallbackString:", v25, v42);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBDashBoardSetupViewController _displayStringForLocalizedString:fallbackString:](self, "_displayStringForLocalizedString:fallbackString:", v26, v41);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBDashBoardSetupViewController _displayStringForLocalizedString:fallbackString:](self, "_displayStringForLocalizedString:fallbackString:", v28, v40);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setStoreRestrictedStrings:bodyString:linkString:forLanguage:", v29, v30, v31, v4);

    v3 = v27;
  }
  if (self->_isActivationLocked)
  {
    -[SBDashBoardSetupViewController _applicableIdentifierForDictionary:identifier:](self, "_applicableIdentifierForDictionary:identifier:", self->_activationLockStrings, v4);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary bs_safeDictionaryForKey:](self->_activationLockStrings, "bs_safeDictionaryForKey:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing Title for %@ -> %@"), v4, v32);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing Description for %@ -> %@"), v4, v32);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "bs_safeStringForKey:", CFSTR("ActivationLockInfoTitle"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "bs_safeStringForKey:", CFSTR("ActivationLockInfoDescription"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBDashBoardSetupViewController _displayStringForLocalizedString:fallbackString:](self, "_displayStringForLocalizedString:fallbackString:", v36, v34);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBDashBoardSetupViewController _displayStringForLocalizedString:fallbackString:](self, "_displayStringForLocalizedString:fallbackString:", v37, v35);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setActivationLockWarningString:detailString:forLanguage:", v38, v39, v4);

  }
  objc_msgSend(v3, "setNeedsLayout");

}

- (id)_displayStringForLocalizedString:(id)a3 fallbackString:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;

  v5 = a3;
  v6 = a4;
  v7 = v5;
  if (!v5)
  {
    SBLogDashBoard();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[SBDashBoardSetupViewController _displayStringForLocalizedString:fallbackString:].cold.1();

    if (os_variant_has_internal_content())
      v7 = v6;
    else
      v7 = 0;
  }
  v9 = v7;

  return v9;
}

- (id)_applicableIdentifierForDictionary:(id)a3 identifier:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB34D0];
  v6 = a4;
  objc_msgSend(a3, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredLocalizationsFromArray:forPreferences:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
    v10 = v6;
  v12 = v10;

  return v12;
}

- (id)_alignedMarketingOrdering
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  char v14;

  v2 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(MEMORY[0x1E0C99DC8], "baseSystemLanguages");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = SBFEffectiveHomeButtonType();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = CFSTR("PRESS_HOME_TO_OPEN");
  if (v5 == 2)
    v7 = CFSTR("SWIPE_UP_TO_OPEN");
  v8 = v7;
  objc_msgSend(v6, "localizedStringForKey:value:table:localization:", v8, 0, CFSTR("CoverSheetCommon"), CFSTR("pt-BR"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:localization:", v8, 0, CFSTR("CoverSheetCommon"), CFSTR("pt-PT"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isEqualToString:", v10) & 1) == 0)
  {
    v11 = objc_msgSend(v4, "count");
    if (objc_msgSend(v4, "count"))
    {
      v12 = 0;
      while (1)
      {
        objc_msgSend(v4, "objectAtIndex:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("pt"));

        if ((v14 & 1) != 0)
          break;
        if (++v12 >= (unint64_t)objc_msgSend(v4, "count"))
          goto LABEL_10;
      }
      v11 = v12;
    }
LABEL_10:
    objc_msgSend(v4, "insertObject:atIndex:", CFSTR("pt-PT"), v11 + 1);
  }
  objc_msgSend(v4, "addObject:", CFSTR("zh_HK"));

  return v4;
}

- (void)_updateStringOrderingForLanguageChange
{
  NSArray *v3;
  NSArray *stringsOrdering;
  NSMutableArray *v5;
  NSMutableArray *currentStringsOrdering;

  -[SBDashBoardSetupViewController _alignedMarketingOrdering](self, "_alignedMarketingOrdering");
  v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  stringsOrdering = self->_stringsOrdering;
  self->_stringsOrdering = v3;

  v5 = (NSMutableArray *)-[NSArray mutableCopy](self->_stringsOrdering, "mutableCopy");
  currentStringsOrdering = self->_currentStringsOrdering;
  self->_currentStringsOrdering = v5;

}

- (id)_currentStoreRestrictedStringsDictionary
{
  NSDictionary *storeRestrictedStrings;
  void *v3;
  void *v4;

  storeRestrictedStrings = self->_storeRestrictedStrings;
  -[SBDashBoardSetupViewController _currentLanguageIdentifier](self, "_currentLanguageIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKey:](storeRestrictedStrings, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_currentActivationLockStringsDictionary
{
  NSDictionary *activationLockStrings;
  void *v3;
  void *v4;

  activationLockStrings = self->_activationLockStrings;
  -[SBDashBoardSetupViewController _currentLanguageIdentifier](self, "_currentLanguageIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKey:](activationLockStrings, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_currentLanguageIdentifier
{
  return (id)-[NSMutableArray objectAtIndex:](self->_currentStringsOrdering, "objectAtIndex:", self->_currentStringsIndex);
}

- (id)_importantLanguageIdentifiers
{
  void *v3;
  void *v4;
  NSString *wifiPrimaryLanguage;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_telephonyPrimaryLanguage)
    objc_msgSend(v3, "addObject:");
  wifiPrimaryLanguage = self->_wifiPrimaryLanguage;
  if (wifiPrimaryLanguage
    && !-[NSString isEqualToString:](wifiPrimaryLanguage, "isEqualToString:", self->_telephonyPrimaryLanguage))
  {
    objc_msgSend(v4, "addObject:", self->_wifiPrimaryLanguage);
  }
  objc_msgSend(MEMORY[0x1E0C99DC8], "_deviceLanguage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6
    && (objc_msgSend(v6, "isEqualToString:", self->_telephonyPrimaryLanguage) & 1) == 0
    && (objc_msgSend(v7, "isEqualToString:", self->_wifiPrimaryLanguage) & 1) == 0)
  {
    objc_msgSend(v4, "addObject:", v7);
  }
  SBLogDashBoard();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "debugDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543362;
    v13 = v9;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "Important Languages: %{public}@", (uint8_t *)&v12, 0xCu);

  }
  if (!objc_msgSend(v4, "count"))
  {
    SBLogDashBoard();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "No languages determined, defaulting to en", (uint8_t *)&v12, 2u);
    }

    objc_msgSend(v4, "addObject:", CFSTR("en"));
  }

  return v4;
}

- (id)_subscriptionInfoForSubscriptionDataSource:(int64_t)a3
{
  const char *v3;

  if (a3 == 1)
  {
    -[SBTelephonyManager _secondarySubscriptionInfo](self->_telephonyManager, "_secondarySubscriptionInfo");
    v3 = (const char *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (!a3)
  {
    -[SBTelephonyManager _primarySubscriptionInfo](self->_telephonyManager, "_primarySubscriptionInfo");
    v3 = (const char *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    a2 = v3;
  }
  return (id)(id)a2;
}

- (id)_subcriptionDataSourceDescription:(int64_t)a3
{
  if (a3)
    return CFSTR("Secondary Subscription Data Source");
  else
    return CFSTR("Primary Subscription Data Source");
}

- (void)_updateLanguageFromSubscriptionDataSource:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  NSString *v8;
  NSObject *v9;
  NSString *v10;
  void *v11;
  NSString *v12;
  NSObject *v13;
  NSObject *v14;
  NSString *v15;
  int v16;
  NSString *v17;
  __int16 v18;
  NSString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[SBDashBoardSetupViewController _subscriptionInfoForSubscriptionDataSource:](self, "_subscriptionInfoForSubscriptionDataSource:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastKnownNetworkCountryCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "languagesForRegion:subdivision:withThreshold:filter:", v6, 0, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBDashBoardSetupViewController firstSupportedLanguageIdentifierInRegionalLanguageIdentifiers:countryCode:](self, "firstSupportedLanguageIdentifierInRegionalLanguageIdentifiers:countryCode:", v7, v6);
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  SBLogDashBoard();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    -[SBDashBoardSetupViewController _subcriptionDataSourceDescription:](self, "_subcriptionDataSourceDescription:", a3);
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    v16 = 138543618;
    v17 = v8;
    v18 = 2114;
    v19 = v10;
    _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "Supported language identifier: %{public}@, subscription data source: %{public}@", (uint8_t *)&v16, 0x16u);

  }
  if (!v8)
    goto LABEL_12;
  -[SBDashBoardSetupViewController _importantLanguageIdentifiers](self, "_importantLanguageIdentifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = self->_telephonyPrimaryLanguage;
  objc_storeStrong((id *)&self->_telephonyPrimaryLanguage, v8);
  SBLogDashBoard();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138543618;
    v17 = v12;
    v18 = 2114;
    v19 = v8;
    _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_DEFAULT, "[Cell][Primary] Language changed from %{public}@ to %{public}@", (uint8_t *)&v16, 0x16u);
  }

  if (-[NSString isEqualToString:](self->_telephonyPrimaryLanguage, "isEqualToString:", v12)
    || !-[SBDashBoardSetupViewController _haveImportantLanguagesChangedFrom:](self, "_haveImportantLanguagesChangedFrom:", v11))
  {

LABEL_12:
    -[SBDashBoardSetupViewController _updateStringOrderingForLanguageChange](self, "_updateStringOrderingForLanguageChange");
    goto LABEL_13;
  }
  SBLogDashBoard();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v11, "firstObject");
    v15 = (NSString *)objc_claimAutoreleasedReturnValue();
    v16 = 138543362;
    v17 = v15;
    _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEFAULT, "[Cell][Primary] Updating important languages, previous best was: %{public}@", (uint8_t *)&v16, 0xCu);

  }
  -[SBDashBoardSetupViewController _evaluateUpdatingLanguageForImportantLanguageChanges](self, "_evaluateUpdatingLanguageForImportantLanguageChanges");

LABEL_13:
}

- (void)_updateLanguageFromTelephony
{
  -[SBDashBoardSetupViewController _updateLanguageFromSubscriptionDataSource:](self, "_updateLanguageFromSubscriptionDataSource:", 0);
  if (!self->_telephonyPrimaryLanguage)
    -[SBDashBoardSetupViewController _updateLanguageFromSubscriptionDataSource:](self, "_updateLanguageFromSubscriptionDataSource:", 1);
}

- (id)firstSupportedLanguageIdentifierInRegionalLanguageIdentifiers:(id)a3 countryCode:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  id v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = v6;
  v9 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    while (2)
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        -[SBDashBoardSetupViewController _supportedLanguageIdentifierFromRegionalLanguageIdentifier:countryCode:](self, "_supportedLanguageIdentifierFromRegionalLanguageIdentifier:countryCode:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v12), v7, (_QWORD)v17);
        v13 = objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v15 = (void *)v13;
          v14 = v8;
          goto LABEL_13;
        }
        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
      if (v10)
        continue;
      break;
    }
  }

  SBLogDashBoard();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v22 = v7;
    _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEFAULT, "No supported languages found for country code: %{public}@", buf, 0xCu);
  }
  v15 = 0;
LABEL_13:

  return v15;
}

- (id)_supportedLanguageIdentifierFromRegionalLanguageIdentifier:(id)a3 countryCode:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSMutableArray *currentStringsOrdering;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99DC8], "languageFromLanguage:byReplacingRegion:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
  {
    v8 = (void *)MEMORY[0x1E0CB34D0];
    currentStringsOrdering = self->_currentStringsOrdering;
    v21[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "preferredLocalizationsFromArray:forPreferences:", currentStringsOrdering, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    SBLogDashBoard();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138543874;
      v16 = v12;
      v17 = 2114;
      v18 = v6;
      v19 = 2114;
      v20 = v7;
      _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_DEFAULT, "Supported language: %{public}@ found for identifier: %{public}@, languageWithRegion: %{public}@", (uint8_t *)&v15, 0x20u);
    }
  }
  else
  {
    SBLogDashBoard();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138543618;
      v16 = v6;
      v17 = 2114;
      v18 = v7;
      _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_DEFAULT, "No supported language found for identifier: %{public}@, languageWithRegion: %{public}@", (uint8_t *)&v15, 0x16u);
    }
    v12 = 0;
  }

  return v12;
}

- (void)_updateWifiPrimaryLanguageFromDiscoveredCountryCodes:(id)a3
{
  id v4;
  id v5;
  uint64_t i;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  NSString *v30;
  void *v31;
  NSString *v32;
  NSObject *v33;
  NSObject *v34;
  id v35;
  id obj;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t buf[4];
  NSString *v53;
  __int16 v54;
  void *v55;
  _BYTE v56[128];
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v35 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  obj = v4;
  v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v58, 16);
  if (v38)
  {
    v37 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v38; ++i)
      {
        if (*(_QWORD *)v49 != v37)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i);
        v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        objc_msgSend(MEMORY[0x1E0D3EFB0], "preferredLanguagesForRegion:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = 0u;
        v45 = 0u;
        v46 = 0u;
        v47 = 0u;
        v39 = v9;
        objc_msgSend(v9, "reverseObjectEnumerator");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v44, v57, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v45;
          do
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v45 != v13)
                objc_enumerationMutation(v10);
              -[SBDashBoardSetupViewController _supportedLanguageIdentifierFromRegionalLanguageIdentifier:countryCode:](self, "_supportedLanguageIdentifierFromRegionalLanguageIdentifier:countryCode:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * j), v7);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              if (v15)
                objc_msgSend(v8, "addObject:", v15);

            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v44, v57, 16);
          }
          while (v12);
        }

        objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, v7);
      }
      v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v58, 16);
    }
    while (v38);
  }

  SBLogDashBoard();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v53 = (NSString *)v5;
    _os_log_impl(&dword_1D0540000, v16, OS_LOG_TYPE_DEFAULT, "Preferred language identifiers for wifi discovered country codes: %{public}@", buf, 0xCu);
  }

  objc_msgSend(v5, "allValues");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");

  if (v18)
  {
    do
    {
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v19 = obj;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v40, v56, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v41;
        do
        {
          for (k = 0; k != v21; ++k)
          {
            if (*(_QWORD *)v41 != v22)
              objc_enumerationMutation(v19);
            v24 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * k);
            objc_msgSend(v5, "objectForKeyedSubscript:", v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "lastObject");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            if (v26)
            {
              if ((objc_msgSend(v35, "containsObject:", v26) & 1) == 0)
                objc_msgSend(v35, "addObject:", v26);
              objc_msgSend(v25, "removeLastObject");
            }
            if (!objc_msgSend(v25, "count"))
              objc_msgSend(v5, "setObject:forKeyedSubscript:", 0, v24);

          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v40, v56, 16);
        }
        while (v21);
      }

      objc_msgSend(v5, "allValues");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "count");

    }
    while (v28);
  }
  if (objc_msgSend(v35, "count"))
  {
    -[SBDashBoardSetupViewController _importantLanguageIdentifiers](self, "_importantLanguageIdentifiers");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "firstObject");
    v30 = (NSString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "firstObject");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = self->_wifiPrimaryLanguage;
    objc_storeStrong((id *)&self->_wifiPrimaryLanguage, v31);
    SBLogDashBoard();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v53 = v32;
      v54 = 2114;
      v55 = v31;
      _os_log_impl(&dword_1D0540000, v33, OS_LOG_TYPE_DEFAULT, "[WiFi] Language changed from %{public}@ to %{public}@", buf, 0x16u);
    }

    if (!-[NSString isEqualToString:](self->_wifiPrimaryLanguage, "isEqualToString:", v32)
      && -[SBDashBoardSetupViewController _haveImportantLanguagesChangedFrom:](self, "_haveImportantLanguagesChangedFrom:", v29))
    {
      SBLogDashBoard();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v53 = v30;
        _os_log_impl(&dword_1D0540000, v34, OS_LOG_TYPE_DEFAULT, "[WiFi] Updating important languages, previous best was: %{public}@", buf, 0xCu);
      }

      -[SBDashBoardSetupViewController _evaluateUpdatingLanguageForImportantLanguageChanges](self, "_evaluateUpdatingLanguageForImportantLanguageChanges");
    }

  }
}

- (BOOL)_haveImportantLanguagesChangedFrom:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  char v10;
  char v11;

  v4 = a3;
  -[SBDashBoardSetupViewController _importantLanguageIdentifiers](self, "_importantLanguageIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "count");
  if (v6 == objc_msgSend(v5, "count"))
  {
    if (objc_msgSend(v5, "count"))
    {
      v7 = 0;
      do
      {
        objc_msgSend(v4, "objectAtIndex:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectAtIndex:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqualToString:", v9);

        if ((v10 & 1) == 0)
          break;
        ++v7;
      }
      while (v7 < objc_msgSend(v5, "count"));
      v11 = v10 ^ 1;
    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    v11 = 1;
  }

  return v11;
}

- (void)_evaluateUpdatingLanguageForImportantLanguageChanges
{
  if (self->_isCyclingComponents)
    self->_shouldResetOrderingOnNextCycle = 1;
  else
    -[SBDashBoardSetupViewController _resetDisplayedLocalizedStringsImmediately:](self, "_resetDisplayedLocalizedStringsImmediately:", 1);
}

- (void)_checkIfActivationLocked
{
  void *v3;
  _QWORD v4[5];

  objc_msgSend(MEMORY[0x1E0D21380], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58__SBDashBoardSetupViewController__checkIfActivationLocked__block_invoke;
  v4[3] = &unk_1E8EA3240;
  v4[4] = self;
  objc_msgSend(v3, "activationLockInfoFromDeviceWithCompletion:", v4);

}

void __58__SBDashBoardSetupViewController__checkIfActivationLocked__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    SBLogDashBoard();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __58__SBDashBoardSetupViewController__checkIfActivationLocked__block_invoke_cold_1(v6, v7);
  }
  else
  {
    if (!objc_msgSend(v5, "isRestrictedSKU"))
    {
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __58__SBDashBoardSetupViewController__checkIfActivationLocked__block_invoke_114;
      v8[3] = &unk_1E8E9E820;
      v8[4] = *(_QWORD *)(a1 + 32);
      v9 = v5;
      dispatch_async(MEMORY[0x1E0C80D38], v8);

      goto LABEL_5;
    }
    SBLogDashBoard();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "[Activation Lock] Info available, but SKU is restricted.", buf, 2u);
    }
  }

LABEL_5:
}

uint64_t __58__SBDashBoardSetupViewController__checkIfActivationLocked__block_invoke_114(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateForLockInfo:", *(_QWORD *)(a1 + 40));
}

- (void)_updateForLockInfo:(id)a3
{
  _BOOL4 isActivationLocked;
  id v5;
  void *v6;
  NSString *v7;
  NSString *maskedAppleID;
  void *v9;
  NSDictionary *v10;
  NSDictionary *activationLockStrings;
  void *v12;

  isActivationLocked = self->_isActivationLocked;
  v5 = a3;
  self->_isActivationLocked = objc_msgSend(v5, "isActivationLocked");
  objc_msgSend(v5, "maskedAppleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (NSString *)objc_msgSend(v6, "copy");
  maskedAppleID = self->_maskedAppleID;
  self->_maskedAppleID = v7;

  objc_msgSend(v5, "localeStrings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (NSDictionary *)objc_msgSend(v9, "copy");
  activationLockStrings = self->_activationLockStrings;
  self->_activationLockStrings = v10;

  if (isActivationLocked != self->_isActivationLocked)
  {
    -[SBDashBoardSetupViewController setupView](self, "setupView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setActivationLocked:", self->_isActivationLocked);

    -[CSCoverSheetViewControllerBase updateAppearanceForController:](self, "updateAppearanceForController:", self);
  }
}

- (unint64_t)_componentsToStartCycling
{
  if (self->_isActivationLocked)
    return 63;
  else
    return 31;
}

- (void)_infoButtonTapped:(id)a3
{
  void *v4;
  void *v5;
  SBActivationInfoViewController *activationInfoViewController;
  uint64_t v7;
  SBActivationInfoViewController *v8;
  SBSetupRegulatoryInfoViewController *regulatoryInfoViewController;
  SBActivationInfoViewController *v10;
  void *v11;
  SBActivationInfoViewController *v12;
  _QWORD v13[4];
  SBActivationInfoViewController *v14;
  SBDashBoardSetupViewController *v15;
  _QWORD v16[4];
  SBActivationInfoViewController *v17;
  SBDashBoardSetupViewController *v18;
  _QWORD v19[5];
  SBActivationInfoViewController *v20;
  id v21;

  -[SBDashBoardSetupViewController setupView](self, "setupView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  activationInfoViewController = self->_activationInfoViewController;
  if (*(_OWORD *)&self->_activationInfoViewController == 0)
  {
    v10 = objc_alloc_init(SBActivationInfoViewController);
    -[CSCoverSheetViewControllerBase legibilitySettings](self, "legibilitySettings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBActivationInfoViewController setLegibilitySettings:](v10, "setLegibilitySettings:", v11);

    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __52__SBDashBoardSetupViewController__infoButtonTapped___block_invoke;
    v19[3] = &unk_1E8EA3268;
    v19[4] = self;
    v20 = v10;
    v21 = v5;
    v12 = v10;
    -[SBDashBoardSetupViewController bs_addChildViewController:animated:transitionBlock:](self, "bs_addChildViewController:animated:transitionBlock:", v12, 0, v19);

  }
  else
  {
    v7 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __52__SBDashBoardSetupViewController__infoButtonTapped___block_invoke_2;
    v16[3] = &unk_1E8E9EA00;
    v8 = v4;
    v17 = v8;
    v18 = self;
    -[SBDashBoardSetupViewController bs_removeChildViewController:animated:transitionBlock:](self, "bs_removeChildViewController:animated:transitionBlock:", activationInfoViewController, 0, v16);
    regulatoryInfoViewController = self->_regulatoryInfoViewController;
    v13[0] = v7;
    v13[1] = 3221225472;
    v13[2] = __52__SBDashBoardSetupViewController__infoButtonTapped___block_invoke_3;
    v13[3] = &unk_1E8E9EA00;
    v14 = v8;
    v15 = self;
    -[SBDashBoardSetupViewController bs_removeChildViewController:animated:transitionBlock:](self, "bs_removeChildViewController:animated:transitionBlock:", regulatoryInfoViewController, 0, v13);

    v12 = v17;
  }

  -[CSCoverSheetViewControllerBase rebuildBehavior](self, "rebuildBehavior");
  -[CSCoverSheetViewControllerBase updateAppearanceForController:](self, "updateAppearanceForController:", self);
  objc_msgSend(v5, "setNeedsLayout");

}

void __52__SBDashBoardSetupViewController__infoButtonTapped___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  void *v6;
  void (**v7)(void);

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1048), *(id *)(a1 + 40));
  v7 = a2;
  v4 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setActivationInfoView:", v5);

  objc_msgSend(*(id *)(a1 + 40), "regulatoryInfoButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 32), sel__regulatoryInfoButtonTapped_, 64);

  v7[2]();
}

void __52__SBDashBoardSetupViewController__infoButtonTapped___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void (**v7)(void);

  v3 = *(void **)(a1 + 32);
  v7 = a2;
  objc_msgSend(v3, "setActivationInfoView:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1048), "regulatoryInfoButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeTarget:action:forControlEvents:", *(_QWORD *)(a1 + 40), 0, 64);

  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void **)(v5 + 1048);
  *(_QWORD *)(v5 + 1048) = 0;

  v7[2]();
}

void __52__SBDashBoardSetupViewController__infoButtonTapped___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void (**v6)(void);

  v3 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v3, "setRegulatoryInfoView:", 0);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(v4 + 1056);
  *(_QWORD *)(v4 + 1056) = 0;

  v6[2]();
}

- (void)_regulatoryInfoButtonTapped:(id)a3
{
  SBSetupRegulatoryInfoViewController *v4;
  void *v5;
  SBSetupRegulatoryInfoViewController *v6;
  _QWORD v7[5];
  SBSetupRegulatoryInfoViewController *v8;
  id v9;

  v4 = self->_regulatoryInfoViewController;
  -[SBDashBoardSetupViewController setupView](self, "setupView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v6 = -[SBSetupRegulatoryInfoViewController initWithNibName:bundle:]([SBSetupRegulatoryInfoViewController alloc], "initWithNibName:bundle:", 0, 0);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __62__SBDashBoardSetupViewController__regulatoryInfoButtonTapped___block_invoke;
    v7[3] = &unk_1E8EA3268;
    v7[4] = self;
    v4 = v6;
    v8 = v4;
    v9 = v5;
    -[SBDashBoardSetupViewController bs_addChildViewController:animated:transitionBlock:](self, "bs_addChildViewController:animated:transitionBlock:", v4, 0, v7);

  }
  -[CSCoverSheetViewControllerBase updateAppearanceForController:](self, "updateAppearanceForController:", self);
  objc_msgSend(v5, "setNeedsLayout");

}

void __62__SBDashBoardSetupViewController__regulatoryInfoButtonTapped___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  void (**v6)(void);

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1056), *(id *)(a1 + 40));
  v6 = a2;
  v4 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRegulatoryInfoView:", v5);

  v6[2]();
}

- (BOOL)_isSecurityResearchDevice
{
  return MGGetBoolAnswer();
}

- (void)_startWifiScan
{
  SBSetupWiFiScanner *v3;
  SBSetupWiFiScanner *wifiScanner;
  SBSetupWiFiScanner *v5;
  _QWORD v6[5];

  if (!self->_wifiScanner && !self->_wifiPrimaryLanguage)
  {
    v3 = objc_alloc_init(SBSetupWiFiScanner);
    wifiScanner = self->_wifiScanner;
    self->_wifiScanner = v3;

    v5 = self->_wifiScanner;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __48__SBDashBoardSetupViewController__startWifiScan__block_invoke;
    v6[3] = &unk_1E8EA3290;
    v6[4] = self;
    -[SBSetupWiFiScanner beginScanningWithCompletionHandler:](v5, "beginScanningWithCompletionHandler:", v6);
  }
}

void __48__SBDashBoardSetupViewController__startWifiScan__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__SBDashBoardSetupViewController__startWifiScan__block_invoke_2;
  v5[3] = &unk_1E8E9E820;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

uint64_t __48__SBDashBoardSetupViewController__startWifiScan__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 1040);
  *(_QWORD *)(v2 + 1040) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "_updateWifiPrimaryLanguageFromDiscoveredCountryCodes:", *(_QWORD *)(a1 + 40));
}

- (void)_cancelWifiScan
{
  SBSetupWiFiScanner *wifiScanner;

  -[SBSetupWiFiScanner cancel](self->_wifiScanner, "cancel");
  wifiScanner = self->_wifiScanner;
  self->_wifiScanner = 0;

}

- (void)subscriptionInfoDidChangeForStateProvider:(id)a3 slot:(int64_t)a4
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__SBDashBoardSetupViewController_subscriptionInfoDidChangeForStateProvider_slot___block_invoke;
  block[3] = &unk_1E8E9DED8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __81__SBDashBoardSetupViewController_subscriptionInfoDidChangeForStateProvider_slot___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  SBLogDashBoard();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "Subscription info changed. Updating Language...", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_updateLanguageFromTelephony");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_hoverGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_pointerClickGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_currentStringsOrdering, 0);
  objc_storeStrong((id *)&self->_stringsOrdering, 0);
  objc_storeStrong((id *)&self->_maskedAppleID, 0);
  objc_storeStrong((id *)&self->_activationLockStrings, 0);
  objc_storeStrong((id *)&self->_storeRestrictedStrings, 0);
  objc_storeStrong((id *)&self->_cycleStartTimer, 0);
  objc_storeStrong((id *)&self->_telephonyPrimaryLanguage, 0);
  objc_storeStrong((id *)&self->_wifiPrimaryLanguage, 0);
  objc_storeStrong((id *)&self->_configureKey, 0);
  objc_storeStrong((id *)&self->_telephonyManager, 0);
  objc_destroyWeak((id *)&self->_coverSheetViewController);
  objc_storeStrong((id *)&self->_setupManager, 0);
  objc_storeStrong((id *)&self->_regulatoryInfoViewController, 0);
  objc_storeStrong((id *)&self->_activationInfoViewController, 0);
  objc_storeStrong((id *)&self->_wifiScanner, 0);
}

void __78__SBDashBoardSetupViewController__retrieveChildIconIfNecessaryWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_4(&dword_1D0540000, v0, v1, "failed to fetch apple account with error %{public}@", v2);
  OUTLINED_FUNCTION_2_0();
}

void __78__SBDashBoardSetupViewController__retrieveChildIconIfNecessaryWithCompletion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_4(&dword_1D0540000, v0, v1, "failed to fetch profile picture with error %{public}@", v2);
  OUTLINED_FUNCTION_2_0();
}

- (void)_displayStringForLocalizedString:fallbackString:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_1D0540000, v0, OS_LOG_TYPE_DEBUG, "%@", v1, 0xCu);
  OUTLINED_FUNCTION_2_0();
}

void __58__SBDashBoardSetupViewController__checkIfActivationLocked__block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_4(&dword_1D0540000, a2, v4, "Error getting activation lock info: %{private}@", v5);

}

@end
