@implementation SBRemoteTransientOverlayViewController

- (id)_initWithHostContentAdapter:(id)a3
{
  id v5;
  SBRemoteTransientOverlayViewController *v6;
  SBRemoteTransientOverlayViewController *v7;
  id *p_hostContentAdapter;
  SBIdleTimerCoordinatorHelper *v9;
  SBIdleTimerCoordinatorHelper *idleTimerCoordinatorHelper;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBRemoteTransientOverlayViewController;
  v6 = -[SBRemoteTransientOverlayViewController init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    p_hostContentAdapter = (id *)&v6->_hostContentAdapter;
    objc_storeStrong((id *)&v6->_hostContentAdapter, a3);
    objc_msgSend(*p_hostContentAdapter, "setDelegate:", v7);
    v7->_lastWallpaperStyle = 0;
    v9 = -[SBIdleTimerCoordinatorHelper initWithSourceProvider:]([SBIdleTimerCoordinatorHelper alloc], "initWithSourceProvider:", v7);
    idleTimerCoordinatorHelper = v7->_idleTimerCoordinatorHelper;
    v7->_idleTimerCoordinatorHelper = v9;

    objc_msgSend(*p_hostContentAdapter, "setIdleTimerCoordinator:", v7);
  }

  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[SBRemoteTransientOverlayHostContentAdapter setDelegate:](self->_hostContentAdapter, "setDelegate:", 0);
  -[SBRemoteTransientOverlayHostContentAdapter setIdleTimerCoordinator:](self->_hostContentAdapter, "setIdleTimerCoordinator:", 0);
  if (-[SBRemoteTransientOverlayViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[SBRemoteTransientOverlayViewController _hostContentViewController](self, "_hostContentViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBRemoteTransientOverlayViewController bs_removeChildViewController:](self, "bs_removeChildViewController:", v3);

  }
  v4.receiver = self;
  v4.super_class = (Class)SBRemoteTransientOverlayViewController;
  -[SBTransientOverlayViewController dealloc](&v4, sel_dealloc);
}

+ (void)requestViewControllersForAlertDefinition:(id)a3 sceneWorkspaceController:(id)a4 connectionHandler:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v8 = a5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __126__SBRemoteTransientOverlayViewController_requestViewControllersForAlertDefinition_sceneWorkspaceController_connectionHandler___block_invoke;
  v10[3] = &unk_1E8EA86C0;
  v11 = v8;
  v12 = a1;
  v9 = v8;
  +[SBRemoteTransientOverlayHostContentAdapter requestContentAdaptersForAlertDefinition:sceneWorkspaceController:connectionHandler:](SBRemoteTransientOverlayHostContentAdapter, "requestContentAdaptersForAlertDefinition:sceneWorkspaceController:connectionHandler:", a3, a4, v10);

}

void __126__SBRemoteTransientOverlayViewController_requestViewControllersForAlertDefinition_sceneWorkspaceController_connectionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v7 = a3;
  v8 = a4;
  if (!v11)
  {
    v9 = 0;
    if (v7)
      goto LABEL_3;
LABEL_5:
    v10 = 0;
    goto LABEL_6;
  }
  v9 = (void *)objc_msgSend(objc_alloc(*(Class *)(a1 + 40)), "_initWithHostContentAdapter:", v11);
  if (!v7)
    goto LABEL_5;
LABEL_3:
  v10 = (void *)objc_msgSend(objc_alloc(*(Class *)(a1 + 40)), "_initWithHostContentAdapter:", v7);
LABEL_6:
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (BOOL)becomeFirstResponder
{
  void *v2;
  char v3;

  -[SBRemoteTransientOverlayViewController _hostContentViewController](self, "_hostContentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "becomeFirstResponder");

  return v3;
}

- (BOOL)canBecomeFirstResponder
{
  void *v2;
  char v3;

  -[SBRemoteTransientOverlayViewController _hostContentViewController](self, "_hostContentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canBecomeFirstResponder");

  return v3;
}

- (BOOL)canResignFirstResponder
{
  void *v2;
  char v3;

  -[SBRemoteTransientOverlayViewController _hostContentViewController](self, "_hostContentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canResignFirstResponder");

  return v3;
}

- (int64_t)preferredInterfaceOrientationForPresentation
{
  return -[SBRemoteTransientOverlayHostContentAdapter preferredInterfaceOrientationForPresentation](self->_hostContentAdapter, "preferredInterfaceOrientationForPresentation");
}

- (int64_t)preferredStatusBarStyle
{
  return -[SBRemoteTransientOverlayHostContentAdapter preferredStatusBarStyle](self->_hostContentAdapter, "preferredStatusBarStyle");
}

- (int64_t)preferredWhitePointAdaptivityStyle
{
  return -[SBRemoteTransientOverlayHostContentAdapter preferredWhitePointAdaptivityStyle](self->_hostContentAdapter, "preferredWhitePointAdaptivityStyle");
}

- (BOOL)resignFirstResponder
{
  void *v2;
  char v3;

  -[SBRemoteTransientOverlayViewController _hostContentViewController](self, "_hostContentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "resignFirstResponder");

  return v3;
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (BOOL)shouldAutorotate
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  return -[SBRemoteTransientOverlayHostContentAdapter supportedInterfaceOrientations](self->_hostContentAdapter, "supportedInterfaceOrientations");
}

- (id)serviceBundleIdentifier
{
  return -[SBRemoteTransientOverlayHostContentAdapter serviceBundleIdentifier](self->_hostContentAdapter, "serviceBundleIdentifier");
}

- (int)serviceProcessIdentifier
{
  return -[SBRemoteTransientOverlayHostContentAdapter serviceProcessIdentifier](self->_hostContentAdapter, "serviceProcessIdentifier");
}

- (id)clientSceneIdentityToken
{
  return -[SBRemoteTransientOverlayHostContentAdapter clientSceneIdentityToken](self->_hostContentAdapter, "clientSceneIdentityToken");
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;
  uint8_t buf[4];
  SBRemoteTransientOverlayViewController *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)SBRemoteTransientOverlayViewController;
  -[SBTransientOverlayViewController viewDidAppear:](&v12, sel_viewDidAppear_);
  v6 = -[SBTransientOverlayViewController isIgnoringAppearanceUpdates](self, "isIgnoringAppearanceUpdates");
  SBLogTransientOverlay();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v14 = self;
      v15 = 2114;
      v16 = v9;
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
      v14 = self;
      v15 = 2114;
      v16 = v10;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Reacting to %{public}@", buf, 0x16u);

    }
    if (v3)
      v3 = -[SBRemoteTransientOverlayHostContentAdapter shouldEnableFadeInAnimation](self->_hostContentAdapter, "shouldEnableFadeInAnimation");
    -[SBRemoteTransientOverlayViewController _hostContentViewController](self, "_hostContentViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "endAppearanceTransition");

    -[SBRemoteTransientOverlayViewController delegate](self, "delegate");
    v7 = objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[NSObject remoteTransientOverlayViewController:didAppearAnimated:](v7, "remoteTransientOverlayViewController:didAppearAnimated:", self, v3);
  }

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;
  uint8_t buf[4];
  SBRemoteTransientOverlayViewController *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)SBRemoteTransientOverlayViewController;
  -[SBTransientOverlayViewController viewDidDisappear:](&v12, sel_viewDidDisappear_);
  v6 = -[SBTransientOverlayViewController isIgnoringAppearanceUpdates](self, "isIgnoringAppearanceUpdates");
  SBLogTransientOverlay();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v14 = self;
      v15 = 2114;
      v16 = v9;
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
      v14 = self;
      v15 = 2114;
      v16 = v10;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Reacting to %{public}@", buf, 0x16u);

    }
    if (v3)
      v3 = -[SBRemoteTransientOverlayHostContentAdapter shouldEnableFadeOutAnimation](self->_hostContentAdapter, "shouldEnableFadeOutAnimation");
    -[SBRemoteTransientOverlayViewController _hostContentViewController](self, "_hostContentViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "endAppearanceTransition");

    -[SBRemoteTransientOverlayViewController delegate](self, "delegate");
    v7 = objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[NSObject remoteTransientOverlayViewController:didDisappearAnimated:](v7, "remoteTransientOverlayViewController:didDisappearAnimated:", self, v3);
  }

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBRemoteTransientOverlayViewController;
  -[SBTransientOverlayViewController viewDidLayoutSubviews](&v7, sel_viewDidLayoutSubviews);
  -[SBTransientOverlayViewController contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  -[UIView setFrame:](self->_contentViewWrapperView, "setFrame:");
  -[SBRemoteTransientOverlayViewController _hostContentViewController](self, "_hostContentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bounds](self->_contentViewWrapperView, "bounds");
  objc_msgSend(v5, "setFrame:");

  -[SBTransientOverlayViewController backgroundView](self, "backgroundView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  -[SBTransientOverlayWallpaperEffectView setFrame:](self->_wallpaperEffectView, "setFrame:");

}

- (void)viewDidLoad
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  UIView *v8;
  UIView *contentViewWrapperView;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SBRemoteTransientOverlayViewController;
  -[SBTransientOverlayViewController viewDidLoad](&v12, sel_viewDidLoad);
  -[SBTransientOverlayViewController contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v8 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v4, v5, v6, v7);
  contentViewWrapperView = self->_contentViewWrapperView;
  self->_contentViewWrapperView = v8;

  objc_msgSend(v3, "addSubview:", self->_contentViewWrapperView);
  -[SBRemoteTransientOverlayViewController _hostContentViewController](self, "_hostContentViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBRemoteTransientOverlayViewController addChildViewController:](self, "addChildViewController:", v10);
  objc_msgSend(v10, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView addSubview:](self->_contentViewWrapperView, "addSubview:", v11);
  objc_msgSend(v10, "didMoveToParentViewController:", self);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;
  uint8_t buf[4];
  SBRemoteTransientOverlayViewController *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)SBRemoteTransientOverlayViewController;
  -[SBRemoteTransientOverlayViewController viewWillAppear:](&v12, sel_viewWillAppear_);
  v6 = -[SBTransientOverlayViewController isIgnoringAppearanceUpdates](self, "isIgnoringAppearanceUpdates");
  SBLogTransientOverlay();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v14 = self;
      v15 = 2114;
      v16 = v9;
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
      v14 = self;
      v15 = 2114;
      v16 = v10;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Reacting to %{public}@", buf, 0x16u);

    }
    if (v3)
      v3 = -[SBRemoteTransientOverlayHostContentAdapter shouldEnableFadeInAnimation](self->_hostContentAdapter, "shouldEnableFadeInAnimation");
    -[SBRemoteTransientOverlayViewController _hostContentViewController](self, "_hostContentViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "beginAppearanceTransition:animated:", 1, v3);

    -[SBRemoteTransientOverlayViewController delegate](self, "delegate");
    v7 = objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[NSObject remoteTransientOverlayViewController:willAppearAnimated:](v7, "remoteTransientOverlayViewController:willAppearAnimated:", self, v3);
  }

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  objc_super v11;
  uint8_t buf[4];
  SBRemoteTransientOverlayViewController *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)SBRemoteTransientOverlayViewController;
  -[SBRemoteTransientOverlayViewController viewWillDisappear:](&v11, sel_viewWillDisappear_);
  if (-[SBTransientOverlayViewController isIgnoringAppearanceUpdates](self, "isIgnoringAppearanceUpdates"))
  {
    SBLogTransientOverlay();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v13 = self;
      v14 = 2114;
      v15 = v7;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Ignoring %{public}@", buf, 0x16u);

    }
  }
  else
  {
    if (v3)
      v3 = -[SBRemoteTransientOverlayHostContentAdapter shouldEnableFadeOutAnimation](self->_hostContentAdapter, "shouldEnableFadeOutAnimation");
    -[SBRemoteTransientOverlayViewController _hostContentViewController](self, "_hostContentViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "beginAppearanceTransition:animated:", 0, v3);

    SBLogTransientOverlay();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v13 = self;
      v14 = 2114;
      v15 = v10;
      _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Reacting to %{public}@", buf, 0x16u);

    }
    -[SBRemoteTransientOverlayViewController delegate](self, "delegate");
    v6 = objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[NSObject remoteTransientOverlayViewController:willDisappearAnimated:](v6, "remoteTransientOverlayViewController:willDisappearAnimated:", self, v3);
  }

}

- (int)_preferredStatusBarVisibility
{
  return -[SBRemoteTransientOverlayHostContentAdapter preferredStatusBarVisibility](self->_hostContentAdapter, "preferredStatusBarVisibility");
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBRemoteTransientOverlayViewController;
  -[SBTransientOverlayViewController succinctDescriptionBuilder](&v6, sel_succinctDescriptionBuilder);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_hostContentAdapter, CFSTR("hostContentAdapter"), 1);
  return v3;
}

- (id)idleTimerProvider:(id)a3 didProposeBehavior:(id)a4 forReason:(id)a5
{
  return -[SBIdleTimerCoordinatorHelper proposeIdleTimerBehavior:fromProvider:reason:](self->_idleTimerCoordinatorHelper, "proposeIdleTimerBehavior:fromProvider:reason:", a4, a3, a5);
}

- (id)coordinatorRequestedIdleTimerBehavior:(id)a3
{
  return -[SBRemoteTransientOverlayHostContentAdapter coordinatorRequestedIdleTimerBehavior:](self->_hostContentAdapter, "coordinatorRequestedIdleTimerBehavior:", self);
}

- (void)remoteTransientOverlayHostContentAdapterDidChangeSupportedInterfaceOrientations:(id)a3
{
  if (-[SBRemoteTransientOverlayViewController isViewLoaded](self, "isViewLoaded", a3))
    -[SBTransientOverlayViewController setNeedsUpdateOfSupportedInterfaceOrientations](self, "setNeedsUpdateOfSupportedInterfaceOrientations");
}

- (void)remoteTransientOverlayHostContentAdapterRequestsDeactivation:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "remoteTransientOverlayViewControllerRequestsDeactivation:", self);

}

- (void)remoteTransientOverlayHostContentAdapterRequestsInvalidation:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "remoteTransientOverlayViewControllerRequestsInvalidation:", self);

}

- (void)remoteTransientOverlayHostContentAdapter:(id)a3 didTerminateWithError:(id)a4
{
  SBRemoteTransientOverlayViewControllerDelegate **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "remoteTransientOverlayViewController:didTerminateWithError:", self, v6);

}

- (void)remoteTransientOverlayHostContentAdapter:(id)a3 requestsWallpaperEffectUpdateWithAnimationSettings:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = v6;
  if (self->_isPresented)
    -[SBRemoteTransientOverlayViewController _configureWallpaperEffectViewWithAnimationSettings:](self, "_configureWallpaperEffectViewWithAnimationSettings:", v6);
  else
    objc_storeStrong((id *)&self->_pendingAnimationSettings, a4);

}

- (void)remoteTransientOverlayHostContentAdapter:(id)a3 needsStatusBarAppearanceUpdateWithAnimationSettings:(id)a4
{
  id v5;
  void *v6;
  _QWORD v7[5];

  v5 = a4;
  if (-[SBRemoteTransientOverlayViewController isViewLoaded](self, "isViewLoaded"))
  {
    v6 = (void *)MEMORY[0x1E0CEABB0];
    objc_msgSend(v5, "duration");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __135__SBRemoteTransientOverlayViewController_remoteTransientOverlayHostContentAdapter_needsStatusBarAppearanceUpdateWithAnimationSettings___block_invoke;
    v7[3] = &unk_1E8E9DED8;
    v7[4] = self;
    objc_msgSend(v6, "animateWithDuration:animations:", v7);
  }

}

uint64_t __135__SBRemoteTransientOverlayViewController_remoteTransientOverlayHostContentAdapter_needsStatusBarAppearanceUpdateWithAnimationSettings___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setNeedsStatusBarAppearanceUpdate");
}

- (int64_t)defaultPreferredInterfaceOrientationForPresentationForRemoteTransientOverlayHostContentAdapter:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBRemoteTransientOverlayViewController;
  return -[SBTransientOverlayViewController preferredInterfaceOrientationForPresentation](&v4, sel_preferredInterfaceOrientationForPresentation, a3);
}

- (id)remoteTransientOverlayHostContentAdapter:(id)a3 requestsActionForHandlingButtonEvents:(unint64_t)a4
{
  id WeakRetained;
  void *v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "remoteTransientOverlayViewController:requestsActionForHandlingButtonEvents:", self, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (CGRect)adjustedBoundsForContentBounds:(CGRect)a3 inRemoteTransientOverlayHostContentAdapter:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v9;
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
  double v20;
  double v21;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SBTransientOverlayViewController transientOverlayDelegate](self, "transientOverlayDelegate", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "adjustedBoundsForContentBounds:inTransientOverlayViewController:", self, x, y, width, height);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  v18 = v11;
  v19 = v13;
  v20 = v15;
  v21 = v17;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (id)hostedSceneIdentityTokens
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  -[SBRemoteTransientOverlayHostContentAdapter clientSceneIdentityToken](self->_hostContentAdapter, "clientSceneIdentityToken");
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

- (BOOL)allowsStackingOverlayContentAbove
{
  return -[SBRemoteTransientOverlayHostContentAdapter allowsStackingOverlayContentAbove](self->_hostContentAdapter, "allowsStackingOverlayContentAbove");
}

- (void)beginIgnoringAppearanceUpdates
{
  BOOL v3;
  _BOOL4 v4;
  NSObject *v5;
  objc_super v6;
  uint8_t buf[4];
  SBRemoteTransientOverlayViewController *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = -[SBTransientOverlayViewController isIgnoringAppearanceUpdates](self, "isIgnoringAppearanceUpdates");
  v6.receiver = self;
  v6.super_class = (Class)SBRemoteTransientOverlayViewController;
  -[SBTransientOverlayViewController beginIgnoringAppearanceUpdates](&v6, sel_beginIgnoringAppearanceUpdates);
  v4 = -[SBTransientOverlayViewController isIgnoringAppearanceUpdates](self, "isIgnoringAppearanceUpdates");
  if (!v3 && v4)
  {
    SBLogTransientOverlay();
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
  void *v5;
  unsigned int v6;
  unsigned int v7;
  NSObject *v8;
  void *v9;
  objc_super v10;
  uint8_t buf[4];
  SBRemoteTransientOverlayViewController *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = -[SBTransientOverlayViewController isIgnoringAppearanceUpdates](self, "isIgnoringAppearanceUpdates");
  v10.receiver = self;
  v10.super_class = (Class)SBRemoteTransientOverlayViewController;
  -[SBTransientOverlayViewController endIgnoringAppearanceUpdates](&v10, sel_endIgnoringAppearanceUpdates);
  v4 = -[SBTransientOverlayViewController isIgnoringAppearanceUpdates](self, "isIgnoringAppearanceUpdates");
  if (v3 && !v4)
  {
    -[SBRemoteTransientOverlayViewController _hostContentViewController](self, "_hostContentViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "_appearState");
    v7 = -[SBRemoteTransientOverlayViewController _appearState](self, "_appearState");
    SBLogTransientOverlay();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v12 = self;
      v13 = 2048;
      v14 = v6;
      v15 = 2048;
      v16 = v7;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Ended ignoring appearance changes. Content appear state: %td, container appear state: %td", buf, 0x20u);
    }

    if (v7 == v6)
      goto LABEL_23;
    if (v7 - 1 < 2)
    {
      -[SBRemoteTransientOverlayViewController delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 - 3 <= 0xFFFFFFFD)
      {
        objc_msgSend(v5, "beginAppearanceTransition:animated:", 1, 0);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "remoteTransientOverlayViewController:willAppearAnimated:", self, 0);
      }
      if (v7 == 2)
      {
        objc_msgSend(v5, "endAppearanceTransition");
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "remoteTransientOverlayViewController:didAppearAnimated:", self, 0);
      }
    }
    else
    {
      if (v7 != 3 && v7)
        goto LABEL_23;
      -[SBRemoteTransientOverlayViewController delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        if (v6 != 3)
        {
          objc_msgSend(v5, "beginAppearanceTransition:animated:", 0, 0);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v9, "remoteTransientOverlayViewController:willDisappearAnimated:", self, 0);
        }
      }
      if (!v7)
      {
        objc_msgSend(v5, "endAppearanceTransition");
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "remoteTransientOverlayViewController:didDisappearAnimated:", self, 0);
      }
    }

LABEL_23:
  }
}

- (void)beginIgnoringContentOverlayInsetUpdates
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBRemoteTransientOverlayViewController;
  -[SBTransientOverlayViewController beginIgnoringContentOverlayInsetUpdates](&v3, sel_beginIgnoringContentOverlayInsetUpdates);
  -[SBRemoteTransientOverlayHostContentAdapter setShouldIgnoreContentOverlayInsetUpdates:](self->_hostContentAdapter, "setShouldIgnoreContentOverlayInsetUpdates:", -[SBTransientOverlayViewController isIgnoringContentOverlayInsetUpdates](self, "isIgnoringContentOverlayInsetUpdates"));
}

- (void)endIgnoringContentOverlayInsetUpdates
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBRemoteTransientOverlayViewController;
  -[SBTransientOverlayViewController endIgnoringContentOverlayInsetUpdates](&v3, sel_endIgnoringContentOverlayInsetUpdates);
  -[SBRemoteTransientOverlayHostContentAdapter setShouldIgnoreContentOverlayInsetUpdates:](self->_hostContentAdapter, "setShouldIgnoreContentOverlayInsetUpdates:", -[SBTransientOverlayViewController isIgnoringContentOverlayInsetUpdates](self, "isIgnoringContentOverlayInsetUpdates"));
}

- (BOOL)handleDoubleHeightStatusBarTap
{
  objc_super v4;

  if (-[SBRemoteTransientOverlayHostContentAdapter handleDoubleHeightStatusBarTap](self->_hostContentAdapter, "handleDoubleHeightStatusBarTap"))
  {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SBRemoteTransientOverlayViewController;
  return -[SBTransientOverlayViewController handleDoubleHeightStatusBarTap](&v4, sel_handleDoubleHeightStatusBarTap);
}

- (BOOL)handleHeadsetButtonPress:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v6;

  v3 = a3;
  if (-[SBRemoteTransientOverlayHostContentAdapter handleHeadsetButtonPress:](self->_hostContentAdapter, "handleHeadsetButtonPress:"))
  {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)SBRemoteTransientOverlayViewController;
  return -[SBTransientOverlayViewController handleHeadsetButtonPress:](&v6, sel_handleHeadsetButtonPress_, v3);
}

- (BOOL)handleHomeButtonPress
{
  objc_super v4;

  if (-[SBRemoteTransientOverlayHostContentAdapter handleHomeButtonPress](self->_hostContentAdapter, "handleHomeButtonPress"))
  {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)SBRemoteTransientOverlayViewController;
  return -[SBTransientOverlayViewController handleHomeButtonPress](&v4, sel_handleHomeButtonPress);
}

- (BOOL)handleHomeButtonDoublePress
{
  objc_super v4;

  if (-[SBRemoteTransientOverlayHostContentAdapter handleHomeButtonDoublePress](self->_hostContentAdapter, "handleHomeButtonDoublePress"))
  {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)SBRemoteTransientOverlayViewController;
  return -[SBTransientOverlayViewController handleHomeButtonDoublePress](&v4, sel_handleHomeButtonDoublePress);
}

- (BOOL)handleHomeButtonLongPress
{
  objc_super v4;

  if (-[SBRemoteTransientOverlayHostContentAdapter handleHomeButtonLongPress](self->_hostContentAdapter, "handleHomeButtonLongPress"))
  {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)SBRemoteTransientOverlayViewController;
  return -[SBTransientOverlayViewController handleHomeButtonLongPress](&v4, sel_handleHomeButtonLongPress);
}

- (BOOL)handleLockButtonPress
{
  objc_super v4;

  if (-[SBRemoteTransientOverlayHostContentAdapter handleLockButtonPress](self->_hostContentAdapter, "handleLockButtonPress"))
  {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)SBRemoteTransientOverlayViewController;
  return -[SBTransientOverlayViewController handleLockButtonPress](&v4, sel_handleLockButtonPress);
}

- (void)handlePictureInPictureDidBegin
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBRemoteTransientOverlayViewController;
  -[SBTransientOverlayViewController handlePictureInPictureDidBegin](&v3, sel_handlePictureInPictureDidBegin);
  -[SBRemoteTransientOverlayHostContentAdapter handlePictureInPictureDidBegin](self->_hostContentAdapter, "handlePictureInPictureDidBegin");
}

- (BOOL)handleVolumeUpButtonPress
{
  objc_super v4;

  if (-[SBRemoteTransientOverlayHostContentAdapter handleVolumeUpButtonPress](self->_hostContentAdapter, "handleVolumeUpButtonPress"))
  {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)SBRemoteTransientOverlayViewController;
  return -[SBTransientOverlayViewController handleVolumeUpButtonPress](&v4, sel_handleVolumeUpButtonPress);
}

- (BOOL)handleVolumeDownButtonPress
{
  objc_super v4;

  if (-[SBRemoteTransientOverlayHostContentAdapter handleVolumeDownButtonPress](self->_hostContentAdapter, "handleVolumeDownButtonPress"))
  {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)SBRemoteTransientOverlayViewController;
  return -[SBTransientOverlayViewController handleVolumeDownButtonPress](&v4, sel_handleVolumeDownButtonPress);
}

- (void)handleGestureDismissal
{
  -[SBRemoteTransientOverlayHostContentAdapter handleHomeButtonPress](self->_hostContentAdapter, "handleHomeButtonPress");
}

- (BOOL)hasServiceProcessIdentifier:(int)a3
{
  return -[SBRemoteTransientOverlayHostContentAdapter serviceProcessIdentifier](self->_hostContentAdapter, "serviceProcessIdentifier") == a3;
}

- (BOOL)isContentOpaque
{
  return -[SBRemoteTransientOverlayHostContentAdapter isContentOpaque](self->_hostContentAdapter, "isContentOpaque");
}

- (BOOL)isPresentedByProcess:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  v5 = -[SBRemoteTransientOverlayHostContentAdapter serviceProcessIdentifier](self->_hostContentAdapter, "serviceProcessIdentifier");
  if (v5 == objc_msgSend(v4, "pid"))
  {
    -[SBRemoteTransientOverlayHostContentAdapter serviceBundleIdentifier](self->_hostContentAdapter, "serviceBundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isPresentedByBundleIdentifier:(id)a3
{
  SBRemoteTransientOverlayHostContentAdapter *hostContentAdapter;
  id v4;
  void *v5;
  char v6;

  hostContentAdapter = self->_hostContentAdapter;
  v4 = a3;
  -[SBRemoteTransientOverlayHostContentAdapter serviceBundleIdentifier](hostContentAdapter, "serviceBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", v4);

  return v6;
}

- (int)pictureInPictureProcessIdentifier
{
  return -[SBRemoteTransientOverlayHostContentAdapter serviceProcessIdentifier](self->_hostContentAdapter, "serviceProcessIdentifier");
}

- (id)preferredDisplayLayoutElementIdentifier
{
  return -[SBRemoteTransientOverlayHostContentAdapter serviceBundleIdentifier](self->_hostContentAdapter, "serviceBundleIdentifier");
}

- (int64_t)preferredLockedGestureDismissalStyle
{
  if (-[SBTransientOverlayViewController isAttachedToWindowedAccessory](self, "isAttachedToWindowedAccessory"))
    return 0;
  else
    return -[SBRemoteTransientOverlayHostContentAdapter preferredLockedGestureDismissalStyle](self->_hostContentAdapter, "preferredLockedGestureDismissalStyle");
}

- (id)preferredSceneDeactivationReasonValue
{
  return -[SBRemoteTransientOverlayHostContentAdapter preferredSceneDeactivationReasonValue](self->_hostContentAdapter, "preferredSceneDeactivationReasonValue");
}

- (int64_t)preferredUnlockedGestureDismissalStyle
{
  if (-[SBTransientOverlayViewController isAttachedToWindowedAccessory](self, "isAttachedToWindowedAccessory"))
    return 0;
  else
    return -[SBRemoteTransientOverlayHostContentAdapter preferredUnlockedGestureDismissalStyle](self->_hostContentAdapter, "preferredUnlockedGestureDismissalStyle");
}

- (id)newTransientOverlayDismissalTransitionCoordinator
{
  SBTransientOverlayBlockTransitionCoordinator *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  SBRemoteTransientOverlayViewController *v11;
  _QWORD v12[5];
  id v13;

  v3 = objc_alloc_init(SBTransientOverlayBlockTransitionCoordinator);
  -[SBRemoteTransientOverlayViewController _hostContentViewController](self, "_hostContentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __91__SBRemoteTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke;
  v12[3] = &unk_1E8EA86E8;
  v12[4] = self;
  v6 = v4;
  v13 = v6;
  -[SBTransientOverlayBlockTransitionCoordinator setStartTransitionHandler:](v3, "setStartTransitionHandler:", v12);
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __91__SBRemoteTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_5;
  v9[3] = &unk_1E8EA86E8;
  v10 = v6;
  v11 = self;
  v7 = v6;
  -[SBTransientOverlayBlockTransitionCoordinator setFinalizeTransitionHandler:](v3, "setFinalizeTransitionHandler:", v9);

  return v3;
}

void __91__SBRemoteTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v4;
  uint64_t v5;
  int v6;
  void *v7;
  void *v8;
  int v9;
  char v10;
  _BOOL4 v11;
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[4];
  id v24;
  uint64_t v25;
  id v26;

  v4 = a2;
  v5 = objc_msgSend(v4, "isAnimated");
  if ((_DWORD)v5)
    v6 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1384), "shouldEnableFadeOutAnimation");
  else
    v6 = 0;
  objc_msgSend(*(id *)(a1 + 40), "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 1432);
    v8 = (void *)MEMORY[0x1E0CEABB0];
    v9 = __sb__runningInSpringBoard();
    v10 = v9;
    if (v9)
    {
      v11 = SBFEffectiveDeviceClass() == 2;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v2, "userInterfaceIdiom") == 1;
    }
    if (v11)
      v15 = 0.5;
    else
      v15 = 0.4;
    v16 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __91__SBRemoteTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_2;
    v23[3] = &unk_1E8E9E270;
    v17 = v7;
    v18 = *(_QWORD *)(a1 + 32);
    v24 = v17;
    v25 = v18;
    v26 = v4;
    v21[0] = v16;
    v21[1] = 3221225472;
    v21[2] = __91__SBRemoteTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_3;
    v21[3] = &unk_1E8E9DEB0;
    v21[4] = *(_QWORD *)(a1 + 32);
    v22 = v26;
    objc_msgSend(v8, "animateWithDuration:animations:completion:", v23, v21, v15);
    if ((v10 & 1) == 0)

    v14 = v24;
  }
  else
  {
    objc_msgSend(v4, "performAlongsideTransitions");
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void **)(v12 + 1384);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __91__SBRemoteTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_4;
    v19[3] = &unk_1E8E9E820;
    v19[4] = v12;
    v20 = v4;
    objc_msgSend(v13, "dismissForTransientOverlayAnimated:completion:", v5, v19);
    v14 = v20;
  }

}

uint64_t __91__SBRemoteTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1440), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(a1 + 48), "performAlongsideTransitions");
}

uint64_t __91__SBRemoteTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  char v3;
  uint64_t v4;
  void *v5;

  --*(_QWORD *)(*(_QWORD *)(a1 + 32) + 1432);
  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v2 + 1432))
  {
    v3 = objc_msgSend((id)v2, "_needsWallpaperEffectView");
    v2 = *(_QWORD *)(a1 + 32);
    if ((v3 & 1) == 0)
    {
      objc_msgSend(*(id *)(v2 + 1440), "removeFromSuperview");
      v4 = *(_QWORD *)(a1 + 32);
      v5 = *(void **)(v4 + 1440);
      *(_QWORD *)(v4 + 1440) = 0;

      v2 = *(_QWORD *)(a1 + 32);
    }
  }
  *(_BYTE *)(v2 + 1408) = 0;
  return objc_msgSend(*(id *)(a1 + 40), "completeTransition:", 1);
}

uint64_t __91__SBRemoteTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_4(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1408) = 0;
  return objc_msgSend(*(id *)(a1 + 40), "completeTransition:", 1);
}

void __91__SBRemoteTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_5(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 1.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1440), "setAlpha:", 1.0);

}

- (id)newTransientOverlayPresentationTransitionCoordinator
{
  SBTransientOverlayBlockTransitionCoordinator *v3;
  _QWORD v5[5];

  v3 = objc_alloc_init(SBTransientOverlayBlockTransitionCoordinator);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __94__SBRemoteTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke;
  v5[3] = &unk_1E8E9E9A8;
  v5[4] = self;
  -[SBTransientOverlayBlockTransitionCoordinator setStartTransitionHandler:](v3, "setStartTransitionHandler:", v5);
  return v3;
}

void __94__SBRemoteTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  void *v11;
  int v12;
  char v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  int v21;
  char v22;
  _BOOL4 v23;
  void *v24;
  id *v25;
  double v26;
  double v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;

  v3 = a2;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1408) = 1;
  objc_msgSend(*(id *)(a1 + 32), "loadViewIfNeeded");
  v4 = *(id *)(*(_QWORD *)(a1 + 32) + 1424);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 1424);
  *(_QWORD *)(v5 + 1424) = 0;

  v7 = objc_msgSend(v3, "isAnimated");
  v8 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1384), "shouldEnableFadeInAnimation");
  if (!(_DWORD)v7)
  {
    v9 = (uint64_t)v4;
    v4 = 0;
LABEL_9:

    v9 = v7;
    goto LABEL_10;
  }
  v9 = v8;
  if (v4)
    v10 = 0;
  else
    v10 = v8;
  if (v10 != 1)
    goto LABEL_10;
  v11 = (void *)MEMORY[0x1E0D016B0];
  v12 = __sb__runningInSpringBoard();
  v13 = v12;
  if (v12)
  {
    v14 = SBFEffectiveDeviceClass() == 2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v9 = objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend((id)v9, "userInterfaceIdiom") == 1;
  }
  v27 = 0.4;
  if (v14)
    v27 = 0.5;
  objc_msgSend(v11, "settingsWithDuration:", v27);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((v13 & 1) == 0)
    goto LABEL_9;
  v9 = 1;
LABEL_10:
  objc_msgSend(*(id *)(a1 + 32), "_configureWallpaperEffectViewWithAnimationSettings:", v4);
  objc_msgSend(*(id *)(a1 + 32), "_hostContentViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if ((_DWORD)v9)
  {
    v17 = MEMORY[0x1E0C809B0];
    v18 = (void *)MEMORY[0x1E0CEABB0];
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __94__SBRemoteTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_2;
    v35[3] = &unk_1E8E9DED8;
    v19 = v16;
    v36 = v19;
    objc_msgSend(v18, "performWithoutAnimation:", v35);
    v20 = (void *)MEMORY[0x1E0CEABB0];
    v21 = __sb__runningInSpringBoard();
    v22 = v21;
    if (v21)
    {
      v23 = SBFEffectiveDeviceClass() == 2;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v9 = objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend((id)v9, "userInterfaceIdiom") == 1;
    }
    v25 = &v36;
    if (v23)
      v26 = 0.5;
    else
      v26 = 0.4;
    v32[0] = v17;
    v32[1] = 3221225472;
    v32[2] = __94__SBRemoteTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_3;
    v32[3] = &unk_1E8E9E820;
    v33 = v19;
    v34 = v3;
    v30[0] = v17;
    v30[1] = 3221225472;
    v30[2] = __94__SBRemoteTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_4;
    v30[3] = &unk_1E8E9E980;
    v31 = v34;
    objc_msgSend(v20, "animateWithDuration:animations:completion:", v32, v30, v26);
    if ((v22 & 1) == 0)

  }
  else
  {
    objc_msgSend(v16, "setAlpha:", 1.0);
    objc_msgSend(v3, "performAlongsideTransitions");
    v24 = *(void **)(*(_QWORD *)(a1 + 32) + 1384);
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __94__SBRemoteTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_5;
    v28[3] = &unk_1E8E9DED8;
    v25 = &v29;
    v29 = v3;
    objc_msgSend(v24, "presentForTransientOverlayAnimated:completion:", v7, v28);
  }

}

uint64_t __94__SBRemoteTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __94__SBRemoteTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  return objc_msgSend(*(id *)(a1 + 40), "performAlongsideTransitions");
}

uint64_t __94__SBRemoteTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeTransition:", 1);
}

uint64_t __94__SBRemoteTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeTransition:", 1);
}

- (BOOL)prefersStatusBarActivityItemVisible
{
  void *v3;
  id WeakRetained;
  char v5;

  -[SBRemoteTransientOverlayHostContentAdapter serviceBundleIdentifier](self->_hostContentAdapter, "serviceBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v5 = objc_msgSend(WeakRetained, "remoteTransientOverlayViewController:prefersStatusBarActivityItemVisibleForServiceBundleIdentifier:", self, v3);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)preserveInputViewsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SBRemoteTransientOverlayViewController;
  -[SBTransientOverlayViewController preserveInputViewsAnimated:](&v5, sel_preserveInputViewsAnimated_);
  -[SBRemoteTransientOverlayHostContentAdapter preserveInputViewsAnimated:](self->_hostContentAdapter, "preserveInputViewsAnimated:", v3);
}

- (void)restoreInputViewsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SBRemoteTransientOverlayViewController;
  -[SBTransientOverlayViewController restoreInputViewsAnimated:](&v5, sel_restoreInputViewsAnimated_);
  -[SBRemoteTransientOverlayHostContentAdapter restoreInputViewsAnimated:](self->_hostContentAdapter, "restoreInputViewsAnimated:", v3);
}

- (id)preferredBackgroundActivitiesToSuppress
{
  return -[SBRemoteTransientOverlayHostContentAdapter preferredBackgroundActivitiesToSuppress](self->_hostContentAdapter, "preferredBackgroundActivitiesToSuppress");
}

- (void)setContainerOrientation:(int64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBRemoteTransientOverlayViewController;
  -[SBTransientOverlayViewController setContainerOrientation:](&v4, sel_setContainerOrientation_, a3);
  -[SBTransientOverlayWallpaperEffectView setContainerOrientation:](self->_wallpaperEffectView, "setContainerOrientation:", -[SBTransientOverlayViewController containerOrientation](self, "containerOrientation"));
}

- (void)setIdleTimerCoordinator:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBRemoteTransientOverlayViewController;
  v4 = a3;
  -[SBTransientOverlayViewController setIdleTimerCoordinator:](&v5, sel_setIdleTimerCoordinator_, v4);
  -[SBIdleTimerCoordinatorHelper setTargetCoordinator:](self->_idleTimerCoordinatorHelper, "setTargetCoordinator:", v4, v5.receiver, v5.super_class);

}

- (BOOL)shouldDisableBanners
{
  return -[SBRemoteTransientOverlayHostContentAdapter shouldDisableBanners](self->_hostContentAdapter, "shouldDisableBanners");
}

- (BOOL)shouldDisableControlCenter
{
  return -[SBRemoteTransientOverlayHostContentAdapter shouldDisableControlCenter](self->_hostContentAdapter, "shouldDisableControlCenter");
}

- (BOOL)shouldDisableReachability
{
  return -[SBRemoteTransientOverlayHostContentAdapter shouldDisableReachability](self->_hostContentAdapter, "shouldDisableReachability");
}

- (BOOL)shouldDisableOrientationUpdates
{
  return -[SBRemoteTransientOverlayHostContentAdapter shouldDisableOrientationUpdates](self->_hostContentAdapter, "shouldDisableOrientationUpdates");
}

- (BOOL)shouldDisableInteractiveScreenshotGesture
{
  return -[SBRemoteTransientOverlayHostContentAdapter shouldDisableInteractiveScreenshotGesture](self->_hostContentAdapter, "shouldDisableInteractiveScreenshotGesture");
}

- (BOOL)shouldDisableSiri
{
  return -[SBRemoteTransientOverlayHostContentAdapter shouldDisableSiri](self->_hostContentAdapter, "shouldDisableSiri");
}

- (BOOL)shouldPendAlertItems
{
  return -[SBRemoteTransientOverlayHostContentAdapter shouldPendAlertItems](self->_hostContentAdapter, "shouldPendAlertItems");
}

- (BOOL)shouldUseSceneBasedKeyboardFocus
{
  return -[SBRemoteTransientOverlayHostContentAdapter shouldUseSceneBasedKeyboardFocus](self->_hostContentAdapter, "shouldUseSceneBasedKeyboardFocus");
}

- (BOOL)isPresentedFromSceneWithIdentityTokenString:(id)a3
{
  return -[SBRemoteTransientOverlayHostContentAdapter isPresentedFromSceneWithIdentityTokenString:](self->_hostContentAdapter, "isPresentedFromSceneWithIdentityTokenString:", a3);
}

- (id)keyboardFocusTarget
{
  return -[SBRemoteTransientOverlayHostContentAdapter keyboardFocusTarget](self->_hostContentAdapter, "keyboardFocusTarget");
}

- (BOOL)hidEventDeferringDisabled
{
  return -[SBRemoteTransientOverlayHostContentAdapter hidEventDeferringDisabled](self->_hostContentAdapter, "hidEventDeferringDisabled");
}

- (void)didTransitionToAttachedToWindowedAccessory:(BOOL)a3 windowedAccessoryCutoutFrameInScreen:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  _BOOL8 v8;
  objc_super v10;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBRemoteTransientOverlayViewController;
  -[SBTransientOverlayViewController didTransitionToAttachedToWindowedAccessory:windowedAccessoryCutoutFrameInScreen:](&v10, sel_didTransitionToAttachedToWindowedAccessory_windowedAccessoryCutoutFrameInScreen_);
  -[SBRemoteTransientOverlayHostContentAdapter didTransitionToAttachedToWindowedAccessory:windowedAccessoryCutoutFrameInScreen:](self->_hostContentAdapter, "didTransitionToAttachedToWindowedAccessory:windowedAccessoryCutoutFrameInScreen:", v8, x, y, width, height);
}

- (id)associatedBundleIdentifiersToSuppressInSystemAperture
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[SBRemoteTransientOverlayHostContentAdapter serviceBundleIdentifier](self->_hostContentAdapter, "serviceBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0C99E60];
    -[SBRemoteTransientOverlayHostContentAdapter serviceBundleIdentifier](self->_hostContentAdapter, "serviceBundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setWithObject:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)associatedSceneIdentifiersToSuppressInSystemAperture
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[SBRemoteTransientOverlayHostContentAdapter associatedSceneIdentifierToSuppressInSystemAperture](self->_hostContentAdapter, "associatedSceneIdentifierToSuppressInSystemAperture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0C99E60];
    -[SBRemoteTransientOverlayHostContentAdapter associatedSceneIdentifierToSuppressInSystemAperture](self->_hostContentAdapter, "associatedSceneIdentifierToSuppressInSystemAperture");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setWithObject:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)setPresentationEmbeddedInTargetScene:(BOOL)a3
{
  _BOOL4 presentationEmbeddedInTargetScene;
  void *v5;
  id v6;

  presentationEmbeddedInTargetScene = self->_presentationEmbeddedInTargetScene;
  if (presentationEmbeddedInTargetScene != a3)
  {
    self->_presentationEmbeddedInTargetScene = a3;
    if (-[SBRemoteTransientOverlayViewController isViewLoaded](self, "isViewLoaded"))
    {
      if (-[SBRemoteTransientOverlayHostContentAdapter shouldUpdateSceneBasedViewController](self->_hostContentAdapter, "shouldUpdateSceneBasedViewController"))
      {
        -[SBRemoteTransientOverlayHostContentAdapter contentViewControllerForPresentationEmbeddedInSceneView:](self->_hostContentAdapter, "contentViewControllerForPresentationEmbeddedInSceneView:", presentationEmbeddedInTargetScene);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBRemoteTransientOverlayViewController bs_removeChildViewController:](self, "bs_removeChildViewController:", v5);

        -[SBRemoteTransientOverlayHostContentAdapter contentViewControllerForPresentationEmbeddedInSceneView:](self->_hostContentAdapter, "contentViewControllerForPresentationEmbeddedInSceneView:", self->_presentationEmbeddedInTargetScene);
        v6 = (id)objc_claimAutoreleasedReturnValue();
        -[SBRemoteTransientOverlayViewController bs_addChildViewController:](self, "bs_addChildViewController:", v6);

      }
    }
  }
}

- (BOOL)isActivatingForSiri
{
  return -[SBRemoteTransientOverlayHostContentAdapter isActivatingForSiri](self->_hostContentAdapter, "isActivatingForSiri");
}

- (BOOL)isScreenshotMarkup
{
  return -[SBRemoteTransientOverlayHostContentAdapter isScreenshotMarkup](self->_hostContentAdapter, "isScreenshotMarkup");
}

- (BOOL)isSwitcherEligible
{
  return -[SBRemoteTransientOverlayHostContentAdapter isSwitcherEligible](self->_hostContentAdapter, "isSwitcherEligible");
}

- (id)representedDisplayItem
{
  void *v2;
  void *v3;

  -[SBRemoteTransientOverlayHostContentAdapter serviceBundleIdentifier](self->_hostContentAdapter, "serviceBundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    +[SBDisplayItem remoteAlertDisplayItemWithServiceBundleIdentifier:](SBDisplayItem, "remoteAlertDisplayItemWithServiceBundleIdentifier:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (BOOL)shouldInvalidateWhenDeactivated
{
  return -[SBRemoteTransientOverlayHostContentAdapter shouldInvalidateWhenDeactivated](self->_hostContentAdapter, "shouldInvalidateWhenDeactivated");
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  -[SBRemoteTransientOverlayHostContentAdapter configureWithContext:completion:](self->_hostContentAdapter, "configureWithContext:completion:", a3, a4);
}

- (void)didDeactivate
{
  -[SBRemoteTransientOverlayHostContentAdapter didDeactivateForRemoteAlertSessionDeactivation](self->_hostContentAdapter, "didDeactivateForRemoteAlertSessionDeactivation");
}

- (void)didInvalidate
{
  -[SBRemoteTransientOverlayHostContentAdapter didInvalidateForRemoteAlert](self->_hostContentAdapter, "didInvalidateForRemoteAlert");
}

- (void)prepareForActivationWithContext:(id)a3 presentationMode:(int64_t)a4 presentEmbedded:(BOOL)a5 windowScene:(id)a6 completion:(id)a7
{
  _BOOL8 v8;
  SBRemoteTransientOverlayHostContentAdapter *hostContentAdapter;
  id v13;
  id v14;
  id v15;

  v8 = a5;
  hostContentAdapter = self->_hostContentAdapter;
  v13 = a7;
  v14 = a6;
  v15 = a3;
  -[SBRemoteTransientOverlayHostContentAdapter setShouldPresentEmbeddedInTargetSceneIfRequested:](hostContentAdapter, "setShouldPresentEmbeddedInTargetSceneIfRequested:", v8);
  -[SBRemoteTransientOverlayHostContentAdapter prepareForActivationWithContext:presentationMode:windowScene:completion:](self->_hostContentAdapter, "prepareForActivationWithContext:presentationMode:windowScene:completion:", v15, a4, v14, v13);

}

- (id)_hostContentViewController
{
  return -[SBRemoteTransientOverlayHostContentAdapter contentViewControllerForPresentationEmbeddedInSceneView:](self->_hostContentAdapter, "contentViewControllerForPresentationEmbeddedInSceneView:", self->_presentationEmbeddedInTargetScene);
}

- (void)_setMediaOverridePID:(int)a3
{
  -[SBRemoteTransientOverlayHostContentAdapter setMediaOverridePID:](self->_hostContentAdapter, "setMediaOverridePID:", *(_QWORD *)&a3);
}

- (void)_configureWallpaperEffectViewWithAnimationSettings:(id)a3
{
  id v4;
  SBTransientOverlayWallpaperEffectView *wallpaperEffectView;
  SBTransientOverlayWallpaperEffectView *v6;
  BOOL v7;
  BOOL v8;
  void *v9;
  uint64_t *v10;
  uint64_t *v11;
  SBTransientOverlayWallpaperEffectView *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  SBRemoteTransientOverlayViewController *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  void *v21;
  SBRemoteTransientOverlayViewController *v22;
  __int128 v23;
  uint64_t v24;
  _QWORD v25[5];
  _QWORD v26[5];
  __int128 v27;
  uint64_t v28;
  BOOL v29;
  __int128 v30;
  uint64_t v31;
  _QWORD v32[5];

  v4 = a3;
  if (-[SBRemoteTransientOverlayViewController _needsWallpaperEffectView](self, "_needsWallpaperEffectView"))
  {
    wallpaperEffectView = self->_wallpaperEffectView;
    if (!wallpaperEffectView)
    {
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __93__SBRemoteTransientOverlayViewController__configureWallpaperEffectViewWithAnimationSettings___block_invoke;
      v32[3] = &unk_1E8E9DED8;
      v32[4] = self;
      objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v32);
    }
    -[SBRemoteTransientOverlayHostContentAdapter preferredBackgroundStyle](self->_hostContentAdapter, "preferredBackgroundStyle");
    _WallpaperStyleForBackgroundStyle();
    v30 = 0uLL;
    v31 = 0;
    PBUIWallpaperStyleTransitionStateMake();
    v6 = self->_wallpaperEffectView;
    if (!v4)
    {
      v23 = v30;
      v24 = v31;
      -[SBTransientOverlayWallpaperEffectView setTransitionState:](v6, "setTransitionState:", &v23);
      goto LABEL_14;
    }
    v7 = -[SBTransientOverlayWallpaperEffectView prepareToAnimateToTransitionState:](v6, "prepareToAnimateToTransitionState:", &v30);
    v8 = v7;
    ++self->_wallpaperEffectAnimations;
    if (!wallpaperEffectView && !v7)
      -[SBTransientOverlayWallpaperEffectView setAlpha:](self->_wallpaperEffectView, "setAlpha:", 0.0);
    v9 = (void *)MEMORY[0x1E0D01908];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __93__SBRemoteTransientOverlayViewController__configureWallpaperEffectViewWithAnimationSettings___block_invoke_2;
    v26[3] = &unk_1E8EA8710;
    v29 = v8;
    v26[4] = self;
    v27 = v30;
    v28 = v31;
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __93__SBRemoteTransientOverlayViewController__configureWallpaperEffectViewWithAnimationSettings___block_invoke_3;
    v25[3] = &unk_1E8E9E980;
    v25[4] = self;
    v10 = v26;
    v11 = v25;
  }
  else
  {
    if (!v4)
    {
      -[SBTransientOverlayWallpaperEffectView removeFromSuperview](self->_wallpaperEffectView, "removeFromSuperview");
      v12 = self->_wallpaperEffectView;
      self->_wallpaperEffectView = 0;

      goto LABEL_14;
    }
    ++self->_wallpaperEffectAnimations;
    v9 = (void *)MEMORY[0x1E0D01908];
    v17 = self;
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __93__SBRemoteTransientOverlayViewController__configureWallpaperEffectViewWithAnimationSettings___block_invoke_4;
    v21 = &unk_1E8E9DED8;
    v22 = self;
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __93__SBRemoteTransientOverlayViewController__configureWallpaperEffectViewWithAnimationSettings___block_invoke_5;
    v16 = &unk_1E8E9E980;
    v10 = &v18;
    v11 = &v13;
  }
  objc_msgSend(v9, "animateWithSettings:actions:completion:", v4, v10, v11, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22);
LABEL_14:

}

void __93__SBRemoteTransientOverlayViewController__configureWallpaperEffectViewWithAnimationSettings___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  SBTransientOverlayWallpaperEffectView *v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "backgroundView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  v6 = -[SBTransientOverlayWallpaperEffectView initWithFrame:wallpaperVariant:]([SBTransientOverlayWallpaperEffectView alloc], "initWithFrame:wallpaperVariant:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1472), v2, v3, v4, v5);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 1440);
  *(_QWORD *)(v7 + 1440) = v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1440), "setContainerOrientation:", objc_msgSend(*(id *)(a1 + 32), "containerOrientation"));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1440), "setWallpaperStyle:", 0);
  objc_msgSend(v9, "insertSubview:atIndex:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1440), 0);

}

uint64_t __93__SBRemoteTransientOverlayViewController__configureWallpaperEffectViewWithAnimationSettings___block_invoke_2(uint64_t a1)
{
  void *v2;
  __int128 v4;
  uint64_t v5;

  if (*(_BYTE *)(a1 + 64))
  {
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 1440);
    v4 = *(_OWORD *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 56);
    objc_msgSend(v2, "setTransitionState:", &v4);
  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1440), "setAlpha:", 1.0);
}

uint64_t __93__SBRemoteTransientOverlayViewController__configureWallpaperEffectViewWithAnimationSettings___block_invoke_3(uint64_t result)
{
  --*(_QWORD *)(*(_QWORD *)(result + 32) + 1432);
  return result;
}

uint64_t __93__SBRemoteTransientOverlayViewController__configureWallpaperEffectViewWithAnimationSettings___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1440), "setAlpha:", 0.0);
}

void __93__SBRemoteTransientOverlayViewController__configureWallpaperEffectViewWithAnimationSettings___block_invoke_5(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;

  --*(_QWORD *)(*(_QWORD *)(a1 + 32) + 1432);
  v2 = *(_QWORD **)(a1 + 32);
  if (!v2[179] && (objc_msgSend(v2, "_needsWallpaperEffectView") & 1) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1440), "removeFromSuperview");
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 1440);
    *(_QWORD *)(v3 + 1440) = 0;

  }
}

- (BOOL)_needsWallpaperEffectView
{
  return -[SBRemoteTransientOverlayHostContentAdapter preferredBackgroundStyle](self->_hostContentAdapter, "preferredBackgroundStyle") != 0;
}

- (int64_t)preferredDismissalAnimationStyle
{
  return self->_preferredDismissalAnimationStyle;
}

- (SBRemoteTransientOverlayViewControllerDelegate)delegate
{
  return (SBRemoteTransientOverlayViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)wallpaperVariant
{
  return self->_wallpaperVariant;
}

- (void)setWallpaperVariant:(int64_t)a3
{
  self->_wallpaperVariant = a3;
}

- (SBRemoteTransientOverlayViewController)pairedRemoteTransientOverlay
{
  return (SBRemoteTransientOverlayViewController *)objc_loadWeakRetained((id *)&self->_pairedRemoteTransientOverlay);
}

- (void)setPairedRemoteTransientOverlay:(id)a3
{
  objc_storeWeak((id *)&self->_pairedRemoteTransientOverlay, a3);
}

- (BOOL)isPresentationEmbeddedInTargetScene
{
  return self->_presentationEmbeddedInTargetScene;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_pairedRemoteTransientOverlay);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_wallpaperEffectView, 0);
  objc_storeStrong((id *)&self->_pendingAnimationSettings, 0);
  objc_storeStrong((id *)&self->_idleTimerCoordinatorHelper, 0);
  objc_storeStrong((id *)&self->_contentViewWrapperView, 0);
  objc_storeStrong((id *)&self->_hostContentAdapter, 0);
}

@end
