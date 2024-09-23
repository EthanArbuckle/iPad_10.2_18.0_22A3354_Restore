@implementation SBCoverSheetSlidingViewController

- (SBCoverSheetSystemGesturesDelegate)systemGesturesDelegate
{
  return self->_systemGesturesDelegate;
}

- (SBCoverSheetSlidingViewController)initWithContentViewController:(id)a3 canBePulledDown:(BOOL)a4 canBePulledUp:(BOOL)a5 dismissalPreemptingGestureRecognizer:(id)a6
{
  id v11;
  id v12;
  SBCoverSheetSlidingViewController *v13;
  SBCoverSheetSlidingViewController *v14;
  uint64_t v15;
  SBHomeGestureSettings *homeGestureSettings;
  uint64_t v17;
  CSLockScreenSettings *lockScreenSettings;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  SBCoverSheetScreenEdgePanGestureRecognizer *v25;
  SBScreenEdgePanGestureRecognizer *dismissGestureRecognizer;
  SBCoverSheetScreenEdgePanGestureRecognizer *v27;
  SBScreenEdgePanGestureRecognizer *dismissAddendumGestureRecognizer;
  void *v29;
  SBCoverSheetSystemGesturesDelegate *v30;
  SBIndirectPanGestureRecognizer *v31;
  SBIndirectPanGestureRecognizer *indirectDismissGestureRecognizer;
  SBIndirectPanGestureRecognizer *v33;
  SBIndirectPanGestureRecognizer *indirectPresentGestureRecognizer;
  SBFluidScrunchGestureRecognizer *v35;
  SBFluidScrunchGestureRecognizer *scrunchDismissGestureRecognizer;
  objc_super v38;

  v11 = a3;
  v12 = a6;
  v38.receiver = self;
  v38.super_class = (Class)SBCoverSheetSlidingViewController;
  v13 = -[SBCoverSheetSlidingViewController init](&v38, sel_init);
  v14 = v13;
  if (v13)
  {
    -[SBCoverSheetSlidingViewController _setIgnoreAppSupportedOrientations:](v13, "_setIgnoreAppSupportedOrientations:", 1);
    +[SBHomeGestureDomain rootSettings](SBHomeGestureDomain, "rootSettings");
    v15 = objc_claimAutoreleasedReturnValue();
    homeGestureSettings = v14->_homeGestureSettings;
    v14->_homeGestureSettings = (SBHomeGestureSettings *)v15;

    -[PTSettings addKeyObserver:](v14->_homeGestureSettings, "addKeyObserver:", v14);
    objc_msgSend(MEMORY[0x1E0D1BBD8], "rootSettings");
    v17 = objc_claimAutoreleasedReturnValue();
    lockScreenSettings = v14->_lockScreenSettings;
    v14->_lockScreenSettings = (CSLockScreenSettings *)v17;

    -[CSLockScreenSettings addKeyObserver:](v14->_lockScreenSettings, "addKeyObserver:", v14);
    -[CSLockScreenSettings coverSheetDismissGestureSettings](v14->_lockScreenSettings, "coverSheetDismissGestureSettings");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addKeyObserver:", v14);

    v14->_dismissalSlidingMode = 1;
    v14->_dismissalTransformMode = 1;
    objc_storeStrong((id *)&v14->_contentViewController, a3);
    objc_msgSend(MEMORY[0x1E0D01800], "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "homeButtonType");

    -[CSLockScreenSettings coverSheetDismissGestureSettings](v14->_lockScreenSettings, "coverSheetDismissGestureSettings");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "usesGrapeFlags") ^ 1;

    if (v21 == 2)
      v24 = 5;
    else
      v24 = 1;
    v25 = -[SBHomeGesturePanGestureRecognizer initWithTarget:action:type:options:]([SBCoverSheetScreenEdgePanGestureRecognizer alloc], "initWithTarget:action:type:options:", v14, sel__handleDismissGesture_, v24, v23);
    dismissGestureRecognizer = v14->_dismissGestureRecognizer;
    v14->_dismissGestureRecognizer = &v25->super.super;

    -[UIScreenEdgePanGestureRecognizer setEdges:](v14->_dismissGestureRecognizer, "setEdges:", 4);
    -[SBScreenEdgePanGestureRecognizer setAllowedTouchTypes:](v14->_dismissGestureRecognizer, "setAllowedTouchTypes:", &unk_1E91CE650);
    v27 = -[SBHomeGesturePanGestureRecognizer initWithTarget:action:type:options:]([SBCoverSheetScreenEdgePanGestureRecognizer alloc], "initWithTarget:action:type:options:", v14, sel__handleDismissGesture_, 1, 1);
    dismissAddendumGestureRecognizer = v14->_dismissAddendumGestureRecognizer;
    v14->_dismissAddendumGestureRecognizer = &v27->super.super;

    -[UIScreenEdgePanGestureRecognizer setEdges:](v14->_dismissAddendumGestureRecognizer, "setEdges:", 4);
    -[SBScreenEdgePanGestureRecognizer setAllowedTouchTypes:](v14->_dismissAddendumGestureRecognizer, "setAllowedTouchTypes:", &unk_1E91CE668);
    -[SBCoverSheetSlidingViewController _updateHomeGestureSettings:](v14, "_updateHomeGestureSettings:", v14->_homeGestureSettings);
    -[CSLockScreenSettings coverSheetDismissGestureSettings](v14->_lockScreenSettings, "coverSheetDismissGestureSettings");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBCoverSheetSlidingViewController _updateCoverSheetDismissSettings:](v14, "_updateCoverSheetDismissSettings:", v29);

    v30 = -[SBCoverSheetSystemGesturesDelegate initWithViewController:dismissGestureRecognizer:dismissAddendumGestureRecognizer:dismissalPreemptingGestureRecognizer:]([SBCoverSheetSystemGesturesDelegate alloc], "initWithViewController:dismissGestureRecognizer:dismissAddendumGestureRecognizer:dismissalPreemptingGestureRecognizer:", v14, v14->_dismissGestureRecognizer, v14->_dismissAddendumGestureRecognizer, v12);
    v31 = -[SBIndirectPanGestureRecognizer initWithTarget:action:edges:]([SBIndirectPanGestureRecognizer alloc], "initWithTarget:action:edges:", v14, sel__handleDismissGesture_, 4);
    indirectDismissGestureRecognizer = v14->_indirectDismissGestureRecognizer;
    v14->_indirectDismissGestureRecognizer = v31;

    -[SBIndirectPanGestureRecognizer setName:](v14->_indirectDismissGestureRecognizer, "setName:", CFSTR("indirectDismissCoverSheetGestureRecognizer"));
    -[SBIndirectPanGestureRecognizer setShouldInvertYAxis:](v14->_indirectDismissGestureRecognizer, "setShouldInvertYAxis:", 1);
    -[SBCoverSheetSystemGesturesDelegate setIndirectDismissGestureRecognizer:](v30, "setIndirectDismissGestureRecognizer:", v14->_indirectDismissGestureRecognizer);
    -[SBIndirectPanGestureRecognizer setDelegate:](v14->_indirectDismissGestureRecognizer, "setDelegate:", v30);
    -[SBIndirectPanGestureRecognizer setActivationRecognitionDistance:](v14->_indirectDismissGestureRecognizer, "setActivationRecognitionDistance:", 80.0);
    -[SBIndirectPanGestureRecognizer setShouldRequireGestureToStartAtEdge:](v14->_indirectDismissGestureRecognizer, "setShouldRequireGestureToStartAtEdge:", 1);
    -[SBIndirectPanGestureRecognizer setHysteresis:forInputType:](v14->_indirectDismissGestureRecognizer, "setHysteresis:forInputType:", 0, 30.0);
    -[SBIndirectPanGestureRecognizer setHysteresis:forInputType:](v14->_indirectDismissGestureRecognizer, "setHysteresis:forInputType:", 1, 10.0);
    -[SBIndirectPanGestureRecognizer setTranslationAdjustmentBlock:](v14->_indirectDismissGestureRecognizer, "setTranslationAdjustmentBlock:", &__block_literal_global_106);
    v33 = -[SBIndirectPanGestureRecognizer initWithTarget:action:edges:]([SBIndirectPanGestureRecognizer alloc], "initWithTarget:action:edges:", v14, sel__handleIndirectPresentGesture_, 1);
    indirectPresentGestureRecognizer = v14->_indirectPresentGestureRecognizer;
    v14->_indirectPresentGestureRecognizer = v33;

    -[SBIndirectPanGestureRecognizer setName:](v14->_indirectPresentGestureRecognizer, "setName:", CFSTR("indirectPresentCoverSheetGestureRecognizer"));
    -[SBIndirectPanGestureRecognizer setShouldInvertYAxis:](v14->_indirectPresentGestureRecognizer, "setShouldInvertYAxis:", 1);
    -[SBCoverSheetSystemGesturesDelegate setIndirectPresentGestureRecognizer:](v30, "setIndirectPresentGestureRecognizer:", v14->_indirectPresentGestureRecognizer);
    -[SBIndirectPanGestureRecognizer setDelegate:](v14->_indirectPresentGestureRecognizer, "setDelegate:", v30);
    -[SBIndirectPanGestureRecognizer setOrientationProvider:](v14->_indirectPresentGestureRecognizer, "setOrientationProvider:", v30);
    -[SBIndirectPanGestureRecognizer setActivationRecognitionDistance:](v14->_indirectPresentGestureRecognizer, "setActivationRecognitionDistance:", 80.0);
    -[SBIndirectPanGestureRecognizer setShouldRequireGestureToStartAtEdge:](v14->_indirectPresentGestureRecognizer, "setShouldRequireGestureToStartAtEdge:", 1);
    -[SBIndirectPanGestureRecognizer setHysteresis:forInputType:](v14->_indirectPresentGestureRecognizer, "setHysteresis:forInputType:", 0, 30.0);
    -[SBIndirectPanGestureRecognizer setHysteresis:forInputType:](v14->_indirectPresentGestureRecognizer, "setHysteresis:forInputType:", 1, 10.0);
    -[SBIndirectPanGestureRecognizer setTranslationAdjustmentBlock:](v14->_indirectPresentGestureRecognizer, "setTranslationAdjustmentBlock:", &__block_literal_global_14_0);
    v35 = -[SBFluidScrunchGestureRecognizer initWithTarget:action:]([SBFluidScrunchGestureRecognizer alloc], "initWithTarget:action:", v14, sel__handleDismissGesture_);
    scrunchDismissGestureRecognizer = v14->_scrunchDismissGestureRecognizer;
    v14->_scrunchDismissGestureRecognizer = v35;

    -[SBFluidScrunchGestureRecognizer setAllowedTouchTypes:](v14->_scrunchDismissGestureRecognizer, "setAllowedTouchTypes:", &unk_1E91CE680);
    -[SBCoverSheetSystemGesturesDelegate setScrunchDismissGestureRecognizer:](v30, "setScrunchDismissGestureRecognizer:", v14->_scrunchDismissGestureRecognizer);
    -[SBFluidScrunchGestureRecognizer setDelegate:](v14->_scrunchDismissGestureRecognizer, "setDelegate:", v30);
    -[SBCoverSheetSystemGesturesDelegate setPositionProvider:](v30, "setPositionProvider:", v14);
    -[SBCoverSheetSlidingViewController setSystemGesturesDelegate:](v14, "setSystemGesturesDelegate:", v30);
    -[SBScreenEdgePanGestureRecognizer setDelegate:](v14->_dismissGestureRecognizer, "setDelegate:", v30);
    -[SBScreenEdgePanGestureRecognizer setDelegate:](v14->_dismissAddendumGestureRecognizer, "setDelegate:", v30);
    -[SBCoverSheetSlidingViewController _createProperties](v14, "_createProperties");
    v14->_canBePulledDown = a4;
    v14->_canBePulledUp = a5;
    -[SBCoverSheetSlidingViewController _addSystemGestureRecognizers](v14, "_addSystemGestureRecognizers");

  }
  return v14;
}

double __134__SBCoverSheetSlidingViewController_initWithContentViewController_canBePulledDown_canBePulledUp_dismissalPreemptingGestureRecognizer___block_invoke_2(double a1)
{
  void *v2;
  int v3;

  +[SBPlatformController sharedInstance](SBPlatformController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isRoundCornerPad");

  if (v3)
    SBScreenDisplayCornerRadius();
  return a1;
}

- (void)dealloc
{
  objc_super v3;

  -[SBCoverSheetSlidingViewController invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBCoverSheetSlidingViewController;
  -[SBCoverSheetSlidingViewController dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  -[SBCoverSheetSlidingViewController _removeSystemGestureRecognizers](self, "_removeSystemGestureRecognizers");
  -[BSInvalidatable invalidate](self->_suppressTouchCancellation, "invalidate");
}

- (void)setPresented:(BOOL)a3 forUserGesture:(BOOL)a4 animated:(BOOL)a5 withCompletion:(id)a6
{
  if (a3)
    -[SBCoverSheetSlidingViewController _presentCoverSheetAnimated:forUserGesture:withCompletion:](self, "_presentCoverSheetAnimated:forUserGesture:withCompletion:", a5, a4, a6);
  else
    -[SBCoverSheetSlidingViewController _dismissCoverSheetAnimated:withCompletion:](self, "_dismissCoverSheetAnimated:withCompletion:", a5, a6);
}

- (BOOL)canTransitionToPresented:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  char v6;
  BOOL v7;

  v3 = a3;
  -[SBCoverSheetSlidingViewController systemGesturesDelegate](self, "systemGesturesDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    v6 = objc_msgSend(v4, "isPresentGestureAllowedToBegin");
  else
    v6 = objc_msgSend(v4, "isDismissGestureAllowedToBegin");
  v7 = v6;

  return v7;
}

- (BOOL)isPresentGestureActive
{
  void *v2;
  char v3;

  -[SBCoverSheetSlidingViewController systemGesturesDelegate](self, "systemGesturesDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPresentGestureActive");

  return v3;
}

- (BOOL)isDismissGestureActive
{
  void *v2;
  char v3;

  -[SBCoverSheetSlidingViewController systemGesturesDelegate](self, "systemGesturesDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDismissGestureActive");

  return v3;
}

- (BOOL)_isTransitioning
{
  void *v2;
  int v3;

  -[SBCoverSheetSlidingViewController systemGesturesDelegate](self, "systemGesturesDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "syntheticAppearState");

  return (v3 & 0xFFFFFFFD) == 1;
}

- (void)setDismissalSlidingMode:(int64_t)a3
{
  id *p_dismissAddendumGestureRecognizer;
  id v7;
  void *v8;
  _QWORD v9[5];

  if (self->_dismissalSlidingMode != a3)
  {
    if (a3 != 1 && (SBHomeGestureEnabled() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBCoverSheetSlidingViewController.m"), 282, CFSTR("We should never enter rubber banding mode on this device."));

    }
    self->_dismissalSlidingMode = a3;
    if (-[SBCoverSheetSlidingViewController isDismissGestureActive](self, "isDismissGestureActive"))
    {
      p_dismissAddendumGestureRecognizer = (id *)&self->_dismissAddendumGestureRecognizer;
      if ((unint64_t)(-[SBScreenEdgePanGestureRecognizer state](self->_dismissAddendumGestureRecognizer, "state")- 1) >= 2&& (p_dismissAddendumGestureRecognizer = (id *)&self->_dismissGestureRecognizer, (unint64_t)(-[SBScreenEdgePanGestureRecognizer state](self->_dismissGestureRecognizer, "state") - 1) >= 2)&& (p_dismissAddendumGestureRecognizer = (id *)&self->_indirectDismissGestureRecognizer, (unint64_t)(-[SBIndirectPanGestureRecognizer state](self->_indirectDismissGestureRecognizer, "state")- 1) >= 2)&& (p_dismissAddendumGestureRecognizer = (id *)&self->_scrunchDismissGestureRecognizer, (unint64_t)(-[SBFluidScrunchGestureRecognizer state](self->_scrunchDismissGestureRecognizer, "state")- 1) > 1))
      {
        v7 = 0;
      }
      else
      {
        v7 = *p_dismissAddendumGestureRecognizer;
        if (v7)
        {
          -[SBCoverSheetSlidingViewController _transitionToViewControllerAppearState:ifNeeded:forUserGesture:](self, "_transitionToViewControllerAppearState:ifNeeded:forUserGesture:", 3, 1, 1);
          if (self->_dismissalSlidingMode == 1)
          {
            self->_performingCatchUpForPresentation = 0;
            v9[0] = MEMORY[0x1E0C809B0];
            v9[1] = 3221225472;
            v9[2] = __61__SBCoverSheetSlidingViewController_setDismissalSlidingMode___block_invoke_2;
            v9[3] = &unk_1E8E9DED8;
            v9[4] = self;
            -[SBCoverSheetSlidingViewController _startCatchupAnimationWithDuration:completion:](self, "_startCatchupAnimationWithDuration:completion:", v9, 0.57);
          }
        }
      }

    }
  }
}

void __61__SBCoverSheetSlidingViewController_setDismissalSlidingMode___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1008));
  objc_msgSend(WeakRetained, "coverSheetSlidingViewControllerCleanupInterstitialTransition:", *(_QWORD *)(a1 + 32));

}

- (BOOL)isAnyGestureActivelyRecognized
{
  void *v2;
  char v3;

  -[SBCoverSheetSlidingViewController systemGesturesDelegate](self, "systemGesturesDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAnyGestureActivelyRecognized");

  return v3;
}

- (void)setDismissGesturesEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[SBCoverSheetSlidingViewController dismissGestureRecognizer](self, "dismissGestureRecognizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", v3);

  -[SBCoverSheetSlidingViewController dismissAddendumGestureRecognizer](self, "dismissAddendumGestureRecognizer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", v3);

}

- (BOOL)mathForGestureRecognizerPointsDown:(id)a3
{
  return -[SBCoverSheetSlidingViewController _mathForGestureRecognizerPointsDown:position:velocity:instantVelocity:averageVelocity:](self, "_mathForGestureRecognizerPointsDown:position:velocity:instantVelocity:averageVelocity:", a3, 0, 0, 0, 0);
}

- (void)loadView
{
  id v3;
  void *v4;
  void *v5;
  SBCoverSheetPositionView *v6;
  SBCoverSheetPositionView *v7;
  SBCoverSheetPositionView *positionView;
  SBCoverSheetPositionView *v9;
  void *v10;
  SBCoverSheetSlidingViewControllerContentViewController *contentViewController;
  void *v12;
  void *v13;
  id v14;

  v3 = objc_alloc(MEMORY[0x1E0DA9F28]);
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v14 = (id)objc_msgSend(v3, "initWithFrame:");

  objc_msgSend(v14, "setAutoresizingMask:", 18);
  objc_msgSend(v14, "setOpaque:", 0);
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setBackgroundColor:", v5);

  v6 = [SBCoverSheetPositionView alloc];
  objc_msgSend(v14, "bounds");
  v7 = -[SBCoverSheetPositionView initWithFrame:](v6, "initWithFrame:");
  positionView = self->_positionView;
  self->_positionView = v7;

  -[SBCoverSheetPositionView setAutoresizingMask:](self->_positionView, "setAutoresizingMask:", 18);
  objc_msgSend(v14, "addSubview:", self->_positionView);
  v9 = self->_positionView;
  objc_msgSend(v14, "bounds");
  -[SBCoverSheetPositionView setFrame:](v9, "setFrame:");
  -[SBCoverSheetSlidingViewController setView:](self, "setView:", v14);
  -[SBCoverSheetSlidingViewControllerContentViewController view](self->_contentViewController, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bounds");
  objc_msgSend(v10, "setFrame:");

  contentViewController = self->_contentViewController;
  -[SBCoverSheetPositionView contentView](self->_positionView, "contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBCoverSheetSlidingViewController bs_addChildViewController:withSuperview:](self, "bs_addChildViewController:withSuperview:", contentViewController, v12);

  -[SBCoverSheetSlidingViewController systemGesturesDelegate](self, "systemGesturesDelegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setSyntheticAppearState:", 0);

}

- (void)viewDidLoad
{
  _QWORD block[5];
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBCoverSheetSlidingViewController;
  -[SBCoverSheetSlidingViewController viewDidLoad](&v4, sel_viewDidLoad);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__SBCoverSheetSlidingViewController_viewDidLoad__block_invoke;
  block[3] = &unk_1E8E9DED8;
  block[4] = self;
  if (viewDidLoad_onceToken != -1)
    dispatch_once(&viewDidLoad_onceToken, block);
}

uint64_t __48__SBCoverSheetSlidingViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __48__SBCoverSheetSlidingViewController_viewDidLoad__block_invoke_2;
  v2[3] = &unk_1E8E9DED8;
  v2[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(MEMORY[0x1E0CEABB0], "_performWithoutRetargetingAnimations:", v2);
}

uint64_t __48__SBCoverSheetSlidingViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateForLocation:interactive:", 0, 0.5, -0.5);
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBCoverSheetSlidingViewController;
  -[SBCoverSheetSlidingViewController viewWillAppear:](&v7, sel_viewWillAppear_, a3);
  -[SBCoverSheetSlidingViewControllerContentViewController view](self->_contentViewController, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBCoverSheetPositionView contentView](self->_positionView, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 != v5)
  {
    objc_msgSend(v5, "bounds");
    objc_msgSend(v4, "setFrame:");
    objc_msgSend(v5, "addSubview:", v4);
  }
  -[SBCoverSheetSlidingViewController _addSystemGestureRecognizers](self, "_addSystemGestureRecognizers");

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  int v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBCoverSheetSlidingViewController;
  -[SBCoverSheetSlidingViewController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  -[SBCoverSheetSlidingViewController systemGesturesDelegate](self, "systemGesturesDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "syntheticAppearState");

  if (!v5)
    -[SBCoverSheetSlidingViewController _transitionToViewControllerAppearState:](self, "_transitionToViewControllerAppearState:", 2);
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
  void *v12;
  id v13;

  -[SBCoverSheetSlidingViewController positionView](self, "positionView");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[SBCoverSheetSlidingViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  objc_msgSend(v13, "setFrame:", v5, v7, v9, v11);
  -[CSLockScreenSettings coverSheetDismissGestureSettings](self->_lockScreenSettings, "coverSheetDismissGestureSettings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBCoverSheetSlidingViewController _updateCoverSheetDismissSettings:](self, "_updateCoverSheetDismissSettings:", v12);

}

- (BOOL)shouldAutorotate
{
  if ((SBTraitsArbiterOrientationActuationEnabledForRole(CFSTR("SBTraitsParticipantRoleCoverSheet")) & 1) != 0)
    return 1;
  else
    return -[SBCoverSheetSlidingViewControllerContentViewController shouldAutorotate](self->_contentViewController, "shouldAutorotate");
}

- (BOOL)wantsFullScreenLayout
{
  return 1;
}

- (BOOL)shouldAutomaticallyForwardRotationMethods
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  SBCoverSheetSlidingViewControllerContentViewController *contentViewController;
  _BOOL4 v4;
  void *v5;

  contentViewController = self->_contentViewController;
  if (contentViewController)
    return -[SBCoverSheetSlidingViewControllerContentViewController supportedInterfaceOrientations](contentViewController, "supportedInterfaceOrientations");
  if (__sb__runningInSpringBoard())
  {
    v4 = SBFEffectiveDeviceClass() == 2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "userInterfaceIdiom") == 1;

  }
  if (v4)
    return 30;
  else
    return 2;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)isBottomMostSlider
{
  SBCoverSheetSlidingViewController *v2;
  void *v3;

  v2 = self;
  -[SBCoverSheetSlidingViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "hasContentUnderCoverSheetSlidingViewController:", v2) ^ 1;

  return (char)v2;
}

- (id)coverSheetIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (int64_t)participantState
{
  return 2;
}

- (void)_presentCoverSheetAnimated:(BOOL)a3 forUserGesture:(BOOL)a4 withCompletion:(id)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  NSObject *v9;
  const __CFString *v10;
  const __CFString *v11;
  int v12;
  const __CFString *v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v5 = a4;
  v6 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  SBLogCoverSheet();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = CFSTR("not ");
    if (v6)
      v11 = &stru_1E8EC7EC0;
    else
      v11 = CFSTR("not ");
    if (v5)
      v10 = &stru_1E8EC7EC0;
    v12 = 138543618;
    v13 = v11;
    v14 = 2114;
    v15 = v10;
    _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "Starting %{public}@animated presentation %{public}@for user gesture", (uint8_t *)&v12, 0x16u);
  }

  -[SBCoverSheetSlidingViewController _transitionToViewControllerAppearState:forUserGesture:](self, "_transitionToViewControllerAppearState:forUserGesture:", 1, v5);
  -[SBCoverSheetSlidingViewController _finishTransitionToPresented:animated:withCompletion:](self, "_finishTransitionToPresented:animated:withCompletion:", 1, v6, v8);

}

- (void)_dismissCoverSheetAnimated:(BOOL)a3 withCompletion:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  const __CFString *v8;
  void *v9;
  int v10;
  int v11;
  const __CFString *v12;
  uint64_t v13;

  v4 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  SBLogCoverSheet();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = CFSTR("not ");
    if (v4)
      v8 = &stru_1E8EC7EC0;
    v11 = 138543362;
    v12 = v8;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "Starting %{public}@animated dismissal", (uint8_t *)&v11, 0xCu);
  }

  -[SBCoverSheetSlidingViewController _transitionToViewControllerAppearState:](self, "_transitionToViewControllerAppearState:", 3);
  -[SBCoverSheetSlidingViewController systemGesturesDelegate](self, "systemGesturesDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "syntheticAppearState");

  -[SBCoverSheetSlidingViewController _finishTransitionToPresented:animated:withCompletion:](self, "_finishTransitionToPresented:animated:withCompletion:", (v10 - 1) < 2, v4, v6);
}

- (void)_handlePresentGesture:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BSInvalidatable *v10;
  BSInvalidatable *suppressTouchCancellation;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;

  v5 = a3;
  v6 = objc_msgSend(v5, "state");
  v7 = -[SBScreenEdgePanGestureRecognizer state](self->_dismissGestureRecognizer, "state");
  v8 = -[SBScreenEdgePanGestureRecognizer state](self->_dismissAddendumGestureRecognizer, "state");
  if ((unint64_t)(v7 - 1) <= 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBCoverSheetSlidingViewController.m"), 481, CFSTR("Starting Present Gesture when dismiss gesture is %ldd"), v7);

  }
  if ((unint64_t)(v8 - 1) <= 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBCoverSheetSlidingViewController.m"), 482, CFSTR("Starting Present Gesture when dismiss addendum gesture is %ldd"), v8);

  }
  -[SBCoverSheetSlidingViewController _logPresentGestureState:](self, "_logPresentGestureState:", v6);
  switch(v6)
  {
    case 1:
      v9 = SBFEffectiveArtworkSubtype();
      if (v9 > 2795)
      {
        if (v9 != 2868 && v9 != 2796)
          goto LABEL_17;
LABEL_16:
        -[SBProximitySensorManager suppressBacklightChangesForReason:](self->_proximitySensorManager, "suppressBacklightChangesForReason:", CFSTR("CSPresentation"));
        v10 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
        suppressTouchCancellation = self->_suppressTouchCancellation;
        self->_suppressTouchCancellation = v10;

        goto LABEL_17;
      }
      if (v9 == 2556 || v9 == 2622)
        goto LABEL_16;
LABEL_17:
      -[SBCoverSheetSlidingViewController _presentGestureBeganWithGestureRecognizer:](self, "_presentGestureBeganWithGestureRecognizer:", v5);
      v12 = (void *)MEMORY[0x1E0CEABB0];
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __59__SBCoverSheetSlidingViewController__handlePresentGesture___block_invoke;
      v15[3] = &unk_1E8E9E820;
      v15[4] = self;
      v16 = v5;
      objc_msgSend(v12, "_performWithoutRetargetingAnimations:", v15);

LABEL_18:
      return;
    case 2:
      -[SBCoverSheetSlidingViewController _presentOrDismissGestureChangedWithGestureRecognizer:](self, "_presentOrDismissGestureChangedWithGestureRecognizer:", v5);
      goto LABEL_18;
    case 3:
      -[SBCoverSheetSlidingViewController _presentOrDismissGestureEndedWithGestureRecognizer:](self, "_presentOrDismissGestureEndedWithGestureRecognizer:", v5);
      goto LABEL_13;
    case 4:
    case 5:
      -[SBCoverSheetSlidingViewController _cancelTransitionForGesture:](self, "_cancelTransitionForGesture:", v5);
      goto LABEL_13;
    default:
LABEL_13:
      -[BSInvalidatable invalidate](self->_suppressTouchCancellation, "invalidate");
      goto LABEL_18;
  }
}

uint64_t __59__SBCoverSheetSlidingViewController__handlePresentGesture___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_presentOrDismissGestureChangedWithGestureRecognizer:", *(_QWORD *)(a1 + 40));
}

- (void)_handleIndirectPresentGesture:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  v5 = objc_msgSend(v4, "state");
  if ((unint64_t)(v5 - 4) < 2)
  {
    self->_indirectPresentGestureCalledBegin = 0;
    -[SBCoverSheetSlidingViewController _cancelTransitionForGesture:](self, "_cancelTransitionForGesture:", v4);
  }
  else if (v5 == 3)
  {
    self->_indirectPresentGestureCalledBegin = 0;
    -[SBCoverSheetSlidingViewController _presentOrDismissGestureEndedWithGestureRecognizer:](self, "_presentOrDismissGestureEndedWithGestureRecognizer:", v4);
  }
  else if (v5 == 2)
  {
    if (self->_indirectPresentGestureCalledBegin)
    {
      -[SBCoverSheetSlidingViewController _presentOrDismissGestureChangedWithGestureRecognizer:](self, "_presentOrDismissGestureChangedWithGestureRecognizer:", v4);
    }
    else
    {
      -[SBCoverSheetSlidingViewController view](self, "view");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "translationInView:", v6);
      v8 = v7;

      if (v8 != 0.0)
      {
        self->_indirectPresentGestureCalledBegin = 1;
        -[SBCoverSheetSlidingViewController _presentGestureBeganWithGestureRecognizer:](self, "_presentGestureBeganWithGestureRecognizer:", v4);
        v9 = (void *)MEMORY[0x1E0CEABB0];
        v10[0] = MEMORY[0x1E0C809B0];
        v10[1] = 3221225472;
        v10[2] = __67__SBCoverSheetSlidingViewController__handleIndirectPresentGesture___block_invoke;
        v10[3] = &unk_1E8E9E820;
        v10[4] = self;
        v11 = v4;
        objc_msgSend(v9, "_performWithoutRetargetingAnimations:", v10);

      }
    }
  }

}

uint64_t __67__SBCoverSheetSlidingViewController__handleIndirectPresentGesture___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_presentOrDismissGestureChangedWithGestureRecognizer:", *(_QWORD *)(a1 + 40));
}

- (void)_handleDismissGesture:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  SBCoverSheetSlidingViewController *v8;
  SBScreenEdgePanGestureRecognizer *v9;
  void *v10;
  SBScreenEdgePanGestureRecognizer *v11;

  v11 = (SBScreenEdgePanGestureRecognizer *)a3;
  -[SBCoverSheetSlidingViewController _grabberRecognizer](self, "_grabberRecognizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "state");

  v7 = -[SBScreenEdgePanGestureRecognizer state](v11, "state");
  if ((unint64_t)(v6 - 1) <= 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBCoverSheetSlidingViewController.m"), 561, CFSTR("Starting Dismiss Gesture when present gesture is %ldd"), v6);

  }
  -[SBCoverSheetSlidingViewController _logDismissGestureState:forAddendumGesture:](self, "_logDismissGestureState:forAddendumGesture:", v7, self->_dismissAddendumGestureRecognizer == v11);
  switch(v7)
  {
    case 1:
      -[SBCoverSheetSlidingViewController _dismissGestureBeganWithGestureRecognizer:](self, "_dismissGestureBeganWithGestureRecognizer:", v11);
      v8 = self;
      v9 = v11;
      goto LABEL_7;
    case 2:
      v8 = self;
      v9 = v11;
LABEL_7:
      -[SBCoverSheetSlidingViewController _dismissGestureChangedWithGestureRecognizer:](v8, "_dismissGestureChangedWithGestureRecognizer:", v9);
      break;
    case 3:
      -[SBCoverSheetSlidingViewController _presentOrDismissGestureEndedWithGestureRecognizer:](self, "_presentOrDismissGestureEndedWithGestureRecognizer:", v11);
      break;
    case 4:
    case 5:
      -[SBCoverSheetSlidingViewController _cancelTransitionForGesture:](self, "_cancelTransitionForGesture:", v11);
      break;
    default:
      break;
  }

}

- (void)_presentGestureBeganWithGestureRecognizer:(id)a3
{
  void *v4;
  double v5;
  void *v6;
  int v7;
  id v8;
  SBFFrameRateAssertion *v9;
  SBFFrameRateAssertion *frameRateAssertion;
  void *v11;
  int v12;
  void *v13;
  SBIndirectPanGestureRecognizer *v14;
  CAFrameRateRange v15;

  v14 = (SBIndirectPanGestureRecognizer *)a3;
  -[SBCoverSheetSlidingViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "coverSheetSlidingViewControllerUserPresentGestureBegan:", self);
  if (self->_indirectPresentGestureRecognizer == v14)
  {
    -[SBCoverSheetSlidingViewController _locationForGesture:](self, "_locationForGesture:", v14);
    self->_initialTouchOffsetFromScreenEdge = fmax(v5, 0.0);
  }
  +[SBReachabilityManager sharedInstance](SBReachabilityManager, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "reachabilityModeActive");

  if (v7)
  {
    self->_performingCatchUpForPresentation = 1;
    -[SBCoverSheetSlidingViewController _startCatchupAnimationWithDuration:completion:](self, "_startCatchupAnimationWithDuration:completion:", 0, 0.35);
  }
  if (!self->_frameRateAssertion)
  {
    v8 = objc_alloc(MEMORY[0x1E0DA9E18]);
    v15 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
    v9 = (SBFFrameRateAssertion *)objc_msgSend(v8, "initWithFrameRateRange:highFrameRateReason:", 1114125, *(double *)&v15.minimum, *(double *)&v15.maximum, *(double *)&v15.preferred);
    frameRateAssertion = self->_frameRateAssertion;
    self->_frameRateAssertion = v9;

  }
  -[SBCoverSheetSlidingViewController _transitionToViewControllerAppearState:ifNeeded:forUserGesture:](self, "_transitionToViewControllerAppearState:ifNeeded:forUserGesture:", 1, 0, 1);
  +[SBReachabilityManager sharedInstance](SBReachabilityManager, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "reachabilityModeActive");

  if (v12)
  {
    +[SBReachabilityManager sharedInstance](SBReachabilityManager, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "deactivateReachability");

  }
}

- (void)_dismissGestureBeganWithGestureRecognizer:(id)a3
{
  SBIndirectPanGestureRecognizer *v4;
  void *v5;
  double Height;
  double v7;
  double v8;
  id v9;
  SBFFrameRateAssertion *v10;
  SBFFrameRateAssertion *frameRateAssertion;
  double v12;
  double v13;
  NSObject *v14;
  void *v15;
  void *v16;
  CAFrameRateRange v17;
  CGRect v18;

  v4 = (SBIndirectPanGestureRecognizer *)a3;
  if (self->_indirectDismissGestureRecognizer == v4)
  {
    -[SBCoverSheetSlidingViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    Height = CGRectGetHeight(v18);
    -[SBCoverSheetSlidingViewController _locationForGesture:](self, "_locationForGesture:", v4);
    v8 = Height - v7;

    self->_initialTouchOffsetFromScreenEdge = fmax(v8, 0.0);
  }
  if (!self->_frameRateAssertion)
  {
    v9 = objc_alloc(MEMORY[0x1E0DA9E18]);
    v17 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
    v10 = (SBFFrameRateAssertion *)objc_msgSend(v9, "initWithFrameRateRange:highFrameRateReason:", 1114125, *(double *)&v17.minimum, *(double *)&v17.maximum, *(double *)&v17.preferred);
    frameRateAssertion = self->_frameRateAssertion;
    self->_frameRateAssertion = v10;

  }
  -[SBCoverSheetSlidingViewController _transitionToViewControllerAppearState:ifNeeded:forUserGesture:](self, "_transitionToViewControllerAppearState:ifNeeded:forUserGesture:", 3, 0, 1);
  if (!-[SBCoverSheetSlidingViewController _isPresentingInterstitialForGestureRecognizer:](self, "_isPresentingInterstitialForGestureRecognizer:", v4))
  {
    -[SBCoverSheetSlidingViewController _velocityForGesture:](self, "_velocityForGesture:", v4);
    v13 = v12;
    SBLogCoverSheet();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[SBCoverSheetSlidingViewController _dismissGestureBeganWithGestureRecognizer:].cold.1(v14, v13);

    -[SBCoverSheetSlidingViewController positionView](self, "positionView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", 0.0, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_setVelocity:forKey:", v16, CFSTR("position"));

    self->_performingCatchUpForPresentation = 0;
    -[SBCoverSheetSlidingViewController _startCatchupAnimationWithDuration:completion:](self, "_startCatchupAnimationWithDuration:completion:", 0, 0.2);
  }

}

- (void)_presentOrDismissGestureChangedWithGestureRecognizer:(id)a3
{
  SBIndirectPanGestureRecognizer *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  NSObject *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  _BOOL4 v27;
  void *v28;
  double v29;
  double v30;
  NSObject *v31;
  uint8_t v32[8];
  _QWORD v33[7];

  v4 = (SBIndirectPanGestureRecognizer *)a3;
  -[SBCoverSheetSlidingViewController _locationForGesture:](self, "_locationForGesture:", v4);
  v6 = v5;
  v8 = v7;
  -[SBCoverSheetSlidingViewController setLastTouchLocation:](self, "setLastTouchLocation:");
  if (-[SBCoverSheetSlidingViewController _isPresentingInterstitialForGestureRecognizer:](self, "_isPresentingInterstitialForGestureRecognizer:", v4))
  {
    SBLogCoverSheet();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[SBCoverSheetSlidingViewController _presentOrDismissGestureChangedWithGestureRecognizer:].cold.1(v9);
  }
  else
  {
    -[SBCoverSheetSlidingViewController view](self, "view");
    v9 = objc_claimAutoreleasedReturnValue();
    -[SBIndirectPanGestureRecognizer translationInView:](v4, "translationInView:", v9);
    v11 = v10;
    v13 = v12;
    -[SBIndirectPanGestureRecognizer velocityInView:](v4, "velocityInView:", v9);
    v15 = v14;
    v17 = v16;
    -[SBCoverSheetSlidingViewController setLastGestureVelocity:](self, "setLastGestureVelocity:");
    +[SBAssistantController sharedInstance](SBAssistantController, "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "dismissAssistantViewInEverySceneIfNecessaryForGestureTranslation:velocity:", v11, v13, v15, v17);

    if (-[SBCoverSheetSlidingViewController _shouldRubberBandForGestureRecognizer:](self, "_shouldRubberBandForGestureRecognizer:", v4))
    {
      -[CSLockScreenSettings unlockPasscodeThreshold](self->_lockScreenSettings, "unlockPasscodeThreshold");
      v20 = v19;
      if (self->_indirectDismissGestureRecognizer == v4
        && -[SBIndirectPanGestureRecognizer currentInputType](v4, "currentInputType") == 1)
      {
        -[SBIndirectPanGestureRecognizer activationRecognitionDistance](self->_indirectDismissGestureRecognizer, "activationRecognitionDistance");
        v22 = v21;
        -[SBIndirectPanGestureRecognizer hysteresisForInputType:](self->_indirectDismissGestureRecognizer, "hysteresisForInputType:", 1);
        v20 = v22 - v23;
      }
      -[SBCoverSheetSlidingViewController view](self, "view");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "bounds");
      v26 = v25 - v8;

      v27 = v26 >= v20;
      if (v26 < v20)
      {
        -[SBCoverSheetSlidingViewController _adjustedTouchLocationForCurrentDismissalMode:](self, "_adjustedTouchLocationForCurrentDismissalMode:", v6, v8);
      }
      else
      {
        -[SBCoverSheetSlidingViewController delegate](self, "delegate");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "coverSheetSlidingViewControllerDidPassRubberBandThreshold:", self);

        -[SBCoverSheetSlidingViewController _finalLocationForTransitionToPresented:](self, "_finalLocationForTransitionToPresented:", 1);
      }
      v6 = v29;
      v8 = v30;
    }
    else
    {
      v27 = 0;
    }
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __90__SBCoverSheetSlidingViewController__presentOrDismissGestureChangedWithGestureRecognizer___block_invoke;
    v33[3] = &unk_1E8E9DF00;
    v33[4] = self;
    *(double *)&v33[5] = v6;
    *(double *)&v33[6] = v8;
    objc_msgSend(MEMORY[0x1E0CEABB0], "_performWithoutRetargetingAnimations:", v33);
    if (v27)
    {
      SBLogCoverSheet();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v32 = 0;
        _os_log_impl(&dword_1D0540000, v31, OS_LOG_TYPE_INFO, "Cancelling dismiss gesture for rubber band threshold passed.", v32, 2u);
      }

      -[SBIndirectPanGestureRecognizer setEnabled:](v4, "setEnabled:", 0);
      -[SBIndirectPanGestureRecognizer setEnabled:](v4, "setEnabled:", 1);
      if (self->_indirectDismissGestureRecognizer == v4)
        -[SBIndirectPanGestureRecognizer setPausedUntilTouchedUpOrMovedAwayFromEdge:](v4, "setPausedUntilTouchedUpOrMovedAwayFromEdge:", 1);
    }
  }

}

uint64_t __90__SBCoverSheetSlidingViewController__presentOrDismissGestureChangedWithGestureRecognizer___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateForLocation:interactive:", 1, *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (void)_dismissGestureChangedWithGestureRecognizer:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  double Height;
  double v9;
  NSObject *v10;
  void *v11;
  int v12;
  double v13;
  uint64_t v14;
  CGRect v15;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SBCoverSheetSlidingViewController _locationForGesture:](self, "_locationForGesture:", v4);
  v6 = v5;
  -[SBCoverSheetSlidingViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  Height = CGRectGetHeight(v15);

  v9 = (Height - v6) / Height;
  SBLogCoverSheet();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 134217984;
    v13 = v9;
    _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "_dismissGestureChangedWithGestureRecognizer gestureProgress: %.2f", (uint8_t *)&v12, 0xCu);
  }

  if (-[SBCoverSheetSlidingViewController _isPresentingInterstitialForGestureRecognizer:](self, "_isPresentingInterstitialForGestureRecognizer:", v4))
  {
    -[SBCoverSheetSlidingViewController delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "coverSheetSlidingViewController:dismissGestureChangedWithProgress:", self, v9);

  }
  -[SBCoverSheetSlidingViewController _presentOrDismissGestureChangedWithGestureRecognizer:](self, "_presentOrDismissGestureChangedWithGestureRecognizer:", v4);

}

- (void)_presentOrDismissGestureEndedWithGestureRecognizer:(id)a3
{
  SBIndirectPanGestureRecognizer *v4;
  SBFFrameRateAssertion *frameRateAssertion;
  _BOOL8 v6;
  uint64_t v7;
  SBIndirectPanGestureRecognizer *v8;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  char v15;
  void *v16;
  CGFloat v17;
  SBIndirectPanGestureRecognizer *v19;
  CGRect v20;

  v4 = (SBIndirectPanGestureRecognizer *)a3;
  if (self->_indirectPresentGestureRecognizer == v4 || self->_indirectDismissGestureRecognizer == v4)
    self->_initialTouchOffsetFromScreenEdge = 0.0;
  v19 = v4;
  -[SBFFrameRateAssertion invalidate](self->_frameRateAssertion, "invalidate");
  frameRateAssertion = self->_frameRateAssertion;
  self->_frameRateAssertion = 0;

  v6 = -[SBCoverSheetSlidingViewController _shouldEndPresentedForEndingGestureRecognizer:](self, "_shouldEndPresentedForEndingGestureRecognizer:", v19);
  v7 = objc_opt_class();
  SBSafeCast(v7, v19);
  v8 = (SBIndirectPanGestureRecognizer *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (-[SBCoverSheetSlidingViewController _shouldRubberBandForGestureRecognizer:](self, "_shouldRubberBandForGestureRecognizer:", v19))
    {
      goto LABEL_16;
    }
    if (-[SBIndirectPanGestureRecognizer endReason](v8, "endReason") == 3)
    {
      if (self->_indirectPresentGestureRecognizer != v19 && (self->_indirectDismissGestureRecognizer == v19 || !v6))
      {
LABEL_26:
        v6 = 0;
        goto LABEL_27;
      }
LABEL_16:
      v6 = 1;
      v14 = 1;
      goto LABEL_28;
    }
    -[SBCoverSheetSlidingViewController _locationForGesture:](self, "_locationForGesture:", v8);
    v11 = v10;
    -[SBCoverSheetSlidingViewController _averageVelocityForGesture:](self, "_averageVelocityForGesture:", v8);
    v13 = v11 + v12 * 0.06;
    if (v8 == self->_indirectPresentGestureRecognizer)
    {
      v15 = v13 > 80.0 || v6;
      if ((v15 & 1) == 0)
        goto LABEL_26;
      goto LABEL_16;
    }
    if (v8 == self->_indirectDismissGestureRecognizer)
    {
      -[SBCoverSheetSlidingViewController view](self, "view");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "bounds");
      v17 = CGRectGetHeight(v20) + -80.0;

      if (v13 <= v17 || !v6)
        goto LABEL_26;
      goto LABEL_16;
    }
  }
  if (v6)
    goto LABEL_16;
LABEL_27:
  v14 = 3;
LABEL_28:
  -[SBCoverSheetSlidingViewController _transitionToViewControllerAppearState:ifNeeded:forUserGesture:](self, "_transitionToViewControllerAppearState:ifNeeded:forUserGesture:", v14, 1, 1);
  if (-[SBCoverSheetSlidingViewController _isPresentingInterstitialForGestureRecognizer:](self, "_isPresentingInterstitialForGestureRecognizer:", v19))
  {
    -[SBCoverSheetSlidingViewController _transitionToViewControllerAppearState:ifNeeded:forUserGesture:](self, "_transitionToViewControllerAppearState:ifNeeded:forUserGesture:", 2, 0, 0);
  }
  else
  {
    -[SBCoverSheetSlidingViewController _finishTransitionToPresented:animated:withCompletion:](self, "_finishTransitionToPresented:animated:withCompletion:", v6, 1, 0);
  }

}

- (void)_finishTransitionToPresented:(BOOL)a3 animated:(BOOL)a4 withCompletion:(id)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v9;
  void *v10;
  uint32_t v11;
  NSObject *v12;
  const __CFString *v13;
  const __CFString *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  double v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  uint64_t v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  _QWORD v36[5];
  id v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD v40[7];
  _QWORD v41[5];
  id v42;
  uint32_t v43;
  BOOL v44;
  BOOL v45;
  uint8_t buf[4];
  double v47;
  __int16 v48;
  _BYTE v49[14];
  uint64_t v50;

  v5 = a4;
  v6 = a3;
  v50 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  if (SBFIsIRDCResetAvailable())
    CARenderServerFlushIRDC();
  if (self->_dismissalSlidingMode != 1 && !v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBCoverSheetSlidingViewController.m"), 774, CFSTR("cannot finish transition to dismissed when not tracking"));

  }
  -[SBCoverSheetSlidingViewController delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6
    || (objc_opt_respondsToSelector() & 1) == 0
    || (objc_msgSend(v10, "coverSheetSlidingViewControllerShouldAllowDismissal:", self) & 1) != 0)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v10, "coverSheetSlidingViewController:committingToEndPresented:", self, v6);
    -[SBCoverSheetSlidingViewController _commitTransitionToAppeared:animated:](self, "_commitTransitionToAppeared:animated:", v6, v5);
    v11 = arc4random_uniform(0x2710u);
    SBLogCoverSheet();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = CFSTR("Not ");
      if (v5)
        v13 = &stru_1E8EC7EC0;
      *(_DWORD *)buf = 138412802;
      v47 = *(double *)&v13;
      if (v6)
        v14 = CFSTR("presented");
      else
        v14 = CFSTR("dismissed");
      v48 = 1024;
      *(_DWORD *)v49 = v11;
      *(_WORD *)&v49[4] = 2112;
      *(_QWORD *)&v49[6] = v14;
      _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "Start %@Animation %d to %@", buf, 0x1Cu);
    }

    v15 = MEMORY[0x1E0C809B0];
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __90__SBCoverSheetSlidingViewController__finishTransitionToPresented_animated_withCompletion___block_invoke;
    v41[3] = &unk_1E8EA9F58;
    v44 = v6;
    v41[4] = self;
    v43 = v11;
    v42 = v9;
    v45 = v5;
    v16 = (void *)MEMORY[0x1D17E5550](v41);
    -[SBCoverSheetSlidingViewController _finalLocationForTransitionToPresented:](self, "_finalLocationForTransitionToPresented:", v6);
    v19 = v17;
    v20 = v18;
    if (v5)
    {
      -[SBCoverSheetSlidingViewController _viewVelocity](self, "_viewVelocity");
      v22 = v21;
      SBLogCoverSheet();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        -[UIViewFloatAnimatableProperty velocity](self->_progressProperty, "velocity");
        *(_DWORD *)buf = 134218240;
        v47 = v22;
        v48 = 2048;
        *(_QWORD *)v49 = v24;
        _os_log_impl(&dword_1D0540000, v23, OS_LOG_TYPE_DEFAULT, "Assigning gesture velocity: %.2f to property with existing velocity: %.2f", buf, 0x16u);
      }

      -[UIViewFloatAnimatableProperty setVelocity:](self->_progressProperty, "setVelocity:", v22);
      -[CSLockScreenSettings coverSheetTransitionsSettings](self->_lockScreenSettings, "coverSheetTransitionsSettings");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "tension");
      v27 = v26;
      objc_msgSend(v25, "friction");
      v29 = v28;
      -[SBCoverSheetSlidingViewController transitionSettings](self, "transitionSettings");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "transitionStyle");

      if (v31 == 1)
      {
        objc_msgSend(v25, "inPlaceTension");
        v27 = v32;
        objc_msgSend(v25, "inPlaceFriction");
        v29 = v33;
      }
      v40[0] = v15;
      v40[1] = 3221225472;
      v40[2] = __90__SBCoverSheetSlidingViewController__finishTransitionToPresented_animated_withCompletion___block_invoke_80;
      v40[3] = &unk_1E8E9DF00;
      v40[4] = self;
      v40[5] = v19;
      v40[6] = v20;
      objc_msgSend(MEMORY[0x1E0CEABB0], "_animateUsingSpringWithTension:friction:interactive:animations:completion:", 0, v40, v16, v27, v29);

    }
    else
    {
      v34 = (void *)MEMORY[0x1E0CEABB0];
      v36[0] = v15;
      v36[1] = 3221225472;
      v36[2] = __90__SBCoverSheetSlidingViewController__finishTransitionToPresented_animated_withCompletion___block_invoke_3;
      v36[3] = &unk_1E8EA0C30;
      v36[4] = self;
      v38 = v17;
      v39 = v18;
      v37 = v16;
      objc_msgSend(v34, "_performWithoutRetargetingAnimations:", v36);

    }
  }
  else
  {
    -[SBCoverSheetSlidingViewController _presentCoverSheetAnimated:forUserGesture:withCompletion:](self, "_presentCoverSheetAnimated:forUserGesture:withCompletion:", 1, 0, 0);
  }

}

void __90__SBCoverSheetSlidingViewController__finishTransitionToPresented_animated_withCompletion___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  int v5;
  void *v6;
  void *v7;
  BOOL v8;
  int v9;
  void (**v10)(_QWORD);
  NSObject *v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  const __CFString *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  id v26;
  id v27;
  int v28;
  int v29;
  char v30;
  int location;
  _BYTE location_4[14];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = *(unsigned __int8 *)(a1 + 52);
  objc_msgSend(*(id *)(a1 + 32), "activeGestureRecognizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && (objc_msgSend(v6, "_hasUnmetFailureRequirements") & 1) == 0)
  {
    v20 = objc_msgSend(v7, "state");
    v8 = v20 != 3;
    if ((a3 & 1) == 0 && v20 != 3)
    {
      SBLogCoverSheet();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        location = 138412546;
        *(_QWORD *)location_4 = v7;
        *(_WORD *)&location_4[8] = 1024;
        *(_DWORD *)&location_4[10] = objc_msgSend(v7, "_hasUnmetFailureRequirements");
        _os_log_impl(&dword_1D0540000, v21, OS_LOG_TYPE_DEFAULT, "transition was not retargeted but there is an active gesture:\n\t%@\n\t_hasUnmetFailureRequirements: %{BOOL}d", (uint8_t *)&location, 0x12u);
      }

    }
  }
  else
  {
    v8 = 0;
  }
  if ((a3 & 1) != 0 || v8)
  {
    SBLogCoverSheet();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = CFSTR("not ");
      v18 = *(_DWORD *)(a1 + 48);
      if (a3)
        v17 = &stru_1E8EC7EC0;
      location = 67109378;
      *(_DWORD *)location_4 = v18;
      *(_WORD *)&location_4[4] = 2112;
      *(_QWORD *)&location_4[6] = v17;
      _os_log_impl(&dword_1D0540000, v16, OS_LOG_TYPE_DEFAULT, "Animation %d %@retargeted -> not doing anything", (uint8_t *)&location, 0x12u);
    }

    v19 = *(_QWORD *)(a1 + 40);
    if (v19)
      (*(void (**)(void))(v19 + 16))();
  }
  else
  {
    objc_initWeak((id *)&location, *(id *)(a1 + 32));
    v22 = MEMORY[0x1E0C809B0];
    v23 = 3221225472;
    v24 = __90__SBCoverSheetSlidingViewController__finishTransitionToPresented_animated_withCompletion___block_invoke_74;
    v25 = &unk_1E8EA9F30;
    objc_copyWeak(&v27, (id *)&location);
    v9 = *(_DWORD *)(a1 + 48);
    v30 = *(_BYTE *)(a1 + 52);
    v28 = v9;
    v29 = 2 * v5;
    v26 = *(id *)(a1 + 40);
    v10 = (void (**)(_QWORD))dispatch_block_create((dispatch_block_flags_t)0, &v22);
    SBLogCoverSheet();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      __90__SBCoverSheetSlidingViewController__finishTransitionToPresented_animated_withCompletion___block_invoke_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "completionGroup", v22, v23, v24, v25);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(void **)(a1 + 32);
    if (*(_BYTE *)(a1 + 53) && v12)
    {
      objc_msgSend(v13, "setCompletionBlock:", v10);
      v14 = MEMORY[0x1E0C80D38];
      objc_msgSend(*(id *)(a1 + 32), "completionBlock");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      dispatch_group_notify(v12, MEMORY[0x1E0C80D38], v15);

    }
    else
    {
      objc_msgSend(v13, "setCompletionBlock:", 0);
      v10[2](v10);
    }

    objc_destroyWeak(&v27);
    objc_destroyWeak((id *)&location);
  }

}

void __90__SBCoverSheetSlidingViewController__finishTransitionToPresented_animated_withCompletion___block_invoke_74(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  NSObject *v4;
  int v5;
  const __CFString *v6;
  uint64_t v7;
  _DWORD v8[2];
  __int16 v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  SBLogCoverSheet();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __90__SBCoverSheetSlidingViewController__finishTransitionToPresented_animated_withCompletion___block_invoke_74_cold_1(WeakRetained);

  objc_msgSend(WeakRetained, "setCompletionBlock:", 0);
  SBLogCoverSheet();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_DWORD *)(a1 + 48);
    v6 = CFSTR("presenting");
    if (!*(_BYTE *)(a1 + 56))
      v6 = CFSTR("dismissing");
    v8[0] = 67109378;
    v8[1] = v5;
    v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "Ended Animation %d not retargeted -> putting us in a good state for %@", (uint8_t *)v8, 0x12u);
  }

  objc_msgSend(WeakRetained, "_transitionToViewControllerAppearState:ifNeeded:forUserGesture:", *(unsigned int *)(a1 + 52), 0, 0);
  objc_msgSend(WeakRetained, "setCompletionGroup:", 0);
  objc_msgSend(WeakRetained, "setLastTouchLocation:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(void))(v7 + 16))();
  objc_msgSend(WeakRetained, "_studyLogForCompletionOfTransitionToPresented:", *(unsigned __int8 *)(a1 + 56));

}

uint64_t __90__SBCoverSheetSlidingViewController__finishTransitionToPresented_animated_withCompletion___block_invoke_80(uint64_t a1)
{
  void *v2;
  _QWORD v4[5];
  __int128 v5;
  CAFrameRateRange v6;

  v2 = (void *)MEMORY[0x1E0CEABB0];
  v6 = CAFrameRateRangeMake(30.0, 120.0, 120.0);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __90__SBCoverSheetSlidingViewController__finishTransitionToPresented_animated_withCompletion___block_invoke_2;
  v4[3] = &unk_1E8E9DF00;
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(v2, "sb_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1114125, v4, *(double *)&v6.minimum, *(double *)&v6.maximum, *(double *)&v6.preferred);
}

uint64_t __90__SBCoverSheetSlidingViewController__finishTransitionToPresented_animated_withCompletion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateForLocation:interactive:", 0, *(double *)(a1 + 40), *(double *)(a1 + 48));
}

uint64_t __90__SBCoverSheetSlidingViewController__finishTransitionToPresented_animated_withCompletion___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateForLocation:interactive:", 0, *(double *)(a1 + 48), *(double *)(a1 + 56));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (double)_viewVelocity
{
  void *v3;
  double v4;
  void *v5;
  void *v6;
  double Height;
  CGRect v9;

  -[SBCoverSheetSlidingViewController activeGestureRecognizer](self, "activeGestureRecognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = -self->_lastGestureVelocity.y;
  else
    v4 = 0.0;
  -[SBCoverSheetSlidingViewController positionView](self, "positionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  Height = CGRectGetHeight(v9);

  return fmin(fmax(v4 / Height, -10.0), 10.0);
}

- (id)activeGestureRecognizer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  -[SBCoverSheetSlidingViewController dismissGestureRecognizer](self, "dismissGestureRecognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBCoverSheetSlidingViewController dismissAddendumGestureRecognizer](self, "dismissAddendumGestureRecognizer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBCoverSheetSlidingViewController _grabberRecognizer](self, "_grabberRecognizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBCoverSheetSlidingViewController indirectPresentGestureRecognizer](self, "indirectPresentGestureRecognizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBCoverSheetSlidingViewController indirectDismissGestureRecognizer](self, "indirectDismissGestureRecognizer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBCoverSheetSlidingViewController scrunchDismissGestureRecognizer](self, "scrunchDismissGestureRecognizer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)(objc_msgSend(v4, "state") - 1) > 2)
    v9 = 0;
  else
    v9 = v4;
  if ((unint64_t)(objc_msgSend(v3, "state") - 1) <= 2)
  {
    v10 = v3;

    v9 = v10;
  }
  if ((unint64_t)(objc_msgSend(v5, "state") - 1) <= 2)
  {
    v11 = v5;

    v9 = v11;
  }
  if ((unint64_t)(objc_msgSend(v6, "state") - 1) <= 2)
  {
    v12 = v6;

    v9 = v12;
  }
  if ((unint64_t)(objc_msgSend(v7, "state") - 1) <= 2)
  {
    v13 = v7;

    v9 = v13;
  }
  if ((unint64_t)(objc_msgSend(v8, "state") - 1) <= 2)
  {
    v14 = v8;

    v9 = v14;
  }

  return v9;
}

- (CGPoint)_finalLocationForTransitionToPresented:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  CGFloat Height;
  double v7;
  double v8;
  CGPoint result;
  CGRect v10;

  v3 = a3;
  -[SBCoverSheetSlidingViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v4, "bounds");
    Height = CGRectGetHeight(v10);
  }
  else
  {
    Height = 0.0;
  }

  v7 = 0.0;
  v8 = Height;
  result.y = v8;
  result.x = v7;
  return result;
}

- (void)_cancelTransitionForGesture:(id)a3
{
  SBFFrameRateAssertion *frameRateAssertion;
  id v5;
  SBFFrameRateAssertion *v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  _BOOL4 v10;

  if (self->_indirectPresentGestureRecognizer == a3 || self->_indirectDismissGestureRecognizer == a3)
    self->_initialTouchOffsetFromScreenEdge = 0.0;
  frameRateAssertion = self->_frameRateAssertion;
  v5 = a3;
  -[SBFFrameRateAssertion invalidate](frameRateAssertion, "invalidate");
  v6 = self->_frameRateAssertion;
  self->_frameRateAssertion = 0;

  -[SBCoverSheetSlidingViewController systemGesturesDelegate](self, "systemGesturesDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "syntheticAppearState") == 3)
  {
    v8 = 1;
  }
  else
  {
    -[SBCoverSheetSlidingViewController systemGesturesDelegate](self, "systemGesturesDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "syntheticAppearState") == 2;

  }
  v10 = -[SBCoverSheetSlidingViewController _shouldRubberBandForGestureRecognizer:](self, "_shouldRubberBandForGestureRecognizer:", v5);

  -[SBCoverSheetSlidingViewController _finishTransitionToPresented:animated:withCompletion:](self, "_finishTransitionToPresented:animated:withCompletion:", v10 | v8, 1, 0);
}

- (CGPoint)_locationForGesture:(id)a3
{
  SBIndirectPanGestureRecognizer *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double Height;
  double v12;
  double v13;
  CGPoint result;
  CGRect v15;

  v4 = (SBIndirectPanGestureRecognizer *)a3;
  -[SBCoverSheetSlidingViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIndirectPanGestureRecognizer locationInView:](v4, "locationInView:", v5);
  v7 = v6;
  v9 = v8;

  if (self->_indirectPresentGestureRecognizer == v4)
  {
    v9 = fmax(v9 - self->_initialTouchOffsetFromScreenEdge, 0.0);
  }
  else if (self->_indirectDismissGestureRecognizer == v4)
  {
    -[SBCoverSheetSlidingViewController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bounds");
    Height = CGRectGetHeight(v15);

    if (Height >= v9 + self->_initialTouchOffsetFromScreenEdge)
      v9 = v9 + self->_initialTouchOffsetFromScreenEdge;
    else
      v9 = Height;
  }

  v12 = v7;
  v13 = v9;
  result.y = v13;
  result.x = v12;
  return result;
}

- (CGPoint)_velocityForGesture:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGPoint result;

  v4 = a3;
  -[SBCoverSheetSlidingViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "velocityInView:", v5);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (CGPoint)_averageVelocityForGesture:(id)a3
{
  double v3;
  double v4;
  CGPoint result;

  objc_msgSend(a3, "averageTouchVelocityOverTimeDuration:", 0.0416666667);
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)_adjustedTouchLocationForCurrentDismissalMode:(CGPoint)a3
{
  double y;
  CGFloat x;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  if (self->_dismissalSlidingMode == 2)
  {
    -[CSLockScreenSettings unlockRubberBandThreshold](self->_lockScreenSettings, "unlockRubberBandThreshold");
    v7 = v6;
    -[SBCoverSheetSlidingViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    v10 = v9 - y;

    -[SBCoverSheetSlidingViewController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bounds");
    y = v12 - v7 * (1.0 - 1.0 / (v10 / v7 * 0.55 + 1.0));

  }
  v13 = x;
  v14 = y;
  result.y = v14;
  result.x = v13;
  return result;
}

- (BOOL)_shouldRubberBandForGestureRecognizer:(id)a3
{
  int64_t dismissalSlidingMode;
  id v5;
  void *v6;
  void *v7;
  char v8;

  dismissalSlidingMode = self->_dismissalSlidingMode;
  v5 = a3;
  -[SBCoverSheetSlidingViewController systemGesturesDelegate](self, "systemGesturesDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dismissGestures");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", v5);

  if (dismissalSlidingMode == 2)
    return v8;
  else
    return 0;
}

- (BOOL)_shouldEndPresentedForEndingGestureRecognizer:(id)a3
{
  __CFString *v5;
  void *v6;
  _BOOL4 v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint8_t buf[4];
  const __CFString *v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = (__CFString *)a3;
  if (-[__CFString state](v5, "state") != 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBCoverSheetSlidingViewController.m"), 1041, CFSTR("You should not ask how to finish a transition for gesture recognizer that is not ended."));

  }
  -[SBCoverSheetSlidingViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v20 = 0;
  v17 = 0;
  v18 = 0;
  v7 = -[SBCoverSheetSlidingViewController _mathForGestureRecognizerPointsDown:position:velocity:instantVelocity:averageVelocity:](self, "_mathForGestureRecognizerPointsDown:position:velocity:instantVelocity:averageVelocity:", v5, &v20, &v19, &v18, &v17);
  if (-[SBCoverSheetSlidingViewController _shouldRubberBandForGestureRecognizer:](self, "_shouldRubberBandForGestureRecognizer:", v5))
  {
    SBLogCoverSheet();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v5;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "Rubber banding to presented for gesture: %@", buf, 0xCu);
    }

    v7 = 1;
  }
  if (-[SBCoverSheetSlidingViewController _isPresentingInterstitialForGestureRecognizer:](self, "_isPresentingInterstitialForGestureRecognizer:", v5))
  {
    SBLogCoverSheet();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v5;
      _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "Finishing presented because presenting interstitial for gesture: %@", buf, 0xCu);
    }

    v7 = 1;
  }
  v10 = -[__CFString state](v5, "state");
  objc_msgSend(v6, "bounds");
  -[SBCoverSheetSlidingViewController _studyLogForGestureRecognizerState:bounds:position:velocity:](self, "_studyLogForGestureRecognizerState:bounds:position:velocity:", v10);
  SBLogCoverSheet();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    -[SBCoverSheetSlidingViewController _grabberRecognizer](self, "_grabberRecognizer");
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v13 = CFSTR("Dismiss");
    if (v12 == v5)
      v13 = CFSTR("Present");
    *(_DWORD *)buf = 138413314;
    v22 = v13;
    v14 = CFSTR("presented");
    v23 = 2112;
    if (!v7)
      v14 = CFSTR("dismissed");
    v24 = v14;
    v25 = 2048;
    v26 = v20;
    v27 = 2048;
    v28 = v18;
    v29 = 2048;
    v30 = v17;
    _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "%@ Gesture recognizer Should End %@ \t position: %f instantVelocity: %f averageVelocity: %f", buf, 0x34u);

  }
  return v7;
}

- (BOOL)_mathForGestureRecognizerPointsDown:(id)a3 position:(double *)a4 velocity:(double *)a5 instantVelocity:(double *)a6 averageVelocity:(double *)a7
{
  id v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  BOOL v21;
  CGRect v23;
  CGRect v24;

  v12 = a3;
  -[SBCoverSheetSlidingViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBCoverSheetSlidingViewController _locationForGesture:](self, "_locationForGesture:", v12);
  v15 = v14;
  -[SBCoverSheetSlidingViewController _velocityForGesture:](self, "_velocityForGesture:", v12);
  v17 = v16;
  v18 = 0.0;
  v19 = v16;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SBCoverSheetSlidingViewController _averageVelocityForGesture:](self, "_averageVelocityForGesture:", v12);
    v19 = v20;
    v18 = v20;
  }
  objc_msgSend(v13, "bounds");
  v21 = v15 + v19 * 0.15 > CGRectGetHeight(v23) * 0.6 && v19 >= *(double *)&SBCoverSheetMinimumYVelocityForDismissal;
  objc_msgSend(v13, "bounds");
  if (v15 > CGRectGetHeight(v24) - *(double *)&SBCoverSheetMinimumYDistanceForDismissal)
    v21 = 1;
  if (a4)
    *a4 = v15;
  if (a6)
    *a6 = v17;
  if (a7)
    *a7 = v18;
  if (a5)
    *a5 = v19;

  return v21;
}

- (BOOL)_isPresentingInterstitialForGestureRecognizer:(id)a3
{
  int64_t dismissalSlidingMode;
  id v5;
  void *v6;
  void *v7;
  char v8;

  dismissalSlidingMode = self->_dismissalSlidingMode;
  v5 = a3;
  -[SBCoverSheetSlidingViewController systemGesturesDelegate](self, "systemGesturesDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dismissGestures");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", v5);

  if (dismissalSlidingMode == 3)
    return v8;
  else
    return 0;
}

- (void)_logPresentGestureState:(int64_t)a3
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (self->_presentGestureState != a3)
  {
    self->_presentGestureState = a3;
    -[SBCoverSheetSlidingViewController _grabberRecognizer](self, "_grabberRecognizer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    SBLogCoverSheet();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "sb_stringForState");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "view");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "locationInView:", v6);
      v8 = v7;
      objc_msgSend(v3, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "velocityInView:", v9);
      v11 = 138543874;
      v12 = v5;
      v13 = 2048;
      v14 = v8;
      v15 = 2048;
      v16 = v10;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "Present gesture: %{public}@\tposition: %f velocity: %f", (uint8_t *)&v11, 0x20u);

    }
  }
}

- (void)_logDismissGestureState:(int64_t)a3 forAddendumGesture:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  SBScreenEdgePanGestureRecognizer *dismissAddendumGestureRecognizer;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  SBScreenEdgePanGestureRecognizer *v13;
  void *v14;
  uint64_t v15;
  const char *v16;
  SBScreenEdgePanGestureRecognizer *dismissGestureRecognizer;
  uint64_t v18;
  uint64_t v19;
  SBScreenEdgePanGestureRecognizer *v20;
  uint64_t v21;
  int v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (self->_dismissGestureState != a3)
  {
    v4 = a4;
    self->_dismissGestureState = a3;
    SBLogCoverSheet();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v7)
      {
        -[UIGestureRecognizer sb_stringForState](self->_dismissAddendumGestureRecognizer, "sb_stringForState");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        dismissAddendumGestureRecognizer = self->_dismissAddendumGestureRecognizer;
        -[SBScreenEdgePanGestureRecognizer view](dismissAddendumGestureRecognizer, "view");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBScreenEdgePanGestureRecognizer locationInView:](dismissAddendumGestureRecognizer, "locationInView:", v10);
        v12 = v11;
        v13 = self->_dismissAddendumGestureRecognizer;
        -[SBScreenEdgePanGestureRecognizer view](v13, "view");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBScreenEdgePanGestureRecognizer velocityInView:](v13, "velocityInView:", v14);
        v22 = 138543874;
        v23 = v8;
        v24 = 2048;
        v25 = v12;
        v26 = 2048;
        v27 = v15;
        v16 = "Dismiss Addendum gesture: %{public}@\tposition: %f velocity: %f";
LABEL_7:
        _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v22, 0x20u);

      }
    }
    else if (v7)
    {
      -[UIGestureRecognizer sb_stringForState](self->_dismissGestureRecognizer, "sb_stringForState");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      dismissGestureRecognizer = self->_dismissGestureRecognizer;
      -[SBScreenEdgePanGestureRecognizer view](dismissGestureRecognizer, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBScreenEdgePanGestureRecognizer locationInView:](dismissGestureRecognizer, "locationInView:", v10);
      v19 = v18;
      v20 = self->_dismissGestureRecognizer;
      -[SBScreenEdgePanGestureRecognizer view](v20, "view");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBScreenEdgePanGestureRecognizer velocityInView:](v20, "velocityInView:", v14);
      v22 = 138543874;
      v23 = v8;
      v24 = 2048;
      v25 = v19;
      v26 = 2048;
      v27 = v21;
      v16 = "Dismiss gesture: %{public}@\tposition: %f velocity: %f";
      goto LABEL_7;
    }

  }
}

- (void)_beginTransitionFromAppeared:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  dispatch_group_t v13;

  v3 = a3;
  SBLogCoverSheet();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[SBCoverSheetSlidingViewController _beginTransitionFromAppeared:].cold.1(v3, v5, v6, v7, v8, v9, v10, v11);

  -[SBCoverSheetSlidingViewController _setCornerRounded:](self, "_setCornerRounded:", self->_roundsCorners);
  -[SBCoverSheetSlidingViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setNeedsLayout");
  objc_msgSend(v12, "layoutIfNeeded");
  v13 = dispatch_group_create();
  -[SBCoverSheetSlidingViewController setCompletionGroup:](self, "setCompletionGroup:", v13);

}

- (void)_updateForLocation:(CGPoint)a3 interactive:(BOOL)a4
{
  _BOOL4 v4;
  double y;
  CGFloat x;
  NSObject *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[6];
  _QWORD v18[6];
  _BYTE buf[24];
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;

  v4 = a4;
  y = a3.y;
  x = a3.x;
  v23 = *MEMORY[0x1E0C80C00];
  SBLogCoverSheet();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218496;
    *(CGFloat *)&buf[4] = x;
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = y;
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v20) = v4;
    _os_log_debug_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEBUG, "updateForLocation: %.2f, %.2f, %{BOOL}d", buf, 0x1Cu);
  }

  -[SBCoverSheetSlidingViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  v11 = v10;

  -[SBCoverSheetSlidingViewController progressProperty](self, "progressProperty");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 1.0 - y / v11;
  objc_msgSend(v12, "setValue:", v13);

  -[SBCoverSheetSlidingViewController systemGesturesDelegate](self, "systemGesturesDelegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isAnyGestureActivelyRecognized");

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v20 = __Block_byref_object_copy__31;
  v21 = __Block_byref_object_dispose__31;
  v22 = 0;
  -[SBCoverSheetSlidingViewController delegate](self, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17[5] = buf;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __68__SBCoverSheetSlidingViewController__updateForLocation_interactive___block_invoke;
  v18[3] = &unk_1E8E9DFA0;
  v18[4] = self;
  v18[5] = buf;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __68__SBCoverSheetSlidingViewController__updateForLocation_interactive___block_invoke_91;
  v17[3] = &unk_1E8E9DFA0;
  v17[4] = self;
  objc_msgSend(v16, "coverSheetSlidingViewController:animateForGestureActive:withProgress:beginBlock:endBlock:", self, v15, v18, v17, v13);

  _Block_object_dispose(buf, 8);
}

void __68__SBCoverSheetSlidingViewController__updateForLocation_interactive___block_invoke(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;

  v1 = (_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "completionGroup");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(v1[1] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = *(NSObject **)(*(_QWORD *)(v1[1] + 8) + 40);
  if (v5)
  {
    dispatch_group_enter(v5);
    ++*(_QWORD *)(*v1 + 1144);
    SBLogCoverSheet();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __68__SBCoverSheetSlidingViewController__updateForLocation_interactive___block_invoke_cold_1(v1, 1144, v6);

  }
}

void __68__SBCoverSheetSlidingViewController__updateForLocation_interactive___block_invoke_91(uint64_t a1)
{
  NSObject *v2;
  _QWORD *v3;
  uint64_t v4;
  NSObject *v5;

  v2 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v2)
  {
    dispatch_group_leave(v2);
    v4 = *(_QWORD *)(a1 + 32);
    v3 = (_QWORD *)(a1 + 32);
    --*(_QWORD *)(v4 + 1144);
    SBLogCoverSheet();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __68__SBCoverSheetSlidingViewController__updateForLocation_interactive___block_invoke_91_cold_1(v3, 1144, v5);

  }
}

- (void)_endTransitionToAppeared:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a3;
  -[SBCoverSheetSlidingViewController _setCornerRounded:](self, "_setCornerRounded:", 0);
  SBLogCoverSheet();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[SBCoverSheetSlidingViewController _endTransitionToAppeared:].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);

}

- (CGRect)_updatePositionViewForProgress:(double)a3 velocity:(double)a4 forPresentationValue:(BOOL)a5
{
  _BOOL8 v5;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGRect result;

  v5 = a5;
  -[SBCoverSheetSlidingViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  v11 = v10;

  v12 = v11 - a3 * v11;
  v13 = -(a4 * v11);
  -[SBCoverSheetSlidingViewController transitionSettings](self, "transitionSettings");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "transitionStyle");

  if (v15 == 1)
    v16 = v11;
  else
    v16 = v12;
  if (v15 == 1)
    v17 = *MEMORY[0x1E0C9D538];
  else
    v17 = 0.0;
  if (v15 == 1)
    v18 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  else
    v18 = v13;
  -[SBCoverSheetSlidingViewController positionView](self, "positionView", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "positionContentForTouchAtLocation:withVelocity:transformMode:forPresentationValue:", self->_dismissalTransformMode, v5, 0.0, v16, v17, v18);
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;
  -[SBCoverSheetSlidingViewController _positionSubviewsForContentFrame:forPresentationValue:](self, "_positionSubviewsForContentFrame:forPresentationValue:", v5);

  v28 = v21;
  v29 = v23;
  v30 = v25;
  v31 = v27;
  result.size.height = v31;
  result.size.width = v30;
  result.origin.y = v29;
  result.origin.x = v28;
  return result;
}

- (void)_setCornerRounded:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  id v9;

  v3 = a3;
  -[SBCoverSheetSlidingViewController positionView](self, "positionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentView");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v5 = 0.0;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "displayCornerRadius");
    v5 = v8;

  }
  objc_msgSend(v9, "_setContinuousCornerRadius:", v5);
  objc_msgSend(v9, "setClipsToBounds:", v3);

}

- (void)_animationTickForPresentationValue:(BOOL)a3
{
  _BOOL8 v3;
  UIViewFloatAnimatableProperty *progressProperty;
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
  NSObject *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  uint64_t v30;
  void *v31;
  int v32;
  double v33;
  __int16 v34;
  double v35;
  __int16 v36;
  double v37;
  __int16 v38;
  double v39;
  __int16 v40;
  _BOOL4 v41;
  uint64_t v42;

  v3 = a3;
  v42 = *MEMORY[0x1E0C80C00];
  progressProperty = self->_progressProperty;
  if (a3)
  {
    -[UIViewFloatAnimatableProperty presentationValue](progressProperty, "presentationValue");
    v7 = v6;
    -[UIViewFloatAnimatableProperty presentationValue](self->_catchupProperty, "presentationValue");
  }
  else
  {
    -[UIViewFloatAnimatableProperty value](progressProperty, "value");
    v7 = v10;
    -[UIViewFloatAnimatableProperty value](self->_catchupProperty, "value");
  }
  v9 = v8;
  -[SBCoverSheetSlidingViewController _viewVelocity](self, "_viewVelocity");
  v12 = v11;
  if (self->_performingCatchUpForPresentation)
    v13 = 1.0 - (1.0 - v7) * v9;
  else
    v13 = v7 * v9;
  v14 = v11;
  if (v3)
  {
    -[UIViewFloatAnimatableProperty velocity](self->_progressProperty, "velocity");
    v16 = v15;
    -[UIViewFloatAnimatableProperty velocity](self->_catchupProperty, "velocity");
    v18 = v9 * v16 + v7 * v17;
    v19 = -((1.0 - v7) * v17 - v16 * v9);
    if (self->_performingCatchUpForPresentation)
      v14 = v19;
    else
      v14 = v18;
  }
  SBLogCoverSheet();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    v32 = 134219008;
    v33 = v7;
    v34 = 2048;
    v35 = v9;
    v36 = 2048;
    v37 = v13;
    v38 = 2048;
    v39 = v12;
    v40 = 1024;
    v41 = v3;
    _os_log_debug_impl(&dword_1D0540000, v20, OS_LOG_TYPE_DEBUG, "animation ticked with progress: %.2f catchup: %.2f adjustedProgress: %.2f velocity: %.2f forPresentationValue: %{BOOL}d", (uint8_t *)&v32, 0x30u);
  }

  -[SBCoverSheetSlidingViewController _animationTickedWithProgress:velocity:forPresentationValue:](self, "_animationTickedWithProgress:velocity:forPresentationValue:", v3, v13, v14);
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  -[SBCoverSheetSlidingViewController systemGesturesDelegate](self, "systemGesturesDelegate");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "isAnyGestureActivelyRecognized");

  -[SBCoverSheetSlidingViewController delegate](self, "delegate");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "coverSheetSlidingViewController:animationTickedWithProgress:velocity:coverSheetFrame:gestureActive:forPresentationValue:", self, v30, v3, v13, v12, v22, v24, v26, v28);

}

- (void)_createProperties
{
  UIViewFloatAnimatableProperty *v3;
  UIViewFloatAnimatableProperty *catchupProperty;
  UIViewFloatAnimatableProperty *v5;
  UIViewFloatAnimatableProperty *progressProperty;
  void *v7;
  UIViewFloatAnimatableProperty *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id location;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v3 = (UIViewFloatAnimatableProperty *)objc_alloc_init(MEMORY[0x1E0CEABC0]);
  catchupProperty = self->_catchupProperty;
  self->_catchupProperty = v3;

  -[UIViewFloatAnimatableProperty setVelocityUsableForVFD:](self->_catchupProperty, "setVelocityUsableForVFD:", 1);
  -[UIViewFloatAnimatableProperty setValue:](self->_catchupProperty, "setValue:", 1.0);
  v5 = (UIViewFloatAnimatableProperty *)objc_alloc_init(MEMORY[0x1E0CEABC0]);
  progressProperty = self->_progressProperty;
  self->_progressProperty = v5;

  -[UIViewFloatAnimatableProperty setVelocityUsableForVFD:](self->_progressProperty, "setVelocityUsableForVFD:", 1);
  -[UIViewFloatAnimatableProperty setValue:](self->_progressProperty, "setValue:", 0.0);
  objc_initWeak(&location, self);
  v7 = (void *)MEMORY[0x1E0CEABB0];
  v8 = self->_catchupProperty;
  v16[0] = self->_progressProperty;
  v16[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __54__SBCoverSheetSlidingViewController__createProperties__block_invoke;
  v13[3] = &unk_1E8E9DF28;
  objc_copyWeak(&v14, &location);
  v11[0] = v10;
  v11[1] = 3221225472;
  v11[2] = __54__SBCoverSheetSlidingViewController__createProperties__block_invoke_2;
  v11[3] = &unk_1E8E9DF28;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v7, "_createTransformerWithInputAnimatableProperties:modelValueSetter:presentationValueSetter:", v9, v13, v11);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __54__SBCoverSheetSlidingViewController__createProperties__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_animationTickForPresentationValue:", 0);

}

void __54__SBCoverSheetSlidingViewController__createProperties__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_animationTickForPresentationValue:", 1);

}

- (void)_startCatchupAnimationWithDuration:(double)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[5];
  uint8_t buf[16];

  v6 = a4;
  SBLogCoverSheet();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_INFO, "_startCatchupAnimationWithDuration", buf, 2u);
  }

  if (self->_lastTouchLocation.x != *MEMORY[0x1E0C9D538]
    || self->_lastTouchLocation.y != *(double *)(MEMORY[0x1E0C9D538] + 8))
  {
    -[SBCoverSheetSlidingViewController lastTouchLocation](self, "lastTouchLocation");
    -[SBCoverSheetSlidingViewController _updateForLocation:interactive:](self, "_updateForLocation:interactive:", 1);
  }
  -[UIViewFloatAnimatableProperty setValue:](self->_catchupProperty, "setValue:", 0.0);
  v9 = (void *)MEMORY[0x1E0CEABB0];
  v12 = v6;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __83__SBCoverSheetSlidingViewController__startCatchupAnimationWithDuration_completion___block_invoke;
  v13[3] = &unk_1E8E9DED8;
  v13[4] = self;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __83__SBCoverSheetSlidingViewController__startCatchupAnimationWithDuration_completion___block_invoke_3;
  v11[3] = &unk_1E8EA4988;
  v10 = v6;
  objc_msgSend(v9, "_animateUsingSpringWithDampingRatio:response:tracking:initialDampingRatio:initialResponse:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:animations:completion:", 0, v13, v11, 1.0, a3, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);

}

uint64_t __83__SBCoverSheetSlidingViewController__startCatchupAnimationWithDuration_completion___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v4[5];
  CAFrameRateRange v5;

  v2 = (void *)MEMORY[0x1E0CEABB0];
  v5 = CAFrameRateRangeMake(30.0, 120.0, 120.0);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __83__SBCoverSheetSlidingViewController__startCatchupAnimationWithDuration_completion___block_invoke_2;
  v4[3] = &unk_1E8E9DED8;
  v4[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(v2, "sb_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1114125, v4, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
}

uint64_t __83__SBCoverSheetSlidingViewController__startCatchupAnimationWithDuration_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1136), "setValue:", 1.0);
}

uint64_t __83__SBCoverSheetSlidingViewController__startCatchupAnimationWithDuration_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_transitionToViewControllerAppearState:(int)a3
{
  -[SBCoverSheetSlidingViewController _transitionToViewControllerAppearState:ifNeeded:forUserGesture:](self, "_transitionToViewControllerAppearState:ifNeeded:forUserGesture:", *(_QWORD *)&a3, 0, 0);
}

- (void)_transitionToViewControllerAppearState:(int)a3 forUserGesture:(BOOL)a4
{
  -[SBCoverSheetSlidingViewController _transitionToViewControllerAppearState:ifNeeded:forUserGesture:](self, "_transitionToViewControllerAppearState:ifNeeded:forUserGesture:", *(_QWORD *)&a3, 0, a4);
}

- (void)_transitionToViewControllerAppearState:(int)a3 ifNeeded:(BOOL)a4 forUserGesture:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL4 v6;
  void *v10;
  SBCoverSheetSlidingViewController *v11;
  uint64_t v12;
  int64_t dismissalSlidingMode;
  void *v14;
  _BOOL4 v15;
  void *v16;
  int64_t v17;
  void *v18;
  int v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  int64_t v29;
  void *v30;
  void *v31;
  id v32;

  v5 = a5;
  v6 = a4;
  -[SBCoverSheetSlidingViewController delegate](self, "delegate");
  v32 = (id)objc_claimAutoreleasedReturnValue();
  switch(a3)
  {
    case 0:
      if (self->_dismissalSlidingMode == 2)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBCoverSheetSlidingViewController.m"), 1424, CFSTR("if we're in rubber band mode we should never ever disappear"));

      }
      -[SBCoverSheetSlidingViewController _transitionToViewControllerAppearState:ifNeeded:forUserGesture:](self, "_transitionToViewControllerAppearState:ifNeeded:forUserGesture:", 3, 1, v5);
      -[SBCoverSheetSlidingViewController systemGesturesDelegate](self, "systemGesturesDelegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setSyntheticAppearState:", 0);

      objc_msgSend(v32, "coverSheetSlidingViewControllerCleanupDismissalTransition:", self);
      v11 = self;
      v12 = 0;
      goto LABEL_28;
    case 1:
      -[SBCoverSheetSlidingViewController setCompletionBlock:](self, "setCompletionBlock:", 0);
      dismissalSlidingMode = self->_dismissalSlidingMode;
      if (v6)
      {
        -[SBCoverSheetSlidingViewController systemGesturesDelegate](self, "systemGesturesDelegate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "syntheticAppearState") == 3;

      }
      else
      {
        v15 = 1;
      }
      -[SBCoverSheetSlidingViewController systemGesturesDelegate](self, "systemGesturesDelegate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "syntheticAppearState");

      -[SBCoverSheetSlidingViewController systemGesturesDelegate](self, "systemGesturesDelegate");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "syntheticAppearState");

      -[SBCoverSheetSlidingViewController systemGesturesDelegate](self, "systemGesturesDelegate");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setSyntheticAppearState:", 1);

      if (v15)
      {
        if (dismissalSlidingMode == 2)
        {
          objc_msgSend(v32, "coverSheetSlidingViewControllerPrepareForRubberBandedPresentationTransition:", self);
        }
        else
        {
          objc_msgSend(v32, "coverSheetSlidingViewController:prepareForPresentationTransitionForUserGesture:", self, v5);
          if (!v24 || v26 == 3)
            -[SBCoverSheetSlidingViewController _beginTransitionFromAppeared:](self, "_beginTransitionFromAppeared:", 0);
        }
      }
      goto LABEL_29;
    case 2:
      -[SBCoverSheetSlidingViewController _transitionToViewControllerAppearState:ifNeeded:forUserGesture:](self, "_transitionToViewControllerAppearState:ifNeeded:forUserGesture:", 1, 1, v5);
      -[SBCoverSheetSlidingViewController systemGesturesDelegate](self, "systemGesturesDelegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setSyntheticAppearState:", 2);

      v17 = self->_dismissalSlidingMode;
      if (v17 == 3)
      {
        objc_msgSend(v32, "coverSheetSlidingViewControllerCleanupInterstitialTransition:", self);
      }
      else
      {
        if (v17 == 2)
        {
          objc_msgSend(v32, "coverSheetSlidingViewControllerCleanupRubberBandedPresentationTransition:", self);
        }
        else
        {
          if (v17 != 1)
            goto LABEL_29;
          objc_msgSend(v32, "coverSheetSlidingViewControllerCleanupPresentationTransition:", self);
        }
        v11 = self;
        v12 = 1;
LABEL_28:
        -[SBCoverSheetSlidingViewController _endTransitionToAppeared:](v11, "_endTransitionToAppeared:", v12);
      }
      goto LABEL_29;
    case 3:
      -[SBCoverSheetSlidingViewController setCompletionBlock:](self, "setCompletionBlock:", 0);
      -[SBCoverSheetSlidingViewController systemGesturesDelegate](self, "systemGesturesDelegate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "syntheticAppearState");

      -[SBCoverSheetSlidingViewController systemGesturesDelegate](self, "systemGesturesDelegate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "syntheticAppearState");

      if (v6)
      {
        -[SBCoverSheetSlidingViewController systemGesturesDelegate](self, "systemGesturesDelegate");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setSyntheticAppearState:", 3);

        if (v19 != 1 && v21 != 2)
          goto LABEL_29;
      }
      else
      {
        -[SBCoverSheetSlidingViewController systemGesturesDelegate](self, "systemGesturesDelegate");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setSyntheticAppearState:", 3);

      }
      objc_msgSend(v32, "coverSheetSlidingViewController:prepareForDismissalTransitionForReversingTransition:forUserGesture:", self, v19 == 1, v5);
      v29 = self->_dismissalSlidingMode;
      if (v21 == 2 && v29 != 3)
        -[SBCoverSheetSlidingViewController _beginTransitionFromAppeared:](self, "_beginTransitionFromAppeared:", 1);
      if ((v29 & 0xFFFFFFFFFFFFFFFELL) == 2)
      {
        -[SBCoverSheetSlidingViewController systemGesturesDelegate](self, "systemGesturesDelegate");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setSyntheticAppearState:", 2);

      }
LABEL_29:

      return;
    default:
      goto LABEL_29;
  }
}

- (void)_addSystemGestureRecognizers
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (self->_canBePulledDown)
  {
    -[SBCoverSheetSlidingViewController _addSystemGestureRecognizerIfUntracked:withType:](self, "_addSystemGestureRecognizerIfUntracked:withType:", self->_indirectPresentGestureRecognizer, 9);
    -[SBCoverSheetSlidingViewController _addSystemGestureRecognizerIfUntracked:withType:](self, "_addSystemGestureRecognizerIfUntracked:withType:", self->_dismissAddendumGestureRecognizer, 3);
    v3 = 12;
    v4 = 11;
    v5 = 2;
  }
  else
  {
    v3 = 14;
    v4 = 13;
    v5 = 4;
  }
  if (self->_canBePulledUp)
  {
    -[SBCoverSheetSlidingViewController _addSystemGestureRecognizerIfUntracked:withType:](self, "_addSystemGestureRecognizerIfUntracked:withType:", self->_dismissGestureRecognizer, v5);
    -[SBCoverSheetSlidingViewController _addSystemGestureRecognizerIfUntracked:withType:](self, "_addSystemGestureRecognizerIfUntracked:withType:", self->_indirectDismissGestureRecognizer, v4);
    -[SBCoverSheetSlidingViewController _addSystemGestureRecognizerIfUntracked:withType:](self, "_addSystemGestureRecognizerIfUntracked:withType:", self->_scrunchDismissGestureRecognizer, v3);
  }
}

- (void)_removeSystemGestureRecognizers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  +[SBSystemGestureManager mainDisplayManager](SBSystemGestureManager, "mainDisplayManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBCoverSheetSlidingViewController _grabberRecognizer](self, "_grabberRecognizer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeGestureRecognizer:", v4);

  +[SBSystemGestureManager mainDisplayManager](SBSystemGestureManager, "mainDisplayManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeGestureRecognizer:", self->_dismissGestureRecognizer);

  +[SBSystemGestureManager mainDisplayManager](SBSystemGestureManager, "mainDisplayManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeGestureRecognizer:", self->_dismissAddendumGestureRecognizer);

  +[SBSystemGestureManager mainDisplayManager](SBSystemGestureManager, "mainDisplayManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeGestureRecognizer:", self->_indirectDismissGestureRecognizer);

  +[SBSystemGestureManager mainDisplayManager](SBSystemGestureManager, "mainDisplayManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeGestureRecognizer:", self->_scrunchDismissGestureRecognizer);

  +[SBSystemGestureManager mainDisplayManager](SBSystemGestureManager, "mainDisplayManager");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeGestureRecognizer:", self->_indirectPresentGestureRecognizer);

}

- (void)_addSystemGestureRecognizerIfUntracked:(id)a3 withType:(unint64_t)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  +[SBSystemGestureManager mainDisplayManager](SBSystemGestureManager, "mainDisplayManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isSystemGestureRecognizer:", v5))
  {
    SBLogCoverSheet();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = 138412290;
      v9 = v5;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_INFO, "Ignoring attempt to add CoverSheet system gesture: %@ because it is already tracked.", (uint8_t *)&v8, 0xCu);
    }

  }
  else
  {
    objc_msgSend(v6, "addGestureRecognizer:withType:", v5, a4);
  }

}

- (id)_grabberRecognizer
{
  void *v2;
  void *v3;

  -[SBCoverSheetSlidingViewController systemGesturesDelegate](self, "systemGesturesDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentGestureRecognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  -[CSLockScreenSettings coverSheetDismissGestureSettings](self->_lockScreenSettings, "coverSheetDismissGestureSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v7;
  if (v5 == v7)
  {
    -[SBCoverSheetSlidingViewController _updateCoverSheetDismissSettings:](self, "_updateCoverSheetDismissSettings:", v7);
    v6 = v7;
  }

}

- (void)_updateHomeGestureSettings:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;

  v3 = a3;
  objc_msgSend(v3, "minimumYDistanceForHomeOrAppSwitcher");
  *(double *)&SBCoverSheetMinimumYDistanceForDismissal = v4 * SBMainScreenPointsPerMillimeter();
  objc_msgSend(v3, "minimumYVelocityForHome");
  v6 = v5;

  *(double *)&SBCoverSheetMinimumYVelocityForDismissal = v6 * SBMainScreenPointsPerMillimeter();
}

- (void)_updateCoverSheetDismissSettings:(id)a3
{
  SBScreenEdgePanGestureRecognizer *dismissGestureRecognizer;
  id v5;
  SBScreenEdgePanGestureRecognizer *v6;
  SBScreenEdgePanGestureRecognizer *dismissAddendumGestureRecognizer;
  SBScreenEdgePanGestureRecognizer *v8;
  double v9;
  double v10;

  dismissGestureRecognizer = self->_dismissGestureRecognizer;
  v5 = a3;
  objc_msgSend(v5, "edgeRegionSize");
  -[UIScreenEdgePanGestureRecognizer _setEdgeRegionSize:](dismissGestureRecognizer, "_setEdgeRegionSize:");
  v6 = self->_dismissGestureRecognizer;
  objc_msgSend(v5, "edgeRegionSize");
  -[UIScreenEdgePanGestureRecognizer _setBottomEdgeRegionSize:](v6, "_setBottomEdgeRegionSize:");
  -[SBScreenEdgePanGestureRecognizer setEnabled:](self->_dismissAddendumGestureRecognizer, "setEnabled:", objc_msgSend(v5, "extendSwipeUpRegion"));
  dismissAddendumGestureRecognizer = self->_dismissAddendumGestureRecognizer;
  objc_msgSend(v5, "extendedEdgeRegionSize");
  -[UIScreenEdgePanGestureRecognizer _setEdgeRegionSize:](dismissAddendumGestureRecognizer, "_setEdgeRegionSize:");
  v8 = self->_dismissAddendumGestureRecognizer;
  objc_msgSend(v5, "extendedEdgeRegionSize");
  v10 = v9;

  -[UIScreenEdgePanGestureRecognizer _setBottomEdgeRegionSize:](v8, "_setBottomEdgeRegionSize:", v10);
}

- (void)setCompletionGroup:(id)a3
{
  OS_dispatch_group *v5;
  OS_dispatch_group *v6;

  v5 = (OS_dispatch_group *)a3;
  if (self->_completionGroup != v5)
  {
    v6 = v5;
    -[SBCoverSheetSlidingViewController setCompletionBlock:](self, "setCompletionBlock:", 0);
    objc_storeStrong((id *)&self->_completionGroup, a3);
    v5 = v6;
  }

}

- (void)setCompletionBlock:(id)a3
{
  id v4;
  id *p_completionBlock;
  NSObject *v6;
  uint64_t v7;
  dispatch_block_t v8;
  NSObject *v9;

  v4 = a3;
  p_completionBlock = &self->_completionBlock;
  if (*p_completionBlock != v4)
  {
    if (*p_completionBlock)
    {
      SBLogCoverSheet();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        -[SBCoverSheetSlidingViewController setCompletionBlock:].cold.2();

      dispatch_block_cancel(*p_completionBlock);
    }
    v7 = objc_msgSend(v4, "copy");
    v8 = *p_completionBlock;
    *p_completionBlock = (id)v7;

    SBLogCoverSheet();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[SBCoverSheetSlidingViewController setCompletionBlock:].cold.1();

  }
}

- (void)_studyLogForGestureRecognizerState:(int64_t)a3 bounds:(CGRect)a4 position:(double)a5 velocity:(double)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v13;
  _QWORD v14[11];

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  objc_msgSend(MEMORY[0x1E0DAFEC0], "sharedInstance");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __97__SBCoverSheetSlidingViewController__studyLogForGestureRecognizerState_bounds_position_velocity___block_invoke;
  v14[3] = &__block_descriptor_88_e5__8__0l;
  v14[4] = a3;
  *(double *)&v14[5] = a5;
  *(double *)&v14[6] = a6;
  *(CGFloat *)&v14[7] = x;
  *(CGFloat *)&v14[8] = y;
  *(CGFloat *)&v14[9] = width;
  *(CGFloat *)&v14[10] = height;
  objc_msgSend(v13, "logBlock:", v14);

}

id __97__SBCoverSheetSlidingViewController__studyLogForGestureRecognizerState_bounds_position_velocity___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v13;
  void *v14;
  _QWORD v15[4];
  _QWORD v16[4];
  _QWORD v17[4];
  _QWORD v18[6];

  v18[4] = *MEMORY[0x1E0C80C00];
  v17[0] = CFSTR("state");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v2;
  v17[1] = CFSTR("position");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v3;
  v17[2] = CFSTR("velocity");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v4;
  v17[3] = CFSTR("viewBounds");
  v15[0] = CFSTR("x");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 56));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v5;
  v15[1] = CFSTR("y");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 64));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v6;
  v15[2] = CFSTR("width");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 72));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v7;
  v15[3] = CFSTR("height");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 80));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = CFSTR("[SBCoverSheetSlidingViewController _shouldEndPresentedForEndingGestureRecognizer:]");
  v14 = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)_studyLogForCompletionOfTransitionToPresented:(BOOL)a3
{
  void *v5;
  int v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __CFString *v13;
  int IsActive;
  uint64_t v15;
  BOOL v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  __CFString *v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  const __CFString *v36;
  void *v37;
  uint8_t buf[4];
  __CFString *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DAFEC0], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEnabled");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", CFSTR("SBCoverSheetSlidingViewController"), CFSTR("LogSource"));
    v8 = CFSTR("VisibleUI");
  }
  else
  {
    v8 = 0;
    v7 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "activeInterfaceOrientation");

  -[UIViewController _sbWindowScene](self, "_sbWindowScene");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "switcherController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3)
  {
    v13 = CFSTR("CoverSheet");
    goto LABEL_20;
  }
  IsActive = SBWorkspaceSpringBoardIsActive();
  v15 = objc_msgSend(v12, "unlockedEnvironmentMode");
  v16 = v15 == 2;
  if (IsActive)
  {
    if (v15 != 2)
    {
      v13 = CFSTR("HomeScreen");
      goto LABEL_20;
    }
    v17 = v12;
  }
  else
  {
    v17 = v12;
    if (!v16)
    {
      objc_msgSend(v12, "layoutStatePrimaryElement");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "workspaceEntity");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "applicationSceneEntity");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "sceneHandle");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v22, "application");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "bundleIdentifier");
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = (void *)v24;
      v26 = CFSTR("Unknown");
      if (v24)
        v26 = (__CFString *)v24;
      v13 = v26;

      v27 = objc_msgSend(v22, "currentInterfaceOrientation");
      if (v6)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v28, CFSTR("AppInterfaceOrientation"));

      }
      goto LABEL_18;
    }
  }
  v18 = objc_msgSend(v17, "interfaceOrientation");
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v18);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v22, CFSTR("SwitcherInterfaceOrientation"));
    v13 = CFSTR("AppSwitcher");
LABEL_18:

    goto LABEL_20;
  }
  v13 = CFSTR("AppSwitcher");
LABEL_20:
  SBLogSystemGestureAppSwitcher();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    BSInterfaceOrientationDescription();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    BSInterfaceOrientationDescription();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    BSInterfaceOrientationDescription();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v39 = v13;
    v40 = 2112;
    v41 = v30;
    v42 = 2112;
    v43 = v31;
    v44 = 2112;
    v45 = v32;
    _os_log_impl(&dword_1D0540000, v29, OS_LOG_TYPE_INFO, "Visible UI change seen by Cover Sheet: transition to %@ (SB interface orientation: %@, switcher interface orientation: %@,  app interface orientation: %@)", buf, 0x2Au);

  }
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v33, CFSTR("SBInterfaceOrientation"));

    objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, v8);
    objc_msgSend(MEMORY[0x1E0DAFEC0], "sharedInstance");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = CFSTR("VisibleUIChanged");
    v37 = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "log:", v35);

  }
}

- (SBCoverSheetSlidingViewControllerContentViewController)contentViewController
{
  return self->_contentViewController;
}

- (SBCoverSheetSlidingViewControllerDelegate)delegate
{
  return (SBCoverSheetSlidingViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SBScreenEdgePanGestureRecognizer)dismissGestureRecognizer
{
  return self->_dismissGestureRecognizer;
}

- (void)setDismissGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_dismissGestureRecognizer, a3);
}

- (SBScreenEdgePanGestureRecognizer)dismissAddendumGestureRecognizer
{
  return self->_dismissAddendumGestureRecognizer;
}

- (void)setDismissAddendumGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_dismissAddendumGestureRecognizer, a3);
}

- (SBIndirectPanGestureRecognizer)indirectPresentGestureRecognizer
{
  return self->_indirectPresentGestureRecognizer;
}

- (void)setIndirectPresentGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_indirectPresentGestureRecognizer, a3);
}

- (SBIndirectPanGestureRecognizer)indirectDismissGestureRecognizer
{
  return self->_indirectDismissGestureRecognizer;
}

- (void)setIndirectDismissGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_indirectDismissGestureRecognizer, a3);
}

- (SBFluidScrunchGestureRecognizer)scrunchDismissGestureRecognizer
{
  return self->_scrunchDismissGestureRecognizer;
}

- (void)setScrunchDismissGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_scrunchDismissGestureRecognizer, a3);
}

- (SBProximitySensorManager)proximitySensorManager
{
  return self->_proximitySensorManager;
}

- (void)setProximitySensorManager:(id)a3
{
  objc_storeStrong((id *)&self->_proximitySensorManager, a3);
}

- (int64_t)dismissalSlidingMode
{
  return self->_dismissalSlidingMode;
}

- (int64_t)dismissalTransformMode
{
  return self->_dismissalTransformMode;
}

- (void)setDismissalTransformMode:(int64_t)a3
{
  self->_dismissalTransformMode = a3;
}

- (void)setSystemGesturesDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_systemGesturesDelegate, a3);
}

- (BOOL)roundsCorners
{
  return self->_roundsCorners;
}

- (void)setRoundsCorners:(BOOL)a3
{
  self->_roundsCorners = a3;
}

- (CSCoverSheetTransitionSettings)transitionSettings
{
  return (CSCoverSheetTransitionSettings *)objc_loadWeakRetained((id *)&self->_transitionSettings);
}

- (void)setTransitionSettings:(id)a3
{
  objc_storeWeak((id *)&self->_transitionSettings, a3);
}

- (SBCoverSheetPositionView)positionView
{
  return self->_positionView;
}

- (void)setPositionView:(id)a3
{
  objc_storeStrong((id *)&self->_positionView, a3);
}

- (BOOL)indirectPresentGestureCalledBegin
{
  return self->_indirectPresentGestureCalledBegin;
}

- (void)setIndirectPresentGestureCalledBegin:(BOOL)a3
{
  self->_indirectPresentGestureCalledBegin = a3;
}

- (SBHomeGestureSettings)homeGestureSettings
{
  return self->_homeGestureSettings;
}

- (void)setHomeGestureSettings:(id)a3
{
  objc_storeStrong((id *)&self->_homeGestureSettings, a3);
}

- (CSLockScreenSettings)lockScreenSettings
{
  return self->_lockScreenSettings;
}

- (void)setLockScreenSettings:(id)a3
{
  objc_storeStrong((id *)&self->_lockScreenSettings, a3);
}

- (int64_t)presentGestureState
{
  return self->_presentGestureState;
}

- (BOOL)canBePulledDown
{
  return self->_canBePulledDown;
}

- (void)setCanBePulledDown:(BOOL)a3
{
  self->_canBePulledDown = a3;
}

- (BOOL)canBePulledUp
{
  return self->_canBePulledUp;
}

- (void)setCanBePulledUp:(BOOL)a3
{
  self->_canBePulledUp = a3;
}

- (UIViewFloatAnimatableProperty)progressProperty
{
  return self->_progressProperty;
}

- (void)setProgressProperty:(id)a3
{
  objc_storeStrong((id *)&self->_progressProperty, a3);
}

- (UIViewFloatAnimatableProperty)catchupProperty
{
  return self->_catchupProperty;
}

- (void)setCatchupProperty:(id)a3
{
  objc_storeStrong((id *)&self->_catchupProperty, a3);
}

- (BOOL)performingCatchUpForPresentation
{
  return self->_performingCatchUpForPresentation;
}

- (void)setPerformingCatchUpForPresentation:(BOOL)a3
{
  self->_performingCatchUpForPresentation = a3;
}

- (CGPoint)lastTouchLocation
{
  double x;
  double y;
  CGPoint result;

  x = self->_lastTouchLocation.x;
  y = self->_lastTouchLocation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setLastTouchLocation:(CGPoint)a3
{
  self->_lastTouchLocation = a3;
}

- (CGPoint)lastGestureVelocity
{
  double x;
  double y;
  CGPoint result;

  x = self->_lastGestureVelocity.x;
  y = self->_lastGestureVelocity.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setLastGestureVelocity:(CGPoint)a3
{
  self->_lastGestureVelocity = a3;
}

- (int64_t)groupCount
{
  return self->_groupCount;
}

- (void)setGroupCount:(int64_t)a3
{
  self->_groupCount = a3;
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (OS_dispatch_group)completionGroup
{
  return self->_completionGroup;
}

- (double)initialTouchOffsetFromScreenEdge
{
  return self->_initialTouchOffsetFromScreenEdge;
}

- (void)setInitialTouchOffsetFromScreenEdge:(double)a3
{
  self->_initialTouchOffsetFromScreenEdge = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionGroup, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_catchupProperty, 0);
  objc_storeStrong((id *)&self->_progressProperty, 0);
  objc_storeStrong((id *)&self->_lockScreenSettings, 0);
  objc_storeStrong((id *)&self->_homeGestureSettings, 0);
  objc_storeStrong((id *)&self->_positionView, 0);
  objc_destroyWeak((id *)&self->_transitionSettings);
  objc_storeStrong((id *)&self->_systemGesturesDelegate, 0);
  objc_storeStrong((id *)&self->_proximitySensorManager, 0);
  objc_storeStrong((id *)&self->_scrunchDismissGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_indirectDismissGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_indirectPresentGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_dismissAddendumGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_dismissGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_storeStrong((id *)&self->_suppressTouchCancellation, 0);
  objc_storeStrong((id *)&self->_frameRateAssertion, 0);
}

- (void)_dismissGestureBeganWithGestureRecognizer:(os_log_t)log .cold.1(os_log_t log, double a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  double v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 134218240;
  v3 = 0;
  v4 = 2048;
  v5 = a2;
  _os_log_debug_impl(&dword_1D0540000, log, OS_LOG_TYPE_DEBUG, "dismissGestureBegan: imparting velocity (%f, %f)", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_2_0();
}

- (void)_presentOrDismissGestureChangedWithGestureRecognizer:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D0540000, log, OS_LOG_TYPE_DEBUG, "We're presenting the interstitial, don't move CoverSheet.", v1, 2u);
  OUTLINED_FUNCTION_4();
}

void __90__SBCoverSheetSlidingViewController__finishTransitionToPresented_animated_withCompletion___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  v0 = (void *)MEMORY[0x1D17E5550]();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_6(&dword_1D0540000, v1, v2, "completionBlock %p Creation", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_2_2();
}

void __90__SBCoverSheetSlidingViewController__finishTransitionToPresented_animated_withCompletion___block_invoke_74_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a1, "completionBlock");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x1D17E5550]();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_6(&dword_1D0540000, v3, v4, "completionBlock %p Fired", v5, v6, v7, v8, v9);

}

- (void)_beginTransitionFromAppeared:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_3(&dword_1D0540000, a2, a3, "_beginTransitionFromAppeared: %{BOOL}d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

void __68__SBCoverSheetSlidingViewController__updateForLocation_interactive___block_invoke_cold_1(_QWORD *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(*a1 + a2);
  v4 = 134217984;
  v5 = v3;
  OUTLINED_FUNCTION_0_1(&dword_1D0540000, a3, (uint64_t)a3, "completionBlock Group Enter %ld", (uint8_t *)&v4);
  OUTLINED_FUNCTION_2_0();
}

void __68__SBCoverSheetSlidingViewController__updateForLocation_interactive___block_invoke_91_cold_1(_QWORD *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(*a1 + a2);
  v4 = 134217984;
  v5 = v3;
  OUTLINED_FUNCTION_0_1(&dword_1D0540000, a3, (uint64_t)a3, "completionBlock Group Leave %ld", (uint8_t *)&v4);
  OUTLINED_FUNCTION_2_0();
}

- (void)_endTransitionToAppeared:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_3(&dword_1D0540000, a2, a3, "_endTransitionToAppeared: %{BOOL}d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (void)setCompletionBlock:.cold.1()
{
  OUTLINED_FUNCTION_4_4();
}

- (void)setCompletionBlock:.cold.2()
{
  OUTLINED_FUNCTION_4_4();
}

@end
