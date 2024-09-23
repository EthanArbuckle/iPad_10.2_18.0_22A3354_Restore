@implementation SBTransientOverlayViewController

- (SBTransientOverlayViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  char *v4;
  uint64_t v5;
  void *v6;
  __int128 *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SBTransientOverlayViewController;
  v4 = -[SBTransientOverlayViewController initWithNibName:bundle:](&v13, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0DA9E28], "rootSettings");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)*((_QWORD *)v4 + 126);
    *((_QWORD *)v4 + 126) = v5;

    *((_QWORD *)v4 + 155) = 0x3FF0000000000000;
    v7 = (__int128 *)MEMORY[0x1E0C9BAA8];
    v8 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    *(_OWORD *)(v4 + 1320) = v8;
    v10 = *v7;
    v9 = v7[1];
    *(_OWORD *)(v4 + 1288) = *v7;
    *(_OWORD *)(v4 + 1304) = v9;
    *(_OWORD *)(v4 + 1336) = v10;
    *(_OWORD *)(v4 + 1352) = v9;
    *(_OWORD *)(v4 + 1368) = v8;
    *((_QWORD *)v4 + 133) = 0x7FFFFFFFFFFFFFFFLL;
    *((_QWORD *)v4 + 131) = 0x7FFFFFFFFFFFFFFFLL;
    v4[1101] = 1;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v4, sel__keyboardWillHideNotification_, *MEMORY[0x1E0CEB970], 0);
    objc_msgSend(v11, "addObserver:selector:name:object:", v4, sel__keyboardWillShowNotification_, *MEMORY[0x1E0CEB978], 0);
    objc_msgSend(v4, "setPresentationDimmingViewHidden:", 1);

  }
  return (SBTransientOverlayViewController *)v4;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  if (self->_statusBar)
  {
    -[UIViewController _sbWindowScene](self, "_sbWindowScene");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "statusBarManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reusePool");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "recycleStatusBar:", self->_statusBar);

  }
  -[SBTransientOverlayViewController _invalidateKeyboardHomeAffordanceAssertion](self, "_invalidateKeyboardHomeAffordanceAssertion");
  -[BSInvalidatable invalidate](self->_displayLayoutElementAssertion, "invalidate");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:name:object:", self, *MEMORY[0x1E0CEB970], 0);
  objc_msgSend(v6, "removeObserver:name:object:", self, *MEMORY[0x1E0CEB978], 0);

  v7.receiver = self;
  v7.super_class = (Class)SBTransientOverlayViewController;
  -[SBTransientOverlayViewController dealloc](&v7, sel_dealloc);
}

- (NSString)description
{
  return (NSString *)-[SBTransientOverlayViewController descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBTransientOverlayViewController succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[SBTransientOverlayViewController descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)handleHeadsetButtonPress:(BOOL)a3
{
  return 0;
}

- (BOOL)handleHomeButtonPress
{
  return 1;
}

- (BOOL)handleHomeButtonDoublePress
{
  return 0;
}

- (BOOL)handleHomeButtonLongPress
{
  return 1;
}

- (BOOL)handleLockButtonPress
{
  return 0;
}

- (BOOL)handleVoiceCommandButtonPress
{
  return 0;
}

- (BOOL)handleVolumeUpButtonPress
{
  return 0;
}

- (BOOL)handleVolumeDownButtonPress
{
  return 0;
}

- (double)additionalEdgeSpacingForHomeGrabberView:(id)a3
{
  return self->_presentationHomeGrabberAdditionalEdgeSpacing;
}

- (BOOL)shouldAllowThinStyleForHomeGrabberView:(id)a3
{
  return 1;
}

- (BOOL)shouldAllowAutoHideForHomeGrabberView:(id)a3
{
  return self->_presentationAllowsHomeGrabberAutoHide;
}

- (int64_t)idleTimerDuration
{
  return 12;
}

- (int64_t)idleTimerMode
{
  return 1;
}

- (int64_t)idleWarnMode
{
  return 2;
}

- (id)coordinatorRequestedIdleTimerBehavior:(id)a3
{
  return +[SBIdleTimerBehavior behaviorForBehaviorProvider:](SBIdleTimerBehavior, "behaviorForBehaviorProvider:", self);
}

- (SBSDisplayLayoutElement)_displayLayoutElement
{
  SBSDisplayLayoutElement *displayLayoutElement;
  id v4;
  void *v5;
  SBSDisplayLayoutElement *v6;
  SBSDisplayLayoutElement *v7;

  displayLayoutElement = self->_displayLayoutElement;
  if (!displayLayoutElement)
  {
    v4 = objc_alloc(MEMORY[0x1E0DAAE30]);
    -[SBTransientOverlayViewController preferredDisplayLayoutElementIdentifier](self, "preferredDisplayLayoutElementIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (SBSDisplayLayoutElement *)objc_msgSend(v4, "initWithIdentifier:", v5);
    v7 = self->_displayLayoutElement;
    self->_displayLayoutElement = v6;

    displayLayoutElement = self->_displayLayoutElement;
  }
  return displayLayoutElement;
}

- (void)updateDisplayLayoutElementWithBuilder:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  BSInvalidatable *displayLayoutElementAssertion;
  BSInvalidatable *v12;
  BSInvalidatable *v13;
  void *v14;
  void *v15;
  void (**v16)(id, void *);

  v16 = (void (**)(id, void *))a3;
  -[SBTransientOverlayViewController _displayLayoutElement](self, "_displayLayoutElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_displayLayoutElementAssertion)
  {
    -[UIViewController _sbWindowScene](self, "_sbWindowScene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBTransientOverlayViewController.m"), 220, CFSTR("No window scene to get a publisher: %@"), self);

    }
    objc_msgSend(v6, "displayLayoutPublisher");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBTransientOverlayViewController.m"), 220, CFSTR("No publisher for window scene: %@; self: %@"),
        v6,
        self);

    }
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "transitionAssertionWithReason:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[BSInvalidatable invalidate](self->_displayLayoutElementAssertion, "invalidate");
    displayLayoutElementAssertion = self->_displayLayoutElementAssertion;
    self->_displayLayoutElementAssertion = 0;

    v16[2](v16, v5);
    objc_msgSend(v7, "addElement:", v5);
    v12 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    v13 = self->_displayLayoutElementAssertion;
    self->_displayLayoutElementAssertion = v12;

    objc_msgSend(v10, "invalidate");
  }
  else
  {
    v16[2](v16, v5);
  }

}

- (void)setDisplayLayoutElementActive:(BOOL)a3
{
  BSInvalidatable *displayLayoutElementAssertion;
  void *v6;
  void *v7;
  BSInvalidatable *v8;
  BSInvalidatable *v9;
  BSInvalidatable *v10;
  void *v11;
  void *v12;
  void *v13;

  displayLayoutElementAssertion = self->_displayLayoutElementAssertion;
  if (a3)
  {
    if (!displayLayoutElementAssertion)
    {
      -[SBTransientOverlayViewController _displayLayoutElement](self, "_displayLayoutElement");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIViewController _sbWindowScene](self, "_sbWindowScene");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v6)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBTransientOverlayViewController.m"), 242, CFSTR("No window scene to get a publisher: %@"), self);

      }
      objc_msgSend(v6, "displayLayoutPublisher");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v7)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBTransientOverlayViewController.m"), 242, CFSTR("No publisher for window scene: %@; self: %@"),
          v6,
          self);

      }
      objc_msgSend(v7, "addElement:", v13);
      v8 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
      v9 = self->_displayLayoutElementAssertion;
      self->_displayLayoutElementAssertion = v8;

    }
  }
  else if (displayLayoutElementAssertion)
  {
    -[BSInvalidatable invalidate](displayLayoutElementAssertion, "invalidate");
    v10 = self->_displayLayoutElementAssertion;
    self->_displayLayoutElementAssertion = 0;

  }
}

- (BOOL)isDisplayLayoutElementActive
{
  return self->_displayLayoutElementAssertion != 0;
}

- (int64_t)preferredInterfaceOrientationForPresentation
{
  id WeakRetained;
  int64_t v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_transientOverlayDelegate);
  v4 = objc_msgSend(WeakRetained, "defaultPreferredInterfaceOrientationForPresentationForTransientOverlayViewController:", self);

  return v4;
}

- (void)setNeedsStatusBarAppearanceUpdate
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_transientOverlayDelegate);
  objc_msgSend(WeakRetained, "transientOverlayViewControllerNeedsStatusBarAppearanceUpdate:", self);

  -[SBTransientOverlayViewController _applyStatusBarStyleRequestWithInitialStatusBarSettings:](self, "_applyStatusBarStyleRequestWithInitialStatusBarSettings:", 0);
}

- (void)setNeedsWhitePointAdaptivityStyleUpdate
{
  id v3;

  -[SBTransientOverlayViewController transientOverlayDelegate](self, "transientOverlayDelegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transientOverlayViewControllerNeedsWhitePointAdaptivityStyleUpdate:", self);

}

- (unint64_t)supportedInterfaceOrientations
{
  id WeakRetained;
  unint64_t v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_transientOverlayDelegate);
  v4 = objc_msgSend(WeakRetained, "defaultSupportedInterfaceOrientationsForTransientOverlayViewController:", self);

  return v4;
}

- (BOOL)shouldAutorotate
{
  id WeakRetained;
  char v5;

  if ((SBTraitsArbiterOrientationActuationEnabledForRole(CFSTR("SBTraitsParticipantRoleTransientOverlay")) & 1) != 0)
    return 1;
  WeakRetained = objc_loadWeakRetained((id *)&self->_transientOverlayDelegate);
  v5 = objc_msgSend(WeakRetained, "defaultShouldAutorotateForTransientOverlayViewController:", self);

  return v5;
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBTransientOverlayViewController;
  -[SBTransientOverlayViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  if (!-[SBTransientOverlayViewController isIgnoringAppearanceUpdates](self, "isIgnoringAppearanceUpdates"))
    -[SBTransientOverlayViewController setDisplayLayoutElementActive:](self, "setDisplayLayoutElementActive:", 1);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBTransientOverlayViewController;
  -[SBTransientOverlayViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  if (!-[SBTransientOverlayViewController isIgnoringAppearanceUpdates](self, "isIgnoringAppearanceUpdates"))
    -[SBTransientOverlayViewController setDisplayLayoutElementActive:](self, "setDisplayLayoutElementActive:", 0);
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  UIView *contentView;
  SBHomeGrabberView *grabberView;
  UIStatusBar *statusBar;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v25.receiver = self;
  v25.super_class = (Class)SBTransientOverlayViewController;
  -[SBTransientOverlayViewController viewDidLayoutSubviews](&v25, sel_viewDidLayoutSubviews);
  -[SBTransientOverlayViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[UIView setFrame:](self->_backgroundView, "setFrame:");
  -[UIView setFrame:](self->_presentationBackgroundView, "setFrame:", v5, v7, v9, v11);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[UIView subviews](self->_presentationBackgroundView, "subviews", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        -[UIView bounds](self->_presentationBackgroundView, "bounds");
        objc_msgSend(v17, "setFrame:");
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v14);
  }

  -[UIView sb_setBoundsAndPositionFromFrame:](self->_contentContainerView, "sb_setBoundsAndPositionFromFrame:", v5, v7, v9, v11);
  -[UIView sb_setBoundsAndPositionFromFrame:](self->_homeGrabberContainerView, "sb_setBoundsAndPositionFromFrame:", v5, v7, v9, v11);
  contentView = self->_contentView;
  -[UIView bounds](self->_contentContainerView, "bounds");
  -[UIView setFrame:](contentView, "setFrame:");
  grabberView = self->_grabberView;
  -[UIView bounds](self->_homeGrabberContainerView, "bounds");
  -[SBHomeGrabberView setFrame:](grabberView, "setFrame:");
  statusBar = self->_statusBar;
  -[SBTransientOverlayViewController _currentStatusBarFrameForStyle:](self, "_currentStatusBarFrameForStyle:", -[UIStatusBar currentStyle](statusBar, "currentStyle"));
  -[UIStatusBar setFrame:](statusBar, "setFrame:");
  -[UIView setFrame:](self->_dimmingView, "setFrame:", v5, v7, v9, v11);

}

- (void)viewDidLoad
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
  UIView *v12;
  UIView *backgroundView;
  uint64_t v14;
  UIView *v15;
  UIView *contentContainerView;
  UIView *v17;
  __int128 v18;
  UIView *v19;
  UIView *homeGrabberContainerView;
  UIView *v21;
  __int128 v22;
  UIView *v23;
  UIView *contentView;
  SBHomeGrabberView *v25;
  SBHomeGrabberView *grabberView;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)SBTransientOverlayViewController;
  -[SBTransientOverlayViewController viewDidLoad](&v30, sel_viewDidLoad);
  -[SBTransientOverlayViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v4, v6, v8, v10);
  backgroundView = self->_backgroundView;
  self->_backgroundView = v12;

  objc_msgSend(v3, "addSubview:", self->_backgroundView);
  if (-[SBTransientOverlayViewController preventsClippingToBounds](self, "preventsClippingToBounds"))
    v14 = 0;
  else
    v14 = BSFloatGreaterThanFloat();
  v15 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v5, v7, v9, v11);
  contentContainerView = self->_contentContainerView;
  self->_contentContainerView = v15;

  -[UIView _setContinuousCornerRadius:](self->_contentContainerView, "_setContinuousCornerRadius:", self->_presentationContentCornerRadius);
  -[UIView setClipsToBounds:](self->_contentContainerView, "setClipsToBounds:", v14);
  v17 = self->_contentContainerView;
  v18 = *(_OWORD *)&self->_presentationContentTransform.c;
  v27 = *(_OWORD *)&self->_presentationContentTransform.a;
  v28 = v18;
  v29 = *(_OWORD *)&self->_presentationContentTransform.tx;
  -[UIView setTransform:](v17, "setTransform:", &v27);
  objc_msgSend(v3, "addSubview:", self->_contentContainerView);
  v19 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA9F28]), "initWithFrame:", v5, v7, v9, v11);
  homeGrabberContainerView = self->_homeGrabberContainerView;
  self->_homeGrabberContainerView = v19;

  -[UIView _setContinuousCornerRadius:](self->_homeGrabberContainerView, "_setContinuousCornerRadius:", self->_presentationContentCornerRadius);
  -[UIView setClipsToBounds:](self->_homeGrabberContainerView, "setClipsToBounds:", v14);
  v21 = self->_homeGrabberContainerView;
  v22 = *(_OWORD *)&self->_presentationHomeGrabberTransform.c;
  v27 = *(_OWORD *)&self->_presentationHomeGrabberTransform.a;
  v28 = v22;
  v29 = *(_OWORD *)&self->_presentationHomeGrabberTransform.tx;
  -[UIView setTransform:](v21, "setTransform:", &v27);
  objc_msgSend(v3, "addSubview:", self->_homeGrabberContainerView);
  v23 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v5, v7, v9, v11);
  contentView = self->_contentView;
  self->_contentView = v23;

  -[UIView addSubview:](self->_contentContainerView, "addSubview:", self->_contentView);
  if (self->_statusBar)
    -[UIView addSubview:](self->_contentContainerView, "addSubview:");
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v25 = -[SBTransientOverlayViewController _newHomeGrabberViewWithFrame:](self, "_newHomeGrabberViewWithFrame:", v5, v7, v9, v11);
    grabberView = self->_grabberView;
    self->_grabberView = v25;

    -[SBHomeGrabberView setDelegate:](self->_grabberView, "setDelegate:", self);
    -[SBHomeGrabberView setHidden:forReason:withAnimationSettings:](self->_grabberView, "setHidden:forReason:withAnimationSettings:", 1, CFSTR("_SBTransientOverlayViewControllerHomeGrabberHiddenReason"), 0);
    -[SBHomeGrabberView setAlpha:](self->_grabberView, "setAlpha:", self->_presentationHomeGrabberAlpha);
    -[UIView addSubview:](self->_homeGrabberContainerView, "addSubview:", self->_grabberView);
    -[SBTransientOverlayViewController _updateGrabberViewConfiguration](self, "_updateGrabberViewConfiguration");
  }

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  uint64_t v9;
  int v10;
  _QWORD v11[5];
  _QWORD v12[6];
  objc_super v13;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  SBFWindowForViewControllerTransition();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "_toWindowOrientation");
  v10 = objc_msgSend(v8, "isRotating");
  v13.receiver = self;
  v13.super_class = (Class)SBTransientOverlayViewController;
  -[SBTransientOverlayViewController viewWillTransitionToSize:withTransitionCoordinator:](&v13, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  if (v10)
  {
    v11[4] = self;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __87__SBTransientOverlayViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
    v12[3] = &unk_1E8EB6F60;
    v12[4] = self;
    v12[5] = v9;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __87__SBTransientOverlayViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
    v11[3] = &unk_1E8E9EA28;
    objc_msgSend(v7, "animateAlongsideTransition:completion:", v12, v11);
  }

}

void __87__SBTransientOverlayViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1208));
  objc_msgSend(WeakRetained, "transientOverlayViewControllerWillBeginRotation:toInterfaceOrientation:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __87__SBTransientOverlayViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1208));
  objc_msgSend(WeakRetained, "transientOverlayViewControllerDidEndRotation:", *(_QWORD *)(a1 + 32));

}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  _BOOL8 v4;
  UIWindow *v7;
  SBKeyboardHomeAffordanceAssertion *keyboardHomeAffordanceAssertion;
  SBKeyboardHomeAffordanceAssertion *v9;
  SBKeyboardHomeAffordanceAssertion *v10;
  SBKeyboardHomeAffordanceAssertion *v11;
  objc_super v12;

  v4 = a4;
  v7 = (UIWindow *)a3;
  v12.receiver = self;
  v12.super_class = (Class)SBTransientOverlayViewController;
  -[SBTransientOverlayViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v12, sel_viewDidMoveToWindow_shouldAppearOrDisappear_, v7, v4);
  keyboardHomeAffordanceAssertion = self->_keyboardHomeAffordanceAssertion;
  if (keyboardHomeAffordanceAssertion && self->_keyboardHomeAffordanceAssertionWindow != v7)
  {
    v9 = keyboardHomeAffordanceAssertion;
    +[SBKeyboardHomeAffordanceAssertion assertionForGestureWindow:](SBKeyboardHomeAffordanceAssertion, "assertionForGestureWindow:", v7);
    v10 = (SBKeyboardHomeAffordanceAssertion *)objc_claimAutoreleasedReturnValue();
    v11 = self->_keyboardHomeAffordanceAssertion;
    self->_keyboardHomeAffordanceAssertion = v10;

    objc_storeStrong((id *)&self->_keyboardHomeAffordanceAssertionWindow, a3);
    -[SBKeyboardHomeAffordanceAssertion invalidate](v9, "invalidate");

  }
}

- (UIEdgeInsets)_edgeInsetsForChildViewController:(id)a3 insetsAreAbsolute:(BOOL *)a4
{
  void *v6;
  _BOOL4 v7;
  double v8;
  void *v9;
  int64_t v10;
  void *v11;
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
  double v22;
  double v23;
  UIEdgeInsets result;

  objc_msgSend(MEMORY[0x1E0DC5B80], "sb_thisDeviceDisplayEdgeInfo", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SBTransientOverlayViewController hasVisibleStatusBar](self, "hasVisibleStatusBar");
  v8 = 0.0;
  if (v7)
    -[UIStatusBar currentHeight](self->_statusBar, "currentHeight", 0.0);
  objc_msgSend(v6, "sb_displayEdgeInfoWithSafeAreaInsetsForStatusBarHeight:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[SBTransientOverlayViewController containerOrientation](self, "containerOrientation");
  -[SBTransientOverlayViewController traitCollection](self, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sb_orientedEdgeInsetsForInterfaceOrientation:traitCollection:", v10, v11);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  if (a4)
    *a4 = 1;

  v20 = v13;
  v21 = v15;
  v22 = v17;
  v23 = v19;
  result.right = v23;
  result.bottom = v22;
  result.left = v21;
  result.top = v20;
  return result;
}

- (UIView)contentView
{
  -[SBTransientOverlayViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  return self->_contentView;
}

- (id)hostedSceneIdentityTokens
{
  return 0;
}

- (BOOL)hasVisibleStatusBar
{
  -[UIStatusBar alpha](self->_statusBar, "alpha");
  return BSFloatGreaterThanFloat();
}

- (BOOL)isIgnoringAppearanceUpdates
{
  return self->_appearanceUpdateIgnoreCount > 0;
}

- (BOOL)isIgnoringContentOverlayInsetUpdates
{
  return self->_contentOverlayInsetUpdateIgnoreCount > 0;
}

- (NSString)preferredDisplayLayoutElementIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (NSNumber)preferredSceneDeactivationReasonValue
{
  return (NSNumber *)&unk_1E91D22B8;
}

- (id)sceneDeactivationPredicate
{
  return 0;
}

- (void)setContainerOrientation:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_containerOrientation != a3)
  {
    self->_containerOrientation = a3;
    -[UIStatusBar setOrientation:](self->_statusBar, "setOrientation:");
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    -[SBTransientOverlayViewController childViewControllers](self, "childViewControllers", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "_updateContentOverlayInsetsFromParentIfNecessary");
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

  }
}

- (void)setPresentationContentCornerRadius:(double)a3
{
  uint64_t v5;

  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_presentationContentCornerRadius = a3;
    -[UIView _setContinuousCornerRadius:](self->_contentView, "_setContinuousCornerRadius:", a3);
    if (-[SBTransientOverlayViewController preventsClippingToBounds](self, "preventsClippingToBounds"))
      v5 = 0;
    else
      v5 = BSFloatGreaterThanFloat();
    -[UIView setClipsToBounds:](self->_contentView, "setClipsToBounds:", v5);
  }
}

- (void)setPresentationContentTransform:(CGAffineTransform *)a3
{
  CGAffineTransform *p_presentationContentTransform;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  UIView *contentContainerView;
  __int128 v11;
  CGAffineTransform v12;
  CGAffineTransform t1;

  p_presentationContentTransform = &self->_presentationContentTransform;
  v6 = *(_OWORD *)&self->_presentationContentTransform.c;
  *(_OWORD *)&t1.a = *(_OWORD *)&self->_presentationContentTransform.a;
  *(_OWORD *)&t1.c = v6;
  *(_OWORD *)&t1.tx = *(_OWORD *)&self->_presentationContentTransform.tx;
  v7 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v12.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v12.c = v7;
  *(_OWORD *)&v12.tx = *(_OWORD *)&a3->tx;
  if (!CGAffineTransformEqualToTransform(&t1, &v12))
  {
    v8 = *(_OWORD *)&a3->a;
    v9 = *(_OWORD *)&a3->tx;
    *(_OWORD *)&p_presentationContentTransform->c = *(_OWORD *)&a3->c;
    *(_OWORD *)&p_presentationContentTransform->tx = v9;
    *(_OWORD *)&p_presentationContentTransform->a = v8;
    contentContainerView = self->_contentContainerView;
    v11 = *(_OWORD *)&a3->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&a3->a;
    *(_OWORD *)&t1.c = v11;
    *(_OWORD *)&t1.tx = *(_OWORD *)&a3->tx;
    -[UIView setTransform:](contentContainerView, "setTransform:", &t1);
  }
}

- (void)setPresentationHomeGrabberTransform:(CGAffineTransform *)a3
{
  CGAffineTransform *p_presentationHomeGrabberTransform;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  UIView *homeGrabberContainerView;
  __int128 v11;
  CGAffineTransform v12;
  CGAffineTransform t1;

  p_presentationHomeGrabberTransform = &self->_presentationHomeGrabberTransform;
  v6 = *(_OWORD *)&self->_presentationHomeGrabberTransform.c;
  *(_OWORD *)&t1.a = *(_OWORD *)&self->_presentationHomeGrabberTransform.a;
  *(_OWORD *)&t1.c = v6;
  *(_OWORD *)&t1.tx = *(_OWORD *)&self->_presentationHomeGrabberTransform.tx;
  v7 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v12.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v12.c = v7;
  *(_OWORD *)&v12.tx = *(_OWORD *)&a3->tx;
  if (!CGAffineTransformEqualToTransform(&t1, &v12))
  {
    v8 = *(_OWORD *)&a3->a;
    v9 = *(_OWORD *)&a3->tx;
    *(_OWORD *)&p_presentationHomeGrabberTransform->c = *(_OWORD *)&a3->c;
    *(_OWORD *)&p_presentationHomeGrabberTransform->tx = v9;
    *(_OWORD *)&p_presentationHomeGrabberTransform->a = v8;
    homeGrabberContainerView = self->_homeGrabberContainerView;
    v11 = *(_OWORD *)&a3->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&a3->a;
    *(_OWORD *)&t1.c = v11;
    *(_OWORD *)&t1.tx = *(_OWORD *)&a3->tx;
    -[UIView setTransform:](homeGrabberContainerView, "setTransform:", &t1);
  }
}

- (void)setPresentationHomeGrabberAdditionalEdgeSpacing:(double)a3
{
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_presentationHomeGrabberAdditionalEdgeSpacing = a3;
    -[SBHomeGrabberView setNeedsLayout](self->_grabberView, "setNeedsLayout");
    -[SBHomeGrabberView layoutIfNeeded](self->_grabberView, "layoutIfNeeded");
  }
}

- (void)setPresentationDimmingViewHidden:(BOOL)a3
{
  UIView *dimmingView;
  UIView *v5;
  _QWORD v6[5];

  if (self->_presentationDimmingViewHidden != a3)
  {
    self->_presentationDimmingViewHidden = a3;
    dimmingView = self->_dimmingView;
    if (a3)
    {
      if (dimmingView)
      {
        -[SBTransientOverlayViewController removePresentationBackgroundView:](self, "removePresentationBackgroundView:", self->_dimmingView);
        v5 = self->_dimmingView;
        self->_dimmingView = 0;

      }
    }
    else if (!dimmingView)
    {
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __69__SBTransientOverlayViewController_setPresentationDimmingViewHidden___block_invoke;
      v6[3] = &unk_1E8E9DED8;
      v6[4] = self;
      objc_msgSend(MEMORY[0x1E0CEABB0], "_performWithoutRetargetingAnimations:", v6);
    }
  }
}

uint64_t __69__SBTransientOverlayViewController_setPresentationDimmingViewHidden___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  void *v9;

  v2 = objc_alloc(MEMORY[0x1E0DA9F28]);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v4 = objc_msgSend(v2, "initWithFrame:");
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 992);
  *(_QWORD *)(v5 + 992) = v4;

  v7 = *(_QWORD **)(a1 + 32);
  v8 = (void *)v7[124];
  objc_msgSend(v7, "presentationDimmingViewColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v9);

  objc_msgSend(*(id *)(a1 + 32), "setPresentationDimmingAlpha:", 0.0);
  return objc_msgSend(*(id *)(a1 + 32), "addPresentationBackgroundView:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 992));
}

- (void)setPresentationDimmingAlpha:(double)a3
{
  -[UIView setAlpha:](self->_dimmingView, "setAlpha:", a3);
}

- (double)presentationDimmingAlpha
{
  double result;

  -[UIView alpha](self->_dimmingView, "alpha");
  return result;
}

- (void)setPresentationHomeGrabberAlpha:(double)a3
{
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_presentationHomeGrabberAlpha = a3;
    -[SBHomeGrabberView setAlpha:](self->_grabberView, "setAlpha:", a3);
  }
}

- (int64_t)homeAffordanceSuppression
{
  return 0;
}

- (BOOL)preservesAppSwitcherDuringPresentationAndDismissal
{
  return 0;
}

- (UIColor)presentationDimmingViewColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.0, 0.5);
}

- (BOOL)preventsClippingToBounds
{
  return 0;
}

- (BOOL)isPresentedByProcess:(id)a3
{
  return 0;
}

- (BOOL)isPresentedByBundleIdentifier:(id)a3
{
  return 0;
}

- (void)beginIgnoringAppearanceUpdates
{
  ++self->_appearanceUpdateIgnoreCount;
}

- (void)endIgnoringAppearanceUpdates
{
  int64_t appearanceUpdateIgnoreCount;
  BOOL v3;
  BOOL v4;
  int64_t v5;

  appearanceUpdateIgnoreCount = self->_appearanceUpdateIgnoreCount;
  v3 = appearanceUpdateIgnoreCount == 1;
  v4 = appearanceUpdateIgnoreCount < 1;
  v5 = appearanceUpdateIgnoreCount - 1;
  if (!v4)
  {
    self->_appearanceUpdateIgnoreCount = v5;
    if (v3)
      -[SBTransientOverlayViewController setDisplayLayoutElementActive:](self, "setDisplayLayoutElementActive:", -[SBTransientOverlayViewController _appearState](self, "_appearState") == 2);
  }
}

- (void)beginIgnoringContentOverlayInsetUpdates
{
  ++self->_contentOverlayInsetUpdateIgnoreCount;
}

- (void)endIgnoringContentOverlayInsetUpdates
{
  int64_t contentOverlayInsetUpdateIgnoreCount;
  BOOL v3;
  int64_t v4;

  contentOverlayInsetUpdateIgnoreCount = self->_contentOverlayInsetUpdateIgnoreCount;
  v3 = contentOverlayInsetUpdateIgnoreCount < 1;
  v4 = contentOverlayInsetUpdateIgnoreCount - 1;
  if (!v3)
    self->_contentOverlayInsetUpdateIgnoreCount = v4;
}

- (BOOL)handleDoubleHeightStatusBarTap
{
  return 0;
}

- (id)newTransientOverlayDismissalTransitionCoordinator
{
  SBTransientOverlayBlockTransitionCoordinator *v2;

  v2 = objc_alloc_init(SBTransientOverlayBlockTransitionCoordinator);
  -[SBTransientOverlayBlockTransitionCoordinator setStartTransitionHandler:](v2, "setStartTransitionHandler:", &__block_literal_global_401);
  return v2;
}

void __85__SBTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "performAlongsideTransitions");
  objc_msgSend(v2, "completeTransition:", 1);

}

- (id)newTransientOverlayPresentationTransitionCoordinator
{
  SBTransientOverlayBlockTransitionCoordinator *v2;

  v2 = objc_alloc_init(SBTransientOverlayBlockTransitionCoordinator);
  -[SBTransientOverlayBlockTransitionCoordinator setStartTransitionHandler:](v2, "setStartTransitionHandler:", &__block_literal_global_40_0);
  return v2;
}

void __88__SBTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "performAlongsideTransitions");
  objc_msgSend(v2, "completeTransition:", 1);

}

- (void)preserveInputViewsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  if (!self->_hasPreservedInputViews)
  {
    v3 = a3;
    self->_hasPreservedInputViews = 1;
    objc_msgSend(MEMORY[0x1E0CEA828], "sharedInstance");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_preserveInputViewsWithId:animated:", v5, v3);

  }
}

- (void)restoreInputViewsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  if (self->_hasPreservedInputViews)
  {
    v3 = a3;
    self->_hasPreservedInputViews = 0;
    objc_msgSend(MEMORY[0x1E0CEA828], "sharedInstance");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_restoreInputViewsWithId:animated:", v5, v3);

  }
}

- (_UILegibilitySettings)preferredStatusBarLegibilitySettings
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = -[SBTransientOverlayViewController preferredStatusBarStyle](self, "preferredStatusBarStyle");
  if (v3 == -1)
  {
    v7 = 0;
  }
  else
  {
    if (!v3)
    {
      -[SBTransientOverlayViewController traitCollection](self, "traitCollection");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "userInterfaceStyle");

      if (v5 == 2)
        v3 = 1;
      else
        v3 = 3;
    }
    if (v3 == 3)
      v6 = 2;
    else
      v6 = 1;
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEADE8]), "initWithStyle:", v6);
  }
  return (_UILegibilitySettings *)v7;
}

- (void)setNeedsContentOpaqueUpdate
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_transientOverlayDelegate);
  objc_msgSend(WeakRetained, "transientOverlayViewControllerNeedsContentOpaqueUpdate:", self);

}

- (void)setNeedsFeaturePolicyUpdate
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_transientOverlayDelegate);
  objc_msgSend(WeakRetained, "transientOverlayViewControllerNeedsFeaturePolicyUpdate:", self);

}

- (void)setNeedsGestureDismissalStyleUpdate
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_transientOverlayDelegate);
  objc_msgSend(WeakRetained, "transientOverlayViewControllerNeedsGestureDismissalStyleUpdate:", self);

}

- (void)setNeedsIdleTimerReset
{
  id v2;

  +[SBIdleTimerGlobalCoordinator sharedInstance](SBIdleTimerGlobalCoordinator, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resetIdleTimerForReason:", CFSTR("TransientOverlay"));

}

- (void)setNeedsUpdateOfSupportedInterfaceOrientations
{
  id WeakRetained;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBTransientOverlayViewController;
  -[UIViewController setNeedsUpdateOfSupportedInterfaceOrientations](&v4, sel_setNeedsUpdateOfSupportedInterfaceOrientations);
  WeakRetained = objc_loadWeakRetained((id *)&self->_transientOverlayDelegate);
  objc_msgSend(WeakRetained, "transientOverlayDidUpdateSupportedInterfaceOrientations:", self);

}

- (void)setNeedsOrientationUpdatesDisabledUpdate
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_transientOverlayDelegate);
  objc_msgSend(WeakRetained, "transientOverlayViewControllerNeedsOrientationUpdatesDisabledUpdate:", self);

}

- (void)setNeedsProximityDetectionUpdate
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_transientOverlayDelegate);
  objc_msgSend(WeakRetained, "transientOverlayViewControllerNeedsProximityDetectionUpdate:", self);

}

- (void)setNeedsAudioCategoriesDisablingVolumeHUDUpdate
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_transientOverlayDelegate);
  objc_msgSend(WeakRetained, "transientOverlayViewController:requestZStackParticipantPreferencesUpdateWithReason:", self, CFSTR("AudioCategoriesDisablingVolumeHUD Updated"));

}

- (void)setNeedsSceneDeactivationUpdate
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_transientOverlayDelegate);
  objc_msgSend(WeakRetained, "transientOverlayViewControllerNeedsSceneDeactivationUpdate:", self);

}

- (void)setPresentationPrefersHomeGrabberHidden:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  int64_t presentationPrefersHomeGrabberHidden;

  v4 = a4;
  presentationPrefersHomeGrabberHidden = self->_presentationPrefersHomeGrabberHidden;
  if (presentationPrefersHomeGrabberHidden == 0x7FFFFFFFFFFFFFFFLL
    || presentationPrefersHomeGrabberHidden != BSSettingFlagForBool())
  {
    self->_presentationPrefersHomeGrabberHidden = BSSettingFlagForBool();
    -[SBTransientOverlayViewController _updateGrabberViewHiddenConfigurationAnimated:](self, "_updateGrabberViewHiddenConfigurationAnimated:", v4);
  }
}

- (void)setHomeGrabberPointerClickDelegate:(id)a3
{
  -[SBHomeGrabberView setPointerClickDelegate:](self->_grabberView, "setPointerClickDelegate:", a3);
}

- (void)setPresentationPrefersStatusBarHidden:(BOOL)a3 initialStatusBarSettings:(id)a4
{
  int v4;
  id v6;
  int presentationPrefersStatusBarHidden;
  void *v8;
  id WeakRetained;
  id v10;

  v4 = a3;
  v6 = a4;
  presentationPrefersStatusBarHidden = self->_presentationPrefersStatusBarHidden;
  v10 = v6;
  if (v6 || (v8 = 0, presentationPrefersStatusBarHidden != v4))
  {
    self->_presentationPrefersStatusBarHidden = v4;
    -[SBTransientOverlayViewController _applyStatusBarStyleRequestWithInitialStatusBarSettings:](self, "_applyStatusBarStyleRequestWithInitialStatusBarSettings:", v6);
    v8 = v10;
  }
  if (presentationPrefersStatusBarHidden != v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_transientOverlayDelegate);
    objc_msgSend(WeakRetained, "transientOverlayViewControllerDidUpdatePresentationPrefersStatusBarHidden:", self);

    v8 = v10;
  }

}

- (void)setPresentationPrefersStatusBarHidden:(BOOL)a3
{
  -[SBTransientOverlayViewController setPresentationPrefersStatusBarHidden:initialStatusBarSettings:](self, "setPresentationPrefersStatusBarHidden:initialStatusBarSettings:", a3, 0);
}

- (void)setNeedsWindowHitTestingUpdate
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_transientOverlayDelegate);
  objc_msgSend(WeakRetained, "transientOverlayViewControllerNeedsWindowHitTestingUpdate:", self);

}

- (BOOL)dismissesSiriForPresentation
{
  return 1;
}

- (void)didTransitionToAttachedToWindowedAccessory:(BOOL)a3 windowedAccessoryCutoutFrameInScreen:(CGRect)a4
{
  self->_attachedToWindowedAccessory = a3;
  self->_windowedAccessoryCutoutFrameInScreen = a4;
}

- (BOOL)isPresentedFromSceneWithIdentityTokenString:(id)a3
{
  return 0;
}

- (id)keyboardFocusTarget
{
  return 0;
}

- (void)setNeedsHIDEventDeferringDisabledUpdate
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_transientOverlayDelegate);
  objc_msgSend(WeakRetained, "transientOverlayViewControllerDidUpdateHIDEventDeferringDisabled:", self);

}

- (void)addPresentationBackgroundView:(id)a3
{
  id v4;
  UIView *presentationBackgroundView;
  void *v6;
  id v7;
  UIView *v8;
  UIView *v9;
  id v10;

  v4 = a3;
  presentationBackgroundView = self->_presentationBackgroundView;
  v10 = v4;
  if (!presentationBackgroundView)
  {
    -[SBTransientOverlayViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc(MEMORY[0x1E0CEABB0]);
    objc_msgSend(v6, "bounds");
    v8 = (UIView *)objc_msgSend(v7, "initWithFrame:");
    v9 = self->_presentationBackgroundView;
    self->_presentationBackgroundView = v8;

    objc_msgSend(v6, "insertSubview:belowSubview:", self->_presentationBackgroundView, self->_backgroundView);
    v4 = v10;
    presentationBackgroundView = self->_presentationBackgroundView;
  }
  -[UIView addSubview:](presentationBackgroundView, "addSubview:", v4);
  -[UIView bounds](self->_presentationBackgroundView, "bounds");
  objc_msgSend(v10, "setFrame:");

}

- (void)removePresentationBackgroundView:(id)a3
{
  UIView *v4;
  UIView *presentationBackgroundView;
  void *v6;
  uint64_t v7;
  UIView *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "superview");
  v4 = (UIView *)objc_claimAutoreleasedReturnValue();
  presentationBackgroundView = self->_presentationBackgroundView;

  if (v4 == presentationBackgroundView)
    objc_msgSend(v9, "removeFromSuperview");
  -[UIView subviews](self->_presentationBackgroundView, "subviews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (!v7)
  {
    -[UIView removeFromSuperview](self->_presentationBackgroundView, "removeFromSuperview");
    v8 = self->_presentationBackgroundView;
    self->_presentationBackgroundView = 0;

  }
}

- (void)_keyboardWillHideNotification:(id)a3
{
  if (self->_keyboardVisible)
  {
    self->_keyboardVisible = 0;
    -[SBTransientOverlayViewController _updateGrabberViewHiddenConfigurationAnimated:](self, "_updateGrabberViewHiddenConfigurationAnimated:", 1);
  }
  -[SBTransientOverlayViewController handleWillShowKeyboard:](self, "handleWillShowKeyboard:", 0);
}

- (void)_keyboardWillShowNotification:(id)a3
{
  if (-[SBTransientOverlayViewController _isKeyboardVisibleForSpringBoard](self, "_isKeyboardVisibleForSpringBoard", a3))
  {
    if (self->_keyboardVisible != 1)
    {
      self->_keyboardVisible = 1;
      -[SBTransientOverlayViewController _updateGrabberViewHiddenConfigurationAnimated:](self, "_updateGrabberViewHiddenConfigurationAnimated:", 1);
    }
  }
  else
  {
    self->_keyboardVisible = 0x7FFFFFFFFFFFFFFFLL;
  }
  -[SBTransientOverlayViewController handleWillShowKeyboard:](self, "handleWillShowKeyboard:", 1);
}

- (BOOL)_isKeyboardVisibleForSpringBoard
{
  SBTransientOverlayViewController *v2;
  id WeakRetained;

  v2 = self;
  WeakRetained = objc_loadWeakRetained((id *)&self->_transientOverlayDelegate);
  LOBYTE(v2) = objc_msgSend(WeakRetained, "isKeyboardVisibleForSpringBoardForTransientOverlayViewController:", v2);

  return (char)v2;
}

- (id)_newHomeGrabberViewWithFrame:(CGRect)a3
{
  return -[SBHomeGrabberView initWithFrame:]([SBHomeGrabberView alloc], "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)_applyStatusBarStyleRequestWithInitialStatusBarSettings:(id)a3
{
  id v4;
  int v5;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  UIStatusBar *v13;
  UIStatusBar *statusBar;
  void *v15;
  void *v16;
  id v17;
  SBMutableStatusBarSettings *v18;
  SBMutableStatusBarSettings *v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[5];
  id v34;
  id v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[SBTransientOverlayViewController _preferredStatusBarVisibility](self, "_preferredStatusBarVisibility");
  if (self->_presentationPrefersStatusBarHidden || v5 == 0)
  {
    -[UIStatusBar setAlpha:](self->_statusBar, "setAlpha:", 0.0);
  }
  else
  {
    v7 = v5;
    v8 = -[SBTransientOverlayViewController preferredStatusBarStyle](self, "preferredStatusBarStyle");
    -[UIViewController _sbWindowScene](self, "_sbWindowScene");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "statusBarManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "reusePool");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "assertionManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!self->_statusBar)
    {
      -[SBTransientOverlayViewController _currentStatusBarFrameForStyle:](self, "_currentStatusBarFrameForStyle:", v8);
      objc_msgSend(v11, "getReusableStatusBarWithReason:withFrame:", CFSTR("TransientOverlay"));
      v13 = (UIStatusBar *)objc_claimAutoreleasedReturnValue();
      statusBar = self->_statusBar;
      self->_statusBar = v13;

      -[UIView addSubview:](self->_contentContainerView, "addSubview:", self->_statusBar);
    }
    if (v4)
    {
      objc_msgSend(v12, "effectiveStatusBarStyleRequestWithSettings:", v4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)&self->_currentStatusBarStyleRequest, v15);
      v16 = (void *)MEMORY[0x1E0CEABB0];
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __92__SBTransientOverlayViewController__applyStatusBarStyleRequestWithInitialStatusBarSettings___block_invoke;
      v33[3] = &unk_1E8E9E270;
      v33[4] = self;
      v34 = v15;
      v35 = v4;
      v17 = v15;
      objc_msgSend(v16, "performWithoutAnimation:", v33);

    }
    v18 = objc_alloc_init(SBMutableStatusBarSettings);
    v19 = v18;
    if (v7 == 2)
      v20 = 1.0;
    else
      v20 = 0.0;
    -[SBMutableStatusBarSettings setStyle:](v18, "setStyle:", v8);
    -[SBTransientOverlayViewController preferredStatusBarLegibilitySettings](self, "preferredStatusBarLegibilitySettings");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBMutableStatusBarSettings setLegibilitySettings:](v19, "setLegibilitySettings:", v21);

    -[SBTransientOverlayViewController preferredBackgroundActivitiesToSuppress](self, "preferredBackgroundActivitiesToSuppress");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBMutableStatusBarSettings setBackgroundActivitiesToSuppress:](v19, "setBackgroundActivitiesToSuppress:", v22);

    objc_msgSend(v12, "effectiveStatusBarStyleRequestWithSettings:", v19);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&self->_currentStatusBarStyleRequest, v23);
    -[UIStatusBar setAlpha:](self->_statusBar, "setAlpha:", v20);
    if (BSFloatGreaterThanFloat())
      -[UIStatusBar setStyleRequest:](self->_statusBar, "setStyleRequest:", v23);

  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  -[SBTransientOverlayViewController childViewControllers](self, "childViewControllers", 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v29, v36, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v30 != v27)
          objc_enumerationMutation(v24);
        objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "_updateContentOverlayInsetsFromParentIfNecessary");
      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v29, v36, 16);
    }
    while (v26);
  }

}

void __92__SBTransientOverlayViewController__applyStatusBarStyleRequestWithInitialStatusBarSettings___block_invoke(uint64_t a1)
{
  void *v2;
  float v3;
  id v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1056), "setStyleRequest:", *(_QWORD *)(a1 + 40));
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 1056);
  objc_msgSend(*(id *)(a1 + 48), "alpha");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatValue");
  objc_msgSend(v2, "setAlpha:", v3);

}

- (CGRect)_currentStatusBarFrameForStyle:(int64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect v9;
  CGRect result;

  -[UIView bounds](self->_contentContainerView, "bounds");
  CGRectGetWidth(v9);
  objc_msgSend(MEMORY[0x1E0CEA9E8], "heightForStyle:orientation:", a3, -[SBTransientOverlayViewController containerOrientation](self, "containerOrientation"));
  BSRectWithSize();
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (void)_invalidateKeyboardHomeAffordanceAssertion
{
  SBKeyboardHomeAffordanceAssertion *keyboardHomeAffordanceAssertion;
  UIWindow *keyboardHomeAffordanceAssertionWindow;

  -[SBKeyboardHomeAffordanceAssertion invalidate](self->_keyboardHomeAffordanceAssertion, "invalidate");
  keyboardHomeAffordanceAssertion = self->_keyboardHomeAffordanceAssertion;
  self->_keyboardHomeAffordanceAssertion = 0;

  keyboardHomeAffordanceAssertionWindow = self->_keyboardHomeAffordanceAssertionWindow;
  self->_keyboardHomeAffordanceAssertionWindow = 0;

}

- (void)_updateGrabberViewConfiguration
{
  void *v3;
  void *v4;
  int v5;
  SBHomeGrabberView *grabberView;
  SBFHomeGrabberSettings *grabberSettings;
  void *v8;
  void *v9;
  unint64_t v10;
  id WeakRetained;
  uint64_t v12;

  -[SBTransientOverlayViewController childViewControllerForHomeIndicatorAutoHidden](self, "childViewControllerForHomeIndicatorAutoHidden");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = self;
  v5 = objc_msgSend(v3, "prefersHomeIndicatorAutoHidden");

  grabberView = self->_grabberView;
  grabberSettings = self->_grabberSettings;
  if (v5)
  {
    -[SBFHomeGrabberSettings autoHideTimeOnAppRequest](grabberSettings, "autoHideTimeOnAppRequest");
    -[SBHomeGrabberView turnOnAutoHideWithInitialDelay:](grabberView, "turnOnAutoHideWithInitialDelay:");
  }
  else
  {
    -[SBFHomeGrabberSettings delayForUnhideOnAppRequest](grabberSettings, "delayForUnhideOnAppRequest");
    -[SBHomeGrabberView turnOffAutoHideWithDelay:](grabberView, "turnOffAutoHideWithDelay:");
  }
  -[SBTransientOverlayViewController childViewControllerForScreenEdgesDeferringSystemGestures](self, "childViewControllerForScreenEdgesDeferringSystemGestures");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
    v8 = self;
  v10 = objc_msgSend(v8, "preferredScreenEdgesDeferringSystemGestures");

  -[SBHomeGrabberView setEdgeProtectEnabled:](self->_grabberView, "setEdgeProtectEnabled:", (v10 >> 2) & 1);
  WeakRetained = objc_loadWeakRetained((id *)&self->_transientOverlayDelegate);
  v12 = objc_msgSend(WeakRetained, "transientOverlayViewControllerIsForegroundActive:", self);

  -[SBHomeGrabberView setHomeAffordanceInteractionEnabled:](self->_grabberView, "setHomeAffordanceInteractionEnabled:", v12);
}

- (void)_updateGrabberViewHiddenConfigurationAnimated:(BOOL)a3
{
  SBHomeGrabberView *grabberView;
  void *v6;
  SBHomeGrabberView *v7;
  uint64_t v8;
  void *v9;
  SBKeyboardHomeAffordanceAssertion *v10;
  SBKeyboardHomeAffordanceAssertion *keyboardHomeAffordanceAssertion;
  SBHomeGrabberView *v12;
  void *v13;
  SBHomeGrabberView *v14;
  uint64_t v15;
  SBHomeGrabberView *v16;
  id obj;

  if (self->_presentationPrefersHomeGrabberHidden != 0x7FFFFFFFFFFFFFFFLL && SBFEffectiveHomeButtonType() == 2)
  {
    if (self->_keyboardVisible == 0x7FFFFFFFFFFFFFFFLL)
    {
      -[SBTransientOverlayViewController _isKeyboardVisibleForSpringBoard](self, "_isKeyboardVisibleForSpringBoard");
      self->_keyboardVisible = BSSettingFlagForBool();
    }
    -[SBTransientOverlayViewController loadViewIfNeeded](self, "loadViewIfNeeded");
    if (self->_presentationPrefersHomeGrabberHidden)
    {
      -[SBTransientOverlayViewController _invalidateKeyboardHomeAffordanceAssertion](self, "_invalidateKeyboardHomeAffordanceAssertion");
      grabberView = self->_grabberView;
      if (a3)
      {
        -[SBFHomeGrabberSettings hideAnimationSettings](self->_grabberSettings, "hideAnimationSettings");
        obj = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(obj, "BSAnimationSettings");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = grabberView;
        v8 = 1;
LABEL_18:
        -[SBHomeGrabberView setHidden:forReason:withAnimationSettings:](v7, "setHidden:forReason:withAnimationSettings:", v8, CFSTR("_SBTransientOverlayViewControllerHomeGrabberHiddenReason"), v6);
        goto LABEL_19;
      }
      v14 = self->_grabberView;
      v15 = 1;
    }
    else
    {
      if (self->_keyboardVisible == 1)
      {
        -[SBTransientOverlayViewController view](self, "view");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "window");
        obj = (id)objc_claimAutoreleasedReturnValue();

        if (obj)
        {
          if (!self->_keyboardHomeAffordanceAssertion)
          {
            +[SBKeyboardHomeAffordanceAssertion assertionForGestureWindow:](SBKeyboardHomeAffordanceAssertion, "assertionForGestureWindow:", obj);
            v10 = (SBKeyboardHomeAffordanceAssertion *)objc_claimAutoreleasedReturnValue();
            keyboardHomeAffordanceAssertion = self->_keyboardHomeAffordanceAssertion;
            self->_keyboardHomeAffordanceAssertion = v10;

            objc_storeStrong((id *)&self->_keyboardHomeAffordanceAssertionWindow, obj);
          }
        }
        v12 = self->_grabberView;
        if (!a3)
        {
          -[SBHomeGrabberView setHidden:forReason:withAnimationSettings:](self->_grabberView, "setHidden:forReason:withAnimationSettings:", 1, CFSTR("_SBTransientOverlayViewControllerHomeGrabberHiddenReason"), 0);
          goto LABEL_20;
        }
        -[SBFHomeGrabberSettings hideAnimationSettings](self->_grabberSettings, "hideAnimationSettings");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "BSAnimationSettings");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBHomeGrabberView setHidden:forReason:withAnimationSettings:](v12, "setHidden:forReason:withAnimationSettings:", 1, CFSTR("_SBTransientOverlayViewControllerHomeGrabberHiddenReason"), v13);

LABEL_19:
LABEL_20:

        return;
      }
      -[SBTransientOverlayViewController _invalidateKeyboardHomeAffordanceAssertion](self, "_invalidateKeyboardHomeAffordanceAssertion");
      v16 = self->_grabberView;
      if (a3)
      {
        -[SBFHomeGrabberSettings unhideAnimationSettings](self->_grabberSettings, "unhideAnimationSettings");
        obj = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(obj, "BSAnimationSettings");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v16;
        v8 = 0;
        goto LABEL_18;
      }
      v14 = self->_grabberView;
      v15 = 0;
    }
    -[SBHomeGrabberView setHidden:forReason:withAnimationSettings:](v14, "setHidden:forReason:withAnimationSettings:", v15, CFSTR("_SBTransientOverlayViewControllerHomeGrabberHiddenReason"), 0);
  }
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (BOOL)prefersEmbeddedDisplayPresentation
{
  return self->_prefersEmbeddedDisplayPresentation;
}

- (BOOL)prefersContinuityDisplayPresentation
{
  return self->_prefersContinuityDisplayPresentation;
}

- (BOOL)allowsStackingOverlayContentAbove
{
  return self->_allowsStackingOverlayContentAbove;
}

- (BOOL)isContentOpaque
{
  return self->_contentOpaque;
}

- (BOOL)prefersProximityDetectionEnabled
{
  return self->_prefersProximityDetectionEnabled;
}

- (NSSet)audioCategoriesDisablingVolumeHUD
{
  return self->_audioCategoriesDisablingVolumeHUD;
}

- (NSSet)preferredBackgroundActivitiesToSuppress
{
  return self->_preferredBackgroundActivitiesToSuppress;
}

- (BOOL)prefersStatusBarActivityItemVisible
{
  return self->_prefersStatusBarActivityItemVisible;
}

- (BOOL)shouldDisableBanners
{
  return self->_shouldDisableBanners;
}

- (BOOL)shouldDisableControlCenter
{
  return self->_shouldDisableControlCenter;
}

- (BOOL)shouldDisableReachability
{
  return self->_shouldDisableReachability;
}

- (BOOL)shouldDisableInteractiveScreenshotGesture
{
  return self->_shouldDisableInteractiveScreenshotGesture;
}

- (BOOL)shouldDisableSiri
{
  return self->_shouldDisableSiri;
}

- (BOOL)shouldPendAlertItems
{
  return self->_shouldPendAlertItems;
}

- (BOOL)shouldUseSceneBasedKeyboardFocus
{
  return self->_shouldUseSceneBasedKeyboardFocus;
}

- (BOOL)shouldPreventDragAndDrop
{
  return self->_shouldPreventDragAndDrop;
}

- (BOOL)supportsAlwaysOnDisplay
{
  return self->_supportsAlwaysOnDisplay;
}

- (SBIdleTimerCoordinating)idleTimerCoordinator
{
  return (SBIdleTimerCoordinating *)objc_loadWeakRetained((id *)&self->_idleTimerCoordinator);
}

- (void)setIdleTimerCoordinator:(id)a3
{
  objc_storeWeak((id *)&self->_idleTimerCoordinator, a3);
}

- (int64_t)containerOrientation
{
  return self->_containerOrientation;
}

- (BOOL)shouldDisableOrientationUpdates
{
  return self->_shouldDisableOrientationUpdates;
}

- (int64_t)preferredLockedGestureDismissalStyle
{
  return self->_preferredLockedGestureDismissalStyle;
}

- (int64_t)preferredUnlockedGestureDismissalStyle
{
  return self->_preferredUnlockedGestureDismissalStyle;
}

- (SBDisplayItem)representedDisplayItem
{
  return self->_representedDisplayItem;
}

- (int)pictureInPictureProcessIdentifier
{
  return self->_pictureInPictureProcessIdentifier;
}

- (BOOL)prefersWindowHitTestingDisabled
{
  return self->_prefersWindowHitTestingDisabled;
}

- (BOOL)isAttachedToWindowedAccessory
{
  return self->_attachedToWindowedAccessory;
}

- (CGRect)windowedAccessoryCutoutFrameInScreen
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_windowedAccessoryCutoutFrameInScreen.origin.x;
  y = self->_windowedAccessoryCutoutFrameInScreen.origin.y;
  width = self->_windowedAccessoryCutoutFrameInScreen.size.width;
  height = self->_windowedAccessoryCutoutFrameInScreen.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)canBecomeLocalFirstResponder
{
  return self->_canBecomeLocalFirstResponder;
}

- (BOOL)hidEventDeferringDisabled
{
  return self->_hidEventDeferringDisabled;
}

- (BOOL)preventsSystemApertureSuppressionFromBelow
{
  return self->_preventsSystemApertureSuppressionFromBelow;
}

- (NSSet)associatedBundleIdentifiersToSuppressInSystemAperture
{
  return self->_associatedBundleIdentifiersToSuppressInSystemAperture;
}

- (NSSet)associatedSceneIdentifiersToSuppressInSystemAperture
{
  return self->_associatedSceneIdentifiersToSuppressInSystemAperture;
}

- (SBTransientOverlayViewControllerDelegate)transientOverlayDelegate
{
  return (SBTransientOverlayViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_transientOverlayDelegate);
}

- (void)setTransientOverlayDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_transientOverlayDelegate, a3);
}

- (UIStatusBarStyleRequest)currentStatusBarStyleRequest
{
  return self->_currentStatusBarStyleRequest;
}

- (SBHomeGrabberView)grabberView
{
  return self->_grabberView;
}

- (void)setGrabberView:(id)a3
{
  objc_storeStrong((id *)&self->_grabberView, a3);
}

- (BOOL)presentationAllowsHomeGrabberAutoHide
{
  return self->_presentationAllowsHomeGrabberAutoHide;
}

- (void)setPresentationAllowsHomeGrabberAutoHide:(BOOL)a3
{
  self->_presentationAllowsHomeGrabberAutoHide = a3;
}

- (double)presentationContentCornerRadius
{
  return self->_presentationContentCornerRadius;
}

- (CGAffineTransform)presentationContentTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[27].b;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[26].ty;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[27].d;
  return self;
}

- (CGAffineTransform)presentationHomeGrabberTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[28].b;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[27].ty;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[28].d;
  return self;
}

- (double)presentationHomeGrabberAlpha
{
  return self->_presentationHomeGrabberAlpha;
}

- (double)presentationHomeGrabberAdditionalEdgeSpacing
{
  return self->_presentationHomeGrabberAdditionalEdgeSpacing;
}

- (BOOL)presentationDimmingViewHidden
{
  return self->_presentationDimmingViewHidden;
}

- (BOOL)presentationPrefersStatusBarHidden
{
  return self->_presentationPrefersStatusBarHidden;
}

- (BOOL)dismissesForCoverSheetPresentation
{
  return self->_dismissesForCoverSheetPresentation;
}

- (BOOL)preventsDismissalOnLockForInactiveScreen
{
  return self->_preventsDismissalOnLockForInactiveScreen;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_grabberView, 0);
  objc_storeStrong((id *)&self->_currentStatusBarStyleRequest, 0);
  objc_destroyWeak((id *)&self->_transientOverlayDelegate);
  objc_storeStrong((id *)&self->_associatedSceneIdentifiersToSuppressInSystemAperture, 0);
  objc_storeStrong((id *)&self->_associatedBundleIdentifiersToSuppressInSystemAperture, 0);
  objc_storeStrong((id *)&self->_representedDisplayItem, 0);
  objc_destroyWeak((id *)&self->_idleTimerCoordinator);
  objc_storeStrong((id *)&self->_preferredBackgroundActivitiesToSuppress, 0);
  objc_storeStrong((id *)&self->_audioCategoriesDisablingVolumeHUD, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_displayLayoutElementAssertion, 0);
  objc_storeStrong((id *)&self->_displayLayoutElement, 0);
  objc_storeStrong((id *)&self->_statusBar, 0);
  objc_storeStrong((id *)&self->_presentationBackgroundView, 0);
  objc_storeStrong((id *)&self->_keyboardHomeAffordanceAssertionWindow, 0);
  objc_storeStrong((id *)&self->_keyboardHomeAffordanceAssertion, 0);
  objc_storeStrong((id *)&self->_grabberSettings, 0);
  objc_storeStrong((id *)&self->_dimmingView, 0);
  objc_storeStrong((id *)&self->_homeGrabberContainerView, 0);
  objc_storeStrong((id *)&self->_contentContainerView, 0);
}

@end
