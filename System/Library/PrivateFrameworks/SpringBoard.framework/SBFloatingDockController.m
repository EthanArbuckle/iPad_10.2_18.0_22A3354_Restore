@implementation SBFloatingDockController

+ (BOOL)isFloatingDockSupported
{
  if (isFloatingDockSupported_onceToken != -1)
    dispatch_once(&isFloatingDockSupported_onceToken, &__block_literal_global_61_0);
  return isFloatingDockSupported___isFloatingDockSupported;
}

+ (void)initialize
{
  id v3;

  objc_opt_self();
  v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3 == a1)
  {
    SBIconLocationGroupAddLocation();
    SBIconLocationGroupAddLocation();
  }
}

- (SBFloatingDockController)initWithWindowScene:(id)a3 homeScreenContextProvider:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  unint64_t v10;
  SBRecentDisplayItemsController *v11;
  void *v12;
  void *v13;
  SBRecentDisplayItemsController *v14;
  SBRecentDisplayItemsDataStore *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  SBFloatingDockController *v20;

  v6 = a4;
  v7 = a3;
  +[SBMedusaDomain rootSettings](SBMedusaDomain, "rootSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "numberOfRecents");
  *(float *)&v9 = v9;
  v10 = vcvtms_u32_f32(*(float *)&v9);

  v11 = [SBRecentDisplayItemsController alloc];
  +[SBAppInteractionEventSourceManager sharedInstance](SBAppInteractionEventSourceManager, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[SBRecentDisplayItemsController initWithRemovalPersonality:movePersonality:transitionFromSources:maxDisplayItems:eventSource:applicationController:](v11, "initWithRemovalPersonality:movePersonality:transitionFromSources:maxDisplayItems:eventSource:applicationController:", 14, 15, 0, v10, v12, v13);

  v15 = -[SBRecentDisplayItemsDataStore initWithRecentLayouts:fallbackToRecentAppLayouts:]([SBRecentDisplayItemsDataStore alloc], "initWithRecentLayouts:fallbackToRecentAppLayouts:", 0, 0);
  objc_msgSend(v7, "layoutStateTransitionCoordinator");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBAppSuggestionManager sharedInstance](SBAppSuggestionManager, "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DA9D78], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[SBFloatingDockController _initWithWindowScene:homeScreenContextProvider:applicationController:recentsController:recentsDataStore:layoutStateTransitionCoordinator:appSuggestionManager:analyticsClient:](self, "_initWithWindowScene:homeScreenContextProvider:applicationController:recentsController:recentsDataStore:layoutStateTransitionCoordinator:appSuggestionManager:analyticsClient:", v7, v6, v17, v14, v15, v16, v18, v19);

  return v20;
}

- (id)_initWithWindowScene:(id)a3 homeScreenContextProvider:(id)a4 applicationController:(id)a5 recentsController:(id)a6 recentsDataStore:(id)a7 layoutStateTransitionCoordinator:(id)a8 appSuggestionManager:(id)a9 analyticsClient:(id)a10
{
  id v16;
  id v17;
  id v18;
  SBFloatingDockController *v19;
  SBFloatingDockController *v20;
  SBFailingSystemGestureRecognizer *v21;
  SBFailingSystemGestureRecognizer *dismissFloatingDockSystemGestureRecognizer;
  SBFloatingDockRootViewController *v23;
  SBFloatingDockRootViewController *viewController;
  SBIndirectPanGestureRecognizer *v25;
  SBIndirectPanGestureRecognizer *presentFloatingDockIndirectPanGestureRecognizer;
  uint64_t v27;
  SBFZStackParticipant *zStackParticipant;
  uint64_t v29;
  UIHoverGestureRecognizer *dismissFloatingDockHoverGestureRecognizer;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  SBFloatingDockWindow *v40;
  void *v41;
  uint64_t v42;
  PTToggleTestRecipe *testRecipe;
  void *v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  _QWORD v51[4];
  id v52;
  _QWORD v53[4];
  id v54;
  id location;
  objc_super v56;
  _QWORD v57[4];

  v57[2] = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v46 = a5;
  v47 = a6;
  v48 = a7;
  v18 = a8;
  v49 = a9;
  v50 = a10;
  v56.receiver = self;
  v56.super_class = (Class)SBFloatingDockController;
  v19 = -[SBFloatingDockController init](&v56, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeWeak((id *)&v19->_windowScene, v16);
    objc_storeWeak((id *)&v20->_homeScreenContextProvider, v17);
    v21 = objc_alloc_init(SBFailingSystemGestureRecognizer);
    dismissFloatingDockSystemGestureRecognizer = v20->_dismissFloatingDockSystemGestureRecognizer;
    v20->_dismissFloatingDockSystemGestureRecognizer = v21;

    -[SBFailingSystemGestureRecognizer setAllowedTouchTypes:](v20->_dismissFloatingDockSystemGestureRecognizer, "setAllowedTouchTypes:", &unk_1E91CEAA0);
    -[SBFailingSystemGestureRecognizer setDelegate:](v20->_dismissFloatingDockSystemGestureRecognizer, "setDelegate:", v20);
    v23 = -[SBFloatingDockRootViewController initWithHomeScreenContextProvider:applicationController:recentsController:recentsDataStore:appSuggestionManager:layoutStateTransitionCoordinator:iconViewProvider:analyticsClient:]([SBFloatingDockRootViewController alloc], "initWithHomeScreenContextProvider:applicationController:recentsController:recentsDataStore:appSuggestionManager:layoutStateTransitionCoordinator:iconViewProvider:analyticsClient:", v17, v46, v47, v48, v49, v18, v20, v50);
    viewController = v20->_viewController;
    v20->_viewController = v23;

    -[SBFloatingDockRootViewController loadViewIfNeeded](v20->_viewController, "loadViewIfNeeded");
    v25 = -[SBIndirectPanGestureRecognizer initWithTarget:action:edges:]([SBIndirectPanGestureRecognizer alloc], "initWithTarget:action:edges:", v20, sel_handlePresentFloatingDockHoverGesture_, 4);
    presentFloatingDockIndirectPanGestureRecognizer = v20->_presentFloatingDockIndirectPanGestureRecognizer;
    v20->_presentFloatingDockIndirectPanGestureRecognizer = v25;

    -[SBIndirectPanGestureRecognizer setName:](v20->_presentFloatingDockIndirectPanGestureRecognizer, "setName:", CFSTR("presentFloatingDockIndirectPanGestureRecognizer"));
    -[SBIndirectPanGestureRecognizer setDelegate:](v20->_presentFloatingDockIndirectPanGestureRecognizer, "setDelegate:", v20);
    -[SBIndirectPanGestureRecognizer setActivationRecognitionDistance:](v20->_presentFloatingDockIndirectPanGestureRecognizer, "setActivationRecognitionDistance:", 25.0);
    -[SBIndirectPanGestureRecognizer setHysteresis:forInputType:](v20->_presentFloatingDockIndirectPanGestureRecognizer, "setHysteresis:forInputType:", 0, 35.0);
    -[SBIndirectPanGestureRecognizer setHysteresis:forInputType:](v20->_presentFloatingDockIndirectPanGestureRecognizer, "setHysteresis:forInputType:", 1, 10.0);
    -[SBIndirectPanGestureRecognizer setTranslationAdjustmentBlock:](v20->_presentFloatingDockIndirectPanGestureRecognizer, "setTranslationAdjustmentBlock:", &__block_literal_global_190);
    objc_msgSend(v16, "zStackResolver");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "acquireParticipantWithIdentifier:delegate:", 2, v20);
    v27 = objc_claimAutoreleasedReturnValue();
    zStackParticipant = v20->_zStackParticipant;
    v20->_zStackParticipant = (SBFZStackParticipant *)v27;

    v29 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA628]), "initWithTarget:action:", v20, sel__handleDismissFloatingDockHoverGesture_);
    dismissFloatingDockHoverGestureRecognizer = v20->_dismissFloatingDockHoverGestureRecognizer;
    v20->_dismissFloatingDockHoverGestureRecognizer = (UIHoverGestureRecognizer *)v29;

    -[UIHoverGestureRecognizer setDelegate:](v20->_dismissFloatingDockHoverGestureRecognizer, "setDelegate:", v20);
    objc_storeWeak((id *)&v20->_layoutStateTransitionCoordinator, v18);
    objc_msgSend(v18, "addObserver:", v20);
    -[SBFloatingDockRootViewController setDelegate:](v20->_viewController, "setDelegate:", v20);
    objc_msgSend(v17, "iconManager");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addPageStateObserver:", v20);
    objc_msgSend(v31, "addFolderPresentationObserver:", v20);
    objc_msgSend(v16, "assistantController");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addObserver:", v20);

    objc_storeStrong((id *)&v20->_analyticsClient, a10);
    objc_initWeak(&location, v20);
    +[SBDefaults localDefaults](SBDefaults, "localDefaults");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "appSwitcherDefaults");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "chamoisWindowingEnabled");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v57[0] = v35;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "medusaMultitaskingEnabled");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v57[1] = v36;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 2);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = MEMORY[0x1E0C80D38];
    v53[0] = MEMORY[0x1E0C809B0];
    v53[1] = 3221225472;
    v53[2] = __202__SBFloatingDockController__initWithWindowScene_homeScreenContextProvider_applicationController_recentsController_recentsDataStore_layoutStateTransitionCoordinator_appSuggestionManager_analyticsClient___block_invoke_2;
    v53[3] = &unk_1E8E9DF28;
    objc_copyWeak(&v54, &location);
    v39 = (id)objc_msgSend(v34, "observeDefaults:onQueue:withBlock:", v37, MEMORY[0x1E0C80D38], v53);

    if (SBTraitsArbiterOrientationActuationEnabledForRole(CFSTR("SBTraitsParticipantRoleFloatingDock")))
    {
      v40 = -[SBWindow initWithWindowScene:role:debugName:]([SBFloatingDockWindow alloc], "initWithWindowScene:role:debugName:", v16, CFSTR("SBTraitsParticipantRoleFloatingDock"), CFSTR("FloatingDock"));
      -[SBFloatingDockWindow setRootViewController:](v40, "setRootViewController:", v20->_viewController);
      -[SBFloatingDockWindow setClipsToBounds:](v40, "setClipsToBounds:", 0);
    }
    else
    {
      v40 = -[SBMainScreenActiveInterfaceOrientationWindow initWithWindowScene:role:debugName:]([SBOldFloatingDockWindow alloc], "initWithWindowScene:role:debugName:", v16, CFSTR("SBTraitsParticipantRoleFloatingDock"), CFSTR("FloatingDock"));
      -[SBFloatingDockWindow setContentViewController:](v40, "setContentViewController:", v20->_viewController);
      -[SBFloatingDockWindow setPassesTouchesThrough:](v40, "setPassesTouchesThrough:", 1);
    }
    -[SBFloatingDockWindow setOpaque:](v40, "setOpaque:", 0);
    -[SBWindow setHidden:](v40, "setHidden:", 0);
    -[SBFloatingDockWindow setWindowLevel:](v40, "setWindowLevel:", *MEMORY[0x1E0CEBE28] + 5.0 + 20.0);
    objc_storeStrong((id *)&v20->_floatingDockWindow, v40);
    -[SBFloatingDockController _setupStateDumper](v20, "_setupStateDumper");
    v41 = (void *)MEMORY[0x1E0D83110];
    v51[0] = MEMORY[0x1E0C809B0];
    v51[1] = 3221225472;
    v51[2] = __202__SBFloatingDockController__initWithWindowScene_homeScreenContextProvider_applicationController_recentsController_recentsDataStore_layoutStateTransitionCoordinator_appSuggestionManager_analyticsClient___block_invoke_3;
    v51[3] = &unk_1E8EA1F50;
    objc_copyWeak(&v52, &location);
    objc_msgSend(v41, "recipeWithTitle:prepareBlock:toggleAction:cleanupBlock:", CFSTR("Show Sidecar app in Dock"), 0, v51, 0);
    v42 = objc_claimAutoreleasedReturnValue();
    testRecipe = v20->_testRecipe;
    v20->_testRecipe = (PTToggleTestRecipe *)v42;

    objc_msgSend(MEMORY[0x1E0DAA470], "registerTestRecipe:", v20->_testRecipe);
    objc_destroyWeak(&v52);

    objc_destroyWeak(&v54);
    objc_destroyWeak(&location);

  }
  return v20;
}

void __202__SBFloatingDockController__initWithWindowScene_homeScreenContextProvider_applicationController_recentsController_recentsDataStore_layoutStateTransitionCoordinator_appSuggestionManager_analyticsClient___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateFocusAssertion");

}

void __202__SBFloatingDockController__initWithWindowScene_homeScreenContextProvider_applicationController_recentsController_recentsDataStore_layoutStateTransitionCoordinator_appSuggestionManager_analyticsClient___block_invoke_3(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (a2)
  {
    +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "applicationWithBundleIdentifier:", CFSTR("com.apple.sidecar"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(WeakRetained, "setRequestedSuggestedApplication:", v4);
  }
  else
  {
    objc_msgSend(WeakRetained, "setRequestedSuggestedApplication:", 0);
  }

}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  id WeakRetained;
  void *v7;
  id v8;
  objc_super v9;

  -[SBFloatingDockController homeScreenContextProvider](self, "homeScreenContextProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "iconManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removePageStateObserver:", self);

  objc_msgSend(v3, "iconManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeFolderPresentationObserver:", self);

  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  objc_msgSend(WeakRetained, "assistantController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:", self);

  v8 = objc_loadWeakRetained((id *)&self->_layoutStateTransitionCoordinator);
  objc_msgSend(v8, "removeObserver:", self);

  -[BSInvalidatable invalidate](self->_floatingDockStateDumpHandle, "invalidate");
  -[BSInvalidatable invalidate](self->_floatingDockRecursiveHitTestingStateDumpHandle, "invalidate");
  -[BSInvalidatable invalidate](self->_focusAssertion, "invalidate");

  v9.receiver = self;
  v9.super_class = (Class)SBFloatingDockController;
  -[SBFloatingDockController dealloc](&v9, sel_dealloc);
}

- (BOOL)containsPoint:(CGPoint)a3 fromCoordinateSpace:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  BOOL v33;
  CGPoint v35;
  CGRect v36;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  if (-[SBFloatingDockController isFloatingDockPresented](self, "isFloatingDockPresented")
    && -[SBFloatingDockController isFloatingDockFullyPresented](self, "isFloatingDockFullyPresented"))
  {
    -[SBFloatingDockRootViewController viewIfLoaded](self->_viewController, "viewIfLoaded");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "convertPoint:fromCoordinateSpace:", v7, x, y);
      v11 = v10;
      v13 = v12;
      -[SBFloatingDockController floatingDockScreenFrame](self, "floatingDockScreenFrame");
      v15 = v14;
      v17 = v16;
      v19 = v18;
      v21 = v20;
      objc_msgSend(v9, "window");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "screen");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "fixedCoordinateSpace");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "convertRect:fromCoordinateSpace:", v24, v15, v17, v19, v21);
      v26 = v25;
      v28 = v27;
      v30 = v29;
      v32 = v31;

      v36.origin.x = v26;
      v36.origin.y = v28;
      v36.size.width = v30;
      v36.size.height = v32;
      v35.x = v11;
      v35.y = v13;
      v33 = CGRectContainsPoint(v36, v35);
    }
    else
    {
      v33 = 0;
    }

  }
  else
  {
    v33 = 0;
  }

  return v33;
}

void __51__SBFloatingDockController_isFloatingDockSupported__block_invoke()
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "userInterfaceIdiom");

  isFloatingDockSupported___isFloatingDockSupported = (v1 & 0xFFFFFFFFFFFFFFFBLL) == 1;
}

- (BOOL)isFloatingDockPresented
{
  return -[SBFloatingDockRootViewController isFloatingDockPresented](self->_viewController, "isFloatingDockPresented");
}

- (BOOL)isFloatingDockFullyPresented
{
  return -[SBFloatingDockRootViewController isFloatingDockFullyPresented](self->_viewController, "isFloatingDockFullyPresented");
}

- (BOOL)isLibraryPodIconEnabled
{
  return -[SBFloatingDockRootViewController isLibraryPodIconEnabled](self->_viewController, "isLibraryPodIconEnabled");
}

- (BOOL)isGesturePossible
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_activeAssertion);
  v3 = objc_msgSend(WeakRetained, "gesturePossible");

  return v3;
}

- (double)maximumFloatingDockHeight
{
  double result;

  -[SBFloatingDockRootViewController maximumFloatingDockHeight](self->_viewController, "maximumFloatingDockHeight");
  return result;
}

- (double)maximumDockContinuousCornerRadius
{
  double result;

  -[SBFloatingDockRootViewController maximumDockContinuousCornerRadius](self->_viewController, "maximumDockContinuousCornerRadius");
  return result;
}

- (double)floatingDockHeight
{
  double result;

  -[SBFloatingDockRootViewController floatingDockHeight](self->_viewController, "floatingDockHeight");
  return result;
}

- (double)floatingDockHeightForFrame:(CGRect)a3
{
  double result;

  -[SBFloatingDockRootViewController floatingDockHeightForFrame:](self->_viewController, "floatingDockHeightForFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (double)effectiveFloatingDockHeight
{
  double result;

  -[SBFloatingDockRootViewController effectiveFloatingDockHeight](self->_viewController, "effectiveFloatingDockHeight");
  return result;
}

- (double)preferredVerticalMargin
{
  double result;

  -[SBFloatingDockRootViewController preferredVerticalMargin](self->_viewController, "preferredVerticalMargin");
  return result;
}

- (double)floatingDockViewTopMargin
{
  double result;

  -[SBFloatingDockRootViewController floatingDockViewTopMargin](self->_viewController, "floatingDockViewTopMargin");
  return result;
}

- (double)translationFromFullyPresentedFrame
{
  double result;

  -[SBFloatingDockRootViewController translationFromFullyPresentedFrame](self->_viewController, "translationFromFullyPresentedFrame");
  return result;
}

- (CGRect)floatingDockScreenFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[SBFloatingDockRootViewController floatingDockScreenFrame](self->_viewController, "floatingDockScreenFrame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)floatingDockScreenPresentationFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[SBFloatingDockRootViewController floatingDockScreenPresentationFrame](self->_viewController, "floatingDockScreenPresentationFrame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (_UILegibilitySettings)legibilitySettings
{
  return -[SBFloatingDockRootViewController legibilitySettings](self->_viewController, "legibilitySettings");
}

- (void)setLegibilitySettings:(id)a3
{
  -[SBFloatingDockRootViewController setLegibilitySettings:](self->_viewController, "setLegibilitySettings:", a3);
}

- (BOOL)isPresentingLibraryInFloatingDockWindow
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  SBFloatingDockRootViewController *v7;
  BOOL v8;

  -[SBFloatingDockController floatingDockViewController](self, "floatingDockViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isPresentingLibrary"))
  {
    -[SBFloatingDockController windowScene](self, "windowScene");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "modalLibraryController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "libraryViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "parentViewController");
    v7 = (SBFloatingDockRootViewController *)objc_claimAutoreleasedReturnValue();
    v8 = v7 == self->_viewController;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isPresentingFolder
{
  return -[SBFloatingDockRootViewController isPresentingFolder](self->_viewController, "isPresentingFolder");
}

- (SBFolderController)presentedFolderController
{
  return -[SBFloatingDockRootViewController presentedFolderController](self->_viewController, "presentedFolderController");
}

- (SBIconListView)userIconListView
{
  return -[SBFloatingDockRootViewController userIconListView](self->_viewController, "userIconListView");
}

- (SBIconListView)suggestionsIconListView
{
  return -[SBFloatingDockRootViewController suggestionsIconListView](self->_viewController, "suggestionsIconListView");
}

- (SBFloatingDockViewController)floatingDockViewController
{
  -[SBFloatingDockRootViewController loadViewIfNeeded](self->_viewController, "loadViewIfNeeded");
  return -[SBFloatingDockRootViewController floatingDockViewController](self->_viewController, "floatingDockViewController");
}

- (SBApplication)requestedSuggestedApplication
{
  return -[SBFloatingDockRootViewController requestedSuggestedApplication](self->_viewController, "requestedSuggestedApplication");
}

- (void)setRequestedSuggestedApplication:(id)a3
{
  -[SBFloatingDockRootViewController setRequestedSuggestedApplication:](self->_viewController, "setRequestedSuggestedApplication:", a3);
}

- (void)presentFloatingDockIfDismissedAnimated:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  void (**v6)(id, _QWORD);

  v4 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  if (-[SBFloatingDockController _canPresentFloatingDock](self, "_canPresentFloatingDock"))
  {
    -[SBFloatingDockController setWasFloatingDockPresentedByPointer:](self, "setWasFloatingDockPresentedByPointer:", 0);
    -[SBFloatingDockController _presentFloatingDockIfDismissedAnimated:completionHandler:](self, "_presentFloatingDockIfDismissedAnimated:completionHandler:", v4, v6);
  }
  else if (v6)
  {
    v6[2](v6, 0);
  }

}

- (void)dismissFloatingDockUsingKeyCommandIfPresentedAnimated:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v8 = a4;
  -[SBFloatingDockController homeScreenContextProvider](self, "homeScreenContextProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "iconManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "areAnyIconShareSheetsShowing"))
    objc_msgSend(v7, "dismissIconShareSheets");
  -[SBFloatingDockController dismissFloatingDockIfPresentedAnimated:completionHandler:](self, "dismissFloatingDockIfPresentedAnimated:completionHandler:", v4, v8);

}

- (void)dismissFloatingDockIfPresentedAnimated:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  id WeakRetained;
  char v9;
  void (**v10)(id, _QWORD);

  v4 = a3;
  v10 = (void (**)(id, _QWORD))a4;
  -[SBFloatingDockController homeScreenContextProvider](self, "homeScreenContextProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "iconManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_homeScreenTodayViewTransitioning)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_activeAssertion);
    if ((objc_msgSend(WeakRetained, "gesturePossible") & 1) != 0)
    {
      v9 = objc_msgSend(v7, "areAnyIconShareSheetsShowing");

      if ((v9 & 1) == 0)
      {
        -[SBFloatingDockController setWasFloatingDockPresentedByPointer:](self, "setWasFloatingDockPresentedByPointer:", 0);
        if (objc_msgSend(v6, "areAnyIconViewContextMenusShowing"))
          objc_msgSend(v6, "dismissAppIconForceTouchControllers:", 0);
        -[SBFloatingDockController _dismissFloatingDockIfPresentedAnimated:completionHandler:](self, "_dismissFloatingDockIfPresentedAnimated:completionHandler:", v4, v10);
        goto LABEL_10;
      }
    }
    else
    {

    }
  }
  if (v10)
    v10[2](v10, 0);
LABEL_10:

}

- (id)iconViewForIcon:(id)a3 location:(id)a4
{
  return -[SBFloatingDockRootViewController iconViewForIcon:location:](self->_viewController, "iconViewForIcon:location:", a3, a4);
}

- (id)firstIconViewForIcon:(id)a3 inLocations:(id)a4
{
  return -[SBFloatingDockRootViewController firstIconViewForIcon:inLocations:](self->_viewController, "firstIconViewForIcon:inLocations:", a3, a4);
}

- (id)firstIconViewForIcon:(id)a3
{
  return -[SBFloatingDockRootViewController firstIconViewForIcon:](self->_viewController, "firstIconViewForIcon:", a3);
}

- (id)firstIconViewForIcon:(id)a3 excludingLocations:(id)a4
{
  return -[SBFloatingDockRootViewController firstIconViewForIcon:excludingLocations:](self->_viewController, "firstIconViewForIcon:excludingLocations:", a3, a4);
}

- (BOOL)isDisplayingIcon:(id)a3 inLocation:(id)a4
{
  return -[SBFloatingDockRootViewController isDisplayingIcon:inLocation:](self->_viewController, "isDisplayingIcon:inLocation:", a3, a4);
}

- (BOOL)isDisplayingIcon:(id)a3 inLocations:(id)a4
{
  return -[SBFloatingDockRootViewController isDisplayingIcon:inLocations:](self->_viewController, "isDisplayingIcon:inLocations:", a3, a4);
}

- (BOOL)isDisplayingIconView:(id)a3
{
  return -[SBFloatingDockRootViewController isDisplayingIconView:](self->_viewController, "isDisplayingIconView:", a3);
}

- (BOOL)isDisplayingIconView:(id)a3 inLocation:(id)a4
{
  return -[SBFloatingDockRootViewController isDisplayingIconView:inLocation:](self->_viewController, "isDisplayingIconView:inLocation:", a3, a4);
}

- (BOOL)isDisplayingIcon:(id)a3
{
  return -[SBFloatingDockRootViewController isDisplayingIcon:](self->_viewController, "isDisplayingIcon:", a3);
}

- (void)enumerateDisplayedIconViewsUsingBlock:(id)a3
{
  -[SBFloatingDockRootViewController enumerateDisplayedIconViewsUsingBlock:](self->_viewController, "enumerateDisplayedIconViewsUsingBlock:", a3);
}

- (void)enumerateDisplayedIconViewsForIcon:(id)a3 usingBlock:(id)a4
{
  -[SBFloatingDockRootViewController enumerateDisplayedIconViewsForIcon:usingBlock:](self->_viewController, "enumerateDisplayedIconViewsForIcon:usingBlock:", a3, a4);
}

- (BOOL)isPresentingIconLocation:(id)a3
{
  return -[SBFloatingDockRootViewController isPresentingIconLocation:](self->_viewController, "isPresentingIconLocation:", a3);
}

- (NSSet)presentedIconLocations
{
  return -[SBFloatingDockRootViewController presentedIconLocations](self->_viewController, "presentedIconLocations");
}

- (void)presentFolderForIcon:(id)a3 location:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  -[SBFloatingDockRootViewController presentFolderForIcon:location:animated:completion:](self->_viewController, "presentFolderForIcon:location:animated:completion:", a3, a4, a5, a6);
}

- (void)dismissPresentedFolderAnimated:(BOOL)a3 completion:(id)a4
{
  -[SBFloatingDockController dismissPresentedFolderAnimated:withTransitionContext:completion:](self, "dismissPresentedFolderAnimated:withTransitionContext:completion:", a3, 0, a4);
}

- (void)dismissPresentedFolderAnimated:(BOOL)a3 withTransitionContext:(id)a4 completion:(id)a5
{
  -[SBFloatingDockRootViewController dismissPresentedFolderAnimated:withTransitionContext:completion:](self->_viewController, "dismissPresentedFolderAnimated:withTransitionContext:completion:", a3, a4, a5);
}

- (void)dismissPresentedLibraryAnimated:(BOOL)a3 withTransitionContext:(id)a4 completion:(id)a5
{
  -[SBFloatingDockRootViewController dismissPresentedLibraryAnimated:withTransitionContext:completion:](self->_viewController, "dismissPresentedLibraryAnimated:withTransitionContext:completion:", a3, a4, a5);
}

- (void)layoutUserControlledIconListsWithAnimationType:(int64_t)a3 forceRelayout:(BOOL)a4
{
  -[SBFloatingDockRootViewController layoutUserControlledIconListsWithAnimationType:forceRelayout:](self->_viewController, "layoutUserControlledIconListsWithAnimationType:forceRelayout:", a3, a4);
}

- (BOOL)shouldShowCloseBoxForIconView:(id)a3 proposedValue:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  v6 = a3;
  objc_msgSend(v6, "location");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("SBIconLocationFloatingDockSuggestions")))
  {
    objc_msgSend(v6, "continuityInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      a4 = 0;
    }
    else
    {
      objc_msgSend(v6, "icon");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "applicationBundleID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBFloatingDockController requestedSuggestedApplication](self, "requestedSuggestedApplication");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "bundleIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v10, "isEqualToString:", v12);

      a4 = v13 ^ 1;
    }
  }

  return a4;
}

- (BOOL)handlePromptingUserToUninstallIcon:(id)a3 location:(id)a4
{
  id v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_msgSend(a4, "isEqualToString:", CFSTR("SBIconLocationFloatingDockSuggestions"));
  if (v6)
  {
    objc_msgSend(v5, "application");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = CFSTR("SBFloatingDockSuggestionsDeletedNotificationBundleIdentifierKey");
      v9 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(v7, "bundleIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setWithObjects:", v10, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("SBFloatingDockSuggestionsDeletedNotification"), 0, v12);
    }
    else
    {
      if (!objc_msgSend(v5, "isBookmarkIcon"))
      {
LABEL_7:

        goto LABEL_8;
      }
      objc_msgSend(v5, "webClip");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[SBWebApplication _webAppIdentifierFromWebClipIdentifier:](SBWebApplication, "_webAppIdentifierFromWebClipIdentifier:", v13);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", v10, 0, CFSTR("SBFloatingDockSuggestionsDeletedNotificationWebAppIdentifierKey"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "postNotificationName:object:userInfo:", CFSTR("SBFloatingDockSuggestionsDeletedNotification"), 0, v14);

    }
    goto LABEL_7;
  }
LABEL_8:

  return v6;
}

- (void)resetRecentsAndSuggestions
{
  id v2;

  -[SBFloatingDockRootViewController suggestionsModel](self->_viewController, "suggestionsModel");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resetRecentsAndSuggestions");

}

- (void)_addFloatingDockWindowLevelAssertion:(id)a3
{
  id v4;
  Class *v5;
  id *v6;
  Class v7;
  objc_class *v8;
  NSObject *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = &self->super.isa + objc_msgSend(v4, "priority");
  v7 = v5[16];
  v6 = (id *)(v5 + 16);
  v8 = v7;
  if (!v8)
  {
    v8 = (objc_class *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3868]), "initWithOptions:", 517);
    objc_storeStrong(v6, v8);
  }
  SBLogDock();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543362;
    v11 = v4;
    _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "adding floating dock window level assertion: %{public}@", (uint8_t *)&v10, 0xCu);
  }

  -[objc_class addPointer:](v8, "addPointer:", v4);
  -[SBFloatingDockController _recalculateWindowLevelForWindowLevelAssertions](self, "_recalculateWindowLevelForWindowLevelAssertions");

}

- (void)_removeFloatingDockWindowLevelAssertion:(id)a3
{
  id v4;
  uint64_t v5;
  NSPointerArray **floatingDockWindowLevelAssertionsByPriority;
  NSPointerArray *v7;
  unint64_t v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSPointerArray *v24;
  int v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "priority");
  floatingDockWindowLevelAssertionsByPriority = self->_floatingDockWindowLevelAssertionsByPriority;
  v7 = self->_floatingDockWindowLevelAssertionsByPriority[v5];
  if (v7)
  {
    v8 = -[SBFloatingDockController _indexOfPointerArray:ofObject:](self, "_indexOfPointerArray:ofObject:", v7, v4);
    SBLogDock();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[SBFloatingDockController _removeFloatingDockWindowLevelAssertion:].cold.1((uint64_t)v4, v10, v11, v12, v13, v14, v15, v16);

    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v25 = 138543362;
        v26 = v4;
        _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "removing floating dock window level assertion: %{public}@", (uint8_t *)&v25, 0xCu);
      }

      -[NSPointerArray removePointerAtIndex:](v7, "removePointerAtIndex:", v8);
      if (!-[NSPointerArray count](v7, "count"))
      {
        v24 = floatingDockWindowLevelAssertionsByPriority[v5];
        floatingDockWindowLevelAssertionsByPriority[v5] = 0;

      }
      -[SBFloatingDockController _recalculateWindowLevelForWindowLevelAssertions](self, "_recalculateWindowLevelForWindowLevelAssertions");
    }
  }
  else
  {
    SBLogDock();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[SBFloatingDockController _removeFloatingDockWindowLevelAssertion:].cold.1((uint64_t)v4, v17, v18, v19, v20, v21, v22, v23);

  }
}

- (void)_clearGestureAssertion
{
  SBFloatingDockBehaviorAssertion *activeGestureFloatingDockBehaviorAssertion;
  NSPointerArray *v4;

  activeGestureFloatingDockBehaviorAssertion = self->_activeGestureFloatingDockBehaviorAssertion;
  if (activeGestureFloatingDockBehaviorAssertion)
  {
    self->_activeGestureFloatingDockBehaviorAssertion = 0;

    v4 = self->_floatingDockBehaviorAssertionsByLevel[11];
    self->_floatingDockBehaviorAssertionsByLevel[11] = 0;

  }
}

- (void)_addFloatingDockBehaviorAssertion:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  Class *v8;
  id *v9;
  Class v10;
  objc_class *v11;
  NSObject *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = &self->super.isa + objc_msgSend(v6, "level");
  v10 = v8[3];
  v9 = (id *)(v8 + 3);
  v11 = v10;
  if (!v11)
  {
    v11 = (objc_class *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3868]), "initWithOptions:", 517);
    objc_storeStrong(v9, v11);
  }
  SBLogDock();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138543362;
    v14 = v6;
    _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "adding floating dock behavior assertion: %{public}@", (uint8_t *)&v13, 0xCu);
  }

  -[objc_class addPointer:](v11, "addPointer:", v6);
  -[SBFloatingDockController _clearGestureAssertion](self, "_clearGestureAssertion");
  -[SBFloatingDockController _evaluateAssertions:interactive:withCompletion:](self, "_evaluateAssertions:interactive:withCompletion:", 0, 0, v7);

}

- (void)_removeFloatingDockBehaviorAssertion:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSPointerArray **floatingDockBehaviorAssertionsByLevel;
  NSPointerArray *v10;
  unint64_t v11;
  unint64_t v12;
  NSObject *v13;
  NSPointerArray *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "level");
  floatingDockBehaviorAssertionsByLevel = self->_floatingDockBehaviorAssertionsByLevel;
  v10 = self->_floatingDockBehaviorAssertionsByLevel[v8];
  if (v10)
  {
    v11 = -[SBFloatingDockController _indexOfPointerArray:ofObject:](self, "_indexOfPointerArray:ofObject:", v10, v6);
    if (v11 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v12 = v11;
      SBLogDock();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v22 = 138543362;
        v23 = v6;
        _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_DEFAULT, "removing floating dock behavior assertion: %{public}@", (uint8_t *)&v22, 0xCu);
      }

      -[NSPointerArray removePointerAtIndex:](v10, "removePointerAtIndex:", v12);
      if (!-[NSPointerArray count](v10, "count"))
      {
        v14 = floatingDockBehaviorAssertionsByLevel[v8];
        floatingDockBehaviorAssertionsByLevel[v8] = 0;

      }
      -[SBFloatingDockController _clearGestureAssertion](self, "_clearGestureAssertion");
    }
  }
  else
  {
    SBLogDock();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[SBFloatingDockController _removeFloatingDockBehaviorAssertion:withCompletion:].cold.1((uint64_t)v6, v15, v16, v17, v18, v19, v20, v21);

  }
  -[SBFloatingDockController _evaluateAssertions:interactive:withCompletion:](self, "_evaluateAssertions:interactive:withCompletion:", 1, 0, v7);

}

- (void)_updateFloatingDockBehaviorAssertionsInteractive:(BOOL)a3 completion:(id)a4
{
  -[SBFloatingDockController _evaluateAssertions:interactive:withCompletion:](self, "_evaluateAssertions:interactive:withCompletion:", 2, a3, a4);
}

- (unint64_t)_indexOfPointerArray:(id)a3 ofObject:(void *)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v5 = a3;
  v6 = objc_msgSend(v5, "count");
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    while ((void *)objc_msgSend(v5, "pointerAtIndex:", v8) != a4)
    {
      if (v7 == ++v8)
        goto LABEL_5;
    }
  }
  else
  {
LABEL_5:
    v8 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v8;
}

- (void)_deriveActiveAssertion:(id *)a3 dockProgress:(double *)a4
{
  unint64_t v6;
  __CFString *v7;
  NSPointerArray *v8;
  NSPointerArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __CFString *v13;
  uint64_t i;
  __CFString *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSPointerArray **floatingDockBehaviorAssertionsByLevel;
  __CFString *v23;
  unint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  __CFString *v30;
  _BYTE v31[128];
  uint64_t v32;

  v6 = 0;
  v32 = *MEMORY[0x1E0C80C00];
  floatingDockBehaviorAssertionsByLevel = self->_floatingDockBehaviorAssertionsByLevel;
  v7 = &stru_1E8EC7EC0;
  do
  {
    v8 = floatingDockBehaviorAssertionsByLevel[v6];
    v9 = v8;
    v23 = v7;
    v24 = v6;
    if (v8)
    {
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v10 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v26;
        v13 = &stru_1E8EC7EC0;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            v15 = v13;
            if (*(_QWORD *)v26 != v12)
              objc_enumerationMutation(v9);
            v16 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("assertion: %@"), v16);
            v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

            if (v16)
            {
              if (a4)
              {
                objc_msgSend(v16, "progress");
                *(_QWORD *)a4 = v17;
              }
              if (a3)
                *a3 = objc_retainAutorelease(v16);
            }
          }
          v11 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
        }
        while (v11);
      }
      else
      {
        v13 = &stru_1E8EC7EC0;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("none"));
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    v18 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v24);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    SBFloatingDockBehaviorLevelDescription(v24);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", CFSTR("level #%@ (%@) - %@\n%@"), v19, v20, v13, v23);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v6 = v24 + 1;
  }
  while (v24 != 12);
  SBLogDock();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v30 = v7;
    _os_log_impl(&dword_1D0540000, v21, OS_LOG_TYPE_DEFAULT, "Floating dock behavior assertions...\n%{public}@", buf, 0xCu);
  }

}

- (void)_evaluateAssertions:(unint64_t)a3 interactive:(BOOL)a4 withCompletion:(id)a5
{
  _BOOL8 v5;
  id v8;
  void (**v9)(_QWORD, _QWORD);
  id WeakRetained;
  id v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  SBFloatingDockRootViewController *viewController;
  double v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  id v42;
  _QWORD v43[5];
  id v44;
  uint64_t v45;

  v5 = a4;
  v8 = a5;
  *(double *)&v45 = 1.0;
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __75__SBFloatingDockController__evaluateAssertions_interactive_withCompletion___block_invoke;
  v43[3] = &unk_1E8E9F230;
  v43[4] = self;
  v44 = v8;
  v9 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17E5550](v43);
  if (a3 == 2)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_activeAssertion);
    v11 = WeakRetained;
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained, "progress");
      v13 = *(double *)&v12;
      v45 = v12;
      v14 = objc_msgSend(v11, "isAnimated");
    }
    else
    {
      SBLogDock();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        -[SBFloatingDockController _evaluateAssertions:interactive:withCompletion:].cold.1(v16, v17, v18, v19, v20, v21, v22, v23);

      objc_msgSend(0, "progress");
      v13 = *(double *)&v24;
      v45 = v24;
      v14 = 1;
    }
    viewController = self->_viewController;
    v26 = v13;
    goto LABEL_28;
  }
  v42 = 0;
  -[SBFloatingDockController _deriveActiveAssertion:dockProgress:](self, "_deriveActiveAssertion:dockProgress:", &v42, &v45);
  v11 = v42;
  objc_storeWeak((id *)&self->_activeAssertion, v11);
  if (v11)
  {
    v15 = objc_msgSend(v11, "isAnimated");
  }
  else
  {
    SBLogDock();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
      -[SBFloatingDockController _evaluateAssertions:interactive:withCompletion:].cold.1(v27, v28, v29, v30, v31, v32, v33, v34);

    v15 = 1;
  }
  -[SBFloatingDockRootViewController presentedProgress](self->_viewController, "presentedProgress");
  v36 = v35;
  if (a3 == 3)
  {
LABEL_16:
    if (-[SBFloatingDockRootViewController isFloatingDockFullyPresented](self->_viewController, "isFloatingDockFullyPresented")|| !BSFloatIsOne())
    {
      if (!-[SBFloatingDockRootViewController isFloatingDockPresented](self->_viewController, "isFloatingDockPresented")|| !BSFloatIsZero())
      {
        goto LABEL_32;
      }
      *(double *)&v45 = 0.0;
    }
    else
    {
      *(double *)&v45 = 1.0;
    }
    goto LABEL_24;
  }
  if (a3 != 1)
  {
    if (a3)
    {
      if ((BSFloatIsOne() & 1) != 0 || (BSFloatIsZero() & 1) != 0)
        goto LABEL_32;
      goto LABEL_24;
    }
    goto LABEL_16;
  }
LABEL_24:
  if (!-[SBFloatingDockRootViewController isTransitioningPresentation](self->_viewController, "isTransitioningPresentation"))goto LABEL_27;
  if (v36 >= 1.0)
    goto LABEL_27;
  -[SBFloatingDockRootViewController view](self->_viewController, "view");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "window");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "interfaceOrientation");
  v40 = objc_msgSend((id)SBApp, "activeInterfaceOrientation");

  if (v39 == v40)
  {
LABEL_27:
    viewController = self->_viewController;
    v26 = *(double *)&v45;
    v14 = v15;
LABEL_28:
    -[SBFloatingDockRootViewController setPresentationProgress:animated:interactive:withCompletion:](viewController, "setPresentationProgress:animated:interactive:withCompletion:", v14, v5, v9, v26);
    goto LABEL_34;
  }
  SBLogDock();
  v41 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
    -[SBFloatingDockController _evaluateAssertions:interactive:withCompletion:].cold.2(v41);

LABEL_32:
  if (v9)
    v9[2](v9, 1);
LABEL_34:

  -[SBFloatingDockController _updateFocusAssertion](self, "_updateFocusAssertion");
}

uint64_t __75__SBFloatingDockController__evaluateAssertions_interactive_withCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_updateFocusAssertion");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

- (void)_updateFocusAssertion
{
  _BOOL4 v3;
  _BOOL4 v4;
  _BOOL4 v5;
  void *v6;
  BSInvalidatable *focusAssertion;
  void *v8;
  void *v9;
  void *v10;
  BSInvalidatable *v11;
  BSInvalidatable *v12;
  void *v13;

  v3 = -[SBFloatingDockController _isActiveAssertionInDesiredLevel](self, "_isActiveAssertionInDesiredLevel");
  v4 = -[SBFloatingDockRootViewController isPresentingFolder](self->_viewController, "isPresentingFolder");
  v5 = -[SBFloatingDockRootViewController isFloatingDockPresented](self->_viewController, "isFloatingDockPresented");
  -[SBFloatingDockController windowScene](self, "windowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  focusAssertion = self->_focusAssertion;
  if (v3 && (v4 || v5))
  {
    if (!focusAssertion && v6)
    {
      v13 = v6;
      +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "keyboardFocusController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[SBKeyboardFocusLockReason floatingDock](SBKeyboardFocusLockReason, "floatingDock");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "focusLockSpringBoardWindowScene:forReason:", v13, v10);
      v11 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
      v12 = self->_focusAssertion;
      self->_focusAssertion = v11;

LABEL_8:
      v6 = v13;
    }
  }
  else if (focusAssertion)
  {
    v13 = v6;
    -[BSInvalidatable invalidate](focusAssertion, "invalidate");
    v8 = self->_focusAssertion;
    self->_focusAssertion = 0;
    goto LABEL_8;
  }

}

- (BOOL)_isActiveAssertionInDesiredLevel
{
  id WeakRetained;
  void *v4;
  id v5;
  int v6;
  char v7;
  unint64_t v8;
  unint64_t v9;
  BOOL v10;
  unint64_t v11;
  uint64_t v12;

  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  objc_msgSend(WeakRetained, "switcherController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_loadWeakRetained((id *)&self->_activeAssertion);
  v6 = objc_msgSend(v4, "isChamoisWindowingUIEnabled");
  v7 = v6;
  if (v6)
    v8 = 11;
  else
    v8 = 5;
  v9 = objc_msgSend(v5, "level");
  v10 = v9 >= v8;
  if ((v7 & 1) == 0)
  {
    v11 = v9;
    v12 = objc_msgSend(v4, "unlockedEnvironmentMode");
    v10 = v11 >= v8 || v12 == 3;
  }

  return v10;
}

- (double)_dockProgressForHoverTranslation:(double)a3
{
  double result;

  -[SBFloatingDockController floatingDockViewTopMargin](self, "floatingDockViewTopMargin");
  -[SBFloatingDockController floatingDockHeight](self, "floatingDockHeight");
  BSUIConstrainValueToIntervalWithRubberBand();
  return result;
}

- (void)_handleDismissFloatingDockHoverGesture:(id)a3
{
  _BOOL4 v4;
  _BOOL4 v5;
  id WeakRetained;
  int v7;
  void *v8;
  char v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;

  v16 = a3;
  v4 = -[SBFloatingDockController isFloatingDockFullyPresented](self, "isFloatingDockFullyPresented");
  v5 = -[SBFloatingDockController wasFloatingDockPresentedByPointer](self, "wasFloatingDockPresentedByPointer");
  WeakRetained = objc_loadWeakRetained((id *)&self->_activeAssertion);
  v7 = objc_msgSend(WeakRetained, "gesturePossible");

  -[SBFloatingDockController homeScreenContextProvider](self, "homeScreenContextProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "areAnyIconViewContextMenusShowing");
  if (v4 && v5 && v7 && (v9 & 1) == 0)
  {
    -[SBFloatingDockRootViewController view](self->_viewController, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _UISystemGestureLocationInView();
    v12 = v11;
    objc_msgSend(v10, "frame");
    v14 = v13;
    -[SBFloatingDockRootViewController maximumFloatingDockHeight](self->_viewController, "maximumFloatingDockHeight");
    if (v12 < v14 + v15 * -1.5)
      -[SBFloatingDockController dismissFloatingDockIfPresentedAnimated:completionHandler:](self, "dismissFloatingDockIfPresentedAnimated:completionHandler:", 1, 0);

  }
}

- (void)handlePresentFloatingDockHoverGesture:(id)a3
{
  id v4;
  SBFloatingDockRootViewController *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  SBFloatingDockRootViewController *v13;
  void (**v14)(_QWORD);
  uint64_t v15;
  _QWORD v16[5];
  id v17;
  SBFloatingDockRootViewController *v18;

  v4 = a3;
  v5 = self->_viewController;
  -[SBFloatingDockRootViewController delegate](v5, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFloatingDockRootViewController view](v5, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "translationInView:", v7);
  v9 = v8;

  -[SBFloatingDockController _dockProgressForHoverTranslation:](self, "_dockProgressForHoverTranslation:", v9);
  v11 = v10;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __66__SBFloatingDockController_handlePresentFloatingDockHoverGesture___block_invoke;
  v16[3] = &unk_1E8E9E270;
  v16[4] = self;
  v12 = v6;
  v17 = v12;
  v13 = v5;
  v18 = v13;
  v14 = (void (**)(_QWORD))MEMORY[0x1D17E5550](v16);
  v15 = objc_msgSend(v4, "state");
  switch(v15)
  {
    case 4:
      if (!-[SBFloatingDockRootViewController isFloatingDockPresented](v13, "isFloatingDockPresented") || v11 <= 1.0)
        goto LABEL_13;
      goto LABEL_12;
    case 3:
      if (objc_msgSend(v4, "endReason") != 3)
      {
        if (!-[SBFloatingDockRootViewController isFloatingDockPresented](v13, "isFloatingDockPresented") || v11 <= 0.0)
          break;
        if (v11 < 0.25)
        {
LABEL_13:
          -[SBFloatingDockController dismissFloatingDockIfPresentedAnimated:completionHandler:](self, "dismissFloatingDockIfPresentedAnimated:completionHandler:", 1, 0);
          break;
        }
      }
LABEL_12:
      v14[2](v14);
      break;
    case 2:
      objc_msgSend(v12, "floatingDockRootViewController:modifyProgress:interactive:completion:", v13, 1, 0, v11);
      break;
  }

}

uint64_t __66__SBFloatingDockController_handlePresentFloatingDockHoverGesture___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setWasFloatingDockPresentedByPointer:", 1);
  return objc_msgSend(*(id *)(a1 + 40), "floatingDockRootViewController:modifyProgress:interactive:completion:", *(_QWORD *)(a1 + 48), 0, 0, 1.0);
}

- (void)registerForWindowScene:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[SBFloatingDockController homeScreenContextProvider](self, "homeScreenContextProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "iconManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFloatingDockController floatingDockViewController](self, "floatingDockViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isMainDisplayWindowScene"))
    objc_msgSend(v5, "setFloatingDockViewController:", v6);
  else
    objc_msgSend(v5, "configureFloatingDockViewController:", v6);
  objc_msgSend(v11, "systemGestureManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFloatingDockController dismissFloatingDockSystemGestureRecognizer](self, "dismissFloatingDockSystemGestureRecognizer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addGestureRecognizer:withType:", v8, 38);

  -[SBFloatingDockController presentFloatingDockIndirectPanGestureRecognizer](self, "presentFloatingDockIndirectPanGestureRecognizer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addGestureRecognizer:withType:", v9, 39);

  -[SBFloatingDockController dismissFloatingDockHoverGestureRecognizer](self, "dismissFloatingDockHoverGestureRecognizer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addGestureRecognizer:withType:", v10, 40);

}

- (void)_presentFloatingDockIfDismissedAnimated:(BOOL)a3 completionHandler:(id)a4
{
  void (**v5)(id, _QWORD);

  v5 = (void (**)(id, _QWORD))a4;
  if (-[SBFloatingDockRootViewController isFloatingDockPresented](self->_viewController, "isFloatingDockPresented"))
  {
    if (v5)
      v5[2](v5, 0);
  }
  else
  {
    -[SBFloatingDockController floatingDockRootViewController:modifyProgress:interactive:completion:](self, "floatingDockRootViewController:modifyProgress:interactive:completion:", self->_viewController, 0, v5, 1.0);
  }

}

- (void)_dismissFloatingDockIfPresentedAnimated:(BOOL)a3 completionHandler:(id)a4
{
  void (**v5)(id, _QWORD);

  v5 = (void (**)(id, _QWORD))a4;
  if (-[SBFloatingDockRootViewController isFloatingDockPresented](self->_viewController, "isFloatingDockPresented"))
  {
    -[SBFloatingDockController floatingDockRootViewController:modifyProgress:interactive:completion:](self, "floatingDockRootViewController:modifyProgress:interactive:completion:", self->_viewController, 0, v5, 0.0);
  }
  else if (v5)
  {
    v5[2](v5, 0);
  }

}

- (BOOL)_allowGestureRecognizers
{
  id WeakRetained;
  BOOL v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_activeAssertion);
  if (objc_msgSend(WeakRetained, "gesturePossible"))
    v4 = !self->_homeScreenTodayViewTransitioning;
  else
    v4 = 0;

  return v4;
}

- (void)floatingDockRootViewController:(id)a3 willChangeToHeight:(double)a4 interactive:(BOOL)a5
{
  _BOOL8 v5;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v5 = a5;
  v13[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = CFSTR("SBFloatingDockControllerHeight");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = CFSTR("SBFloatingDockControllerHeightChangeInteractive");
  v13[0] = v9;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("SBFloatingDockControllerHeightWillChangeNotification"), self, v11);

}

- (void)floatingDockRootViewController:(id)a3 didChangeToFrame:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  _QWORD v13[2];

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v13[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = CFSTR("SBFloatingDockControllerFrame");
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", x, y, width, height);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postNotificationName:object:userInfo:", CFSTR("SBFloatingDockControllerFrameDidChangeNotification"), self, v11);

}

- (void)floatingDockRootViewController:(id)a3 floatingDockWantsToBePresented:(BOOL)a4
{
  if (a4)
    -[SBFloatingDockController presentFloatingDockIfDismissedAnimated:completionHandler:](self, "presentFloatingDockIfDismissedAnimated:completionHandler:", 1, 0);
  else
    -[SBFloatingDockController dismissFloatingDockIfPresentedAnimated:completionHandler:](self, "dismissFloatingDockIfPresentedAnimated:completionHandler:", 1, 0);
}

- (void)floatingDockRootViewController:(id)a3 modifyProgress:(double)a4 interactive:(BOOL)a5 completion:(id)a6
{
  SBFloatingDockBehaviorAssertion *activeGestureFloatingDockBehaviorAssertion;
  _BOOL8 v8;
  SBFloatingDockBehaviorAssertion *v9;
  SBFloatingDockBehaviorAssertion **p_activeAssertion;
  id v12;
  id WeakRetained;
  uint64_t v14;
  SBFloatingDockBehaviorAssertion *v15;
  SBFloatingDockBehaviorAssertion *v16;

  activeGestureFloatingDockBehaviorAssertion = self->_activeGestureFloatingDockBehaviorAssertion;
  if (activeGestureFloatingDockBehaviorAssertion)
  {
    v8 = a5;
    v16 = (SBFloatingDockBehaviorAssertion *)a6;
    -[SBFloatingDockBehaviorAssertion modifyProgress:interactive:completion:](activeGestureFloatingDockBehaviorAssertion, "modifyProgress:interactive:completion:", v8, v16, a4);
    v9 = v16;
  }
  else
  {
    p_activeAssertion = &self->_activeAssertion;
    v12 = a6;
    WeakRetained = objc_loadWeakRetained((id *)p_activeAssertion);
    v14 = objc_msgSend(WeakRetained, "gesturePossible");

    v15 = -[SBFloatingDockBehaviorAssertion initWithFloatingDockController:visibleProgress:animated:gesturePossible:atLevel:reason:withCompletion:]([SBFloatingDockBehaviorAssertion alloc], "initWithFloatingDockController:visibleProgress:animated:gesturePossible:atLevel:reason:withCompletion:", self, 1, v14, 11, CFSTR("active gesture"), v12, a4);
    v9 = self->_activeGestureFloatingDockBehaviorAssertion;
    self->_activeGestureFloatingDockBehaviorAssertion = v15;
  }

}

- (void)floatingDockRootViewController:(id)a3 willPerformTransitionWithFolder:(id)a4 presenting:(BOOL)a5 withTransitionCoordinator:(id)a6
{
  -[SBFloatingDockController _handleTransitionForFolder:atLevel:presenting:withTransitionCoordinator:](self, "_handleTransitionForFolder:atLevel:presenting:withTransitionCoordinator:", a4, 1, a5, a6);
}

- (void)floatingDockRootViewControllerDidEndPresentationTransition:(id)a3
{
  -[SBFloatingDockController _evaluateAssertions:interactive:withCompletion:](self, "_evaluateAssertions:interactive:withCompletion:", 3, 0, 0);
}

- (double)minimumHomeScreenScaleForFloatingDockRootViewController:(id)a3
{
  void *v4;
  double v5;
  double v6;

  -[SBFloatingDockController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0.0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "minimumHomeScreenScaleForFloatingDockController:", self);
    v5 = v6;
  }

  return v5;
}

- (id)libraryContainerViewControllerForFloatingDockRootViewController:(id)a3
{
  void *v4;
  void *v5;
  SBFloatingDockRootViewController *v6;

  -[UIWindow _sbWindowScene](self->_floatingDockWindow, "_sbWindowScene", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isMainDisplayWindowScene"))
  {
    -[SBFloatingDockController homeScreenContextProvider](self, "homeScreenContextProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "homeScreenViewController");
    v6 = (SBFloatingDockRootViewController *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = self->_viewController;
  }

  return v6;
}

- (BOOL)isDefaultLibraryContainerViewControllerForegroundForFloatingDockRootViewController:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;

  -[UIWindow _sbWindowScene](self->_floatingDockWindow, "_sbWindowScene", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isMainDisplayWindowScene"))
  {
    objc_msgSend(v3, "switcherController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "unlockedEnvironmentMode") == 1;

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (id)foregroundLibraryContainerViewControllerForFloatingDockRootViewController:(id)a3
{
  return self->_viewController;
}

- (id)floatingDockRootViewController:(id)a3 acquireOrderFloatingDockContainerBeforeLibraryAssertionForReason:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSHashTable *rootViewControllerOrderingAssertions;
  NSHashTable *v17;
  NSHashTable *v18;
  NSHashTable *v19;
  id v20;
  id v21;
  NSHashTable *v22;
  SBFloatingDockWindowLevelAssertion *v23;
  SBFloatingDockWindowLevelAssertion *v24;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t);
  void *v29;
  NSHashTable *v30;
  id v31;

  v6 = a3;
  v7 = a4;
  -[SBFloatingDockController homeScreenContextProvider](self, "homeScreenContextProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "homeScreenViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "floatingDockViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "libraryViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "parentViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12 == v9)
  {
    v24 = [SBFloatingDockWindowLevelAssertion alloc];
    v23 = -[SBFloatingDockWindowLevelAssertion initWithFloatingDockController:priority:level:reason:](v24, "initWithFloatingDockController:priority:level:reason:", self, 4, v7, *MEMORY[0x1E0CEBE28] + -2.5);
  }
  else
  {
    objc_msgSend(v6, "floatingDockViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "superview");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "sendSubviewToBack:", v14);

    rootViewControllerOrderingAssertions = self->_rootViewControllerOrderingAssertions;
    if (!rootViewControllerOrderingAssertions)
    {
      objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
      v17 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
      v18 = self->_rootViewControllerOrderingAssertions;
      self->_rootViewControllerOrderingAssertions = v17;

      rootViewControllerOrderingAssertions = self->_rootViewControllerOrderingAssertions;
    }
    v19 = rootViewControllerOrderingAssertions;
    v20 = objc_alloc(MEMORY[0x1E0D01868]);
    v26 = MEMORY[0x1E0C809B0];
    v27 = 3221225472;
    v28 = __124__SBFloatingDockController_floatingDockRootViewController_acquireOrderFloatingDockContainerBeforeLibraryAssertionForReason___block_invoke;
    v29 = &unk_1E8EA8488;
    v30 = v19;
    v31 = v14;
    v21 = v14;
    v22 = v19;
    v23 = (SBFloatingDockWindowLevelAssertion *)objc_msgSend(v20, "initWithIdentifier:forReason:invalidationBlock:", CFSTR("SBFloatingDockRootViewController-subview-ordering"), v7, &v26);

    -[NSHashTable addObject:](v22, "addObject:", v23, v26, v27, v28, v29);
    v7 = v21;
  }

  return v23;
}

void __124__SBFloatingDockController_floatingDockRootViewController_acquireOrderFloatingDockContainerBeforeLibraryAssertionForReason___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "removeObject:", a2);
  if (!objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    objc_msgSend(*(id *)(a1 + 40), "superview");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bringSubviewToFront:", *(_QWORD *)(a1 + 40));

  }
}

- (id)iconViewMap
{
  SBHReusableViewMap *iconViewMap;
  SBHReusableViewMap *v4;
  SBHReusableViewMap *v5;

  iconViewMap = self->_iconViewMap;
  if (!iconViewMap)
  {
    v4 = (SBHReusableViewMap *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAA508]), "initWithDelegate:", self);
    v5 = self->_iconViewMap;
    self->_iconViewMap = v4;

    iconViewMap = self->_iconViewMap;
  }
  return iconViewMap;
}

- (id)dequeueReusableIconViewOfClass:(Class)a3
{
  void *v4;
  void *v5;

  -[SBFloatingDockController iconViewMap](self, "iconViewMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dequeueReusableViewOfClass:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)recycleIconView:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBFloatingDockController iconViewMap](self, "iconViewMap");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recycleView:", v4);

}

- (BOOL)isIconViewRecycled:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[SBFloatingDockController iconViewMap](self, "iconViewMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isViewRecycled:", v4);

  return v6;
}

- (void)configureIconView:(id)a3 forIcon:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[SBFloatingDockController homeScreenContextProvider](self, "homeScreenContextProvider");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "iconManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "configureIconView:forIcon:", v7, v6);

}

- (unint64_t)viewMap:(id)a3 maxRecycledViewsOfClass:(Class)a4
{
  return 3;
}

- (id)recycledViewsContainerProviderForViewMap:(id)a3
{
  return self->_floatingDockWindow;
}

- (BOOL)viewMap:(id)a3 shouldRecycleView:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  char v8;

  v5 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SBFloatingDockController homeScreenContextProvider](self, "homeScreenContextProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "iconManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "shouldRecycleIconView:", v5);

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (void)iconManager:(id)a3 willPerformTransitionWithFolder:(id)a4 presenting:(BOOL)a5 withTransitionCoordinator:(id)a6
{
  _BOOL8 v7;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v7 = a5;
  v12 = a4;
  v9 = a6;
  -[UIWindow _sbWindowScene](self->_floatingDockWindow, "_sbWindowScene");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_sbWindowScene");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 == v11)
    -[SBFloatingDockController _handleTransitionForFolder:atLevel:presenting:withTransitionCoordinator:](self, "_handleTransitionForFolder:atLevel:presenting:withTransitionCoordinator:", v12, 0, v7, v9);

}

- (void)_handleTransitionForFolder:(id)a3 atLevel:(unint64_t)a4 presenting:(BOOL)a5 withTransitionCoordinator:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  id WeakRetained;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  unint64_t v17;
  BOOL v18;

  v7 = a5;
  v10 = a3;
  v11 = a6;
  if (v7)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
    objc_msgSend(WeakRetained, "switcherController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dismissMainSwitcherWithSource:animated:", 24, 1);

  }
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __100__SBFloatingDockController__handleTransitionForFolder_atLevel_presenting_withTransitionCoordinator___block_invoke;
  v15[3] = &unk_1E8EB1A18;
  v18 = v7;
  v15[4] = self;
  v16 = v10;
  v17 = a4;
  v14 = v10;
  objc_msgSend(v11, "animateAlongsideTransition:completion:", v15, 0);

}

void __100__SBFloatingDockController__handleTransitionForFolder_atLevel_presenting_withTransitionCoordinator___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  char v5;
  void *v6;
  id v7;

  v3 = a2;
  v4 = objc_msgSend(v3, "isCancelled");
  v5 = objc_msgSend(v3, "isInteractive");

  if ((v5 & 1) == 0)
  {
    v6 = *(void **)(a1 + 32);
    if (v4 == (*(_BYTE *)(a1 + 56) != 0))
    {
      objc_msgSend(*(id *)(a1 + 32), "_configureFloatingDockBehaviorAssertionForOpenFolder:atLevel:", 0, *(_QWORD *)(a1 + 48));
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "folder");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_configureFloatingDockBehaviorAssertionForOpenFolder:atLevel:", v7, *(_QWORD *)(a1 + 48));

    }
  }
}

- (void)_configureFloatingDockBehaviorAssertionForOpenFolder:(id)a3 atLevel:(unint64_t)a4
{
  id v6;
  SBFloatingDockBehaviorAssertion *openFolderOverHomeScreenFloatingDockBehaviorAssertion;
  SBFloatingDockBehaviorAssertion *v8;
  SBFloatingDockBehaviorAssertion *v9;
  SBFloatingDockBehaviorAssertion *openFolderOverSceneLayoutFloatingDockBehaviorAssertion;
  SBFloatingDockBehaviorAssertion *v11;
  id v12;

  v6 = a3;
  v12 = v6;
  if (a4 == 1)
  {
    openFolderOverSceneLayoutFloatingDockBehaviorAssertion = self->_openFolderOverSceneLayoutFloatingDockBehaviorAssertion;
    if (v6)
    {
      if (!openFolderOverSceneLayoutFloatingDockBehaviorAssertion)
      {
        v11 = -[SBFloatingDockBehaviorAssertion initWithFloatingDockController:visibleProgress:animated:gesturePossible:atLevel:reason:withCompletion:]([SBFloatingDockBehaviorAssertion alloc], "initWithFloatingDockController:visibleProgress:animated:gesturePossible:atLevel:reason:withCompletion:", self, 1, 1, 8, CFSTR("open folder over scene layout"), 0, 0.0);
        v9 = self->_openFolderOverSceneLayoutFloatingDockBehaviorAssertion;
        self->_openFolderOverSceneLayoutFloatingDockBehaviorAssertion = v11;
        goto LABEL_13;
      }
    }
    else if (openFolderOverSceneLayoutFloatingDockBehaviorAssertion)
    {
      -[SBFloatingDockBehaviorAssertion invalidate](openFolderOverSceneLayoutFloatingDockBehaviorAssertion, "invalidate");
      v9 = self->_openFolderOverSceneLayoutFloatingDockBehaviorAssertion;
      self->_openFolderOverSceneLayoutFloatingDockBehaviorAssertion = 0;
      goto LABEL_13;
    }
  }
  else if (!a4)
  {
    openFolderOverHomeScreenFloatingDockBehaviorAssertion = self->_openFolderOverHomeScreenFloatingDockBehaviorAssertion;
    if (v6)
    {
      if (!openFolderOverHomeScreenFloatingDockBehaviorAssertion)
      {
        v8 = -[SBFloatingDockBehaviorAssertion initWithFloatingDockController:visibleProgress:animated:gesturePossible:atLevel:reason:withCompletion:]([SBFloatingDockBehaviorAssertion alloc], "initWithFloatingDockController:visibleProgress:animated:gesturePossible:atLevel:reason:withCompletion:", self, 1, 1, 1, CFSTR("open folder over homescreen"), 0, 0.0);
        v9 = self->_openFolderOverHomeScreenFloatingDockBehaviorAssertion;
        self->_openFolderOverHomeScreenFloatingDockBehaviorAssertion = v8;
LABEL_13:

      }
    }
    else if (openFolderOverHomeScreenFloatingDockBehaviorAssertion)
    {
      -[SBFloatingDockBehaviorAssertion invalidate](openFolderOverHomeScreenFloatingDockBehaviorAssertion, "invalidate");
      v9 = self->_openFolderOverHomeScreenFloatingDockBehaviorAssertion;
      self->_openFolderOverHomeScreenFloatingDockBehaviorAssertion = 0;
      goto LABEL_13;
    }
  }
  -[SBFloatingDockController _updateFocusAssertion](self, "_updateFocusAssertion");

}

- (id)viewForSystemGestureRecognizer:(id)a3
{
  return (id)-[SBFloatingDockRootViewController view](self->_viewController, "view", a3);
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  SBFailingSystemGestureRecognizer *v6;
  id v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  CGRect v35;

  v6 = (SBFailingSystemGestureRecognizer *)a3;
  v7 = a4;
  if (!-[SBFloatingDockController _allowGestureRecognizers](self, "_allowGestureRecognizers"))
    goto LABEL_7;
  if (self->_dismissFloatingDockSystemGestureRecognizer != v6)
  {
    v8 = 1;
    goto LABEL_8;
  }
  if (!-[SBFloatingDockRootViewController isFloatingDockPresented](self->_viewController, "isFloatingDockPresented"))
  {
LABEL_7:
    v8 = 0;
    goto LABEL_8;
  }
  -[SBFloatingDockController homeScreenContextProvider](self, "homeScreenContextProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "iconManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "isShowingLeadingCustomView") & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    -[SBFloatingDockRootViewController viewIfLoaded](self->_viewController, "viewIfLoaded");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      _UISystemGestureLocationForTouchInView();
      v14 = v13;
      objc_msgSend(v12, "hitTest:withEvent:", 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
        goto LABEL_11;
      objc_msgSend(v12, "window");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "windowScene");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "screen");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15)
        goto LABEL_15;
      -[SBFloatingDockRootViewController floatingDockScreenFrame](self->_viewController, "floatingDockScreenFrame");
      v19 = v18;
      v21 = v20;
      v23 = v22;
      v25 = v24;
      objc_msgSend(v15, "fixedCoordinateSpace");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "convertRect:fromCoordinateSpace:", v26, v19, v21, v23, v25);
      v28 = v27;
      v30 = v29;
      v32 = v31;
      v34 = v33;

      v35.origin.x = v28;
      v35.origin.y = v30;
      v35.size.width = v32;
      v35.size.height = v34;
      if (v14 > CGRectGetMidY(v35))
LABEL_11:
        v8 = 0;
      else
LABEL_15:
        v8 = 1;

    }
    else
    {
      v8 = 1;
    }

  }
LABEL_8:

  return v8;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  BOOL v3;
  id WeakRetained;
  void *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  NSObject *v16;
  const char *v17;
  uint8_t *v18;
  _BOOL4 v20;
  __int16 v21;
  __int16 v22;
  __int16 v23;
  __int16 v24;
  uint8_t buf[2];

  if (self->_presentFloatingDockIndirectPanGestureRecognizer == a3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
    +[SBCoverSheetPresentationManager sharedInstance](SBCoverSheetPresentationManager, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isVisible");

    +[SBControlCenterController sharedInstance](SBControlCenterController, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isVisible");

    objc_msgSend(WeakRetained, "assistantController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isVisible");

    +[SBSetupManager sharedInstance](SBSetupManager, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isInSetupMode");

    objc_msgSend(WeakRetained, "switcherController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isFloatingSwitcherVisible");

    if ((-[SBFZStackParticipant ownsHomeGesture](self->_zStackParticipant, "ownsHomeGesture") & 1) != 0)
    {
      if (!-[SBFloatingDockRootViewController isFloatingDockFullyPresented](self->_viewController, "isFloatingDockFullyPresented"))
      {
        if ((v7 | v9 | v11 | v13 | v15) != 1)
        {
          v3 = 1;
          goto LABEL_11;
        }
        SBLogDock();
        v16 = objc_claimAutoreleasedReturnValue();
        v20 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);
        if (v13)
        {
          if (!v20)
            goto LABEL_10;
          v23 = 0;
          v17 = "Preventing the indirect present dock gesture because the dock is not allowed in Buddy.";
          v18 = (uint8_t *)&v23;
        }
        else if (v15)
        {
          if (!v20)
            goto LABEL_10;
          v22 = 0;
          v17 = "Preventing the indirect present dock gesture because the slide over switcher is visible.";
          v18 = (uint8_t *)&v22;
        }
        else
        {
          if (!v20)
            goto LABEL_10;
          v21 = 0;
          v17 = "Preventing the indirect present dock gesture because although the dock owns the home gesture, Cover Shee"
                "t, Control Center, or Siri are still dismissing.";
          v18 = (uint8_t *)&v21;
        }
        goto LABEL_9;
      }
      SBLogDock();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v24 = 0;
        v17 = "Preventing the indirect present dock gesture because the floating dock is already presented.";
        v18 = (uint8_t *)&v24;
LABEL_9:
        _os_log_impl(&dword_1D0540000, v16, OS_LOG_TYPE_INFO, v17, v18, 2u);
      }
    }
    else
    {
      SBLogDock();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v17 = "Preventing the indirect present dock gesture because the dock doesn't own the home gesture.";
        v18 = buf;
        goto LABEL_9;
      }
    }
LABEL_10:

    v3 = 0;
LABEL_11:

    return v3;
  }
  return 1;
}

- (void)_gestureRecognizerFailed:(id)a3
{
  id WeakRetained;
  int v5;

  if (self->_dismissFloatingDockSystemGestureRecognizer == a3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_activeAssertion);
    v5 = objc_msgSend(WeakRetained, "gesturePossible");

    if (v5)
    {
      -[SBFloatingDockController dismissFloatingDockIfPresentedAnimated:completionHandler:](self, "dismissFloatingDockIfPresentedAnimated:completionHandler:", 1, 0);
      -[SBFAnalyticsClient emitEvent:](self->_analyticsClient, "emitEvent:", 27);
    }
  }
}

- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4
{
  objc_msgSend(a4, "setActivationPolicyForParticipantsBelow:", 0);
}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidBeginWithTransitionContext:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  void *v15;
  void *v16;
  char v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  _BOOL4 v23;
  char v24;
  BOOL v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  uint64_t v36;
  void *v37;
  _BOOL4 v38;
  void *v39;
  void *v40;
  id v41;

  v41 = a4;
  v38 = -[SBFloatingDockRootViewController isFloatingDockPresented](self->_viewController, "isFloatingDockPresented");
  objc_msgSend(v41, "fromLayoutState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unlockedEnvironmentMode");
  objc_msgSend(v41, "toLayoutState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unlockedEnvironmentMode");
  -[SBFloatingDockController homeScreenContextProvider](self, "homeScreenContextProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFloatingDockController presentedFolderController](self, "presentedFolderController");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "folder");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v40)
  {
    -[SBFloatingDockController windowScene](self, "windowScene");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isMainDisplayWindowScene"))
    {
      objc_msgSend(v9, "iconManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "openedFolderController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "folder");
      v40 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v40 = 0;
    }

  }
  v39 = v9;
  v13 = objc_msgSend(v7, "isEqual:withRole:", v5, 1);
  v14 = objc_msgSend(v7, "isEqual:withRole:", v5, 3);
  objc_msgSend(v5, "bundleIDShowingAppExpose");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleIDShowingAppExpose");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = BSEqualStrings();

  v18 = 0;
  if (v6 == 3 && v8 == 3 && (v17 & 1) == 0)
  {
    objc_msgSend(v7, "bundleIDShowingAppExpose");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v19 != 0;

  }
  objc_msgSend(v41, "applicationTransitionContext");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
    goto LABEL_14;
  v21 = (v8 == 3) & ~v13;
  if (v6 != 3)
    v21 = 0;
  if ((v21 | v18) != 1)
  {
    v23 = -[SBFloatingDockRootViewController isFloatingDockPresented](self->_viewController, "isFloatingDockPresented");
    v22 = v8 == 1 || v23;
  }
  else
  {
LABEL_14:
    -[SBFloatingDockController dismissFloatingDockIfPresentedAnimated:completionHandler:](self, "dismissFloatingDockIfPresentedAnimated:completionHandler:", 1, 0);
    -[SBFloatingDockController dismissPresentedFolderAnimated:withTransitionContext:completion:](self, "dismissPresentedFolderAnimated:withTransitionContext:completion:", 1, v20, 0);
    -[SBFloatingDockController dismissPresentedLibraryAnimated:withTransitionContext:completion:](self, "dismissPresentedLibraryAnimated:withTransitionContext:completion:", 1, v20, 0);
    v22 = 0;
  }
  if (v6 == 2)
    v24 = v17;
  else
    v24 = 0;
  if ((v24 & 1) != 0)
  {
    if (v8 != 3)
      goto LABEL_43;
    goto LABEL_32;
  }
  v26 = v6 == 2 && v8 == 3;
  if (v8 == 2 || v26)
LABEL_32:
    -[SBFloatingDockController dismissPresentedLibraryAnimated:withTransitionContext:completion:](self, "dismissPresentedLibraryAnimated:withTransitionContext:completion:", 1, v20, 0);
  if (v6 == 1 && v8 == 3)
  {
    -[SBFloatingDockController windowScene](self, "windowScene");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "isMainDisplayWindowScene");
    if (v40 && -[SBFloatingDockController isPresentingFolder](self, "isPresentingFolder"))
    {
      if (v28)
      {
        objc_msgSend(v40, "icon");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBFloatingDockController presentedFolderController](self, "presentedFolderController");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v30, "currentPageIndex");

        -[SBFloatingDockController dismissPresentedFolderAnimated:completion:](self, "dismissPresentedFolderAnimated:completion:", 0, 0);
        objc_msgSend(v39, "_rootFolderController");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "pushFolderIcon:location:animated:completion:", v29, *MEMORY[0x1E0DAA9E0], 0, 0);

        objc_msgSend(v39, "_rootFolderController");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "folderControllerForFolder:", v40);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "setCurrentPageIndex:animated:", v36, 0);

      }
      else
      {
        -[SBFloatingDockController dismissPresentedFolderAnimated:completion:](self, "dismissPresentedFolderAnimated:completion:", 0, 0);
      }
    }
    else
    {
      -[SBFloatingDockController floatingDockViewController](self, "floatingDockViewController");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "isPresentingLibrary");

      if (((v35 ^ 1 | v28) & 1) == 0)
        -[SBFloatingDockController dismissPresentedLibraryAnimated:withTransitionContext:completion:](self, "dismissPresentedLibraryAnimated:withTransitionContext:completion:", 1, v20, 0);
    }

  }
LABEL_43:
  -[SBFloatingDockController _updateFocusAssertion](self, "_updateFocusAssertion", v36);
  -[SBFloatingDockRootViewController prepareForTransitionToEnvironmentMode:fromDockVisible:toDockVisible:](self->_viewController, "prepareForTransitionToEnvironmentMode:fromDockVisible:toDockVisible:", v8, v38, v22);

}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidEndWithTransitionContext:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a4;
  objc_msgSend(v23, "toLayoutState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unlockedEnvironmentMode");
  v7 = v23;
  if (v6 == 1)
  {
    -[SBFloatingDockController homeScreenContextProvider](self, "homeScreenContextProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_openFolderController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9
      && objc_msgSend(v9, "isOpen")
      && !-[SBFloatingDockController isPresentingFolder](self, "isPresentingFolder"))
    {
      objc_msgSend(v10, "folder");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "icon");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "originatingIconLocation");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "model");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "rootFolder");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "dock");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "directlyContainsIcon:", v11);

      if (v15)
      {
        objc_msgSend(v8, "_rootFolderController");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "folderControllerForFolder:", v22);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        v20 = objc_msgSend(v17, "currentPageIndex");
        objc_msgSend(v8, "_rootFolderController");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "popFolderAnimated:completion:", 0, 0);

        -[SBFloatingDockController presentFolderForIcon:location:animated:completion:](self, "presentFolderForIcon:location:animated:completion:", v11, v21, 0, 0);
        if (v17)
        {
          -[SBFloatingDockController presentedFolderController](self, "presentedFolderController");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setCurrentPageIndex:animated:", v20, 0);

        }
      }

    }
    v7 = v23;
  }
  if ((objc_msgSend(v7, "isInterrupted") & 1) == 0)
    -[SBFloatingDockRootViewController cleanupAfterTransitionToEnvironmentMode:](self->_viewController, "cleanupAfterTransitionToEnvironmentMode:", v6);

}

- (void)rootFolderPageStateProvider:(id)a3 willBeginTransitionToState:(int64_t)a4 animated:(BOOL)a5 interactive:(BOOL)a6
{
  uint64_t v8;
  int v9;
  int v10;
  SBFloatingDockBehaviorAssertion *v11;
  SBFloatingDockBehaviorAssertion *iconPullSearchGestureShowingFloatingDockBehaviorAssertion;
  SBFloatingDockBehaviorAssertion *v13;
  double v14;
  SBFloatingDockBehaviorAssertion *v15;

  v8 = objc_msgSend(a3, "pageState");
  v9 = SBRootFolderPageStateIsOnLeadingCustomPage();
  v10 = SBRootFolderPageStateIsOnLeadingCustomPage();
  if (v9 == v10)
  {
    if (a4 == 1 || v8 == 1)
    {
      v13 = [SBFloatingDockBehaviorAssertion alloc];
      v14 = 1.0;
      if (a4 == 1)
        v14 = 0.0;
      v15 = -[SBFloatingDockBehaviorAssertion initWithFloatingDockController:visibleProgress:animated:gesturePossible:atLevel:reason:withCompletion:](v13, "initWithFloatingDockController:visibleProgress:animated:gesturePossible:atLevel:reason:withCompletion:", self, 1, 1, 2, CFSTR("icon pull started"), 0, v14);
      iconPullSearchGestureShowingFloatingDockBehaviorAssertion = self->_iconPullSearchGestureShowingFloatingDockBehaviorAssertion;
      self->_iconPullSearchGestureShowingFloatingDockBehaviorAssertion = v15;
      goto LABEL_10;
    }
  }
  else
  {
    self->_homeScreenTodayViewTransitioning = 1;
    self->_homeScreenTransitioningToTodayView = v10;
    if (!self->_todayViewFloatingDockBehaviorAssertion)
    {
      v11 = -[SBFloatingDockBehaviorAssertion initWithFloatingDockController:visibleProgress:animated:gesturePossible:atLevel:reason:withCompletion:]([SBFloatingDockBehaviorAssertion alloc], "initWithFloatingDockController:visibleProgress:animated:gesturePossible:atLevel:reason:withCompletion:", self, 1, 1, 4, CFSTR("beginning transition to today view"), 0, 1.0);
      iconPullSearchGestureShowingFloatingDockBehaviorAssertion = self->_todayViewFloatingDockBehaviorAssertion;
      self->_todayViewFloatingDockBehaviorAssertion = v11;
LABEL_10:

    }
  }
}

- (void)rootFolderPageStateProvider:(id)a3 didContinueTransitionToState:(int64_t)a4 progress:(double)a5
{
  int v7;
  int v8;
  double v9;
  double v10;
  double v11;

  objc_msgSend(a3, "pageState");
  v7 = SBRootFolderPageStateIsOnLeadingCustomPage();
  v8 = SBRootFolderPageStateIsOnLeadingCustomPage();
  if (v7 != v8)
  {
    v9 = 1.0 - a5;
    if (v8)
      v9 = a5;
    v10 = 1.0 - v9;
    if (!self->_homeScreenTransitioningToTodayView)
    {
      -[SBFloatingDockRootViewController presentedProgress](self->_viewController, "presentedProgress");
      if (v10 < v11)
        v10 = v11;
    }
    -[SBFloatingDockBehaviorAssertion modifyProgress:interactive:completion:](self->_todayViewFloatingDockBehaviorAssertion, "modifyProgress:interactive:completion:", 1, 0, v10);
  }
}

- (void)rootFolderPageStateProvider:(id)a3 didEndTransitionFromState:(int64_t)a4 toState:(int64_t)a5 successfully:(BOOL)a6
{
  int v10;
  void *iconPullSearchGestureShowingFloatingDockBehaviorAssertion;
  void *v12;
  int v13;
  SBFloatingDockBehaviorAssertion *todayViewFloatingDockBehaviorAssertion;
  BOOL v15;
  BOOL v16;
  SBFloatingDockBehaviorAssertion *v17;
  id v18;

  v18 = a3;
  v10 = SBRootFolderPageStateIsOnLeadingCustomPage();
  if (v10 != SBRootFolderPageStateIsOnLeadingCustomPage())
  {
    *(_WORD *)&self->_homeScreenTransitioningToTodayView = 0;
    -[SBFloatingDockController homeScreenContextProvider](self, "homeScreenContextProvider");
    iconPullSearchGestureShowingFloatingDockBehaviorAssertion = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(iconPullSearchGestureShowingFloatingDockBehaviorAssertion, "iconManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isShowingOrTransitioningToLeadingCustomView");
    todayViewFloatingDockBehaviorAssertion = self->_todayViewFloatingDockBehaviorAssertion;
    if (v13)
    {
      -[SBFloatingDockBehaviorAssertion modifyProgress:interactive:completion:](todayViewFloatingDockBehaviorAssertion, "modifyProgress:interactive:completion:", 1, 0, 0.0);
    }
    else
    {
      -[SBFloatingDockBehaviorAssertion invalidate](todayViewFloatingDockBehaviorAssertion, "invalidate");
      v17 = self->_todayViewFloatingDockBehaviorAssertion;
      self->_todayViewFloatingDockBehaviorAssertion = 0;

    }
    goto LABEL_13;
  }
  v15 = a4 != 1;
  v16 = !a6;
  if (a4 != 1)
    v16 = 0;
  if (a5 == 1)
    v15 = a6;
  if (!v15 && !v16)
  {
    -[SBFloatingDockBehaviorAssertion invalidate](self->_iconPullSearchGestureShowingFloatingDockBehaviorAssertion, "invalidate");
    iconPullSearchGestureShowingFloatingDockBehaviorAssertion = self->_iconPullSearchGestureShowingFloatingDockBehaviorAssertion;
    self->_iconPullSearchGestureShowingFloatingDockBehaviorAssertion = 0;
LABEL_13:

  }
}

- (void)_recalculateWindowLevelForWindowLevelAssertions
{
  void *v3;
  uint64_t v4;
  NSPointerArray **floatingDockWindowLevelAssertionsByPriority;
  NSPointerArray *v6;
  NSPointerArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v3 = 0;
  v4 = 0;
  v23 = *MEMORY[0x1E0C80C00];
  floatingDockWindowLevelAssertionsByPriority = self->_floatingDockWindowLevelAssertionsByPriority;
  do
  {
    v6 = floatingDockWindowLevelAssertionsByPriority[v4];
    v7 = v6;
    if (v6)
    {
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v8 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v19;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v19 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v11);
            if (v12)
            {
              v13 = v12;

              v3 = v13;
            }
            ++v11;
          }
          while (v9 != v11);
          v9 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        }
        while (v9);
      }
    }

    ++v4;
  }
  while (v4 != 5);
  if (v3)
  {
    objc_msgSend(v3, "level");
    v15 = v14;
  }
  else
  {
    v15 = *MEMORY[0x1E0CEBE28] + 5.0 + 20.0;
  }
  -[SBFloatingDockRootViewController view](self->_viewController, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "window");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setWindowLevel:", v15);

  -[SBFloatingDockRootViewController updateDisplayLayoutElementWindowLevel:](self->_viewController, "updateDisplayLayoutElementWindowLevel:", v15);
}

- (void)assistantWillAppear:(id)a3
{
  SBFloatingDockBehaviorAssertion *v4;
  SBFloatingDockBehaviorAssertion *assistantFloatingDockBehaviorAssertion;

  if (SBWorkspaceHasApplicationSceneInLockedOrUnlockedEnvironmentLayoutState()
    && !self->_assistantFloatingDockBehaviorAssertion)
  {
    v4 = -[SBFloatingDockBehaviorAssertion initWithFloatingDockController:visibleProgress:animated:gesturePossible:atLevel:reason:withCompletion:]([SBFloatingDockBehaviorAssertion alloc], "initWithFloatingDockController:visibleProgress:animated:gesturePossible:atLevel:reason:withCompletion:", self, 1, 0, 6, CFSTR("assistant"), 0, 0.0);
    assistantFloatingDockBehaviorAssertion = self->_assistantFloatingDockBehaviorAssertion;
    self->_assistantFloatingDockBehaviorAssertion = v4;

  }
}

- (void)assistantDidDisappear:(id)a3
{
  SBFloatingDockBehaviorAssertion *assistantFloatingDockBehaviorAssertion;

  -[SBFloatingDockBehaviorAssertion invalidate](self->_assistantFloatingDockBehaviorAssertion, "invalidate", a3);
  assistantFloatingDockBehaviorAssertion = self->_assistantFloatingDockBehaviorAssertion;
  self->_assistantFloatingDockBehaviorAssertion = 0;

}

- (NSString)description
{
  return (NSString *)-[SBFloatingDockController descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBFloatingDockController succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBFloatingDockController descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  SBFloatingDockController *v13;
  id v14;

  v4 = a3;
  -[SBFloatingDockController succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __66__SBFloatingDockController_descriptionBuilderWithMultilinePrefix___block_invoke;
  v11[3] = &unk_1E8E9E270;
  v6 = v5;
  v12 = v6;
  v13 = self;
  v14 = v4;
  v7 = v4;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v7, v11);
  v8 = v14;
  v9 = v6;

  return v9;
}

void __66__SBFloatingDockController_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  void *v4;
  id WeakRetained;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  int8x16_t v10;
  int8x16_t v11;
  _QWORD v12[4];
  int8x16_t v13;
  id v14;
  _QWORD v15[4];
  int8x16_t v16;
  id v17;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), CFSTR("floating dock view controller"));
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 312), CFSTR("dismiss floating dock system gesture recognizer"));
  v4 = *(void **)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 328));
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", WeakRetained, CFSTR("current active assertion"));

  v7 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __66__SBFloatingDockController_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v15[3] = &unk_1E8E9E270;
  v10 = *(int8x16_t *)(a1 + 32);
  v8 = (id)v10.i64[0];
  v16 = vextq_s8(v10, v10, 8uLL);
  v17 = *(id *)(a1 + 48);
  objc_msgSend(v8, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("floatingDockBehaviorByAssertionLevel"), &stru_1E8EC7EC0, v15);
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __66__SBFloatingDockController_descriptionBuilderWithMultilinePrefix___block_invoke_3;
  v12[3] = &unk_1E8E9E270;
  v11 = *(int8x16_t *)(a1 + 32);
  v9 = (id)v11.i64[0];
  v13 = vextq_s8(v11, v11, 8uLL);
  v14 = *(id *)(a1 + 48);
  objc_msgSend(v9, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("_floatingDockWindowLevelAssertionsByPriority"), &stru_1E8EC7EC0, v12);

}

void __66__SBFloatingDockController_descriptionBuilderWithMultilinePrefix___block_invoke_2(_QWORD *a1)
{
  uint64_t i;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  for (i = 3; i != 16; ++i)
  {
    v3 = *(void **)(a1[4] + 8 * i);
    if (v3)
    {
      v4 = (void *)a1[5];
      v5 = v3;
      objc_msgSend(v5, "allObjects");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", i - 3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "description");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      SBFloatingDockBehaviorLevelDescription(i - 3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ - (%@)"), v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendArraySection:withName:multilinePrefix:skipIfEmpty:", v6, v11, a1[6], 0);

    }
  }
}

void __66__SBFloatingDockController_descriptionBuilderWithMultilinePrefix___block_invoke_3(_QWORD *a1)
{
  uint64_t i;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  for (i = 0; i != 5; ++i)
  {
    v3 = *(void **)(a1[4] + 8 * i + 128);
    if (v3)
    {
      v4 = (void *)a1[5];
      v5 = v3;
      objc_msgSend(v5, "allObjects");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", i);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "description");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      SBFloatingDockWindowLevelPriorityDescription(i);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ - (%@)"), v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendArraySection:withName:multilinePrefix:skipIfEmpty:", v6, v11, a1[6], 0);

    }
  }
}

- (void)_setupStateDumper
{
  id v3;
  uint64_t v4;
  BSInvalidatable *v5;
  BSInvalidatable *floatingDockStateDumpHandle;
  void *v7;
  BSInvalidatable *v8;
  BSInvalidatable *floatingDockRecursiveHitTestingStateDumpHandle;
  id v10;
  id v11;
  _QWORD v12[5];
  uint64_t v13;
  id *v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18[5];
  id v19;
  id location;

  if (!self->_floatingDockStateDumpHandle)
  {
    if (+[SBFloatingDockController isFloatingDockSupported](SBFloatingDockController, "isFloatingDockSupported"))
    {
      objc_initWeak(&location, self);
      v3 = MEMORY[0x1E0C80D38];
      v4 = MEMORY[0x1E0C809B0];
      v18[1] = (id)MEMORY[0x1E0C809B0];
      v18[2] = (id)3221225472;
      v18[3] = __45__SBFloatingDockController__setupStateDumper__block_invoke;
      v18[4] = &unk_1E8EA12C0;
      objc_copyWeak(&v19, &location);
      BSLogAddStateCaptureBlockWithTitle();
      v5 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
      floatingDockStateDumpHandle = self->_floatingDockStateDumpHandle;
      self->_floatingDockStateDumpHandle = v5;

      v13 = 0;
      v14 = (id *)&v13;
      v15 = 0x3042000000;
      v16 = __Block_byref_object_copy__65;
      v17 = __Block_byref_object_dispose__65;
      v18[0] = 0;
      v12[0] = v4;
      v12[1] = 3221225472;
      v12[2] = __45__SBFloatingDockController__setupStateDumper__block_invoke_136;
      v12[3] = &unk_1E8EB1A68;
      v12[4] = &v13;
      v7 = (void *)MEMORY[0x1D17E5550](v12);
      objc_storeWeak(v14 + 5, v7);
      objc_copyWeak(&v11, &location);
      v10 = v7;
      BSLogAddStateCaptureBlockWithTitle();
      v8 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
      floatingDockRecursiveHitTestingStateDumpHandle = self->_floatingDockRecursiveHitTestingStateDumpHandle;
      self->_floatingDockRecursiveHitTestingStateDumpHandle = v8;

      objc_destroyWeak(&v11);
      _Block_object_dispose(&v13, 8);
      objc_destroyWeak(v18);
      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
    }
  }
}

id __45__SBFloatingDockController__setupStateDumper__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id v14;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = WeakRetained[1];
    objc_msgSend(v2, "descriptionBuilderWithMultilinePrefix:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __45__SBFloatingDockController__setupStateDumper__block_invoke_2;
    v12 = &unk_1E8E9E820;
    v13 = v4;
    v14 = v3;
    v5 = v3;
    v6 = v4;
    objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("floating dock presentation state"), &stru_1E8EC7EC0, &v9);
    objc_msgSend(v6, "build", v9, v10, v11, v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __45__SBFloatingDockController__setupStateDumper__block_invoke_2(uint64_t a1)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isFloatingDockPresented"), CFSTR("isFloatingDockPresented"));
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isFloatingDockFullyPresented"), CFSTR("isFloatingDockFullyPresented"));
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "floatingDockScreenFrame");
  v5 = (id)objc_msgSend(v4, "appendRect:withName:", CFSTR("floatingDockScreenFrame"));
  v6 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "floatingDockScreenPresentationFrame");
  v7 = (id)objc_msgSend(v6, "appendRect:withName:", CFSTR("floatingDockScreenPresentationFrame"));
  v8 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "window");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = (const __CFString *)v10;
  else
    v12 = &stru_1E8EC7EC0;
  v13 = (id)objc_msgSend(v8, "appendObject:withName:", v12, CFSTR("floatingDockWindow"));

  v14 = (void *)MEMORY[0x1E0CB37E8];
  v15 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "view");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "window");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "windowLevel");
  objc_msgSend(v14, "numberWithDouble:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (id)objc_msgSend(v15, "appendObject:withName:", v17, CFSTR("floatingDockWindowLevel"));

}

void __45__SBFloatingDockController__setupStateDumper__block_invoke_136(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  objc_class *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = objc_opt_new();
  v13 = (void *)v12;
  if (a5)
  {
    v14 = a5;
    do
    {
      objc_msgSend(v13, "stringByAppendingString:", CFSTR("\t"), v21);
      v21 = (id)objc_claimAutoreleasedReturnValue();

      v13 = v21;
      --v14;
    }
    while (v14);
  }
  else
  {
    v21 = (id)v12;
  }
  v15 = (objc_class *)objc_opt_class();
  NSStringFromClass(v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __45__SBFloatingDockController__setupStateDumper__block_invoke_2_139;
  v22[3] = &unk_1E8EB1A40;
  v23 = v11;
  v24 = v9;
  v17 = *(_QWORD *)(a1 + 32);
  v25 = v10;
  v26 = v17;
  v27 = a5;
  v18 = v10;
  v19 = v9;
  v20 = v11;
  objc_msgSend(v20, "appendBodySectionWithName:multilinePrefix:block:", v16, v21, v22);

}

void __45__SBFloatingDockController__setupStateDumper__block_invoke_2_139(uint64_t a1)
{
  id v2;
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id WeakRetained;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isUserInteractionEnabled"), CFSTR("isUserInteractionEnabled"));
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "bs_isHitTestingDisabled"), CFSTR("bs_isHitTestingDisabled"));
  objc_msgSend(*(id *)(a1 + 40), "subviews");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v14, "count"))
  {

    return;
  }
  v4 = *(void **)(a1 + 48);
  if (v4)
  {
    v5 = objc_msgSend(v4, "evaluateWithObject:", *(_QWORD *)(a1 + 40));

    if ((v5 & 1) == 0)
      return;
  }
  else
  {

  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(*(id *)(a1 + 40), "subviews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reverseObjectEnumerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11);
        WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
        (*((void (**)(id, uint64_t, _QWORD, _QWORD, uint64_t))WeakRetained + 2))(WeakRetained, v12, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 64) + 1);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

}

id __45__SBFloatingDockController__setupStateDumper__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  id v10;
  id v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "descriptionBuilderWithMultilinePrefix:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __45__SBFloatingDockController__setupStateDumper__block_invoke_4;
    v9[3] = &unk_1E8E9F170;
    v5 = *(id *)(a1 + 32);
    v10 = v4;
    v11 = v5;
    v9[4] = v3;
    v6 = v4;
    objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("floating dock user interface interaction enabled"), &stru_1E8EC7EC0, v9);
    objc_msgSend(v6, "build");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __45__SBFloatingDockController__setupStateDumper__block_invoke_4(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;

  v2 = a1[6];
  v3 = *(_QWORD *)(a1[4] + 304);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_151_0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id, _QWORD, _QWORD))(v2 + 16))(v2, v3, v4, a1[5], 0);

}

BOOL __45__SBFloatingDockController__setupStateDumper__block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

- (SBFloatingDockControllerDelegate)delegate
{
  return (SBFloatingDockControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIViewController)viewController
{
  return &self->_viewController->super.super;
}

- (BOOL)wasFloatingDockPresentedByPointer
{
  return self->_wasFloatingDockPresentedByPointer;
}

- (void)setWasFloatingDockPresentedByPointer:(BOOL)a3
{
  self->_wasFloatingDockPresentedByPointer = a3;
}

- (SBIndirectPanGestureRecognizer)presentFloatingDockIndirectPanGestureRecognizer
{
  return self->_presentFloatingDockIndirectPanGestureRecognizer;
}

- (UIHoverGestureRecognizer)dismissFloatingDockHoverGestureRecognizer
{
  return self->_dismissFloatingDockHoverGestureRecognizer;
}

- (SBWindow)floatingDockWindow
{
  return self->_floatingDockWindow;
}

- (SBFailingSystemGestureRecognizer)dismissFloatingDockSystemGestureRecognizer
{
  return self->_dismissFloatingDockSystemGestureRecognizer;
}

- (SBFloatingDockHomeScreenContextProviding)homeScreenContextProvider
{
  return (SBFloatingDockHomeScreenContextProviding *)objc_loadWeakRetained((id *)&self->_homeScreenContextProvider);
}

- (SBFloatingDockBehaviorAssertion)activeAssertion
{
  return (SBFloatingDockBehaviorAssertion *)objc_loadWeakRetained((id *)&self->_activeAssertion);
}

- (void)setActiveAssertion:(id)a3
{
  objc_storeWeak((id *)&self->_activeAssertion, a3);
}

- (SBLayoutStateTransitionCoordinator)layoutStateTransitionCoordinator
{
  return (SBLayoutStateTransitionCoordinator *)objc_loadWeakRetained((id *)&self->_layoutStateTransitionCoordinator);
}

- (void)setLayoutStateTransitionCoordinator:(id)a3
{
  objc_storeWeak((id *)&self->_layoutStateTransitionCoordinator, a3);
}

- (SBFZStackParticipant)zStackParticipant
{
  return self->_zStackParticipant;
}

- (void)setZStackParticipant:(id)a3
{
  objc_storeStrong((id *)&self->_zStackParticipant, a3);
}

- (SBWindowScene)windowScene
{
  return (SBWindowScene *)objc_loadWeakRetained((id *)&self->_windowScene);
}

- (void).cxx_destruct
{
  uint64_t i;
  uint64_t j;

  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong((id *)&self->_zStackParticipant, 0);
  objc_destroyWeak((id *)&self->_layoutStateTransitionCoordinator);
  objc_destroyWeak((id *)&self->_activeAssertion);
  objc_destroyWeak((id *)&self->_homeScreenContextProvider);
  objc_storeStrong((id *)&self->_dismissFloatingDockSystemGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_floatingDockWindow, 0);
  objc_storeStrong((id *)&self->_dismissFloatingDockHoverGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_presentFloatingDockIndirectPanGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_testRecipe, 0);
  objc_storeStrong((id *)&self->_focusAssertion, 0);
  objc_storeStrong((id *)&self->_floatingDockRecursiveHitTestingStateDumpHandle, 0);
  objc_storeStrong((id *)&self->_floatingDockStateDumpHandle, 0);
  objc_storeStrong((id *)&self->_iconViewMap, 0);
  objc_storeStrong((id *)&self->_rootViewControllerOrderingAssertions, 0);
  objc_storeStrong((id *)&self->_assistantFloatingDockBehaviorAssertion, 0);
  objc_storeStrong((id *)&self->_activeGestureFloatingDockBehaviorAssertion, 0);
  objc_storeStrong((id *)&self->_openFolderOverSceneLayoutFloatingDockBehaviorAssertion, 0);
  objc_storeStrong((id *)&self->_openFolderOverHomeScreenFloatingDockBehaviorAssertion, 0);
  objc_storeStrong((id *)&self->_iconPullSearchGestureShowingFloatingDockBehaviorAssertion, 0);
  objc_storeStrong((id *)&self->_todayViewFloatingDockBehaviorAssertion, 0);
  objc_storeStrong((id *)&self->_analyticsClient, 0);
  for (i = 0; i != -5; --i)
    objc_storeStrong((id *)&self->_floatingDockWindowLevelAssertionsByPriority[i + 4], 0);
  for (j = 120; j != 16; j -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + j), 0);
  objc_storeStrong((id *)&self->_viewController, 0);
}

- (void)_removeFloatingDockWindowLevelAssertion:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1D0540000, a2, a3, "tried to remove a window level assertion that was never added: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)_removeFloatingDockBehaviorAssertion:(uint64_t)a3 withCompletion:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1D0540000, a2, a3, "tried to remove a behavior assertion that was never added: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)_evaluateAssertions:(uint64_t)a3 interactive:(uint64_t)a4 withCompletion:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_12(&dword_1D0540000, a1, a3, "Found a nil activeAssertion when attempting to evaluate SBFloatingDockBehaviorAssertion assertions. At least one should always exist.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (void)_evaluateAssertions:(os_log_t)log interactive:withCompletion:.cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D0540000, log, OS_LOG_TYPE_DEBUG, "ignoring dock behavior assertion change temporarily during interface orientation mismatch", v1, 2u);
  OUTLINED_FUNCTION_4();
}

@end
