@implementation SBVoiceControlTransientOverlayViewController

- (SBVoiceControlTransientOverlayViewController)initWithSource:(id)a3
{
  id v4;
  SBVoiceControlTransientOverlayViewController *v5;
  SBVoiceControlViewController *v6;
  SBVoiceControlViewController *contentViewController;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBVoiceControlTransientOverlayViewController;
  v5 = -[SBTransientOverlayViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0);
  if (v5)
  {
    v6 = -[SBVoiceControlViewController initWithSource:]([SBVoiceControlViewController alloc], "initWithSource:", v4);
    contentViewController = v5->_contentViewController;
    v5->_contentViewController = v6;

    -[SBVoiceControlViewController setVoiceControlDelegate:](v5->_contentViewController, "setVoiceControlDelegate:", v5);
    -[SBVoiceControlViewController setInterfaceOrientation:](v5->_contentViewController, "setInterfaceOrientation:", -[SBTransientOverlayViewController containerOrientation](v5, "containerOrientation"));
  }

  return v5;
}

- (void)dealloc
{
  SBVoiceControlTransientOverlayViewController *v3;
  void *v4;
  objc_super v5;

  -[SBVoiceControlViewController parentViewController](self->_contentViewController, "parentViewController");
  v3 = (SBVoiceControlTransientOverlayViewController *)objc_claimAutoreleasedReturnValue();

  if (v3 == self)
  {
    -[SBVoiceControlViewController willMoveToParentViewController:](self->_contentViewController, "willMoveToParentViewController:", 0);
    if (-[SBVoiceControlViewController isViewLoaded](self->_contentViewController, "isViewLoaded"))
    {
      -[SBVoiceControlViewController view](self->_contentViewController, "view");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "removeFromSuperview");

    }
    -[SBVoiceControlViewController removeFromParentViewController](self->_contentViewController, "removeFromParentViewController");
  }
  v5.receiver = self;
  v5.super_class = (Class)SBVoiceControlTransientOverlayViewController;
  -[SBTransientOverlayViewController dealloc](&v5, sel_dealloc);
}

- (BOOL)becomeFirstResponder
{
  return -[SBVoiceControlViewController becomeFirstResponder](self->_contentViewController, "becomeFirstResponder");
}

- (BOOL)canBecomeFirstResponder
{
  return -[SBVoiceControlViewController canBecomeFirstResponder](self->_contentViewController, "canBecomeFirstResponder");
}

- (BOOL)canResignFirstResponder
{
  return -[SBVoiceControlViewController canResignFirstResponder](self->_contentViewController, "canResignFirstResponder");
}

- (int64_t)preferredInterfaceOrientationForPresentation
{
  return -[SBVoiceControlViewController preferredInterfaceOrientationForPresentation](self->_contentViewController, "preferredInterfaceOrientationForPresentation");
}

- (int64_t)preferredStatusBarStyle
{
  return -[SBVoiceControlViewController preferredStatusBarStyle](self->_contentViewController, "preferredStatusBarStyle");
}

- (int64_t)preferredWhitePointAdaptivityStyle
{
  return -[SBVoiceControlViewController preferredWhitePointAdaptivityStyle](self->_contentViewController, "preferredWhitePointAdaptivityStyle");
}

- (BOOL)resignFirstResponder
{
  return -[SBVoiceControlViewController resignFirstResponder](self->_contentViewController, "resignFirstResponder");
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (BOOL)shouldAutorotate
{
  if ((SBTraitsArbiterOrientationActuationEnabledForRole(CFSTR("SBTraitsParticipantRoleTransientOverlay")) & 1) != 0)
    return 1;
  else
    return -[SBVoiceControlViewController shouldAutorotate](self->_contentViewController, "shouldAutorotate");
}

- (unint64_t)supportedInterfaceOrientations
{
  return -[SBVoiceControlViewController supportedInterfaceOrientations](self->_contentViewController, "supportedInterfaceOrientations");
}

- (id)childViewControllerForHomeIndicatorAutoHidden
{
  return self->_contentViewController;
}

- (id)childViewControllerForScreenEdgesDeferringSystemGestures
{
  return self->_contentViewController;
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  objc_super v11;
  uint8_t buf[4];
  SBVoiceControlTransientOverlayViewController *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)SBVoiceControlTransientOverlayViewController;
  -[SBTransientOverlayViewController viewDidAppear:](&v11, sel_viewDidAppear_);
  v6 = -[SBTransientOverlayViewController isIgnoringAppearanceUpdates](self, "isIgnoringAppearanceUpdates");
  SBLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v13 = self;
      v14 = 2114;
      v15 = v9;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Ignoring %{public}@", buf, 0x16u);

    }
  }
  else
  {
    if (v8)
    {
      NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v13 = self;
      v14 = 2114;
      v15 = v10;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Reacting to %{public}@", buf, 0x16u);

    }
    -[SBVoiceControlViewController viewDidAppear:](self->_contentViewController, "viewDidAppear:", v3);
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v6;
  NSObject *WeakRetained;
  _BOOL4 v8;
  void *v9;
  void *v10;
  objc_super v11;
  uint8_t buf[4];
  SBVoiceControlTransientOverlayViewController *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)SBVoiceControlTransientOverlayViewController;
  -[SBTransientOverlayViewController viewDidDisappear:](&v11, sel_viewDidDisappear_);
  v6 = -[SBTransientOverlayViewController isIgnoringAppearanceUpdates](self, "isIgnoringAppearanceUpdates");
  SBLogCommon();
  WeakRetained = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v13 = self;
      v14 = 2114;
      v15 = v9;
      _os_log_impl(&dword_1D0540000, WeakRetained, OS_LOG_TYPE_DEFAULT, "%{public}@: Ignoring %{public}@", buf, 0x16u);

    }
  }
  else
  {
    if (v8)
    {
      NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v13 = self;
      v14 = 2114;
      v15 = v10;
      _os_log_impl(&dword_1D0540000, WeakRetained, OS_LOG_TYPE_DEFAULT, "%{public}@: Reacting to %{public}@", buf, 0x16u);

    }
    -[SBVoiceControlViewController viewDidDisappear:](self->_contentViewController, "viewDidDisappear:", v3);
    WeakRetained = objc_loadWeakRetained((id *)&self->_voiceControlDelegate);
    -[NSObject voiceControlTransientOverlayViewControllerDidDisappear:](WeakRetained, "voiceControlTransientOverlayViewControllerDidDisappear:", self);
  }

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
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)SBVoiceControlTransientOverlayViewController;
  -[SBTransientOverlayViewController viewDidLayoutSubviews](&v22, sel_viewDidLayoutSubviews);
  -[SBTransientOverlayViewController contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[SBVoiceControlViewController view](self->_contentViewController, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  -[SBTransientOverlayViewController backgroundView](self, "backgroundView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bounds");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  -[_UIBackdropView setFrame:](self->_backdropView, "setFrame:", v15, v17, v19, v21);
}

- (void)viewDidLoad
{
  _UIBackdropView *v3;
  _UIBackdropView *backdropView;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBVoiceControlTransientOverlayViewController;
  -[SBTransientOverlayViewController viewDidLoad](&v8, sel_viewDidLoad);
  v3 = (_UIBackdropView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAC68]), "initWithPrivateStyle:", -2);
  backdropView = self->_backdropView;
  self->_backdropView = v3;

  -[SBTransientOverlayViewController backgroundView](self, "backgroundView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", self->_backdropView);

  -[SBTransientOverlayViewController contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBVoiceControlTransientOverlayViewController addChildViewController:](self, "addChildViewController:", self->_contentViewController);
  -[SBVoiceControlViewController view](self->_contentViewController, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v7);

  -[SBVoiceControlViewController didMoveToParentViewController:](self->_contentViewController, "didMoveToParentViewController:", self);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  objc_super v11;
  uint8_t buf[4];
  SBVoiceControlTransientOverlayViewController *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)SBVoiceControlTransientOverlayViewController;
  -[SBVoiceControlTransientOverlayViewController viewWillAppear:](&v11, sel_viewWillAppear_);
  v6 = -[SBTransientOverlayViewController isIgnoringAppearanceUpdates](self, "isIgnoringAppearanceUpdates");
  SBLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v13 = self;
      v14 = 2114;
      v15 = v9;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Ignoring %{public}@", buf, 0x16u);

    }
  }
  else
  {
    if (v8)
    {
      NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v13 = self;
      v14 = 2114;
      v15 = v10;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Reacting to %{public}@", buf, 0x16u);

    }
    -[SBVoiceControlViewController viewWillAppear:](self->_contentViewController, "viewWillAppear:", v3);
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  objc_super v11;
  uint8_t buf[4];
  SBVoiceControlTransientOverlayViewController *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)SBVoiceControlTransientOverlayViewController;
  -[SBVoiceControlTransientOverlayViewController viewWillDisappear:](&v11, sel_viewWillDisappear_);
  v6 = -[SBTransientOverlayViewController isIgnoringAppearanceUpdates](self, "isIgnoringAppearanceUpdates");
  SBLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v13 = self;
      v14 = 2114;
      v15 = v9;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Ignoring %{public}@", buf, 0x16u);

    }
  }
  else
  {
    if (v8)
    {
      NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v13 = self;
      v14 = 2114;
      v15 = v10;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Reacting to %{public}@", buf, 0x16u);

    }
    -[SBVoiceControlViewController viewWillDisappear:](self->_contentViewController, "viewWillDisappear:", v3);
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (int)_preferredStatusBarVisibility
{
  return -[SBVoiceControlViewController _preferredStatusBarVisibility](self->_contentViewController, "_preferredStatusBarVisibility");
}

- (void)beginIgnoringAppearanceUpdates
{
  BOOL v3;
  _BOOL4 v4;
  NSObject *v5;
  objc_super v6;
  uint8_t buf[4];
  SBVoiceControlTransientOverlayViewController *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = -[SBTransientOverlayViewController isIgnoringAppearanceUpdates](self, "isIgnoringAppearanceUpdates");
  v6.receiver = self;
  v6.super_class = (Class)SBVoiceControlTransientOverlayViewController;
  -[SBTransientOverlayViewController beginIgnoringAppearanceUpdates](&v6, sel_beginIgnoringAppearanceUpdates);
  v4 = -[SBTransientOverlayViewController isIgnoringAppearanceUpdates](self, "isIgnoringAppearanceUpdates");
  if (!v3 && v4)
  {
    SBLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v8 = self;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Begin ignoring appearance changes...", buf, 0xCu);
    }

  }
}

- (void)endIgnoringAppearanceUpdates
{
  _BOOL4 v3;
  BOOL v4;
  unsigned int v5;
  unsigned int v6;
  NSObject *v7;
  id WeakRetained;
  objc_super v9;
  uint8_t buf[4];
  SBVoiceControlTransientOverlayViewController *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = -[SBTransientOverlayViewController isIgnoringAppearanceUpdates](self, "isIgnoringAppearanceUpdates");
  v9.receiver = self;
  v9.super_class = (Class)SBVoiceControlTransientOverlayViewController;
  -[SBTransientOverlayViewController endIgnoringAppearanceUpdates](&v9, sel_endIgnoringAppearanceUpdates);
  v4 = -[SBTransientOverlayViewController isIgnoringAppearanceUpdates](self, "isIgnoringAppearanceUpdates");
  if (v3 && !v4)
  {
    v5 = -[SBVoiceControlViewController _appearState](self->_contentViewController, "_appearState");
    v6 = -[SBVoiceControlTransientOverlayViewController _appearState](self, "_appearState");
    SBLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v11 = self;
      v12 = 2048;
      v13 = v5;
      v14 = 2048;
      v15 = v6;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Ended ignoring appearance changes. Content appear state: %td, container appear state: %td", buf, 0x20u);
    }

    if (v6 != v5)
    {
      if (v6 - 1 < 2)
      {
        if (v5 - 3 <= 0xFFFFFFFD)
          -[SBVoiceControlViewController viewWillAppear:](self->_contentViewController, "viewWillAppear:", 0);
        if (v6 == 2)
          -[SBVoiceControlViewController viewDidAppear:](self->_contentViewController, "viewDidAppear:", 0);
      }
      else if (v6 == 3 || !v6)
      {
        if (v5 && v5 != 3)
          -[SBVoiceControlViewController viewWillDisappear:](self->_contentViewController, "viewWillDisappear:", 0);
        if (!v6)
        {
          -[SBVoiceControlViewController viewDidDisappear:](self->_contentViewController, "viewDidDisappear:", 0);
          WeakRetained = objc_loadWeakRetained((id *)&self->_voiceControlDelegate);
          objc_msgSend(WeakRetained, "voiceControlTransientOverlayViewControllerDidDisappear:", self);

        }
      }
    }
  }
}

- (BOOL)handleHomeButtonPress
{
  return -[SBVoiceControlViewController handleHomeButtonPress](self->_contentViewController, "handleHomeButtonPress");
}

- (id)newTransientOverlayDismissalTransitionCoordinator
{
  SBTransientOverlayBlockTransitionCoordinator *v3;
  _QWORD v5[5];

  v3 = objc_alloc_init(SBTransientOverlayBlockTransitionCoordinator);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __97__SBVoiceControlTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke;
  v5[3] = &unk_1E8E9E9A8;
  v5[4] = self;
  -[SBTransientOverlayBlockTransitionCoordinator setStartTransitionHandler:](v3, "setStartTransitionHandler:", v5);
  return v3;
}

void __97__SBVoiceControlTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  NSObject *v16;
  _QWORD v17[5];
  NSObject *v18;
  _QWORD v19[4];
  id v20;
  uint64_t v21;

  v3 = a2;
  v4 = dispatch_group_create();
  v5 = objc_msgSend(v3, "isAnimated");
  v6 = MEMORY[0x1E0C809B0];
  if ((_DWORD)v5)
  {
    dispatch_group_enter(v4);
    v7 = (void *)MEMORY[0x1E0CEABB0];
    v19[0] = v6;
    v19[1] = 3221225472;
    v19[2] = __97__SBVoiceControlTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_2;
    v19[3] = &unk_1E8E9E820;
    v8 = v3;
    v9 = *(_QWORD *)(a1 + 32);
    v20 = v8;
    v21 = v9;
    v17[0] = v6;
    v17[1] = 3221225472;
    v17[2] = __97__SBVoiceControlTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_3;
    v17[3] = &unk_1E8E9DEB0;
    v17[4] = v9;
    v18 = v4;
    objc_msgSend(v7, "animateWithDuration:animations:completion:", v19, v17, 0.3);

  }
  else
  {
    objc_msgSend(v3, "performAlongsideTransitions");
  }
  dispatch_group_enter(v4);
  v10 = *(void **)(*(_QWORD *)(a1 + 32) + 1392);
  v15[0] = v6;
  v15[1] = 3221225472;
  v15[2] = __97__SBVoiceControlTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_4;
  v15[3] = &unk_1E8E9E980;
  v16 = v4;
  v11 = v4;
  objc_msgSend(v10, "performDismissalTransitionAnimated:completionHandler:", v5, v15);
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = __97__SBVoiceControlTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_5;
  v13[3] = &unk_1E8E9DED8;
  v14 = v3;
  v12 = v3;
  dispatch_group_notify(v11, MEMORY[0x1E0C80D38], v13);

}

uint64_t __97__SBVoiceControlTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "performAlongsideTransitions");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1384), "transitionToPrivateStyle:", -2);
}

void __97__SBVoiceControlTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1384), "transitionComplete");
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __97__SBVoiceControlTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_4(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __97__SBVoiceControlTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_5(uint64_t a1)
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
  v5[2] = __100__SBVoiceControlTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke;
  v5[3] = &unk_1E8E9E9A8;
  v5[4] = self;
  -[SBTransientOverlayBlockTransitionCoordinator setStartTransitionHandler:](v3, "setStartTransitionHandler:", v5);
  return v3;
}

void __100__SBVoiceControlTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;
  void *v17;
  NSObject *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  NSObject *v23;
  _QWORD v24[5];
  NSObject *v25;
  _QWORD v26[4];
  id v27;
  uint64_t v28;
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;

  v3 = a2;
  v4 = dispatch_group_create();
  objc_msgSend(MEMORY[0x1E0CEAC70], "settingsForPrivateStyle:", 2040);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.031372549, 0.262745098, 0.560784314, 1.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setColorTint:", v6);

  v7 = objc_msgSend(v3, "isAnimated");
  v8 = *(id **)(a1 + 32);
  v9 = MEMORY[0x1E0C809B0];
  if ((_DWORD)v7)
  {
    objc_msgSend(v8, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1E0CEABB0];
    v31[0] = v9;
    v31[1] = 3221225472;
    v31[2] = __100__SBVoiceControlTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_2;
    v31[3] = &unk_1E8E9DED8;
    v12 = v10;
    v32 = v12;
    objc_msgSend(v11, "performWithoutAnimation:", v31);
    dispatch_group_enter(v4);
    v13 = (void *)MEMORY[0x1E0CEABB0];
    v26[0] = v9;
    v26[1] = 3221225472;
    v26[2] = __100__SBVoiceControlTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_3;
    v26[3] = &unk_1E8E9F108;
    v14 = v3;
    v15 = *(_QWORD *)(a1 + 32);
    v27 = v14;
    v28 = v15;
    v29 = v5;
    v30 = v12;
    v24[0] = v9;
    v24[1] = 3221225472;
    v24[2] = __100__SBVoiceControlTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_4;
    v24[3] = &unk_1E8E9DEB0;
    v24[4] = *(_QWORD *)(a1 + 32);
    v25 = v4;
    v16 = v12;
    objc_msgSend(v13, "animateWithDuration:animations:completion:", v26, v24, 0.3);

  }
  else
  {
    objc_msgSend(v8[173], "transitionToSettings:", v5);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1384), "transitionComplete");
    objc_msgSend(v3, "performAlongsideTransitions");
  }
  dispatch_group_enter(v4);
  v17 = *(void **)(*(_QWORD *)(a1 + 32) + 1392);
  v22[0] = v9;
  v22[1] = 3221225472;
  v22[2] = __100__SBVoiceControlTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_5;
  v22[3] = &unk_1E8E9E980;
  v23 = v4;
  v18 = v4;
  objc_msgSend(v17, "performPresentationTransitionAnimated:completionHandler:", v7, v22);
  v20[0] = v9;
  v20[1] = 3221225472;
  v20[2] = __100__SBVoiceControlTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_6;
  v20[3] = &unk_1E8E9DED8;
  v21 = v3;
  v19 = v3;
  dispatch_group_notify(v18, MEMORY[0x1E0C80D38], v20);

}

uint64_t __100__SBVoiceControlTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __100__SBVoiceControlTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "performAlongsideTransitions");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1384), "transitionToSettings:", *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 56), "setAlpha:", 1.0);
}

void __100__SBVoiceControlTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1384), "transitionComplete");
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __100__SBVoiceControlTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_5(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __100__SBVoiceControlTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeTransition:", 1);
}

- (int64_t)preferredLockedGestureDismissalStyle
{
  return 1;
}

- (int64_t)preferredUnlockedGestureDismissalStyle
{
  return 1;
}

- (BOOL)prefersProximityDetectionEnabled
{
  return -[SBVoiceControlViewController prefersProximityDetectionEnabled](self->_contentViewController, "prefersProximityDetectionEnabled");
}

- (void)setContainerOrientation:(int64_t)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBVoiceControlTransientOverlayViewController;
  -[SBTransientOverlayViewController setContainerOrientation:](&v3, sel_setContainerOrientation_, a3);
}

- (BOOL)shouldDisableOrientationUpdates
{
  return 1;
}

- (BOOL)prefersEmbeddedDisplayPresentation
{
  return 1;
}

- (NSString)coverSheetIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (int64_t)participantState
{
  return 2;
}

- (int64_t)scrollingStrategy
{
  return 0;
}

- (int64_t)notificationBehavior
{
  return 0;
}

- (unint64_t)restrictedCapabilities
{
  return 0;
}

- (int64_t)proximityDetectionMode
{
  return 0;
}

- (int64_t)idleTimerDuration
{
  return 10;
}

- (int64_t)idleTimerMode
{
  return 0;
}

- (int64_t)idleWarnMode
{
  return 1;
}

- (void)voiceControlViewControllerRequestsDismissal:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_voiceControlDelegate);
  objc_msgSend(WeakRetained, "voiceControlTransientOverlayViewControllerRequestsDismissal:", self);

}

- (BOOL)isVoiceControlLoggingEnabled
{
  return -[SBVoiceControlViewController isVoiceControlLoggingEnabled](self->_contentViewController, "isVoiceControlLoggingEnabled");
}

- (NSArray)nextRecognitionAudioInputPaths
{
  return -[SBVoiceControlViewController nextRecognitionAudioInputPaths](self->_contentViewController, "nextRecognitionAudioInputPaths");
}

- (void)setNextRecognitionAudioInputPaths:(id)a3
{
  -[SBVoiceControlViewController setNextRecognitionAudioInputPaths:](self->_contentViewController, "setNextRecognitionAudioInputPaths:", a3);
}

- (void)setShouldAllowSensitiveActions:(BOOL)a3
{
  -[SBVoiceControlViewController setShouldAllowSensitiveActions:](self->_contentViewController, "setShouldAllowSensitiveActions:", a3);
}

- (void)setShouldDisableHandlerActions:(BOOL)a3
{
  -[SBVoiceControlViewController setShouldDisableHandlerActions:](self->_contentViewController, "setShouldDisableHandlerActions:", a3);
}

- (void)setShouldDisableVoiceControlForBluetoothRequests:(BOOL)a3
{
  -[SBVoiceControlViewController setShouldDisableVoiceControlForBluetoothRequests:](self->_contentViewController, "setShouldDisableVoiceControlForBluetoothRequests:", a3);
}

- (void)setVoiceControlLoggingEnabled:(BOOL)a3
{
  -[SBVoiceControlViewController setVoiceControlLoggingEnabled:](self->_contentViewController, "setVoiceControlLoggingEnabled:", a3);
}

- (BOOL)shouldAllowSensitiveActions
{
  return -[SBVoiceControlViewController shouldAllowSensitiveActions](self->_contentViewController, "shouldAllowSensitiveActions");
}

- (BOOL)shouldDisableHandlerActions
{
  return -[SBVoiceControlViewController shouldDisableHandlerActions](self->_contentViewController, "shouldDisableHandlerActions");
}

- (BOOL)shouldDisableVoiceControlForBluetoothRequests
{
  return -[SBVoiceControlViewController shouldDisableVoiceControlForBluetoothRequests](self->_contentViewController, "shouldDisableVoiceControlForBluetoothRequests");
}

- (void)handleHeadsetButtonUpFromButtonDownSource:(BOOL)a3
{
  -[SBVoiceControlViewController handleHeadsetButtonUpFromButtonDownSource:](self->_contentViewController, "handleHeadsetButtonUpFromButtonDownSource:", a3);
}

- (void)resetSessionWithSource:(id)a3
{
  -[SBVoiceControlViewController resetSessionWithSource:](self->_contentViewController, "resetSessionWithSource:", a3);
}

- (SBVoiceControlTransientOverlayViewControllerDelegate)voiceControlDelegate
{
  return (SBVoiceControlTransientOverlayViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_voiceControlDelegate);
}

- (void)setVoiceControlDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_voiceControlDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_voiceControlDelegate);
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
}

@end
