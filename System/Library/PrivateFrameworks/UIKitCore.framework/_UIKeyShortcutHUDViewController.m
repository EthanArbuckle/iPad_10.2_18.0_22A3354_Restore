@implementation _UIKeyShortcutHUDViewController

- (_UIKeyShortcutHUDViewController)init
{
  _UIKeyShortcutHUDViewController *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIKeyShortcutHUDViewController;
  result = -[UIViewController init](&v3, sel_init);
  if (result)
    result->_hidden = 1;
  return result;
}

- (void)viewDidLoad
{
  UIView *hudContainerView;
  _OWORD v4[3];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIKeyShortcutHUDViewController;
  -[UIViewController viewDidLoad](&v5, sel_viewDidLoad);
  -[_UIKeyShortcutHUDViewController _setupMetrics](self, "_setupMetrics");
  -[_UIKeyShortcutHUDViewController _setupSubviews](self, "_setupSubviews");
  -[_UIKeyShortcutHUDViewController _setupLayout](self, "_setupLayout");
  -[_UIKeyShortcutHUDViewController _setupInitialDisplayedMenu](self, "_setupInitialDisplayedMenu");
  -[_UIKeyShortcutHUDViewController _setupCollectionViewManagement](self, "_setupCollectionViewManagement");
  -[_UIKeyShortcutHUDViewController _setupInitialViewState](self, "_setupInitialViewState");
  -[_UIKeyShortcutHUDViewController _setupHUDKeyCommands](self, "_setupHUDKeyCommands");
  hudContainerView = self->_hudContainerView;
  v4[0] = _UIKeyShortcutHUDAnimationShrunkTransform;
  v4[1] = unk_18667B180;
  v4[2] = xmmword_18667B190;
  -[UIView setTransform:](hudContainerView, "setTransform:", v4);
  -[UIView setAlpha:](self->_hudContainerView, "setAlpha:", 0.0);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  id v9[3];
  id location;
  objc_super v11;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_UIKeyShortcutHUDViewController;
  -[UIViewController viewWillTransitionToSize:withTransitionCoordinator:](&v11, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __86___UIKeyShortcutHUDViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E16C5248;
  objc_copyWeak(v9, &location);
  v8[4] = self;
  v9[1] = *(id *)&width;
  v9[2] = *(id *)&height;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, 0);
  objc_destroyWeak(v9);
  objc_destroyWeak(&location);

}

- (void)_setupMetrics
{
  void *v3;
  id WeakRetained;
  UIKeyShortcutHUDMetrics *v5;
  UIKeyShortcutHUDMetrics *metrics;
  NSObject *v7;
  UIKeyShortcutHUDMetrics *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  UIKeyShortcutHUDMetrics *v20;
  uint64_t v21;
  CGRect v22;

  v21 = *MEMORY[0x1E0C80C00];
  -[_UIKeyShortcutHUDViewController metricsProvider](self, "metricsProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_hudWindow);
  objc_msgSend(v3, "metricsForWindow:", WeakRetained);
  v5 = (UIKeyShortcutHUDMetrics *)objc_claimAutoreleasedReturnValue();
  metrics = self->_metrics;
  self->_metrics = v5;

  +[UIKeyShortcutHUDMetrics setCurrentMetrics:](UIKeyShortcutHUDMetrics, "setCurrentMetrics:", self->_metrics);
  _UIKeyShortcutHUDLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = self->_metrics;
    v19 = 138543362;
    v20 = v8;
    _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_DEFAULT, "HUD metrics: %{public}@", (uint8_t *)&v19, 0xCu);
  }

  v9 = objc_loadWeakRetained((id *)&self->_hudWindow);
  objc_msgSend(v9, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyShortcutHUDMetrics setTraitCollection:](self->_metrics, "setTraitCollection:", v10);

  -[_UIKeyShortcutHUDConfiguration clientTraits](self->_configuration, "clientTraits");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyShortcutHUDMetrics setClientTraits:](self->_metrics, "setClientTraits:", v11);

  v12 = objc_loadWeakRetained((id *)&self->_hudWindow);
  objc_msgSend(v12, "windowScene");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "coordinateSpace");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bounds");
  -[UIKeyShortcutHUDMetrics setAvailableVerticalSpace:](self->_metrics, "setAvailableVerticalSpace:", CGRectGetHeight(v22));

  -[UIKeyShortcutHUDMetrics computeOneTimeMetrics](self->_metrics, "computeOneTimeMetrics");
  v15 = (void *)objc_opt_new();
  objc_msgSend(v15, "setHidden:", 1);
  -[UIViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addSubview:", v15);

  -[UIKeyShortcutHUDMetrics setSelfSizingPlayground:](self->_metrics, "setSelfSizingPlayground:", v15);
  -[_UIKeyShortcutHUDConfiguration model](self->_configuration, "model");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "menu");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyShortcutHUDMetrics setBaseMenu:](self->_metrics, "setBaseMenu:", v18);

}

- (void)_setupInitialDisplayedMenu
{
  -[_UIKeyShortcutHUDViewController _updateDisplayedMenuForCurrentHeldModifierFlagsAnimated:](self, "_updateDisplayedMenuForCurrentHeldModifierFlagsAnimated:", 0);
}

- (void)_setupSubviews
{
  UIView *v3;
  UIView *hudContainerView;
  double v5;
  float v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  _UIKeyShortcutHUDMenuViewController *v16;
  _UIKeyShortcutHUDMenuViewController *menuVC;
  void *v18;
  UIView *v19;
  void *v20;
  _UIKeyShortcutHUDToolbarViewController *v21;
  _UIKeyShortcutHUDToolbarViewController *toolbarVC;
  void *v23;
  void *v24;
  void *v25;
  UIView *v26;
  void *v27;

  v3 = (UIView *)objc_opt_new();
  hudContainerView = self->_hudContainerView;
  self->_hudContainerView = v3;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_hudContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIKeyShortcutHUDMetrics platterShadowOpacity](self->_metrics, "platterShadowOpacity");
  v6 = v5;
  -[UIView layer](self->_hudContainerView, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v8 = v6;
  objc_msgSend(v7, "setShadowOpacity:", v8);

  -[UIKeyShortcutHUDMetrics platterShadowRadius](self->_metrics, "platterShadowRadius");
  v10 = v9;
  -[UIView layer](self->_hudContainerView, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setShadowRadius:", v10);

  v12 = *MEMORY[0x1E0C9D820];
  v13 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  -[UIView layer](self->_hudContainerView, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setShadowOffset:", v12, v13);

  -[UIViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addSubview:", self->_hudContainerView);

  v16 = (_UIKeyShortcutHUDMenuViewController *)objc_opt_new();
  menuVC = self->_menuVC;
  self->_menuVC = v16;

  -[_UIKeyShortcutHUDMenuViewController setMetrics:](self->_menuVC, "setMetrics:", self->_metrics);
  -[_UIKeyShortcutHUDMenuViewController setDelegate:](self->_menuVC, "setDelegate:", self);
  -[UIViewController view](self->_menuVC, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v19 = self->_hudContainerView;
  -[UIViewController view](self->_menuVC, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView addSubview:](v19, "addSubview:", v20);

  -[UIViewController addChildViewController:](self, "addChildViewController:", self->_menuVC);
  -[UIViewController didMoveToParentViewController:](self->_menuVC, "didMoveToParentViewController:", self);
  v21 = (_UIKeyShortcutHUDToolbarViewController *)objc_opt_new();
  toolbarVC = self->_toolbarVC;
  self->_toolbarVC = v21;

  -[_UIKeyShortcutHUDConfiguration model](self->_configuration, "model");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "menu");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIKeyShortcutHUDToolbarViewController setMenu:](self->_toolbarVC, "setMenu:", v24);

  -[_UIKeyShortcutHUDToolbarViewController setMetrics:](self->_toolbarVC, "setMetrics:", self->_metrics);
  -[_UIKeyShortcutHUDToolbarViewController setDelegate:](self->_toolbarVC, "setDelegate:", self);
  -[UIViewController view](self->_toolbarVC, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v26 = self->_hudContainerView;
  -[UIViewController view](self->_toolbarVC, "view");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView addSubview:](v26, "addSubview:", v27);

  -[UIViewController addChildViewController:](self, "addChildViewController:", self->_toolbarVC);
  -[UIViewController didMoveToParentViewController:](self->_toolbarVC, "didMoveToParentViewController:", self);
}

- (void)_setupLayout
{
  void *v3;
  void *v4;
  void *v5;
  NSLayoutConstraint *v6;
  NSLayoutConstraint *hudContainerTopEdgeConstraint;
  void *v8;
  void *v9;
  void *v10;
  NSLayoutConstraint *v11;
  NSLayoutConstraint *hudContainerLeadingEdgeConstraint;
  void *v13;
  void *v14;
  void *v15;
  NSLayoutConstraint *v16;
  NSLayoutConstraint *hudContainerTrailingEdgeConstraint;
  void *v18;
  void *v19;
  void *v20;
  NSLayoutConstraint *v21;
  NSLayoutConstraint *hudContainerBottomEdgeConstraint;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSLayoutConstraint *v27;
  NSLayoutConstraint *hudContainerBottomSafeAreaEdgeConstraint;
  double v29;
  void *v30;
  NSLayoutConstraint *v31;
  NSLayoutConstraint *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSLayoutConstraint *v40;
  NSLayoutConstraint *menuPreferredWidthConstraint;
  void *v42;
  void *v43;
  NSLayoutConstraint *v44;
  NSLayoutConstraint *menuPreferredHeightConstraint;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  NSLayoutConstraint *v50;
  NSLayoutConstraint *menuToolbarSpacingConstraint;
  void *v52;
  void *v53;
  NSLayoutConstraint *v54;
  NSLayoutConstraint *toolbarPreferredWidthConstraint;
  NSLayoutConstraint *v56;
  NSLayoutConstraint *v57;
  NSLayoutConstraint *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  _QWORD v90[11];
  _QWORD v91[7];

  v91[5] = *MEMORY[0x1E0C80C00];
  -[UIView topAnchor](self->_hudContainerView, "topAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyShortcutHUDMetrics minimumScreenEdgeDistance](self->_metrics, "minimumScreenEdgeDistance");
  objc_msgSend(v3, "constraintGreaterThanOrEqualToAnchor:constant:", v5);
  v6 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  hudContainerTopEdgeConstraint = self->_hudContainerTopEdgeConstraint;
  self->_hudContainerTopEdgeConstraint = v6;

  -[UIView leadingAnchor](self->_hudContainerView, "leadingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "leadingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyShortcutHUDMetrics minimumScreenEdgeDistance](self->_metrics, "minimumScreenEdgeDistance");
  objc_msgSend(v8, "constraintGreaterThanOrEqualToAnchor:constant:", v10);
  v11 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  hudContainerLeadingEdgeConstraint = self->_hudContainerLeadingEdgeConstraint;
  self->_hudContainerLeadingEdgeConstraint = v11;

  -[UIViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "trailingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](self->_hudContainerView, "trailingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyShortcutHUDMetrics minimumScreenEdgeDistance](self->_metrics, "minimumScreenEdgeDistance");
  objc_msgSend(v14, "constraintGreaterThanOrEqualToAnchor:constant:", v15);
  v16 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  hudContainerTrailingEdgeConstraint = self->_hudContainerTrailingEdgeConstraint;
  self->_hudContainerTrailingEdgeConstraint = v16;

  -[UIViewController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bottomAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](self->_hudContainerView, "bottomAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyShortcutHUDMetrics minimumBottomScreenEdgeDistance](self->_metrics, "minimumBottomScreenEdgeDistance");
  objc_msgSend(v19, "constraintGreaterThanOrEqualToAnchor:constant:", v20);
  v21 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  hudContainerBottomEdgeConstraint = self->_hudContainerBottomEdgeConstraint;
  self->_hudContainerBottomEdgeConstraint = v21;

  -[UIViewController view](self, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "safeAreaLayoutGuide");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "bottomAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](self->_hudContainerView, "bottomAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v26);
  v27 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  hudContainerBottomSafeAreaEdgeConstraint = self->_hudContainerBottomSafeAreaEdgeConstraint;
  self->_hudContainerBottomSafeAreaEdgeConstraint = v27;

  LODWORD(v29) = 1144750080;
  -[NSLayoutConstraint setPriority:](self->_hudContainerBottomSafeAreaEdgeConstraint, "setPriority:", v29);
  v30 = (void *)MEMORY[0x1E0D156E0];
  v31 = self->_hudContainerLeadingEdgeConstraint;
  v91[0] = self->_hudContainerTopEdgeConstraint;
  v91[1] = v31;
  v32 = self->_hudContainerBottomEdgeConstraint;
  v91[2] = self->_hudContainerTrailingEdgeConstraint;
  v91[3] = v32;
  -[UIView centerXAnchor](self->_hudContainerView, "centerXAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController view](self, "view");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "centerXAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v91[4] = v36;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v91, 5);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "activateConstraints:", v37);

  if (!-[UIKeyShortcutHUDMetrics shouldExtendToolbarThroughSafeArea](self->_metrics, "shouldExtendToolbarThroughSafeArea"))-[NSLayoutConstraint setActive:](self->_hudContainerBottomSafeAreaEdgeConstraint, "setActive:", 1);
  -[UIViewController view](self->_menuVC, "view");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "widthAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyShortcutHUDMetrics standardHUDWidth](self->_metrics, "standardHUDWidth");
  objc_msgSend(v39, "constraintEqualToConstant:");
  v40 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  menuPreferredWidthConstraint = self->_menuPreferredWidthConstraint;
  self->_menuPreferredWidthConstraint = v40;

  -[UIViewController view](self->_menuVC, "view");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "heightAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyShortcutHUDMetrics standardMenuPanelHeight](self->_metrics, "standardMenuPanelHeight");
  objc_msgSend(v43, "constraintEqualToConstant:");
  v44 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  menuPreferredHeightConstraint = self->_menuPreferredHeightConstraint;
  self->_menuPreferredHeightConstraint = v44;

  -[UIViewController view](self->_toolbarVC, "view");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "topAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController view](self->_menuVC, "view");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "bottomAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyShortcutHUDMetrics standardMenuToolbarSpacing](self->_metrics, "standardMenuToolbarSpacing");
  objc_msgSend(v47, "constraintEqualToAnchor:constant:", v49);
  v50 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  menuToolbarSpacingConstraint = self->_menuToolbarSpacingConstraint;
  self->_menuToolbarSpacingConstraint = v50;

  -[UIViewController view](self->_toolbarVC, "view");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "widthAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyShortcutHUDMetrics standardHUDWidth](self->_metrics, "standardHUDWidth");
  objc_msgSend(v53, "constraintEqualToConstant:");
  v54 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  toolbarPreferredWidthConstraint = self->_toolbarPreferredWidthConstraint;
  self->_toolbarPreferredWidthConstraint = v54;

  v76 = (void *)MEMORY[0x1E0D156E0];
  -[UIViewController view](self->_menuVC, "view");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "topAnchor");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView topAnchor](self->_hudContainerView, "topAnchor");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "constraintEqualToAnchor:", v87);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v90[0] = v86;
  -[UIViewController view](self->_menuVC, "view");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "leadingAnchor");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self->_hudContainerView, "leadingAnchor");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "constraintEqualToAnchor:", v83);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v90[1] = v82;
  -[UIViewController view](self->_menuVC, "view");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "trailingAnchor");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](self->_hudContainerView, "trailingAnchor");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "constraintEqualToAnchor:", v78);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = self->_menuPreferredWidthConstraint;
  v90[2] = v77;
  v90[3] = v56;
  v57 = self->_menuToolbarSpacingConstraint;
  v90[4] = self->_menuPreferredHeightConstraint;
  v90[5] = v57;
  -[UIViewController view](self->_toolbarVC, "view");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "centerXAnchor");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerXAnchor](self->_hudContainerView, "centerXAnchor");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "constraintEqualToAnchor:", v74);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v90[6] = v73;
  -[UIViewController view](self->_toolbarVC, "view");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "bottomAnchor");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](self->_hudContainerView, "bottomAnchor");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "constraintEqualToAnchor:", v70);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = self->_toolbarPreferredWidthConstraint;
  v90[7] = v69;
  v90[8] = v58;
  -[UIViewController view](self->_toolbarVC, "view");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "widthAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView widthAnchor](self->_hudContainerView, "widthAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "constraintLessThanOrEqualToAnchor:", v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v90[9] = v62;
  -[UIView safeAreaLayoutGuide](self->_hudContainerView, "safeAreaLayoutGuide");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "bottomAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController view](self->_toolbarVC, "view");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "topAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyShortcutHUDMetrics standardToolbarContentHeight](self->_metrics, "standardToolbarContentHeight");
  objc_msgSend(v64, "constraintEqualToAnchor:constant:", v66);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v90[10] = v67;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v90, 11);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "activateConstraints:", v68);

}

- (void)_setupCollectionViewManagement
{
  _UIKeyShortcutHUDCollectionViewManager *v3;
  _UIKeyShortcutHUDCollectionViewManager *collectionViewManager;
  void *v5;

  v3 = (_UIKeyShortcutHUDCollectionViewManager *)objc_opt_new();
  collectionViewManager = self->_collectionViewManager;
  self->_collectionViewManager = v3;

  -[_UIKeyShortcutHUDCollectionViewManager setHudVC:](self->_collectionViewManager, "setHudVC:", self);
  -[_UIKeyShortcutHUDCollectionViewManager setMenu:](self->_collectionViewManager, "setMenu:", self->_menuVC);
  -[_UIKeyShortcutHUDCollectionViewManager setToolbar:](self->_collectionViewManager, "setToolbar:", self->_toolbarVC);
  -[_UIKeyShortcutHUDToolbarViewController searchButton](self->_toolbarVC, "searchButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIKeyShortcutHUDCollectionViewManager setSearchButton:](self->_collectionViewManager, "setSearchButton:", v5);

  -[_UIKeyShortcutHUDMenuViewController setCollectionViewManager:](self->_menuVC, "setCollectionViewManager:", self->_collectionViewManager);
  -[_UIKeyShortcutHUDToolbarViewController setCollectionViewManager:](self->_toolbarVC, "setCollectionViewManager:", self->_collectionViewManager);
  +[_UIKeyShortcutHUDUtilities setCurrentHUDCollectionViewManager:]((uint64_t)_UIKeyShortcutHUDUtilities, self->_collectionViewManager);
}

- (void)_setupInitialViewState
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[_UIKeyShortcutHUDConfiguration model](self->_configuration, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "menu");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "children");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[_UIKeyShortcutHUDToolbarViewController selectCategory:withCategoryIndex:](self->_toolbarVC, "selectCategory:withCategoryIndex:", v6, 0);
  if (-[_UIKeyShortcutHUDConfiguration isSearching](self->_configuration, "isSearching"))
  {
    -[_UIKeyShortcutHUDViewController _setSearching:animated:](self, "_setSearching:animated:", 1, 0);
    -[_UIKeyShortcutHUDViewController setHudPresentedIntoSearchMode:](self, "setHudPresentedIntoSearchMode:", 1);
  }
  -[UIViewController setNeedsFocusUpdate](self, "setNeedsFocusUpdate");

}

- (void)_setupHUDKeyCommands
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  NSMutableDictionary *v14;
  NSMutableDictionary *hudToModelKeyCommandsMap;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  _UIKeyShortcutHUDViewController *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id WeakRetained;
  void *v31;
  void *v32;
  id obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", CFSTR("UIKeyInputEscape"), 0, sel_handleEscapeKeyCommand_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_nonRepeatableKeyCommand");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "_setEnumerationPriority:", 0);
  objc_msgSend(v5, "setAttributes:", 4);
  v32 = v5;
  objc_msgSend(v3, "addObject:", v5);
  +[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", CFSTR("?"), 0x100000, sel_showHelp_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_nonRepeatableKeyCommand");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setAttributes:", 4);
  v31 = v7;
  objc_msgSend(v3, "addObject:", v7);
  -[_UIKeyShortcutHUDViewController configuration](self, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clientTraits");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isSystemApp");

  if (v10)
  {
    +[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", CFSTR("m"), 0x800000, sel_handleShowShortcutsKeyCommand_);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_allowGlobeModifierKeyCommand");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_nonRepeatableKeyCommand");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "setAttributes:", 4);
    objc_msgSend(v3, "addObject:", v13);
    objc_storeWeak((id *)&self->_showShortcutsKeyCommand, v13);

  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v14 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  hudToModelKeyCommandsMap = self->_hudToModelKeyCommandsMap;
  self->_hudToModelKeyCommandsMap = v14;

  -[_UIKeyShortcutHUDConfiguration model](self->_configuration, "model");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "modelKeyCommandsExcludingHUDCommands:", v3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v17;
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        v22 = self;
        v23 = v3;
        if (*(_QWORD *)v35 != v20)
          objc_enumerationMutation(obj);
        v24 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(v24, "_keyCodes");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25)
        {
          objc_msgSend(v24, "_keyCodes");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          +[UIKeyCommand keyCommandWithKeyCodes:modifierFlags:action:](UIKeyCommand, "keyCommandWithKeyCodes:modifierFlags:action:", v26, objc_msgSend(v24, "modifierFlags"), sel_handleModelKeyCommand_);
        }
        else
        {
          objc_msgSend(v24, "input");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          +[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", v26, objc_msgSend(v24, "modifierFlags"), sel_handleModelKeyCommand_);
        }
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v27, "_nonRepeatableKeyCommand");
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v28, "setWantsPriorityOverSystemBehavior:", 0);
        objc_msgSend(v28, "setAllowsAutomaticLocalization:", objc_msgSend(v24, "allowsAutomaticMirroring"));
        objc_msgSend(v28, "setAllowsAutomaticMirroring:", objc_msgSend(v24, "allowsAutomaticMirroring"));
        objc_msgSend(v28, "_allowGlobeModifierKeyCommand");
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        self = v22;
        -[NSMutableDictionary setObject:forKeyedSubscript:](v22->_hudToModelKeyCommandsMap, "setObject:forKeyedSubscript:", v24, v29);
        v3 = v23;
        objc_msgSend(v23, "addObject:", v29);

      }
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v19);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_hudWindow);
  objc_msgSend(WeakRetained, "setHudKeyCommands:", v3);

}

- (void)setupPassthroughScrollInteraction
{
  _UIPassthroughScrollInteraction *v3;
  _UIPassthroughScrollInteraction *passthroughScrollInteraction;
  id v5;

  v3 = objc_alloc_init(_UIPassthroughScrollInteraction);
  passthroughScrollInteraction = self->_passthroughScrollInteraction;
  self->_passthroughScrollInteraction = v3;

  -[_UIPassthroughScrollInteraction setDelegate:](self->_passthroughScrollInteraction, "setDelegate:", self);
  -[UIViewController view](self, "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addInteraction:", self->_passthroughScrollInteraction);

}

- (void)setHidden:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  id v6;
  UIViewPropertyAnimator *v7;
  UIViewPropertyAnimator *hudAppearanceAnimator;
  UIViewPropertyAnimator *v9;
  uint64_t v10;
  UIViewPropertyAnimator *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id v17;
  BOOL v18;
  _QWORD v19[4];
  id v20;
  BOOL v21;
  id location;

  v4 = a3;
  v6 = a4;
  if (self->_hidden != v4)
  {
    self->_hidden = v4;
    -[_UIKeyShortcutHUDViewController _stopInFlightAnimationsForAnimator:endPosition:](self, "_stopInFlightAnimationsForAnimator:endPosition:", self->_hudAppearanceAnimator, 2);
    -[_UIKeyShortcutHUDViewController _defaultHUDAppearanceAnimatorForHidden:](self, "_defaultHUDAppearanceAnimatorForHidden:", v4);
    v7 = (UIViewPropertyAnimator *)objc_claimAutoreleasedReturnValue();
    hudAppearanceAnimator = self->_hudAppearanceAnimator;
    self->_hudAppearanceAnimator = v7;

    -[_UIKeyShortcutHUDViewController _hudWillBecomeHidden:](self, "_hudWillBecomeHidden:", v4);
    -[_UIKeyShortcutHUDMenuViewController hudWillBecomeHidden:](self->_menuVC, "hudWillBecomeHidden:", v4);
    -[_UIKeyShortcutHUDToolbarViewController hudWillBecomeHidden:](self->_toolbarVC, "hudWillBecomeHidden:", v4);
    if (v4)
      self->_completelyPresented = 0;
    objc_initWeak(&location, self);
    v9 = self->_hudAppearanceAnimator;
    v10 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __63___UIKeyShortcutHUDViewController_setHidden_completionHandler___block_invoke;
    v19[3] = &unk_1E16BFC68;
    objc_copyWeak(&v20, &location);
    v21 = v4;
    -[UIViewPropertyAnimator addAnimations:](v9, "addAnimations:", v19);
    v11 = self->_hudAppearanceAnimator;
    v12 = v10;
    v13 = 3221225472;
    v14 = __63___UIKeyShortcutHUDViewController_setHidden_completionHandler___block_invoke_2;
    v15 = &unk_1E16C5270;
    objc_copyWeak(&v17, &location);
    v18 = v4;
    v16 = v6;
    -[UIViewPropertyAnimator addCompletion:](v11, "addCompletion:", &v12);
    -[UIViewPropertyAnimator startAnimation](self->_hudAppearanceAnimator, "startAnimation", v12, v13, v14, v15);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

}

- (void)_hudWillBecomeHidden:(BOOL)a3
{
  void *v4;
  id v5;

  if (a3)
  {
    -[UIViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setUserInteractionEnabled:", 0);

    -[_UIKeyShortcutHUDViewController hudContainerView](self, "hudContainerView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setSafeAreaInsetsFrozen:", 1);

  }
}

- (BOOL)shouldDismissHUDForModifierKeyTap
{
  void *v2;
  char v3;

  -[_UIKeyShortcutHUDToolbarViewController searchBar](self->_toolbarVC, "searchBar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEditing") ^ 1;

  return v3;
}

- (BOOL)passthroughScrollInteraction:(id)a3 shouldInteractAtLocation:(CGPoint)a4 withEvent:(id)a5
{
  double y;
  double x;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  BOOL v13;

  y = a4.y;
  x = a4.x;
  v8 = a5;
  -[UIViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hitTest:withEvent:", v8, x, y);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    v12 = v10 == v11;
  else
    v12 = 1;
  v13 = v12;

  return v13;
}

- (BOOL)passthroughScrollInteractionDidRecognize:(id)a3
{
  NSObject *v4;
  void *v5;
  uint8_t v7[16];

  _UIKeyShortcutHUDLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_DEFAULT, "Dismissing HUD due to interaction outside HUD", v7, 2u);
  }

  -[_UIKeyShortcutHUDViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keyShortcutHUDViewControllerDidRequestDismissal:", self);

  return 1;
}

- (void)handleEscapeKeyCommand:(id)a3
{
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  if (-[_UIKeyShortcutHUDViewController isSearching](self, "isSearching", a3)
    && !-[_UIKeyShortcutHUDViewController isHUDPresentedIntoSearchMode](self, "isHUDPresentedIntoSearchMode"))
  {
    -[_UIKeyShortcutHUDViewController _setSearching:animated:](self, "_setSearching:animated:", 0, 1);
  }
  else
  {
    _UIKeyShortcutHUDLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_DEFAULT, "Dismissing HUD due to esc key command", v6, 2u);
    }

    -[_UIKeyShortcutHUDViewController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "keyShortcutHUDViewControllerDidRequestDismissal:", self);

  }
}

- (void)showHelp:(id)a3
{
  -[_UIKeyShortcutHUDViewController _setSearching:animated:](self, "_setSearching:animated:", 1, 1);
}

- (void)handleShowShortcutsKeyCommand:(id)a3
{
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  if (-[_UIKeyShortcutHUDViewController isSearching](self, "isSearching", a3))
  {
    -[_UIKeyShortcutHUDViewController _setSearching:animated:](self, "_setSearching:animated:", 0, 1);
  }
  else
  {
    _UIKeyShortcutHUDLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_DEFAULT, "Dismissing HUD due to hitting Globe-M key command", v6, 2u);
    }

    -[_UIKeyShortcutHUDViewController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "keyShortcutHUDViewControllerDidRequestDismissal:", self);

  }
}

- (void)handleModelKeyCommand:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id WeakRetained;
  _UIKeyShortcutHUDMenuViewController *menuVC;
  id v10;
  _QWORD v11[5];
  id v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_hudToModelKeyCommandsMap, "objectForKeyedSubscript:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[_UIKeyShortcutHUDConfiguration model](self->_configuration, "model");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "modelShortcutForModelKeyCommand:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[UIViewController view](self, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setUserInteractionEnabled:", 0);

      WeakRetained = objc_loadWeakRetained((id *)&self->_hudWindow);
      objc_msgSend(WeakRetained, "setHudKeyCommands:", 0);

      menuVC = self->_menuVC;
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __57___UIKeyShortcutHUDViewController_handleModelKeyCommand___block_invoke;
      v11[3] = &unk_1E16C5298;
      v11[4] = self;
      v12 = v6;
      v10 = v6;
      -[_UIKeyShortcutHUDMenuViewController flashShortcutIfVisible:completionHandler:](menuVC, "flashShortcutIfVisible:completionHandler:", v10, v11);

    }
  }

}

- (void)setDisplayedMenu:(id)a3
{
  -[_UIKeyShortcutHUDViewController _setDisplayedMenu:animated:](self, "_setDisplayedMenu:animated:", a3, 0);
}

- (void)_setDisplayedMenu:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  UIKeyShortcutHUDMetrics *metrics;
  id v7;

  v4 = a4;
  metrics = self->_metrics;
  v7 = a3;
  -[UIKeyShortcutHUDMetrics setDisplayedMenu:searching:](metrics, "setDisplayedMenu:searching:", v7, -[_UIKeyShortcutHUDViewController isSearching](self, "isSearching"));
  -[_UIKeyShortcutHUDMenuViewController setMenu:animated:](self->_menuVC, "setMenu:animated:", v7, v4);

}

- (id)preferredFocusEnvironments
{
  return -[_UIKeyShortcutHUDCollectionViewManager preferredFocusEnvironments](self->_collectionViewManager, "preferredFocusEnvironments");
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  -[_UIKeyShortcutHUDCollectionViewManager didUpdateFocusInContext:withAnimationCoordinator:](self->_collectionViewManager, "didUpdateFocusInContext:withAnimationCoordinator:", a3, a4);
}

- (void)_focusTopSearchResultWithDelay:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  dispatch_time_t v7;
  _QWORD v8[4];
  id v9;
  _QWORD aBlock[5];

  v4 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __66___UIKeyShortcutHUDViewController__focusTopSearchResultWithDelay___block_invoke;
  aBlock[3] = &unk_1E16B1B28;
  aBlock[4] = self;
  v5 = _Block_copy(aBlock);
  v6 = v5;
  if (a3)
  {
    v7 = dispatch_time(0, 50000000);
    v8[0] = v4;
    v8[1] = 3221225472;
    v8[2] = __66___UIKeyShortcutHUDViewController__focusTopSearchResultWithDelay___block_invoke_2;
    v8[3] = &unk_1E16B1BF8;
    v9 = v6;
    dispatch_after(v7, MEMORY[0x1E0C80D38], v8);

  }
  else
  {
    (*((void (**)(void *))v5 + 2))(v5);
  }

}

- (void)setHeldModifierFlags:(int64_t)a3
{
  void *v4;
  int v5;

  if (self->_heldModifierFlags != a3)
  {
    self->_heldModifierFlags = a3;
    if (-[UIViewController isViewLoaded](self, "isViewLoaded"))
    {
      -[UIViewController view](self, "view");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "isUserInteractionEnabled");

      if (v5)
        -[_UIKeyShortcutHUDViewController _updateDisplayedMenuForCurrentHeldModifierFlagsAnimated:](self, "_updateDisplayedMenuForCurrentHeldModifierFlagsAnimated:", 0);
    }
  }
}

- (void)_updateDisplayedMenuForCurrentHeldModifierFlagsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  if (!-[_UIKeyShortcutHUDViewController isSearching](self, "isSearching"))
  {
    -[_UIKeyShortcutHUDConfiguration model](self->_configuration, "model");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "menuWithAlternatesForModifierFlags:", self->_heldModifierFlags);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIKeyShortcutHUDViewController _setDisplayedMenu:animated:](self, "_setDisplayedMenu:animated:", v5, v3);

  }
}

- (void)_setSearching:(BOOL)a3 animated:(BOOL)a4
{
  -[_UIKeyShortcutHUDViewController _setSearching:animated:initialSearchText:](self, "_setSearching:animated:initialSearchText:", a3, a4, &stru_1E16EDF20);
}

- (void)_setSearching:(BOOL)a3 animated:(BOOL)a4 initialSearchText:(id)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  id v8;
  void *v9;
  double v10;
  double v11;
  BOOL v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  id v17;
  void (**v18)(_QWORD);
  void *v19;
  void *v20;
  UIKeyShortcutHUDMetrics *metrics;
  void *v22;
  UIViewPropertyAnimator *v23;
  UIViewPropertyAnimator *menuPanelAnimator;
  UIViewPropertyAnimator *v25;
  UIViewPropertyAnimator *v26;
  UIViewPropertyAnimator *v27;
  UIViewPropertyAnimator *searchTransitionAnimator;
  UIViewPropertyAnimator *v29;
  UIViewPropertyAnimator *v30;
  id v31;
  void *v32;
  id *v33;
  id *v34;
  id *v35;
  id *v36;
  void (**v37)(void);
  id v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[4];
  void (**v42)(_QWORD);
  _QWORD v43[4];
  id v44;
  _QWORD v45[4];
  void (**v46)(void);
  _QWORD v47[4];
  id v48;
  _QWORD v49[4];
  id v50;
  BOOL v51;
  char v52;
  _QWORD v53[4];
  id v54;
  _UIKeyShortcutHUDViewController *v55;
  id v56;
  BOOL v57;
  char v58;
  BOOL v59;
  BOOL v60;
  _QWORD aBlock[4];
  id v62;
  BOOL v63;
  char v64;
  id location[2];

  v5 = a4;
  v6 = a3;
  v8 = a5;
  if (self->_searching == v6)
  {
    -[_UIKeyShortcutHUDMenuViewController prepareForSearchTransition:](self->_menuVC, "prepareForSearchTransition:", v6);
    -[_UIKeyShortcutHUDToolbarViewController prepareForSearchTransition:](self->_toolbarVC, "prepareForSearchTransition:", v6);
    -[_UIKeyShortcutHUDMenuViewController setSearching:](self->_menuVC, "setSearching:", v6);
    -[_UIKeyShortcutHUDToolbarViewController setSearching:](self->_toolbarVC, "setSearching:", v6);
    -[_UIKeyShortcutHUDMenuViewController didCompleteSearchTransition](self->_menuVC, "didCompleteSearchTransition");
    -[_UIKeyShortcutHUDToolbarViewController didCompleteSearchTransition](self->_toolbarVC, "didCompleteSearchTransition");
  }
  else
  {
    self->_searching = v6;
    if (!v6)
      -[_UIKeyShortcutHUDViewController setHudPresentedIntoSearchMode:](self, "setHudPresentedIntoSearchMode:", 0);
    v38 = v8;
    -[_UIKeyShortcutHUDViewController _stopInFlightAnimationsForAnimator:endPosition:](self, "_stopInFlightAnimationsForAnimator:endPosition:", self->_menuPanelAnimator, 2);
    -[_UIKeyShortcutHUDViewController _stopInFlightAnimationsForAnimator:endPosition:](self, "_stopInFlightAnimationsForAnimator:endPosition:", self->_searchTransitionAnimator, 0);
    -[_UIKeyShortcutHUDMenuViewController prepareForSearchTransition:](self->_menuVC, "prepareForSearchTransition:", v6);
    -[_UIKeyShortcutHUDToolbarViewController prepareForSearchTransition:](self->_toolbarVC, "prepareForSearchTransition:", v6);
    objc_initWeak(location, self);
    -[UIViewController view](self->_menuVC, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "alpha");
    v11 = v10;
    v12 = v10 > 0.0;

    -[_UIKeyShortcutHUDConfiguration model](self->_configuration, "model");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "searchMenuWithSearchText:maxSearchResultEntries:", v38, -[UIKeyShortcutHUDMetrics maxNumberOfCellsInSearchResults](self->_metrics, "maxNumberOfCellsInSearchResults"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = 0;
    if (v6 && v14)
    {
      if ((objc_msgSend(v14, "isEmpty") & 1) != 0)
      {
        v15 = 0;
      }
      else
      {
        v15 = 1;
        -[UIKeyShortcutHUDMetrics setDisplayedMenu:searching:](self->_metrics, "setDisplayedMenu:searching:", v14, 1);
      }
    }
    v16 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __76___UIKeyShortcutHUDViewController__setSearching_animated_initialSearchText___block_invoke;
    aBlock[3] = &unk_1E16C52C0;
    objc_copyWeak(&v62, location);
    v63 = v6;
    v64 = v15;
    v37 = (void (**)(void))_Block_copy(aBlock);
    v53[0] = v16;
    v53[1] = 3221225472;
    v53[2] = __76___UIKeyShortcutHUDViewController__setSearching_animated_initialSearchText___block_invoke_2;
    v53[3] = &unk_1E16C52E8;
    objc_copyWeak(&v56, location);
    v57 = v6;
    v58 = v15;
    v17 = v14;
    v59 = v5;
    v31 = v17;
    v54 = v17;
    v55 = self;
    v60 = v12;
    v18 = (void (**)(_QWORD))_Block_copy(v53);
    v49[0] = v16;
    v49[1] = 3221225472;
    v49[2] = __76___UIKeyShortcutHUDViewController__setSearching_animated_initialSearchText___block_invoke_4;
    v49[3] = &unk_1E16C5310;
    objc_copyWeak(&v50, location);
    v51 = v6;
    v52 = v15;
    v19 = _Block_copy(v49);
    v47[0] = v16;
    v47[1] = 3221225472;
    v47[2] = __76___UIKeyShortcutHUDViewController__setSearching_animated_initialSearchText___block_invoke_5;
    v47[3] = &unk_1E16B42F8;
    objc_copyWeak(&v48, location);
    v20 = _Block_copy(v47);
    metrics = self->_metrics;
    if (v6)
    {
      if (v15)
      {
        -[UIKeyShortcutHUDMetrics searchModePreferredMenuPanelWidth](metrics, "searchModePreferredMenuPanelWidth", v31, &v48, &v50, &v56, &v62);
        -[NSLayoutConstraint setConstant:](self->_menuPreferredWidthConstraint, "setConstant:");
        -[UIKeyShortcutHUDMetrics searchModePreferredMenuPanelHeight](self->_metrics, "searchModePreferredMenuPanelHeight");
        -[_UIKeyShortcutHUDViewController _setMenuHeight:](self, "_setMenuHeight:");
      }
      else
      {
        -[UIKeyShortcutHUDMetrics searchModeStandardHUDWidth](metrics, "searchModeStandardHUDWidth", v31, &v48, &v50, &v56, &v62);
        -[NSLayoutConstraint setConstant:](self->_menuPreferredWidthConstraint, "setConstant:");
      }
      -[UIKeyShortcutHUDMetrics searchModeStandardHUDWidth](self->_metrics, "searchModeStandardHUDWidth");
    }
    else
    {
      -[UIKeyShortcutHUDMetrics standardMenuPanelHeight](metrics, "standardMenuPanelHeight", v31, &v48, &v50, &v56, &v62);
      -[_UIKeyShortcutHUDViewController _setMenuHeight:](self, "_setMenuHeight:");
      if (v11 <= 0.0)
      {
        -[_UIKeyShortcutHUDMenuViewController setSearching:](self->_menuVC, "setSearching:", 0);
        -[_UIKeyShortcutHUDViewController _updateDisplayedMenuForCurrentHeldModifierFlagsAnimated:](self, "_updateDisplayedMenuForCurrentHeldModifierFlagsAnimated:", 0);
        -[UIViewController view](self, "view");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "layoutIfNeeded");

      }
      -[UIKeyShortcutHUDMetrics standardHUDWidth](self->_metrics, "standardHUDWidth");
      -[NSLayoutConstraint setConstant:](self->_menuPreferredWidthConstraint, "setConstant:");
      -[UIKeyShortcutHUDMetrics standardHUDWidth](self->_metrics, "standardHUDWidth");
    }
    -[NSLayoutConstraint setConstant:](self->_toolbarPreferredWidthConstraint, "setConstant:");
    if (v5)
    {
      -[_UIKeyShortcutHUDViewController _defaultMenuPanelAnimator](self, "_defaultMenuPanelAnimator");
      v23 = (UIViewPropertyAnimator *)objc_claimAutoreleasedReturnValue();
      menuPanelAnimator = self->_menuPanelAnimator;
      self->_menuPanelAnimator = v23;

      v25 = self->_menuPanelAnimator;
      v45[0] = v16;
      v45[1] = 3221225472;
      v45[2] = __76___UIKeyShortcutHUDViewController__setSearching_animated_initialSearchText___block_invoke_6;
      v45[3] = &unk_1E16B1BF8;
      v46 = v37;
      -[UIViewPropertyAnimator addAnimations:](v25, "addAnimations:", v45);
      v26 = self->_menuPanelAnimator;
      v43[0] = v16;
      v43[1] = 3221225472;
      v43[2] = __76___UIKeyShortcutHUDViewController__setSearching_animated_initialSearchText___block_invoke_7;
      v43[3] = &unk_1E16BDBD8;
      v44 = v19;
      -[UIViewPropertyAnimator addCompletion:](v26, "addCompletion:", v43);
      -[_UIKeyShortcutHUDViewController _defaultSearchTransitionAnimator](self, "_defaultSearchTransitionAnimator");
      v27 = (UIViewPropertyAnimator *)objc_claimAutoreleasedReturnValue();
      searchTransitionAnimator = self->_searchTransitionAnimator;
      self->_searchTransitionAnimator = v27;

      v29 = self->_searchTransitionAnimator;
      v41[0] = v16;
      v41[1] = 3221225472;
      v41[2] = __76___UIKeyShortcutHUDViewController__setSearching_animated_initialSearchText___block_invoke_8;
      v41[3] = &unk_1E16B1BF8;
      v42 = v18;
      -[UIViewPropertyAnimator addAnimations:](v29, "addAnimations:", v41);
      v30 = self->_searchTransitionAnimator;
      v39[0] = v16;
      v39[1] = 3221225472;
      v39[2] = __76___UIKeyShortcutHUDViewController__setSearching_animated_initialSearchText___block_invoke_9;
      v39[3] = &unk_1E16BDBD8;
      v40 = v20;
      -[UIViewPropertyAnimator addCompletion:](v30, "addCompletion:", v39);
      -[UIViewPropertyAnimator startAnimation](self->_menuPanelAnimator, "startAnimation");
      -[UIViewPropertyAnimator startAnimation](self->_searchTransitionAnimator, "startAnimation");

    }
    else
    {
      v37[2]();
      v18[2](v18);
      (*((void (**)(void *, _QWORD))v19 + 2))(v19, 0);
      (*((void (**)(void *, _QWORD))v20 + 2))(v20, 0);
    }

    objc_destroyWeak(v33);
    objc_destroyWeak(v34);

    objc_destroyWeak(v35);
    objc_destroyWeak(v36);

    objc_destroyWeak(location);
    v8 = v38;
  }

}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)_canChangeFirstResponder:(id)a3 toResponder:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  objc_super v10;

  v6 = a3;
  v7 = a4;
  if (-[UIResponder _containsResponder:](self, "_containsResponder:", v7)
    && -[_UIKeyShortcutHUDViewController isHidden](self, "isHidden"))
  {
    v8 = 0;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)_UIKeyShortcutHUDViewController;
    v8 = -[UIResponder _canChangeFirstResponder:toResponder:](&v10, sel__canChangeFirstResponder_toResponder_, v6, v7);
  }

  return v8;
}

- (void)insertText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  if (-[_UIKeyShortcutHUDViewController isHidden](self, "isHidden"))
  {
    v5 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v6);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "length"))
    {
      -[_UIKeyShortcutHUDViewController _setSearching:animated:initialSearchText:](self, "_setSearching:animated:initialSearchText:", 1, 1, v8);
      -[_UIKeyShortcutHUDViewController setShouldIgnoreNextSearchFieldTextChangedCallback:](self, "setShouldIgnoreNextSearchFieldTextChangedCallback:", 1);
      -[_UIKeyShortcutHUDViewController delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "keyShortcutHUDViewControllerDidBeginTypeAheadSearch:", self);

    }
    v5 = v8;
  }

}

- (BOOL)hasText
{
  void *v2;
  void *v3;
  BOOL v4;

  -[_UIKeyShortcutHUDToolbarViewController searchBar](self->_toolbarVC, "searchBar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length") != 0;

  return v4;
}

- (id)undoManager
{
  return 0;
}

- (BOOL)_disableAutomaticKeyboardUI
{
  objc_super v4;

  if (-[UIResponder isFirstResponder](self, "isFirstResponder"))
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)_UIKeyShortcutHUDViewController;
  return -[UIResponder _disableAutomaticKeyboardUI](&v4, sel__disableAutomaticKeyboardUI);
}

- (BOOL)_suppressSoftwareKeyboard
{
  return 1;
}

- (id)_defaultHUDAppearanceAnimatorForHidden:(BOOL)a3
{
  UICubicTimingParameters *v3;
  UICubicTimingParameters *v4;
  UIViewPropertyAnimator *v5;

  if (a3)
    v3 = -[UICubicTimingParameters initWithAnimationCurve:]([UICubicTimingParameters alloc], "initWithAnimationCurve:", 0);
  else
    v3 = -[UISpringTimingParameters initWithMass:stiffness:damping:initialVelocity:]([UISpringTimingParameters alloc], "initWithMass:stiffness:damping:initialVelocity:", 2.0, 1500.0, 500.0, 0.0, 0.0);
  v4 = v3;
  v5 = -[UIViewPropertyAnimator initWithDuration:timingParameters:]([UIViewPropertyAnimator alloc], "initWithDuration:timingParameters:", v3, 0.15);

  return v5;
}

- (id)_defaultSearchTransitionAnimator
{
  UISpringTimingParameters *v2;
  UIViewPropertyAnimator *v3;

  v2 = -[UISpringTimingParameters initWithMass:stiffness:damping:initialVelocity:]([UISpringTimingParameters alloc], "initWithMass:stiffness:damping:initialVelocity:", 3.0, 1000.0, 500.0, 0.0, 0.0);
  v3 = -[UIViewPropertyAnimator initWithDuration:timingParameters:]([UIViewPropertyAnimator alloc], "initWithDuration:timingParameters:", v2, 0.5);

  return v3;
}

- (void)_stopInFlightAnimationsForAnimator:(id)a3 endPosition:(int64_t)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v8 = v5;
    v7 = objc_msgSend(v5, "state");
    v6 = v8;
    if (v7)
    {
      objc_msgSend(v8, "stopAnimation:", 0);
      objc_msgSend(v8, "finishAnimationAtPosition:", a4);
      v6 = v8;
    }
  }

}

- (void)_setMenuHeight:(double)a3
{
  double v5;
  double v6;
  double v7;

  -[NSLayoutConstraint setConstant:](self->_menuPreferredHeightConstraint, "setConstant:");
  -[UIKeyShortcutHUDMetrics hiddenMenuPanelHeight](self->_metrics, "hiddenMenuPanelHeight");
  v6 = v5;
  v7 = 0.0;
  if (v6 != a3)
    -[UIKeyShortcutHUDMetrics standardMenuToolbarSpacing](self->_metrics, "standardMenuToolbarSpacing", 0.0);
  -[NSLayoutConstraint setConstant:](self->_menuToolbarSpacingConstraint, "setConstant:", v7);
}

- (void)_setMenuWidth:(double)a3
{
  -[NSLayoutConstraint setConstant:](self->_menuPreferredWidthConstraint, "setConstant:", a3);
}

- (void)menuViewController:(id)a3 didScrollToCategory:(id)a4 withCategoryIndex:(int64_t)a5
{
  -[_UIKeyShortcutHUDToolbarViewController selectCategory:withCategoryIndex:](self->_toolbarVC, "selectCategory:withCategoryIndex:", a4, a5);
}

- (void)menuViewController:(id)a3 didSelectShortcut:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id WeakRetained;
  int v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a4;
  -[_UIKeyShortcutHUDViewController configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clientTraits");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isSystemApp") & 1) == 0)
  {

    goto LABEL_6;
  }
  objc_msgSend(v14, "uiKeyCommand");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_showShortcutsKeyCommand);
  v9 = objc_msgSend(v7, "isEqual:", WeakRetained);

  if (!v9)
  {
LABEL_6:
    -[UIViewController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setUserInteractionEnabled:", 0);

    -[_UIKeyShortcutHUDViewController delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "keyShortcutHUDViewController:didSelectShortcut:", self, v14);

    goto LABEL_7;
  }
  v10 = -[_UIKeyShortcutHUDViewController isSearching](self, "isSearching");
  v11 = v14;
  if (v10)
  {
    -[_UIKeyShortcutHUDViewController _setSearching:animated:](self, "_setSearching:animated:", 0, 1);
LABEL_7:
    v11 = v14;
  }

}

- (BOOL)menuViewController:(id)a3 shouldPersistSelectionForShortcut:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id WeakRetained;
  char v10;
  char v11;

  v5 = a4;
  -[_UIKeyShortcutHUDViewController configuration](self, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "clientTraits");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isSystemApp"))
  {
    objc_msgSend(v5, "uiKeyCommand");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_showShortcutsKeyCommand);
    v10 = objc_msgSend(v8, "isEqual:", WeakRetained);

    v11 = v10 ^ 1;
  }
  else
  {
    v11 = 1;
  }

  return v11;
}

- (void)toolbarViewControllerDidPressSearchButton:(id)a3
{
  -[_UIKeyShortcutHUDViewController _setSearching:animated:](self, "_setSearching:animated:", 1, 1);
}

- (void)toolbarViewControllerDidPressCancelSearchButton:(id)a3
{
  -[_UIKeyShortcutHUDViewController _setSearching:animated:](self, "_setSearching:animated:", 0, 1);
}

- (void)toolbarViewController:(id)a3 didUpdateSearchText:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  int v13;
  UIKeyShortcutHUDMetrics *metrics;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  UIViewPropertyAnimator *v20;
  UIViewPropertyAnimator *menuPanelAnimator;
  UIViewPropertyAnimator *v22;
  uint64_t v23;
  UIViewPropertyAnimator *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t);
  void *v29;
  id v30;
  id v31[3];
  _QWORD v32[4];
  id v33;
  char v34;
  id location[2];

  v6 = a3;
  v7 = a4;
  if (-[_UIKeyShortcutHUDViewController shouldIgnoreNextSearchFieldTextChangedCallback](self, "shouldIgnoreNextSearchFieldTextChangedCallback"))
  {
    -[_UIKeyShortcutHUDViewController setShouldIgnoreNextSearchFieldTextChangedCallback:](self, "setShouldIgnoreNextSearchFieldTextChangedCallback:", 0);
  }
  else if (-[_UIKeyShortcutHUDViewController isSearching](self, "isSearching"))
  {
    -[_UIKeyShortcutHUDViewController _stopInFlightAnimationsForAnimator:endPosition:](self, "_stopInFlightAnimationsForAnimator:endPosition:", self->_menuPanelAnimator, 2);
    -[_UIKeyShortcutHUDConfiguration model](self->_configuration, "model");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "searchMenuWithSearchText:maxSearchResultEntries:", v7, -[UIKeyShortcutHUDMetrics maxNumberOfCellsInSearchResults](self->_metrics, "maxNumberOfCellsInSearchResults"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v9, "isEmpty") & 1) == 0)
    {
      -[_UIKeyShortcutHUDViewController _setDisplayedMenu:animated:](self, "_setDisplayedMenu:animated:", v9, 0);
      -[_UIKeyShortcutHUDViewController _focusTopSearchResultWithDelay:](self, "_focusTopSearchResultWithDelay:", 0);
    }
    -[UIViewController view](self->_menuVC, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "alpha");
    v12 = v11;

    v13 = objc_msgSend(v9, "isEmpty");
    metrics = self->_metrics;
    if (((v13 ^ 1) & 1) != 0)
    {
      -[UIKeyShortcutHUDMetrics searchModePreferredMenuPanelHeight](metrics, "searchModePreferredMenuPanelHeight");
      v16 = v18;
      -[UIKeyShortcutHUDMetrics searchModePreferredMenuPanelWidth](self->_metrics, "searchModePreferredMenuPanelWidth");
    }
    else
    {
      -[UIKeyShortcutHUDMetrics hiddenMenuPanelHeight](metrics, "hiddenMenuPanelHeight");
      v16 = v15;
      -[UIKeyShortcutHUDMetrics hiddenMenuPanelWidth](self->_metrics, "hiddenMenuPanelWidth");
    }
    v19 = v17;
    objc_initWeak(location, self);
    -[_UIKeyShortcutHUDViewController _defaultMenuPanelAnimator](self, "_defaultMenuPanelAnimator");
    v20 = (UIViewPropertyAnimator *)objc_claimAutoreleasedReturnValue();
    menuPanelAnimator = self->_menuPanelAnimator;
    self->_menuPanelAnimator = v20;

    v22 = self->_menuPanelAnimator;
    v23 = MEMORY[0x1E0C809B0];
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __77___UIKeyShortcutHUDViewController_toolbarViewController_didUpdateSearchText___block_invoke;
    v32[3] = &unk_1E16BFC68;
    objc_copyWeak(&v33, location);
    v34 = v13 ^ 1;
    -[UIViewPropertyAnimator addAnimations:](v22, "addAnimations:", v32);
    if ((((v12 > 0.0) ^ v13) & 1) != 0 || (v13 & 1) == 0)
    {
      -[_UIKeyShortcutHUDViewController _setMenuHeight:](self, "_setMenuHeight:", *(double *)&v16);
      -[_UIKeyShortcutHUDViewController _setMenuWidth:](self, "_setMenuWidth:", *(double *)&v19);
      -[UIViewController view](self, "view");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "layoutIfNeeded");

    }
    else
    {
      v24 = self->_menuPanelAnimator;
      v26 = v23;
      v27 = 3221225472;
      v28 = __77___UIKeyShortcutHUDViewController_toolbarViewController_didUpdateSearchText___block_invoke_2;
      v29 = &unk_1E16C5338;
      objc_copyWeak(v31, location);
      v31[1] = v16;
      v31[2] = v19;
      v30 = v9;
      -[UIViewPropertyAnimator addCompletion:](v24, "addCompletion:", &v26);

      objc_destroyWeak(v31);
    }
    -[UIViewPropertyAnimator startAnimation](self->_menuPanelAnimator, "startAnimation", v26, v27, v28, v29);
    objc_destroyWeak(&v33);
    objc_destroyWeak(location);

  }
}

- (void)toolbarViewController:(id)a3 didSelectCategory:(id)a4 categoryIndex:(int64_t)a5 animated:(BOOL)a6
{
  -[_UIKeyShortcutHUDMenuViewController scrollToCategory:withCategoryIndex:animated:](self->_menuVC, "scrollToCategory:withCategoryIndex:animated:", a4, a5, a6);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_UIKeyShortcutHUDViewControllerDelegate)delegate
{
  return (_UIKeyShortcutHUDViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (_UIKeyShortcutHUDWindow)hudWindow
{
  return (_UIKeyShortcutHUDWindow *)objc_loadWeakRetained((id *)&self->_hudWindow);
}

- (void)setHudWindow:(id)a3
{
  objc_storeWeak((id *)&self->_hudWindow, a3);
}

- (_UIKeyShortcutHUDConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (UIKeyShortcutHUDMetricsProvider)metricsProvider
{
  return self->_metricsProvider;
}

- (void)setMetricsProvider:(id)a3
{
  objc_storeStrong((id *)&self->_metricsProvider, a3);
}

- (BOOL)isSearching
{
  return self->_searching;
}

- (int64_t)heldModifierFlags
{
  return self->_heldModifierFlags;
}

- (UIView)hudContainerView
{
  return self->_hudContainerView;
}

- (void)setHudContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_hudContainerView, a3);
}

- (_UIKeyShortcutHUDMenuViewController)menuVC
{
  return self->_menuVC;
}

- (void)setMenuVC:(id)a3
{
  objc_storeStrong((id *)&self->_menuVC, a3);
}

- (_UIKeyShortcutHUDToolbarViewController)toolbarVC
{
  return self->_toolbarVC;
}

- (void)setToolbarVC:(id)a3
{
  objc_storeStrong((id *)&self->_toolbarVC, a3);
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (BOOL)isCompletelyPresented
{
  return self->_completelyPresented;
}

- (NSLayoutConstraint)hudContainerLeadingEdgeConstraint
{
  return self->_hudContainerLeadingEdgeConstraint;
}

- (void)setHudContainerLeadingEdgeConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_hudContainerLeadingEdgeConstraint, a3);
}

- (NSLayoutConstraint)hudContainerTrailingEdgeConstraint
{
  return self->_hudContainerTrailingEdgeConstraint;
}

- (void)setHudContainerTrailingEdgeConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_hudContainerTrailingEdgeConstraint, a3);
}

- (NSLayoutConstraint)hudContainerTopEdgeConstraint
{
  return self->_hudContainerTopEdgeConstraint;
}

- (void)setHudContainerTopEdgeConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_hudContainerTopEdgeConstraint, a3);
}

- (NSLayoutConstraint)hudContainerBottomEdgeConstraint
{
  return self->_hudContainerBottomEdgeConstraint;
}

- (void)setHudContainerBottomEdgeConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_hudContainerBottomEdgeConstraint, a3);
}

- (NSLayoutConstraint)hudContainerBottomSafeAreaEdgeConstraint
{
  return self->_hudContainerBottomSafeAreaEdgeConstraint;
}

- (void)setHudContainerBottomSafeAreaEdgeConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_hudContainerBottomSafeAreaEdgeConstraint, a3);
}

- (NSLayoutConstraint)menuPreferredWidthConstraint
{
  return self->_menuPreferredWidthConstraint;
}

- (void)setMenuPreferredWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_menuPreferredWidthConstraint, a3);
}

- (NSLayoutConstraint)menuPreferredHeightConstraint
{
  return self->_menuPreferredHeightConstraint;
}

- (void)setMenuPreferredHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_menuPreferredHeightConstraint, a3);
}

- (NSLayoutConstraint)menuToolbarSpacingConstraint
{
  return self->_menuToolbarSpacingConstraint;
}

- (void)setMenuToolbarSpacingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_menuToolbarSpacingConstraint, a3);
}

- (NSLayoutConstraint)toolbarPreferredWidthConstraint
{
  return self->_toolbarPreferredWidthConstraint;
}

- (void)setToolbarPreferredWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_toolbarPreferredWidthConstraint, a3);
}

- (_UIKeyShortcutHUDCollectionViewManager)collectionViewManager
{
  return self->_collectionViewManager;
}

- (void)setCollectionViewManager:(id)a3
{
  objc_storeStrong((id *)&self->_collectionViewManager, a3);
}

- (UIKeyShortcutHUDMetrics)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_metrics, a3);
}

- (_UIPassthroughScrollInteraction)passthroughScrollInteraction
{
  return self->_passthroughScrollInteraction;
}

- (void)setPassthroughScrollInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_passthroughScrollInteraction, a3);
}

- (NSMutableDictionary)hudToModelKeyCommandsMap
{
  return self->_hudToModelKeyCommandsMap;
}

- (void)setHudToModelKeyCommandsMap:(id)a3
{
  objc_storeStrong((id *)&self->_hudToModelKeyCommandsMap, a3);
}

- (UIKeyCommand)showShortcutsKeyCommand
{
  return (UIKeyCommand *)objc_loadWeakRetained((id *)&self->_showShortcutsKeyCommand);
}

- (void)setShowShortcutsKeyCommand:(id)a3
{
  objc_storeWeak((id *)&self->_showShortcutsKeyCommand, a3);
}

- (UIViewPropertyAnimator)hudAppearanceAnimator
{
  return self->_hudAppearanceAnimator;
}

- (void)setHudAppearanceAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_hudAppearanceAnimator, a3);
}

- (UIViewPropertyAnimator)menuPanelAnimator
{
  return self->_menuPanelAnimator;
}

- (void)setMenuPanelAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_menuPanelAnimator, a3);
}

- (UIViewPropertyAnimator)searchTransitionAnimator
{
  return self->_searchTransitionAnimator;
}

- (void)setSearchTransitionAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_searchTransitionAnimator, a3);
}

- (BOOL)isHUDPresentedIntoSearchMode
{
  return self->_hudPresentedIntoSearchMode;
}

- (void)setHudPresentedIntoSearchMode:(BOOL)a3
{
  self->_hudPresentedIntoSearchMode = a3;
}

- (BOOL)shouldIgnoreNextSearchFieldTextChangedCallback
{
  return self->_shouldIgnoreNextSearchFieldTextChangedCallback;
}

- (void)setShouldIgnoreNextSearchFieldTextChangedCallback:(BOOL)a3
{
  self->_shouldIgnoreNextSearchFieldTextChangedCallback = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchTransitionAnimator, 0);
  objc_storeStrong((id *)&self->_menuPanelAnimator, 0);
  objc_storeStrong((id *)&self->_hudAppearanceAnimator, 0);
  objc_destroyWeak((id *)&self->_showShortcutsKeyCommand);
  objc_storeStrong((id *)&self->_hudToModelKeyCommandsMap, 0);
  objc_storeStrong((id *)&self->_passthroughScrollInteraction, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_collectionViewManager, 0);
  objc_storeStrong((id *)&self->_toolbarPreferredWidthConstraint, 0);
  objc_storeStrong((id *)&self->_menuToolbarSpacingConstraint, 0);
  objc_storeStrong((id *)&self->_menuPreferredHeightConstraint, 0);
  objc_storeStrong((id *)&self->_menuPreferredWidthConstraint, 0);
  objc_storeStrong((id *)&self->_hudContainerBottomSafeAreaEdgeConstraint, 0);
  objc_storeStrong((id *)&self->_hudContainerBottomEdgeConstraint, 0);
  objc_storeStrong((id *)&self->_hudContainerTopEdgeConstraint, 0);
  objc_storeStrong((id *)&self->_hudContainerTrailingEdgeConstraint, 0);
  objc_storeStrong((id *)&self->_hudContainerLeadingEdgeConstraint, 0);
  objc_storeStrong((id *)&self->_toolbarVC, 0);
  objc_storeStrong((id *)&self->_menuVC, 0);
  objc_storeStrong((id *)&self->_hudContainerView, 0);
  objc_storeStrong((id *)&self->_metricsProvider, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_hudWindow);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
