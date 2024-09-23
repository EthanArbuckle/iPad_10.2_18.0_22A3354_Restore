@implementation SBHStackConfigurationViewController

- (SBHStackConfigurationViewController)initWithConfiguration:(id)a3 iconView:(id)a4 iconViewProvider:(id)a5 listLayoutProvider:(id)a6 showsAddButton:(BOOL)a7 showsDoneButton:(BOOL)a8
{
  id v15;
  id v16;
  id v17;
  SBHStackConfigurationViewController *v18;
  SBHStackConfigurationViewController *v19;
  uint64_t v20;
  SBIconViewDelegate *defaultIconViewDelegate;
  void *v22;
  uint64_t v23;
  SBHWidgetSettings *widgetSettings;
  SBHScrollableConfiguringIconViewInteraction *v25;
  SBHScrollableIconViewInteraction *scrollingInteraction;
  SBIconDragManager *v27;
  SBIconDragManager *iconDragManager;
  void *v29;
  SBHRootFolderVisualConfiguration *v30;
  SBHRootFolderVisualConfiguration *rootFolderVisualConfiguration;
  void *v32;
  void *v33;
  void *v34;
  unsigned __int16 v35;
  id v37;
  id v38;
  objc_super v39;

  v15 = a3;
  v16 = a4;
  v38 = a5;
  v17 = a6;
  v39.receiver = self;
  v39.super_class = (Class)SBHStackConfigurationViewController;
  v18 = -[SBHStackConfigurationViewController init](&v39, sel_init);
  v19 = v18;
  if (v18)
  {
    v37 = v15;
    objc_storeStrong((id *)&v18->_listLayoutProvider, a6);
    objc_storeStrong((id *)&v19->_iconViewProvider, a5);
    objc_storeStrong((id *)&v19->_configuration, a3);
    objc_storeStrong((id *)&v19->_stackIconView, a4);
    v19->_titledButtonsAlpha = 1.0;
    v19->_needsAddButton = a7;
    v19->_needsDoneButton = a8;
    v19->_canDismissWhileDragging = 1;
    objc_msgSend(v16, "delegate");
    v20 = objc_claimAutoreleasedReturnValue();
    defaultIconViewDelegate = v19->_defaultIconViewDelegate;
    v19->_defaultIconViewDelegate = (SBIconViewDelegate *)v20;

    +[SBHHomeScreenDomain rootSettings](SBHHomeScreenDomain, "rootSettings");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "widgetSettings");
    v23 = objc_claimAutoreleasedReturnValue();
    widgetSettings = v19->_widgetSettings;
    v19->_widgetSettings = (SBHWidgetSettings *)v23;

    v25 = -[SBHScrollableIconViewInteraction initWithContainer:]([SBHScrollableConfiguringIconViewInteraction alloc], "initWithContainer:", v19);
    scrollingInteraction = v19->_scrollingInteraction;
    v19->_scrollingInteraction = &v25->super;

    v27 = objc_alloc_init(SBIconDragManager);
    iconDragManager = v19->_iconDragManager;
    v19->_iconDragManager = v27;

    -[SBIconDragManager setDelegate:](v19->_iconDragManager, "setDelegate:", v19);
    -[SBIconListLayoutProvider layoutForIconLocation:](v19->_listLayoutProvider, "layoutForIconLocation:", CFSTR("SBIconLocationRoot"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v29, "rootFolderVisualConfiguration");
      v30 = (SBHRootFolderVisualConfiguration *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v30 = objc_alloc_init(SBHRootFolderVisualConfiguration);
    }
    rootFolderVisualConfiguration = v19->_rootFolderVisualConfiguration;
    v19->_rootFolderVisualConfiguration = v30;

    SBHIconListLayoutIconGridSizeClassSizes(v29);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "icon");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "gridSizeClass");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v32, "gridSizeForGridSizeClass:", v34);

    v19->_stackSizeIsSmall = v35 <= (unsigned __int16)objc_msgSend(v32, "gridSizeForGridSizeClass:", CFSTR("SBHIconGridSizeClassSmall"));
    v15 = v37;
  }

  return v19;
}

- (void)loadView
{
  SBHStackConfigurationView *v3;
  void *v4;
  SBHStackConfigurationView *v5;
  void *v6;
  _BOOL4 v7;
  SBHWidgetSettings *widgetSettings;
  void *v9;
  uint64_t v10;
  __CFString *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  MTMaterialView *backgroundMaterialView;
  id v21;
  double v22;
  SBHStackConfigurationBackgroundDimmingView *v23;
  SBHStackConfigurationBackgroundDimmingView *v24;
  void *v25;
  SBHStackConfigurationBackgroundDimmingView *backgroundDimmingView;
  SBHStackConfigurationBackgroundDimmingView *v27;
  SBHTouchPassThroughView *v28;
  UIView *v29;
  UIView *scalingView;
  UIView *v31;
  SBHTouchPassThroughView *v32;
  UIView *v33;
  UIView *contentView;
  objc_super v35;

  v35.receiver = self;
  v35.super_class = (Class)SBHStackConfigurationViewController;
  -[SBHStackConfigurationViewController loadView](&v35, sel_loadView);
  v3 = [SBHStackConfigurationView alloc];
  -[SBHStackConfigurationViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v5 = -[SBHStackConfigurationView initWithFrame:](v3, "initWithFrame:");

  -[SBHStackConfigurationView setDelegate:](v5, "setDelegate:", self);
  -[SBHStackConfigurationViewController setView:](self, "setView:", v5);
  -[SBHStackConfigurationViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SBHWidgetSettings stackConfigurationBlursBackground](self->_widgetSettings, "stackConfigurationBlursBackground");
  widgetSettings = self->_widgetSettings;
  if (v7)
  {
    if (-[SBHWidgetSettings stackConfigurationUsesFolderBlur](widgetSettings, "stackConfigurationUsesFolderBlur"))
    {
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "sbf_animatedBlurRadiusGraphicsQuality");

      v11 = CFSTR("folderExpandedBackgroundHomeSimplified");
      if (v10 == 100)
        v11 = CFSTR("folderExpandedBackgroundHome");
      v12 = (void *)MEMORY[0x1E0D47498];
      v13 = v11;
      SBHBundle();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "materialViewWithRecipeNamed:inBundle:options:initialWeighting:scaleAdjustment:", v13, v14, 0, 0, 1.0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v18 = (void *)MEMORY[0x1E0D47498];
      SBHBundle();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "materialViewWithRecipeNamed:inBundle:options:initialWeighting:scaleAdjustment:", CFSTR("stackConfigurationBackground"), v14, 0, 0, 1.0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(v6, "bounds");
    objc_msgSend(v15, "setFrame:");
    objc_msgSend(v15, "setAutoresizingMask:", 18);
    SBHHomeScreenMaterialViewBackdropScaleAdjustmentHandlerForCurrentDevice();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setBackdropScaleAdjustment:", v19);

    objc_msgSend(v15, "setGroupNameBase:", CFSTR("Widget-Stack-Configuration"));
    objc_msgSend(v6, "addSubview:", v15);
    backgroundMaterialView = self->_backgroundMaterialView;
    self->_backgroundMaterialView = (MTMaterialView *)v15;
    v21 = v15;

    -[SBHWidgetSettings stackConfigurationDimmingAlpha](self->_widgetSettings, "stackConfigurationDimmingAlpha");
    v17 = v22;

  }
  else
  {
    -[SBHWidgetSettings stackConfigurationNoBlurDimmingAlpha](widgetSettings, "stackConfigurationNoBlurDimmingAlpha");
    v17 = v16;
  }
  v23 = [SBHStackConfigurationBackgroundDimmingView alloc];
  objc_msgSend(v6, "bounds");
  v24 = -[SBHStackConfigurationBackgroundDimmingView initWithFrame:](v23, "initWithFrame:");
  -[SBHStackConfigurationBackgroundDimmingView setAutoresizingMask:](v24, "setAutoresizingMask:", 18);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, v17);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHStackConfigurationBackgroundDimmingView setBackgroundColor:](v24, "setBackgroundColor:", v25);

  objc_msgSend(v6, "addSubview:", v24);
  backgroundDimmingView = self->_backgroundDimmingView;
  self->_backgroundDimmingView = v24;
  v27 = v24;

  v28 = [SBHTouchPassThroughView alloc];
  objc_msgSend(v6, "bounds");
  v29 = -[SBHTouchPassThroughView initWithFrame:](v28, "initWithFrame:");
  -[UIView setAutoresizingMask:](v29, "setAutoresizingMask:", 18);
  objc_msgSend(v6, "addSubview:", v29);
  scalingView = self->_scalingView;
  self->_scalingView = v29;
  v31 = v29;

  v32 = [SBHTouchPassThroughView alloc];
  -[UIView bounds](v31, "bounds");
  v33 = -[SBHTouchPassThroughView initWithFrame:](v32, "initWithFrame:");
  -[UIView addSubview:](v31, "addSubview:", v33);
  contentView = self->_contentView;
  self->_contentView = v33;

}

- (void)viewDidLoad
{
  void *v3;
  UIView *v4;
  UIView *v5;
  SBHStackConfigurationApertureView *v6;
  BSUIScrollView *v7;
  UIView *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SBHStackConfigurationViewController;
  -[SBHStackConfigurationViewController viewDidLoad](&v12, sel_viewDidLoad);
  -[SBHStackConfigurationViewController presenter](self, "presenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[SBHStackConfigurationViewController setOverrideUserInterfaceStyle:](self, "setOverrideUserInterfaceStyle:", objc_msgSend(v3, "overrideUserInterfaceStyleForPresentingWidgetSheet"));
  -[SBHStackConfigurationViewController contentBoundingFrame](self, "contentBoundingFrame");
  -[SBHStackConfigurationViewController _setupContentViewWithContentFrame:](self, "_setupContentViewWithContentFrame:");
  v4 = self->_contentView;
  -[SBHStackConfigurationViewController _setupBackgroundInContainer:](self, "_setupBackgroundInContainer:", v4);
  v5 = self->_contentView;
  -[SBHStackConfigurationViewController _setupApertureViewInContainer:](self, "_setupApertureViewInContainer:", v5);
  v6 = self->_apertureView;
  -[SBHStackConfigurationViewController _setupScrollViewInContainer:](self, "_setupScrollViewInContainer:", v6);
  v7 = self->_scrollView;
  -[SBHStackConfigurationViewController _setupIconListViewCenteredInScrollView:](self, "_setupIconListViewCenteredInScrollView:", v7);
  v8 = self->_contentView;
  -[SBHStackConfigurationViewController _setupPageControlInContainer:](self, "_setupPageControlInContainer:", v8);
  -[SBHStackConfigurationViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHStackConfigurationViewController _setupTapToDismissGestureInView:](self, "_setupTapToDismissGestureInView:", v9);
  -[SBHStackConfigurationViewController _setupEditingButtons](self, "_setupEditingButtons");
  -[SBHStackConfigurationViewController _setupLargeSizeLayoutAdjustmentsIfNecessary](self, "_setupLargeSizeLayoutAdjustmentsIfNecessary");
  -[SBHStackConfigurationApertureView setContentScrollView:](self->_apertureView, "setContentScrollView:", self->_scrollView);
  -[SBHStackConfigurationApertureView setIconImageInfo:](self->_apertureView, "setIconImageInfo:", self->_iconImageInfo.size.width, self->_iconImageInfo.size.height, self->_iconImageInfo.scale, self->_iconImageInfo.continuousCornerRadius);
  -[SBHStackConfigurationApertureView setIconListView:](self->_apertureView, "setIconListView:", self->_iconListView);
  self->_scrollPositionNeed = 1;
  -[SBHStackConfigurationViewController _stableApertureSize](self, "_stableApertureSize");
  -[SBHStackConfigurationBackgroundViewController setApertureSize:](self->_backgroundViewController, "setApertureSize:");
  -[SBHStackConfigurationBackgroundDimmingView setIconListView:](self->_backgroundDimmingView, "setIconListView:", self->_iconListView);
  -[UIPageControl setAccessibilityIdentifier:](self->_pageControl, "setAccessibilityIdentifier:", CFSTR("stack-configuration-page-control"));
  -[SBHStackConfigurationApertureView setAccessibilityIdentifier:](self->_apertureView, "setAccessibilityIdentifier:", CFSTR("stack-configuration-aperture-view"));
  -[CCUILabeledRoundButtonViewController button](self->_smartRotateButtonViewController, "button");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAccessibilityIdentifier:", CFSTR("stack-configuration-smart-rotate-button"));

  -[CCUILabeledRoundButtonViewController button](self->_suggestionsButtonViewController, "button");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setAccessibilityIdentifier:", CFSTR("stack-configuration-suggestions-button"));
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBHStackConfigurationViewController;
  -[SBHStackConfigurationViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[SBIconListView showAllIcons](self->_iconListView, "showAllIcons");
  -[SBHStackConfigurationViewController _updatePresentationModeForIconViews](self, "_updatePresentationModeForIconViews");
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBHStackConfigurationViewController;
  -[SBHStackConfigurationViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[SBHStackConfigurationViewController _updateLayoutForEditButtons](self, "_updateLayoutForEditButtons");
  if (self->_scrollPositionNeed)
  {
    -[SBHStackConfigurationViewController _scrollToWidgetIndex:animated:](self, "_scrollToWidgetIndex:animated:", -[SBHStackConfigurationViewController _sourceActiveWidgetIndex](self, "_sourceActiveWidgetIndex"), 0);
    self->_scrollPositionNeed = 0;
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBHStackConfigurationViewController;
  -[SBHStackConfigurationViewController viewDidAppear:](&v7, sel_viewDidAppear_, a3);
  -[SBHStackConfigurationViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sb_coronaAnimationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addParticipant:", self);
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBHStackConfigurationViewController;
  -[SBHStackConfigurationViewController viewDidDisappear:](&v7, sel_viewDidDisappear_, a3);
  -[SBHStackConfigurationViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sb_coronaAnimationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "removeParticipant:", self);
}

- (void)didMoveToParentViewController:(id)a3
{
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBHStackConfigurationViewController;
  -[SBHStackConfigurationViewController didMoveToParentViewController:](&v7, sel_didMoveToParentViewController_);
  if (a3)
  {
    -[SBHStackConfigurationViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBHStackConfigurationViewController _setupMatchMoveAnimationWithSourceView:targetView:](self, "_setupMatchMoveAnimationWithSourceView:targetView:", v6, self->_backgroundDimmingView);
    -[SBHStackConfigurationViewController _setupMatchMoveAnimationWithSourceView:targetView:](self, "_setupMatchMoveAnimationWithSourceView:targetView:", v6, self->_backgroundMaterialView);

  }
}

- (unint64_t)supportedInterfaceOrientations
{
  _BOOL4 v2;
  void *v3;

  if (__sb__runningInSpringBoard())
  {
    v2 = SBFEffectiveDeviceClass() == 2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v3, "userInterfaceIdiom") == 1;

  }
  if (v2)
    return 30;
  else
    return 2;
}

- (void)setEditingIcons:(BOOL)a3
{
  if (self->_editingIcons != a3)
  {
    self->_editingIcons = a3;
    -[SBHStackConfigurationViewController _updateEditingStateAnimated:](self, "_updateEditingStateAnimated:", 1);
  }
}

- (SBLeafIconDataSource)visiblyActiveDataSource
{
  void *v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;

  -[SBIconView icon](self->_stackIconView, "icon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "iconDataSourceCount"))
  {
    -[BSUIScrollView contentOffset](self->_scrollView, "contentOffset");
    v4 = -[SBHStackConfigurationViewController _widgetIndexForContentOffset:](self, "_widgetIndexForContentOffset:");
    v5 = objc_msgSend(v3, "iconDataSourceCount");
    if (v5 - 1 < v4)
      v4 = v5 - 1;
    objc_msgSend(v3, "iconDataSources");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndex:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return (SBLeafIconDataSource *)v7;
}

- (SBIconView)sourceStackIconView
{
  return self->_stackIconView;
}

- (id)animationCoordinator
{
  NSObject *v4;

  if ((-[SBHStackConfigurationViewController isViewLoaded](self, "isViewLoaded") & 1) == 0)
  {
    SBLogIcon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[SBHStackConfigurationViewController animationCoordinator].cold.1((uint64_t)self, a2, v4);

    -[SBHStackConfigurationViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  }
  return self;
}

- (SBIconListView)iconListView
{
  return self->_iconListView;
}

- (id)keepIconImageViewControllersStaticForReason:(id)a3
{
  id v4;
  id v5;
  void *v6;
  NSHashTable *keepStaticAssertions;
  NSHashTable *v8;
  NSHashTable *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = objc_alloc(MEMORY[0x1E0D01868]);
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __83__SBHStackConfigurationViewController_keepIconImageViewControllersStaticForReason___block_invoke;
  v14 = &unk_1E8D85A30;
  objc_copyWeak(&v15, &location);
  v6 = (void *)objc_msgSend(v5, "initWithIdentifier:forReason:invalidationBlock:", CFSTR("KeepStackIconImagesStatic"), v4, &v11);
  keepStaticAssertions = self->_keepStaticAssertions;
  if (!keepStaticAssertions)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable", v11, v12, v13, v14);
    v8 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v9 = self->_keepStaticAssertions;
    self->_keepStaticAssertions = v8;

    keepStaticAssertions = self->_keepStaticAssertions;
  }
  -[NSHashTable addObject:](keepStaticAssertions, "addObject:", v6, v11, v12, v13, v14);
  -[SBHStackConfigurationViewController _updatePresentationModeForIconViews](self, "_updatePresentationModeForIconViews");
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v6;
}

void __83__SBHStackConfigurationViewController_keepIconImageViewControllersStaticForReason___block_invoke(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id *v4;
  id v5;

  v5 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[158], "removeObject:", v5);
    objc_msgSend(v4, "_updatePresentationModeForIconViews");
  }

}

- (void)scrollIconToVisible:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  void (**v8)(_QWORD);
  SBIconListView *iconListView;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD aBlock[4];
  void (**v15)(_QWORD);

  v5 = a4;
  v8 = (void (**)(_QWORD))a5;
  iconListView = self->_iconListView;
  v10 = a3;
  -[SBIconListView icons](iconListView, "icons");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "indexOfObject:", v10);

  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v8)
      v8[2](v8);
  }
  else
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __79__SBHStackConfigurationViewController_scrollIconToVisible_animated_completion___block_invoke;
    aBlock[3] = &unk_1E8D86600;
    v15 = v8;
    v13 = _Block_copy(aBlock);
    -[SBHStackConfigurationViewController _scrollToWidgetIndex:animated:completion:](self, "_scrollToWidgetIndex:animated:completion:", v12, v5, v13);

  }
}

uint64_t __79__SBHStackConfigurationViewController_scrollIconToVisible_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
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

    -[SBIconListView setOverrideIconImageAppearance:](self->_iconListView, "setOverrideIconImageAppearance:", v6);
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

    -[SBIconListView setOverrideIconImageStyleConfiguration:](self->_iconListView, "setOverrideIconImageStyleConfiguration:", v6);
  }

}

- (id)nonEditingStatusBarHidingReason
{
  return CFSTR("SBHStackConfigurationPresentedReason");
}

- (BOOL)hidesPresenterTitledButtons
{
  return 1;
}

- (NSMutableDictionary)userInfo
{
  NSMutableDictionary *userInfo;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;

  userInfo = self->_userInfo;
  if (!userInfo)
  {
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v5 = self->_userInfo;
    self->_userInfo = v4;

    userInfo = self->_userInfo;
  }
  return userInfo;
}

- (unint64_t)presenterType
{
  return 2;
}

- (BOOL)isDisplayingEditingButtons
{
  return self->_needsAddButton || self->_needsDoneButton;
}

- (void)setSuppressesEditingStateForListView:(BOOL)a3
{
  if (self->_suppressesEditingStateForListView != a3)
  {
    self->_suppressesEditingStateForListView = a3;
    -[SBHStackConfigurationViewController _updateEditingStateAnimated:](self, "_updateEditingStateAnimated:", 1);
  }
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
    SBLogIcon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 134349056;
      v7 = a3;
      _os_log_impl(&dword_1CFEF3000, v5, OS_LOG_TYPE_DEFAULT, "SBHStackConfigurationViewController setTitledButtonsAlpha: %{public}f", (uint8_t *)&v6, 0xCu);
    }

    -[SBTitledHomeScreenButton setAlpha:](self->_doneButton, "setAlpha:", a3);
    -[SBTitledHomeScreenButton setAlpha:](self->_addButton, "setAlpha:", a3);
  }
}

- (SBIconView)sourceIconView
{
  return self->_stackIconView;
}

- (UIView)widgetContentContainerView
{
  return self->_contentView;
}

- (NSSet)materialViews
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_safeAddObject:", self->_backgroundMaterialView);
  return (NSSet *)v3;
}

- (NSSet)fadingViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", self->_backgroundDimmingView);
  -[CCUILabeledRoundButtonViewController view](self->_smartRotateButtonViewController, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  -[CCUILabeledRoundButtonViewController view](self->_suggestionsButtonViewController, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v5);

  -[SBHStackConfigurationViewController presenter](self, "presenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6 || (objc_msgSend(v6, "isDisplayingEditingButtons") & 1) == 0)
  {
    -[SBHStackConfigurationViewController doneButton](self, "doneButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bs_safeAddObject:", v8);

    -[SBHStackConfigurationViewController addButton](self, "addButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bs_safeAddObject:", v9);

  }
  return (NSSet *)v3;
}

- (NSSet)widgetBackgroundViews
{
  void *v3;
  SBIconListView *iconListView;
  id v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  iconListView = self->_iconListView;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__SBHStackConfigurationViewController_widgetBackgroundViews__block_invoke;
  v7[3] = &unk_1E8D85CC0;
  v5 = v3;
  v8 = v5;
  -[SBIconListView enumerateDisplayedIconViewsUsingBlock:](iconListView, "enumerateDisplayedIconViewsUsingBlock:", v7);

  return (NSSet *)v5;
}

void __60__SBHStackConfigurationViewController_widgetBackgroundViews__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(a2, "customIconImageViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  v9 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v9;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  v7 = *(void **)(a1 + 32);
  objc_msgSend(v6, "backgroundView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "bs_safeAddObject:", v8);
}

- (NSSet)apertureBackgroundViews
{
  return -[SBHStackConfigurationApertureView backgroundViews](self->_apertureView, "backgroundViews");
}

- (UIView)widgetStackMatchingBackgroundView
{
  return -[SBHStackConfigurationApertureView widgetStackMatchingBackgroundView](self->_apertureView, "widgetStackMatchingBackgroundView");
}

- (UIView)visiblyActiveDataSourceSnapshotView
{
  void *v3;
  void *v4;
  uint64_t *v5;
  SBIconListView *iconListView;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *, _BYTE *);
  void *v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  -[SBHStackConfigurationViewController visiblyActiveDataSource](self, "visiblyActiveDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    goto LABEL_5;
  v5 = &v15;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__7;
  v19 = __Block_byref_object_dispose__7;
  v20 = 0;
  iconListView = self->_iconListView;
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __74__SBHStackConfigurationViewController_visiblyActiveDataSourceSnapshotView__block_invoke;
  v12 = &unk_1E8D85B48;
  v13 = v3;
  v14 = &v15;
  -[SBIconListView enumerateDisplayedIconViewsUsingBlock:](iconListView, "enumerateDisplayedIconViewsUsingBlock:", &v9);
  v7 = v16[5];
  if (v7)
  {
    objc_msgSend((id)v16[5], "iconImageSnapshotView", v9, v10, v11, v12);
    v5 = (uint64_t *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setClipsToBounds:", 1);
  }

  _Block_object_dispose(&v15, 8);
  if (!v7)
LABEL_5:
    v5 = 0;

  return (UIView *)v5;
}

void __74__SBHStackConfigurationViewController_visiblyActiveDataSourceSnapshotView__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;

  v11 = a2;
  objc_msgSend(v11, "icon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isWidgetIcon"))
  {
    objc_msgSend(v6, "activeDataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqualToString:", v9);

    if (v10)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
      *a3 = 1;
    }
  }

}

- (void)configureWithStackLayoutMetrics:(SBHStackLayoutMetrics *)a3
{
  __int128 v5;
  __int128 v6;
  _BOOL4 v7;
  double var5;
  double var3;
  double var4;
  double var0;
  double v12;
  double width;
  double height;
  SBIconListView *iconListView;
  _BOOL8 v16;
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
  double x;
  double v29;
  double y;
  double v31;
  double v32;
  _OWORD v33[4];
  _OWORD v34[4];

  v5 = *(_OWORD *)&a3->var1.height;
  v34[0] = *(_OWORD *)&a3->var0;
  v34[1] = v5;
  v6 = *(_OWORD *)&a3->var4;
  v34[2] = *(_OWORD *)&a3->var2.y;
  v34[3] = v6;
  v33[0] = SBHStackLayoutMetricsUnspecified;
  v33[1] = *(_OWORD *)&qword_1D0193F00;
  v33[2] = xmmword_1D0193F10;
  v33[3] = *(_OWORD *)&qword_1D0193F20;
  v7 = SBHStackLayoutMetricsEqualToMetrics((double *)v34, (double *)v33);
  if (v7)
  {
    -[SBHStackConfigurationViewController _expandedPageControlOutset](self, "_expandedPageControlOutset");
    var3 = 1.0;
  }
  else
  {
    var3 = a3->var3;
    var5 = a3->var5;
  }
  -[NSLayoutConstraint setConstant:](self->_pageControlOutsetConstraint, "setConstant:", var5);
  var4 = 1.0;
  if (!v7)
    var4 = a3->var4;
  -[UIPageControl setAlpha:](self->_pageControl, "setAlpha:", var4);
  -[SBHStackConfigurationViewController _setPageControlScale:](self, "_setPageControlScale:", var3);
  var0 = a3->var0;
  -[SBHStackConfigurationViewController _iconContentScale](self, "_iconContentScale");
  width = SBHSizeScaled(self->_scaledIconSpacing.width, self->_scaledIconSpacing.height, var0 / v12);
  if (v7)
  {
    width = self->_scaledIconSpacing.width;
    height = self->_scaledIconSpacing.height;
  }
  -[SBIconListView setIconSpacing:](self->_iconListView, "setIconSpacing:", width, height);
  iconListView = self->_iconListView;
  if (v7)
  {
    -[SBHStackConfigurationViewController _iconContentScale](self, "_iconContentScale");
    -[SBIconListView setIconContentScale:](iconListView, "setIconContentScale:");
    v16 = -[SBHStackConfigurationViewController _shouldUseConcentricCornersWhenExpanded](self, "_shouldUseConcentricCornersWhenExpanded");
  }
  else
  {
    -[SBIconListView setIconContentScale:](iconListView, "setIconContentScale:", a3->var0);
    v16 = 1;
  }
  -[SBHStackConfigurationApertureView setUsesConcentricCorners:](self->_apertureView, "setUsesConcentricCorners:", v16);
  -[SBHStackConfigurationViewController _stableApertureSize](self, "_stableApertureSize");
  v32 = v17;
  v19 = v18;
  v21 = a3->var1.width;
  v20 = a3->var1.height;
  -[NSLayoutConstraint multiplier](self->_apertureHeightConstraint, "multiplier");
  v23 = v22;
  v24 = 0.0;
  v25 = 0.0;
  v26 = 0.0;
  v27 = 0.0;
  if (!v7)
  {
    v26 = v20 - v19;
    v25 = v21 - v32;
    x = a3->var2.x;
    -[SBHStackConfigurationApertureView center](self->_apertureView, "center");
    v24 = x - v29;
    y = a3->var2.y;
    -[SBHStackConfigurationApertureView center](self->_apertureView, "center");
    v27 = y - v31;
  }
  -[NSLayoutConstraint setConstant:](self->_apertureSizeConstraint, "setConstant:", v25);
  -[NSLayoutConstraint setConstant:](self->_apertureHeightConstraint, "setConstant:", v26 - v25 * v23);
  -[NSLayoutConstraint setConstant:](self->_apertureCenterXConstraint, "setConstant:", v24);
  -[NSLayoutConstraint setConstant:](self->_apertureCenterYConstraint, "setConstant:", v27);
  -[SBHStackConfigurationApertureView layoutIfNeeded](self->_apertureView, "layoutIfNeeded");
}

- (void)setScrollPosition:(unint64_t)a3
{
  id v3;

  if (self->_scrollPositionNeed != a3)
  {
    self->_scrollPositionNeed = a3;
    -[SBHStackConfigurationViewController view](self, "view");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setNeedsLayout");

  }
}

- (void)_setupContentViewWithContentFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v9;
  UIView *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v24[4] = *MEMORY[0x1E0C80C00];
  if (a3.size.width == *MEMORY[0x1E0C9D820] && a3.size.height == *(double *)(MEMORY[0x1E0C9D820] + 8))
    NSLog(CFSTR("Can't setup with a zero-sized contentBoundingFrame."), a2);
  -[UIView superview](self->_contentView, "superview");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = self->_contentView;
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v20 = (void *)MEMORY[0x1E0CB3718];
  -[UIView widthAnchor](v10, "widthAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToConstant:", width);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v22;
  -[UIView heightAnchor](v10, "heightAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToConstant:", height);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v12;
  -[UIView topAnchor](v10, "topAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v9;
  objc_msgSend(v9, "topAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:constant:", v14, y);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v15;
  -[UIView leftAnchor](v10, "leftAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "leftAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:constant:", v17, x);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "activateConstraints:", v19);

}

- (void)_setupBackgroundInContainer:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  SBHStackConfiguration *v9;
  CCUILabeledRoundButtonViewController *v10;
  CCUILabeledRoundButtonViewController *v11;
  CCUILabeledRoundButtonViewController *smartRotateButtonViewController;
  CCUILabeledRoundButtonViewController *suggestionsButtonViewController;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  SBHStackConfigurationBackgroundViewController *backgroundViewController;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  SBHStackConfigurationBackgroundViewController *v31;
  CCUILabeledRoundButtonViewController *v32;
  CCUILabeledRoundButtonViewController *v33;
  void (**v34)(void *, uint64_t);
  SBHStackConfiguration *v35;
  id v36;
  id v37;
  _QWORD aBlock[4];
  SBHStackConfiguration *v39;
  id v40;
  id v41;
  SBHStackConfigurationViewController *v42;
  BOOL v43;
  _QWORD v44[4];
  _QWORD v45[4];

  v45[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SBHStackConfigurationViewController traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceStyle") == 1;

  SBHBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = self->_configuration;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__SBHStackConfigurationViewController__setupBackgroundInContainer___block_invoke;
  aBlock[3] = &unk_1E8D88FD0;
  v39 = v9;
  v40 = v7;
  v43 = v6;
  v41 = v8;
  v42 = self;
  v37 = v8;
  v36 = v7;
  v35 = v9;
  v34 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  v34[2](v34, 1);
  v10 = (CCUILabeledRoundButtonViewController *)objc_claimAutoreleasedReturnValue();
  v34[2](v34, 0);
  v11 = (CCUILabeledRoundButtonViewController *)objc_claimAutoreleasedReturnValue();
  smartRotateButtonViewController = self->_smartRotateButtonViewController;
  self->_smartRotateButtonViewController = v10;
  v33 = v10;

  suggestionsButtonViewController = self->_suggestionsButtonViewController;
  self->_suggestionsButtonViewController = v11;
  v32 = v11;

  -[SBHStackConfigurationViewController _updateButtonSubtitleForSmartRotate:animated:](self, "_updateButtonSubtitleForSmartRotate:animated:", 1, 0);
  -[SBHStackConfigurationViewController _updateButtonSubtitleForSmartRotate:animated:](self, "_updateButtonSubtitleForSmartRotate:animated:", 0, 0);
  v31 = -[SBHStackConfigurationBackgroundViewController initWithNibName:bundle:]([SBHStackConfigurationBackgroundViewController alloc], "initWithNibName:bundle:", 0, 0);
  -[SBHStackConfigurationViewController bs_addChildViewController:withSuperview:](self, "bs_addChildViewController:withSuperview:", v31, v4);
  v45[0] = v33;
  v45[1] = v32;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHStackConfigurationBackgroundViewController setFooterButtons:](v31, "setFooterButtons:", v14);

  -[SBHStackConfigurationBackgroundViewController view](v31, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v25 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v15, "topAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:", v29);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = v28;
  objc_msgSend(v15, "bottomAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bottomAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v26);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v44[1] = v16;
  objc_msgSend(v15, "leadingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leadingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v44[2] = v19;
  objc_msgSend(v15, "trailingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trailingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "constraintEqualToAnchor:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v44[3] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "activateConstraints:", v23);

  backgroundViewController = self->_backgroundViewController;
  self->_backgroundViewController = v31;

}

id __67__SBHStackConfigurationViewController__setupBackgroundInContainer___block_invoke(uint64_t a1, int a2)
{
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;

  v4 = CFSTR("suggestion-icon");
  if (a2)
  {
    v4 = CFSTR("ranking-icon");
    v5 = CFSTR("STACK_CONFIGURATION_ALLOW_SUGGESTIONS");
  }
  else
  {
    v5 = CFSTR("STACK_CONFIGURATION_ALLOW_EXTERNAL_SUGGESTIONS");
  }
  v6 = v4;
  v7 = v5;
  v8 = *(void **)(a1 + 32);
  if (a2)
    v9 = objc_msgSend(v8, "allowsSuggestions");
  else
    v9 = objc_msgSend(v8, "allowsExternalSuggestions");
  v10 = v9;
  v11 = sel__didToggleSmartRotate_;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2050000000;
  v12 = (void *)getCCUICAPackageDescriptionClass_softClass;
  v31 = getCCUICAPackageDescriptionClass_softClass;
  if (!getCCUICAPackageDescriptionClass_softClass)
  {
    v23 = MEMORY[0x1E0C809B0];
    v24 = 3221225472;
    v25 = __getCCUICAPackageDescriptionClass_block_invoke;
    v26 = &unk_1E8D85AF8;
    v27 = &v28;
    __getCCUICAPackageDescriptionClass_block_invoke((uint64_t)&v23);
    v12 = (void *)v29[3];
  }
  v13 = objc_retainAutorelease(v12);
  _Block_object_dispose(&v28, 8);
  objc_msgSend(v13, "descriptionForPackageNamed:inBundle:", v6, *(_QWORD *)(a1 + 40));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFlipsForRightToLeftLayoutDirection:", 1);
  v28 = 0;
  v29 = &v28;
  v30 = 0x2050000000;
  v15 = (void *)getCCUILabeledRoundButtonViewControllerClass_softClass;
  v31 = getCCUILabeledRoundButtonViewControllerClass_softClass;
  if (!getCCUILabeledRoundButtonViewControllerClass_softClass)
  {
    v23 = MEMORY[0x1E0C809B0];
    v24 = 3221225472;
    v25 = __getCCUILabeledRoundButtonViewControllerClass_block_invoke;
    v26 = &unk_1E8D85AF8;
    v27 = &v28;
    __getCCUILabeledRoundButtonViewControllerClass_block_invoke((uint64_t)&v23);
    v15 = (void *)v29[3];
  }
  if (!a2)
    v11 = sel__didToggleSuggestions_;
  v16 = objc_retainAutorelease(v15);
  _Block_object_dispose(&v28, 8);
  v17 = (void *)objc_msgSend([v16 alloc], "initWithGlyphPackageDescription:highlightColor:useLightStyle:", v14, *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 64));
  objc_msgSend(v17, "button");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 56), v11, 64);

  objc_msgSend(v17, "setGlyphState:", CFSTR("State 1"));
  SBHBundle();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localizedStringForKey:value:table:", v7, &stru_1E8D8E958, CFSTR("SpringBoardHome"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTitle:", v20);

  objc_msgSend(v17, "setLabelsVisible:", 1);
  objc_msgSend(v17, "setEnabled:", v10);
  objc_msgSend(v17, "button");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "layoutIfNeeded");

  return v17;
}

- (int64_t)_iconViewComponentBackgroundViewType
{
  void *v3;
  int64_t v4;

  -[SBHStackConfigurationViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "stackConfigurationViewControllerIconViewComponentBackgroundViewType:", self);
  else
    v4 = 4;

  return v4;
}

- (void)_setupApertureViewInContainer:(id)a3
{
  id v4;
  int64_t v5;
  SBHStackConfigurationApertureView *v6;
  SBHStackConfigurationApertureView *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  NSLayoutConstraint *v14;
  void *v15;
  void *v16;
  NSLayoutConstraint *v17;
  void *v18;
  void *v19;
  NSLayoutConstraint *v20;
  void *v21;
  void *v22;
  NSLayoutConstraint *v23;
  void *v24;
  void *v25;
  NSLayoutConstraint *apertureCenterXConstraint;
  NSLayoutConstraint *v27;
  NSLayoutConstraint *apertureCenterYConstraint;
  NSLayoutConstraint *v29;
  NSLayoutConstraint *apertureHeightConstraint;
  NSLayoutConstraint *v31;
  NSLayoutConstraint *apertureSizeConstraint;
  NSLayoutConstraint *v33;
  SBHStackConfigurationApertureView *apertureView;
  _QWORD v35[5];

  v35[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[SBHStackConfigurationViewController _iconViewComponentBackgroundViewType](self, "_iconViewComponentBackgroundViewType");
  v6 = [SBHStackConfigurationApertureView alloc];
  v7 = -[SBHStackConfigurationApertureView initWithFrame:iconViewBackgroundType:](v6, "initWithFrame:iconViewBackgroundType:", v5, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[SBHStackConfigurationApertureView setUsesConcentricCorners:](v7, "setUsesConcentricCorners:", -[SBHStackConfigurationViewController _shouldUseConcentricCornersWhenExpanded](self, "_shouldUseConcentricCornersWhenExpanded"));
  -[SBHStackConfigurationApertureView setTranslatesAutoresizingMaskIntoConstraints:](v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[SBHStackConfigurationApertureView setClipsToBounds:](v7, "setClipsToBounds:", 1);
  -[SBHStackConfigurationViewController contentBoundingFrame](self, "contentBoundingFrame");
  if (v8 <= v9)
    v10 = v8;
  else
    v10 = v9;
  v11 = v10 * 0.744 / v8;
  -[SBHStackConfigurationApertureView widthAnchor](v7, "widthAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "widthAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:multiplier:", v13, v11);
  v14 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();

  -[SBHStackConfigurationApertureView heightAnchor](v7, "heightAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHStackConfigurationApertureView widthAnchor](v7, "widthAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:multiplier:", v16, 1.0);
  v17 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();

  -[SBHStackConfigurationApertureView centerXAnchor](v7, "centerXAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "centerXAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v19);
  v20 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();

  -[SBHStackConfigurationApertureView centerYAnchor](v7, "centerYAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "centerYAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v22);
  v23 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addSubview:", v7);
  v24 = (void *)MEMORY[0x1E0CB3718];
  v35[0] = v20;
  v35[1] = v23;
  v35[2] = v17;
  v35[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "activateConstraints:", v25);

  apertureCenterXConstraint = self->_apertureCenterXConstraint;
  self->_apertureCenterXConstraint = v20;
  v27 = v20;

  apertureCenterYConstraint = self->_apertureCenterYConstraint;
  self->_apertureCenterYConstraint = v23;
  v29 = v23;

  apertureHeightConstraint = self->_apertureHeightConstraint;
  self->_apertureHeightConstraint = v17;
  v31 = v17;

  apertureSizeConstraint = self->_apertureSizeConstraint;
  self->_apertureSizeConstraint = v14;
  v33 = v14;

  apertureView = self->_apertureView;
  self->_apertureView = v7;

}

- (void)_setupScrollViewInContainer:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  BSUIScrollView *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BSUIScrollView *scrollView;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v24[5];

  v24[4] = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0D01950];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(v5, "bounds");
  v7 = (BSUIScrollView *)objc_msgSend(v6, "initWithFrame:");
  -[BSUIScrollView setContentInsetAdjustmentBehavior:](v7, "setContentInsetAdjustmentBehavior:", 2);
  -[BSUIScrollView setDecelerationRate:](v7, "setDecelerationRate:", *MEMORY[0x1E0DC5360]);
  -[BSUIScrollView setTranslatesAutoresizingMaskIntoConstraints:](v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[BSUIScrollView setShowsHorizontalScrollIndicator:](v7, "setShowsHorizontalScrollIndicator:", 0);
  -[BSUIScrollView setShowsVerticalScrollIndicator:](v7, "setShowsVerticalScrollIndicator:", 0);
  -[BSUIScrollView setAlwaysBounceVertical:](v7, "setAlwaysBounceVertical:", 1);
  -[BSUIScrollView setClipsToBounds:](v7, "setClipsToBounds:", 0);
  -[BSUIScrollView setDelegate:](v7, "setDelegate:", self);
  objc_msgSend(v5, "addSubview:", v7);
  v18 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v5, "topAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSUIScrollView topAnchor](v7, "topAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v21);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v20;
  objc_msgSend(v5, "bottomAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSUIScrollView bottomAnchor](v7, "bottomAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v9;
  objc_msgSend(v5, "leadingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSUIScrollView leadingAnchor](v7, "leadingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v12;
  objc_msgSend(v5, "trailingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[BSUIScrollView trailingAnchor](v7, "trailingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "activateConstraints:", v16);

  scrollView = self->_scrollView;
  self->_scrollView = v7;

}

- (void)_setupIconListViewCenteredInScrollView:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double *v17;
  void *v18;
  uint64_t v19;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  SBHIconGridSize v29;
  unsigned __int16 columns;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  SBIconListModel *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  void *v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  SBIconListGridLayoutConfiguration *v47;
  uint64_t v48;
  SBIconListGridLayoutConfiguration *v49;
  SBIconListGridLayoutConfiguration *v50;
  SBIconListGridLayout *v51;
  uint64_t v52;
  void *v53;
  SBHCustomIconListLayoutProvider *v54;
  void *v55;
  uint64_t v56;
  SBHStackConfigurationIconListView *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  SBHCustomIconListLayout *v67;
  SBHCustomIconListLayout *customLayout;
  SBIconListModel *rootListModel;
  SBIconListModel *v70;
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
  SBIconListGridLayout *v86;
  SBHIconGridSizeClassSet *v87;
  SBIconListGridLayoutConfiguration *v88;
  void *v89;
  double v90;
  double v91;
  double v92;
  void *v93;
  SBHIconGridSizeClassSizeMap *v94;
  void *v95;
  id v96;
  _QWORD v97[4];
  SBIconListGridLayoutConfiguration *v98;
  double v99;
  _QWORD v100[4];
  SBIconListGridLayoutConfiguration *v101;
  CGFloat v102;
  CGFloat v103;
  double v104;
  double v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  _QWORD v110[5];
  const __CFString *v111;
  SBIconListGridLayout *v112;
  _BYTE v113[128];
  uint64_t v114;

  v114 = *MEMORY[0x1E0C80C00];
  v96 = a3;
  -[SBIconView icon](self->_stackIconView, "icon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "gridSizeClass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHStackConfiguration dataSources](self->_configuration, "dataSources");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconView location](self->_stackIconView, "location");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListLayoutProvider layoutForIconLocation:](self->_listLayoutProvider, "layoutForIconLocation:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "iconImageInfoForGridSizeClass:", v5);
  v9 = v8;
  v11 = v10;
  v91 = v13;
  v92 = v12;
  v14 = SBHIconListLayoutEditingAnimationStrengthForGridSizeClass(v7, v5);
  -[SBHStackConfigurationViewController _iconContentScale](self, "_iconContentScale");
  v16 = v15;
  v17 = (double *)MEMORY[0x1E0C9D820];
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "userInterfaceIdiom");

  v95 = v7;
  if ((v19 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    v20 = SBHIconListLayoutIconImageInfoForGridSizeClass(v7, CFSTR("SBHIconGridSizeClassSmall"));
    v21 = SBHIconListLayoutIconImageInfoForGridSizeClass(v7, CFSTR("SBHIconGridSizeClassMedium")) + v20 * -2.0;
    v22 = v11;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      if (-[SBIconViewDelegate iconViewDisplaysLabel:](self->_defaultIconViewDelegate, "iconViewDisplaysLabel:", self->_stackIconView))v23 = v21 + v21;
      else
        v23 = v21;
    }
    else
    {
      v23 = v21 + v21;
    }
  }
  else
  {
    v22 = v11;
    -[SBIconListLayoutProvider layoutForIconLocation:](self->_listLayoutProvider, "layoutForIconLocation:", CFSTR("SBIconLocationRoot"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    SBHIconListLayoutListIconSpacing(v24, 1);
    v23 = v25;

  }
  v90 = *v17;
  v26 = v14 / v16;
  -[SBHStackConfigurationViewController _iconContentScale](self, "_iconContentScale");
  v28 = v23 * v27;
  v94 = objc_alloc_init(SBHIconGridSizeClassSizeMap);
  v29 = (SBHIconGridSize)-[SBHIconGridSizeClassSizeMap gridSizeForGridSizeClass:](v94, "gridSizeForGridSizeClass:", v5);
  columns = v29.columns;
  v31 = HIWORD(*(unsigned int *)&v29);
  v32 = -[SBHWidgetSettings maximumWidgetsInAStack](self->_widgetSettings, "maximumWidgetsInAStack");
  v33 = columns;
  v34 = v32 * v31;
  v35 = -[SBIconListModel initWithFolder:gridSize:]([SBIconListModel alloc], "initWithFolder:gridSize:", 0, columns | ((unsigned __int16)v32 << 16));
  -[SBIconListModel setDelegate:](v35, "setDelegate:", self);
  v108 = 0u;
  v109 = 0u;
  v107 = 0u;
  v106 = 0u;
  v36 = v6;
  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v106, v113, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v107;
    do
    {
      for (i = 0; i != v38; ++i)
      {
        if (*(_QWORD *)v107 != v39)
          objc_enumerationMutation(v36);
        -[SBHStackConfigurationViewController _unraveledWidgetIconForDataSource:withGridSizeClass:](self, "_unraveledWidgetIconForDataSource:withGridSizeClass:", *(_QWORD *)(*((_QWORD *)&v106 + 1) + 8 * i), v5);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBIconListModel addIcon:](v35, "addIcon:", v41);

      }
      v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v106, v113, 16);
    }
    while (v38);
  }

  -[SBIconListModel addListObserver:](v35, "addListObserver:", self);
  -[SBIconView icon](self->_stackIconView, "icon");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "addObserver:", self);

  v43 = *MEMORY[0x1E0DC49E8];
  v44 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v45 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v46 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  v47 = objc_alloc_init(SBIconListGridLayoutConfiguration);
  -[SBIconListGridLayoutConfiguration setNumberOfPortraitRows:](v47, "setNumberOfPortraitRows:", v34);
  -[SBIconListGridLayoutConfiguration setNumberOfPortraitColumns:](v47, "setNumberOfPortraitColumns:", v33);
  -[SBIconListGridLayoutConfiguration setPortraitLayoutInsets:](v47, "setPortraitLayoutInsets:", v43, v44, v45, v46);
  -[SBIconListGridLayoutConfiguration setIconGridSizeClassSizes:](v47, "setIconGridSizeClassSizes:", v94);
  v48 = MEMORY[0x1E0C809B0];
  v100[0] = MEMORY[0x1E0C809B0];
  v100[1] = 3221225472;
  v100[2] = __78__SBHStackConfigurationViewController__setupIconListViewCenteredInScrollView___block_invoke;
  v100[3] = &unk_1E8D88FF8;
  v49 = v47;
  v101 = v49;
  v102 = v9;
  v103 = v22;
  v104 = v92;
  v105 = v91;
  SBHEnumerateIconGridSizeClasses(v100);
  v97[0] = v48;
  v97[1] = 3221225472;
  v97[2] = __78__SBHStackConfigurationViewController__setupIconListViewCenteredInScrollView___block_invoke_2;
  v97[3] = &unk_1E8D89020;
  v50 = v49;
  v98 = v50;
  v99 = v26;
  SBHEnumerateIconGridSizeClasses(v97);
  v87 = -[SBHIconGridSizeClassSet initWithGridSizeClass:]([SBHIconGridSizeClassSet alloc], "initWithGridSizeClass:", v5);
  -[SBIconListGridLayoutConfiguration setSupportedIconGridSizeClasses:](v50, "setSupportedIconGridSizeClasses:");
  v88 = v50;
  v51 = -[SBIconListGridLayout initWithLayoutConfiguration:]([SBIconListGridLayout alloc], "initWithLayoutConfiguration:", v50);
  objc_msgSend(v95, "iconAccessoryVisualConfiguration");
  v52 = objc_claimAutoreleasedReturnValue();
  -[SBIconListGridLayout layoutConfiguration](v51, "layoutConfiguration");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = (void *)v52;
  objc_msgSend(v53, "setIconAccessoryVisualConfiguration:", v52);

  v54 = [SBHCustomIconListLayoutProvider alloc];
  v111 = CFSTR("SBIconLocationStackConfiguration");
  v112 = v51;
  v86 = v51;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v112, &v111, 1);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = -[SBHCustomIconListLayoutProvider initWithListLayouts:](v54, "initWithListLayouts:", v55);

  v84 = (void *)v56;
  v57 = -[SBIconListView initWithModel:layoutProvider:iconLocation:orientation:iconViewProvider:]([SBHStackConfigurationIconListView alloc], "initWithModel:layoutProvider:iconLocation:orientation:iconViewProvider:", v35, v56, CFSTR("SBIconLocationStackConfiguration"), 1, self->_iconViewProvider);
  -[SBHStackConfigurationIconListView setIconViewDelegate:](v57, "setIconViewDelegate:", self);
  -[SBIconListView hideAllIcons](v57, "hideAllIcons");
  -[SBHStackConfigurationViewController _iconContentScale](self, "_iconContentScale");
  -[SBIconListView setIconContentScale:](v57, "setIconContentScale:");
  -[SBIconListView setAutomaticallyAdjustsLayoutMetricsToFit:](v57, "setAutomaticallyAdjustsLayoutMetricsToFit:", 0);
  -[SBIconListView setIconSpacing:](v57, "setIconSpacing:", v90, v28);
  -[SBIconView legibilitySettings](self->_stackIconView, "legibilitySettings");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListView setLegibilitySettings:](v57, "setLegibilitySettings:", v58);

  -[SBHStackConfigurationViewController overrideIconImageAppearance](self, "overrideIconImageAppearance");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListView setOverrideIconImageAppearance:](v57, "setOverrideIconImageAppearance:", v59);

  -[SBHStackConfigurationViewController overrideIconImageStyleConfiguration](self, "overrideIconImageStyleConfiguration");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListView setOverrideIconImageStyleConfiguration:](v57, "setOverrideIconImageStyleConfiguration:", v60);

  -[SBHStackConfigurationViewController delegate](self, "delegate");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = v61;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (objc_msgSend(v61, "stackConfigurationViewControllerShouldDisallowLabelArea:", self))
      v62 = 18;
    else
      v62 = 16;
  }
  else
  {
    v62 = 16;
  }
  -[SBIconListView setIconViewConfigurationOptions:](v57, "setIconViewConfigurationOptions:", v62);
  -[SBIconListView setBoundsSizeTracksContentSize:](v57, "setBoundsSizeTracksContentSize:", 1);
  -[SBIconListView setDragDelegate:](v57, "setDragDelegate:", self->_iconDragManager);
  -[SBHStackConfigurationIconListView setTranslatesAutoresizingMaskIntoConstraints:](v57, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v96, "addSubview:", v57);
  v77 = (void *)MEMORY[0x1E0CB3718];
  -[SBHStackConfigurationIconListView topAnchor](v57, "topAnchor");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "topAnchor");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "constraintEqualToAnchor:", v82);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v110[0] = v81;
  -[SBHStackConfigurationIconListView bottomAnchor](v57, "bottomAnchor");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "bottomAnchor");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "constraintEqualToAnchor:", v79);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v110[1] = v78;
  -[SBHStackConfigurationIconListView centerXAnchor](v57, "centerXAnchor");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "centerXAnchor");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "constraintEqualToAnchor:", v75);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v110[2] = v74;
  -[SBHStackConfigurationIconListView trailingAnchor](v57, "trailingAnchor");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "trailingAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "constraintLessThanOrEqualToAnchor:", v72);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v110[3] = v71;
  -[SBHStackConfigurationIconListView leadingAnchor](v57, "leadingAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "leadingAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "constraintGreaterThanOrEqualToAnchor:", v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v110[4] = v65;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v110, 5);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "activateConstraints:", v66);

  -[SBIconListView intrinsicContentSize](v57, "intrinsicContentSize");
  objc_msgSend(v96, "setContentSize:");
  self->_iconImageInfo.size.width = v9;
  self->_iconImageInfo.size.height = v22;
  self->_iconImageInfo.scale = v92;
  self->_iconImageInfo.continuousCornerRadius = v91;
  self->_scaledIconSpacing.width = v90;
  self->_scaledIconSpacing.height = v28;
  objc_storeStrong((id *)&self->_iconListView, v57);
  if (objc_msgSend(v95, "conformsToProtocol:", &unk_1EFC53CE0))
  {
    v67 = -[SBHCustomIconListLayout initWithBaseListLayout:]([SBHCustomIconListLayout alloc], "initWithBaseListLayout:", v95);
    customLayout = self->_customLayout;
    self->_customLayout = v67;

    -[SBIconListView setLayoutDelegate:](self->_iconListView, "setLayoutDelegate:", self->_customLayout);
  }
  rootListModel = self->_rootListModel;
  self->_rootListModel = v35;
  v70 = v35;

}

uint64_t __78__SBHStackConfigurationViewController__setupIconListViewCenteredInScrollView___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setIconImageInfo:forGridSizeClass:", a2, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __78__SBHStackConfigurationViewController__setupIconListViewCenteredInScrollView___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setEditingAnimationStrength:forGridSizeClass:", a2, *(double *)(a1 + 40));
}

- (void)_setupPageControlInContainer:(id)a3
{
  objc_class *v4;
  id v5;
  UIPageControl *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  SBHStackConfigurationApertureView *v12;
  void *v13;
  void *v14;
  NSLayoutConstraint *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSLayoutConstraint *pageControlOutsetConstraint;
  NSLayoutConstraint *v22;
  UIPageControl *pageControl;
  UIPageControl *v24;
  CGAffineTransform v25;
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0DC3A88];
  v5 = a3;
  v6 = (UIPageControl *)objc_alloc_init(v4);
  -[UIPageControl addTarget:action:forControlEvents:](v6, "addTarget:action:forControlEvents:", self, sel__didChangePageControlPage_, 4096);
  -[UIPageControl setAllowsContinuousInteraction:](v6, "setAllowsContinuousInteraction:", 0);
  -[UIPageControl setHidesForSinglePage:](v6, "setHidesForSinglePage:", 1);
  -[UIPageControl setDirection:](v6, "setDirection:", 3);
  -[SBIconView legibilitySettings](self->_stackIconView, "legibilitySettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "primaryColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPageControl setCurrentPageIndicatorTintColor:](v6, "setCurrentPageIndicatorTintColor:", v8);

  objc_msgSend(v7, "secondaryColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPageControl setPageIndicatorTintColor:](v6, "setPageIndicatorTintColor:", v9);

  -[SBHStackConfiguration dataSources](self->_configuration, "dataSources");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  -[UIPageControl setNumberOfPages:](v6, "setNumberOfPages:", v11);
  -[UIPageControl _setPreferredNumberOfVisibleIndicators:](v6, "_setPreferredNumberOfVisibleIndicators:", -[SBHWidgetSettings maximumWidgetsInAStack](self->_widgetSettings, "maximumWidgetsInAStack"));
  CGAffineTransformMakeScale(&v25, 1.0, 1.0);
  -[UIPageControl setTransform:](v6, "setTransform:", &v25);
  -[UIPageControl setTranslatesAutoresizingMaskIntoConstraints:](v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v5, "addSubview:", v6);

  v12 = self->_apertureView;
  -[UIPageControl centerXAnchor](v6, "centerXAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHStackConfigurationApertureView trailingAnchor](v12, "trailingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHStackConfigurationViewController _expandedPageControlOutset](self, "_expandedPageControlOutset");
  objc_msgSend(v13, "constraintEqualToAnchor:constant:", v14);
  v15 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0CB3718];
  -[UIPageControl centerYAnchor](v6, "centerYAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHStackConfigurationApertureView centerYAnchor](v12, "centerYAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v19;
  v26[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "activateConstraints:", v20);

  pageControlOutsetConstraint = self->_pageControlOutsetConstraint;
  self->_pageControlOutsetConstraint = v15;
  v22 = v15;

  pageControl = self->_pageControl;
  self->_pageControl = v6;
  v24 = v6;

}

- (id)_unraveledWidgetIconForDataSource:(id)a3 withGridSizeClass:(id)a4
{
  id v6;
  id v7;
  char v8;
  SBWidgetIcon *v9;
  SBWidgetIcon *v10;
  void *v11;
  SBWidgetIcon *v12;

  v6 = a4;
  v7 = a3;
  v8 = objc_opt_respondsToSelector();
  v9 = [SBWidgetIcon alloc];
  v10 = v9;
  if ((v8 & 1) != 0)
  {
    objc_msgSend(v7, "uniqueIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[SBWidgetIcon initWithLeafIdentifier:applicationBundleID:](v10, "initWithLeafIdentifier:applicationBundleID:", v11, 0);

  }
  else
  {
    v12 = -[SBLeafIcon initWithUniqueLeafIdentifier](v9, "initWithUniqueLeafIdentifier");
  }
  -[SBLeafIcon addIconDataSource:](v12, "addIconDataSource:", v7);

  -[SBIcon setGridSizeClass:](v12, "setGridSizeClass:", v6);
  -[SBLeafIcon addObserver:](v12, "addObserver:", self);
  return v12;
}

- (void)_setupTapToDismissGestureInView:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;

  v4 = (objc_class *)MEMORY[0x1E0DC3D80];
  v5 = a3;
  v6 = (id)objc_msgSend([v4 alloc], "initWithTarget:action:", self, sel__didTapBackgroundView_);
  objc_msgSend(v6, "setDelegate:", self);
  objc_msgSend(v6, "setDelaysTouchesBegan:", 0);
  objc_msgSend(v6, "setDelaysTouchesEnded:", 0);
  objc_msgSend(v5, "addGestureRecognizer:", v6);

}

- (void)_setupLargeSizeLayoutAdjustmentsIfNecessary
{
  void *v3;
  _BOOL4 stackSizeIsSmall;
  int v5;
  SBHStackConfigurationApertureView *v6;
  double width;
  double height;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  NSLayoutConstraint *v22;
  NSLayoutConstraint *apertureHeightConstraint;
  __CFString *v24;

  -[SBIconView icon](self->_stackIconView, "icon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "gridSizeClass");
  v24 = (__CFString *)objc_claimAutoreleasedReturnValue();

  stackSizeIsSmall = self->_stackSizeIsSmall;
  if (v24 == CFSTR("SBHIconGridSizeClassMedium"))
  {
    v5 = 0;
    if (self->_stackSizeIsSmall)
      goto LABEL_14;
  }
  else
  {
    v5 = -[__CFString isEqualToString:](v24, "isEqualToString:") ^ 1;
    if (stackSizeIsSmall)
      goto LABEL_14;
  }
  v6 = self->_apertureView;
  width = self->_iconImageInfo.size.width;
  height = self->_iconImageInfo.size.height;
  -[SBHStackConfigurationViewController contentBoundingFrame](self, "contentBoundingFrame");
  v10 = v9;
  -[SBHStackConfigurationViewController _iconContentScale](self, "_iconContentScale");
  v12 = v11;
  v13 = (width + v10) * 0.5;
  if (v12 < 0.9)
    v13 = width;
  v14 = v13 / v10;
  -[NSLayoutConstraint setActive:](self->_apertureSizeConstraint, "setActive:", 0);
  -[SBHStackConfigurationApertureView widthAnchor](v6, "widthAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHStackConfigurationApertureView superview](v6, "superview");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "widthAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:multiplier:", v17, v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "setActive:", 1);
  objc_storeStrong((id *)&self->_apertureSizeConstraint, v18);
  if (v5)
  {
    -[NSLayoutConstraint setActive:](self->_apertureHeightConstraint, "setActive:", 0);
    if (v24 == CFSTR("SBHIconGridSizeClassExtraLarge")
      || -[__CFString isEqualToString:](v24, "isEqualToString:"))
    {
      v19 = (v10 * v14 - width * v12 + height * v12) / (v10 * v14);
    }
    else
    {
      v19 = height / width;
    }
    -[SBHStackConfigurationApertureView heightAnchor](v6, "heightAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHStackConfigurationApertureView widthAnchor](v6, "widthAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:multiplier:", v21, v19);
    v22 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();

    -[NSLayoutConstraint setActive:](v22, "setActive:", 1);
    apertureHeightConstraint = self->_apertureHeightConstraint;
    self->_apertureHeightConstraint = v22;

  }
LABEL_14:

}

- (void)_setupEditingButtons
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  if (self->_needsAddButton)
  {
    v3 = objc_opt_class();
    -[SBHStackConfigurationViewController makeTitledButtonOfClass:](self, "makeTitledButtonOfClass:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v5 = v4;
      else
        v5 = 0;
    }
    else
    {
      v5 = 0;
    }
    v6 = v5;

    objc_msgSend(v6, "addTarget:action:forControlEvents:", self, sel__didTapAddWidgetButton_, 0x2000);
    objc_msgSend(v6, "setAccessibilityIdentifier:", CFSTR("stack-configuration-widget-add-button"));
    -[SBHStackConfigurationViewController setAddButton:](self, "setAddButton:", v6);

  }
  if (self->_needsDoneButton)
  {
    v7 = objc_opt_class();
    -[SBHStackConfigurationViewController makeTitledButtonOfClass:](self, "makeTitledButtonOfClass:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v9 = v8;
      else
        v9 = 0;
    }
    else
    {
      v9 = 0;
    }
    v10 = v9;

    objc_msgSend(v10, "addTarget:action:forControlEvents:", self, sel__didTapDoneButton_, 0x2000);
    objc_msgSend(v10, "setAccessibilityIdentifier:", CFSTR("stack-configuration-done-button"));
    -[SBHStackConfigurationViewController setDoneButton:](self, "setDoneButton:", v10);

  }
  -[SBHStackConfigurationViewController _updateAddWidgetButtonOperabilityForDataSourceCount](self, "_updateAddWidgetButtonOperabilityForDataSourceCount");
  -[SBHStackConfigurationViewController _updateLayoutForEditButtons](self, "_updateLayoutForEditButtons");
}

- (id)_newHomeScreenButtonBackgroundView
{
  +[SBIconView componentBackgroundView](SBIconView, "componentBackgroundView");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)makeTitledButtonOfClass:(Class)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = -[SBHStackConfigurationViewController _newHomeScreenButtonBackgroundView](self, "_newHomeScreenButtonBackgroundView");
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
  -[SBIconView legibilitySettings](self->_stackIconView, "legibilitySettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLegibilityStyle:", objc_msgSend(v10, "style"));

  return v7;
}

- (void)_updateLayoutForEditButtons
{
  UIView *v3;
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
  BOOL v14;
  UIView *scalingView;
  UIView *v16;
  void *v17;
  void *v18;
  UIView *v19;
  UIView *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;

  -[SBHStackConfigurationViewController view](self, "view");
  v3 = (UIView *)objc_claimAutoreleasedReturnValue();
  -[UIView bounds](v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[SBHStackConfigurationViewController contentBoundingFrame](self, "contentBoundingFrame");
  v14 = v13 == v9 && v12 == v11;
  scalingView = v3;
  if (v14)
    scalingView = self->_scalingView;
  v16 = scalingView;
  -[SBHStackConfigurationViewController doneButton](self, "doneButton");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHStackConfigurationViewController addButton](self, "addButton");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "superview");
  v19 = (UIView *)objc_claimAutoreleasedReturnValue();

  if (v19 != v16)
    -[UIView addSubview:](v16, "addSubview:", v17);
  objc_msgSend(v18, "superview");
  v20 = (UIView *)objc_claimAutoreleasedReturnValue();

  if (v20 != v16)
    -[UIView addSubview:](v16, "addSubview:", v18);
  v21 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  v24 = *MEMORY[0x1E0C9D648];
  v25 = v21;
  v22 = v24;
  v23 = v21;
  +[SBRootFolderView _editButtonLayoutFramesInBounds:forVisualConfiguration:withTranslationOffset:inRTL:doneButton:addWidgetButton:doneButtonFrame:addWidgetButtonFrame:](SBRootFolderView, "_editButtonLayoutFramesInBounds:forVisualConfiguration:withTranslationOffset:inRTL:doneButton:addWidgetButton:doneButtonFrame:addWidgetButtonFrame:", self->_rootFolderVisualConfiguration, objc_msgSend((id)*MEMORY[0x1E0DC4730], "userInterfaceLayoutDirection", v24, v21) == 1, v17, v18, &v22, &v24, v5, v7, v9, v11, 0.0);
  objc_msgSend(v17, "setFrame:", v22, v23);
  objc_msgSend(v18, "setFrame:", v24, v25);

}

- (id)draggingDelegateForIconView:(id)a3
{
  return self->_iconDragManager;
}

- (id)reuseDelegateForIconView:(id)a3
{
  return self->_defaultIconViewDelegate;
}

- (id)shortcutsDelegateForIconView:(id)a3
{
  return self->_defaultIconViewDelegate;
}

- (void)iconTapped:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "supportsConfigurationCard"))
  {
    SBLogIcon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138412290;
      v6 = v3;
      _os_log_impl(&dword_1CFEF3000, v4, OS_LOG_TYPE_DEFAULT, "Starting configuration of icon within stack configuration due to tap: %@", (uint8_t *)&v5, 0xCu);
    }

    objc_msgSend(v3, "presentConfigurationCard");
  }

}

- (BOOL)iconShouldAllowCloseBoxTap:(id)a3
{
  return !-[SBIconDragManager isTrackingActiveOrDroppingIconDrags](self->_iconDragManager, "isTrackingActiveOrDroppingIconDrags", a3);
}

- (void)iconCloseBoxTapped:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  SBIconListView *v16;
  void *v17;
  void *v18;
  void *v19;
  SBIconListView *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  _QWORD v29[4];
  id v30;
  SBIconListView *v31;
  SBHStackConfigurationViewController *v32;

  v3 = a3;
  objc_msgSend(v3, "icon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayName");
  v5 = objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0DC3450];
  v7 = (void *)MEMORY[0x1E0CB3940];
  SBHBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("REMOVE_WIDGET_TITLE_REMOVE_WITH_NAME"), &stru_1E8D8E958, CFSTR("SpringBoardHome"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)v5;
  objc_msgSend(v7, "stringWithFormat:", v9, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CB3940];
  SBHBundle();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("REMOVE_WIDGET_BODY_REMOVE_DATA"), &stru_1E8D8E958, CFSTR("SpringBoardHome"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", v13, v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "alertControllerWithTitle:message:preferredStyle:", v10, v14, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = self->_iconListView;
  v17 = (void *)MEMORY[0x1E0DC3448];
  SBHBundle();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("REMOVE_WIDGET_BUTTON_REMOVE"), &stru_1E8D8E958, CFSTR("SpringBoardHome"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __58__SBHStackConfigurationViewController_iconCloseBoxTapped___block_invoke;
  v29[3] = &unk_1E8D89048;
  v30 = v3;
  v31 = v16;
  v32 = self;
  v20 = v16;
  v21 = v3;
  objc_msgSend(v17, "actionWithTitle:style:handler:", v19, 2, v29);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "addAction:", v22);
  v23 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(v21, "icon");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "uninstallAlertCancelTitle");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "actionWithTitle:style:handler:", v25, 1, 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "addAction:", v26);
  objc_msgSend(v15, "setPreferredAction:", v22);
  -[SBHStackConfigurationViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v15, 1, 0);

}

void __58__SBHStackConfigurationViewController_iconCloseBoxTapped___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "icon");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "model");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeIcon:", v6);
    objc_msgSend(v6, "activeDataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(a1 + 48), "_widgetDataSourceIsSuggestion:", v4))
    {
      objc_msgSend(*(id *)(a1 + 48), "delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stackConfigurationViewController:didRemoveSuggestedWidgetIcon:", *(_QWORD *)(a1 + 48), v6);

    }
    objc_msgSend(*(id *)(a1 + 40), "layoutIconsIfNeededWithAnimationType:options:", 0, 1);

  }
}

- (BOOL)iconShouldAllowAccessoryViewTap:(id)a3
{
  return !-[SBIconDragManager isTrackingActiveOrDroppingIconDrags](self->_iconDragManager, "isTrackingActiveOrDroppingIconDrags", a3);
}

- (void)iconAccessoryViewTapped:(id)a3
{
  id v4;

  objc_msgSend(a3, "icon");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isWidgetIcon"))
  {
    -[SBHStackConfigurationViewController _promoteWidgetIcon:](self, "_promoteWidgetIcon:", v4);
    -[SBIconListView layoutIconsIfNeededWithAnimationType:options:](self->_iconListView, "layoutIconsIfNeededWithAnimationType:options:", 0, 0);
  }

}

- (void)_promoteWidgetIcon:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "activeDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHStackConfigurationViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SBIconView icon](self->_stackIconView, "icon");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stackConfigurationViewController:promoteSuggestedWidget:withinStack:", self, v4, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      objc_msgSend(v8, "replaceIconDataSource:withIconDataSource:", v4, v7);

  }
}

- (BOOL)iconViewDisplaysLabel:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = -[SBIconViewDelegate iconViewDisplaysLabel:](self->_defaultIconViewDelegate, "iconViewDisplaysLabel:", v4);
  else
    v5 = 1;

  return v5;
}

- (BOOL)iconViewDisplaysAccessories:(id)a3
{
  void *v4;
  void *v5;
  BOOL v6;

  objc_msgSend(a3, "icon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isWidgetIcon"))
  {
    objc_msgSend(v4, "activeDataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[SBHStackConfigurationViewController _widgetDataSourceIsSuggestion:](self, "_widgetDataSourceIsSuggestion:", v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)iconViewDisplaysCloseBox:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;

  objc_msgSend(a3, "icon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isWidgetIcon"))
  {
    objc_msgSend(v4, "activeDataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[SBHStackConfigurationViewController _widgetDataSourceIsSuggestion:](self, "_widgetDataSourceIsSuggestion:", v5))
    {
      v6 = 0;
    }
    else
    {
      -[SBHStackConfigurationViewController delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v6 = objc_msgSend(v7, "stackConfigurationViewController:allowsRemovalOfIconDataSource:", self, v5);
      else
        v6 = 1;

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (int64_t)closeBoxTypeForIconView:(id)a3
{
  return 1;
}

- (int64_t)iconView:(id)a3 accessoryTypeWithProposedAccessoryType:(int64_t)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  BOOL v10;

  v6 = a3;
  objc_msgSend(v6, "icon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEditing");

  if (!v8 || !objc_msgSend(v7, "isWidgetIcon"))
  {
    if (a4 != 3)
      goto LABEL_10;
    goto LABEL_7;
  }
  objc_msgSend(v7, "activeDataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[SBHStackConfigurationViewController _widgetDataSourceIsSuggestion:](self, "_widgetDataSourceIsSuggestion:", v9);

  if (a4 == 3 || v10)
  {
LABEL_7:
    if (-[SBHStackConfigurationViewController _canAddAdditionalWidgets](self, "_canAddAdditionalWidgets"))
      a4 = 3;
    else
      a4 = 0;
  }
LABEL_10:

  return a4;
}

- (BOOL)icon:(id)a3 canReceiveGrabbedIcon:(id)a4
{
  return 0;
}

- (id)customImageViewControllerForIconView:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SBIconViewDelegate customImageViewControllerForIconView:](self->_defaultIconViewDelegate, "customImageViewControllerForIconView:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)iconViewCanBecomeFocused:(id)a3
{
  return 0;
}

- (BOOL)iconView:(id)a3 supportsConfigurationForDataSource:(id)a4
{
  id v6;
  id v7;
  char v8;

  v6 = a3;
  v7 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v8 = -[SBIconViewDelegate iconView:supportsConfigurationForDataSource:](self->_defaultIconViewDelegate, "iconView:supportsConfigurationForDataSource:", v6, v7);
  else
    v8 = 0;

  return v8;
}

- (id)iconView:(id)a3 configurationInteractionForDataSource:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SBIconViewDelegate iconView:configurationInteractionForDataSource:](self->_defaultIconViewDelegate, "iconView:configurationInteractionForDataSource:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)stackConfigurationInteractionForIconView:(id)a3
{
  return 0;
}

- (int64_t)iconView:(id)a3 userInterfaceStyleForConfigurationInteraction:(id)a4
{
  id v6;
  id v7;
  int64_t v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v8 = -[SBIconViewDelegate iconView:userInterfaceStyleForConfigurationInteraction:](self->_defaultIconViewDelegate, "iconView:userInterfaceStyleForConfigurationInteraction:", v6, v7);
  }
  else
  {
    -[SBHStackConfigurationViewController traitCollection](self, "traitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "userInterfaceStyle");

  }
  return v8;
}

- (id)iconView:(id)a3 homeScreenContentViewForConfigurationInteraction:(id)a4
{
  return self->_scalingView;
}

- (void)iconView:(id)a3 configurationDidUpdateWithInteraction:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[SBIconViewDelegate iconView:configurationDidUpdateWithInteraction:](self->_defaultIconViewDelegate, "iconView:configurationDidUpdateWithInteraction:", v7, v6);

}

- (void)iconView:(id)a3 configurationWillBeginWithInteraction:(id)a4
{
  id v5;
  id v6;

  v6 = a3;
  -[SBHStackConfigurationViewController currentConfiguringIconView](self, "currentConfiguringIconView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 != v6)
  {
    objc_msgSend(v5, "dismissConfigurationCardImmediately");
    -[SBHStackConfigurationViewController setCurrentConfiguringIconView:](self, "setCurrentConfiguringIconView:", v6);
  }

}

- (void)iconView:(id)a3 configurationWillEndWithInteraction:(id)a4
{
  SBIconListView *iconListView;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  iconListView = self->_iconListView;
  v6 = a3;
  -[SBIconListView icons](iconListView, "icons");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "icon");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v7, "indexOfObject:", v8);
  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    -[SBHStackConfigurationViewController _scrollToWidgetIndex:animated:](self, "_scrollToWidgetIndex:animated:", v9, 1);
}

- (void)iconView:(id)a3 configurationDidEndWithInteraction:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  -[SBHStackConfigurationViewController currentConfiguringIconView](self, "currentConfiguringIconView");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v5)
    -[SBHStackConfigurationViewController setCurrentConfiguringIconView:](self, "setCurrentConfiguringIconView:", 0);
}

- (double)verticalMarginPercentageForConfigurationOfIconView:(id)a3
{
  id v4;
  double v5;
  double v6;

  v4 = a3;
  v5 = -1.0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SBIconViewDelegate verticalMarginPercentageForConfigurationOfIconView:](self->_defaultIconViewDelegate, "verticalMarginPercentageForConfigurationOfIconView:", v4);
    v5 = v6;
  }

  return v5;
}

- (void)leafIcon:(id)a3 didChangeActiveDataSource:(id)a4
{
  SBIconView *stackIconView;
  id v6;
  id v7;

  stackIconView = self->_stackIconView;
  v6 = a3;
  -[SBIconView icon](stackIconView, "icon");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 != v6)
    -[SBHStackConfigurationViewController _iconListDidChangeWidgetIcons](self, "_iconListDidChangeWidgetIcons");
}

- (void)leafIcon:(id)a3 didAddIconDataSource:(id)a4
{
  id v6;
  id v7;
  id v8;
  SBIconListModel *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, uint64_t, _BYTE *);
  void *v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v6 = a3;
  v7 = a4;
  -[SBIconView icon](self->_stackIconView, "icon");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v6)
  {
    v22 = 0;
    v23 = &v22;
    v24 = 0x2020000000;
    v25 = 0;
    v9 = self->_rootListModel;
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __69__SBHStackConfigurationViewController_leafIcon_didAddIconDataSource___block_invoke;
    v19 = &unk_1E8D89070;
    v21 = &v22;
    v10 = v7;
    v20 = v10;
    -[SBIconListModel enumerateIconsUsingBlock:](v9, "enumerateIconsUsingBlock:", &v16);
    if (!*((_BYTE *)v23 + 24))
    {
      objc_msgSend(v6, "iconDataSources", v16, v17, v18, v19);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "indexOfObject:", v10);

      objc_msgSend(v6, "gridSizeClass");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBHStackConfigurationViewController _unraveledWidgetIconForDataSource:withGridSizeClass:](self, "_unraveledWidgetIconForDataSource:withGridSizeClass:", v10, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[SBIconListModel insertIcon:atIndex:](v9, "insertIcon:atIndex:", v14, v12);
      -[SBIconListView layoutIconsIfNeededWithAnimationType:options:](self->_iconListView, "layoutIconsIfNeededWithAnimationType:options:", 0, 1);

    }
    _Block_object_dispose(&v22, 8);
  }

}

void __69__SBHStackConfigurationViewController_leafIcon_didAddIconDataSource___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  if ((objc_msgSend(v10, "isWidgetIcon") & 1) != 0)
  {
    objc_msgSend(v10, "activeDataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    v7 = a1 + 40;
    *(_BYTE *)(*(_QWORD *)(v8 + 8) + 24) = v6 == *(void **)(v7 - 8);

  }
  else
  {
    v9 = *(_QWORD *)(a1 + 40);
    v7 = a1 + 40;
    *(_BYTE *)(*(_QWORD *)(v9 + 8) + 24) = 0;
  }
  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)v7 + 8) + 24);

}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;

  v4 = a3;
  -[SBHStackConfigurationViewController _updateCurrentPageControlPage](self, "_updateCurrentPageControlPage");
  -[SBHStackConfigurationViewController _updatePresentationModeForIconViews](self, "_updatePresentationModeForIconViews");
  -[SBHScrollableIconViewInteraction clippingScrollViewDidScroll:](self->_scrollingInteraction, "clippingScrollViewDidScroll:", v4);

}

- (void)scrollViewWillBeginDragging:(id)a3
{
  -[SBHScrollableIconViewInteraction updateScrolling:](self->_scrollingInteraction, "updateScrolling:", 1);
}

- (void)scrollViewDidEndScrolling:(id)a3
{
  -[SBHScrollableIconViewInteraction updateScrolling:](self->_scrollingInteraction, "updateScrolling:", 0);
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  CGFloat v15;
  CGFloat v16;

  y = a4.y;
  objc_msgSend(a3, "contentOffset", a4.x);
  v8 = -[SBHStackConfigurationViewController _widgetIndexForContentOffset:](self, "_widgetIndexForContentOffset:");
  v9 = -[SBHStackConfigurationViewController _widgetIndexForContentOffset:](self, "_widgetIndexForContentOffset:", a5->x, a5->y);
  -[SBIconListView icons](self->_iconListView, "icons");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (fabs(y) >= 0.05 && v9 == v8)
  {
    v13 = v8 - 1;
    if (y >= 0.0)
      v13 = v8 + 1;
    v14 = v13 & ~(v13 >> 63);
    if (v11 - 1 >= v14)
      v9 = v14;
    else
      v9 = v11 - 1;
  }
  -[SBHStackConfigurationViewController _targetContentOffsetForWidgetIndex:](self, "_targetContentOffsetForWidgetIndex:", v9);
  a5->x = v15;
  a5->y = v16;
}

- (UIEdgeInsets)visibleContainerInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = *MEMORY[0x1E0DC49E8];
  v3 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v4 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v5 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)enumerateScrollableIconViewsUsingBlock:(id)a3
{
  -[SBIconListView enumerateDisplayedIconViewsUsingBlock:](self->_iconListView, "enumerateDisplayedIconViewsUsingBlock:", a3);
}

- (void)coronaAnimationController:(id)a3 willAnimateCoronaTransitionWithAnimator:(id)a4
{
  MTMaterialView *v6;
  SBHStackConfigurationApertureView *v7;
  SBHStackConfigurationApertureView *v8;
  MTMaterialView *v9;
  _QWORD v10[4];
  MTMaterialView *v11;
  SBHStackConfigurationApertureView *v12;

  v6 = self->_backgroundMaterialView;
  v7 = self->_apertureView;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __105__SBHStackConfigurationViewController_coronaAnimationController_willAnimateCoronaTransitionWithAnimator___block_invoke;
  v10[3] = &unk_1E8D84EF0;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  objc_msgSend(a4, "addAnimations:", v10);

}

void __105__SBHStackConfigurationViewController_coronaAnimationController_willAnimateCoronaTransitionWithAnimator___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  void *v6;
  id v7;
  id v8;

  v2 = (void *)MEMORY[0x1E0DC3F10];
  v3 = MEMORY[0x1E0C809B0];
  v4 = 3221225472;
  v5 = __105__SBHStackConfigurationViewController_coronaAnimationController_willAnimateCoronaTransitionWithAnimator___block_invoke_2;
  v6 = &unk_1E8D84EF0;
  v7 = *(id *)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  objc_msgSend(v2, "performWithoutAnimation:", &v3);
  objc_msgSend(*(id *)(a1 + 32), "pl_performCrossFadeIfNecessary", v3, v4, v5, v6);
  objc_msgSend(*(id *)(a1 + 40), "pl_performCrossFadeIfNecessary");

}

uint64_t __105__SBHStackConfigurationViewController_coronaAnimationController_willAnimateCoronaTransitionWithAnimator___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
  objc_msgSend(*(id *)(a1 + 40), "setNeedsLayout");
  return objc_msgSend(*(id *)(a1 + 40), "layoutIfNeeded");
}

- (double)_iconContentScale
{
  double v3;
  void *v4;
  __CFString *v5;
  void *v6;
  double v7;
  double v8;

  v3 = 1.0;
  if (-[SBHWidgetSettings stackConfigurationShouldScaleWidgets](self->_widgetSettings, "stackConfigurationShouldScaleWidgets"))
  {
    -[SBIconView icon](self->_stackIconView, "icon");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "gridSizeClass");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

    -[SBHStackConfigurationViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stackConfigurationViewController:iconContentScaleForGridSizeClass:", self, v5);
    v3 = v7;

    if (v3 <= 0.0)
    {
      if (v5 == CFSTR("SBHIconGridSizeClassMedium")
        || -[__CFString isEqualToString:](v5, "isEqualToString:"))
      {
        -[SBHWidgetSettings stackConfigurationMediumIconScale](self->_widgetSettings, "stackConfigurationMediumIconScale");
      }
      else if (v5 == CFSTR("SBHIconGridSizeClassLarge")
             || (-[__CFString isEqualToString:](v5, "isEqualToString:") & 1) != 0
             || v5 == CFSTR("SBHIconGridSizeClassNewsLargeTall")
             || -[__CFString isEqualToString:](v5, "isEqualToString:"))
      {
        -[SBHWidgetSettings stackConfigurationLargeIconScale](self->_widgetSettings, "stackConfigurationLargeIconScale");
      }
      else
      {
        if (v5 != CFSTR("SBHIconGridSizeClassExtraLarge"))
        {
          v3 = 1.0;
          if (!-[__CFString isEqualToString:](v5, "isEqualToString:"))
            goto LABEL_12;
        }
        -[SBHWidgetSettings stackConfigurationExtraLargeIconScale](self->_widgetSettings, "stackConfigurationExtraLargeIconScale");
      }
      v3 = v8;
    }
LABEL_12:

  }
  return v3;
}

- (CGSize)_stableApertureSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[SBHStackConfigurationViewController contentBoundingFrame](self, "contentBoundingFrame");
  v4 = v3;
  -[NSLayoutConstraint multiplier](self->_apertureSizeConstraint, "multiplier");
  v6 = v4 * v5;
  -[NSLayoutConstraint multiplier](self->_apertureHeightConstraint, "multiplier");
  v8 = v6 * v7;
  v9 = v6;
  result.height = v8;
  result.width = v9;
  return result;
}

- (BOOL)_shouldUseConcentricCornersWhenExpanded
{
  return !self->_stackSizeIsSmall;
}

- (double)_expandedPageControlOutset
{
  void *v3;
  uint64_t v4;
  double result;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  result = 14.0;
  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) != 1)
  {
    result = 17.0;
    if (!self->_stackSizeIsSmall)
      return 10.0;
  }
  return result;
}

- (unint64_t)_sourceActiveWidgetIndex
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;

  -[SBIconView icon](self->_stackIconView, "icon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHStackConfiguration dataSources](self->_configuration, "dataSources");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "indexOfObject:", v5);

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    v7 = 0;
  else
    v7 = v6;

  return v7;
}

- (unint64_t)_widgetIndexForContentOffset:(CGPoint)a3
{
  double y;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double height;
  double v12;
  unint64_t v13;
  void *v14;
  unint64_t v15;

  y = a3.y;
  -[SBHStackConfigurationApertureView bounds](self->_apertureView, "bounds", a3.x);
  v6 = v5 * 0.5;
  -[SBIconListView iconSpacing](self->_iconListView, "iconSpacing");
  v8 = v7;
  -[SBIconListView additionalLayoutInsets](self->_iconListView, "additionalLayoutInsets");
  v10 = v9;
  height = self->_iconImageInfo.size.height;
  -[SBIconListView iconContentScale](self->_iconListView, "iconContentScale");
  v13 = vcvtmd_u64_f64((v6 + v8 * 0.5 + y - v10) / (v8 + height * v12));
  -[SBIconListView icons](self->_iconListView, "icons");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count") - 1;

  if (v15 >= v13)
    return v13;
  else
    return v15;
}

- (CGPoint)_targetContentOffsetForWidgetIndex:(unint64_t)a3
{
  double v5;
  double v6;
  double height;
  double v8;
  double v9;
  double v10;
  CGPoint result;

  -[SBIconListView iconContentScale](self->_iconListView, "iconContentScale");
  v6 = v5;
  height = self->_iconImageInfo.size.height;
  -[SBIconListView iconSpacing](self->_iconListView, "iconSpacing");
  v9 = (v6 * height + v8) * (double)a3;
  v10 = 0.0;
  result.y = v9;
  result.x = v10;
  return result;
}

- (void)_scrollToWidgetIndex:(unint64_t)a3 animated:(BOOL)a4
{
  -[SBHStackConfigurationViewController _scrollToWidgetIndex:animated:completion:](self, "_scrollToWidgetIndex:animated:completion:", a3, a4, 0);
}

- (void)_scrollToWidgetIndex:(unint64_t)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  void *v8;
  unint64_t v9;
  double v10;
  void *v11;
  double v12;
  double Height;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  id v19;
  CGRect v20;

  v5 = a4;
  v19 = a5;
  -[SBIconListView icons](self->_iconListView, "icons");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9 > a3)
  {
    -[SBHStackConfigurationApertureView layoutIfNeeded](self->_apertureView, "layoutIfNeeded");
    v10 = 0.0;
    if (self->_scrollPositionNeed == 2)
    {
      -[SBIconView customIconImageViewController](self->_stackIconView, "customIconImageViewController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -1.0;
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        if (objc_msgSend(v11, "imageViewAlignment") == 1)
          v12 = 1.0;
        else
          v12 = -1.0;
      }
      -[SBIconView iconImageFrame](self->_stackIconView, "iconImageFrame");
      Height = CGRectGetHeight(v20);
      v14 = self->_iconImageInfo.size.height;
      -[SBIconListView iconContentScale](self->_iconListView, "iconContentScale");
      v10 = v12 * (v14 * v15 - Height) * 0.5;

    }
    -[SBHStackConfigurationViewController _targetContentOffsetForWidgetIndex:](self, "_targetContentOffsetForWidgetIndex:", a3);
    -[BSUIScrollView setContentOffset:animated:completion:](self->_scrollView, "setContentOffset:animated:completion:", v5, v19, v16 + 0.0, v10 + v17);
    goto LABEL_11;
  }
  v18 = v19;
  if (v19)
  {
    (*((void (**)(id, _QWORD))v19 + 2))(v19, 0);
LABEL_11:
    v18 = v19;
  }

}

- (void)_setPageControlScale:(double)a3
{
  UIPageControl *pageControl;
  CGAffineTransform v4;

  pageControl = self->_pageControl;
  CGAffineTransformMakeScale(&v4, a3, a3);
  -[UIPageControl setTransform:](pageControl, "setTransform:", &v4);
}

- (void)_updateCurrentPageControlPage
{
  unint64_t v3;

  -[BSUIScrollView contentOffset](self->_scrollView, "contentOffset");
  v3 = -[SBHStackConfigurationViewController _widgetIndexForContentOffset:](self, "_widgetIndexForContentOffset:");
  if (-[UIPageControl currentPage](self->_pageControl, "currentPage") != v3)
    -[UIPageControl setCurrentPage:](self->_pageControl, "setCurrentPage:", v3);
}

- (void)_updateForWidgetIconCountChanged
{
  void *v3;
  unint64_t v4;
  _BOOL8 v5;

  -[SBIconListView icons](self->_iconListView, "icons");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (-[UIPageControl numberOfPages](self->_pageControl, "numberOfPages") != v4)
  {
    -[UIPageControl setNumberOfPages:](self->_pageControl, "setNumberOfPages:", v4);
    -[SBHStackConfigurationViewController _updateCurrentPageControlPage](self, "_updateCurrentPageControlPage");
  }
  -[SBHStackConfigurationViewController _updateAddWidgetButtonOperabilityForDataSourceCount](self, "_updateAddWidgetButtonOperabilityForDataSourceCount");
  v5 = v4 < 2;
  -[CCUILabeledRoundButtonViewController setInoperative:](self->_smartRotateButtonViewController, "setInoperative:", v5);
  -[CCUILabeledRoundButtonViewController setInoperative:](self->_suggestionsButtonViewController, "setInoperative:", v5);
}

- (void)_setupMatchMoveAnimationWithSourceView:(id)a3 targetView:(id)a4
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)MEMORY[0x1E0DA9D88];
  v6 = a4;
  objc_msgSend(v5, "matchMoveAnimationForPinningToView:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAnimation:forKey:", v7, CFSTR("SBHStackConfigurationBackgroundMatchMoveKey"));

}

- (void)_updateButtonSubtitleForSmartRotate:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  SBHStackConfiguration *configuration;
  BOOL v8;
  int *v9;
  id v10;
  uint64_t v11;
  id v12;
  void (**v13)(_QWORD);
  id v14;
  void (**v15)(_QWORD);
  void *v16;
  void *v17;
  _QWORD v18[4];
  void (**v19)(_QWORD);
  _QWORD v20[4];
  id v21;
  BOOL v22;
  BOOL v23;
  BOOL v24;
  _QWORD aBlock[4];
  id v26;
  BOOL v27;

  v4 = a4;
  configuration = self->_configuration;
  if (a3)
  {
    v8 = -[SBHStackConfiguration allowsSuggestions](configuration, "allowsSuggestions");
    v9 = &OBJC_IVAR___SBHStackConfigurationViewController__smartRotateButtonViewController;
  }
  else
  {
    v8 = -[SBHStackConfiguration allowsExternalSuggestions](configuration, "allowsExternalSuggestions");
    v9 = &OBJC_IVAR___SBHStackConfigurationViewController__suggestionsButtonViewController;
  }
  v10 = *(id *)((char *)&self->super.super.super.isa + *v9);
  v11 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __84__SBHStackConfigurationViewController__updateButtonSubtitleForSmartRotate_animated___block_invoke;
  aBlock[3] = &unk_1E8D85BB8;
  v12 = v10;
  v26 = v12;
  v27 = v8;
  v13 = (void (**)(_QWORD))_Block_copy(aBlock);
  v20[0] = v11;
  v20[1] = 3221225472;
  v20[2] = __84__SBHStackConfigurationViewController__updateButtonSubtitleForSmartRotate_animated___block_invoke_2;
  v20[3] = &unk_1E8D89098;
  v22 = a3;
  v23 = v8;
  v24 = v4;
  v14 = v12;
  v21 = v14;
  v15 = (void (**)(_QWORD))_Block_copy(v20);
  if (v4)
  {
    v16 = (void *)MEMORY[0x1E0DC3F10];
    objc_msgSend(v14, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v11;
    v18[1] = 3221225472;
    v18[2] = __84__SBHStackConfigurationViewController__updateButtonSubtitleForSmartRotate_animated___block_invoke_6;
    v18[3] = &unk_1E8D859C0;
    v19 = v13;
    objc_msgSend(v16, "transitionWithView:duration:options:animations:completion:", v17, 5242886, v18, 0, 0.15);

    v15[2](v15);
  }
  else
  {
    v13[2](v13);
    v15[2](v15);
  }

}

void __84__SBHStackConfigurationViewController__updateButtonSubtitleForSmartRotate_animated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  const __CFString *v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  SBHBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v3;
  if (*(_BYTE *)(a1 + 40))
    v4 = CFSTR("ON");
  else
    v4 = CFSTR("OFF");
  objc_msgSend(v3, "localizedStringForKey:value:table:", v4, &stru_1E8D8E958, CFSTR("SpringBoardHome"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSubtitle:", v5);

}

void __84__SBHStackConfigurationViewController__updateButtonSubtitleForSmartRotate_animated___block_invoke_2(uint64_t a1)
{
  int v2;
  void *v3;
  dispatch_time_t v4;
  void *v5;
  int v6;
  dispatch_time_t v7;
  const __CFString *v8;
  dispatch_time_t v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD block[4];
  id v15;

  v2 = *(unsigned __int8 *)(a1 + 41);
  if (*(_BYTE *)(a1 + 40))
  {
    if (*(_BYTE *)(a1 + 41))
    {
      v3 = *(void **)(a1 + 32);
      if (*(_BYTE *)(a1 + 42))
      {
        objc_msgSend(v3, "setGlyphState:", CFSTR("State 2"));
        v4 = dispatch_time(0, 300000000);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __84__SBHStackConfigurationViewController__updateButtonSubtitleForSmartRotate_animated___block_invoke_3;
        block[3] = &unk_1E8D84C50;
        v15 = *(id *)(a1 + 32);
        dispatch_after(v4, MEMORY[0x1E0C80D38], block);
        v5 = v15;
LABEL_12:

        return;
      }
      v8 = CFSTR("State 3");
    }
    else
    {
      v3 = *(void **)(a1 + 32);
      v8 = CFSTR("State 1");
    }
  }
  else
  {
    v6 = *(unsigned __int8 *)(a1 + 42);
    v3 = *(void **)(a1 + 32);
    if (v2)
    {
      if (v6)
      {
        objc_msgSend(v3, "setGlyphState:", CFSTR("State 3"));
        v7 = dispatch_time(0, 100000000);
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __84__SBHStackConfigurationViewController__updateButtonSubtitleForSmartRotate_animated___block_invoke_4;
        v12[3] = &unk_1E8D84C50;
        v13 = *(id *)(a1 + 32);
        dispatch_after(v7, MEMORY[0x1E0C80D38], v12);
        v5 = v13;
        goto LABEL_12;
      }
      v8 = CFSTR("State 4");
    }
    else
    {
      if (v6)
      {
        objc_msgSend(v3, "setGlyphState:", CFSTR("State 1"));
        v9 = dispatch_time(0, 100000000);
        v10[0] = MEMORY[0x1E0C809B0];
        v10[1] = 3221225472;
        v10[2] = __84__SBHStackConfigurationViewController__updateButtonSubtitleForSmartRotate_animated___block_invoke_5;
        v10[3] = &unk_1E8D84C50;
        v11 = *(id *)(a1 + 32);
        dispatch_after(v9, MEMORY[0x1E0C80D38], v10);
        v5 = v11;
        goto LABEL_12;
      }
      v8 = CFSTR("State 2");
    }
  }
  objc_msgSend(v3, "setGlyphState:", v8);
}

void __84__SBHStackConfigurationViewController__updateButtonSubtitleForSmartRotate_animated___block_invoke_3(uint64_t a1)
{
  void *v2;
  int v3;

  objc_msgSend(*(id *)(a1 + 32), "glyphState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("State 2"));

  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "setGlyphState:", CFSTR("State 3"));
}

void __84__SBHStackConfigurationViewController__updateButtonSubtitleForSmartRotate_animated___block_invoke_4(uint64_t a1)
{
  void *v2;
  int v3;

  objc_msgSend(*(id *)(a1 + 32), "glyphState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("State 3"));

  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "setGlyphState:", CFSTR("State 4"));
}

void __84__SBHStackConfigurationViewController__updateButtonSubtitleForSmartRotate_animated___block_invoke_5(uint64_t a1)
{
  void *v2;
  int v3;

  objc_msgSend(*(id *)(a1 + 32), "glyphState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("State 1"));

  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "setGlyphState:", CFSTR("State 2"));
}

uint64_t __84__SBHStackConfigurationViewController__updateButtonSubtitleForSmartRotate_animated___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_updateAddWidgetButtonOperabilityForDataSourceCount
{
  -[SBHomeScreenButton setEnabled:](self->_addButton, "setEnabled:", -[SBHStackConfigurationViewController _canAddAdditionalWidgets](self, "_canAddAdditionalWidgets"));
}

- (void)_iconListDidChangeWidgetIcons
{
  void *v3;
  void *v4;
  id v5;

  -[SBIconListView model](self->_iconListView, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "icons");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bs_compactMap:", &__block_literal_global_35);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[SBHStackConfiguration setDataSources:](self->_configuration, "setDataSources:", v5);
  -[SBHStackConfigurationViewController _saveConfiguration](self, "_saveConfiguration");

}

id __68__SBHStackConfigurationViewController__iconListDidChangeWidgetIcons__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if (objc_msgSend(v2, "isWidgetIcon"))
  {
    objc_msgSend(v2, "activeDataSource");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)_saveConfiguration
{
  id v3;

  -[SBHStackConfigurationViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "stackConfigurationViewController:didCommitStackConfiguration:", self, self->_configuration);

}

- (void)_updateEditingStateAnimated:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL8 v5;

  v3 = a3;
  v5 = self->_editingIcons && !self->_suppressesEditingStateForListView;
  -[SBIconListView setEditing:](self->_iconListView, "setEditing:", v5);
  -[SBIconListView updateEditingStateAnimated:](self->_iconListView, "updateEditingStateAnimated:", v3);
}

- (void)_requestDismissal
{
  id v3;

  -[SBHStackConfigurationViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stackConfigurationViewControllerRequestsDismissal:", self);

}

- (BOOL)_widgetDataSourceIsSuggestion:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  objc_opt_class();
  v4 = ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    && objc_msgSend(v3, "suggestionSource") == 1;

  return v4;
}

- (BOOL)_canAddAdditionalWidgets
{
  SBHStackConfigurationViewController *v2;
  void *v3;
  unint64_t v4;

  v2 = self;
  -[SBHStackConfiguration dataSources](self->_configuration, "dataSources");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  LOBYTE(v2) = v4 < -[SBHWidgetSettings maximumWidgetsInAStack](v2->_widgetSettings, "maximumWidgetsInAStack");

  return (char)v2;
}

- (void)setTitledButtonsEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[SBHStackConfigurationViewController doneButton](self, "doneButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", v3);

  -[SBHStackConfigurationViewController addButton](self, "addButton");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", v3);

}

- (void)_didChangePageControlPage:(id)a3
{
  uint64_t v4;

  v4 = objc_msgSend(a3, "currentPage");
  -[SBHScrollableIconViewInteraction updateScrolling:](self->_scrollingInteraction, "updateScrolling:", 1);
  -[SBHStackConfigurationViewController _scrollToWidgetIndex:animated:](self, "_scrollToWidgetIndex:animated:", v4, 0);
  -[SBHScrollableIconViewInteraction updateScrolling:](self->_scrollingInteraction, "updateScrolling:", 0);
}

- (void)_didToggleSmartRotate:(id)a3
{
  -[SBHStackConfiguration setAllowsSuggestions:](self->_configuration, "setAllowsSuggestions:", -[SBHStackConfiguration allowsSuggestions](self->_configuration, "allowsSuggestions", a3) ^ 1);
  -[SBHStackConfigurationViewController _updateButtonSubtitleForSmartRotate:animated:](self, "_updateButtonSubtitleForSmartRotate:animated:", 1, 1);
  -[SBHStackConfigurationViewController _saveConfiguration](self, "_saveConfiguration");
}

- (void)_didToggleSuggestions:(id)a3
{
  _BOOL4 v4;
  SBIconListView *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = -[SBHStackConfiguration allowsExternalSuggestions](self->_configuration, "allowsExternalSuggestions", a3);
  if (v4)
  {
    v5 = self->_iconListView;
    -[SBIconListView icons](v5, "icons");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bs_compactMap:", &__block_literal_global_237);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBIconListView model](self->_iconListView, "model");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeIcons:options:", v7, 0);
    -[SBIconListView layoutIconsIfNeededWithAnimationType:options:](v5, "layoutIconsIfNeededWithAnimationType:options:", 0, 0);

  }
  -[SBHStackConfiguration setAllowsExternalSuggestions:](self->_configuration, "setAllowsExternalSuggestions:", !v4);
  -[SBHStackConfigurationViewController _updateButtonSubtitleForSmartRotate:animated:](self, "_updateButtonSubtitleForSmartRotate:animated:", 0, 1);
  -[SBHStackConfigurationViewController _saveConfiguration](self, "_saveConfiguration");
}

id __61__SBHStackConfigurationViewController__didToggleSuggestions___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  id v5;

  v2 = a2;
  if (objc_msgSend(v2, "isWidgetIcon"))
  {
    objc_msgSend(v2, "firstSuggestedIconDataSource");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      v4 = v2;
    else
      v4 = 0;
    v5 = v4;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_didTapAddWidgetButton:(id)a3
{
  void *v4;
  unint64_t v5;
  unint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  int v9;
  SBHStackConfigurationViewController *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[SBHStackConfiguration dataSources](self->_configuration, "dataSources", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  v6 = -[SBHWidgetSettings maximumWidgetsInAStack](self->_widgetSettings, "maximumWidgetsInAStack");

  SBLogIcon();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v5 >= v6)
  {
    if (v8)
    {
      v9 = 138412290;
      v10 = self;
      _os_log_impl(&dword_1CFEF3000, v7, OS_LOG_TYPE_INFO, "'%@' ignoring tap to present Add Widget Sheet", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    if (v8)
    {
      v9 = 138412290;
      v10 = self;
      _os_log_impl(&dword_1CFEF3000, v7, OS_LOG_TYPE_INFO, "'%@' requesting presentation of Add Widget Sheet", (uint8_t *)&v9, 0xCu);
    }

    -[SBHStackConfigurationViewController delegate](self, "delegate");
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject stackConfigurationViewControllerRequestsPresentAddWidgetSheet:](v7, "stackConfigurationViewControllerRequestsPresentAddWidgetSheet:", self);
  }

}

- (void)_didTapDoneButton:(id)a3
{
  void *v4;
  NSObject *v5;
  int v6;
  SBHStackConfigurationViewController *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  -[SBHStackConfigurationViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "stackConfigurationViewControllerDoneButtonTapped:", self);
  SBLogIcon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 138412290;
    v7 = self;
    _os_log_impl(&dword_1CFEF3000, v5, OS_LOG_TYPE_INFO, "'%@' requesting dismissal; Done button tapped",
      (uint8_t *)&v6,
      0xCu);
  }

  -[SBHStackConfigurationViewController _requestDismissal](self, "_requestDismissal");
}

- (void)_didTapBackgroundView:(id)a3
{
  id v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  NSObject *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  SBHStackConfigurationViewController *v26;
  _BYTE v27[128];
  uint64_t v28;
  CGPoint v29;
  CGRect v30;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v5);
  v7 = v6;
  v9 = v8;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", self->_apertureView);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUILabeledRoundButtonViewController view](self->_smartRotateButtonViewController, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v11);

  -[CCUILabeledRoundButtonViewController view](self->_suggestionsButtonViewController, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v12);

  -[SBHStackConfigurationViewController addButton](self, "addButton");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bs_safeAddObject:", v13);

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v14 = v10;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v22 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v19, "bounds", (_QWORD)v21);
        objc_msgSend(v19, "convertRect:toView:", v5);
        v29.x = v7;
        v29.y = v9;
        if (CGRectContainsPoint(v30, v29))
        {

          goto LABEL_13;
        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
      if (v16)
        continue;
      break;
    }
  }

  SBLogIcon();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v26 = self;
    _os_log_impl(&dword_1CFEF3000, v20, OS_LOG_TYPE_INFO, "'%@' requesting dismissal due to tap gesture", buf, 0xCu);
  }

  -[SBHStackConfigurationViewController _requestDismissal](self, "_requestDismissal");
LABEL_13:

}

- (BOOL)_shouldKeepIconImageViewControllersStatic
{
  return -[NSHashTable count](self->_keepStaticAssertions, "count") != 0;
}

- (void)_updatePresentationModeForIconViews
{
  BOOL v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  id v13;

  v3 = -[SBHStackConfigurationViewController _shouldKeepIconImageViewControllersStatic](self, "_shouldKeepIconImageViewControllersStatic");
  -[BSUIScrollView contentOffset](self->_scrollView, "contentOffset");
  v4 = -[SBHStackConfigurationViewController _widgetIndexForContentOffset:](self, "_widgetIndexForContentOffset:");
  v5 = v4;
  if (v4)
    v6 = v4 - 1;
  else
    v6 = 0;
  -[SBIconListView icons](self->_iconListView, "icons");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "count"))
  {
    v7 = 0;
    v12 = v5 + 1;
    do
    {
      v8 = v3 || v7 < v6 || v7 > v12;
      objc_msgSend(v13, "objectAtIndexedSubscript:", v7, v12);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBIconListView displayedIconViewForIcon:](self->_iconListView, "displayedIconViewForIcon:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "customIconImageViewController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v11, "setPresentationMode:", v8);

      ++v7;
    }
    while (v7 < objc_msgSend(v13, "count"));
  }

}

- (BOOL)_allowUserInteraction
{
  return 1;
}

- (void)_cancelCloseConfigurationTimer
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1CFEF3000, log, OS_LOG_TYPE_DEBUG, "[SBHStackConfigurationViewController] _cancelCloseConfigurationTimer was called", v1, 2u);
}

- (void)_closeConfigurationTimerFired
{
  NSObject *v3;
  int v4;
  SBHStackConfigurationViewController *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  SBLogIcon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 138412290;
    v5 = self;
    _os_log_impl(&dword_1CFEF3000, v3, OS_LOG_TYPE_INFO, "'%@' requesting dismissal; Close configuration timer fired",
      (uint8_t *)&v4,
      0xCu);
  }

  -[SBHStackConfigurationViewController _requestDismissal](self, "_requestDismissal");
}

- (void)_setCloseFolderTimerIfNecessary
{
  NSTimer *v3;
  NSTimer *closeConfigurationTimer;

  if (!self->_closeConfigurationTimer
    && self->_grabbedIconHasEverEnteredStackConfigurationView
    && -[SBHStackConfigurationViewController closesAfterDragExits](self, "closesAfterDragExits")
    && !-[NSMutableSet count](self->_draggingEnteredIconListViews, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__closeConfigurationTimerFired, 0, 0, 0.5);
    v3 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    closeConfigurationTimer = self->_closeConfigurationTimer;
    self->_closeConfigurationTimer = v3;

  }
}

- (void)willDismiss
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[SBHStackConfigurationViewController _cancelCloseConfigurationTimer](self, "_cancelCloseConfigurationTimer");
  if (-[SBIconDragManager isTrackingUserActiveIconDrags](self->_iconDragManager, "isTrackingUserActiveIconDrags"))
  {
    -[SBIconListView model](self->_iconListView, "model");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    objc_msgSend(v3, "icons", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i);
          if (-[SBIconDragManager isTrackingDragOfIcon:](self->_iconDragManager, "isTrackingDragOfIcon:", v9))
            objc_msgSend(v3, "removeIcon:", v9);
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }

    -[SBHStackConfigurationViewController setDidRemoveDraggedIconsForDismissal:](self, "setDidRemoveDraggedIconsForDismissal:", 1);
  }
}

- (void)noteIconDrag:(id)a3 didEnterIconListView:(id)a4
{
  id v6;
  NSMutableSet *draggingEnteredIconListViews;
  NSMutableSet *v8;
  NSMutableSet *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  void *v14;
  id v15;
  CGPoint v16;
  CGRect v17;

  v15 = a3;
  v6 = a4;
  draggingEnteredIconListViews = self->_draggingEnteredIconListViews;
  if (!draggingEnteredIconListViews)
  {
    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v9 = self->_draggingEnteredIconListViews;
    self->_draggingEnteredIconListViews = v8;

    draggingEnteredIconListViews = self->_draggingEnteredIconListViews;
  }
  -[NSMutableSet addObject:](draggingEnteredIconListViews, "addObject:", v6);
  objc_msgSend(v15, "locationInView:", v6);
  v11 = v10;
  v13 = v12;
  objc_msgSend(v6, "bounds");
  v16.x = v11;
  v16.y = v13;
  if (CGRectContainsPoint(v17, v16))
  {
    -[SBHStackConfigurationViewController _cancelAllInteractionTimers](self, "_cancelAllInteractionTimers");
    self->_grabbedIconHasEverEnteredStackConfigurationView = 1;
  }
  -[SBHStackConfigurationViewController delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stackConfigurationViewController:isConsumingDropSession:", self, v15);

}

- (void)noteIconDrag:(id)a3 didChangeInIconListView:(id)a4
{
  id v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  id v11;
  CGPoint v12;
  CGRect v13;

  v11 = a3;
  v6 = a4;
  if (!-[SBHStackConfigurationViewController _allowUserInteraction](self, "_allowUserInteraction"))
    -[SBHStackConfigurationViewController _cancelAllInteractionTimers](self, "_cancelAllInteractionTimers");
  if (-[NSMutableSet containsObject:](self->_draggingEnteredIconListViews, "containsObject:", v6))
  {
    objc_msgSend(v11, "locationInView:", v6);
    v8 = v7;
    v10 = v9;
    objc_msgSend(v6, "bounds");
    v12.x = v8;
    v12.y = v10;
    if (CGRectContainsPoint(v13, v12))
    {
      self->_grabbedIconHasEverEnteredStackConfigurationView = 1;
    }
    else
    {
      -[NSMutableSet removeObject:](self->_draggingEnteredIconListViews, "removeObject:", v6);
      -[SBHStackConfigurationViewController _setCloseFolderTimerIfNecessary](self, "_setCloseFolderTimerIfNecessary");
    }
  }

}

- (void)noteIconDrag:(id)a3 didExitIconListView:(id)a4
{
  id v5;

  v5 = a4;
  if (-[NSMutableSet containsObject:](self->_draggingEnteredIconListViews, "containsObject:"))
  {
    -[NSMutableSet removeObject:](self->_draggingEnteredIconListViews, "removeObject:", v5);
    if (!-[SBHStackConfigurationViewController didPerformDrop](self, "didPerformDrop"))
      -[SBHStackConfigurationViewController _setCloseFolderTimerIfNecessary](self, "_setCloseFolderTimerIfNecessary");
  }

}

- (void)noteIconDragDidEnd
{
  NSMutableSet *draggingEnteredIconListViews;

  -[SBHStackConfigurationViewController _cancelAllInteractionTimers](self, "_cancelAllInteractionTimers");
  self->_grabbedIconHasEverEnteredStackConfigurationView = 0;
  draggingEnteredIconListViews = self->_draggingEnteredIconListViews;
  self->_draggingEnteredIconListViews = 0;

}

- (void)iconDragManager:(id)a3 iconView:(id)a4 willBeginDragSession:(id)a5
{
  -[SBHStackConfigurationViewController setCurrentDraggingIconView:](self, "setCurrentDraggingIconView:", a4);
  if (!-[SBHStackConfigurationViewController canDismissWhileDragging](self, "canDismissWhileDragging"))
    -[SBHStackConfigurationViewController setTitledButtonsEnabled:](self, "setTitledButtonsEnabled:", 0);
  -[SBHStackConfigurationViewController setDidPerformDrop:](self, "setDidPerformDrop:", 0);
}

- (BOOL)iconDragManager:(id)a3 canAddDragItemsToSession:(id)a4 fromIconView:(id)a5
{
  return 0;
}

- (void)iconDragManager:(id)a3 iconView:(id)a4 willAnimateDragLiftWithAnimator:(id)a5 session:(id)a6
{
  id v9;
  id v10;
  void *v11;
  id v12;

  v12 = a4;
  v9 = a5;
  v10 = a6;
  -[SBHStackConfigurationViewController delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v11, "stackConfigurationViewController:iconView:willAnimateDragLiftWithAnimator:session:", self, v12, v9, v10);

}

- (void)iconDragManager:(id)a3 iconView:(id)a4 dragLiftAnimationDidChangeDirection:(int64_t)a5
{
  void *v7;
  id v8;

  v8 = a4;
  -[SBHStackConfigurationViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "stackConfigurationViewController:iconView:dragLiftAnimationDidChangeDirection:", self, v8, a5);

}

- (void)iconDragManager:(id)a3 iconView:(id)a4 item:(id)a5 willAnimateDragCancelWithAnimator:(id)a6
{
  void *v7;
  SBIconDragManager *iconDragManager;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a5;
  if (-[SBHStackConfigurationViewController didRemoveDraggedIconsForDismissal](self, "didRemoveDraggedIconsForDismissal"))
  {
    objc_msgSend(v12, "sbh_appDragLocalContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    iconDragManager = self->_iconDragManager;
    objc_msgSend(v7, "uniqueIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconDragManager draggedIconForIdentifier:](iconDragManager, "draggedIconForIdentifier:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBIconListView model](self->_iconListView, "model");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addIcon:", v10);

  }
}

- (void)iconDragManager:(id)a3 iconView:(id)a4 didEndDragSession:(id)a5 withOperation:(unint64_t)a6
{
  id v7;
  id v8;

  v7 = a4;
  -[SBHStackConfigurationViewController currentDraggingIconView](self, "currentDraggingIconView");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v7)
    -[SBHStackConfigurationViewController setCurrentDraggingIconView:](self, "setCurrentDraggingIconView:", 0);
  if (!-[SBHStackConfigurationViewController canDismissWhileDragging](self, "canDismissWhileDragging"))
    -[SBHStackConfigurationViewController setTitledButtonsEnabled:](self, "setTitledButtonsEnabled:", 1);
}

- (BOOL)iconDragManager:(id)a3 dragsSupportSystemDragsForIconView:(id)a4
{
  id v5;
  void *v6;
  char v7;
  BOOL v8;

  v5 = a4;
  -[SBHStackConfigurationViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v7 = objc_msgSend(v6, "stackConfigurationViewController:dragsSupportSystemDragsForIconView:", self, v5);
  else
    v7 = objc_msgSend(v5, "dragsSupportSystemDragsByDefault");
  v8 = v7;

  return v8;
}

- (void)iconDragManager:(id)a3 iconDropSession:(id)a4 didEnterIconListView:(id)a5
{
  -[SBHStackConfigurationViewController noteIconDrag:didEnterIconListView:](self, "noteIconDrag:didEnterIconListView:", a4, a5);
}

- (id)iconDragManager:(id)a3 iconDropSessionDidUpdate:(id)a4 inIconListView:(id)a5 draggedIcons:(id)a6 proposedDropProposal:(id)a7
{
  id v10;

  v10 = a7;
  -[SBHStackConfigurationViewController noteIconDrag:didChangeInIconListView:](self, "noteIconDrag:didChangeInIconListView:", a4, a5);
  return v10;
}

- (void)iconDragManager:(id)a3 iconDropSession:(id)a4 didExitIconListView:(id)a5
{
  -[SBHStackConfigurationViewController noteIconDrag:didExitIconListView:](self, "noteIconDrag:didExitIconListView:", a4, a5);
}

- (void)iconDragManagerIconDraggingDidChange:(id)a3
{
  if ((objc_msgSend(a3, "isIconDragging") & 1) == 0)
    -[SBHStackConfigurationViewController noteIconDragDidEnd](self, "noteIconDragDidEnd");
}

- (void)iconDragManager:(id)a3 didPerformIconDrop:(id)a4 withIcons:(id)a5 inIconListView:(id)a6
{
  -[SBHStackConfigurationViewController _cancelCloseConfigurationTimer](self, "_cancelCloseConfigurationTimer", a3, a4, a5, a6);
  -[SBHStackConfigurationViewController setDidPerformDrop:](self, "setDidPerformDrop:", 1);
}

- (void)iconDragManager:(id)a3 iconListView:(id)a4 item:(id)a5 willAnimateDropWithAnimator:(id)a6
{
  id v8;
  SBIconDragManager *iconDragManager;
  void *v10;
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  id v20;
  CGRect v21;
  CGRect v22;

  v8 = a4;
  objc_msgSend(a5, "sbh_appDragLocalContext");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  iconDragManager = self->_iconDragManager;
  objc_msgSend(v20, "uniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconDragManager draggedIconForIdentifier:](iconDragManager, "draggedIconForIdentifier:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "rectForIcon:", v11);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  v21.origin.x = v13;
  v21.origin.y = v15;
  v21.size.width = v17;
  v21.size.height = v19;
  v22 = CGRectInset(v21, 0.0, -8.0);
  -[BSUIScrollView scrollRectToVisible:animated:](self->_scrollView, "scrollRectToVisible:animated:", 1, v22.origin.x, v22.origin.y, v22.size.width, v22.size.height);

}

- (id)rootListModelForIconDragManager:(id)a3
{
  return self->_rootListModel;
}

- (id)rootViewForIconDragManager:(id)a3
{
  return self->_iconListView;
}

- (BOOL)isEditing
{
  return 1;
}

- (BOOL)iconDragManager:(id)a3 doesIconRepresentRealIconPosition:(id)a4 inLocation:(id)a5
{
  return 1;
}

- (id)iconListViewForIndexPath:(id)a3
{
  return self->_iconListView;
}

- (id)iconViewQueryableForIconDragManager:(id)a3
{
  return self->_iconListView;
}

- (id)iconDragManager:(id)a3 draggedIconForIdentifier:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[SBHStackConfigurationViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stackConfigurationViewController:draggedIconForIdentifier:", self, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)widgetInsertionRippleIconAnimatorForIcon:(id)a3 iconListView:(id)a4 withReferenceIconView:(id)a5
{
  SBIconListLayoutProvider *listLayoutProvider;
  id v9;
  id v10;
  id v11;
  void *v12;
  SBHWidgetInsertionRippleIconAnimator *v13;
  SBHWidgetInsertionRippleIconAnimator *v14;
  _QWORD v16[5];

  listLayoutProvider = self->_listLayoutProvider;
  v9 = a5;
  v10 = a4;
  v11 = a3;
  -[SBIconListLayoutProvider layoutForIconLocation:](listLayoutProvider, "layoutForIconLocation:", CFSTR("SBIconLocationRoot"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = [SBHWidgetInsertionRippleIconAnimator alloc];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __115__SBHStackConfigurationViewController_widgetInsertionRippleIconAnimatorForIcon_iconListView_withReferenceIconView___block_invoke;
  v16[3] = &unk_1E8D84C50;
  v16[4] = self;
  v14 = -[SBHWidgetInsertionRippleIconAnimator initWithIconListView:widgetIcon:referenceLayout:referenceIconView:additionalIconListView:preludeBlock:](v13, "initWithIconListView:widgetIcon:referenceLayout:referenceIconView:additionalIconListView:preludeBlock:", v10, v11, v12, v9, 0, v16);

  return v14;
}

void __115__SBHStackConfigurationViewController_widgetInsertionRippleIconAnimatorForIcon_iconListView_withReferenceIconView___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stackConfigurationViewControllerWillAnimateWidgetInsertion:", *(_QWORD *)(a1 + 32));

}

- (id)iconDragManager:(id)a3 dragPreviewForIconView:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[SBHStackConfigurationViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "stackConfigurationViewController:dragPreviewForIconView:", self, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)iconDragManager:(id)a3 targetedDragPreviewForIconView:(id)a4 item:(id)a5 session:(id)a6 previewParameters:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  -[SBHStackConfigurationViewController delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v15, "stackConfigurationViewController:targetedDragPreviewForIconView:item:session:previewParameters:", self, v11, v12, v13, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)windowForIconDragPreviewsForIconDragManager:(id)a3 forWindowScene:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[SBHStackConfigurationViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "windowForIconDragPreviewsForStackConfigurationViewController:forWindowScene:", self, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)iconListModel:(id)a3 isAllowedToContainIcon:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v5 = a4;
  objc_msgSend(v5, "gridSizeClass");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconView icon](self->_stackIconView, "icon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "gridSizeClass");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 == v8)
  {
    v12 = 1;
  }
  else
  {
    objc_msgSend(v5, "gridSizeClass");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconView icon](self->_stackIconView, "icon");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "gridSizeClass");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v9, "isEqualToString:", v11);

  }
  return v12;
}

- (void)iconList:(id)a3 didAddIcon:(id)a4
{
  id v5;

  v5 = a4;
  if (objc_msgSend(v5, "isWidgetIcon"))
  {
    objc_msgSend(v5, "addObserver:", self);
    -[SBHStackConfigurationViewController _iconListDidChangeWidgetIcons](self, "_iconListDidChangeWidgetIcons");
  }
  -[SBHStackConfigurationViewController _updateForWidgetIconCountChanged](self, "_updateForWidgetIconCountChanged");

}

- (void)iconList:(id)a3 didReplaceIcon:(id)a4 withIcon:(id)a5
{
  id v7;
  id v8;

  v8 = a4;
  v7 = a5;
  if ((objc_msgSend(v8, "isWidgetIcon") & 1) != 0 || objc_msgSend(v7, "isWidgetIcon"))
  {
    objc_msgSend(v8, "removeObserver:", self);
    objc_msgSend(v7, "addObserver:", self);
    -[SBHStackConfigurationViewController _iconListDidChangeWidgetIcons](self, "_iconListDidChangeWidgetIcons");
  }
  -[SBHStackConfigurationViewController _updateForWidgetIconCountChanged](self, "_updateForWidgetIconCountChanged");

}

- (void)iconList:(id)a3 didRemoveIcon:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v7 = a4;
  if ((objc_msgSend(v7, "isPlaceholder") & 1) != 0)
  {
    objc_msgSend(v7, "referencedIcon");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = v7;
  }
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "removeObserver:", self);
    -[SBHStackConfigurationViewController _iconListDidChangeWidgetIcons](self, "_iconListDidChangeWidgetIcons");
  }
  -[SBHStackConfigurationViewController _updateForWidgetIconCountChanged](self, "_updateForWidgetIconCountChanged");

}

- (void)iconList:(id)a3 didMoveIcon:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v9 = a4;
  if ((objc_msgSend(v9, "isPlaceholder") & 1) != 0)
  {
    objc_msgSend(v9, "referencedIcon");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = v9;
  }
  v6 = v5;
  if (v5)
  {
    v7 = v5;
    objc_msgSend(v7, "activeDataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[SBHStackConfigurationViewController _widgetDataSourceIsSuggestion:](self, "_widgetDataSourceIsSuggestion:", v8))
    {
      -[SBHStackConfigurationViewController _promoteWidgetIcon:](self, "_promoteWidgetIcon:", v7);
    }
    -[SBHStackConfigurationViewController _iconListDidChangeWidgetIcons](self, "_iconListDidChangeWidgetIcons");

  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  BOOL v4;
  void *v5;

  if (-[SBHStackConfigurationViewController canDismissWhileDragging](self, "canDismissWhileDragging", a3))
    return 1;
  -[SBHStackConfigurationViewController currentDraggingIconView](self, "currentDraggingIconView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v5 == 0;

  return v4;
}

- (void)stackConfigurationView:(id)a3 didHitTestView:(id)a4 atPoint:(CGPoint)a5 withEvent:(id)a6
{
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v7 = (void *)MEMORY[0x1E0C99DE8];
  v8 = a4;
  objc_msgSend(v7, "array");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[SBHStackConfigurationViewController addButton](self, "addButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bs_safeAddObject:", v9);

  -[SBHStackConfigurationViewController doneButton](self, "doneButton");
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bs_safeAddObject:", v10);

  LOBYTE(v10) = objc_msgSend(v12, "containsObject:", v8);
  if ((v10 & 1) == 0)
  {
    -[SBHStackConfigurationViewController delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v11, "stackConfigurationViewControllerDidReceiveUserTouch:", self);

  }
}

- (double)titledButtonsAlpha
{
  return self->_titledButtonsAlpha;
}

- (SBHStackConfigurationViewControllerDelegate)delegate
{
  return (SBHStackConfigurationViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SBHWidgetSheetViewControllerPresenter)presenter
{
  return (SBHWidgetSheetViewControllerPresenter *)objc_loadWeakRetained((id *)&self->_presenter);
}

- (void)setPresenter:(id)a3
{
  objc_storeWeak((id *)&self->_presenter, a3);
}

- (CGRect)contentBoundingFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_contentBoundingFrame.origin.x;
  y = self->_contentBoundingFrame.origin.y;
  width = self->_contentBoundingFrame.size.width;
  height = self->_contentBoundingFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setContentBoundingFrame:(CGRect)a3
{
  self->_contentBoundingFrame = a3;
}

- (BOOL)canDismissWhileDragging
{
  return self->_canDismissWhileDragging;
}

- (void)setCanDismissWhileDragging:(BOOL)a3
{
  self->_canDismissWhileDragging = a3;
}

- (BOOL)isEditingIcons
{
  return self->_editingIcons;
}

- (SBIconView)currentConfiguringIconView
{
  return self->_currentConfiguringIconView;
}

- (void)setCurrentConfiguringIconView:(id)a3
{
  objc_storeStrong((id *)&self->_currentConfiguringIconView, a3);
}

- (SBHIconImageAppearance)overrideIconImageAppearance
{
  return self->_overrideIconImageAppearance;
}

- (SBHIconImageStyleConfiguration)overrideIconImageStyleConfiguration
{
  return self->_overrideIconImageStyleConfiguration;
}

- (SBIconDragManager)iconDragManager
{
  return self->_iconDragManager;
}

- (void)setIconDragManager:(id)a3
{
  objc_storeStrong((id *)&self->_iconDragManager, a3);
}

- (SBIconView)currentDraggingIconView
{
  return self->_currentDraggingIconView;
}

- (void)setCurrentDraggingIconView:(id)a3
{
  objc_storeStrong((id *)&self->_currentDraggingIconView, a3);
}

- (SBTitledHomeScreenButton)doneButton
{
  return self->_doneButton;
}

- (void)setDoneButton:(id)a3
{
  objc_storeStrong((id *)&self->_doneButton, a3);
}

- (SBTitledHomeScreenButton)addButton
{
  return self->_addButton;
}

- (void)setAddButton:(id)a3
{
  objc_storeStrong((id *)&self->_addButton, a3);
}

- (BOOL)didPerformDrop
{
  return self->_didPerformDrop;
}

- (void)setDidPerformDrop:(BOOL)a3
{
  self->_didPerformDrop = a3;
}

- (BOOL)didRemoveDraggedIconsForDismissal
{
  return self->_didRemoveDraggedIconsForDismissal;
}

- (void)setDidRemoveDraggedIconsForDismissal:(BOOL)a3
{
  self->_didRemoveDraggedIconsForDismissal = a3;
}

- (SBHCustomIconListLayout)customLayout
{
  return self->_customLayout;
}

- (void)setCustomLayout:(id)a3
{
  objc_storeStrong((id *)&self->_customLayout, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customLayout, 0);
  objc_storeStrong((id *)&self->_addButton, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_currentDraggingIconView, 0);
  objc_storeStrong((id *)&self->_iconDragManager, 0);
  objc_storeStrong((id *)&self->_overrideIconImageStyleConfiguration, 0);
  objc_storeStrong((id *)&self->_overrideIconImageAppearance, 0);
  objc_storeStrong((id *)&self->_currentConfiguringIconView, 0);
  objc_destroyWeak((id *)&self->_presenter);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_keepStaticAssertions, 0);
  objc_storeStrong((id *)&self->_draggingEnteredIconListViews, 0);
  objc_storeStrong((id *)&self->_closeConfigurationTimer, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_scalingView, 0);
  objc_storeStrong((id *)&self->_pageControl, 0);
  objc_storeStrong((id *)&self->_pageControlOutsetConstraint, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_scrollingInteraction, 0);
  objc_storeStrong((id *)&self->_apertureSizeConstraint, 0);
  objc_storeStrong((id *)&self->_apertureHeightConstraint, 0);
  objc_storeStrong((id *)&self->_apertureCenterYConstraint, 0);
  objc_storeStrong((id *)&self->_apertureCenterXConstraint, 0);
  objc_storeStrong((id *)&self->_apertureView, 0);
  objc_storeStrong((id *)&self->_backgroundDimmingView, 0);
  objc_storeStrong((id *)&self->_backgroundMaterialView, 0);
  objc_storeStrong((id *)&self->_suggestionsButtonViewController, 0);
  objc_storeStrong((id *)&self->_smartRotateButtonViewController, 0);
  objc_storeStrong((id *)&self->_backgroundViewController, 0);
  objc_storeStrong((id *)&self->_rootListModel, 0);
  objc_storeStrong((id *)&self->_stackIconView, 0);
  objc_storeStrong((id *)&self->_iconListView, 0);
  objc_storeStrong((id *)&self->_widgetSettings, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_iconViewProvider, 0);
  objc_storeStrong((id *)&self->_defaultIconViewDelegate, 0);
  objc_storeStrong((id *)&self->_listLayoutProvider, 0);
  objc_storeStrong((id *)&self->_rootFolderVisualConfiguration, 0);
}

- (void)animationCoordinator
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(aSelector);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = a1;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_1CFEF3000, a3, OS_LOG_TYPE_ERROR, "'%@' forcefully loading view in order to provide a valid animation coordinator. %@ was probably queried outside of a view controller transition animator.", (uint8_t *)&v6, 0x16u);

}

@end
