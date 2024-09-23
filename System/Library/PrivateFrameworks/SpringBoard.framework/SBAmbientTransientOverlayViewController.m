@implementation SBAmbientTransientOverlayViewController

- (SBAmbientTransientOverlayViewController)init
{
  SBAmbientTransientOverlayViewController *v2;
  SBActivityAmbientObserver *v3;
  SBActivityAmbientObserver *ambientActivityObserver;
  uint64_t v5;
  SBActivityManager *activityManager;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  objc_super v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)SBAmbientTransientOverlayViewController;
  v2 = -[SBAmbientTransientOverlayViewController init](&v12, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(SBActivityAmbientObserver);
    ambientActivityObserver = v2->_ambientActivityObserver;
    v2->_ambientActivityObserver = v3;

    +[SBActivityManager sharedInstance](SBActivityManager, "sharedInstance");
    v5 = objc_claimAutoreleasedReturnValue();
    activityManager = v2->_activityManager;
    v2->_activityManager = (SBActivityManager *)v5;

    -[SBActivityAmbientObserver setDelegate:](v2->_ambientActivityObserver, "setDelegate:", v2);
    -[SBActivityManager addObserver:](v2->_activityManager, "addObserver:", v2->_ambientActivityObserver);
    -[SBActivityManager setEnvironment:](v2->_activityManager, "setEnvironment:", 1);
    objc_msgSend(MEMORY[0x1E0DA9E80], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:", v2);
    -[SBTransientOverlayViewController setPresentationAllowsHomeGrabberAutoHide:](v2, "setPresentationAllowsHomeGrabberAutoHide:", 1);
    objc_opt_self();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)-[SBAmbientTransientOverlayViewController registerForTraitChanges:withAction:](v2, "registerForTraitChanges:withAction:", v9, sel__backlightLuminanceDidChange_previousTraitCollection_);

    -[SBAmbientTransientOverlayViewController setOverrideUserInterfaceStyle:](v2, "setOverrideUserInterfaceStyle:", 2);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[SBAmbientTransientOverlayViewController invalidate](self, "invalidate");
  -[BSInvalidatable invalidate](self->_lockElementBloomSuppressionAssertion, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBAmbientTransientOverlayViewController;
  -[SBTransientOverlayViewController dealloc](&v3, sel_dealloc);
}

- (void)setNotificationCount:(unint64_t)a3
{
  -[AMUIAmbientViewController setNotificationCount:](self->_ambientViewController, "setNotificationCount:", a3);
}

- (unint64_t)notificationCount
{
  return -[AMUIAmbientViewController notificationCount](self->_ambientViewController, "notificationCount");
}

- (void)setAmbientIdleTimerBehaviorProvider:(id)a3
{
  id v4;
  id v5;

  objc_storeStrong((id *)&self->_ambientIdleTimerBehaviorProvider, a3);
  -[SBTransientOverlayViewController idleTimerCoordinator](self, "idleTimerCoordinator");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v5, "idleTimerProvider:didProposeBehavior:forReason:", self, self, CFSTR("SBAmbientTransientOverlayViewController"));

}

- (PRSPosterConfiguration)activeConfiguration
{
  return (PRSPosterConfiguration *)-[AMUIAmbientViewController activeConfiguration](self->_ambientViewController, "activeConfiguration");
}

- (NSDictionary)activeConfigurationMetadata
{
  return (NSDictionary *)-[AMUIAmbientViewController activeConfigurationMetadata](self->_ambientViewController, "activeConfigurationMetadata");
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    -[SBAmbientTransientOverlayViewController _setupAmbientDefaults](self, "_setupAmbientDefaults");
    v5 = obj;
  }

}

- (BOOL)isForegroundActive
{
  SBAmbientTransientOverlayViewController *v2;
  void *v3;

  v2 = self;
  -[SBTransientOverlayViewController transientOverlayDelegate](self, "transientOverlayDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "transientOverlayViewControllerIsForegroundActive:", v2);

  return (char)v2;
}

- (void)loadView
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBAmbientTransientOverlayViewController;
  -[SBAmbientTransientOverlayViewController loadView](&v9, sel_loadView);
  -[SBAmbientTransientOverlayViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;

  if (v5 < v7)
  {
    -[SBAmbientTransientOverlayViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFrame:", 0.0, 0.0, v7, v5);

  }
}

- (void)viewDidLoad
{
  void *v3;
  AMUIAmbientViewController *v4;
  AMUIAmbientViewController *ambientViewController;
  AMUIAmbientViewController *v6;
  void *v7;
  AMUIAmbientViewController *v8;
  uint64_t v9;
  id v10;
  AMUIOnboardingViewController *v11;
  AMUIOnboardingViewController *onboardingViewController;
  AMUIOnboardingViewController *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  SBAmbientTransientOverlayViewController *v20;
  id v21;
  _QWORD v22[5];
  id v23;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)SBAmbientTransientOverlayViewController;
  -[SBTransientOverlayViewController viewDidLoad](&v24, sel_viewDidLoad);
  -[SBTransientOverlayViewController contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("sb-ambient-transient-overlay-view"));
  v4 = (AMUIAmbientViewController *)objc_alloc_init(MEMORY[0x1E0CF78E0]);
  ambientViewController = self->_ambientViewController;
  self->_ambientViewController = v4;

  -[AMUIAmbientViewController setDelegate:](self->_ambientViewController, "setDelegate:", self);
  v6 = self->_ambientViewController;
  v7 = (void *)objc_opt_new();
  -[AMUIAmbientViewController setDateProvider:](v6, "setDateProvider:", v7);

  v8 = self->_ambientViewController;
  v9 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __54__SBAmbientTransientOverlayViewController_viewDidLoad__block_invoke;
  v22[3] = &unk_1E8E9EA00;
  v22[4] = self;
  v10 = v3;
  v23 = v10;
  -[SBAmbientTransientOverlayViewController bs_addChildViewController:withSuperview:animated:transitionBlock:](self, "bs_addChildViewController:withSuperview:animated:transitionBlock:", v8, v10, 0, v22);
  if (-[SBAmbientTransientOverlayViewController _isFirstPresentation](self, "_isFirstPresentation"))
  {
    v11 = (AMUIOnboardingViewController *)objc_alloc_init(MEMORY[0x1E0CF78F0]);
    onboardingViewController = self->_onboardingViewController;
    self->_onboardingViewController = v11;

    -[AMUIOnboardingViewController setDelegate:](self->_onboardingViewController, "setDelegate:", self);
    -[AMUIOnboardingViewController setAmbientDefaults:](self->_onboardingViewController, "setAmbientDefaults:", self->_ambientDefaults);
    v13 = self->_onboardingViewController;
    v16 = v9;
    v17 = 3221225472;
    v18 = __54__SBAmbientTransientOverlayViewController_viewDidLoad__block_invoke_2;
    v19 = &unk_1E8E9EA00;
    v20 = self;
    v14 = v10;
    v21 = v14;
    -[SBAmbientTransientOverlayViewController bs_addChildViewController:withSuperview:animated:transitionBlock:](self, "bs_addChildViewController:withSuperview:animated:transitionBlock:", v13, v14, 0, &v16);
    -[AMUIOnboardingViewController view](self->_onboardingViewController, "view", v16, v17, v18, v19, v20);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bringSubviewToFront:", v15);

  }
  -[SBActivityAmbientObserver addOverlaysForOngoingActivitiesIfNecessary](self->_ambientActivityObserver, "addOverlaysForOngoingActivitiesIfNecessary");

}

void __54__SBAmbientTransientOverlayViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void (**v4)(_QWORD);
  id v5;

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 1384);
  v4 = a2;
  objc_msgSend(v3, "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "bounds");
  objc_msgSend(v5, "setFrame:");
  objc_msgSend(v5, "setAutoresizingMask:", 18);
  v4[2](v4);

}

void __54__SBAmbientTransientOverlayViewController_viewDidLoad__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void (**v4)(_QWORD);
  id v5;

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 1480);
  v4 = a2;
  objc_msgSend(v3, "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "bounds");
  objc_msgSend(v5, "setFrame:");
  objc_msgSend(v5, "setAutoresizingMask:", 18);
  v4[2](v4);

}

- (unint64_t)supportedInterfaceOrientations
{
  return 24;
}

- (int64_t)preferredStatusBarStyle
{
  return 1;
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (BOOL)preventsSystemApertureSuppressionFromBelow
{
  return 1;
}

- (BOOL)shouldAutorotate
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SBAmbientTransientOverlayViewController;
  -[SBAmbientTransientOverlayViewController viewWillAppear:](&v6, sel_viewWillAppear_);
  -[SBAmbientTransientOverlayViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ambientTransientOverlayViewController:viewWillAppear:", self, v3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SBAmbientTransientOverlayViewController;
  -[SBTransientOverlayViewController viewDidAppear:](&v6, sel_viewDidAppear_);
  -[SBAmbientTransientOverlayViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ambientTransientOverlayViewController:viewDidAppear:", self, v3);

  if ((-[AMUIAmbientViewController bs_isAppearingOrAppeared](self->_ambientViewController, "bs_isAppearingOrAppeared") & 1) == 0)
    -[AMUIAmbientViewController bs_endAppearanceTransition:](self->_ambientViewController, "bs_endAppearanceTransition:", 1);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SBAmbientTransientOverlayViewController;
  -[SBAmbientTransientOverlayViewController viewWillDisappear:](&v6, sel_viewWillDisappear_);
  -[SBAmbientTransientOverlayViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ambientTransientOverlayViewController:viewWillDisappear:", self, v3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SBAmbientTransientOverlayViewController;
  -[SBTransientOverlayViewController viewDidDisappear:](&v6, sel_viewDidDisappear_);
  -[SBAmbientTransientOverlayViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ambientTransientOverlayViewController:viewDidDisappear:", self, v3);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  long double v5;
  double v6;
  long double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SBAmbientTransientOverlayViewController;
  -[SBTransientOverlayViewController viewDidLayoutSubviews](&v14, sel_viewDidLayoutSubviews);
  -[SBAmbientTransientOverlayViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  UIRectGetCenter();
  v9 = v8;
  v11 = v10;
  v12 = hypot(v5, v7);
  -[SBTransientOverlayViewController backgroundView](self, "backgroundView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBounds:", 0.0, 0.0, v12, v12);
  objc_msgSend(v13, "setCenter:", v9, v11);

}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  objc_super v6;

  v4 = a4;
  v6.receiver = self;
  v6.super_class = (Class)SBAmbientTransientOverlayViewController;
  v5 = a3;
  -[SBTransientOverlayViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v6, sel_viewDidMoveToWindow_shouldAppearOrDisappear_, v5, v4);
  objc_msgSend(v5, "setClipsToBounds:", 0, v6.receiver, v6.super_class);

}

- (BOOL)prefersEmbeddedDisplayPresentation
{
  return 1;
}

- (BOOL)allowsStackingOverlayContentAbove
{
  return 1;
}

- (int64_t)preferredLockedGestureDismissalStyle
{
  return 0;
}

- (int64_t)preferredUnlockedGestureDismissalStyle
{
  return 0;
}

- (BOOL)isContentOpaque
{
  return 1;
}

- (BOOL)handleHomeButtonPress
{
  -[AMUIAmbientViewController handleDismiss](self->_ambientViewController, "handleDismiss");
  return 1;
}

- (BOOL)preventsDismissalOnLockForInactiveScreen
{
  return 1;
}

- (int64_t)homeAffordanceSuppression
{
  return 1;
}

- (id)audioCategoriesDisablingVolumeHUD
{
  return -[SBActivityAmbientViewController audioCategoriesDisablingVolumeHUD](self->_activityViewController, "audioCategoriesDisablingVolumeHUD");
}

- (id)newTransientOverlayPresentationTransitionCoordinator
{
  SBTransientOverlayBlockTransitionCoordinator *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  id v11;
  SBAmbientTransientOverlayViewController *v12;

  v3 = objc_alloc_init(SBTransientOverlayBlockTransitionCoordinator);
  -[SBTransientOverlayViewController contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBTransientOverlayViewController backgroundView](self, "backgroundView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __95__SBAmbientTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke;
  v9[3] = &unk_1E8EBC7C0;
  v10 = v4;
  v11 = v5;
  v12 = self;
  v6 = v5;
  v7 = v4;
  -[SBTransientOverlayBlockTransitionCoordinator setStartTransitionHandler:](v3, "setStartTransitionHandler:", v9);

  return v3;
}

void __95__SBAmbientTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke(id *a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  id *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  void *v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  _QWORD v28[5];
  _QWORD v29[4];
  id v30;
  _QWORD v31[5];
  _QWORD v32[4];
  id v33;
  _QWORD v34[5];
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;

  v3 = a2;
  if (objc_msgSend(v3, "isAnimated"))
  {
    v4 = MEMORY[0x1E0C809B0];
    v5 = (void *)MEMORY[0x1E0CEABB0];
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __95__SBAmbientTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_2;
    v37[3] = &unk_1E8E9E270;
    v38 = a1[4];
    v6 = a1[5];
    v7 = a1[6];
    v39 = v6;
    v40 = v7;
    objc_msgSend(v5, "performWithoutAnimation:", v37);
    v8 = (id *)a1[6];
    if (v8[185])
    {
      objc_msgSend(v8[185], "performPresentationAnimation");
      v8 = (id *)a1[6];
    }
    objc_msgSend(v8, "_incrementTransitionAnimationCount");
    v35[1] = 3221225472;
    v35[2] = __95__SBAmbientTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_3;
    v35[3] = &unk_1E8E9DED8;
    v36 = a1[6];
    v34[0] = v4;
    v34[1] = 3221225472;
    v34[2] = __95__SBAmbientTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_4;
    v34[3] = &unk_1E8E9E980;
    v34[4] = v36;
    v35[0] = v4;
    objc_msgSend(MEMORY[0x1E0CEABB0], "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 2, v35, v34, 1.9, 0.0, 25.0, 600.0, 500.0, 0.0);
    objc_msgSend(a1[6], "_incrementTransitionAnimationCount");
    v32[1] = 3221225472;
    v32[2] = __95__SBAmbientTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_5;
    v32[3] = &unk_1E8E9DED8;
    v33 = a1[6];
    v31[0] = v4;
    v31[1] = 3221225472;
    v31[2] = __95__SBAmbientTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_6;
    v31[3] = &unk_1E8E9E980;
    v31[4] = v33;
    v32[0] = v4;
    objc_msgSend(MEMORY[0x1E0CEABB0], "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 2, v32, v31, 1.0, 0.0, 5.0, 467.2, 104.72, 0.0);
    objc_msgSend(a1[6], "_incrementTransitionAnimationCount");
    v9 = (void *)MEMORY[0x1E0CEABB0];
    v29[0] = v4;
    v29[1] = 3221225472;
    v29[2] = __95__SBAmbientTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_7;
    v29[3] = &unk_1E8E9DED8;
    v30 = a1[4];
    v28[0] = v4;
    v28[1] = 3221225472;
    v28[2] = __95__SBAmbientTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_8;
    v28[3] = &unk_1E8E9E980;
    v28[4] = a1[6];
    objc_msgSend(v9, "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 2, v29, v28, 1.5, 0.0, 2.0, 78.9568, 50.0, 0.0);
    objc_msgSend(a1[6], "_incrementTransitionAnimationCount");
    v10 = (void *)MEMORY[0x1E0CEABB0];
    v24[0] = v4;
    v24[1] = 3221225472;
    v24[2] = __95__SBAmbientTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_9;
    v24[3] = &unk_1E8E9E270;
    v25 = a1[4];
    v26 = a1[5];
    v27 = v3;
    v18 = v4;
    v19 = 3221225472;
    v20 = __95__SBAmbientTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_10;
    v21 = &unk_1E8E9DEB0;
    v11 = v27;
    v12 = a1[6];
    v22 = v11;
    v23 = v12;
    objc_msgSend(v10, "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 2, v24, &v18, 2.3, 0.0, 30.0, 500.0, 500.0, 0.0);
    v13 = a1[6];
    v14 = (void *)v13[183];
    if (v14)
    {
      objc_msgSend(v14, "view", v18, v19, v20, v21);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_animatePresentationOfActivityView:", v15);

    }
  }
  else
  {
    objc_msgSend(a1[4], "setAlpha:", 1.0);
    objc_msgSend(a1[5], "setAlpha:", 1.0);
    v16 = a1[5];
    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setBackgroundColor:", v17);

    objc_msgSend(v3, "performAlongsideTransitions");
    objc_msgSend(v3, "completeTransition:", 1);
  }

}

void __95__SBAmbientTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  CGAffineTransform v6;

  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  v2 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v6, 1.3, 1.3);
  objc_msgSend(v2, "setTransform:", &v6);
  v3 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  objc_msgSend(*(id *)(a1 + 48), "_configureTransitionAnimationBackgroundBlurMaterialViewWithInitialWeighting:", 0.0);
  objc_msgSend(*(id *)(a1 + 48), "_configureTransitionAnimationContentBlurMaterialViewWithInitialWeighting:", 1.0);
  objc_msgSend(*(id *)(a1 + 32), "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAllowsGroupOpacity:", 1);

  *(_BYTE *)(*(_QWORD *)(a1 + 48) + 1456) = 1;
}

uint64_t __95__SBAmbientTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1408), "setWeighting:", 1.0);
}

uint64_t __95__SBAmbientTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_decrementTransitionAnimationCountAndPerformAnimationCleanUpIfNecessary");
}

uint64_t __95__SBAmbientTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_5(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  int v3;
  double v4;

  v1 = *(_QWORD **)(a1 + 32);
  v2 = (void *)v1[177];
  v3 = objc_msgSend(v1, "_isPresentingOnboardingView");
  v4 = 0.3;
  if (!v3)
    v4 = 0.0;
  return objc_msgSend(v2, "setWeighting:", v4);
}

uint64_t __95__SBAmbientTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_decrementTransitionAnimationCountAndPerformAnimationCleanUpIfNecessary");
}

uint64_t __95__SBAmbientTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_7(uint64_t a1)
{
  void *v1;
  __int128 v2;
  _OWORD v4[3];

  v1 = *(void **)(a1 + 32);
  v2 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v4[0] = *MEMORY[0x1E0C9BAA8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  return objc_msgSend(v1, "setTransform:", v4);
}

uint64_t __95__SBAmbientTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_decrementTransitionAnimationCountAndPerformAnimationCleanUpIfNecessary");
}

uint64_t __95__SBAmbientTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_9(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  v2 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CEA478], "systemBlackColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", v3);

  return objc_msgSend(*(id *)(a1 + 48), "performAlongsideTransitions");
}

uint64_t __95__SBAmbientTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_10(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "completeTransition:", 1);
  return objc_msgSend(*(id *)(a1 + 40), "_decrementTransitionAnimationCountAndPerformAnimationCleanUpIfNecessary");
}

- (id)newTransientOverlayDismissalTransitionCoordinator
{
  SBTransientOverlayBlockTransitionCoordinator *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;
  id v11;

  v3 = objc_alloc_init(SBTransientOverlayBlockTransitionCoordinator);
  -[SBTransientOverlayViewController contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBTransientOverlayViewController backgroundView](self, "backgroundView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMUIAmbientViewController setNotificationCount:](self->_ambientViewController, "setNotificationCount:", 0);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __92__SBAmbientTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke;
  v9[3] = &unk_1E8EBC7C0;
  v9[4] = self;
  v10 = v4;
  v11 = v5;
  v6 = v5;
  v7 = v4;
  -[SBTransientOverlayBlockTransitionCoordinator setStartTransitionHandler:](v3, "setStartTransitionHandler:", v9);

  return v3;
}

void __92__SBAmbientTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD *v17;
  _QWORD v18[5];
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD v25[5];
  _QWORD v26[4];
  id v27;
  _QWORD v28[5];
  _QWORD v29[4];
  id v30;
  _QWORD v31[5];
  _QWORD v32[4];
  id v33;
  _QWORD v34[5];
  id v35;
  id v36;

  v3 = a2;
  if (objc_msgSend(v3, "isAnimated"))
  {
    v4 = (void *)MEMORY[0x1E0CEABB0];
    v5 = MEMORY[0x1E0C809B0];
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __92__SBAmbientTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_2;
    v34[3] = &unk_1E8E9E270;
    v6 = a1[5];
    v34[4] = a1[4];
    v35 = v6;
    v36 = a1[6];
    objc_msgSend(v4, "performWithoutAnimation:", v34);
    objc_msgSend(a1[4], "_incrementTransitionAnimationCount");
    v7 = (void *)MEMORY[0x1E0CEABB0];
    v32[0] = v5;
    v32[1] = 3221225472;
    v32[2] = __92__SBAmbientTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_3;
    v32[3] = &unk_1E8E9DED8;
    v33 = a1[5];
    v31[0] = v5;
    v31[1] = 3221225472;
    v31[2] = __92__SBAmbientTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_4;
    v31[3] = &unk_1E8E9E980;
    v31[4] = a1[4];
    objc_msgSend(v7, "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 2, v32, v31, 0.8, 0.0, 2.0, 300.0, 50.0, 0.0);
    objc_msgSend(a1[4], "_incrementTransitionAnimationCount");
    v29[1] = 3221225472;
    v29[2] = __92__SBAmbientTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_5;
    v29[3] = &unk_1E8E9DED8;
    v30 = a1[4];
    v28[0] = v5;
    v28[1] = 3221225472;
    v28[2] = __92__SBAmbientTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_6;
    v28[3] = &unk_1E8E9E980;
    v28[4] = v30;
    v29[0] = v5;
    objc_msgSend(MEMORY[0x1E0CEABB0], "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 2, v29, v28, 0.8, 0.0, 2.0, 300.0, 50.0, 0.0);
    objc_msgSend(a1[4], "_incrementTransitionAnimationCount");
    v26[1] = 3221225472;
    v26[2] = __92__SBAmbientTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_7;
    v26[3] = &unk_1E8E9DED8;
    v27 = a1[4];
    v25[0] = v5;
    v25[1] = 3221225472;
    v25[2] = __92__SBAmbientTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_8;
    v25[3] = &unk_1E8E9E980;
    v25[4] = v27;
    v26[0] = v5;
    objc_msgSend(MEMORY[0x1E0CEABB0], "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 2, v26, v25, 1.0, 0.0, 5.0, 467.2, 104.72, 0.0);
    objc_msgSend(a1[4], "_incrementTransitionAnimationCount");
    v8 = (void *)MEMORY[0x1E0CEABB0];
    v22[0] = v5;
    v22[1] = 3221225472;
    v22[2] = __92__SBAmbientTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_9;
    v22[3] = &unk_1E8E9E820;
    v23 = a1[5];
    v24 = v3;
    v19[0] = v5;
    v19[1] = 3221225472;
    v19[2] = __92__SBAmbientTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_10;
    v19[3] = &unk_1E8E9DEB0;
    v9 = v24;
    v10 = a1[4];
    v20 = v9;
    v21 = v10;
    objc_msgSend(v8, "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 2, v22, v19, 1.5, 0.0, 2.0, 78.9568, 50.0, 0.0);
    v11 = a1[4];
    v12 = (void *)v11[183];
    if (v12)
    {
      objc_msgSend(v12, "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = v5;
      v18[1] = 3221225472;
      v18[2] = __92__SBAmbientTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_11;
      v18[3] = &unk_1E8E9DED8;
      v18[4] = a1[4];
      objc_msgSend(v11, "_animateDismissalOfActivityView:withCompletion:", v13, v18);

      v11 = a1[4];
    }
    v14 = (void *)v11[185];
    if (v14)
      objc_msgSend(v14, "performDismissalAnimation");

  }
  else
  {
    objc_msgSend(a1[5], "setAlpha:", 0.0);
    objc_msgSend(a1[6], "setAlpha:", 0.0);
    v15 = a1[6];
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setBackgroundColor:", v16);

    objc_msgSend(v3, "performAlongsideTransitions");
    objc_msgSend(v3, "completeTransition:", 1);
    v17 = a1[4];
    if (v17[183])
      objc_msgSend(v17, "_dismissActivityViewController");
  }

}

void __92__SBAmbientTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_configureTransitionAnimationBackgroundBlurMaterialViewWithInitialWeighting:", 1.0);
  objc_msgSend(*(id *)(a1 + 32), "_configureTransitionAnimationContentBlurMaterialViewWithInitialWeighting:", 0.0);
  objc_msgSend(*(id *)(a1 + 40), "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAllowsGroupOpacity:", 1);

  v3 = *(void **)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

}

uint64_t __92__SBAmbientTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __92__SBAmbientTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_decrementTransitionAnimationCountAndPerformAnimationCleanUpIfNecessary");
}

uint64_t __92__SBAmbientTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1416), "setWeighting:", 1.0);
}

uint64_t __92__SBAmbientTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_decrementTransitionAnimationCountAndPerformAnimationCleanUpIfNecessary");
}

uint64_t __92__SBAmbientTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1408), "setWeighting:", 0.0);
}

uint64_t __92__SBAmbientTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_decrementTransitionAnimationCountAndPerformAnimationCleanUpIfNecessary");
}

uint64_t __92__SBAmbientTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_9(uint64_t a1)
{
  void *v2;
  CGAffineTransform v4;

  v2 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v4, 1.3, 1.3);
  objc_msgSend(v2, "setTransform:", &v4);
  return objc_msgSend(*(id *)(a1 + 40), "performAlongsideTransitions");
}

uint64_t __92__SBAmbientTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_10(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "completeTransition:", 1);
  return objc_msgSend(*(id *)(a1 + 40), "_decrementTransitionAnimationCountAndPerformAnimationCleanUpIfNecessary");
}

uint64_t __92__SBAmbientTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_11(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dismissActivityViewController");
}

- (id)associatedBundleIdentifiersToSuppressInSystemAperture
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[SBActivityAmbientViewController primaryActivityItem](self->_activityViewController, "primaryActivityItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "descriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "platterTargetBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_msgSend(v3, "addObject:", v6);
  -[SBActivityAmbientViewController secondaryActivityItem](self->_activityViewController, "secondaryActivityItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "platterTargetBundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    objc_msgSend(v3, "addObject:", v9);

  return v3;
}

- (id)associatedSceneIdentifiersToSuppressInSystemAperture
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
  uint64_t v12;

  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBActivityAmbientViewController primaryActivityItem](self->_activityViewController, "primaryActivityItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "descriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "platterTargetBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBActivityAmbientViewController secondaryActivityItem](self->_activityViewController, "secondaryActivityItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "platterTargetBundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.InCallService")) & 1) != 0
    || objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.InCallService")))
  {
    v10 = (void *)MEMORY[0x1E0C99E60];
    v11 = (void *)objc_msgSend(CFSTR("SBAmbientFullScreenPresentationInCallSceneIdentifier"), "copy");
    objc_msgSend(v10, "setWithObject:", v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v12;
  }

  return v3;
}

- (id)preferredDisplayLayoutElementIdentifier
{
  return (id)*MEMORY[0x1E0DAB6A8];
}

- (void)setNeedsIdleTimerReset
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBAmbientTransientOverlayViewController;
  -[SBTransientOverlayViewController setNeedsIdleTimerReset](&v4, sel_setNeedsIdleTimerReset);
  -[SBAmbientTransientOverlayViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ambientTransientOverlayViewController:didUpdatedWantsIdleTimerDisabled:", self, -[SBAmbientTransientOverlayViewController wantsIdleTimerDisabled](self, "wantsIdleTimerDisabled"));

}

- (int64_t)idleTimerMode
{
  if (-[SBAmbientTransientOverlayViewController _shouldDisableIdleTimer](self, "_shouldDisableIdleTimer"))
    return 3;
  else
    return -[SBFIdleTimerBehaviorProviding idleTimerMode](self->_ambientIdleTimerBehaviorProvider, "idleTimerMode");
}

- (int64_t)idleTimerDuration
{
  if (-[SBAmbientTransientOverlayViewController _shouldDisableIdleTimer](self, "_shouldDisableIdleTimer"))
    return 14;
  else
    return -[SBFIdleTimerBehaviorProviding idleTimerDuration](self->_ambientIdleTimerBehaviorProvider, "idleTimerDuration");
}

- (int64_t)idleWarnMode
{
  if (-[SBAmbientTransientOverlayViewController _shouldDisableIdleTimer](self, "_shouldDisableIdleTimer"))
    return 1;
  else
    return -[SBFIdleTimerBehaviorProviding idleWarnMode](self->_ambientIdleTimerBehaviorProvider, "idleWarnMode");
}

- (void)addActivityItem:(id)a3 forOngoingActivity:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  v6 = a3;
  if (-[SBAmbientTransientOverlayViewController _canAddPrimaryActivityItem](self, "_canAddPrimaryActivityItem"))
  {
    -[SBAmbientTransientOverlayViewController _addNewPrimaryActivityWithItem:forOngoingActivity:](self, "_addNewPrimaryActivityWithItem:forOngoingActivity:", v6, v4);
  }
  else if (-[SBAmbientTransientOverlayViewController _canAddSecondaryActivityItem:](self, "_canAddSecondaryActivityItem:", v6))
  {
    -[SBActivityAmbientViewController addOverlayForSecondaryActivityItem:](self->_activityViewController, "addOverlayForSecondaryActivityItem:", v6);
  }
  else
  {
    -[SBActivityAmbientObserver addPendingItem:](self->_ambientActivityObserver, "addPendingItem:", v6);
  }
  -[SBAmbientTransientOverlayViewController _requestZStackParticipantPreferencesUpdate](self, "_requestZStackParticipantPreferencesUpdate");

}

- (void)removeActivityItem:(id)a3
{
  SBActivityAmbientViewController *activityViewController;
  _QWORD v5[5];

  activityViewController = self->_activityViewController;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __62__SBAmbientTransientOverlayViewController_removeActivityItem___block_invoke;
  v5[3] = &unk_1E8E9DED8;
  v5[4] = self;
  -[SBActivityAmbientViewController removeOverlayForActivityItem:withCompletion:](activityViewController, "removeOverlayForActivityItem:withCompletion:", a3, v5);
  -[SBAmbientTransientOverlayViewController _requestZStackParticipantPreferencesUpdate](self, "_requestZStackParticipantPreferencesUpdate");
}

void __62__SBAmbientTransientOverlayViewController_removeActivityItem___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1464), "primaryActivityItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2
    || (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1464), "secondaryActivityItem"),
        (v2 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
    || (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1392), "nextPendingItem"),
        (v2 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {

  }
  else if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1464), "isTransitioning") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_dismissActivityViewController");
  }
}

- (void)presentAmbientActivityAlert:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  BSDispatchMain();

}

void __71__SBAmbientTransientOverlayViewController_presentAmbientActivityAlert___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id *v4;
  _QWORD v5[4];
  id v6;

  if (objc_msgSend(*(id *)(a1 + 32), "canPresentInEnvironment:alertType:", 1, 3))
  {
    objc_msgSend(*(id *)(a1 + 32), "item");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __71__SBAmbientTransientOverlayViewController_presentAmbientActivityAlert___block_invoke_2;
    v5[3] = &unk_1E8E9DED8;
    v6 = *(id *)(a1 + 32);
    v3 = (void *)MEMORY[0x1D17E5550](v5);
    v4 = *(id **)(a1 + 40);
    if (v4[183])
      objc_msgSend(v4[183], "alertActivityItem:withAlertBlock:", v2, v3);
    else
      objc_msgSend(v4, "_addActivityViewControllerWithPrimaryItem:withOverlayMode:completion:", v2, 0, v3);

  }
}

void __71__SBAmbientTransientOverlayViewController_presentAmbientActivityAlert___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "options");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentationOptions");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4)
    v3 = objc_msgSend(v4, "interrupting");
  else
    v3 = 0;
  objc_msgSend(*(id *)(a1 + 32), "alertWithScreenOn:playSound:", 1, v3);

}

- (void)activityAmbientViewController:(id)a3 addPendingItem:(id)a4
{
  -[SBActivityAmbientObserver addPendingItem:](self->_ambientActivityObserver, "addPendingItem:", a4);
}

- (void)activityAmbientViewController:(id)a3 removePendingItem:(id)a4
{
  -[SBActivityAmbientObserver removePendingItem:](self->_ambientActivityObserver, "removePendingItem:", a4);
}

- (id)activityAmbientViewControllerNextPendingActivityItem:(id)a3
{
  return -[SBActivityAmbientObserver nextPendingItem](self->_ambientActivityObserver, "nextPendingItem", a3);
}

- (BOOL)activityAmbientViewControllerCanBeginFullOverlayDismissGesture:(id)a3
{
  SBAmbientTransientOverlayViewController *v3;
  void *v4;

  v3 = self;
  -[SBTransientOverlayViewController transientOverlayDelegate](self, "transientOverlayDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "transientOverlayViewControllerIsForegroundActive:", v3);

  return (char)v3;
}

- (BOOL)activityAmbientViewController:(id)a3 isActiveActivityItem:(id)a4
{
  return -[SBActivityAmbientObserver isActiveActivityItem:](self->_ambientActivityObserver, "isActiveActivityItem:", a4);
}

- (void)keybag:(id)a3 extendedStateDidChange:(id)a4
{
  objc_msgSend(a4, "isEffectivelyLocked", a3);
  BSDispatchMain();
}

uint64_t __73__SBAmbientTransientOverlayViewController_keybag_extendedStateDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1384), "setAuthenticated:", *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)_canAddPrimaryActivityItem
{
  void *v2;
  BOOL v3;

  -[SBActivityAmbientViewController primaryActivityItem](self->_activityViewController, "primaryActivityItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (BOOL)_canAddSecondaryActivityItem:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  BOOL v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;

  v4 = a3;
  -[SBActivityAmbientViewController secondaryActivityItem](self->_activityViewController, "secondaryActivityItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SBActivityAmbientViewController overlayMode](self->_activityViewController, "overlayMode");
  if (v5)
  {
    v7 = 0;
  }
  else
  {
    v8 = v6 == 0;
    objc_msgSend(v4, "descriptor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "platterTargetBundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBActivityAmbientViewController primaryActivityItem](self->_activityViewController, "primaryActivityItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "descriptor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "platterTargetBundleIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", v10);

    v7 = v8 & ~v14;
  }

  return v7;
}

- (void)_addNewPrimaryActivityWithItem:(id)a3 forOngoingActivity:(BOOL)a4
{
  _BOOL4 v4;
  id v6;

  v4 = a4;
  v6 = a3;
  -[SBAmbientTransientOverlayViewController _addActivityViewControllerWithPrimaryItem:withOverlayMode:completion:](self, "_addActivityViewControllerWithPrimaryItem:withOverlayMode:completion:", v6, -[SBAmbientTransientOverlayViewController _itemIsFirstPartyActivity:](self, "_itemIsFirstPartyActivity:", v6) ^ 1 | v4, 0);

}

- (void)_addActivityViewControllerWithPrimaryItem:(id)a3 withOverlayMode:(int64_t)a4 completion:(id)a5
{
  id v8;
  void (**v9)(_QWORD);
  SBActivityAmbientViewController *activityViewController;
  SBActivityAmbientViewController *v11;
  void *v12;
  void *v13;
  SBActivityAmbientViewController *v14;
  id v15;
  _QWORD v16[5];
  id v17;

  v8 = a3;
  v9 = (void (**)(_QWORD))a5;
  activityViewController = self->_activityViewController;
  if (activityViewController)
  {
    -[SBActivityAmbientViewController addOverlayForPrimaryActivityItem:withOverlayMode:](activityViewController, "addOverlayForPrimaryActivityItem:withOverlayMode:", v8, a4);
    if (v9)
      v9[2](v9);
  }
  else
  {
    v11 = -[SBActivityAmbientViewController initWithPrimaryActivityItem:overlayMode:]([SBActivityAmbientViewController alloc], "initWithPrimaryActivityItem:overlayMode:", v8, a4);
    -[SBActivityAmbientViewController setDelegate:](v11, "setDelegate:", self);
    objc_storeStrong((id *)&self->_activityViewController, v11);
    if (-[SBAmbientTransientOverlayViewController isConfiguringUIVisible](self, "isConfiguringUIVisible"))
    {
      -[SBActivityAmbientViewController view](v11, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setAlpha:", 0.0);

    }
    -[SBTransientOverlayViewController contentView](self, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = self->_activityViewController;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __112__SBAmbientTransientOverlayViewController__addActivityViewControllerWithPrimaryItem_withOverlayMode_completion___block_invoke;
    v16[3] = &unk_1E8E9EA00;
    v16[4] = self;
    v17 = v13;
    v15 = v13;
    -[SBAmbientTransientOverlayViewController bs_addChildViewController:withSuperview:animated:transitionBlock:](self, "bs_addChildViewController:withSuperview:animated:transitionBlock:", v14, v15, 1, v16);

  }
}

void __112__SBAmbientTransientOverlayViewController__addActivityViewControllerWithPrimaryItem_withOverlayMode_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void (**v4)(void);

  v4 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1464), "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "bounds");
  objc_msgSend(v3, "setFrame:");
  objc_msgSend(v3, "setAutoresizingMask:", 18);
  objc_msgSend(*(id *)(a1 + 40), "bringSubviewToFront:", v3);
  if (v4)
    v4[2]();

}

- (BOOL)_itemIsFirstPartyActivity:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  objc_msgSend(a3, "descriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "platterTargetBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[SBActivityManager sharedInstance](SBActivityManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstPartyActivityGroupingIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v4);

  return v7;
}

- (BOOL)ambientViewControllerIsAuthenticated:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend((id)SBApp, "authenticationController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAuthenticated");

  return v4;
}

- (void)ambientViewController:(id)a3 isTransitioningSettled:(BOOL)a4
{
  void *v4;
  id v5;

  if (self->_isPerformingPresentationAnimation && !a4)
  {
    -[SBTransientOverlayViewController backgroundView](self, "backgroundView", a3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundColor:", v4);

  }
}

- (id)ambientViewControllerRequestsConnectedChargerId:(id)a3
{
  void *v4;
  void *v5;

  -[SBAmbientTransientOverlayViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ambientTransientOverlayViewControllerRequestsConnectedChargerId:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)ambientViewController:(id)a3 requestsUnlock:(id)a4 withCompletion:(id)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  SBLockScreenUnlockRequest *v11;

  v6 = a5;
  v7 = a4;
  v11 = objc_alloc_init(SBLockScreenUnlockRequest);
  -[SBLockScreenUnlockRequest setSource:](v11, "setSource:", 13);
  -[SBLockScreenUnlockRequest setIntent:](v11, "setIntent:", 2);
  objc_msgSend(v7, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBLockScreenUnlockRequest setName:](v11, "setName:", v8);

  -[SBLockScreenUnlockRequest setWantsBiometricPresentation:](v11, "setWantsBiometricPresentation:", 1);
  -[SBLockScreenUnlockRequest setConfirmedNotInPocket:](v11, "setConfirmedNotInPocket:", 1);
  objc_msgSend(v7, "unlockDestination");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBLockScreenUnlockRequest setUnlockDestination:](v11, "setUnlockDestination:", v9);
  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "unlockWithRequest:completion:", v11, v6);

}

- (void)ambientViewControllerWillBeginConfiguration:(id)a3
{
  id v4;

  -[SBAmbientTransientOverlayViewController setConfiguringUIVisible:](self, "setConfiguringUIVisible:", 1);
  -[SBAmbientTransientOverlayViewController setNeedsIdleTimerReset](self, "setNeedsIdleTimerReset");
  -[SBAmbientTransientOverlayViewController _setActivityViewHidden:](self, "_setActivityViewHidden:", 1);
  -[SBAmbientTransientOverlayViewController delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ambientTransientOverlayViewControllerWillBeginConfiguration:", self);

}

- (void)ambientViewControllerWillEndConfiguration:(id)a3
{
  id v4;

  -[SBAmbientTransientOverlayViewController setConfiguringUIVisible:](self, "setConfiguringUIVisible:", 0);
  -[SBAmbientTransientOverlayViewController setNeedsIdleTimerReset](self, "setNeedsIdleTimerReset");
  -[SBAmbientTransientOverlayViewController _setActivityViewHidden:](self, "_setActivityViewHidden:", 0);
  -[SBAmbientTransientOverlayViewController delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ambientTransientOverlayViewControllerWillEndConfiguration:", self);

}

- (id)widgetHostManagerForAmbientViewController:(id)a3
{
  void *v4;
  void *v5;

  -[SBAmbientTransientOverlayViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "widgetHostManagerForAmbientTransientOverlayViewController:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)ambientDefaultsForAmbientViewController:(id)a3
{
  void *v4;
  void *v5;

  -[SBAmbientTransientOverlayViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ambientDefaultsForAmbientTransientOverlayViewController:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)defaultWidgetDescriptorStacksForAmbientViewController:(id)a3
{
  void *v4;
  void *v5;

  -[SBAmbientTransientOverlayViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "defaultWidgetDescriptorStacksForAmbientTransientOverlayViewController:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)ambientViewController:(id)a3 didSetInlineAuthenticationViewVisible:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  -[SBAmbientTransientOverlayViewController _setActivityViewHidden:](self, "_setActivityViewHidden:", a4);
  -[SBAmbientTransientOverlayViewController delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ambientTransientOverlayViewController:didSetInlineAuthenticationViewVisible:", self, v4);

}

- (BOOL)ambientViewController:(id)a3 isApplicationVisibleWithBundleIdentifier:(id)a4
{
  id v4;
  void *v5;
  char v6;

  v4 = a4;
  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isIconVisibleForBundleIdentifier:", v4);

  return v6;
}

- (void)ambientViewController:(id)a3 didSetBiometricAuthenticationDisabled:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  BSInvalidatable *lockElementBloomSuppressionAssertion;
  void *v8;
  BSInvalidatable *v9;
  BSInvalidatable *v10;
  id v11;

  v4 = a4;
  v6 = a3;
  lockElementBloomSuppressionAssertion = self->_lockElementBloomSuppressionAssertion;
  if (!v4)
  {
    v11 = v6;
    -[BSInvalidatable invalidate](lockElementBloomSuppressionAssertion, "invalidate");
    v8 = self->_lockElementBloomSuppressionAssertion;
    self->_lockElementBloomSuppressionAssertion = 0;
    goto LABEL_5;
  }
  if (!lockElementBloomSuppressionAssertion)
  {
    v11 = v6;
    +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "acquireSystemApertureLockElementBloomSuppressionAssertionWithReason:", CFSTR("Domino inline biometric auth disabled"));
    v9 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    v10 = self->_lockElementBloomSuppressionAssertion;
    self->_lockElementBloomSuppressionAssertion = v9;

LABEL_5:
    v6 = v11;
  }

}

- (BOOL)ambientViewController:(id)a3 wantsBiometricAuthenticationBlockedForDeepUserInteraction:(BOOL)a4
{
  void *v5;
  uint64_t v6;
  char v7;
  void *v8;

  if (a4)
    return 0;
  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "biometricAuthenticationCoordinator");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend((id)v6, "isAutoUnlockingDisabled");

  objc_msgSend(MEMORY[0x1E0DAC5A0], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_msgSend(v8, "hasPearlSupport");

  return v7 & v6;
}

- (void)attemptUnlockForSender:(id)a3 forBioUnlock:(BOOL)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v7 = a3;
  v8 = a5;
  if (a4)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v7, "passcode");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __90__SBAmbientTransientOverlayViewController_attemptUnlockForSender_forBioUnlock_completion___block_invoke;
  v13[3] = &unk_1E8EA4890;
  v14 = v7;
  v15 = v8;
  v11 = v8;
  v12 = v7;
  objc_msgSend(v10, "attemptUnlockWithPasscode:finishUIUnlock:completion:", v9, 0, v13);

}

uint64_t __90__SBAmbientTransientOverlayViewController_attemptUnlockForSender_forBioUnlock_completion___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  void *v4;

  v4 = *(void **)(a1 + 32);
  if (a3)
    objc_msgSend(v4, "resetForSuccess");
  else
    objc_msgSend(v4, "resetForFailedPasscode");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)ambientViewController:(id)a3 didUpdateActiveConfiguration:(id)a4 withMetadata:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a5;
  v8 = a4;
  -[SBAmbientTransientOverlayViewController delegate](self, "delegate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ambientTransientOverlayViewController:didUpdateActiveConfiguration:withMetadata:", self, v8, v7);

}

- (void)onboardingViewController:(id)a3 requestsDismissalWithUserIntent:(BOOL)a4
{
  AMUIOnboardingViewController *onboardingViewController;

  if (self->_onboardingViewController)
  {
    -[SBAmbientTransientOverlayViewController bs_removeChildViewController:](self, "bs_removeChildViewController:", a3, a4);
    onboardingViewController = self->_onboardingViewController;
    self->_onboardingViewController = 0;

  }
}

- (void)invalidate
{
  void *v3;
  BSDefaultObserver *defaultObserver;
  BSDefaultObserver *v5;
  SBActivityAmbientViewController *activityViewController;
  SBActivityAmbientViewController *v7;
  AMAmbientDefaults *ambientDefaults;
  SBActivityAmbientObserver *ambientActivityObserver;
  SBActivityManager *activityManager;

  +[SBActivityManager sharedInstance](SBActivityManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self->_ambientActivityObserver);

  -[SBActivityManager setEnvironment:](self->_activityManager, "setEnvironment:", 0);
  defaultObserver = self->_defaultObserver;
  if (defaultObserver)
  {
    -[BSDefaultObserver invalidate](defaultObserver, "invalidate");
    v5 = self->_defaultObserver;
    self->_defaultObserver = 0;

  }
  activityViewController = self->_activityViewController;
  if (activityViewController)
  {
    -[SBActivityAmbientViewController invalidate](activityViewController, "invalidate");
    v7 = self->_activityViewController;
    self->_activityViewController = 0;

  }
  ambientDefaults = self->_ambientDefaults;
  self->_ambientDefaults = 0;

  ambientActivityObserver = self->_ambientActivityObserver;
  self->_ambientActivityObserver = 0;

  activityManager = self->_activityManager;
  self->_activityManager = 0;

}

- (void)_dismissActivityViewController
{
  SBActivityAmbientViewController *activityViewController;

  if (self->_activityViewController)
  {
    -[SBAmbientTransientOverlayViewController bs_removeChildViewController:](self, "bs_removeChildViewController:");
    -[SBActivityAmbientViewController invalidate](self->_activityViewController, "invalidate");
    activityViewController = self->_activityViewController;
    self->_activityViewController = 0;

  }
}

- (BOOL)_isShowingFullActivityOverlay
{
  void *v3;
  BOOL v4;

  -[SBActivityAmbientViewController primaryActivityItem](self->_activityViewController, "primaryActivityItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = -[SBActivityAmbientViewController overlayMode](self->_activityViewController, "overlayMode") == 0;
  else
    v4 = 0;

  return v4;
}

- (void)_backlightLuminanceDidChange:(id)a3 previousTraitCollection:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[5];
  _QWORD v17[5];
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  SBLogAmbientPresentation();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v6, "traitCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "numberWithInteger:", objc_msgSend(v10, "_backlightLuminance"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v7, "_backlightLuminance"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v19 = v11;
    v20 = 2112;
    v21 = v12;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_INFO, "Backlight trait changed. New luminance: %@ old: %@", buf, 0x16u);

  }
  objc_msgSend(v6, "traitCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "_backlightLuminance");

  if (v14)
  {
    if (!objc_msgSend(v7, "_backlightLuminance"))
    {
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __96__SBAmbientTransientOverlayViewController__backlightLuminanceDidChange_previousTraitCollection___block_invoke_2;
      v16[3] = &unk_1E8E9DED8;
      v16[4] = self;
      objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v16);
      +[SBIdleTimerGlobalCoordinator sharedInstanceIfExists](SBIdleTimerGlobalCoordinator, "sharedInstanceIfExists");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "resetIdleTimerForReason:", CFSTR("Ambient Screen On"));

    }
  }
  else
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __96__SBAmbientTransientOverlayViewController__backlightLuminanceDidChange_previousTraitCollection___block_invoke;
    v17[3] = &unk_1E8E9E980;
    v17[4] = self;
    objc_msgSend(MEMORY[0x1E0D01908], "addAlongsideAnimations:completion:", 0, v17);
  }

}

uint64_t __96__SBAmbientTransientOverlayViewController__backlightLuminanceDidChange_previousTraitCollection___block_invoke(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(*(_QWORD *)(result + 32) + 1384), "bs_endAppearanceTransition:", 0);
  return result;
}

uint64_t __96__SBAmbientTransientOverlayViewController__backlightLuminanceDidChange_previousTraitCollection___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1384), "_appearState");
  if ((_DWORD)result != 1)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1384), "bs_endAppearanceTransition:", 1);
  return result;
}

- (void)_requestZStackParticipantPreferencesUpdate
{
  id v3;

  -[SBTransientOverlayViewController transientOverlayDelegate](self, "transientOverlayDelegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transientOverlayViewController:requestZStackParticipantPreferencesUpdateWithReason:", self, CFSTR("Ambient Activities Updated"));

}

- (BOOL)_shouldDisableIdleTimer
{
  return -[SBAmbientTransientOverlayViewController isConfiguringUIVisible](self, "isConfiguringUIVisible")
      || -[SBActivityAmbientViewController wantsIdleTimerDisabled](self->_activityViewController, "wantsIdleTimerDisabled");
}

- (BOOL)_isPresentingOnboardingView
{
  return self->_onboardingViewController != 0;
}

- (BOOL)_isFirstPresentation
{
  return -[AMAmbientDefaults isFirstPresentation](self->_ambientDefaults, "isFirstPresentation");
}

- (void)_registerForFirstPresentationStateChange
{
  AMAmbientDefaults *ambientDefaults;
  void *v4;
  uint64_t v5;
  id v6;
  BSDefaultObserver *v7;
  BSDefaultObserver *defaultObserver;
  _QWORD v9[4];
  id v10;
  id location;

  if (-[SBAmbientTransientOverlayViewController _isFirstPresentation](self, "_isFirstPresentation"))
  {
    objc_initWeak(&location, self);
    ambientDefaults = self->_ambientDefaults;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "firstPresentation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x1E0C80D38];
    v6 = MEMORY[0x1E0C80D38];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __83__SBAmbientTransientOverlayViewController__registerForFirstPresentationStateChange__block_invoke;
    v9[3] = &unk_1E8E9DF28;
    objc_copyWeak(&v10, &location);
    -[AMAmbientDefaults observeDefault:onQueue:withBlock:](ambientDefaults, "observeDefault:onQueue:withBlock:", v4, v5, v9);
    v7 = (BSDefaultObserver *)objc_claimAutoreleasedReturnValue();
    defaultObserver = self->_defaultObserver;
    self->_defaultObserver = v7;

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __83__SBAmbientTransientOverlayViewController__registerForFirstPresentationStateChange__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  char v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v3 = objc_msgSend(WeakRetained, "_isFirstPresentation");
    v2 = v4;
    if ((v3 & 1) == 0)
    {
      objc_msgSend(v4, "_clearContentBlurMaterialViewIfNecessary");
      v2 = v4;
    }
  }

}

- (void)_clearContentBlurMaterialViewIfNecessary
{
  _QWORD v3[5];
  _QWORD v4[5];

  if (self->_contentBlurMaterialView)
  {
    -[SBAmbientTransientOverlayViewController _incrementTransitionAnimationCount](self, "_incrementTransitionAnimationCount");
    v3[4] = self;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __83__SBAmbientTransientOverlayViewController__clearContentBlurMaterialViewIfNecessary__block_invoke;
    v4[3] = &unk_1E8E9DED8;
    v4[4] = self;
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __83__SBAmbientTransientOverlayViewController__clearContentBlurMaterialViewIfNecessary__block_invoke_2;
    v3[3] = &unk_1E8E9E980;
    objc_msgSend(MEMORY[0x1E0CEABB0], "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 2, v4, v3, 1.5, 0.0, 3.0, 200.0, 45.0, 0.0);
  }
}

uint64_t __83__SBAmbientTransientOverlayViewController__clearContentBlurMaterialViewIfNecessary__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1416), "setWeighting:", 0.0);
}

uint64_t __83__SBAmbientTransientOverlayViewController__clearContentBlurMaterialViewIfNecessary__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_decrementTransitionAnimationCountAndPerformAnimationCleanUpIfNecessary");
}

- (void)_setActivityViewHidden:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __66__SBAmbientTransientOverlayViewController__setActivityViewHidden___block_invoke;
  v3[3] = &unk_1E8E9F508;
  v4 = a3;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v3, 0.2);
}

void __66__SBAmbientTransientOverlayViewController__setActivityViewHidden___block_invoke(uint64_t a1)
{
  double v1;
  id v2;

  if (*(_BYTE *)(a1 + 40))
    v1 = 0.0;
  else
    v1 = 1.0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1464), "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", v1);

}

- (void)_setupAmbientDefaults
{
  void *v3;
  AMAmbientDefaults *v4;
  AMAmbientDefaults *ambientDefaults;

  -[SBAmbientTransientOverlayViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ambientDefaultsForAmbientTransientOverlayViewController:", self);
  v4 = (AMAmbientDefaults *)objc_claimAutoreleasedReturnValue();
  ambientDefaults = self->_ambientDefaults;
  self->_ambientDefaults = v4;

  -[SBAmbientTransientOverlayViewController _registerForFirstPresentationStateChange](self, "_registerForFirstPresentationStateChange");
}

- (void)_addProudLockViewControllerIfNecessary
{
  SBAmbientProudLockViewController *v3;
  SBAmbientProudLockViewController *proudLockViewController;
  SBAmbientProudLockViewController *v5;
  void *v6;
  _QWORD v7[5];

  if (!self->_proudLockViewController)
  {
    -[SBActivityAmbientViewController setCompactOverlayHidden:](self->_activityViewController, "setCompactOverlayHidden:", 1);
    v3 = objc_alloc_init(SBAmbientProudLockViewController);
    proudLockViewController = self->_proudLockViewController;
    self->_proudLockViewController = v3;

    v5 = self->_proudLockViewController;
    -[SBTransientOverlayViewController contentView](self, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __81__SBAmbientTransientOverlayViewController__addProudLockViewControllerIfNecessary__block_invoke;
    v7[3] = &unk_1E8EA0048;
    v7[4] = self;
    -[SBAmbientTransientOverlayViewController bs_addChildViewController:withSuperview:animated:transitionBlock:](self, "bs_addChildViewController:withSuperview:animated:transitionBlock:", v5, v6, 0, v7);

  }
}

void __81__SBAmbientTransientOverlayViewController__addProudLockViewControllerIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void (**v4)(_QWORD);
  void *v5;
  void *v6;
  void *v7;
  dispatch_time_t v8;
  _QWORD block[5];

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 1496);
  v4 = a2;
  objc_msgSend(v3, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  objc_msgSend(v5, "setFrame:");

  objc_msgSend(*(id *)(a1 + 32), "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layoutIfNeeded");

  v8 = dispatch_time(0, 500000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__SBAmbientTransientOverlayViewController__addProudLockViewControllerIfNecessary__block_invoke_2;
  block[3] = &unk_1E8E9DED8;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_after(v8, MEMORY[0x1E0C80D38], block);
  v4[2](v4);

}

uint64_t __81__SBAmbientTransientOverlayViewController__addProudLockViewControllerIfNecessary__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0DA9E80], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "state");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEffectivelyLocked");

  v5 = *(void **)(a1 + 32);
  if (v4)
    return objc_msgSend(v5, "_setProudLockAuthenticated:", 0);
  else
    return objc_msgSend(v5, "_removeProudLockViewController");
}

- (void)_setProudLockAuthenticated:(BOOL)a3
{
  _BOOL8 v3;
  SBAmbientProudLockViewController *proudLockViewController;
  _QWORD v6[4];
  id v7;
  id location;

  v3 = a3;
  objc_initWeak(&location, self);
  proudLockViewController = self->_proudLockViewController;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __70__SBAmbientTransientOverlayViewController__setProudLockAuthenticated___block_invoke;
  v6[3] = &unk_1E8E9DF28;
  objc_copyWeak(&v7, &location);
  -[SBAmbientProudLockViewController setAuthenticated:completion:](proudLockViewController, "setAuthenticated:completion:", v3, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __70__SBAmbientTransientOverlayViewController__setProudLockAuthenticated___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_removeProudLockViewController");

}

- (void)_removeProudLockViewController
{
  SBAmbientProudLockViewController *proudLockViewController;

  if (self->_proudLockViewController)
  {
    -[SBAmbientTransientOverlayViewController bs_removeChildViewController:](self, "bs_removeChildViewController:");
    proudLockViewController = self->_proudLockViewController;
    self->_proudLockViewController = 0;

    -[SBActivityAmbientViewController setCompactOverlayHidden:](self->_activityViewController, "setCompactOverlayHidden:", 0);
  }
}

- (id)_newContentBlurMaterialViewWithInitialWeighting:(double)a3 parentView:(id)a4
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v6 = (void *)MEMORY[0x1E0D47498];
  v7 = (void *)MEMORY[0x1E0CB34D0];
  v8 = a4;
  objc_msgSend(v7, "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "materialViewWithRecipeNamed:inBundle:options:initialWeighting:scaleAdjustment:", CFSTR("ambientContentOverlay"), v9, 0, 0, a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setZoomEnabled:", -[SBAmbientTransientOverlayViewController _isPresentingOnboardingView](self, "_isPresentingOnboardingView"));
  -[SBAmbientTransientOverlayViewController _configureBlurMaterialView:withParentView:](self, "_configureBlurMaterialView:withParentView:", v10, v8);

  return v10;
}

- (id)_newBackgroundBlurMaterialViewWithInitialWeighting:(double)a3 parentView:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x1E0D47498];
  v7 = a4;
  SBHBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "materialViewWithRecipeNamed:inBundle:options:initialWeighting:scaleAdjustment:", CFSTR("homeScreenOverlay"), v8, 0, &__block_literal_global_338, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBAmbientTransientOverlayViewController _configureBlurMaterialView:withParentView:](self, "_configureBlurMaterialView:withParentView:", v9, v7);
  return v9;
}

double __105__SBAmbientTransientOverlayViewController__newBackgroundBlurMaterialViewWithInitialWeighting_parentView___block_invoke()
{
  return 1.0;
}

- (void)_configureBlurMaterialView:(id)a3 withParentView:(id)a4
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;

  v5 = a4;
  v14 = a3;
  objc_msgSend(v5, "addSubview:", v14);
  objc_msgSend(v5, "bringSubviewToFront:", v14);
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);
  objc_msgSend(v14, "setAutoresizingMask:", 18);

}

- (void)_configureTransitionAnimationBackgroundBlurMaterialViewWithInitialWeighting:(double)a3
{
  MTMaterialView *v5;
  MTMaterialView *backgroundBlurMaterialView;
  id v7;

  if (!self->_backgroundBlurMaterialView)
  {
    -[SBTransientOverlayViewController backgroundView](self, "backgroundView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v5 = -[SBAmbientTransientOverlayViewController _newBackgroundBlurMaterialViewWithInitialWeighting:parentView:](self, "_newBackgroundBlurMaterialViewWithInitialWeighting:parentView:", v7, a3);
    backgroundBlurMaterialView = self->_backgroundBlurMaterialView;
    self->_backgroundBlurMaterialView = v5;

  }
}

- (void)_removeBackgroundBlurMaterialView
{
  MTMaterialView *backgroundBlurMaterialView;
  MTMaterialView *v4;

  backgroundBlurMaterialView = self->_backgroundBlurMaterialView;
  if (backgroundBlurMaterialView)
  {
    -[MTMaterialView removeFromSuperview](backgroundBlurMaterialView, "removeFromSuperview");
    v4 = self->_backgroundBlurMaterialView;
    self->_backgroundBlurMaterialView = 0;

  }
}

- (void)_configureTransitionAnimationContentBlurMaterialViewWithInitialWeighting:(double)a3
{
  void *v5;
  MTMaterialView *v6;
  MTMaterialView *contentBlurMaterialView;
  void *v8;
  id v9;

  if (!self->_contentBlurMaterialView)
  {
    -[SBTransientOverlayViewController contentView](self, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[SBAmbientTransientOverlayViewController _newContentBlurMaterialViewWithInitialWeighting:parentView:](self, "_newContentBlurMaterialViewWithInitialWeighting:parentView:", v5, a3);
    contentBlurMaterialView = self->_contentBlurMaterialView;
    self->_contentBlurMaterialView = v6;

    if (self->_onboardingViewController)
    {
      -[SBTransientOverlayViewController contentView](self, "contentView");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      -[AMUIOnboardingViewController view](self->_onboardingViewController, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "bringSubviewToFront:", v8);

    }
  }
}

- (void)_removeContentBlurMaterialView
{
  MTMaterialView *contentBlurMaterialView;
  MTMaterialView *v4;

  contentBlurMaterialView = self->_contentBlurMaterialView;
  if (contentBlurMaterialView)
  {
    -[MTMaterialView removeFromSuperview](contentBlurMaterialView, "removeFromSuperview");
    v4 = self->_contentBlurMaterialView;
    self->_contentBlurMaterialView = 0;

  }
}

- (void)_incrementTransitionAnimationCount
{
  ++self->_transitionAnimationCount;
}

- (void)_decrementTransitionAnimationCountAndPerformAnimationCleanUpIfNecessary
{
  unint64_t transitionAnimationCount;
  unint64_t v4;
  void *v5;
  id v6;

  transitionAnimationCount = self->_transitionAnimationCount;
  if (transitionAnimationCount)
  {
    v4 = transitionAnimationCount - 1;
    self->_transitionAnimationCount = v4;
    if (!v4)
    {
      -[SBAmbientTransientOverlayViewController _removeBackgroundBlurMaterialView](self, "_removeBackgroundBlurMaterialView");
      if (!-[SBAmbientTransientOverlayViewController _isPresentingOnboardingView](self, "_isPresentingOnboardingView"))
        -[SBAmbientTransientOverlayViewController _removeContentBlurMaterialView](self, "_removeContentBlurMaterialView");
      -[SBTransientOverlayViewController contentView](self, "contentView");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "layer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setAllowsGroupOpacity:", 0);

    }
  }
}

- (void)_configureActivityViewBlurMaterialWithInitialWeighting:(double)a3 parentView:(id)a4
{
  MTMaterialView *v5;
  MTMaterialView *activityBlurMaterialView;

  if (!self->_activityBlurMaterialView)
  {
    v5 = -[SBAmbientTransientOverlayViewController _newContentBlurMaterialViewWithInitialWeighting:parentView:](self, "_newContentBlurMaterialViewWithInitialWeighting:parentView:", a4, a3);
    activityBlurMaterialView = self->_activityBlurMaterialView;
    self->_activityBlurMaterialView = v5;

  }
}

- (void)_removeActivityViewBlurMaterialView
{
  MTMaterialView *activityBlurMaterialView;
  MTMaterialView *v4;

  activityBlurMaterialView = self->_activityBlurMaterialView;
  if (activityBlurMaterialView)
  {
    -[MTMaterialView removeFromSuperview](activityBlurMaterialView, "removeFromSuperview");
    v4 = self->_activityBlurMaterialView;
    self->_activityBlurMaterialView = 0;

  }
}

- (void)_animatePresentationOfActivityView:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[5];
  _QWORD v25[4];
  id v26;
  SBAmbientTransientOverlayViewController *v27;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CEABB0];
  v6 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __78__SBAmbientTransientOverlayViewController__animatePresentationOfActivityView___block_invoke;
  v25[3] = &unk_1E8E9E820;
  v7 = v4;
  v26 = v7;
  v27 = self;
  objc_msgSend(v5, "performWithoutAnimation:", v25);
  -[SBAmbientTransientOverlayViewController _incrementActivityPresentationAnimationCount](self, "_incrementActivityPresentationAnimationCount");
  v8 = (void *)MEMORY[0x1E0CEABB0];
  v24[0] = v6;
  v24[1] = 3221225472;
  v24[2] = __78__SBAmbientTransientOverlayViewController__animatePresentationOfActivityView___block_invoke_2;
  v24[3] = &unk_1E8E9DED8;
  v24[4] = self;
  v22[0] = v6;
  v22[1] = 3221225472;
  v22[2] = __78__SBAmbientTransientOverlayViewController__animatePresentationOfActivityView___block_invoke_3;
  v22[3] = &unk_1E8E9DEB0;
  v22[4] = self;
  v9 = v7;
  v23 = v9;
  objc_msgSend(v8, "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 2, v24, v22, 1.0, 0.0, 5.0, 467.2, 104.72, 0.0);
  -[SBAmbientTransientOverlayViewController _incrementActivityPresentationAnimationCount](self, "_incrementActivityPresentationAnimationCount");
  v10 = (void *)MEMORY[0x1E0CEABB0];
  v20[0] = v6;
  v20[1] = 3221225472;
  v20[2] = __78__SBAmbientTransientOverlayViewController__animatePresentationOfActivityView___block_invoke_4;
  v20[3] = &unk_1E8E9DED8;
  v21 = v9;
  v18[0] = v6;
  v18[1] = 3221225472;
  v18[2] = __78__SBAmbientTransientOverlayViewController__animatePresentationOfActivityView___block_invoke_5;
  v18[3] = &unk_1E8E9DEB0;
  v18[4] = self;
  v11 = v21;
  v19 = v11;
  objc_msgSend(v10, "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 2, v20, v18, 1.5, 0.0, 2.0, 78.9568, 50.0, 0.0);
  -[SBAmbientTransientOverlayViewController _incrementActivityPresentationAnimationCount](self, "_incrementActivityPresentationAnimationCount");
  v12 = (void *)MEMORY[0x1E0CEABB0];
  v16[0] = v6;
  v16[1] = 3221225472;
  v16[2] = __78__SBAmbientTransientOverlayViewController__animatePresentationOfActivityView___block_invoke_6;
  v16[3] = &unk_1E8E9DED8;
  v17 = v11;
  v14[0] = v6;
  v14[1] = 3221225472;
  v14[2] = __78__SBAmbientTransientOverlayViewController__animatePresentationOfActivityView___block_invoke_7;
  v14[3] = &unk_1E8E9DEB0;
  v14[4] = self;
  v15 = v17;
  v13 = v17;
  objc_msgSend(v12, "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 2, v16, v14, 2.3, 0.0, 30.0, 500.0, 500.0, 0.0);

}

void __78__SBAmbientTransientOverlayViewController__animatePresentationOfActivityView___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  CGAffineTransform v4;

  objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  v2 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v4, 1.3, 1.3);
  objc_msgSend(v2, "setTransform:", &v4);
  objc_msgSend(*(id *)(a1 + 40), "_configureActivityViewBlurMaterialWithInitialWeighting:parentView:", *(_QWORD *)(a1 + 32), 1.0);
  objc_msgSend(*(id *)(a1 + 32), "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAllowsGroupOpacity:", 1);

}

uint64_t __78__SBAmbientTransientOverlayViewController__animatePresentationOfActivityView___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1424), "setWeighting:", 0.0);
}

uint64_t __78__SBAmbientTransientOverlayViewController__animatePresentationOfActivityView___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_decrementActivityPresentationAnimationCountAndPerformAnimationCleanUpIfNecessaryForActivityView:withCompletion:", *(_QWORD *)(a1 + 40), 0);
}

uint64_t __78__SBAmbientTransientOverlayViewController__animatePresentationOfActivityView___block_invoke_4(uint64_t a1)
{
  void *v1;
  __int128 v2;
  _OWORD v4[3];

  v1 = *(void **)(a1 + 32);
  v2 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v4[0] = *MEMORY[0x1E0C9BAA8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  return objc_msgSend(v1, "setTransform:", v4);
}

uint64_t __78__SBAmbientTransientOverlayViewController__animatePresentationOfActivityView___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_decrementActivityPresentationAnimationCountAndPerformAnimationCleanUpIfNecessaryForActivityView:withCompletion:", *(_QWORD *)(a1 + 40), 0);
}

uint64_t __78__SBAmbientTransientOverlayViewController__animatePresentationOfActivityView___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

uint64_t __78__SBAmbientTransientOverlayViewController__animatePresentationOfActivityView___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_decrementActivityPresentationAnimationCountAndPerformAnimationCleanUpIfNecessaryForActivityView:withCompletion:", *(_QWORD *)(a1 + 40), 0);
}

- (void)_animateDismissalOfActivityView:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  _QWORD v28[5];
  _QWORD v29[5];
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;
  SBAmbientTransientOverlayViewController *v36;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0CEABB0];
  v9 = MEMORY[0x1E0C809B0];
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __90__SBAmbientTransientOverlayViewController__animateDismissalOfActivityView_withCompletion___block_invoke;
  v34[3] = &unk_1E8E9E820;
  v10 = v6;
  v35 = v10;
  v36 = self;
  objc_msgSend(v8, "performWithoutAnimation:", v34);
  -[SBAmbientTransientOverlayViewController _incrementActivityPresentationAnimationCount](self, "_incrementActivityPresentationAnimationCount");
  v11 = (void *)MEMORY[0x1E0CEABB0];
  v32[0] = v9;
  v32[1] = 3221225472;
  v32[2] = __90__SBAmbientTransientOverlayViewController__animateDismissalOfActivityView_withCompletion___block_invoke_2;
  v32[3] = &unk_1E8E9DED8;
  v33 = v10;
  v29[0] = v9;
  v29[1] = 3221225472;
  v29[2] = __90__SBAmbientTransientOverlayViewController__animateDismissalOfActivityView_withCompletion___block_invoke_3;
  v29[3] = &unk_1E8EA47F0;
  v29[4] = self;
  v12 = v33;
  v30 = v12;
  v13 = v7;
  v31 = v13;
  objc_msgSend(v11, "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 2, v32, v29, 0.8, 0.0, 2.0, 300.0, 50.0, 0.0);
  -[SBAmbientTransientOverlayViewController _incrementActivityPresentationAnimationCount](self, "_incrementActivityPresentationAnimationCount");
  v14 = (void *)MEMORY[0x1E0CEABB0];
  v28[0] = v9;
  v28[1] = 3221225472;
  v28[2] = __90__SBAmbientTransientOverlayViewController__animateDismissalOfActivityView_withCompletion___block_invoke_4;
  v28[3] = &unk_1E8E9DED8;
  v28[4] = self;
  v25[0] = v9;
  v25[1] = 3221225472;
  v25[2] = __90__SBAmbientTransientOverlayViewController__animateDismissalOfActivityView_withCompletion___block_invoke_5;
  v25[3] = &unk_1E8EA47F0;
  v25[4] = self;
  v15 = v12;
  v26 = v15;
  v16 = v13;
  v27 = v16;
  objc_msgSend(v14, "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 2, v28, v25, 0.8, 0.0, 2.0, 300.0, 50.0, 0.0);
  -[SBAmbientTransientOverlayViewController _incrementActivityPresentationAnimationCount](self, "_incrementActivityPresentationAnimationCount");
  v17 = (void *)MEMORY[0x1E0CEABB0];
  v23[0] = v9;
  v23[1] = 3221225472;
  v23[2] = __90__SBAmbientTransientOverlayViewController__animateDismissalOfActivityView_withCompletion___block_invoke_6;
  v23[3] = &unk_1E8E9DED8;
  v24 = v15;
  v20[0] = v9;
  v20[1] = 3221225472;
  v20[2] = __90__SBAmbientTransientOverlayViewController__animateDismissalOfActivityView_withCompletion___block_invoke_7;
  v20[3] = &unk_1E8EA47F0;
  v20[4] = self;
  v21 = v24;
  v22 = v16;
  v18 = v16;
  v19 = v24;
  objc_msgSend(v17, "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 2, v23, v20, 1.5, 0.0, 2.0, 78.9568, 50.0, 0.0);

}

void __90__SBAmbientTransientOverlayViewController__animateDismissalOfActivityView_withCompletion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
  objc_msgSend(*(id *)(a1 + 40), "_configureActivityViewBlurMaterialWithInitialWeighting:parentView:", *(_QWORD *)(a1 + 32), 0.0);
  objc_msgSend(*(id *)(a1 + 32), "layer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAllowsGroupOpacity:", 1);

}

uint64_t __90__SBAmbientTransientOverlayViewController__animateDismissalOfActivityView_withCompletion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __90__SBAmbientTransientOverlayViewController__animateDismissalOfActivityView_withCompletion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_decrementActivityPresentationAnimationCountAndPerformAnimationCleanUpIfNecessaryForActivityView:withCompletion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __90__SBAmbientTransientOverlayViewController__animateDismissalOfActivityView_withCompletion___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1424), "setWeighting:", 1.0);
}

uint64_t __90__SBAmbientTransientOverlayViewController__animateDismissalOfActivityView_withCompletion___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_decrementActivityPresentationAnimationCountAndPerformAnimationCleanUpIfNecessaryForActivityView:withCompletion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __90__SBAmbientTransientOverlayViewController__animateDismissalOfActivityView_withCompletion___block_invoke_6(uint64_t a1)
{
  void *v1;
  CGAffineTransform v3;

  v1 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v3, 1.3, 1.3);
  return objc_msgSend(v1, "setTransform:", &v3);
}

uint64_t __90__SBAmbientTransientOverlayViewController__animateDismissalOfActivityView_withCompletion___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_decrementActivityPresentationAnimationCountAndPerformAnimationCleanUpIfNecessaryForActivityView:withCompletion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_incrementActivityPresentationAnimationCount
{
  ++self->_activityPresentationAnimationCount;
}

- (void)_decrementActivityPresentationAnimationCountAndPerformAnimationCleanUpIfNecessaryForActivityView:(id)a3 withCompletion:(id)a4
{
  void (**v6)(_QWORD);
  unint64_t activityPresentationAnimationCount;
  unint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = (void (**)(_QWORD))a4;
  activityPresentationAnimationCount = self->_activityPresentationAnimationCount;
  if (activityPresentationAnimationCount)
  {
    v8 = activityPresentationAnimationCount - 1;
    self->_activityPresentationAnimationCount = v8;
    if (!v8)
    {
      -[SBAmbientTransientOverlayViewController _removeActivityViewBlurMaterialView](self, "_removeActivityViewBlurMaterialView");
      objc_msgSend(v10, "layer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setAllowsGroupOpacity:", 0);

      if (v6)
        v6[2](v6);
    }
  }

}

- (SBFIdleTimerBehaviorProviding)ambientIdleTimerBehaviorProvider
{
  return self->_ambientIdleTimerBehaviorProvider;
}

- (SBAmbientTransientOverlayViewControllerDelegate)delegate
{
  return (SBAmbientTransientOverlayViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)isConfiguringUIVisible
{
  return self->_configuringUIVisible;
}

- (void)setConfiguringUIVisible:(BOOL)a3
{
  self->_configuringUIVisible = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_ambientIdleTimerBehaviorProvider, 0);
  objc_storeStrong((id *)&self->_lockElementBloomSuppressionAssertion, 0);
  objc_storeStrong((id *)&self->_proudLockViewController, 0);
  objc_storeStrong((id *)&self->_defaultObserver, 0);
  objc_storeStrong((id *)&self->_onboardingViewController, 0);
  objc_storeStrong((id *)&self->_ambientDefaults, 0);
  objc_storeStrong((id *)&self->_activityViewController, 0);
  objc_storeStrong((id *)&self->_activityManager, 0);
  objc_storeStrong((id *)&self->_activityBlurMaterialView, 0);
  objc_storeStrong((id *)&self->_contentBlurMaterialView, 0);
  objc_storeStrong((id *)&self->_backgroundBlurMaterialView, 0);
  objc_storeStrong((id *)&self->_ambientSettings, 0);
  objc_storeStrong((id *)&self->_ambientActivityObserver, 0);
  objc_storeStrong((id *)&self->_ambientViewController, 0);
}

@end
