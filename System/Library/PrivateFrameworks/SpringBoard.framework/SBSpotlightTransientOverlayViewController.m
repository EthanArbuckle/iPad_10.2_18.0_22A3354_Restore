@implementation SBSpotlightTransientOverlayViewController

- (SBSpotlightTransientOverlayViewController)init
{
  SBSpotlightTransientOverlayViewController *v2;
  uint64_t v3;
  SBSpotlightSettings *settings;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBSpotlightTransientOverlayViewController;
  v2 = -[SBSpotlightTransientOverlayViewController init](&v6, sel_init);
  if (v2)
  {
    +[SBSpotlightDomain rootSettings](SBSpotlightDomain, "rootSettings");
    v3 = objc_claimAutoreleasedReturnValue();
    settings = v2->_settings;
    v2->_settings = (SBSpotlightSettings *)v3;

    v2->_presentationSource = 6;
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[SBSpotlightTransientOverlaySpotlightViewController willMoveToParentViewController:](self->_spotlightViewController, "willMoveToParentViewController:", 0);
  -[SBSpotlightTransientOverlaySpotlightViewController removeFromParentViewController](self->_spotlightViewController, "removeFromParentViewController");
  v3.receiver = self;
  v3.super_class = (Class)SBSpotlightTransientOverlayViewController;
  -[SBTransientOverlayViewController dealloc](&v3, sel_dealloc);
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBSpotlightTransientOverlayViewController;
  -[SBTransientOverlayViewController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  -[SBSpotlightTransientOverlayViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "spotlightTransientOverlayViewControllerDidPresent:", self);

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBSpotlightTransientOverlayViewController;
  -[SBSpotlightTransientOverlayViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  -[SBSpotlightTransientOverlayViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "spotlightTransientOverlayViewControllerWillDismiss:", self);

}

- (void)viewDidLayoutSubviews
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
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)SBSpotlightTransientOverlayViewController;
  -[SBTransientOverlayViewController viewDidLayoutSubviews](&v25, sel_viewDidLayoutSubviews);
  -[SBTransientOverlayViewController contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[UIView setBounds:](self->_scalingView, "setBounds:", v5, v7, v9, v11);
  -[SBSpotlightSettings anchorPointY](self->_settings, "anchorPointY");
  v13 = v12;
  -[UIView setCenter:](self->_scalingView, "setCenter:", v5 + v9 * 0.5, v7 + v11 * v12);
  -[UIView layer](self->_scalingView, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAnchorPoint:", 0.5, v13);

  -[SBTransientOverlayViewController backgroundView](self, "backgroundView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bounds");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  -[UIVisualEffectView setFrame:](self->_blurEffectView, "setFrame:", v17, v19, v21, v23);
  -[SBSpotlightTransientOverlaySpotlightViewController view](self->_spotlightViewController, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setFrame:", v5, v7, v9, v11);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  UIVisualEffectView *v5;
  UIVisualEffectView *blurEffectView;
  id v7;
  void *v8;
  UIView *v9;
  UIView *scalingView;
  void *v11;
  SBSpotlightTransientOverlaySpotlightViewController *v12;
  SBSpotlightTransientOverlaySpotlightViewController *spotlightViewController;
  SBSpotlightTransientOverlaySpotlightViewController *v14;
  id WeakRetained;
  UIView *v16;
  void *v17;
  UIPanGestureRecognizer *v18;
  UIPanGestureRecognizer *panGestureRecognizer;
  void *v20;
  UITapGestureRecognizer *v21;
  UITapGestureRecognizer *tapToDismissGestureRecognizer;
  void *v23;
  void *v24;
  void *v25;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)SBSpotlightTransientOverlayViewController;
  -[SBTransientOverlayViewController viewDidLoad](&v26, sel_viewDidLoad);
  -[SBTransientOverlayViewController backgroundView](self, "backgroundView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(MEMORY[0x1E0DA9D10], "enableFloatingWindow") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (UIVisualEffectView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABE8]), "initWithEffect:", v4);
    blurEffectView = self->_blurEffectView;
    self->_blurEffectView = v5;

    objc_msgSend(v3, "addSubview:", self->_blurEffectView);
  }
  v7 = objc_alloc(MEMORY[0x1E0CEABB0]);
  -[SBTransientOverlayViewController contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v9 = (UIView *)objc_msgSend(v7, "initWithFrame:");
  scalingView = self->_scalingView;
  self->_scalingView = v9;

  -[SBTransientOverlayViewController contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", self->_scalingView);

  v12 = objc_alloc_init(SBSpotlightTransientOverlaySpotlightViewController);
  spotlightViewController = self->_spotlightViewController;
  self->_spotlightViewController = v12;

  v14 = self->_spotlightViewController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_targetDisplayConfiguration);
  -[SBSpotlightMultiplexingViewController setTargetDisplayConfiguration:](v14, "setTargetDisplayConfiguration:", WeakRetained);

  -[SBSpotlightTransientOverlaySpotlightViewController setPresentationSource:](self->_spotlightViewController, "setPresentationSource:", self->_presentationSource);
  -[SBSpotlightMultiplexingViewController setSpotlightDelegate:](self->_spotlightViewController, "setSpotlightDelegate:", self);
  -[SBSpotlightTransientOverlayViewController addChildViewController:](self, "addChildViewController:", self->_spotlightViewController);
  v16 = self->_scalingView;
  -[SBSpotlightTransientOverlaySpotlightViewController view](self->_spotlightViewController, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView addSubview:](v16, "addSubview:", v17);

  -[SBSpotlightTransientOverlaySpotlightViewController didMoveToParentViewController:](self->_spotlightViewController, "didMoveToParentViewController:", self);
  v18 = (UIPanGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7F8]), "initWithTarget:action:", self, sel__handlePanGestureRecognizer_);
  panGestureRecognizer = self->_panGestureRecognizer;
  self->_panGestureRecognizer = v18;

  -[UIPanGestureRecognizer setAllowedScrollTypesMask:](self->_panGestureRecognizer, "setAllowedScrollTypesMask:", 3);
  -[SBSpotlightTransientOverlayViewController view](self, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addGestureRecognizer:", self->_panGestureRecognizer);

  v21 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", self, sel__handleTapToDismissGestureRecognizer_);
  tapToDismissGestureRecognizer = self->_tapToDismissGestureRecognizer;
  self->_tapToDismissGestureRecognizer = v21;

  -[SBSpotlightTransientOverlayViewController view](self, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addGestureRecognizer:", self->_tapToDismissGestureRecognizer);

  -[SBSpotlightTransientOverlayViewController view](self, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "layer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setHitTestsAsOpaque:", 1);

  -[SBSpotlightTransientOverlayViewController _setSpotlightPresented:withAnimationMode:alongsideAnimationBlock:completion:](self, "_setSpotlightPresented:withAnimationMode:alongsideAnimationBlock:completion:", 0, 2, 0, 0);
}

- (void)_handlePanGestureRecognizer:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  -[UIViewController _sbWindowScene](self, "_sbWindowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modalUIFluidDismissGestureManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v7, "state");
  if ((unint64_t)(v6 - 3) >= 3)
  {
    if (v6 == 2)
    {
      objc_msgSend(v5, "handleGestureChanged:", v7);
    }
    else if (v6 == 1)
    {
      objc_msgSend(v5, "handleGestureBegan:initiatedFromBottomEdge:", v7, 0);
    }
  }
  else
  {
    objc_msgSend(v5, "handleGestureEnded:", v7);
  }

}

- (void)_handleTapToDismissGestureRecognizer:(id)a3
{
  if (objc_msgSend(a3, "state") == 3)
    -[SBSpotlightTransientOverlayViewController dismissSearchView](self, "dismissSearchView");
}

- (unint64_t)supportedInterfaceOrientations
{
  return +[SBSpotlightMultiplexingViewController spotlightSupportedInterfaceOrientations](SBSpotlightMultiplexingViewController, "spotlightSupportedInterfaceOrientations");
}

- (BOOL)shouldDisableOrientationUpdates
{
  return -[SBSpotlightTransientOverlayViewController supportedInterfaceOrientations](self, "supportedInterfaceOrientations") == 2;
}

- (BOOL)shouldAutorotate
{
  return !-[SBSpotlightTransientOverlayViewController shouldDisableOrientationUpdates](self, "shouldDisableOrientationUpdates");
}

- (int)_preferredStatusBarVisibility
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  return 2 * ((v3 & 0xFFFFFFFFFFFFFFFBLL) != 1);
}

- (int64_t)preferredStatusBarStyle
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)handleHomeButtonPress
{
  id WeakRetained;
  BOOL v4;
  objc_super v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "spotlightTransientOverlayViewControllerRequestsDismissal:", self);
    v4 = 1;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)SBSpotlightTransientOverlayViewController;
    v4 = -[SBTransientOverlayViewController handleHomeButtonPress](&v6, sel_handleHomeButtonPress);
  }

  return v4;
}

- (void)handleGestureDismissal
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "spotlightTransientOverlayViewControllerRequestsDismissal:", self);

}

- (id)sceneDeactivationPredicate
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend((id)objc_opt_class(), "sharedRemoteSearchViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sceneIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__SBSpotlightTransientOverlayViewController_sceneDeactivationPredicate__block_invoke;
  v7[3] = &unk_1E8EA3EA0;
  v8 = v3;
  v4 = v3;
  v5 = (void *)MEMORY[0x1D17E5550](v7);

  return v5;
}

uint64_t __71__SBSpotlightTransientOverlayViewController_sceneDeactivationPredicate__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32)) ^ 1;

  return v4;
}

- (id)hostedSceneIdentityTokens
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  +[SBSpotlightMultiplexingViewController spotlightSceneIdentityTokenIfActiveForeground](SBSpotlightMultiplexingViewController, "spotlightSceneIdentityTokenIfActiveForeground");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    v6[0] = v2;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)isContentOpaque
{
  return 0;
}

- (int64_t)preferredLockedGestureDismissalStyle
{
  return 4;
}

- (int64_t)preferredUnlockedGestureDismissalStyle
{
  return 4;
}

- (id)preferredDisplayLayoutElementIdentifier
{
  return (id)*MEMORY[0x1E0DAB698];
}

- (id)newTransientOverlayDismissalTransitionCoordinator
{
  SBTransientOverlayBlockTransitionCoordinator *v3;
  _QWORD v5[5];

  v3 = objc_alloc_init(SBTransientOverlayBlockTransitionCoordinator);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __94__SBSpotlightTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke;
  v5[3] = &unk_1E8E9E9A8;
  v5[4] = self;
  -[SBTransientOverlayBlockTransitionCoordinator setStartTransitionHandler:](v3, "setStartTransitionHandler:", v5);
  return v3;
}

void __94__SBSpotlightTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;

  v3 = a2;
  if (objc_msgSend(v3, "isAnimated"))
    v4 = 3;
  else
    v4 = 2;
  v5 = *(void **)(a1 + 32);
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __94__SBSpotlightTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_2;
  v12[3] = &unk_1E8E9E820;
  v7 = v3;
  v8 = *(_QWORD *)(a1 + 32);
  v13 = v7;
  v14 = v8;
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __94__SBSpotlightTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_3;
  v10[3] = &unk_1E8EA46E8;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v5, "_setSpotlightPresented:withAnimationMode:alongsideAnimationBlock:completion:", 0, v4, v12, v10);

}

uint64_t __94__SBSpotlightTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "performAlongsideTransitions");
  return objc_msgSend(*(id *)(a1 + 40), "setPresentationDimmingAlpha:", 0.0);
}

uint64_t __94__SBSpotlightTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeTransition:", 1);
}

- (id)newTransientOverlayPresentationTransitionCoordinator
{
  SBTransientOverlayBlockTransitionCoordinator *v3;
  _QWORD v5[5];

  v3 = objc_alloc_init(SBTransientOverlayBlockTransitionCoordinator);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __97__SBSpotlightTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke;
  v5[3] = &unk_1E8E9E9A8;
  v5[4] = self;
  -[SBTransientOverlayBlockTransitionCoordinator setStartTransitionHandler:](v3, "setStartTransitionHandler:", v5);
  return v3;
}

void __97__SBSpotlightTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v10 = v3;
  if (*(_BYTE *)(v4 + 1400))
  {
    v5 = v3;
    v6 = *(id *)(v4 + 1408);
    *(_QWORD *)(v4 + 1408) = v5;
  }
  else
  {
    if (objc_msgSend(v3, "isAnimated"))
      v7 = 3;
    else
      v7 = 2;
    v8 = *(void **)(a1 + 32);
    v9 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __97__SBSpotlightTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_2;
    v13[3] = &unk_1E8E9DED8;
    v14 = v10;
    v11[0] = v9;
    v11[1] = 3221225472;
    v11[2] = __97__SBSpotlightTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_3;
    v11[3] = &unk_1E8EA46E8;
    v12 = v14;
    objc_msgSend(v8, "_setSpotlightPresented:withAnimationMode:alongsideAnimationBlock:completion:", 1, v7, v13, v11);

    v6 = v14;
  }

}

uint64_t __97__SBSpotlightTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performAlongsideTransitions");
}

uint64_t __97__SBSpotlightTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeTransition:", 1);
}

- (BOOL)prefersWindowHitTestingDisabled
{
  return !-[SBSpotlightTransientOverlayViewController _isSpotlightVisible](self, "_isSpotlightVisible");
}

- (BOOL)dismissesForCoverSheetPresentation
{
  return 1;
}

- (int64_t)homeAffordanceSuppression
{
  return 2;
}

- (BOOL)preservesAppSwitcherDuringPresentationAndDismissal
{
  return 1;
}

- (id)presentationDimmingViewColor
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
}

- (BOOL)dismissesSiriForPresentation
{
  return 0;
}

- (BOOL)shouldPreventDragAndDrop
{
  return 0;
}

- (BOOL)allowsStackingOverlayContentAbove
{
  return 1;
}

- (BOOL)preventsClippingToBounds
{
  return 1;
}

- (BOOL)shouldUseSceneBasedKeyboardFocus
{
  return 1;
}

- (BOOL)isPresentedFromSceneWithIdentityTokenString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;

  v3 = a3;
  +[SBSpotlightMultiplexingViewController spotlightSceneIdentityTokenIfActiveForeground](SBSpotlightMultiplexingViewController, "spotlightSceneIdentityTokenIfActiveForeground");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", v3);

  return v6;
}

- (id)keyboardFocusTarget
{
  return +[SBSpotlightMultiplexingViewController keyboardFocusTargetIfActiveForeground](SBSpotlightMultiplexingViewController, "keyboardFocusTargetIfActiveForeground");
}

- (BOOL)prefersEmbeddedDisplayPresentation
{
  unint64_t presentationSource;

  presentationSource = self->_presentationSource;
  return presentationSource == 1 || presentationSource == 7;
}

- (void)setPresentationSource:(unint64_t)a3
{
  if (self->_presentationSource != a3)
  {
    self->_presentationSource = a3;
    -[SBSpotlightTransientOverlaySpotlightViewController setPresentationSource:](self->_spotlightViewController, "setPresentationSource:");
  }
}

- (void)setTargetDisplayConfiguration:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_targetDisplayConfiguration);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_targetDisplayConfiguration, obj);
    -[SBSpotlightMultiplexingViewController setTargetDisplayConfiguration:](self->_spotlightViewController, "setTargetDisplayConfiguration:", obj);
  }

}

- (void)beginInteractivePresentation
{
  void *v3;

  -[SBSpotlightTransientOverlayViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  self->_presentingInteractively = 1;
  self->_performedAlongsideAnimations = 0;
  objc_msgSend((id)objc_opt_class(), "sharedRemoteSearchViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRevealProgress:", 0.0);

  -[SBSpotlightTransientOverlayViewController _setSpotlightPresented:withAnimationMode:alongsideAnimationBlock:completion:](self, "_setSpotlightPresented:withAnimationMode:alongsideAnimationBlock:completion:", 0, 2, 0, 0);
}

- (void)updateInteractivePresentationWithProgress:(double)a3 translation:(double)a4
{
  SBSpotlightSettings *v7;
  double v8;
  double v9;
  BOOL v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  _QWORD v28[10];
  __int128 v29;
  uint64_t v30;
  uint64_t v31;

  v7 = self->_settings;
  -[SBSpotlightSettings hiddenScale](self->_settings, "hiddenScale");
  v9 = v8;
  v10 = -[SBSpotlightTransientOverlayViewController _isSpotlightVisible](self, "_isSpotlightVisible");
  if (-[SBSpotlightTransientOverlayViewController _isReduceMotionOrTransparency](self, "_isReduceMotionOrTransparency"))
  {
    -[SBSpotlightSettings minTranslationToShowSpotlight](v7, "minTranslationToShowSpotlight");
    v12 = 0.0;
    v9 = 1.0;
    v13 = fmin(fmax(a4 / v11 + 0.0, 0.0), 1.0);
    -[SBSpotlightSettings minTranslationToShowSpotlight](v7, "minTranslationToShowSpotlight");
    v29 = 0u;
    v31 = 1;
    v30 = v14;
    BYTE8(v29) = 1;
    -[SBSpotlightSettings spotlightTranslationRubberbandingRange](v7, "spotlightTranslationRubberbandingRange");
    BSUIConstrainValueToIntervalWithRubberBand();
    v16 = v15;
    -[SBSpotlightSettings minTranslationToShowSpotlight](v7, "minTranslationToShowSpotlight");
    v18 = -(v17 - v16);
    v19 = 5;
    v20 = 0.0;
  }
  else
  {
    v12 = *MEMORY[0x1E0C9D538];
    v18 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    if (v10)
    {
      if (a4 <= 0.0)
      {
        -[SBSpotlightSettings hiddenScale](self->_settings, "hiddenScale");
        v9 = v26;
        v13 = 0.0;
        v20 = 1.0;
      }
      else
      {
        -[SBSpotlightSettings minTranslationToShowSpotlight](v7, "minTranslationToShowSpotlight");
        -[SBSpotlightSettings maxTranslationForSpotlightScale](v7, "maxTranslationForSpotlightScale");
        v13 = 1.0;
        -[SBSpotlightSettings spotlightScaleRubberbandingMin](self->_settings, "spotlightScaleRubberbandingMin");
        v22 = v21;
        -[SBSpotlightSettings spotlightScaleRubberbandingMax](self->_settings, "spotlightScaleRubberbandingMax");
        v28[6] = v22;
        v28[8] = v23;
        v28[7] = 1;
        v28[9] = 1;
        -[SBSpotlightSettings spotlightScaleRubberbandingRange](self->_settings, "spotlightScaleRubberbandingRange");
        BSUIConstrainValueToIntervalWithRubberBand();
        v9 = v24;
        v20 = 0.0;
      }
      v19 = 3;
    }
    else
    {
      -[SBSpotlightSettings minTranslationToShowSpotlight](v7, "minTranslationToShowSpotlight");
      v19 = 3;
      if (v25 >= a4)
        v20 = 1.0;
      else
        v20 = 0.0;
      if (v25 >= a4)
        v13 = 0.0;
      else
        v13 = 1.0;
      if (v25 < a4)
        v9 = 1.0;
    }
  }
  -[SBTransientOverlayViewController setPresentationDimmingViewHidden:](self, "setPresentationDimmingViewHidden:", 0);
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __99__SBSpotlightTransientOverlayViewController_updateInteractivePresentationWithProgress_translation___block_invoke;
  v28[3] = &unk_1E8E9DE88;
  *(double *)&v28[5] = a4;
  v28[4] = self;
  -[SBSpotlightTransientOverlayViewController _setSpotlightAlpha:scale:blurProgress:translation:withAnimationMode:alongsideAnimationBlock:completion:](self, "_setSpotlightAlpha:scale:blurProgress:translation:withAnimationMode:alongsideAnimationBlock:completion:", v19, v28, 0, v13, v9, v20, v12, v18);
  objc_msgSend((id)objc_opt_class(), "sharedRemoteSearchViewController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setRevealProgress:", a3);

  if (BSFloatIsOne() && !self->_performedAlongsideAnimations)
  {
    self->_performedAlongsideAnimations = 1;
    -[SBTransientOverlayTransitionContextProviding performAlongsideTransitions](self->_interactivePresentationContextProvider, "performAlongsideTransitions");
  }

}

uint64_t __99__SBSpotlightTransientOverlayViewController_updateInteractivePresentationWithProgress_translation___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1448), "maxTranslationForDimmingView");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1448), "dimmingViewRubberbandingMin");
  v3 = v2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1448), "dimmingViewRubberbandingMax");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1448), "dimmingViewRubberbandingRange", v3, 1, v4, 1);
  BSUIConstrainValueToIntervalWithRubberBand();
  return objc_msgSend(*(id *)(a1 + 32), "setPresentationDimmingAlpha:");
}

- (void)endInteractivePresentation:(BOOL)a3
{
  void *v5;
  char v6;
  void *v7;
  void *v8;
  SBTransientOverlayTransitionContextProviding *interactivePresentationContextProvider;
  SBTransientOverlayTransitionContextProviding *v10;
  _QWORD v11[5];
  char v12;
  _QWORD v13[5];
  char v14;

  if (a3)
    -[SBSpotlightTransientOverlayViewController _setSpotlightPresented:withAnimationMode:alongsideAnimationBlock:completion:](self, "_setSpotlightPresented:withAnimationMode:alongsideAnimationBlock:completion:", 1, 3, 0, 0);
  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isUILocked") & a3;

  v7 = (void *)MEMORY[0x1E0CEABB0];
  -[SBSpotlightSettings opacityAnimationSettings](self->_settings, "opacityAnimationSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __72__SBSpotlightTransientOverlayViewController_endInteractivePresentation___block_invoke;
  v13[3] = &unk_1E8E9F508;
  v13[4] = self;
  v14 = v6;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __72__SBSpotlightTransientOverlayViewController_endInteractivePresentation___block_invoke_2;
  v11[3] = &unk_1E8EA33D8;
  v12 = v6;
  v11[4] = self;
  objc_msgSend(v7, "sb_animateWithSettings:mode:animations:completion:", v8, 3, v13, v11);

  interactivePresentationContextProvider = self->_interactivePresentationContextProvider;
  if (interactivePresentationContextProvider)
  {
    -[SBTransientOverlayTransitionContextProviding completeTransition:](interactivePresentationContextProvider, "completeTransition:", 1);
    v10 = self->_interactivePresentationContextProvider;
  }
  else
  {
    v10 = 0;
  }
  self->_interactivePresentationContextProvider = 0;

  self->_presentingInteractively = 0;
  self->_performedAlongsideAnimations = 0;
}

uint64_t __72__SBSpotlightTransientOverlayViewController_endInteractivePresentation___block_invoke(uint64_t a1)
{
  id *v2;
  double v3;
  uint64_t result;
  uint64_t v5;

  v2 = *(id **)(a1 + 32);
  if (*(_BYTE *)(a1 + 40))
    objc_msgSend(v2[181], "dimmingViewRubberbandingMax");
  else
    v3 = 0.0;
  result = objc_msgSend(v2, "setPresentationDimmingAlpha:", v3);
  v5 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v5 + 1401))
    return objc_msgSend(*(id *)(v5 + 1408), "performAlongsideTransitions");
  return result;
}

uint64_t __72__SBSpotlightTransientOverlayViewController_endInteractivePresentation___block_invoke_2(uint64_t result, uint64_t a2, char a3)
{
  if ((a3 & 1) == 0 && !*(_BYTE *)(result + 40))
    return objc_msgSend(*(id *)(result + 32), "setPresentationDimmingViewHidden:", 1);
  return result;
}

- (BOOL)_isSpotlightVisible
{
  void *v2;
  char IsOne;

  -[SBSpotlightTransientOverlayViewController scalingView](self, "scalingView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alpha");
  IsOne = BSFloatIsOne();

  return IsOne;
}

- (BOOL)_isReduceMotionOrTransparency
{
  return SBReduceMotion() || SBReduceTransparency();
}

- (void)_configureBlurFilterOnView:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = 0.0;
  if (!-[SBSpotlightTransientOverlayViewController _isSpotlightVisible](self, "_isSpotlightVisible"))
  {
    -[SBSpotlightSettings hiddenBlurRadius](self->_settings, "hiddenBlurRadius");
    v5 = v6;
  }
  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C88]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setName:", CFSTR("gaussianBlur"));
  objc_msgSend(v7, "setValue:forKey:", CFSTR("low"), CFSTR("inputIntermediateBitDepth"));
  objc_msgSend(v7, "setValue:forKey:", CFSTR("low"), CFSTR("inputQuality"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValue:forKey:", v8, CFSTR("inputRadius"));

  objc_msgSend(v4, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFilters:", v10);

}

- (void)_setSpotlightPresented:(BOOL)a3 withAnimationMode:(int64_t)a4 alongsideAnimationBlock:(id)a5 completion:(id)a6
{
  _BOOL4 v8;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  double v17;
  void *v18;
  int v19;
  double v20;
  id v21;

  v8 = a3;
  v21 = a5;
  v10 = a6;
  if (v8)
  {
    v11 = 1.0;
    v12 = 0.0;
  }
  else
  {
    -[SBSpotlightSettings hiddenScale](self->_settings, "hiddenScale");
    v11 = v13;
    v12 = 1.0;
  }
  v15 = *MEMORY[0x1E0C9D538];
  v14 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  if (!-[SBSpotlightTransientOverlayViewController _isReduceMotionOrTransparency](self, "_isReduceMotionOrTransparency"))goto LABEL_13;
  if (a4 == 3)
  {
    v16 = 1440;
LABEL_9:
    if (*(Class *)((char *)&self->super.super.super.super.isa + v16) == (Class)6)
    {
      v11 = 1.0;
      v12 = 0.0;
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  if (a4 == 2)
  {
    v16 = 1432;
    goto LABEL_9;
  }
LABEL_11:
  v11 = 1.0;
  v12 = 0.0;
  if (!v8)
  {
    -[SBSpotlightSettings minTranslationToShowSpotlight](self->_settings, "minTranslationToShowSpotlight");
    v14 = -v17;
    v15 = 0.0;
  }
LABEL_13:
  if (!self->_presentingInteractively)
  {
    +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isUILocked");

    if (v19)
      -[SBTransientOverlayViewController setPresentationDimmingViewHidden:](self, "setPresentationDimmingViewHidden:", 0);
  }
  v20 = 0.0;
  if (v8)
    v20 = 1.0;
  -[SBSpotlightTransientOverlayViewController _setSpotlightAlpha:scale:blurProgress:translation:withAnimationMode:alongsideAnimationBlock:completion:](self, "_setSpotlightAlpha:scale:blurProgress:translation:withAnimationMode:alongsideAnimationBlock:completion:", a4, v21, v10, v20, v11, v12, v15, v14);

}

- (void)_setSpotlightAlpha:(double)a3 scale:(double)a4 blurProgress:(double)a5 translation:(CGPoint)a6 withAnimationMode:(int64_t)a7 alongsideAnimationBlock:(id)a8 completion:(id)a9
{
  CGFloat y;
  CGFloat x;
  id v17;
  id v18;
  SBSpotlightSettings *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  uint64_t v23;
  SBSpotlightSettings *v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  _QWORD v31[5];
  id v32;
  id v33;
  _QWORD v34[5];
  SBSpotlightSettings *v35;
  id v36;
  id v37;
  double v38;
  int64_t v39;
  double v40;
  double v41;
  CGFloat v42;
  CGFloat v43;
  _QWORD v44[4];
  id v45;
  _QWORD v46[5];
  id v47;
  double v48;

  y = a6.y;
  x = a6.x;
  v17 = a8;
  v18 = a9;
  if ((objc_msgSend(MEMORY[0x1E0DA9D10], "enableFloatingWindow") & 1) != 0)
  {
    v19 = self->_settings;
    v20 = -[SBSpotlightTransientOverlayViewController prefersWindowHitTestingDisabled](self, "prefersWindowHitTestingDisabled");
    -[SBSpotlightTransientOverlayViewController scalingView](self, "scalingView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)(a7 - 3) <= 0xFFFFFFFFFFFFFFFDLL
      && !self->_animationCount
      && !-[SBSpotlightTransientOverlayViewController _isReduceMotionOrTransparency](self, "_isReduceMotionOrTransparency"))
    {
      -[SBSpotlightTransientOverlayViewController _configureBlurFilterOnView:](self, "_configureBlurFilterOnView:", v21);
    }
    ++self->_animationCount;
    v22 = (void *)MEMORY[0x1E0DA9D48];
    v23 = MEMORY[0x1E0C809B0];
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __148__SBSpotlightTransientOverlayViewController__setSpotlightAlpha_scale_blurProgress_translation_withAnimationMode_alongsideAnimationBlock_completion___block_invoke_3;
    v34[3] = &unk_1E8EB0E88;
    v34[4] = self;
    v38 = a3;
    v24 = v19;
    v39 = a7;
    v35 = v24;
    v37 = v17;
    v36 = v21;
    v40 = a5;
    v41 = a4;
    v42 = x;
    v43 = y;
    v31[0] = v23;
    v31[1] = 3221225472;
    v31[2] = __148__SBSpotlightTransientOverlayViewController__setSpotlightAlpha_scale_blurProgress_translation_withAnimationMode_alongsideAnimationBlock_completion___block_invoke_6;
    v31[3] = &unk_1E8E9EBD0;
    v31[4] = self;
    v32 = v36;
    v33 = v18;
    v25 = v18;
    v26 = v17;
    v27 = v36;
    objc_msgSend(v22, "perform:finalCompletion:", v34, v31);
    if (v20 != -[SBSpotlightTransientOverlayViewController prefersWindowHitTestingDisabled](self, "prefersWindowHitTestingDisabled"))-[SBTransientOverlayViewController setNeedsWindowHitTestingUpdate](self, "setNeedsWindowHitTestingUpdate");

  }
  else
  {
    v28 = (void *)MEMORY[0x1E0CEABB0];
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __148__SBSpotlightTransientOverlayViewController__setSpotlightAlpha_scale_blurProgress_translation_withAnimationMode_alongsideAnimationBlock_completion___block_invoke;
    v46[3] = &unk_1E8EA1310;
    v48 = a3;
    v46[4] = self;
    v47 = v17;
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __148__SBSpotlightTransientOverlayViewController__setSpotlightAlpha_scale_blurProgress_translation_withAnimationMode_alongsideAnimationBlock_completion___block_invoke_2;
    v44[3] = &unk_1E8E9F1C0;
    v45 = v18;
    v29 = v18;
    v30 = v17;
    objc_msgSend(v28, "animateWithDuration:animations:completion:", v46, v44, 0.2);

  }
}

uint64_t __148__SBSpotlightTransientOverlayViewController__setSpotlightAlpha_scale_blurProgress_translation_withAnimationMode_alongsideAnimationBlock_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", *(double *)(a1 + 48));

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __148__SBSpotlightTransientOverlayViewController__setSpotlightAlpha_scale_blurProgress_translation_withAnimationMode_alongsideAnimationBlock_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, a2, 0);
  return result;
}

void __148__SBSpotlightTransientOverlayViewController__setSpotlightAlpha_scale_blurProgress_translation_withAnimationMode_alongsideAnimationBlock_completion___block_invoke_3(uint64_t a1, void *a2)
{
  void (**v3)(id, const __CFString *);
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  __int128 v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;

  v3 = a2;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 1432) == 6 && (BSFloatIsOne() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "snappyOpacityAnimationSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "snappyScaleAnimationSettings");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "opacityAnimationSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "scaleAnimationSettings");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;
  v7 = (void *)MEMORY[0x1E0CEABB0];
  v8 = *(_QWORD *)(a1 + 72);
  v9 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __148__SBSpotlightTransientOverlayViewController__setSpotlightAlpha_scale_blurProgress_translation_withAnimationMode_alongsideAnimationBlock_completion___block_invoke_4;
  v18[3] = &unk_1E8EB0E60;
  v18[4] = *(_QWORD *)(a1 + 32);
  v21 = *(id *)(a1 + 56);
  v19 = *(id *)(a1 + 48);
  v22 = *(_QWORD *)(a1 + 64);
  v20 = *(id *)(a1 + 40);
  v23 = *(_QWORD *)(a1 + 80);
  v3[2](v3, CFSTR("opacity"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sb_animateWithSettings:mode:animations:completion:", v4, v8, v18, v10);

  v11 = (void *)MEMORY[0x1E0CEABB0];
  v12 = *(_QWORD *)(a1 + 72);
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __148__SBSpotlightTransientOverlayViewController__setSpotlightAlpha_scale_blurProgress_translation_withAnimationMode_alongsideAnimationBlock_completion___block_invoke_5;
  v14[3] = &unk_1E8EAD3C0;
  v16 = *(_QWORD *)(a1 + 88);
  v17 = *(_OWORD *)(a1 + 96);
  v15 = *(id *)(a1 + 48);
  v3[2](v3, CFSTR("scale"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sb_animateWithSettings:mode:animations:completion:", v6, v12, v14, v13);

}

void __148__SBSpotlightTransientOverlayViewController__setSpotlightAlpha_scale_blurProgress_translation_withAnimationMode_alongsideAnimationBlock_completion___block_invoke_4(uint64_t a1)
{
  void *v2;
  int v3;
  id *v4;
  uint64_t v5;
  void *v6;
  double v7;
  void *v8;
  id v9;

  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 1400))
  {
    +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "isUILocked");

    if (v3)
    {
      v4 = *(id **)(a1 + 32);
      objc_msgSend(v4[181], "dimmingViewRubberbandingMax");
      objc_msgSend(v4, "setPresentationDimmingAlpha:");
    }
  }
  v5 = *(_QWORD *)(a1 + 56);
  if (v5)
    (*(void (**)(void))(v5 + 16))();
  objc_msgSend(*(id *)(a1 + 40), "setAlpha:", *(double *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 40), "layer");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 48), "hiddenBlurRadius");
  objc_msgSend(v6, "numberWithDouble:", v7 * *(double *)(a1 + 72));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setValue:forKeyPath:", v8, CFSTR("filters.gaussianBlur.inputRadius"));

}

uint64_t __148__SBSpotlightTransientOverlayViewController__setSpotlightAlpha_scale_blurProgress_translation_withAnimationMode_alongsideAnimationBlock_completion___block_invoke_5(uint64_t a1)
{
  __int128 v2;
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGAffineTransform v7;
  CGAffineTransform v8;
  CGAffineTransform v9;

  v2 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v9.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v9.c = v2;
  *(_OWORD *)&v9.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  v3 = *(double *)(a1 + 40);
  *(_OWORD *)&v8.a = *(_OWORD *)&v9.a;
  *(_OWORD *)&v8.c = v2;
  *(_OWORD *)&v8.tx = *(_OWORD *)&v9.tx;
  CGAffineTransformScale(&v9, &v8, v3, v3);
  v4 = *(double *)(a1 + 48);
  v5 = *(double *)(a1 + 56);
  v7 = v9;
  CGAffineTransformTranslate(&v8, &v7, v4, v5);
  v9 = v8;
  return objc_msgSend(*(id *)(a1 + 32), "setTransform:", &v8);
}

uint64_t __148__SBSpotlightTransientOverlayViewController__setSpotlightAlpha_scale_blurProgress_translation_withAnimationMode_alongsideAnimationBlock_completion___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  uint64_t result;

  if (!--*(_QWORD *)(*(_QWORD *)(a1 + 32) + 1464))
  {
    objc_msgSend(*(id *)(a1 + 40), "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFilters:", 0);

  }
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a3);
  return result;
}

- (void)dismissSearchView
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "spotlightTransientOverlayViewControllerRequestsDismissal:", self);

}

- (SBSpotlightTransientOverlayViewControllerDelegate)delegate
{
  return (SBSpotlightTransientOverlayViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (FBSDisplayConfiguration)targetDisplayConfiguration
{
  return (FBSDisplayConfiguration *)objc_loadWeakRetained((id *)&self->_targetDisplayConfiguration);
}

- (unint64_t)presentationSource
{
  return self->_presentationSource;
}

- (unint64_t)dismissalSource
{
  return self->_dismissalSource;
}

- (void)setDismissalSource:(unint64_t)a3
{
  self->_dismissalSource = a3;
}

- (SBSpotlightSettings)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
  objc_storeStrong((id *)&self->_settings, a3);
}

- (UIView)scalingView
{
  return self->_scalingView;
}

- (void)setScalingView:(id)a3
{
  objc_storeStrong((id *)&self->_scalingView, a3);
}

- (unint64_t)animationCount
{
  return self->_animationCount;
}

- (void)setAnimationCount:(unint64_t)a3
{
  self->_animationCount = a3;
}

- (SBModalUIFluidDismissGestureManager)modalUIDismissGestureManager
{
  return self->_modalUIDismissGestureManager;
}

- (void)setModalUIDismissGestureManager:(id)a3
{
  objc_storeStrong((id *)&self->_modalUIDismissGestureManager, a3);
}

- (UIPanGestureRecognizer)panGestureRecognizer
{
  return self->_panGestureRecognizer;
}

- (void)setPanGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_panGestureRecognizer, a3);
}

- (UITapGestureRecognizer)tapToDismissGestureRecognizer
{
  return self->_tapToDismissGestureRecognizer;
}

- (void)setTapToDismissGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_tapToDismissGestureRecognizer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapToDismissGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_panGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_modalUIDismissGestureManager, 0);
  objc_storeStrong((id *)&self->_scalingView, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_destroyWeak((id *)&self->_targetDisplayConfiguration);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_interactivePresentationContextProvider, 0);
  objc_storeStrong((id *)&self->_spotlightViewController, 0);
  objc_storeStrong((id *)&self->_blurEffectView, 0);
}

@end
