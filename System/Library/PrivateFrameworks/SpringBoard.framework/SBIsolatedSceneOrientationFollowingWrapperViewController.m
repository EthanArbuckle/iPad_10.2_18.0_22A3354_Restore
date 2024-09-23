@implementation SBIsolatedSceneOrientationFollowingWrapperViewController

- (SBIsolatedSceneOrientationFollowingWrapperViewController)initWithContentViewController:(id)a3 sceneHandle:(id)a4 windowScene:(id)a5 orientationDelegate:(id)a6 rendersWhileLocked:(BOOL)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  SBIsolatedSceneOrientationFollowingWrapperViewController *v17;
  SBIsolatedSceneOrientationFollowingWrapperViewController *v18;
  objc_super v20;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)SBIsolatedSceneOrientationFollowingWrapperViewController;
  v17 = -[SBIsolatedSceneOrientationFollowingWrapperViewController initWithNibName:bundle:](&v20, sel_initWithNibName_bundle_, 0, 0);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_sceneHandle, a4);
    objc_storeStrong((id *)&v18->_contentViewController, a3);
    objc_storeWeak((id *)&v18->_orientationDelegate, v16);
    v18->_sceneInterfaceOrientationMode = -[SBDeviceApplicationSceneHandle _interfaceOrientationMode](v18->_sceneHandle, "_interfaceOrientationMode");
    v18->_rendersWhileLocked = a7;
    objc_storeWeak((id *)&v18->_windowScene, v15);
  }

  return v18;
}

- (void)dealloc
{
  UIView *hostedOverlayView;
  objc_super v4;

  -[UIView removeFromSuperview](self->_hostedOverlayView, "removeFromSuperview");
  hostedOverlayView = self->_hostedOverlayView;
  self->_hostedOverlayView = 0;

  -[SBWindowSelfHostWrapper stopHosting](self->_appOverlayHostWrapper, "stopHosting");
  -[SBWindow setHidden:](self->_appOverlayWindow, "setHidden:", 1);
  -[BSInvalidatable invalidate](self->_traitsResolutionPolicySpecifier, "invalidate");
  -[TRAParticipant invalidate](self->_traitsParticipant, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)SBIsolatedSceneOrientationFollowingWrapperViewController;
  -[SBIsolatedSceneOrientationFollowingWrapperViewController dealloc](&v4, sel_dealloc);
}

- (void)_updateOrientationResolutionPolicyWithContainerTraitsParticipant:(id)a3
{
  id v4;
  void *v5;
  int v6;
  TRAOrientationResolutionPolicyInfo *v7;
  void *v8;
  void *v9;
  TRAOrientationResolutionPolicyInfo *v10;
  TRAOrientationResolutionPolicyInfo *traitsOrientationResolutionPolicy;
  id WeakRetained;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  BSInvalidatable *v18;
  BSInvalidatable *traitsResolutionPolicySpecifier;
  _QWORD v20[5];
  _QWORD v21[4];
  id v22;
  id location;

  v4 = a3;
  -[SBApplicationSceneHandle application](self->_sceneHandle, "application");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "classicAppPhoneAppRunningOnPad");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0DC08D0], "resolutionPolicyInfoDeviceOrientation");
    v7 = (TRAOrientationResolutionPolicyInfo *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0DC08D0];
    if (v4)
    {
      objc_msgSend(v4, "uniqueIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "resolutionPolicyInfoForAssociatedParticipantWithUniqueID:", v9);
      v10 = (TRAOrientationResolutionPolicyInfo *)objc_claimAutoreleasedReturnValue();
      traitsOrientationResolutionPolicy = self->_traitsOrientationResolutionPolicy;
      self->_traitsOrientationResolutionPolicy = v10;

      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x1E0DC08D0], "resolutionPolicyInfoOrientationBelow");
    v7 = (TRAOrientationResolutionPolicyInfo *)objc_claimAutoreleasedReturnValue();
  }
  v9 = self->_traitsOrientationResolutionPolicy;
  self->_traitsOrientationResolutionPolicy = v7;
LABEL_7:

  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  v13 = WeakRetained;
  if (self->_traitsResolutionPolicySpecifier)
  {
    objc_msgSend(WeakRetained, "traitsArbiter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_alloc(MEMORY[0x1E0DC0898]);
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __125__SBIsolatedSceneOrientationFollowingWrapperViewController__updateOrientationResolutionPolicyWithContainerTraitsParticipant___block_invoke_2;
    v20[3] = &unk_1E8EACDB0;
    v20[4] = self;
    v16 = (void *)objc_msgSend(v15, "initWithBuilder:", v20);
    objc_msgSend(v14, "setNeedsUpdateArbitrationWithContext:", v16);

  }
  else
  {
    objc_initWeak(&location, self);
    objc_msgSend(v13, "traitsPipelineManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __125__SBIsolatedSceneOrientationFollowingWrapperViewController__updateOrientationResolutionPolicyWithContainerTraitsParticipant___block_invoke;
    v21[3] = &unk_1E8EA7798;
    objc_copyWeak(&v22, &location);
    v18 = (BSInvalidatable *)objc_msgSend(v17, "newBlockBasedOrientationPolicySpecifier:forRole:", v21, CFSTR("SBTraitsParticipantRoleDeviceApplicationSceneViewOverlay"));
    traitsResolutionPolicySpecifier = self->_traitsResolutionPolicySpecifier;
    self->_traitsResolutionPolicySpecifier = v18;

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

}

void __125__SBIsolatedSceneOrientationFollowingWrapperViewController__updateOrientationResolutionPolicyWithContainerTraitsParticipant___block_invoke(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id *v4;
  id v5;

  v5 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained && objc_msgSend(v5, "containsObject:", WeakRetained[126]))
    objc_msgSend(v4[126], "setOrientationResolutionPolicyInfo:", v4[128]);

}

void __125__SBIsolatedSceneOrientationFollowingWrapperViewController__updateOrientationResolutionPolicyWithContainerTraitsParticipant___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "setReason:", CFSTR("Isolated scene overlay window updating policy"));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1008), "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRequestingParticipantsUniqueIdentifiers:", v5);

  objc_msgSend(v3, "setForceOrientationResolution:", 1);
}

- (void)loadView
{
  objc_class *v3;
  SBSceneOrientationFollowingWindowRootViewController *v4;
  SBIsolatedSceneOrientationFollowingWindow *v5;
  SBIsolatedSceneOrientationFollowingWindow *appOverlayWindow;
  void *v7;
  TRAParticipant *v8;
  TRAParticipant *traitsParticipant;
  void *v10;
  void *v11;
  char v12;
  SBIsolatedSceneOrientationFollowingWindow *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  UIView *v27;
  UIView *hostedOverlayView;
  void *v29;
  objc_class *v30;
  void *v31;
  void *v32;
  SBWindowSelfHostWrapper *v33;
  SBWindowSelfHostWrapper *appOverlayHostWrapper;
  UIView *v35;
  SBIsolatedSceneOrientationFollowingContainerView *v36;
  SBIsolatedSceneOrientationFollowingContainerView *v37;
  SBIsolatedSceneOrientationFollowingContainerView *containerView;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  v3 = (objc_class *)objc_opt_class();
  v4 = -[SBSceneOrientationFollowingWindowRootViewController initWithHostingViewController:]([SBSceneOrientationFollowingWindowRootViewController alloc], "initWithHostingViewController:", self);
  v5 = (SBIsolatedSceneOrientationFollowingWindow *)objc_msgSend([v3 alloc], "initWithWindowScene:rootViewController:role:debugName:", WeakRetained, v4, CFSTR("SBTraitsParticipantRoleDeviceApplicationSceneViewOverlay"), CFSTR("Scene Orientation-following Window"));
  appOverlayWindow = self->_appOverlayWindow;
  self->_appOverlayWindow = v5;

  -[SBIsolatedSceneOrientationFollowingWindow setWindowLevel:](self->_appOverlayWindow, "setWindowLevel:", -3.40282347e38);
  -[SBWindow setHidden:](self->_appOverlayWindow, "setHidden:", 0);
  -[SBIsolatedSceneOrientationFollowingWindow setUserInteractionEnabled:](self->_appOverlayWindow, "setUserInteractionEnabled:", 1);
  objc_msgSend(WeakRetained, "traitsArbiter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "acquireParticipantWithRole:delegate:", CFSTR("SBTraitsParticipantRoleDeviceApplicationSceneViewOverlay"), self);
  v8 = (TRAParticipant *)objc_claimAutoreleasedReturnValue();
  traitsParticipant = self->_traitsParticipant;
  self->_traitsParticipant = v8;

  -[SBIsolatedSceneOrientationFollowingWrapperViewController orientationDelegate](self, "orientationDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "initialTraitsParticipantForOverlayContainer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBIsolatedSceneOrientationFollowingWrapperViewController _updateOrientationResolutionPolicyWithContainerTraitsParticipant:](self, "_updateOrientationResolutionPolicyWithContainerTraitsParticipant:", v11);
  -[TRAParticipant setNeedsUpdatePreferencesWithReason:](self->_traitsParticipant, "setNeedsUpdatePreferencesWithReason:", CFSTR("register prefs"));
  -[TRAParticipant updatePreferencesIfNeeded](self->_traitsParticipant, "updatePreferencesIfNeeded");
  v12 = objc_msgSend(WeakRetained, "isContinuityDisplayWindowScene");
  v13 = self->_appOverlayWindow;
  if ((v12 & 1) != 0)
  {
    -[SBIsolatedSceneOrientationFollowingWindow layer](self->_appOverlayWindow, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    CALayerGetContext();
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)MEMORY[0x1E0CEA950];
    objc_msgSend(WeakRetained, "_FBSScene");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_screenForScene:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_referenceBounds");
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v26 = v25;

    v27 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEADD8]), "initWithFrame:pid:contextID:", getpid(), objc_msgSend(v15, "contextId"), v20, v22, v24, v26);
    hostedOverlayView = self->_hostedOverlayView;
    self->_hostedOverlayView = v27;

  }
  else
  {
    v29 = (void *)MEMORY[0x1E0CB3940];
    v30 = (objc_class *)objc_opt_class();
    NSStringFromClass(v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stringWithFormat:", CFSTR("%@-%@"), v31, self);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIWindow sb_hostWrapperForUseInOrientation:hostRequester:](v13, "sb_hostWrapperForUseInOrientation:hostRequester:", 1, v32);
    v33 = (SBWindowSelfHostWrapper *)objc_claimAutoreleasedReturnValue();
    appOverlayHostWrapper = self->_appOverlayHostWrapper;
    self->_appOverlayHostWrapper = v33;

    -[SBWindowSelfHostWrapper hostView](self->_appOverlayHostWrapper, "hostView");
    v35 = (UIView *)objc_claimAutoreleasedReturnValue();
    v15 = self->_hostedOverlayView;
    self->_hostedOverlayView = v35;
  }

  v36 = [SBIsolatedSceneOrientationFollowingContainerView alloc];
  v37 = -[SBIsolatedSceneOrientationFollowingContainerView initWithFrame:wrapperViewController:](v36, "initWithFrame:wrapperViewController:", self, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  containerView = self->_containerView;
  self->_containerView = v37;

  -[SBIsolatedSceneOrientationFollowingContainerView addSubview:](self->_containerView, "addSubview:", self->_hostedOverlayView);
  -[SBIsolatedSceneOrientationFollowingWrapperViewController setView:](self, "setView:", self->_containerView);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBIsolatedSceneOrientationFollowingWrapperViewController;
  -[SBIsolatedSceneOrientationFollowingWrapperViewController viewWillAppear:](&v8, sel_viewWillAppear_);
  -[SBIsolatedSceneOrientationFollowingWindow overlayRootViewController](self->_appOverlayWindow, "overlayRootViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController view](self->_contentViewController, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController beginAppearanceTransition:animated:](self->_contentViewController, "beginAppearanceTransition:animated:", 1, v3);
  objc_msgSend(v5, "addChildViewController:", self->_contentViewController);
  objc_msgSend(v6, "bounds");
  objc_msgSend(v7, "setFrame:");
  objc_msgSend(v5, "setOverlayContentView:", v7);
  -[UIViewController didMoveToParentViewController:](self->_contentViewController, "didMoveToParentViewController:", v5);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBIsolatedSceneOrientationFollowingWrapperViewController;
  -[SBIsolatedSceneOrientationFollowingWrapperViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[UIViewController endAppearanceTransition](self->_contentViewController, "endAppearanceTransition");
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  objc_super v9;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBIsolatedSceneOrientationFollowingWrapperViewController;
  -[SBIsolatedSceneOrientationFollowingWrapperViewController viewWillDisappear:](&v9, sel_viewWillDisappear_);
  -[UIViewController parentViewController](self->_contentViewController, "parentViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIsolatedSceneOrientationFollowingWindow overlayRootViewController](self->_appOverlayWindow, "overlayRootViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if (v7)
  {
    self->_contentViewControllerBeingRemoved = 1;
    -[UIViewController beginAppearanceTransition:animated:](self->_contentViewController, "beginAppearanceTransition:animated:", 0, v3);
    -[UIViewController willMoveToParentViewController:](self->_contentViewController, "willMoveToParentViewController:", 0);
    -[UIViewController view](self->_contentViewController, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeFromSuperview");

    -[UIViewController removeFromParentViewController](self->_contentViewController, "removeFromParentViewController");
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  UIView *hostedOverlayView;
  SBWindowSelfHostWrapper *appOverlayHostWrapper;
  void *v6;
  SBIsolatedSceneOrientationFollowingWindow *appOverlayWindow;
  BSInvalidatable *traitsResolutionPolicySpecifier;
  TRAParticipant *traitsParticipant;
  TRAOrientationResolutionPolicyInfo *traitsOrientationResolutionPolicy;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBIsolatedSceneOrientationFollowingWrapperViewController;
  -[SBIsolatedSceneOrientationFollowingWrapperViewController viewDidDisappear:](&v11, sel_viewDidDisappear_, a3);
  -[UIView removeFromSuperview](self->_hostedOverlayView, "removeFromSuperview");
  hostedOverlayView = self->_hostedOverlayView;
  self->_hostedOverlayView = 0;

  -[SBWindowSelfHostWrapper stopHosting](self->_appOverlayHostWrapper, "stopHosting");
  appOverlayHostWrapper = self->_appOverlayHostWrapper;
  self->_appOverlayHostWrapper = 0;

  -[SBWindow setHidden:](self->_appOverlayWindow, "setHidden:", 1);
  if (self->_contentViewControllerBeingRemoved)
  {
    -[UIViewController endAppearanceTransition](self->_contentViewController, "endAppearanceTransition");
    -[SBIsolatedSceneOrientationFollowingWindow overlayRootViewController](self->_appOverlayWindow, "overlayRootViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setOverlayContentView:", 0);

  }
  appOverlayWindow = self->_appOverlayWindow;
  self->_appOverlayWindow = 0;

  -[BSInvalidatable invalidate](self->_traitsResolutionPolicySpecifier, "invalidate");
  traitsResolutionPolicySpecifier = self->_traitsResolutionPolicySpecifier;
  self->_traitsResolutionPolicySpecifier = 0;

  -[TRAParticipant invalidate](self->_traitsParticipant, "invalidate");
  traitsParticipant = self->_traitsParticipant;
  self->_traitsParticipant = 0;

  traitsOrientationResolutionPolicy = self->_traitsOrientationResolutionPolicy;
  self->_traitsOrientationResolutionPolicy = 0;

  -[SBIsolatedSceneOrientationFollowingWrapperViewController setView:](self, "setView:", 0);
}

- (int64_t)currentInterfaceOrientation
{
  return -[SBIsolatedSceneOrientationFollowingWindow _windowInterfaceOrientation](self->_appOverlayWindow, "_windowInterfaceOrientation");
}

- (BOOL)_canShowWhileLocked
{
  return self->_rendersWhileLocked;
}

- (SBDeviceApplicationSceneOverlayView)overlayView
{
  -[SBIsolatedSceneOrientationFollowingWrapperViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  return (SBDeviceApplicationSceneOverlayView *)self->_containerView;
}

- (void)updatePreferencesForParticipant:(id)a3 updater:(id)a4
{
  id v5;
  _QWORD v6[5];

  v6[1] = 3221225472;
  v6[2] = __100__SBIsolatedSceneOrientationFollowingWrapperViewController_updatePreferencesForParticipant_updater___block_invoke;
  v6[3] = &unk_1E8EA7770;
  v6[4] = self;
  v5 = a4;
  v6[0] = MEMORY[0x1E0C809B0];
  objc_msgSend(v5, "updateOrientationPreferencesWithBlock:", v6);
  if (-[TRAOrientationResolutionPolicyInfo resolutionPolicy](self->_traitsOrientationResolutionPolicy, "resolutionPolicy") == 2)objc_msgSend(v5, "updateZOrderLevelPreferencesWithBlock:", &__block_literal_global_141);

}

void __100__SBIsolatedSceneOrientationFollowingWrapperViewController_updatePreferencesForParticipant_updater___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  uint64_t v4;
  id WeakRetained;

  v2 = (id *)(*(_QWORD *)(a1 + 32) + 1080);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  if ((objc_msgSend(WeakRetained, "shouldFollowSceneOrientation") & 1) != 0)
    v4 = 30;
  else
    v4 = objc_msgSend(WeakRetained, "supportedInterfaceOrientations");
  objc_msgSend(v3, "setSupportedOrientations:", v4);
  objc_msgSend(v3, "setPreferredOrientation:", objc_msgSend(WeakRetained, "preferredInterfaceOrientationForPresentation"));

}

uint64_t __100__SBIsolatedSceneOrientationFollowingWrapperViewController_updatePreferencesForParticipant_updater___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPreferredZOrderLevel:", *MEMORY[0x1E0CEBBD0] + 5.0);
}

- (void)didChangeSettingsForParticipant:(id)a3 context:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  _BOOL8 v12;
  uint64_t v13;
  id v14;

  v14 = a4;
  v6 = a3;
  v7 = objc_msgSend(v6, "sbf_currentOrientation");
  if (self->_initialOrientationHasBeenApplied)
  {
    objc_msgSend(v14, "orientationActuationContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "animationSettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "duration");
    v11 = v10;

    v12 = !self->_initialOrientationHasBeenApplied;
  }
  else
  {
    v11 = 0.0;
    v12 = 1;
  }
  -[SBIsolatedSceneOrientationFollowingWindow _legacySetRotatableViewOrientation:duration:force:](self->_appOverlayWindow, "_legacySetRotatableViewOrientation:duration:force:", v7, v12, v11);
  v13 = objc_msgSend(v6, "sbf_previousOrientation");

  if (v13 != v7)
    -[SBIsolatedSceneOrientationFollowingContainerView notifyObserversViewRotatedToOrientation:](self->_containerView, "notifyObserversViewRotatedToOrientation:", v7);
  self->_initialOrientationHasBeenApplied = 1;

}

- (void)appendDescriptionForParticipant:(id)a3 withBuilder:(id)a4 multilinePrefix:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v8 = a3;
  v9 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __120__SBIsolatedSceneOrientationFollowingWrapperViewController_appendDescriptionForParticipant_withBuilder_multilinePrefix___block_invoke;
  v12[3] = &unk_1E8E9E270;
  v12[4] = self;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  objc_msgSend(v10, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("Associated Windows"), a5, v12);

}

void __120__SBIsolatedSceneOrientationFollowingWrapperViewController_appendDescriptionForParticipant_withBuilder_multilinePrefix___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  id obj;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "participantAssociatedWindows:", *(_QWORD *)(a1 + 40));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v1)
  {
    v2 = v1;
    v15 = *(_QWORD *)v18;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(obj);
        v4 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v3);
        v5 = *(void **)(a1 + 48);
        v6 = (void *)MEMORY[0x1E0CB3940];
        v7 = (objc_class *)objc_opt_class();
        NSStringFromClass(v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "_debugName");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v4, "isHidden"))
          v10 = CFSTR("NO");
        else
          v10 = CFSTR("YES");
        objc_msgSend(v4, "interfaceOrientation");
        BSInterfaceOrientationDescription();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "rootViewController");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "stringWithFormat:", CFSTR("<%@: %p; %@>; Visible:%@; Orientation:%@; Root VC: %@"),
          v8,
          v4,
          v9,
          v10,
          v11,
          v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendString:withName:", v13, 0);

        ++v3;
      }
      while (v2 != v3);
      v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v2);
  }

}

- (id)participantAssociatedWindows:(id)a3
{
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  if (self->_appOverlayWindow)
  {
    v5[0] = self->_appOverlayWindow;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)_containerViewDidSetCenter:(CGPoint)a3
{
  UIView *hostedOverlayView;

  hostedOverlayView = self->_hostedOverlayView;
  -[SBIsolatedSceneOrientationFollowingContainerView center](self->_containerView, "center", a3.x, a3.y);
  -[UIView setCenter:](hostedOverlayView, "setCenter:");
}

- (void)_containerViewDidSetBounds:(CGRect)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[SBIsolatedSceneOrientationFollowingWindow rootViewController](self->_appOverlayWindow, "rootViewController", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setNeedsLayout");
  if (-[SBIsolatedSceneOrientationFollowingContainerView shouldLayoutOverlayImmediatelyForContainerGeometryChange](self->_containerView, "shouldLayoutOverlayImmediatelyForContainerGeometryChange"))
  {
    -[SBIsolatedSceneOrientationFollowingWindow rootViewController](self->_appOverlayWindow, "rootViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "layoutIfNeeded");

  }
}

- (void)_containerViewDidSetHostOrientation:(int64_t)a3
{
  -[TRAParticipant setNeedsUpdatePreferencesWithReason:](self->_traitsParticipant, "setNeedsUpdatePreferencesWithReason:", CFSTR("scene view updated hostOrientation"));
  -[TRAParticipant updatePreferencesIfNeeded](self->_traitsParticipant, "updatePreferencesIfNeeded");
}

- (int64_t)_hostOrientation
{
  return -[SBIsolatedSceneOrientationFollowingContainerView hostOrientation](self->_containerView, "hostOrientation");
}

- (BOOL)_isSceneStatusBarHidden
{
  void *v2;
  char v3;

  -[SBDeviceApplicationSceneHandle statusBarStateProvider](self->_sceneHandle, "statusBarStateProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "statusBarHidden");

  return v3;
}

- (CGRect)_boundsForOverlayRootView
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  int64_t v10;
  id WeakRetained;
  _BOOL4 v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  -[SBIsolatedSceneOrientationFollowingContainerView bounds](self->_containerView, "bounds");
  v4 = v3;
  v6 = v5;
  v7 = v5;
  v8 = *MEMORY[0x1E0C9D538];
  v9 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v10 = -[SBIsolatedSceneOrientationFollowingContainerView hostOrientation](self->_containerView, "hostOrientation");
  WeakRetained = objc_loadWeakRetained((id *)&self->_orientationDelegate);
  if (objc_msgSend(WeakRetained, "shouldFollowSceneOrientation"))
  {
    v12 = (unint64_t)(v10 - 3) < 2;
LABEL_4:
    v14 = v4;
    goto LABEL_6;
  }
  v13 = objc_msgSend(WeakRetained, "supportedInterfaceOrientations");
  v12 = (unint64_t)(v10 - 3) < 2;
  if (((1 << v10) & (unint64_t)~v13) == 0)
    goto LABEL_4;
  v14 = v7;
  v7 = v4;
LABEL_6:
  if (v12)
  {
    v6 = v14;
    v4 = v7;
  }

  v15 = v8;
  v16 = v9;
  v17 = v4;
  v18 = v6;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (SBIsolatedSceneOrientationFollowingWrapperOrientationDelegate)orientationDelegate
{
  return (SBIsolatedSceneOrientationFollowingWrapperOrientationDelegate *)objc_loadWeakRetained((id *)&self->_orientationDelegate);
}

- (void)setOrientationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_orientationDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_orientationDelegate);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_hostedOverlayView, 0);
  objc_storeStrong((id *)&self->_appOverlayHostWrapper, 0);
  objc_storeStrong((id *)&self->_traitsOrientationResolutionPolicy, 0);
  objc_storeStrong((id *)&self->_traitsResolutionPolicySpecifier, 0);
  objc_storeStrong((id *)&self->_traitsParticipant, 0);
  objc_storeStrong((id *)&self->_appOverlayWindow, 0);
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_storeStrong((id *)&self->_sceneHandle, 0);
}

@end
