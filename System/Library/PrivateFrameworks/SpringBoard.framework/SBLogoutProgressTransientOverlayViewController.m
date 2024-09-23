@implementation SBLogoutProgressTransientOverlayViewController

- (SBLogoutProgressTransientOverlayViewController)initWithUserAccount:(id)a3
{
  id v5;
  SBLogoutProgressTransientOverlayViewController *v6;
  uint64_t v7;
  SBPlatformController *platformController;
  void *v9;
  uint64_t v10;
  SBMultiUserDefaults *multiUserDefaults;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SBLogoutProgressTransientOverlayViewController;
  v6 = -[SBLogoutProgressTransientOverlayViewController init](&v13, sel_init);
  if (v6)
  {
    +[SBPlatformController sharedInstance](SBPlatformController, "sharedInstance");
    v7 = objc_claimAutoreleasedReturnValue();
    platformController = v6->_platformController;
    v6->_platformController = (SBPlatformController *)v7;

    +[SBDefaults localDefaults](SBDefaults, "localDefaults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "multiUserDefaults");
    v10 = objc_claimAutoreleasedReturnValue();
    multiUserDefaults = v6->_multiUserDefaults;
    v6->_multiUserDefaults = (SBMultiUserDefaults *)v10;

    objc_storeStrong((id *)&v6->_user, a3);
  }

  return v6;
}

- (void)setDataSource:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_dataSource, obj);
    -[SBLogoutProgressTransientOverlayViewController _updateData](self, "_updateData");
    v5 = obj;
  }

}

- (void)prepareForRestart
{
  void *v3;

  -[SBLogoutDebugBlockingViewController view](self->_debugTasksViewController, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

  -[SBLogoutProgressView setProgressVisible:](self->_progressView, "setProgressVisible:", 0);
}

- (int64_t)preferredStatusBarStyle
{
  void *v2;
  unint64_t v3;

  -[SBLogoutProgressTransientOverlayViewController _legibilitySettings](self, "_legibilitySettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "style");

  return v3 < 2;
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  id WeakRetained;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBLogoutProgressTransientOverlayViewController;
  -[SBTransientOverlayViewController viewDidDisappear:](&v6, sel_viewDidDisappear_, a3);
  +[SBMainStatusBarStateProvider sharedInstance](SBMainStatusBarStateProvider, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enableStatusBarItem:requestor:", 8, CFSTR("SBLogoutProgressTransientOverlayViewController"));

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "logoutProgressTransientOverlayViewControllerDidDisappear:", self);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBLogoutProgressTransientOverlayViewController;
  -[SBTransientOverlayViewController viewDidLayoutSubviews](&v5, sel_viewDidLayoutSubviews);
  -[SBTransientOverlayViewController backgroundView](self, "backgroundView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  -[MTMaterialView setFrame:](self->_overlayMaterialView, "setFrame:");
  -[SBTransientOverlayViewController contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  -[SBLogoutProgressView setFrame:](self->_progressView, "setFrame:");

}

- (void)viewDidLoad
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  SBLogoutProgressView *v8;
  SBLogoutProgressView *progressView;
  SBLogoutProgressView *v10;
  void *v11;
  SBLogoutProgressView *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  MTMaterialView *v25;
  MTMaterialView *overlayMaterialView;
  SBLogoutDebugBlockingViewController *v27;
  SBLogoutDebugBlockingViewController *debugTasksViewController;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)SBLogoutProgressTransientOverlayViewController;
  -[SBTransientOverlayViewController viewDidLoad](&v29, sel_viewDidLoad);
  -[SBTransientOverlayViewController contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v8 = -[SBLogoutProgressView initWithFrame:]([SBLogoutProgressView alloc], "initWithFrame:", v4, v5, v6, v7);
  progressView = self->_progressView;
  self->_progressView = v8;

  v10 = self->_progressView;
  objc_msgSend(MEMORY[0x1E0C97200], "contactForUser:", self->_user);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBLogoutProgressView setUserContact:](v10, "setUserContact:", v11);

  v12 = self->_progressView;
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBLogoutProgressView setBackgroundColor:](v12, "setBackgroundColor:", v13);

  objc_msgSend(v3, "addSubview:", self->_progressView);
  -[SBTransientOverlayViewController backgroundView](self, "backgroundView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bounds");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v23 = (void *)MEMORY[0x1E0D47498];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "materialViewWithRecipeNamed:inBundle:options:initialWeighting:scaleAdjustment:", CFSTR("logoutProgressOverlay"), v24, 0, 0, 1.0);
  v25 = (MTMaterialView *)objc_claimAutoreleasedReturnValue();
  overlayMaterialView = self->_overlayMaterialView;
  self->_overlayMaterialView = v25;

  -[MTMaterialView setFrame:](self->_overlayMaterialView, "setFrame:", v16, v18, v20, v22);
  objc_msgSend(v14, "addSubview:", self->_overlayMaterialView);
  if (-[SBLogoutProgressTransientOverlayViewController _supportsDebugUI](self, "_supportsDebugUI"))
  {
    v27 = objc_alloc_init(SBLogoutDebugBlockingViewController);
    debugTasksViewController = self->_debugTasksViewController;
    self->_debugTasksViewController = v27;

  }
  -[SBLogoutProgressTransientOverlayViewController _updateData](self, "_updateData");
  -[SBLogoutProgressTransientOverlayViewController _updateLegibility](self, "_updateLegibility");

}

- (void)viewWillAppear:(BOOL)a3
{
  SBLogoutDebugBlockingViewController *debugTasksViewController;
  SBLogoutProgressTransientOverlayViewController *v5;
  double v6;
  double v7;
  SBLogoutProgressView *progressView;
  void *v9;
  double v10;
  double v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SBLogoutProgressTransientOverlayViewController;
  -[SBLogoutProgressTransientOverlayViewController viewWillAppear:](&v13, sel_viewWillAppear_, a3);
  debugTasksViewController = self->_debugTasksViewController;
  if (debugTasksViewController)
  {
    -[SBLogoutDebugBlockingViewController parentViewController](debugTasksViewController, "parentViewController");
    v5 = (SBLogoutProgressTransientOverlayViewController *)objc_claimAutoreleasedReturnValue();

    if (v5 == self)
    {
      -[SBLogoutProgressView frame](self->_progressView, "frame");
      -[SBLogoutProgressTransientOverlayViewController _updateDebugTasksViewControllerSizeFromSize:](self, "_updateDebugTasksViewControllerSizeFromSize:", v10, v11);
    }
    else
    {
      -[SBLogoutDebugBlockingViewController willMoveToParentViewController:](self->_debugTasksViewController, "willMoveToParentViewController:", self);
      -[SBLogoutProgressTransientOverlayViewController addChildViewController:](self, "addChildViewController:", self->_debugTasksViewController);
      -[SBLogoutProgressView frame](self->_progressView, "frame");
      -[SBLogoutProgressTransientOverlayViewController _updateDebugTasksViewControllerSizeFromSize:](self, "_updateDebugTasksViewControllerSizeFromSize:", v6, v7);
      progressView = self->_progressView;
      -[SBLogoutDebugBlockingViewController view](self->_debugTasksViewController, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBLogoutProgressView addSubview:](progressView, "addSubview:", v9);

      -[SBLogoutDebugBlockingViewController didMoveToParentViewController:](self->_debugTasksViewController, "didMoveToParentViewController:", self);
    }
  }
  +[SBMainStatusBarStateProvider sharedInstance](SBMainStatusBarStateProvider, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "disableStatusBarItem:requestor:", 8, CFSTR("SBLogoutProgressTransientOverlayViewController"));

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  objc_super v7;

  height = a3.height;
  width = a3.width;
  v7.receiver = self;
  v7.super_class = (Class)SBLogoutProgressTransientOverlayViewController;
  -[SBTransientOverlayViewController viewWillTransitionToSize:withTransitionCoordinator:](&v7, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4);
  -[SBLogoutProgressTransientOverlayViewController _updateDebugTasksViewControllerSizeFromSize:](self, "_updateDebugTasksViewControllerSizeFromSize:", width, height);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)isContentOpaque
{
  return 0;
}

- (id)newTransientOverlayDismissalTransitionCoordinator
{
  SBTransientOverlayBlockTransitionCoordinator *v3;
  _QWORD v5[5];

  v3 = objc_alloc_init(SBTransientOverlayBlockTransitionCoordinator);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __99__SBLogoutProgressTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke;
  v5[3] = &unk_1E8E9E9A8;
  v5[4] = self;
  -[SBTransientOverlayBlockTransitionCoordinator setStartTransitionHandler:](v3, "setStartTransitionHandler:", v5);
  return v3;
}

void __99__SBLogoutProgressTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v3 = a2;
  if (objc_msgSend(v3, "isAnimated"))
  {
    objc_msgSend(*(id *)(a1 + 32), "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x1E0C809B0];
    v6 = (void *)MEMORY[0x1E0CEABB0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __99__SBLogoutProgressTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_2;
    v10[3] = &unk_1E8E9E820;
    v11 = v4;
    v12 = v3;
    v8[0] = v5;
    v8[1] = 3221225472;
    v8[2] = __99__SBLogoutProgressTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_3;
    v8[3] = &unk_1E8E9E980;
    v9 = v12;
    v7 = v4;
    objc_msgSend(v6, "animateWithDuration:delay:options:animations:completion:", 327680, v10, v8, 0.3, 0.0);

  }
  else
  {
    objc_msgSend(v3, "performAlongsideTransitions");
    objc_msgSend(v3, "completeTransition:", 1);
  }

}

uint64_t __99__SBLogoutProgressTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(a1 + 40), "performAlongsideTransitions");
}

uint64_t __99__SBLogoutProgressTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_3(uint64_t a1)
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
  v5[2] = __102__SBLogoutProgressTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke;
  v5[3] = &unk_1E8E9E9A8;
  v5[4] = self;
  -[SBTransientOverlayBlockTransitionCoordinator setStartTransitionHandler:](v3, "setStartTransitionHandler:", v5);
  return v3;
}

void __102__SBLogoutProgressTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1440));
  if (objc_msgSend(v3, "isAnimated"))
  {
    objc_msgSend(*(id *)(a1 + 32), "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0CEABB0];
    v7 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __102__SBLogoutProgressTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_2;
    v20[3] = &unk_1E8E9DED8;
    v8 = v5;
    v21 = v8;
    objc_msgSend(v6, "performWithoutAnimation:", v20);
    v9 = (void *)MEMORY[0x1E0CEABB0];
    v17[0] = v7;
    v17[1] = 3221225472;
    v17[2] = __102__SBLogoutProgressTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_3;
    v17[3] = &unk_1E8E9E820;
    v18 = v8;
    v19 = v3;
    v13[0] = v7;
    v13[1] = 3221225472;
    v13[2] = __102__SBLogoutProgressTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_4;
    v13[3] = &unk_1E8E9EEF0;
    v14 = v19;
    v10 = WeakRetained;
    v11 = *(_QWORD *)(a1 + 32);
    v15 = v10;
    v16 = v11;
    v12 = v8;
    objc_msgSend(v9, "animateWithDuration:delay:options:animations:completion:", 327680, v17, v13, 0.3, 0.0);

  }
  else
  {
    objc_msgSend(v3, "performAlongsideTransitions");
    objc_msgSend(v3, "completeTransition:", 1);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "logoutProgressTransientOverlayPresentationTransitionCoordinatorDidComplete:", *(_QWORD *)(a1 + 32));
  }

}

uint64_t __102__SBLogoutProgressTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __102__SBLogoutProgressTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  return objc_msgSend(*(id *)(a1 + 40), "performAlongsideTransitions");
}

uint64_t __102__SBLogoutProgressTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_4(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "completeTransition:", 1);
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 40), "logoutProgressTransientOverlayPresentationTransitionCoordinatorDidComplete:", *(_QWORD *)(a1 + 48));
  return result;
}

- (void)setContainerOrientation:(int64_t)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBLogoutProgressTransientOverlayViewController;
  -[SBTransientOverlayViewController setContainerOrientation:](&v3, sel_setContainerOrientation_, a3);
}

- (BOOL)shouldDisableControlCenter
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

- (int64_t)idleTimerDuration
{
  return 0;
}

- (int64_t)idleTimerMode
{
  return 3;
}

- (int64_t)idleWarnMode
{
  return 1;
}

- (int64_t)proximityDetectionMode
{
  return 0;
}

- (BOOL)_supportsDebugUI
{
  id WeakRetained;
  char v4;

  if ((-[SBMultiUserDefaults disablesInternalDebugBlockingTasksUI](self->_multiUserDefaults, "disablesInternalDebugBlockingTasksUI") & 1) != 0|| !-[SBPlatformController isInternalInstall](self->_platformController, "isInternalInstall"))
  {
    v4 = 0;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    v4 = objc_opt_respondsToSelector();

  }
  return v4 & 1;
}

- (void)_updateDebugTasksViewControllerSizeFromSize:(CGSize)a3
{
  double height;
  double width;
  id v5;

  height = a3.height;
  width = a3.width;
  -[SBLogoutDebugBlockingViewController view](self->_debugTasksViewController, "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFrame:", 0.0, 0.0, width * 0.5, height);

}

- (id)_legibilitySettings
{
  return (id)objc_msgSend(MEMORY[0x1E0CEADE8], "sharedInstanceForStyle:", 1);
}

- (void)_updateLegibility
{
  SBLogoutProgressView *progressView;
  id v3;

  progressView = self->_progressView;
  -[SBLogoutProgressTransientOverlayViewController _legibilitySettings](self, "_legibilitySettings");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SBLogoutProgressView setLegibilitySettings:](progressView, "setLegibilitySettings:", v3);

}

- (void)_updateData
{
  void *v3;
  SBLogoutDebugBlockingViewController *debugTasksViewController;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "pendingApplicationsForLogoutProgressTransientOverlayViewController:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBLogoutProgressView setPendingApplications:](self->_progressView, "setPendingApplications:", v3);
  if (-[SBLogoutProgressTransientOverlayViewController _supportsDebugUI](self, "_supportsDebugUI"))
  {
    debugTasksViewController = self->_debugTasksViewController;
    objc_msgSend(WeakRetained, "debugBlockingTasksForLogoutProgressTransientOverlayViewController:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBLogoutDebugBlockingViewController setDebugBlockingTasks:](debugTasksViewController, "setDebugBlockingTasks:", v5);

  }
}

- (SBLogoutProgressDataSource)dataSource
{
  return (SBLogoutProgressDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (UMUser)user
{
  return self->_user;
}

- (SBLogoutProgressDelegate)delegate
{
  return (SBLogoutProgressDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_user, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_overlayMaterialView, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_platformController, 0);
  objc_storeStrong((id *)&self->_multiUserDefaults, 0);
  objc_storeStrong((id *)&self->_debugTasksViewController, 0);
}

@end
