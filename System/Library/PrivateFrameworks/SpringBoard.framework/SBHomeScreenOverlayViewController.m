@implementation SBHomeScreenOverlayViewController

- (SBHomeScreenOverlayViewController)initWithListLayoutProvider:(id)a3
{
  id v5;
  SBHomeScreenOverlayViewController *v6;
  SBHomeScreenOverlayViewController *v7;
  void *v8;
  id v9;
  void *v10;
  SBHRootFolderVisualConfiguration *v11;
  SBHRootFolderVisualConfiguration *rootFolderVisualConfiguration;
  uint64_t v13;
  SBFTodayGestureSettings *gestureSettings;
  UIViewFloatAnimatableProperty *v15;
  UIViewFloatAnimatableProperty *overlayPresentationFloatAnimatableProperty;
  SBHRootSidebarController *v17;
  SBHRootSidebarController *contentViewController;
  objc_super v20;

  v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SBHomeScreenOverlayViewController;
  v6 = -[SBHomeScreenOverlayViewController initWithNibName:bundle:](&v20, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_listLayoutProvider, a3);
    objc_msgSend(v5, "layoutForIconLocation:", *MEMORY[0x1E0DAA9E8]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v8, "sidebarVisualConfiguration");
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = objc_alloc_init(MEMORY[0x1E0DAA540]);
    }
    v10 = v9;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v8, "rootFolderVisualConfiguration");
      v11 = (SBHRootFolderVisualConfiguration *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = (SBHRootFolderVisualConfiguration *)objc_alloc_init(MEMORY[0x1E0DAA510]);
    }
    rootFolderVisualConfiguration = v7->_rootFolderVisualConfiguration;
    v7->_rootFolderVisualConfiguration = v11;

    v7->_fromLeading = 1;
    v7->_presentationProgress = 0.0;
    v7->_titledButtonsAlpha = 1.0;
    v7->_contentVisibility = 0;
    objc_msgSend(MEMORY[0x1E0DA9F18], "rootSettings");
    v13 = objc_claimAutoreleasedReturnValue();
    gestureSettings = v7->_gestureSettings;
    v7->_gestureSettings = (SBFTodayGestureSettings *)v13;

    v15 = (UIViewFloatAnimatableProperty *)objc_alloc_init(MEMORY[0x1E0CEABC0]);
    overlayPresentationFloatAnimatableProperty = v7->_overlayPresentationFloatAnimatableProperty;
    v7->_overlayPresentationFloatAnimatableProperty = v15;

    -[UIViewFloatAnimatableProperty setValue:](v7->_overlayPresentationFloatAnimatableProperty, "setValue:", 0.0);
    v17 = (SBHRootSidebarController *)objc_alloc_init(MEMORY[0x1E0DAA518]);
    contentViewController = v7->_contentViewController;
    v7->_contentViewController = v17;

    -[SBHRootSidebarController setSidebarVisualConfiguration:](v7->_contentViewController, "setSidebarVisualConfiguration:", v10);
    -[SBHRootSidebarController setLayoutInsetsIgnoredEdges:](v7->_contentViewController, "setLayoutInsetsIgnoredEdges:", 4);

  }
  return v7;
}

- (void)setLeadingSidebarViewController:(id)a3
{
  SBHVisibleContentPresenter *v5;
  SBHVisibleContentPresenter *leadingSidebarViewController;
  unint64_t v7;
  SBHVisibleContentPresenter *v8;

  v5 = (SBHVisibleContentPresenter *)a3;
  if (self->_leadingSidebarViewController != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_leadingSidebarViewController, a3);
    leadingSidebarViewController = self->_leadingSidebarViewController;
    if (self->_fromLeading)
      v7 = -[SBHomeScreenOverlayViewController childContentVisibility](self, "childContentVisibility");
    else
      v7 = 2;
    -[SBHVisibleContentPresenter setContentVisibility:](leadingSidebarViewController, "setContentVisibility:", v7);
    v5 = v8;
  }

}

- (void)setTrailingSidebarViewController:(id)a3
{
  SBHVisibleContentPresenter *v5;
  SBHVisibleContentPresenter *trailingSidebarViewController;
  unint64_t v7;
  SBHVisibleContentPresenter *v8;

  v5 = (SBHVisibleContentPresenter *)a3;
  if (self->_trailingSidebarViewController != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_trailingSidebarViewController, a3);
    trailingSidebarViewController = self->_trailingSidebarViewController;
    if (self->_fromLeading)
      v7 = 2;
    else
      v7 = -[SBHomeScreenOverlayViewController childContentVisibility](self, "childContentVisibility");
    -[SBHVisibleContentPresenter setContentVisibility:](trailingSidebarViewController, "setContentVisibility:", v7);
    v5 = v8;
  }

}

- (id)currentSidebarViewController
{
  int *v2;

  if (self->_fromLeading)
    v2 = &OBJC_IVAR___SBHomeScreenOverlayViewController__leadingSidebarViewController;
  else
    v2 = &OBJC_IVAR___SBHomeScreenOverlayViewController__trailingSidebarViewController;
  return *(id *)((char *)&self->super.super.super.isa + *v2);
}

- (double)contentWidth
{
  void *v3;
  double v4;
  double v5;
  CGRect v7;

  -[SBHomeScreenOverlayViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  -[SBHomeScreenOverlayViewController contentWidthWithContainerWidth:](self, "contentWidthWithContainerWidth:", CGRectGetWidth(v7));
  v5 = v4;

  return v5;
}

- (double)contentWidthWithContainerWidth:(double)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  -[SBHRootSidebarController sidebarVisualConfiguration](self->_contentViewController, "sidebarVisualConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "insets");
  v6 = v5;
  v8 = v7;
  objc_msgSend(v4, "effectiveContentWidthWithContainerWidth:", a3);
  v10 = v8 + v6 + v9;

  return v10;
}

- (CGRect)contentRect
{
  void *v2;
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
  double v14;
  double v15;
  CGRect result;

  -[SBHomeScreenOverlayViewController contentViewController](self, "contentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (void)loadView
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  __CFString *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  MTMaterialView *v12;
  MTMaterialView *backgroundView;
  double v14;
  void *v15;
  id v16;
  double v17;
  double v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  CGFloat v45;
  CGFloat v46;
  void *v47;
  void *v48;
  objc_super v49;

  v49.receiver = self;
  v49.super_class = (Class)SBHomeScreenOverlayViewController;
  -[SBHomeScreenOverlayViewController loadView](&v49, sel_loadView);
  v3 = objc_alloc(MEMORY[0x1E0DA9E10]);
  -[SBHomeScreenOverlayViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v5 = (void *)objc_msgSend(v3, "initWithFrame:");

  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v5, "setFocusGroupIdentifier:", CFSTR("HomeScreenOverlay"));
  -[SBHomeScreenOverlayViewController setView:](self, "setView:", v5);
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  if ((v7 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v8 = CFSTR("homeScreenOverlay-iPad");
  else
    v8 = CFSTR("homeScreenOverlay");
  v9 = (void *)MEMORY[0x1E0D47498];
  v10 = v8;
  SBHBundle();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "materialViewWithRecipeNamed:inBundle:options:initialWeighting:scaleAdjustment:", v10, v11, 0, 0, 0.1);
  v12 = (MTMaterialView *)objc_claimAutoreleasedReturnValue();

  backgroundView = self->_backgroundView;
  self->_backgroundView = v12;

  -[MTMaterialView setTranslatesAutoresizingMaskIntoConstraints:](self->_backgroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MTMaterialView setUseBuiltInAlphaTransformerAndBackdropScaleAdjustment:](self->_backgroundView, "setUseBuiltInAlphaTransformerAndBackdropScaleAdjustment:", 1);
  -[MTMaterialView setGroupNameBase:](self->_backgroundView, "setGroupNameBase:", CFSTR("HOMESCREEN_OVERLAY_BACKGROUNDVIEW"));
  v14 = 0.0;
  -[MTMaterialView setWeighting:](self->_backgroundView, "setWeighting:", 0.0);
  objc_msgSend(v5, "addSubview:", self->_backgroundView);
  -[SBHomeScreenOverlayViewController contentViewController](self, "contentViewController");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[SBHomeScreenOverlayViewController bs_addChildViewController:](self, "bs_addChildViewController:", v48);
  v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v48, "sidebarVisualConfiguration");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "insets");
  v18 = v17;
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "userInterfaceIdiom");

  if ((v20 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v14 = v18;
  objc_msgSend(v5, "leadingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "leadingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "addObject:", v23);
  objc_msgSend(v15, "topAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:constant:", v25, v18);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObject:", v26);

  objc_msgSend(v5, "bottomAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bottomAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:constant:", v28, v14);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObject:", v29);

  objc_msgSend(v15, "widthAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHomeScreenOverlayViewController contentWidth](self, "contentWidth");
  objc_msgSend(v30, "constraintEqualToConstant:");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "addObject:", v31);
  objc_msgSend(v5, "topAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTMaterialView topAnchor](self->_backgroundView, "topAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObject:", v34);

  objc_msgSend(v5, "bottomAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTMaterialView bottomAnchor](self->_backgroundView, "bottomAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObject:", v37);

  objc_msgSend(v5, "leadingAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTMaterialView leadingAnchor](self->_backgroundView, "leadingAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObject:", v40);

  objc_msgSend(v5, "trailingAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTMaterialView trailingAnchor](self->_backgroundView, "trailingAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToAnchor:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObject:", v43);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v16);
  -[SBHomeScreenOverlayViewController setContentLeadingConstraint:](self, "setContentLeadingConstraint:", v23);
  -[SBHomeScreenOverlayViewController setContentWidthConstraint:](self, "setContentWidthConstraint:", v31);
  objc_msgSend(MEMORY[0x1E0CEADE8], "sharedInstanceForStyle:", 1);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHRootSidebarController setLegibilitySettings:](self->_contentViewController, "setLegibilitySettings:", v44);
  objc_msgSend(v5, "bounds");
  self->_boundsSizeForConstraints.width = v45;
  self->_boundsSizeForConstraints.height = v46;
  -[SBHomeScreenOverlayViewController _updateConstraintsForPresentationProgress:layoutIfNeeded:](self, "_updateConstraintsForPresentationProgress:layoutIfNeeded:", 0, self->_presentationProgress);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  objc_super v6;
  uint8_t buf[4];
  _BOOL4 v8;
  uint64_t v9;

  v3 = a3;
  v9 = *MEMORY[0x1E0C80C00];
  SBLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v8 = v3;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Today view overlay will appear, animated: %{BOOL}u.", buf, 8u);
  }

  v6.receiver = self;
  v6.super_class = (Class)SBHomeScreenOverlayViewController;
  -[SBHomeScreenOverlayViewController viewWillAppear:](&v6, sel_viewWillAppear_, v3);
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  objc_super v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  _BOOL4 v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;
  CGRect v24;

  v3 = a3;
  v23 = *MEMORY[0x1E0C80C00];
  SBLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    _SBFLoggingMethodProem();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[SBHomeScreenOverlayViewController interfaceOrientation](self, "interfaceOrientation");
    -[SBHomeScreenOverlayViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "frame");
    NSStringFromCGRect(v24);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHomeScreenOverlayViewController contentLeadingConstraint](self, "contentLeadingConstraint");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constant");
    *(_DWORD *)buf = 138544386;
    v14 = v6;
    v15 = 1024;
    v16 = v3;
    v17 = 2048;
    v18 = v7;
    v19 = 2114;
    v20 = v9;
    v21 = 2048;
    v22 = v11;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "[Overlay Position] %{public}@ animated: %{BOOL}u, orientation: %ld, overlayFrame:%{public}@, leading constrait: %f", buf, 0x30u);

  }
  v12.receiver = self;
  v12.super_class = (Class)SBHomeScreenOverlayViewController;
  -[SBHomeScreenOverlayViewController viewDidAppear:](&v12, sel_viewDidAppear_, v3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  objc_super v6;
  uint8_t buf[4];
  _BOOL4 v8;
  uint64_t v9;

  v3 = a3;
  v9 = *MEMORY[0x1E0C80C00];
  SBLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v8 = v3;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Today view overlay will disappear, animated: %{BOOL}u.", buf, 8u);
  }

  v6.receiver = self;
  v6.super_class = (Class)SBHomeScreenOverlayViewController;
  -[SBHomeScreenOverlayViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  NSCountedSet *reasonsToSnapshotBackgroundView;
  objc_super v7;
  uint8_t buf[4];
  _BOOL4 v9;
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x1E0C80C00];
  SBLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v9 = v3;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Today view overlay did disappear, animated: %{BOOL}u.", buf, 8u);
  }

  v7.receiver = self;
  v7.super_class = (Class)SBHomeScreenOverlayViewController;
  -[SBHomeScreenOverlayViewController viewDidDisappear:](&v7, sel_viewDidDisappear_, v3);
  reasonsToSnapshotBackgroundView = self->_reasonsToSnapshotBackgroundView;
  self->_reasonsToSnapshotBackgroundView = 0;

}

- (BOOL)bs_beginAppearanceTransition:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  unsigned int v7;
  const __CFString *v8;
  _BOOL4 v9;
  unsigned int v10;
  const __CFString *v11;
  NSObject *v12;
  void *v13;
  const __CFString *v14;
  objc_super v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  const __CFString *v24;
  uint64_t v25;

  v4 = a4;
  v5 = a3;
  v25 = *MEMORY[0x1E0C80C00];
  v7 = -[SBHomeScreenOverlayViewController _appearState](self, "_appearState");
  if (v7 > 3)
    v8 = CFSTR("(unknown)");
  else
    v8 = off_1E8EC1B68[v7];
  v16.receiver = self;
  v16.super_class = (Class)SBHomeScreenOverlayViewController;
  v9 = -[SBHomeScreenOverlayViewController bs_beginAppearanceTransition:animated:](&v16, sel_bs_beginAppearanceTransition_animated_, v5, v4);
  v10 = -[SBHomeScreenOverlayViewController _appearState](self, "_appearState");
  if (v10 > 3)
    v11 = CFSTR("(unknown)");
  else
    v11 = off_1E8EC1B68[v10];
  SBLogCommon();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    _SBFLoggingMethodProem();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = CFSTR("didn't end");
    *(_DWORD *)buf = 138413058;
    v18 = v13;
    if (v9)
      v14 = CFSTR("ended");
    v19 = 2112;
    v20 = v14;
    v21 = 2112;
    v22 = v8;
    v23 = 2112;
    v24 = v11;
    _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "%@ %@, %@ -> %@", buf, 0x2Au);

  }
  return v9;
}

- (BOOL)bs_endAppearanceTransition:(BOOL)a3
{
  _BOOL8 v3;
  unsigned int v5;
  const __CFString *v6;
  _BOOL4 v7;
  unsigned int v8;
  const __CFString *v9;
  NSObject *v10;
  void *v11;
  const __CFString *v12;
  objc_super v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  const __CFString *v22;
  uint64_t v23;

  v3 = a3;
  v23 = *MEMORY[0x1E0C80C00];
  v5 = -[SBHomeScreenOverlayViewController _appearState](self, "_appearState");
  if (v5 > 3)
    v6 = CFSTR("(unknown)");
  else
    v6 = off_1E8EC1B68[v5];
  v14.receiver = self;
  v14.super_class = (Class)SBHomeScreenOverlayViewController;
  v7 = -[SBHomeScreenOverlayViewController bs_endAppearanceTransition:](&v14, sel_bs_endAppearanceTransition_, v3);
  v8 = -[SBHomeScreenOverlayViewController _appearState](self, "_appearState");
  if (v8 > 3)
    v9 = CFSTR("(unknown)");
  else
    v9 = off_1E8EC1B68[v8];
  SBLogCommon();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    _SBFLoggingMethodProem();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = CFSTR("didn't end");
    *(_DWORD *)buf = 138413058;
    v16 = v11;
    if (v7)
      v12 = CFSTR("ended");
    v17 = 2112;
    v18 = v12;
    v19 = 2112;
    v20 = v6;
    v21 = 2112;
    v22 = v9;
    _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "%@ %@, %@ -> %@", buf, 0x2Au);

  }
  return v7;
}

- (BOOL)bs_endAppearanceTransition
{
  unsigned int v3;
  const __CFString *v4;
  _BOOL4 v5;
  unsigned int v6;
  const __CFString *v7;
  NSObject *v8;
  void *v9;
  const __CFString *v10;
  objc_super v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = -[SBHomeScreenOverlayViewController _appearState](self, "_appearState");
  if (v3 > 3)
    v4 = CFSTR("(unknown)");
  else
    v4 = off_1E8EC1B68[v3];
  v12.receiver = self;
  v12.super_class = (Class)SBHomeScreenOverlayViewController;
  v5 = -[SBHomeScreenOverlayViewController bs_endAppearanceTransition](&v12, sel_bs_endAppearanceTransition);
  v6 = -[SBHomeScreenOverlayViewController _appearState](self, "_appearState");
  if (v6 > 3)
    v7 = CFSTR("(unknown)");
  else
    v7 = off_1E8EC1B68[v6];
  SBLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    _SBFLoggingMethodProem();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = CFSTR("didn't end");
    *(_DWORD *)buf = 138413058;
    v14 = v9;
    if (v5)
      v10 = CFSTR("ended");
    v15 = 2112;
    v16 = v10;
    v17 = 2112;
    v18 = v4;
    v19 = 2112;
    v20 = v7;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "%@ %@, %@ -> %@", buf, 0x2Au);

  }
  return v5;
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  objc_super v7;

  v4 = a4;
  v6 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SBHomeScreenOverlayViewController;
  -[SBHomeScreenOverlayViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v7, sel_viewDidMoveToWindow_shouldAppearOrDisappear_, v6, v4);
  if (v6)
    -[SBHomeScreenOverlayViewController _configureMatchMoveAnimationForBackgroundView:withSourceView:](self, "_configureMatchMoveAnimationForBackgroundView:withSourceView:", self->_backgroundView, v6);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBHomeScreenOverlayViewController;
  -[SBHomeScreenOverlayViewController viewWillLayoutSubviews](&v10, sel_viewWillLayoutSubviews);
  -[SBHomeScreenOverlayViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  if (v5 != self->_boundsSizeForConstraints.width || v7 != self->_boundsSizeForConstraints.height)
  {
    self->_boundsSizeForConstraints.width = v5;
    self->_boundsSizeForConstraints.height = v7;
    -[SBHomeScreenOverlayViewController contentWidthConstraint](self, "contentWidthConstraint");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHomeScreenOverlayViewController contentWidthWithContainerWidth:](self, "contentWidthWithContainerWidth:", v5);
    objc_msgSend(v9, "setConstant:");

    -[SBHomeScreenOverlayViewController _updateConstraintsForPresentationProgress:layoutIfNeeded:](self, "_updateConstraintsForPresentationProgress:layoutIfNeeded:", 0, self->_presentationProgress);
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  SBHomeScreenOverlayViewController *v19;
  SEL v20;
  _QWORD v21[8];
  objc_super v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;
  CGSize v28;

  height = a3.height;
  width = a3.width;
  v27 = *MEMORY[0x1E0C80C00];
  v22.receiver = self;
  v22.super_class = (Class)SBHomeScreenOverlayViewController;
  v8 = a4;
  -[SBHomeScreenOverlayViewController viewWillTransitionToSize:withTransitionCoordinator:](&v22, sel_viewWillTransitionToSize_withTransitionCoordinator_, v8, width, height);
  SBLogCommon();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    _SBFLoggingMethodProem();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v28.width = width;
    v28.height = height;
    NSStringFromCGSize(v28);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v24 = v10;
    v25 = 2112;
    v26 = v11;
    _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "%@ to size %@", buf, 0x16u);

  }
  -[MTMaterialView layer](self->_backgroundView, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "animationForKey:", CFSTR("MatchMoveBackgroundView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeAnimationForKey:", CFSTR("MatchMoveBackgroundView"));
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __88__SBHomeScreenOverlayViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v21[3] = &unk_1E8EB8C80;
  v21[4] = self;
  *(double *)&v21[5] = width;
  *(double *)&v21[6] = height;
  v21[7] = a2;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __88__SBHomeScreenOverlayViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_55;
  v16[3] = &unk_1E8EC1AF8;
  v17 = v12;
  v18 = v13;
  v19 = self;
  v20 = a2;
  v14 = v13;
  v15 = v12;
  objc_msgSend(v8, "animateAlongsideTransition:completion:", v21, v16);

}

uint64_t __88__SBHomeScreenOverlayViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v8;
  void *v9;
  __int16 v10;
  double v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "contentWidthWithContainerWidth:", *(double *)(a1 + 40));
  v3 = v2;
  SBLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    _SBFLoggingMethodProem();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = v5;
    v10 = 2048;
    v11 = v3;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "%@ animate to width %f", (uint8_t *)&v8, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "contentWidthConstraint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setConstant:", v3);

  return objc_msgSend(*(id *)(a1 + 32), "_updateLayoutForEditButtonsWithSize:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

void __88__SBHomeScreenOverlayViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_55(uint64_t a1)
{
  double v2;
  double v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  double v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "addAnimation:forKey:", *(_QWORD *)(a1 + 40), CFSTR("MatchMoveBackgroundView"));
  objc_msgSend(*(id *)(a1 + 48), "contentWidth");
  v3 = v2;
  objc_msgSend(*(id *)(a1 + 48), "contentWidthConstraint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setConstant:", v3);

  SBLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    _SBFLoggingMethodProem();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412546;
    v8 = v6;
    v9 = 2048;
    v10 = v3;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "%@ animate completed with new width %f", (uint8_t *)&v7, 0x16u);

  }
}

- (double)layerPresentationProgress
{
  double result;

  -[UIViewFloatAnimatableProperty presentationValue](self->_overlayPresentationFloatAnimatableProperty, "presentationValue");
  return result;
}

- (void)setPresentationProgress:(double)a3
{
  -[SBHomeScreenOverlayViewController setPresentationProgress:interactive:animated:completionHandler:](self, "setPresentationProgress:interactive:animated:completionHandler:", 0, 0, 0, a3);
}

- (void)setPresentationProgress:(double)a3 interactive:(BOOL)a4 animated:(BOOL)a5 completionHandler:(id)a6
{
  uint64_t v6;
  uint64_t v7;

  v6 = 3;
  if (a4)
    v6 = 5;
  if (a5)
    v7 = v6;
  else
    v7 = 2;
  -[SBHomeScreenOverlayViewController setPresentationProgress:withAnimationUpdateMode:overrideAnimationSettings:completionHandler:](self, "setPresentationProgress:withAnimationUpdateMode:overrideAnimationSettings:completionHandler:", v7, 0, a6, a3);
}

- (void)animatePresentationProgress:(double)a3 withGestureLiftOffVelocity:(double)a4 completionHandler:(id)a5
{
  void *v8;
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
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  CAFrameRateRange v33;

  v32 = a5;
  if (-[SBFTodayGestureSettings scaleAnimationSettingsWithGestureVelocity](self->_gestureSettings, "scaleAnimationSettingsWithGestureVelocity"))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA9E08]), "initWithDefaultValues");
    -[SBFTodayGestureSettings minimumVelocity](self->_gestureSettings, "minimumVelocity");
    v10 = v9;
    -[SBFTodayGestureSettings maximumVelocity](self->_gestureSettings, "maximumVelocity");
    v12 = v11;
    -[SBFTodayGestureSettings dampingRatioAtMinimumVelocity](self->_gestureSettings, "dampingRatioAtMinimumVelocity");
    v14 = v13;
    -[SBFTodayGestureSettings dampingRatioAtMaximumVelocity](self->_gestureSettings, "dampingRatioAtMaximumVelocity");
    v16 = v15;
    -[SBFTodayGestureSettings responseAtMinimumVelocity](self->_gestureSettings, "responseAtMinimumVelocity");
    v18 = v17;
    -[SBFTodayGestureSettings responseAtMaximumVelocity](self->_gestureSettings, "responseAtMaximumVelocity");
    v20 = fabs(a4);
    v21 = v20 - v10;
    v22 = v14 + (v20 - v10) * (v16 - v14) / (v12 - v10);
    if (v14 >= v16)
      v23 = v14;
    else
      v23 = v16;
    if (v14 <= v16)
      v24 = v14;
    else
      v24 = v16;
    if (v24 >= v22)
      v22 = v24;
    if (v23 <= v22)
      v22 = v23;
    v25 = v18 + v21 * (v19 - v18) / (v12 - v10);
    if (v18 >= v19)
      v26 = v18;
    else
      v26 = v19;
    if (v18 <= v19)
      v19 = v18;
    if (v19 < v25)
      v19 = v25;
    if (v26 <= v19)
      v27 = v26;
    else
      v27 = v19;
    objc_msgSend(v8, "setDampingRatio:", v22);
    objc_msgSend(v8, "setResponse:", v27);
    -[SBFTodayGestureSettings overlayPositionSettings](self->_gestureSettings, "overlayPositionSettings");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "retargetImpulse");
    objc_msgSend(v8, "setRetargetImpulse:");

    v33 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
    objc_msgSend(v8, "setFrameRateRange:highFrameRateReason:", 1114122, *(double *)&v33.minimum, *(double *)&v33.maximum, *(double *)&v33.preferred);
  }
  else
  {
    v8 = 0;
  }
  -[SBHomeScreenOverlayViewController setPresentationProgress:withAnimationUpdateMode:overrideAnimationSettings:completionHandler:](self, "setPresentationProgress:withAnimationUpdateMode:overrideAnimationSettings:completionHandler:", 3, v8, v32, a3);
  -[SBHomeScreenOverlayViewController contentViewController](self, "contentViewController");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "view");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", a4, 0.0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "_setVelocity:forKey:", v31, CFSTR("position"));
  objc_msgSend(v30, "_setTargetVelocity:forKey:", v31, CFSTR("position"));

}

- (void)setPresentationProgress:(double)a3 withAnimationUpdateMode:(int64_t)a4 overrideAnimationSettings:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  int64_t v23;
  double v24;
  _QWORD v25[5];
  id v26;
  double v27;
  _QWORD v28[5];
  id v29;
  double v30;
  _QWORD v31[7];

  v10 = a5;
  v11 = a6;
  if (v10)
  {
    v12 = v10;
    v13 = v12;
  }
  else
  {
    -[SBFTodayGestureSettings overlayPositionSettings](self->_gestureSettings, "overlayPositionSettings");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFTodayGestureSettings overlayBackdropSettings](self->_gestureSettings, "overlayBackdropSettings");
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (self->_presentationProgress != a3)
  {
    self->_presentationProgress = a3;
    -[SBHomeScreenOverlayViewController setTransitioningPresentationProgress:](self, "setTransitioningPresentationProgress:", 1);
    -[SBHomeScreenOverlayViewController currentSidebarViewController](self, "currentSidebarViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setContentVisibility:", -[SBHomeScreenOverlayViewController childContentVisibility](self, "childContentVisibility"));
    if (-[SBHomeScreenOverlayViewController shouldUseReducedMotionAnimation](self, "shouldUseReducedMotionAnimation"))
    {
      ++self->_fadingAnimationCount;
      v15 = (void *)MEMORY[0x1E0CEABB0];
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __129__SBHomeScreenOverlayViewController_setPresentationProgress_withAnimationUpdateMode_overrideAnimationSettings_completionHandler___block_invoke;
      v31[3] = &unk_1E8E9DE88;
      v31[4] = self;
      *(double *)&v31[5] = a3;
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __129__SBHomeScreenOverlayViewController_setPresentationProgress_withAnimationUpdateMode_overrideAnimationSettings_completionHandler___block_invoke_2;
      v28[3] = &unk_1E8E9E7F8;
      v28[4] = self;
      v30 = a3;
      v29 = v11;
      objc_msgSend(v15, "sb_animateWithSettings:mode:animations:completion:", v12, a4, v31, v28);
      v16 = v29;
    }
    else
    {
      v17 = MEMORY[0x1E0C809B0];
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __129__SBHomeScreenOverlayViewController_setPresentationProgress_withAnimationUpdateMode_overrideAnimationSettings_completionHandler___block_invoke_3;
      v25[3] = &unk_1E8E9E7F8;
      v25[4] = self;
      v27 = a3;
      v26 = v11;
      v18 = (void *)MEMORY[0x1D17E5550](v25);
      v19 = (void *)MEMORY[0x1E0DA9D48];
      v20[0] = v17;
      v20[1] = 3221225472;
      v20[2] = __129__SBHomeScreenOverlayViewController_setPresentationProgress_withAnimationUpdateMode_overrideAnimationSettings_completionHandler___block_invoke_4;
      v20[3] = &unk_1E8EC1B20;
      v20[4] = self;
      v21 = v12;
      v23 = a4;
      v24 = a3;
      v22 = v13;
      objc_msgSend(v19, "perform:finalCompletion:", v20, v18);

      v16 = v26;
    }

  }
}

void __129__SBHomeScreenOverlayViewController_setPresentationProgress_withAnimationUpdateMode_overrideAnimationSettings_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "backgroundView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWeighting:", *(double *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "view");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", *(double *)(a1 + 40));

}

uint64_t __129__SBHomeScreenOverlayViewController_setPresentationProgress_withAnimationUpdateMode_overrideAnimationSettings_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 984);
  if (v3 && (*(_QWORD *)(v2 + 984) = v3 - 1, v2 = *(_QWORD *)(a1 + 32), *(_QWORD *)(v2 + 984))
    || *(double *)(v2 + 1040) != *(double *)(a1 + 48))
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend((id)v2, "setTransitioningPresentationProgress:", 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1136), "setValue:", *(double *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "_updateConstraintsForPresentationProgress:", *(double *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAlpha:", 1.0);

    v5 = 1;
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v5);
  return result;
}

uint64_t __129__SBHomeScreenOverlayViewController_setPresentationProgress_withAnimationUpdateMode_overrideAnimationSettings_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 976);
  if (v3 && (*(_QWORD *)(v2 + 976) = v3 - 1, v2 = *(_QWORD *)(a1 + 32), *(_QWORD *)(v2 + 976))
    || *(double *)(v2 + 1040) != *(double *)(a1 + 48))
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend((id)v2, "setTransitioningPresentationProgress:", 0);
    v4 = 1;
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v4);
  return result;
}

void __129__SBHomeScreenOverlayViewController_setPresentationProgress_withAnimationUpdateMode_overrideAnimationSettings_completionHandler___block_invoke_4(_QWORD *a1, _QWORD *a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(void);
  _QWORD *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[6];
  _QWORD v16[6];

  ++*(_QWORD *)(a1[4] + 976);
  v4 = (void *)MEMORY[0x1E0CEABB0];
  v5 = a1[7];
  v6 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __129__SBHomeScreenOverlayViewController_setPresentationProgress_withAnimationUpdateMode_overrideAnimationSettings_completionHandler___block_invoke_5;
  v16[3] = &unk_1E8E9DE88;
  v7 = a1[5];
  v16[4] = a1[4];
  v16[5] = a1[8];
  v8 = (void (*)(void))a2[2];
  v9 = a2;
  v8();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sb_animateWithSettings:mode:animations:completion:", v7, v5, v16, v10);

  v11 = (void *)MEMORY[0x1E0CEABB0];
  v12 = a1[6];
  v13 = a1[7];
  v15[0] = v6;
  v15[1] = 3221225472;
  v15[2] = __129__SBHomeScreenOverlayViewController_setPresentationProgress_withAnimationUpdateMode_overrideAnimationSettings_completionHandler___block_invoke_6;
  v15[3] = &unk_1E8E9DE88;
  v15[4] = a1[4];
  v15[5] = a1[8];
  ((void (*)(id, const __CFString *))a2[2])(v9, CFSTR("overlayPositionAnimation"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "sb_animateWithSettings:mode:animations:completion:", v12, v13, v15, v14);
}

void __129__SBHomeScreenOverlayViewController_setPresentationProgress_withAnimationUpdateMode_overrideAnimationSettings_completionHandler___block_invoke_5(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "backgroundView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWeighting:", *(double *)(a1 + 40));

}

uint64_t __129__SBHomeScreenOverlayViewController_setPresentationProgress_withAnimationUpdateMode_overrideAnimationSettings_completionHandler___block_invoke_6(uint64_t a1, double a2, double a3, double a4)
{
  double v5;
  _QWORD v7[5];
  uint64_t v8;

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __129__SBHomeScreenOverlayViewController_setPresentationProgress_withAnimationUpdateMode_overrideAnimationSettings_completionHandler___block_invoke_7;
  v7[3] = &unk_1E8E9DE88;
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  HIDWORD(v5) = HIDWORD(v8);
  LODWORD(v5) = *MEMORY[0x1E0CD23C0];
  LODWORD(a3) = *(_DWORD *)(MEMORY[0x1E0CD23C0] + 4);
  LODWORD(a4) = *(_DWORD *)(MEMORY[0x1E0CD23C0] + 8);
  objc_msgSend(MEMORY[0x1E0CEABB0], "sb_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 0, v7, v5, a3, a4);
  return objc_msgSend(*(id *)(a1 + 32), "_updateConstraintsForPresentationProgress:", *(double *)(a1 + 40));
}

uint64_t __129__SBHomeScreenOverlayViewController_setPresentationProgress_withAnimationUpdateMode_overrideAnimationSettings_completionHandler___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1136), "setValue:", *(double *)(a1 + 40));
}

- (void)setFromLeading:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  int *v6;
  int *v7;
  void *v8;
  id v9;
  id v10;

  v3 = a3;
  if (self->_fromLeading != a3
    || (-[SBHRootSidebarController avocadoViewController](self->_contentViewController, "avocadoViewController"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        !v5))
  {
    self->_fromLeading = v3;
    v6 = &OBJC_IVAR___SBHomeScreenOverlayViewController__leadingSidebarViewController;
    if (v3)
      v7 = &OBJC_IVAR___SBHomeScreenOverlayViewController__trailingSidebarViewController;
    else
      v7 = &OBJC_IVAR___SBHomeScreenOverlayViewController__leadingSidebarViewController;
    v8 = *(Class *)((char *)&self->super.super.super.isa + *v7);
    if (!v3)
      v6 = &OBJC_IVAR___SBHomeScreenOverlayViewController__trailingSidebarViewController;
    v9 = *(id *)((char *)&self->super.super.super.isa + *v6);
    v10 = v8;
    objc_msgSend(v9, "setContentVisibility:", -[SBHomeScreenOverlayViewController childContentVisibility](self, "childContentVisibility"));
    -[SBHRootSidebarController setAvocadoViewController:](self->_contentViewController, "setAvocadoViewController:", v9);
    -[SBHomeScreenOverlayViewController _updateConstraintsForPresentationProgress:](self, "_updateConstraintsForPresentationProgress:", self->_presentationProgress);
    objc_msgSend(v10, "setContentVisibility:", 2);

  }
}

- (BOOL)isHeaderVisible
{
  return 0;
}

- (void)setSuppressesExtraEditingButtons:(BOOL)a3
{
  if (self->_suppressesExtraEditingButtons != a3)
  {
    self->_suppressesExtraEditingButtons = a3;
    -[SBHomeScreenOverlayViewController updateExtraButtonVisibilityAnimated:](self, "updateExtraButtonVisibilityAnimated:", 1);
  }
}

- (void)setContentVisibility:(unint64_t)a3
{
  void *v4;
  unint64_t v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (self->_contentVisibility != a3)
  {
    self->_contentVisibility = a3;
    -[SBHomeScreenOverlayViewController currentSidebarViewController](self, "currentSidebarViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[SBHomeScreenOverlayViewController childContentVisibility](self, "childContentVisibility");
    SBLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      SBHStringFromContentVisibility();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      SBHStringFromContentVisibility();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543874;
      v12 = v8;
      v13 = 2114;
      v14 = v9;
      v15 = 2114;
      v16 = v10;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "Setting home screen overlay overlay controller '%{public}@' to content visibility: %{public}@, child visibility: %{public}@", (uint8_t *)&v11, 0x20u);

    }
    objc_msgSend(v4, "setContentVisibility:", v5);

  }
}

- (unint64_t)childContentVisibility
{
  double v3;

  -[SBHomeScreenOverlayViewController presentationProgress](self, "presentationProgress");
  if (v3 <= 0.0)
    return 2;
  else
    return -[SBHomeScreenOverlayViewController contentVisibility](self, "contentVisibility");
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_configureMatchMoveAnimationForBackgroundView:(id)a3 withSourceView:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  SBLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    _SBFLoggingMethodProem();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412290;
    v11 = v8;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v10, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0DA9D88], "matchMoveAnimationForPinningToView:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addAnimation:forKey:", v9, CFSTR("MatchMoveBackgroundView"));
}

- (void)_updateConstraintsForPresentationProgress:(double)a3
{
  -[SBHomeScreenOverlayViewController _updateConstraintsForPresentationProgress:layoutIfNeeded:](self, "_updateConstraintsForPresentationProgress:layoutIfNeeded:", 1, a3);
}

- (void)_updateConstraintsForPresentationProgress:(double)a3 layoutIfNeeded:(BOOL)a4
{
  _BOOL4 v4;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  _BOOL4 v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  id v25;

  v4 = a4;
  v7 = 0.0;
  if (BSFloatIsZero())
  {
    -[SBHomeScreenOverlayViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    objc_msgSend(v8, "window");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "convertRect:toView:", v17, v10, v12, v14, v16);
    v19 = v18;

    if (BSFloatIsZero())
      v7 = 0.0;
    else
      v7 = v19 + 10.0;

  }
  v20 = -[SBHomeScreenOverlayViewController isFromLeading](self, "isFromLeading");
  -[SBHomeScreenOverlayViewController contentWidth](self, "contentWidth");
  v22 = v7 + v21 * (1.0 - a3);
  if (v20)
    v23 = v22;
  else
    v23 = -v22;
  -[SBHomeScreenOverlayViewController contentLeadingConstraint](self, "contentLeadingConstraint");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setConstant:", v23);

  if (v4)
  {
    -[SBHomeScreenOverlayViewController view](self, "view");
    v25 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "layoutIfNeeded");

  }
}

- (id)newHomeScreenButtonBackgroundView
{
  void *v3;
  void *v4;

  -[SBHomeScreenOverlayViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "backgroundViewForEditingDoneButtonForHomeScreenOverlayViewController:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0DAA620], "componentBackgroundView");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)makeTitledButtonOfClass:(Class)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = -[SBHomeScreenOverlayViewController newHomeScreenButtonBackgroundView](self, "newHomeScreenButtonBackgroundView");
  v6 = [a3 alloc];
  v7 = (void *)objc_msgSend(v6, "initWithFrame:backgroundView:", v5, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v7, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHRootFolderVisualConfiguration editModeButtonContentEdgeInsets](self->_rootFolderVisualConfiguration, "editModeButtonContentEdgeInsets");
  objc_msgSend(v8, "setContentInsets:");
  objc_msgSend(v7, "setConfiguration:", v8);
  -[SBHRootFolderVisualConfiguration editModeButtonSize](self->_rootFolderVisualConfiguration, "editModeButtonSize");
  objc_msgSend(v7, "setPreferredContentFittingSize:");
  objc_msgSend(v7, "materialView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHRootSidebarController legibilitySettings](self->_contentViewController, "legibilitySettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLegibilityStyle:", objc_msgSend(v10, "style"));

  return v7;
}

- (void)setShowsDoneButton:(BOOL)a3
{
  -[SBHomeScreenOverlayViewController setShowsDoneButton:animated:](self, "setShowsDoneButton:animated:", a3, 0);
}

- (void)setShowsDoneButton:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  SBHomeScreenOverlayViewController *v13;
  _QWORD v14[5];
  id v15;

  if (self->_showsDoneButton != a3)
  {
    v4 = a4;
    v5 = a3;
    self->_showsDoneButton = a3;
    -[SBHomeScreenOverlayViewController doneButton](self, "doneButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v5)
    {
      if (!v7)
      {
        -[SBHomeScreenOverlayViewController makeTitledButtonOfClass:](self, "makeTitledButtonOfClass:", objc_opt_class());
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addTarget:action:forControlEvents:", self, sel_doneButtonTriggered_, 0x2000);
        -[SBHomeScreenOverlayViewController setDoneButton:](self, "setDoneButton:", v9);
        v10 = (void *)MEMORY[0x1E0CEABB0];
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __65__SBHomeScreenOverlayViewController_setShowsDoneButton_animated___block_invoke;
        v14[3] = &unk_1E8E9E820;
        v14[4] = self;
        v8 = v9;
        v15 = v8;
        objc_msgSend(v10, "performWithoutAnimation:", v14);

      }
      -[SBHomeScreenOverlayViewController _button:appearAnimated:](self, "_button:appearAnimated:", v8, v4);
    }
    else
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __65__SBHomeScreenOverlayViewController_setShowsDoneButton_animated___block_invoke_2;
      v11[3] = &unk_1E8E9DEB0;
      v8 = v7;
      v12 = v8;
      v13 = self;
      -[SBHomeScreenOverlayViewController _button:disappearAnimated:completion:](self, "_button:disappearAnimated:completion:", v8, v4, v11);

    }
  }
}

void __65__SBHomeScreenOverlayViewController_setShowsDoneButton_animated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  void *v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  objc_msgSend(v2, "_updateLayoutForEditButtonsWithSize:", v4, v5);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "view");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layoutIfNeeded");

}

uint64_t __65__SBHomeScreenOverlayViewController_setShowsDoneButton_animated___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  return objc_msgSend(*(id *)(a1 + 40), "setDoneButton:", 0);
}

- (void)setShowsAddWidgetButton:(BOOL)a3
{
  -[SBHomeScreenOverlayViewController setShowsAddWidgetButton:animated:](self, "setShowsAddWidgetButton:animated:", a3, 0);
}

- (void)setShowsAddWidgetButton:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  SBHomeScreenOverlayViewController *v12;
  _QWORD v13[5];
  id v14;

  if (self->_showsAddWidgetButton != a3)
  {
    v4 = a4;
    v5 = a3;
    self->_showsAddWidgetButton = a3;
    -[SBHomeScreenOverlayViewController widgetButton](self, "widgetButton");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAccessibilityIdentifier:", CFSTR("avocado-widget-add-button"));
    if (v5)
    {
      if (!v7)
      {
        -[SBHomeScreenOverlayViewController makeTitledButtonOfClass:](self, "makeTitledButtonOfClass:", objc_opt_class());
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addTarget:action:forControlEvents:", self, sel_widgetButtonTriggered_, 0x2000);
        -[SBHomeScreenOverlayViewController setWidgetButton:](self, "setWidgetButton:", v8);
        v9 = (void *)MEMORY[0x1E0CEABB0];
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __70__SBHomeScreenOverlayViewController_setShowsAddWidgetButton_animated___block_invoke;
        v13[3] = &unk_1E8E9E820;
        v13[4] = self;
        v7 = v8;
        v14 = v7;
        objc_msgSend(v9, "performWithoutAnimation:", v13);

      }
      -[SBHomeScreenOverlayViewController _button:appearAnimated:](self, "_button:appearAnimated:", v7, v4);
    }
    else
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __70__SBHomeScreenOverlayViewController_setShowsAddWidgetButton_animated___block_invoke_2;
      v10[3] = &unk_1E8E9DEB0;
      v7 = v7;
      v11 = v7;
      v12 = self;
      -[SBHomeScreenOverlayViewController _button:disappearAnimated:completion:](self, "_button:disappearAnimated:completion:", v7, v4, v10);

    }
  }
}

void __70__SBHomeScreenOverlayViewController_setShowsAddWidgetButton_animated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  void *v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  objc_msgSend(v2, "_updateLayoutForEditButtonsWithSize:", v4, v5);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "view");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layoutIfNeeded");

}

uint64_t __70__SBHomeScreenOverlayViewController_setShowsAddWidgetButton_animated___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  return objc_msgSend(*(id *)(a1 + 40), "setWidgetButton:", 0);
}

- (void)doneButtonTriggered:(id)a3
{
  id v4;

  -[SBHomeScreenOverlayViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "homeScreenOverlayViewWantsToEndEditing:", self);

}

- (void)widgetButtonTriggered:(id)a3
{
  id v4;

  -[SBHomeScreenOverlayViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "homeScreenOverlayViewWantsWidgetEditingViewControllerPresented:", self);

}

- (void)_button:(id)a3 appearAnimated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  SBHomeScreenOverlayViewController *v14;
  _QWORD v15[4];
  id v16;

  v4 = a4;
  v6 = a3;
  v7 = v6;
  if (v4)
  {
    v8 = (void *)MEMORY[0x1E0CEABB0];
    v9 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __60__SBHomeScreenOverlayViewController__button_appearAnimated___block_invoke;
    v15[3] = &unk_1E8E9DED8;
    v10 = v6;
    v16 = v10;
    objc_msgSend(v8, "performWithoutAnimation:", v15);
    v11 = (void *)MEMORY[0x1E0CEABB0];
    v12[0] = v9;
    v12[1] = 3221225472;
    v12[2] = __60__SBHomeScreenOverlayViewController__button_appearAnimated___block_invoke_2;
    v12[3] = &unk_1E8E9E820;
    v13 = v10;
    v14 = self;
    objc_msgSend(v11, "animateWithDuration:animations:", v12, 0.2);

  }
}

uint64_t __60__SBHomeScreenOverlayViewController__button_appearAnimated___block_invoke(uint64_t a1)
{
  void *v2;
  CGAffineTransform v4;

  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  v2 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v4, 0.01, 0.01);
  return objc_msgSend(v2, "setTransform:", &v4);
}

uint64_t __60__SBHomeScreenOverlayViewController__button_appearAnimated___block_invoke_2(uint64_t a1)
{
  void *v2;
  __int128 v3;
  _OWORD v5[3];

  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", *(double *)(*(_QWORD *)(a1 + 40) + 1024));
  v2 = *(void **)(a1 + 32);
  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v5[0] = *MEMORY[0x1E0C9BAA8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  return objc_msgSend(v2, "setTransform:", v5);
}

- (void)_button:(id)a3 disappearAnimated:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v6 = a4;
  v7 = a3;
  v8 = a5;
  v9 = v8;
  if (v6)
  {
    v10 = (void *)MEMORY[0x1E0CEABB0];
    v11 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __74__SBHomeScreenOverlayViewController__button_disappearAnimated_completion___block_invoke;
    v14[3] = &unk_1E8E9DED8;
    v15 = v7;
    v12[0] = v11;
    v12[1] = 3221225472;
    v12[2] = __74__SBHomeScreenOverlayViewController__button_disappearAnimated_completion___block_invoke_2;
    v12[3] = &unk_1E8E9F1C0;
    v13 = v9;
    objc_msgSend(v10, "animateWithDuration:animations:completion:", v14, v12, 0.2);

  }
  else if (v8)
  {
    (*((void (**)(id, uint64_t))v8 + 2))(v8, 1);
  }

}

uint64_t __74__SBHomeScreenOverlayViewController__button_disappearAnimated_completion___block_invoke(uint64_t a1)
{
  void *v2;
  CGAffineTransform v4;

  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  v2 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v4, 0.01, 0.01);
  return objc_msgSend(v2, "setTransform:", &v4);
}

uint64_t __74__SBHomeScreenOverlayViewController__button_disappearAnimated_completion___block_invoke_2(uint64_t result, int a2)
{
  if (a2)
  {
    result = *(_QWORD *)(result + 32);
    if (result)
      return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

- (void)_updateLayoutForEditButtonsWithSize:(CGSize)a3
{
  void *v4;
  void *v5;
  __int128 v6;
  _BOOL8 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  -[SBHomeScreenOverlayViewController doneButton](self, "doneButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHomeScreenOverlayViewController widgetButton](self, "widgetButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  v10 = *MEMORY[0x1E0C9D648];
  v11 = v6;
  v8 = v10;
  v9 = v6;
  v7 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1;
  BSRectWithSize();
  objc_msgSend(MEMORY[0x1E0DAA658], "_editButtonLayoutFramesInBounds:forVisualConfiguration:withTranslationOffset:inRTL:doneButton:addWidgetButton:doneButtonFrame:addWidgetButtonFrame:", self->_rootFolderVisualConfiguration, v7, v4, v5, &v8, &v10);
  objc_msgSend(v4, "sb_setBoundsAndPositionFromFrame:", v8, v9);
  objc_msgSend(v5, "sb_setBoundsAndPositionFromFrame:", v10, v11);

}

- (unint64_t)presenterType
{
  return 1;
}

- (BOOL)isDisplayingEditingButtons
{
  return -[SBHomeScreenOverlayViewController showsDoneButton](self, "showsDoneButton")
      || -[SBHomeScreenOverlayViewController showsAddWidgetButton](self, "showsAddWidgetButton");
}

- (void)updateExtraButtonVisibilityAnimated:(BOOL)a3
{
  _BOOL8 v3;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL4 v9;
  uint64_t v10;
  void *v11;
  id v12;

  v3 = a3;
  -[SBHomeScreenOverlayViewController delegate](self, "delegate");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v12, "showsAddWidgetButtonWhileEditingForHomeScreenOverlayViewController:", self);
  v6 = objc_msgSend(v12, "showsDoneButtonWhileEditingForHomeScreenOverlayViewController:", self);
  v7 = objc_msgSend(v12, "isEditingForHomeScreenOverlayViewController:", self);
  v8 = -[SBHomeScreenOverlayViewController interfaceOrientation](self, "interfaceOrientation");
  v9 = -[SBHomeScreenOverlayViewController suppressesExtraEditingButtons](self, "suppressesExtraEditingButtons");
  if (!(_DWORD)v7)
  {
    v10 = 0;
    goto LABEL_8;
  }
  v7 = !v9;
  v10 = v6 & v7;
  if (!v5)
    goto LABEL_6;
  if ((unint64_t)(v8 - 1) >= 2)
  {
    if (__sb__runningInSpringBoard())
    {
      if (SBFEffectiveDeviceClass() != 2)
LABEL_6:
        v7 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "userInterfaceIdiom") == 1)
        v7 = v7;
      else
        v7 = 0;

    }
  }
LABEL_8:
  -[SBHomeScreenOverlayViewController setShowsDoneButton:animated:](self, "setShowsDoneButton:animated:", v10, v3);
  -[SBHomeScreenOverlayViewController setShowsAddWidgetButton:animated:](self, "setShowsAddWidgetButton:animated:", v7, v3);

}

- (void)setTitledButtonsAlpha:(double)a3
{
  NSObject *v5;
  int v6;
  double v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (self->_titledButtonsAlpha != a3)
  {
    self->_titledButtonsAlpha = a3;
    SBLogRootController();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 134349056;
      v7 = a3;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "SBHomeScreenOverlayViewController setTitledButtonsAlpha: %{public}f", (uint8_t *)&v6, 0xCu);
    }

    -[SBTitledHomeScreenButton setAlpha:](self->_doneButton, "setAlpha:", a3);
    -[SBTitledHomeScreenButton setAlpha:](self->_widgetButton, "setAlpha:", a3);
  }
}

- (void)setSuppressesEditingStateForListView:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[SBHomeScreenOverlayViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "homeScreenOverlayViewController:setSuppressesEditingStateForListView:", self, v3);

}

- (BOOL)isLibraryPresentationModal
{
  return 0;
}

- (BOOL)hasBackgroundBlur
{
  return 1;
}

- (BOOL)isPresentingLibraryInMostForegroundState:(id)a3
{
  id v4;
  void *v5;
  id v6;
  char v7;

  v4 = a3;
  -[SBHomeScreenOverlayViewController contentViewController](self, "contentViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "avocadoViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 == v4)
    v7 = objc_msgSend(v4, "bs_isAppearingOrAppeared");
  else
    v7 = 0;

  return v7;
}

- (id)acquireUseSnapshotAsBackgroundViewAssertionForReason:(id)a3
{
  id v4;
  NSCountedSet *reasonsToSnapshotBackgroundView;
  NSCountedSet *v6;
  NSCountedSet *v7;
  NSCountedSet *v8;
  id v9;
  NSCountedSet *v10;
  id v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  NSCountedSet *v18;
  id v19;
  id v20;
  id location;

  v4 = a3;
  reasonsToSnapshotBackgroundView = self->_reasonsToSnapshotBackgroundView;
  if (!reasonsToSnapshotBackgroundView)
  {
    objc_msgSend(MEMORY[0x1E0CB3550], "set");
    v6 = (NSCountedSet *)objc_claimAutoreleasedReturnValue();
    v7 = self->_reasonsToSnapshotBackgroundView;
    self->_reasonsToSnapshotBackgroundView = v6;

    reasonsToSnapshotBackgroundView = self->_reasonsToSnapshotBackgroundView;
  }
  v8 = reasonsToSnapshotBackgroundView;
  -[NSCountedSet addObject:](v8, "addObject:", v4);
  objc_initWeak(&location, self);
  v9 = objc_alloc(MEMORY[0x1E0D01868]);
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __90__SBHomeScreenOverlayViewController_acquireUseSnapshotAsBackgroundViewAssertionForReason___block_invoke;
  v17 = &unk_1E8EC1B48;
  v10 = v8;
  v18 = v10;
  v11 = v4;
  v19 = v11;
  objc_copyWeak(&v20, &location);
  v12 = (void *)objc_msgSend(v9, "initWithIdentifier:forReason:invalidationBlock:", CFSTR("SBHomeScreenOverlayViewController"), v11, &v14);
  -[SBHomeScreenOverlayViewController _updateBackgroundView](self, "_updateBackgroundView", v14, v15, v16, v17);
  objc_destroyWeak(&v20);

  objc_destroyWeak(&location);
  return v12;
}

void __90__SBHomeScreenOverlayViewController_acquireUseSnapshotAsBackgroundViewAssertionForReason___block_invoke(uint64_t a1)
{
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 32), "removeObject:", *(_QWORD *)(a1 + 40));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_updateBackgroundView");

}

- (void)setTransitioningPresentationProgress:(BOOL)a3
{
  if (self->_transitioningPresentationProgress != a3)
  {
    self->_transitioningPresentationProgress = a3;
    -[SBHomeScreenOverlayViewController _updateBackgroundView](self, "_updateBackgroundView");
  }
}

- (void)_updateBackgroundView
{
  _BOOL4 v3;
  int v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint8_t v9[16];
  uint8_t buf[16];

  v3 = !-[SBHomeScreenOverlayViewController isTransitioningPresentationProgress](self, "isTransitioningPresentationProgress")&& (-[SBHomeScreenOverlayViewController presentationProgress](self, "presentationProgress"), BSFloatEqualToFloat())&& -[NSCountedSet count](self->_reasonsToSnapshotBackgroundView, "count") != 0;
  v4 = -[MTMaterialView isContentReplacedWithSnapshot](self->_backgroundView, "isContentReplacedWithSnapshot");
  if (!v3 || (v4 & 1) != 0)
  {
    if (((v3 | v4 ^ 1) & 1) == 0)
    {
      SBLogCommon();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_INFO, "[SBHomeScreenOverlayViewController] Returning background to live blur", v9, 2u);
      }

      -[MTMaterialView setContentReplacedWithSnapshot:](self->_backgroundView, "setContentReplacedWithSnapshot:", 0);
      -[MTMaterialView layer](self->_backgroundView, "layer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setContentsOpaque:", 0);

      -[MTMaterialView layoutIfNeeded](self->_backgroundView, "layoutIfNeeded");
    }
  }
  else
  {
    SBLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_INFO, "[SBHomeScreenOverlayViewController] Replacing background with snapshot", buf, 2u);
    }

    -[MTMaterialView setContentReplacedWithSnapshot:](self->_backgroundView, "setContentReplacedWithSnapshot:", 1);
    -[MTMaterialView layer](self->_backgroundView, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setContentsOpaque:", 1);

  }
}

- (unint64_t)contentVisibility
{
  return self->_contentVisibility;
}

- (double)titledButtonsAlpha
{
  return self->_titledButtonsAlpha;
}

- (SBHomeScreenOverlayViewControllerDelegate)delegate
{
  return (SBHomeScreenOverlayViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (double)presentationProgress
{
  return self->_presentationProgress;
}

- (BOOL)isFromLeading
{
  return self->_fromLeading;
}

- (BOOL)shouldUseReducedMotionAnimation
{
  return self->_shouldUseReducedMotionAnimation;
}

- (void)setShouldUseReducedMotionAnimation:(BOOL)a3
{
  self->_shouldUseReducedMotionAnimation = a3;
}

- (SBHRootSidebarController)contentViewController
{
  return self->_contentViewController;
}

- (SBHVisibleContentPresenter)leadingSidebarViewController
{
  return self->_leadingSidebarViewController;
}

- (SBHVisibleContentPresenter)trailingSidebarViewController
{
  return self->_trailingSidebarViewController;
}

- (BOOL)suppressesExtraEditingButtons
{
  return self->_suppressesExtraEditingButtons;
}

- (SBIconListLayoutProvider)listLayoutProvider
{
  return self->_listLayoutProvider;
}

- (MTMaterialView)backgroundView
{
  return self->_backgroundView;
}

- (SBHRootFolderVisualConfiguration)rootFolderVisualConfiguration
{
  return self->_rootFolderVisualConfiguration;
}

- (NSLayoutConstraint)contentLeadingConstraint
{
  return self->_contentLeadingConstraint;
}

- (void)setContentLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_contentLeadingConstraint, a3);
}

- (NSLayoutConstraint)contentWidthConstraint
{
  return self->_contentWidthConstraint;
}

- (void)setContentWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_contentWidthConstraint, a3);
}

- (SBTitledHomeScreenButton)doneButton
{
  return self->_doneButton;
}

- (void)setDoneButton:(id)a3
{
  objc_storeStrong((id *)&self->_doneButton, a3);
}

- (SBTitledHomeScreenButton)widgetButton
{
  return self->_widgetButton;
}

- (void)setWidgetButton:(id)a3
{
  objc_storeStrong((id *)&self->_widgetButton, a3);
}

- (BOOL)showsDoneButton
{
  return self->_showsDoneButton;
}

- (BOOL)showsAddWidgetButton
{
  return self->_showsAddWidgetButton;
}

- (SBFTodayGestureSettings)gestureSettings
{
  return self->_gestureSettings;
}

- (void)setGestureSettings:(id)a3
{
  objc_storeStrong((id *)&self->_gestureSettings, a3);
}

- (UIViewFloatAnimatableProperty)overlayPresentationFloatAnimatableProperty
{
  return self->_overlayPresentationFloatAnimatableProperty;
}

- (void)setOverlayPresentationFloatAnimatableProperty:(id)a3
{
  objc_storeStrong((id *)&self->_overlayPresentationFloatAnimatableProperty, a3);
}

- (BOOL)isTransitioningPresentationProgress
{
  return self->_transitioningPresentationProgress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlayPresentationFloatAnimatableProperty, 0);
  objc_storeStrong((id *)&self->_gestureSettings, 0);
  objc_storeStrong((id *)&self->_widgetButton, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_contentWidthConstraint, 0);
  objc_storeStrong((id *)&self->_contentLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_rootFolderVisualConfiguration, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_listLayoutProvider, 0);
  objc_storeStrong((id *)&self->_trailingSidebarViewController, 0);
  objc_storeStrong((id *)&self->_leadingSidebarViewController, 0);
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_reasonsToSnapshotBackgroundView, 0);
}

@end
