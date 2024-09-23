@implementation SBHWidgetContainerViewController

- (unint64_t)userVisibilityStatus
{
  return self->_userVisibilityStatus;
}

- (void)setUserVisibilityStatus:(unint64_t)a3
{
  if (self->_userVisibilityStatus != a3)
  {
    self->_userVisibilityStatus = a3;
    -[SBHWidgetContainerViewController _updateWidgetVisibility](self, "_updateWidgetVisibility");
  }
}

- (void)setPaused:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SBHWidgetContainerViewController _widgetHostViewController](self, "_widgetHostViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAnimationsPaused:", v3);

}

- (void)_updateWidgetVisibility
{
  unint64_t v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v13;
  void *v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = -[SBHWidgetContainerViewController userVisibilityStatus](self, "userVisibilityStatus");
  v4 = "not visible";
  if (v3 == 2)
  {
    v4 = "visible not settled";
    v5 = 1;
  }
  else
  {
    v5 = 0;
  }
  if (v3 == 3)
    v6 = "visible settled";
  else
    v6 = v4;
  if (v3 == 3)
    v7 = 2;
  else
    v7 = v5;
  -[SBHWidgetContainerViewController _widgetHostViewController](self, "_widgetHostViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "visibility") != v7)
  {
    objc_msgSend(v8, "widget");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "extensionIdentity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "extensionBundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    SBLogWidgets();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138543618;
      v14 = v11;
      v15 = 2082;
      v16 = v6;
      _os_log_impl(&dword_1CFEF3000, v12, OS_LOG_TYPE_DEFAULT, "Setting visibility of widget %{public}@ to %{public}s", (uint8_t *)&v13, 0x16u);
    }

    objc_msgSend(v8, "setVisibility:", v7);
  }

}

- (SBHWidgetContainerViewController)initWithWidgetViewController:(id)a3 widgetDataSource:(id)a4 gridSizeClass:(id)a5 iconImageInfo:(SBIconImageInfo *)a6 applicationName:(id)a7
{
  double v7;
  double v8;
  double v9;
  double v10;
  double v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  id v20;
  id v21;
  id v22;
  SBIconImageInfo *v23;
  SBHWidgetContainerViewController *v24;
  SBHWidgetContainerViewController *v25;
  id *p_widgetViewController;
  uint64_t v27;
  NSString *gridSizeClass;
  uint64_t v29;
  NSString *applicationName;
  objc_super v32;

  v12 = v10;
  v13 = v9;
  v14 = v8;
  v15 = v7;
  v20 = a3;
  v21 = a4;
  v22 = a5;
  v23 = a6;
  v32.receiver = self;
  v32.super_class = (Class)SBHWidgetContainerViewController;
  v24 = -[SBHWidgetContainerViewController initWithNibName:bundle:](&v32, sel_initWithNibName_bundle_, 0, 0);
  v25 = v24;
  if (v24)
  {
    v24->_iconImageInfo.size.width = v15;
    v24->_iconImageInfo.size.height = v14;
    v24->_iconImageInfo.scale = v13;
    v24->_iconImageInfo.continuousCornerRadius = v12;
    p_widgetViewController = (id *)&v24->_widgetViewController;
    objc_storeStrong((id *)&v24->_widgetViewController, a3);
    if (objc_msgSend(*p_widgetViewController, "sbh_isMultiplexingViewController"))
      objc_msgSend(*p_widgetViewController, "addObserver:", v25);
    objc_storeStrong((id *)&v25->_widgetDataSource, a4);
    v27 = objc_msgSend(v22, "copy");
    gridSizeClass = v25->_gridSizeClass;
    v25->_gridSizeClass = (NSString *)v27;

    v29 = -[SBIconImageInfo copy](v23, "copy");
    applicationName = v25->_applicationName;
    v25->_applicationName = (NSString *)v29;

    v25->_requiresClippingToBounds = 0;
  }

  return v25;
}

- (void)loadView
{
  void *v3;
  void *v4;
  SBHWidgetStyleManager *v5;
  SBHWidgetContainerView *v6;

  v6 = -[SBHWidgetContainerView initWithGridSizeClass:applicationName:]([SBHWidgetContainerView alloc], "initWithGridSizeClass:applicationName:", self->_gridSizeClass, self->_applicationName);
  -[SBHWidgetContainerViewController setView:](self, "setView:", v6);
  -[SBHWidgetContainerViewController bs_addChildViewController:withSuperview:](self, "bs_addChildViewController:withSuperview:", self->_widgetViewController, v6);
  -[UIViewController view](self->_widgetViewController, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHWidgetContainerView setWidgetView:](v6, "setWidgetView:", v3);

  -[SBHWidgetContainerViewController effectiveIconImageStyleConfiguration](self, "effectiveIconImageStyleConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SBHWidgetStyleManager initWithWidgetViewController:widgetDataSource:gridSizeClass:iconImageInfo:imageStyleConfiguration:delegate:]([SBHWidgetStyleManager alloc], "initWithWidgetViewController:widgetDataSource:gridSizeClass:iconImageInfo:imageStyleConfiguration:delegate:", self->_widgetViewController, self->_widgetDataSource, self->_gridSizeClass, v4, self, self->_iconImageInfo.size.width, self->_iconImageInfo.size.height, self->_iconImageInfo.scale, self->_iconImageInfo.continuousCornerRadius);
  -[SBHWidgetContainerViewController setWidgetStyleManager:](self, "setWidgetStyleManager:", v5);

}

- (void)viewWillAppear:(BOOL)a3
{
  NSObject *v4;
  void *v5;
  objc_super v6;
  uint8_t buf[4];
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)SBHWidgetContainerViewController;
  -[SBHWidgetContainerViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  SBLogWidgets();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[SBHWidgetContainerViewController _widgetExtensionBundleIdentifier](self, "_widgetExtensionBundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v8 = v5;
    _os_log_impl(&dword_1CFEF3000, v4, OS_LOG_TYPE_DEFAULT, "SBHWidgetContainerViewController %{public}@ -- viewWillAppear", buf, 0xCu);

  }
  -[SBHWidgetContainerViewController _updateWidgetVisibility](self, "_updateWidgetVisibility");
  -[SBHWidgetContainerViewController _updateWidgetAccent](self, "_updateWidgetAccent");
  if (!-[UIViewController sbh_isMultiplexingViewController](self->_widgetViewController, "sbh_isMultiplexingViewController"))
  {
    -[SBHWidgetContainerViewController setWidgetControllerActive:](self, "setWidgetControllerActive:", 1);
    -[SBHWidgetContainerViewController _updateWidgetVisibility](self, "_updateWidgetVisibility");
    -[SBHWidgetContainerViewController _monitorForWidgetReadiness](self, "_monitorForWidgetReadiness");
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  NSObject *v4;
  void *v5;
  objc_super v6;
  uint8_t buf[4];
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)SBHWidgetContainerViewController;
  -[SBHWidgetContainerViewController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  SBLogWidgets();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[SBHWidgetContainerViewController _widgetExtensionBundleIdentifier](self, "_widgetExtensionBundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v8 = v5;
    _os_log_impl(&dword_1CFEF3000, v4, OS_LOG_TYPE_DEFAULT, "SBHWidgetContainerViewController %{public}@ -- viewDidAppear", buf, 0xCu);

  }
  -[SBHWidgetContainerViewController _updateWidgetVisibility](self, "_updateWidgetVisibility");
}

- (void)viewWillDisappear:(BOOL)a3
{
  NSObject *v4;
  void *v5;
  objc_super v6;
  uint8_t buf[4];
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)SBHWidgetContainerViewController;
  -[SBHWidgetContainerViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, a3);
  SBLogWidgets();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[SBHWidgetContainerViewController _widgetExtensionBundleIdentifier](self, "_widgetExtensionBundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v8 = v5;
    _os_log_impl(&dword_1CFEF3000, v4, OS_LOG_TYPE_DEFAULT, "SBHWidgetContainerViewController %{public}@ -- viewWillDisappear", buf, 0xCu);

  }
  -[SBHWidgetContainerViewController _updateWidgetVisibility](self, "_updateWidgetVisibility");
  if (!-[UIViewController sbh_isMultiplexingViewController](self->_widgetViewController, "sbh_isMultiplexingViewController"))-[SBHWidgetContainerViewController setWidgetControllerActive:](self, "setWidgetControllerActive:", 0);
}

- (void)viewDidDisappear:(BOOL)a3
{
  NSObject *v4;
  void *v5;
  objc_super v6;
  uint8_t buf[4];
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)SBHWidgetContainerViewController;
  -[SBHWidgetContainerViewController viewDidDisappear:](&v6, sel_viewDidDisappear_, a3);
  SBLogWidgets();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[SBHWidgetContainerViewController _widgetExtensionBundleIdentifier](self, "_widgetExtensionBundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v8 = v5;
    _os_log_impl(&dword_1CFEF3000, v4, OS_LOG_TYPE_DEFAULT, "SBHWidgetContainerViewController %{public}@ -- viewDidDisappear", buf, 0xCu);

  }
  -[SBHWidgetContainerViewController _updateWidgetVisibility](self, "_updateWidgetVisibility");
}

- (BOOL)wantsSystemMaterialBackground
{
  void *v3;
  char v4;
  void *v5;

  -[SBHWidgetContainerViewController widgetStyleManager](self, "widgetStyleManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "needsGradientBackground") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    -[SBHWidgetContainerViewController _widgetHostViewController](self, "_widgetHostViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "usesSystemBackgroundMaterial");

  }
  return v4;
}

- (BOOL)containsInteractiveControls
{
  void *v2;
  char v3;

  -[SBHWidgetContainerViewController _widgetHostViewController](self, "_widgetHostViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsInteractiveControls");

  return v3;
}

- (id)snapshotView
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[SBHWidgetContainerViewController _widgetHostViewController](self, "_widgetHostViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "snapshotView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[UIViewController view](self->_widgetViewController, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "snapshotView");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[SBHWidgetContainerViewController widgetContainerView](self, "widgetContainerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "screenTimeLockoutView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  SBLogWidgets();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    -[SBHWidgetContainerViewController _widgetExtensionBundleIdentifier](self, "_widgetExtensionBundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHWidgetContainerViewController _widgetHostViewController](self, "_widgetHostViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    SBHWidgetViewControllerSysdiagnoseDescription(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138543618;
    v21 = v11;
    v22 = 2114;
    v23 = v13;
    _os_log_impl(&dword_1CFEF3000, v10, OS_LOG_TYPE_DEFAULT, "SBHWidgetContainerViewController %{public}@ -- Snapshot view requested for widget: %{public}@", (uint8_t *)&v20, 0x16u);

  }
  if (v9)
  {
    objc_msgSend(v9, "snapshotView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", v14);

    SBLogWidgets();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      -[SBHWidgetContainerViewController _widgetExtensionBundleIdentifier](self, "_widgetExtensionBundleIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBHWidgetContainerViewController _widgetHostViewController](self, "_widgetHostViewController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      SBHWidgetViewControllerSysdiagnoseDescription(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543618;
      v21 = v16;
      v22 = 2114;
      v23 = v18;
      _os_log_impl(&dword_1CFEF3000, v15, OS_LOG_TYPE_DEFAULT, "SBHWidgetContainerViewController %{public}@ -- Snapshot view for screenTimeLockoutView was added to snapshotView's hierarchy: %{public}@", (uint8_t *)&v20, 0x16u);

    }
  }

  return v6;
}

- (id)cancelTouchesForCurrentEventInHostedContent
{
  UIViewController *v2;
  uint64_t v3;
  void *v4;

  v2 = self->_widgetViewController;
  if (-[UIViewController sbh_isMultiplexingViewController](v2, "sbh_isMultiplexingViewController"))
  {
    -[UIViewController multiplexedViewController](v2, "multiplexedViewController");
    v3 = objc_claimAutoreleasedReturnValue();

    v2 = (UIViewController *)v3;
  }
  if (-[UIViewController sbh_isWidgetHostViewController](v2, "sbh_isWidgetHostViewController")
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[UIViewController cancelTouchesForCurrentEventInHostedContent](v2, "cancelTouchesForCurrentEventInHostedContent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)widgetContextMenuController
{
  UIViewController *v2;
  uint64_t v3;
  UIViewController *v4;
  UIViewController *v5;
  UIViewController *v6;

  v2 = self->_widgetViewController;
  if (-[UIViewController sbh_isMultiplexingViewController](v2, "sbh_isMultiplexingViewController"))
  {
    -[UIViewController multiplexedViewController](v2, "multiplexedViewController");
    v3 = objc_claimAutoreleasedReturnValue();

    v2 = (UIViewController *)v3;
  }
  v4 = v2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  return v6;
}

- (BOOL)isPaused
{
  void *v2;
  char v3;

  -[SBHWidgetContainerViewController _widgetHostViewController](self, "_widgetHostViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "areAnimationsPaused");

  return v3;
}

- (void)setBlockedForScreenTimeExpiration:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  id v6;

  v3 = a3;
  if (a3)
    v5 = 2;
  else
    v5 = 0;
  -[SBHWidgetContainerViewController setPresentationMode:](self, "setPresentationMode:", v5);
  -[SBHWidgetContainerViewController widgetContainerView](self, "widgetContainerView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBlockedForScreenTimeExpiration:", v3);

}

- (BOOL)isBlockedForScreenTimeExpiration
{
  void *v2;
  char v3;

  -[SBHWidgetContainerViewController widgetContainerView](self, "widgetContainerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isBlockedForScreenTimeExpiration");

  return v3;
}

- (void)setAllowsEdgeAntialiasing:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  double v6;
  double v7;
  void *v8;
  id v9;

  v3 = a3;
  -[SBHWidgetContainerViewController traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayScale");
  v7 = v6;

  -[SBHWidgetContainerViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layer");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setAllowsEdgeAntialiasing:", v3);
  objc_msgSend(v9, "setRasterizationScale:", v7);

}

- (BOOL)allowsEdgeAntialiasing
{
  void *v2;
  void *v3;

  -[SBHWidgetContainerViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v3, "allowsEdgeAntialiasing");
  return (char)v2;
}

- (void)setPresentationMode:(unint64_t)a3
{
  uint64_t v3;
  id v4;

  if (a3 > 2)
    v3 = 0;
  else
    v3 = qword_1D0193E80[a3];
  -[SBHWidgetContainerViewController _widgetHostViewController](self, "_widgetHostViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPresentationMode:", v3);

}

- (unint64_t)presentationMode
{
  void *v2;
  uint64_t v3;
  unint64_t v4;

  -[SBHWidgetContainerViewController _widgetHostViewController](self, "_widgetHostViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "presentationMode");

  v4 = 1;
  if (v3 != 3)
    v4 = 2;
  if (v3 == 2)
    return 0;
  else
    return v4;
}

- (void)setRequiresClippingToBounds:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SBHWidgetContainerViewController widgetContainerView](self, "widgetContainerView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRequiresClippingToBounds:", v3);

}

- (void)setShowsSnapshotWhenDeactivated:(BOOL)a3
{
  if (self->_showsSnapshotWhenDeactivated != a3)
  {
    self->_showsSnapshotWhenDeactivated = a3;
    if (a3)
      -[SBHWidgetContainerViewController _addDeactivationSnapshotViewIfNecessary](self, "_addDeactivationSnapshotViewIfNecessary");
    else
      -[SBHWidgetContainerViewController _clearDeactivationSnapshotView](self, "_clearDeactivationSnapshotView");
  }
}

- (id)buildSnapshotResizeCoordinatorForSnapshotSize:(CGSize)a3 expectNewViewController:(BOOL)a4
{
  _BOOL8 v4;
  double height;
  double width;
  UIViewController *v8;
  _BOOL8 v9;
  SBHWidgetContainerViewSnapshotResizeCoordinator *v10;
  UIViewController *v11;
  void *v12;
  double v13;
  double v14;
  SBHWidgetContainerViewSnapshotResizeCoordinator *v15;
  void *v16;
  void *v17;

  v4 = a4;
  height = a3.height;
  width = a3.width;
  v8 = self->_widgetViewController;
  if (-[UIViewController sbh_isMultiplexingViewController](v8, "sbh_isMultiplexingViewController"))
  {
    if (self->_deactivationSnapshotView)
      v9 = height == self->_originalSize.height && width == self->_originalSize.width;
    else
      v9 = 0;
    self->_allowDeactivationSnapshotViewForActiveWidgetController = 1;
    v11 = v8;
    -[SBHWidgetContainerViewController setShowsSnapshotWhenDeactivated:](self, "setShowsSnapshotWhenDeactivated:", 1);
    -[SBHWidgetContainerViewController _addDeactivationSnapshotViewIfNecessary](self, "_addDeactivationSnapshotViewIfNecessary");
    -[SBHWidgetContainerViewController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bounds");
    -[SBHWidgetContainerViewController _setOriginalSize:](self, "_setOriginalSize:", v13, v14);
    v15 = [SBHWidgetContainerViewSnapshotResizeCoordinator alloc];
    -[SBHWidgetContainerViewController view](self, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController view](v11, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = -[SBHWidgetContainerViewSnapshotResizeCoordinator initWithResizableView:multiplexingView:newSize:hideMultiplexingViewInitially:showMultiplexingViewWhenFinished:](v15, "initWithResizableView:multiplexingView:newSize:hideMultiplexingViewInitially:showMultiplexingViewWhenFinished:", v16, v17, v4, v9, width, height);
    -[SBHWidgetContainerViewSnapshotResizeCoordinator setDelegate:](v10, "setDelegate:", self);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)setApproximateLayoutPosition:(SBIconApproximateLayoutPosition)a3
{
  unint64_t vertical;
  unint64_t horizontal;
  SBIconApproximateLayoutPosition *p_approximateLayoutPosition;
  UIViewController *v7;

  vertical = a3.vertical;
  horizontal = a3.horizontal;
  p_approximateLayoutPosition = &self->_approximateLayoutPosition;
  if (!SBIconApproximateLayoutPositionEqualToApproximateLayoutPosition(self->_approximateLayoutPosition.horizontal, self->_approximateLayoutPosition.vertical, a3.horizontal, a3.vertical))
  {
    p_approximateLayoutPosition->horizontal = horizontal;
    p_approximateLayoutPosition->vertical = vertical;
    v7 = self->_widgetViewController;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[UIViewController setApproximateLayoutPosition:](v7, "setApproximateLayoutPosition:", horizontal, vertical);

  }
}

- (void)setOverrideIconImageAppearance:(id)a3
{
  SBHIconImageAppearance *v4;
  SBHIconImageAppearance *overrideIconImageAppearance;
  id v6;

  v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    v4 = (SBHIconImageAppearance *)objc_msgSend(v6, "copy");
    overrideIconImageAppearance = self->_overrideIconImageAppearance;
    self->_overrideIconImageAppearance = v4;

    -[SBHWidgetContainerViewController _updateWidgetAccent](self, "_updateWidgetAccent");
  }

}

- (void)setOverrideIconImageStyleConfiguration:(id)a3
{
  SBHIconImageStyleConfiguration *v4;
  SBHIconImageStyleConfiguration *overrideIconImageStyleConfiguration;
  id v6;

  v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    v4 = (SBHIconImageStyleConfiguration *)objc_msgSend(v6, "copy");
    overrideIconImageStyleConfiguration = self->_overrideIconImageStyleConfiguration;
    self->_overrideIconImageStyleConfiguration = v4;

    -[SBHWidgetContainerViewController _updateWidgetAccent](self, "_updateWidgetAccent");
  }

}

- (id)effectiveIconImageAppearance
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  -[SBHWidgetContainerViewController overrideIconImageAppearance](self, "overrideIconImageAppearance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHWidgetContainerViewController overrideIconImageStyleConfiguration](self, "overrideIconImageStyleConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHWidgetContainerViewController traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceStyle");
  objc_msgSend(MEMORY[0x1E0DC3E88], "sbh_iconImageStyleConfigurationFromTraitCollection:overrideIconImageAppearance:overrideIconImageStyleConfiguration:", v5, v3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "widgetAppearanceWithUserInterfaceStyle:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)effectiveIconImageStyleConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[SBHWidgetContainerViewController overrideIconImageAppearance](self, "overrideIconImageAppearance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHWidgetContainerViewController overrideIconImageStyleConfiguration](self, "overrideIconImageStyleConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHWidgetContainerViewController traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3E88], "sbh_iconImageStyleConfigurationFromTraitCollection:overrideIconImageAppearance:overrideIconImageStyleConfiguration:", v5, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)wantsTintedAppearanceBackground
{
  void *v2;
  BOOL v3;

  -[SBHWidgetContainerViewController effectiveIconImageAppearance](self, "effectiveIconImageAppearance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "appearanceType") == 2;

  return v3;
}

- (void)updateStyleConfiguration
{
  id v2;

  -[SBHWidgetContainerViewController widgetStyleManager](self, "widgetStyleManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateConfiguration");

}

- (void)addObserver:(id)a3
{
  id v4;
  NSHashTable *observers;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  observers = self->_observers;
  v8 = v4;
  if (!observers)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v7 = self->_observers;
    self->_observers = v6;

    v4 = v8;
    observers = self->_observers;
  }
  -[NSHashTable addObject:](observers, "addObject:", v4);

}

- (void)removeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (void)enumerateObserversUsingBlock:(id)a3
{
  -[SBHWidgetContainerViewController enumerateObserversRespondingToSelector:usingBlock:](self, "enumerateObserversRespondingToSelector:usingBlock:", 0, a3);
}

- (void)enumerateObserversRespondingToSelector:(SEL)a3 usingBlock:(id)a4
{
  void (**v6)(id, void *);
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, void *))a4;
  -[SBHWidgetContainerViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!a3 || (objc_opt_respondsToSelector() & 1) != 0)
    v6[2](v6, v7);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v12);
        if (!a3 || (objc_opt_respondsToSelector() & 1) != 0)
          v6[2](v6, v13);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

}

- (void)multiplexingViewControllerDidActivate:(id)a3
{
  _QWORD v4[5];

  -[SBHWidgetContainerViewController setWidgetControllerActive:](self, "setWidgetControllerActive:", 1);
  -[SBHWidgetContainerViewController _clearDeactivationSnapshotView](self, "_clearDeactivationSnapshotView");
  -[SBHWidgetContainerViewController _updateWidgetVisibility](self, "_updateWidgetVisibility");
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __74__SBHWidgetContainerViewController_multiplexingViewControllerDidActivate___block_invoke;
  v4[3] = &unk_1E8D8D470;
  v4[4] = self;
  -[SBHWidgetContainerViewController enumerateObserversRespondingToSelector:usingBlock:](self, "enumerateObserversRespondingToSelector:usingBlock:", sel_widgetContainerViewControllerContentViewControllerDidActivate_, v4);
  -[SBHWidgetContainerViewController _monitorForWidgetReadiness](self, "_monitorForWidgetReadiness");
}

uint64_t __74__SBHWidgetContainerViewController_multiplexingViewControllerDidActivate___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "widgetContainerViewControllerContentViewControllerDidActivate:", *(_QWORD *)(a1 + 32));
}

- (void)multiplexingViewControllerWillDeactivate:(id)a3
{
  _QWORD v4[5];

  -[SBHWidgetContainerViewController setWidgetControllerActive:](self, "setWidgetControllerActive:", 0);
  -[SBHWidgetContainerViewController _addDeactivationSnapshotViewIfNecessary](self, "_addDeactivationSnapshotViewIfNecessary");
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __77__SBHWidgetContainerViewController_multiplexingViewControllerWillDeactivate___block_invoke;
  v4[3] = &unk_1E8D8D470;
  v4[4] = self;
  -[SBHWidgetContainerViewController enumerateObserversRespondingToSelector:usingBlock:](self, "enumerateObserversRespondingToSelector:usingBlock:", sel_widgetContainerViewControllerContentViewControllerWillDeactivate_, v4);
}

uint64_t __77__SBHWidgetContainerViewController_multiplexingViewControllerWillDeactivate___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "widgetContainerViewControllerContentViewControllerWillDeactivate:", *(_QWORD *)(a1 + 32));
}

- (void)widgetStyleManager:(id)a3 needsToAddBackgroundView:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[SBHWidgetContainerViewController view](self, "view");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundView:", v5);

}

- (void)widgetStyleManager:(id)a3 needsToRemoveBackgroundView:(id)a4
{
  id v4;

  -[SBHWidgetContainerViewController view](self, "view", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundView:", 0);

}

- (void)widgetStyleManager:(id)a3 needsToAddFilter:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a4;
  -[SBHWidgetContainerViewController view](self, "view");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "widgetView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "sbh_addFilter:", v5);
}

- (void)widgetStyleManager:(id)a3 needsToRemoveFilter:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a4;
  -[SBHWidgetContainerViewController view](self, "view");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "widgetView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "sbh_removeFilterWithName:", v8);
}

- (void)widgetStyleManagerDidUpdateConfiguration:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __77__SBHWidgetContainerViewController_widgetStyleManagerDidUpdateConfiguration___block_invoke;
  v3[3] = &unk_1E8D8D470;
  v3[4] = self;
  -[SBHWidgetContainerViewController enumerateObserversRespondingToSelector:usingBlock:](self, "enumerateObserversRespondingToSelector:usingBlock:", sel_widgetContainerViewControllerContentViewControllerDidUpdateStyleConfiguration_, v3);
}

uint64_t __77__SBHWidgetContainerViewController_widgetStyleManagerDidUpdateConfiguration___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "widgetContainerViewControllerContentViewControllerDidUpdateStyleConfiguration:", *(_QWORD *)(a1 + 32));
}

- (void)_setOriginalSize:(CGSize)a3
{
  if (self->_originalSize.width == *MEMORY[0x1E0C9D820]
    && self->_originalSize.height == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    self->_originalSize = a3;
  }
}

- (void)_monitorForWidgetReadiness
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  -[SBHWidgetContainerViewController _widgetHostViewController](self, "_widgetHostViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_initWeak(&location, self);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __62__SBHWidgetContainerViewController__monitorForWidgetReadiness__block_invoke;
    v4[3] = &unk_1E8D8D4C0;
    objc_copyWeak(&v5, &location);
    objc_msgSend(v3, "waitForContentReadyWithTimeout:completion:", v4, 3.0);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }

}

void __62__SBHWidgetContainerViewController__monitorForWidgetReadiness__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  id v4;
  _QWORD v5[5];
  char v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "setContentReady:", a2);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __62__SBHWidgetContainerViewController__monitorForWidgetReadiness__block_invoke_2;
    v5[3] = &unk_1E8D8D498;
    v5[4] = v4;
    v6 = a2;
    objc_msgSend(v4, "enumerateObserversRespondingToSelector:usingBlock:", sel_widgetContainerViewControllerInitialWidgetContentReadinessChanged_widgetContentIsReady_, v5);
    WeakRetained = v4;
  }

}

uint64_t __62__SBHWidgetContainerViewController__monitorForWidgetReadiness__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "widgetContainerViewControllerInitialWidgetContentReadinessChanged:widgetContentIsReady:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)_addDeactivationSnapshotViewIfNecessary
{
  _BOOL4 v3;
  BOOL v4;
  UIView *v5;
  UIView *deactivationSnapshotView;
  UIView *v7;
  void *v8;
  void *v9;
  id v10;

  -[SBHWidgetContainerViewController _widgetHostViewController](self, "_widgetHostViewController");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[SBHWidgetContainerViewController showsSnapshotWhenDeactivated](self, "showsSnapshotWhenDeactivated");
  if ((!-[SBHWidgetContainerViewController isWidgetControllerActive](self, "isWidgetControllerActive")
     || self->_allowDeactivationSnapshotViewForActiveWidgetController)
    && v3)
  {
    if (self->_deactivationSnapshotView)
      v4 = 1;
    else
      v4 = v10 == 0;
    if (!v4)
    {
      -[SBHWidgetContainerViewController snapshotView](self, "snapshotView");
      v5 = (UIView *)objc_claimAutoreleasedReturnValue();
      deactivationSnapshotView = self->_deactivationSnapshotView;
      self->_deactivationSnapshotView = v5;

      -[UIView setClipsToBounds:](self->_deactivationSnapshotView, "setClipsToBounds:", 1);
      v7 = self->_deactivationSnapshotView;
      -[SBHWidgetContainerViewController view](self, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "bounds");
      -[UIView setFrame:](v7, "setFrame:");

      -[UIView setAutoresizingMask:](self->_deactivationSnapshotView, "setAutoresizingMask:", 18);
      -[SBHWidgetContainerViewController view](self, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addSubview:", self->_deactivationSnapshotView);

      if (-[UIViewController sbh_isMultiplexingViewController](self->_widgetViewController, "sbh_isMultiplexingViewController"))
      {
        -[UIViewController setMultiplexedViewControllerShowsContentWhileDeactivated:](self->_widgetViewController, "setMultiplexedViewControllerShowsContentWhileDeactivated:", 1);
      }
    }
  }

}

- (void)_clearDeactivationSnapshotView
{
  UIView *deactivationSnapshotView;
  UIView *v4;

  deactivationSnapshotView = self->_deactivationSnapshotView;
  if (deactivationSnapshotView)
  {
    -[UIView removeFromSuperview](deactivationSnapshotView, "removeFromSuperview");
    v4 = self->_deactivationSnapshotView;
    self->_deactivationSnapshotView = 0;

  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)_widgetHostViewController
{
  void *v3;
  UIViewController *v4;
  UIViewController *v5;

  -[SBHWidgetContainerViewController _multiplexedViewController](self, "_multiplexedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "sbh_isWidgetHostViewController"))
    v4 = v3;
  else
    v4 = 0;
  if (-[UIViewController sbh_isWidgetHostViewController](self->_widgetViewController, "sbh_isWidgetHostViewController"))
  {
    v5 = self->_widgetViewController;

    v4 = v5;
  }

  return v4;
}

- (id)_multiplexedViewController
{
  void *v3;

  if (-[UIViewController sbh_isMultiplexingViewController](self->_widgetViewController, "sbh_isMultiplexingViewController"))
  {
    -[UIViewController multiplexedViewController](self->_widgetViewController, "multiplexedViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)_chsWidget
{
  void *v2;
  void *v3;

  -[SBHWidgetContainerViewController _widgetHostViewController](self, "_widgetHostViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "widget");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_widgetExtensionBundleIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[SBHWidgetContainerViewController _chsWidget](self, "_chsWidget");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "extensionIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "extensionBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_updateWidgetAccent
{
  void *v3;
  id v4;

  if (-[SBHWidgetContainerViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[SBHWidgetContainerViewController effectiveIconImageStyleConfiguration](self, "effectiveIconImageStyleConfiguration");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[SBHWidgetContainerViewController widgetStyleManager](self, "widgetStyleManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setImageStyleConfiguration:", v4);

  }
}

+ (id)buildGradientBackgroundViewWithFrame:(CGRect)a3 continuousCornerRadius:(double)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v16[3];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v16[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.133333333, 1.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0784313725, 1.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc((Class)getPUIGradientViewClass()), "initWithFrame:", x, y, width, height);
  objc_msgSend(v11, "setAutoresizingMask:", 18);
  objc_msgSend(v11, "_setContinuousCornerRadius:", a4);
  v12 = objc_retainAutorelease(v9);
  v16[0] = objc_msgSend(v12, "CGColor");
  v13 = objc_retainAutorelease(v10);
  v16[1] = objc_msgSend(v13, "CGColor");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setColors:locations:type:", v14, 0, *MEMORY[0x1E0CD2F48]);

  return v11;
}

- (NSString)description
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_widgetViewController, CFSTR("widgetViewController"));
  v5 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", self->_userVisibilityStatus, CFSTR("userVisibilityStatus"));
  -[SBHWidgetContainerViewController _chsWidget](self, "_chsWidget");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SBHWidgetContainerViewController _chsWidget](self, "_chsWidget");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "intentReference");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "intent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", objc_msgSend(v9, "_indexingHash"), CFSTR("intentIdentifier"));

    -[SBHWidgetContainerViewController _widgetHostViewController](self, "_widgetHostViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)objc_msgSend(v3, "appendPointer:withName:", v11, CFSTR("widgetHostViewController"));

  }
  objc_msgSend(v3, "build");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v13;
}

- (UIViewController)widgetViewController
{
  return self->_widgetViewController;
}

- (SBLeafIconDataSource)widgetDataSource
{
  return self->_widgetDataSource;
}

- (NSString)gridSizeClass
{
  return self->_gridSizeClass;
}

- (SBIconImageInfo)iconImageInfo
{
  return self;
}

- (NSString)applicationName
{
  return self->_applicationName;
}

- (SBHWidgetContainerViewControllerDelegate)delegate
{
  return (SBHWidgetContainerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)requiresClippingToBounds
{
  return self->_requiresClippingToBounds;
}

- (BOOL)showsSnapshotWhenDeactivated
{
  return self->_showsSnapshotWhenDeactivated;
}

- (SBIconApproximateLayoutPosition)approximateLayoutPosition
{
  SBIconApproximateLayoutPosition *p_approximateLayoutPosition;
  unint64_t horizontal;
  unint64_t vertical;
  SBIconApproximateLayoutPosition result;

  p_approximateLayoutPosition = &self->_approximateLayoutPosition;
  horizontal = self->_approximateLayoutPosition.horizontal;
  vertical = p_approximateLayoutPosition->vertical;
  result.vertical = vertical;
  result.horizontal = horizontal;
  return result;
}

- (BOOL)isContentReady
{
  return self->_contentReady;
}

- (void)setContentReady:(BOOL)a3
{
  self->_contentReady = a3;
}

- (SBHIconImageAppearance)overrideIconImageAppearance
{
  return self->_overrideIconImageAppearance;
}

- (SBHIconImageStyleConfiguration)overrideIconImageStyleConfiguration
{
  return self->_overrideIconImageStyleConfiguration;
}

- (UIView)deactivationSnapshotView
{
  return self->_deactivationSnapshotView;
}

- (void)setDeactivationSnapshotView:(id)a3
{
  objc_storeStrong((id *)&self->_deactivationSnapshotView, a3);
}

- (BOOL)isWidgetControllerActive
{
  return self->_widgetControllerActive;
}

- (void)setWidgetControllerActive:(BOOL)a3
{
  self->_widgetControllerActive = a3;
}

- (SBHWidgetStyleManager)widgetStyleManager
{
  return self->_widgetStyleManager;
}

- (void)setWidgetStyleManager:(id)a3
{
  objc_storeStrong((id *)&self->_widgetStyleManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetStyleManager, 0);
  objc_storeStrong((id *)&self->_deactivationSnapshotView, 0);
  objc_storeStrong((id *)&self->_overrideIconImageStyleConfiguration, 0);
  objc_storeStrong((id *)&self->_overrideIconImageAppearance, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_applicationName, 0);
  objc_storeStrong((id *)&self->_gridSizeClass, 0);
  objc_storeStrong((id *)&self->_widgetDataSource, 0);
  objc_storeStrong((id *)&self->_widgetViewController, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_appliedColorFilter, 0);
  objc_storeStrong((id *)&self->_accentedBackgroundView, 0);
}

@end
