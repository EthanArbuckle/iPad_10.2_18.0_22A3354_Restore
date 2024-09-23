@implementation SBHWidgetStackViewController

- (unint64_t)userVisibilityStatus
{
  return self->_userVisibilityStatus;
}

- (void)setUserVisibilityStatus:(unint64_t)a3
{
  if (self->_userVisibilityStatus != a3)
  {
    self->_userVisibilityStatus = a3;
    -[SBHWidgetStackViewController _updateVisiblySettledForWidgetViewControllers](self, "_updateVisiblySettledForWidgetViewControllers");
  }
}

- (void)setPauseReasons:(unint64_t)a3
{
  if (self->_pauseReasons != a3)
  {
    self->_pauseReasons = a3;
    -[SBHWidgetStackViewController _updatePauseReasonForWidgetViewControllers](self, "_updatePauseReasonForWidgetViewControllers");
  }
}

- (void)_updateVisiblySettledForWidgetViewControllers
{
  NSObject *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  NSObject *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[8];
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  SBLogWidgets();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CFEF3000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_LAYOUT_STACK_UPDATE_VISIBLY_SETTLED_FOR_WIDGET_VIEW_CONTROLLERS", " isAnimation=YES ", buf, 2u);
  }

  v4 = -[SBHWidgetStackViewController userVisibilityStatus](self, "userVisibilityStatus");
  if (v4 == 3)
  {
    if (-[BSUIScrollView isScrolling](self->_scrollView, "isScrolling"))
      v4 = 2;
    else
      v4 = 3;
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[SBHWidgetStackViewController _effectiveWidgetContainerViewControllers](self, "_effectiveWidgetContainerViewControllers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "setUserVisibilityStatus:", v4);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    }
    while (v8);
  }

  SBLogWidgets();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CFEF3000, v11, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_LAYOUT_STACK_UPDATE_VISIBLY_SETTLED_FOR_WIDGET_VIEW_CONTROLLERS", " isAnimation=YES ", buf, 2u);
  }

}

- (void)_updatePauseReasonForWidgetViewControllers
{
  unint64_t pauseReasons;
  void *v3;
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
  pauseReasons = self->_pauseReasons;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[SBHWidgetStackViewController _effectiveWidgetContainerViewControllers](self, "_effectiveWidgetContainerViewControllers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
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
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setPaused:", pauseReasons != 0);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (BOOL)sbh_isWidgetStackViewController
{
  return 1;
}

- (id)sbh_underlyingAvocadoHostViewControllers
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[SBHWidgetStackViewController widgetViewControllers](self, "widgetViewControllers", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "sbh_underlyingAvocadoHostViewControllers");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "allObjects");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v10);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return v3;
}

- (SBHWidgetStackViewController)initWithIcon:(id)a3 iconListLayoutProvider:(id)a4
{
  id v7;
  id v8;
  SBHWidgetStackViewController *v9;
  SBHWidgetStackViewController *v10;
  void *v11;
  uint64_t v12;
  SBHWidgetSettings *widgetSettings;
  uint64_t v14;
  SBLeafIconDataSource *activeWidget;
  uint64_t v16;
  SBFFluidBehaviorSettings *animationSettings;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  objc_super v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)SBHWidgetStackViewController;
  v9 = -[SBHWidgetStackViewController initWithNibName:bundle:](&v23, sel_initWithNibName_bundle_, 0, 0);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_icon, a3);
    objc_msgSend(v7, "addObserver:", v10);
    +[SBHHomeScreenDomain rootSettings](SBHHomeScreenDomain, "rootSettings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "widgetSettings");
    v12 = objc_claimAutoreleasedReturnValue();
    widgetSettings = v10->_widgetSettings;
    v10->_widgetSettings = (SBHWidgetSettings *)v12;

    -[PTSettings addKeyObserver:](v10->_widgetSettings, "addKeyObserver:", v10);
    v10->_userInteractionEnabled = 1;
    v10->_showStackBorderWhenShowingPageControl = 0;
    v10->_flashPageControlOnNextAppearance = -[SBHWidgetSettings stackFlashesPageControlOnAppearance](v10->_widgetSettings, "stackFlashesPageControlOnAppearance");
    v10->_clipsWidgetsToViewBounds = 1;
    v10->_preferredDirection = 0;
    objc_msgSend(v7, "activeDataSource");
    v14 = objc_claimAutoreleasedReturnValue();
    activeWidget = v10->_activeWidget;
    v10->_activeWidget = (SBLeafIconDataSource *)v14;

    objc_storeStrong((id *)&v10->_listLayoutProvider, a4);
    v10->_imageViewAlignment = 0;
    v10->_presentationMode = 0;
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0DA9E08]), "initWithDefaultValues");
    animationSettings = v10->_animationSettings;
    v10->_animationSettings = (SBFFluidBehaviorSettings *)v16;

    -[SBFFluidBehaviorSettings setDampingRatio:](v10->_animationSettings, "setDampingRatio:", 1.0);
    -[SBFFluidBehaviorSettings setResponse:](v10->_animationSettings, "setResponse:", 0.35);
    v10->_automaticallyUpdatesVisiblySettled = 1;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:selector:name:object:", v10, sel__handleInstalledAppsChanged_, CFSTR("SBInstalledApplicationsDidChangeNotification"), 0);

    -[SBHWidgetStackViewController _setupStateCapture](v10, "_setupStateCapture");
    objc_opt_self();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (id)-[SBHWidgetStackViewController registerForTraitChanges:withAction:](v10, "registerForTraitChanges:withAction:", v20, sel__updateWidgetViewEdgeAntialiasing);

  }
  return v10;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[SBHWidgetStackViewController _teardownStateCapture](self, "_teardownStateCapture");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("SBInstalledApplicationsDidChangeNotification"), 0);

  -[SBHWidgetStackViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:forKeyPath:", self, CFSTR("alpha"));

  -[SBLeafIcon removeObserver:](self->_icon, "removeObserver:", self);
  -[PTSettings removeKeyObserver:](self->_widgetSettings, "removeKeyObserver:", self);
  v5.receiver = self;
  v5.super_class = (Class)SBHWidgetStackViewController;
  -[SBHWidgetStackViewController dealloc](&v5, sel_dealloc);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  UIView *v14;
  UIView *containerView;
  void *v16;
  BSUIScrollView *v17;
  BSUIScrollView *scrollView;
  UIPageControl *v19;
  UIPageControl *pageControl;
  void *v21;
  void *v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)SBHWidgetStackViewController;
  -[SBHWidgetStackViewController loadView](&v23, sel_loadView);
  -[SBHWidgetStackViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAllowsGroupOpacity:", 1);

  -[SBHWidgetStackViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v7, v9, v11, v13);
  containerView = self->_containerView;
  self->_containerView = v14;

  -[UIView setClipsToBounds:](self->_containerView, "setClipsToBounds:", 0);
  -[SBHWidgetStackViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addSubview:", self->_containerView);

  v17 = (BSUIScrollView *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01950]), "initWithFrame:", v7, v9, v11, v13);
  scrollView = self->_scrollView;
  self->_scrollView = v17;

  -[BSUIScrollView setDelegate:](self->_scrollView, "setDelegate:", self);
  -[BSUIScrollView setPagingEnabled:](self->_scrollView, "setPagingEnabled:", 1);
  -[BSUIScrollView setBounces:](self->_scrollView, "setBounces:", 1);
  -[BSUIScrollView setAlwaysBounceVertical:](self->_scrollView, "setAlwaysBounceVertical:", 1);
  -[BSUIScrollView setShowsVerticalScrollIndicator:](self->_scrollView, "setShowsVerticalScrollIndicator:", 0);
  -[BSUIScrollView setScrollsToTop:](self->_scrollView, "setScrollsToTop:", 0);
  -[BSUIScrollView setClipsToBounds:](self->_scrollView, "setClipsToBounds:", 0);
  -[BSUIScrollView _setAutoScrollEnabled:](self->_scrollView, "_setAutoScrollEnabled:", 0);
  -[BSUIScrollView _setForwardsTouchesUpResponderChain:](self->_scrollView, "_setForwardsTouchesUpResponderChain:", 1);
  -[BSUIScrollView setContentInsetAdjustmentBehavior:](self->_scrollView, "setContentInsetAdjustmentBehavior:", 2);
  -[UIView addSubview:](self->_containerView, "addSubview:", self->_scrollView);
  v19 = (UIPageControl *)objc_alloc_init(MEMORY[0x1E0DC3A88]);
  pageControl = self->_pageControl;
  self->_pageControl = v19;

  -[UIPageControl setAlpha:](self->_pageControl, "setAlpha:", 0.0);
  -[UIPageControl setDirection:](self->_pageControl, "setDirection:", 3);
  -[UIPageControl setHidesForSinglePage:](self->_pageControl, "setHidesForSinglePage:", 1);
  -[UIPageControl _setPreferredNumberOfVisibleIndicators:](self->_pageControl, "_setPreferredNumberOfVisibleIndicators:", -[SBHWidgetSettings maximumWidgetsInAStack](self->_widgetSettings, "maximumWidgetsInAStack"));
  -[SBHWidgetStackViewController view](self, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addSubview:", self->_pageControl);

  -[SBHWidgetStackViewController view](self, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addObserver:forKeyPath:options:context:", self, CFSTR("alpha"), 0, 0);

  -[SBHWidgetStackViewController _updateAccessibilityValue](self, "_updateAccessibilityValue");
}

- (void)viewWillLayoutSubviews
{
  uint64_t v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBHWidgetStackViewController;
  -[SBHWidgetStackViewController viewWillLayoutSubviews](&v4, sel_viewWillLayoutSubviews);
  if (-[BSUIScrollView isScrolling](self->_scrollView, "isScrolling"))
    v3 = 3;
  else
    v3 = 4;
  -[SBHWidgetStackViewController _layoutWithAnimationUpdateMode:](self, "_layoutWithAnimationUpdateMode:", v3);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  uint8_t v18[128];
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  SBHWidgetStackViewController *v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v3 = a3;
  v25 = *MEMORY[0x1E0C80C00];
  SBLogWidgets();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v20 = v7;
    v21 = 2048;
    v22 = self;
    v23 = 2080;
    v24 = "-[SBHWidgetStackViewController viewWillAppear:]";
    _os_log_impl(&dword_1CFEF3000, v5, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> %s", buf, 0x20u);

  }
  v17.receiver = self;
  v17.super_class = (Class)SBHWidgetStackViewController;
  -[SBHWidgetStackViewController viewWillAppear:](&v17, sel_viewWillAppear_, v3);
  -[SBHWidgetStackViewController _layoutWithAnimationUpdateMode:](self, "_layoutWithAnimationUpdateMode:", 1);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[SBHWidgetStackViewController childViewControllers](self, "childViewControllers", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        -[SBHWidgetStackViewController bs_beginAppearanceTransitionForChildViewController:toVisible:animated:](self, "bs_beginAppearanceTransitionForChildViewController:toVisible:animated:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12++), 1, v3);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v10);
  }

  if (-[SBHWidgetStackViewController automaticallyUpdatesVisiblySettled](self, "automaticallyUpdatesVisiblySettled"))
    -[SBHWidgetStackViewController setUserVisibilityStatus:](self, "setUserVisibilityStatus:", 2);
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  uint8_t v18[128];
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  SBHWidgetStackViewController *v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v3 = a3;
  v25 = *MEMORY[0x1E0C80C00];
  SBLogWidgets();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v20 = v7;
    v21 = 2048;
    v22 = self;
    v23 = 2080;
    v24 = "-[SBHWidgetStackViewController viewDidAppear:]";
    _os_log_impl(&dword_1CFEF3000, v5, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> %s", buf, 0x20u);

  }
  v17.receiver = self;
  v17.super_class = (Class)SBHWidgetStackViewController;
  -[SBHWidgetStackViewController viewDidAppear:](&v17, sel_viewDidAppear_, v3);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[SBHWidgetStackViewController childViewControllers](self, "childViewControllers", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        -[SBHWidgetStackViewController bs_endAppearanceTransitionForChildViewController:toVisible:](self, "bs_endAppearanceTransitionForChildViewController:toVisible:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), 1);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v10);
  }

  if (-[SBHWidgetStackViewController automaticallyUpdatesVisiblySettled](self, "automaticallyUpdatesVisiblySettled"))
    -[SBHWidgetStackViewController setUserVisibilityStatus:](self, "setUserVisibilityStatus:", 3);
  if (self->_flashPageControlOnNextAppearance)
  {
    -[SBHWidgetStackViewController _flashPageControlAnimated:](self, "_flashPageControlAnimated:", 1);
    self->_flashPageControlOnNextAppearance = 0;
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  uint8_t v18[128];
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  SBHWidgetStackViewController *v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v3 = a3;
  v25 = *MEMORY[0x1E0C80C00];
  SBLogWidgets();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v20 = v7;
    v21 = 2048;
    v22 = self;
    v23 = 2080;
    v24 = "-[SBHWidgetStackViewController viewWillDisappear:]";
    _os_log_impl(&dword_1CFEF3000, v5, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> %s", buf, 0x20u);

  }
  v17.receiver = self;
  v17.super_class = (Class)SBHWidgetStackViewController;
  -[SBHWidgetStackViewController viewWillDisappear:](&v17, sel_viewWillDisappear_, v3);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[SBHWidgetStackViewController childViewControllers](self, "childViewControllers", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        -[SBHWidgetStackViewController bs_beginAppearanceTransitionForChildViewController:toVisible:animated:](self, "bs_beginAppearanceTransitionForChildViewController:toVisible:animated:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12++), 0, v3);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v10);
  }

  if (-[SBHWidgetStackViewController automaticallyUpdatesVisiblySettled](self, "automaticallyUpdatesVisiblySettled"))
    -[SBHWidgetStackViewController setUserVisibilityStatus:](self, "setUserVisibilityStatus:", 2);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  UIView *backgroundView;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  uint8_t v19[128];
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  SBHWidgetStackViewController *v23;
  __int16 v24;
  const char *v25;
  uint64_t v26;

  v3 = a3;
  v26 = *MEMORY[0x1E0C80C00];
  SBLogWidgets();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v21 = v7;
    v22 = 2048;
    v23 = self;
    v24 = 2080;
    v25 = "-[SBHWidgetStackViewController viewDidDisappear:]";
    _os_log_impl(&dword_1CFEF3000, v5, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> %s", buf, 0x20u);

  }
  v18.receiver = self;
  v18.super_class = (Class)SBHWidgetStackViewController;
  -[SBHWidgetStackViewController viewDidDisappear:](&v18, sel_viewDidDisappear_, v3);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[SBHWidgetStackViewController childViewControllers](self, "childViewControllers", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
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
        -[SBHWidgetStackViewController bs_endAppearanceTransitionForChildViewController:toVisible:](self, "bs_endAppearanceTransitionForChildViewController:toVisible:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v12++), 0);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v10);
  }

  if (-[SBHWidgetStackViewController automaticallyUpdatesVisiblySettled](self, "automaticallyUpdatesVisiblySettled"))
    -[SBHWidgetStackViewController setUserVisibilityStatus:](self, "setUserVisibilityStatus:", 1);
  -[SBHWidgetStackViewController _layoutWithAnimationUpdateMode:](self, "_layoutWithAnimationUpdateMode:", 1);
  self->_flashPageControlOnNextAppearance = -[SBHWidgetSettings stackFlashesPageControlOnAppearance](self->_widgetSettings, "stackFlashesPageControlOnAppearance");
  -[SBHWidgetStackViewController _teardownBackgroundView:contactDelegate:](self, "_teardownBackgroundView:contactDelegate:", self->_backgroundView, 1);
  backgroundView = self->_backgroundView;
  self->_backgroundView = 0;

}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  objc_super v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  SBHWidgetStackViewController *v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v4 = a4;
  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  SBLogWidgets();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v12 = v9;
    v13 = 2048;
    v14 = self;
    v15 = 2080;
    v16 = "-[SBHWidgetStackViewController viewDidMoveToWindow:shouldAppearOrDisappear:]";
    _os_log_impl(&dword_1CFEF3000, v7, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> %s", buf, 0x20u);

  }
  v10.receiver = self;
  v10.super_class = (Class)SBHWidgetStackViewController;
  -[SBHWidgetStackViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v10, sel_viewDidMoveToWindow_shouldAppearOrDisappear_, v6, v4);

}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (void)setForcesEdgeAntialiasing:(BOOL)a3
{
  if (self->_forcesEdgeAntialiasing != a3)
  {
    self->_forcesEdgeAntialiasing = a3;
    -[SBHWidgetStackViewController _updateWidgetViewEdgeAntialiasing](self, "_updateWidgetViewEdgeAntialiasing");
  }
}

- (void)setShowsSnapshotWhenDeactivated:(BOOL)a3
{
  if (self->_showsSnapshotWhenDeactivated != a3)
  {
    self->_showsSnapshotWhenDeactivated = a3;
    -[SBHWidgetStackViewController _updateShowsSnapshotWhenDeactivatedForWidgetViewControllers](self, "_updateShowsSnapshotWhenDeactivatedForWidgetViewControllers");
  }
}

- (NSArray)widgetViewControllers
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  -[SBHWidgetStackViewController widgetIcon](self, "widgetIcon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "iconDataSources");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__SBHWidgetStackViewController_widgetViewControllers__block_invoke;
  v7[3] = &unk_1E8D8BFC0;
  v7[4] = self;
  objc_msgSend(v4, "bs_compactMap:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

id __53__SBHWidgetStackViewController_widgetViewControllers__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_effectiveWidgetContainerViewControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "widgetViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (UIViewController)currentWidgetViewController
{
  SBLeafIconDataSource *activeWidget;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  activeWidget = self->_activeWidget;
  if (activeWidget)
  {
    -[SBLeafIconDataSource uniqueIdentifier](activeWidget, "uniqueIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHWidgetStackViewController _effectiveWidgetContainerViewControllers](self, "_effectiveWidgetContainerViewControllers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "widgetViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "sbh_isMultiplexingViewController"))
    {
      objc_msgSend(v7, "multiplexedViewController");
      v8 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v8;
    }

  }
  else
  {
    v7 = 0;
  }
  return (UIViewController *)v7;
}

- (void)enumerateWidgetViewControllersUsingBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[SBHWidgetStackViewController _effectiveWidgetContainerViewControllers](self, "_effectiveWidgetContainerViewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __73__SBHWidgetStackViewController_enumerateWidgetViewControllersUsingBlock___block_invoke;
  v7[3] = &unk_1E8D8BFE8;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v7);

}

void __73__SBHWidgetStackViewController_enumerateWidgetViewControllersUsingBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;
  id v7;

  objc_msgSend(a3, "widgetViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "sbh_isMultiplexingViewController"))
  {
    objc_msgSend(v6, "multiplexedViewController");
    v4 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v4;
  }
  else
  {
    v5 = v6;
  }
  v7 = v5;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (UIColor)backgroundTintingColor
{
  return (UIColor *)-[SBHWidgetStackViewController _backgroundColorForWidgetWithDistanceFromRestingContentOffset:](self, "_backgroundColorForWidgetWithDistanceFromRestingContentOffset:", 0.0);
}

- (BOOL)isWidgetHitTestingDisabled
{
  return self->_editing
      || self->_showingContextMenu
      || !self->_userInteractionEnabled
      || -[BSUIScrollView isScrolling](self->_scrollView, "isScrolling")
      || self->_widgetScaleAnimationCount
      || -[SBHWidgetSettings isHitTestingDisabled](self->_widgetSettings, "isHitTestingDisabled");
}

- (void)flashPageControlAnimated:(BOOL)a3 withTimeInterval:(double)a4
{
  -[SBHWidgetStackViewController _setPageControlHidden:animated:](self, "_setPageControlHidden:animated:", 0, a3);
  -[SBHWidgetStackViewController _restartPageControlTimerWithTimeInterval:](self, "_restartPageControlTimerWithTimeInterval:", a4);
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

- (void)leafIcon:(id)a3 didAddIconDataSource:(id)a4
{
  id v5;

  -[SBHWidgetStackViewController _updatePageControlWithAnimationUpdateMode:](self, "_updatePageControlWithAnimationUpdateMode:", 3, a4);
  -[SBHWidgetStackViewController _updateAccessibilityValue](self, "_updateAccessibilityValue");
  -[SBHWidgetStackViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "widgetStackViewControllerWidgetCountDidChange:", self);

}

- (void)leafIcon:(id)a3 didRemoveIconDataSource:(id)a4
{
  id v5;

  -[SBHWidgetStackViewController _updatePageControlWithAnimationUpdateMode:](self, "_updatePageControlWithAnimationUpdateMode:", 3, a4);
  -[SBHWidgetStackViewController _updateAccessibilityValue](self, "_updateAccessibilityValue");
  -[SBHWidgetStackViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "widgetStackViewControllerWidgetCountDidChange:", self);

}

- (void)leafIcon:(id)a3 didChangeActiveDataSource:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  id v11;
  void *v12;
  char v13;
  SBLeafIconDataSource *v14;
  SBLeafIconDataSource *activeWidget;
  UIPageControl *pageControl;
  void *v17;
  SBLeafIconDataSource *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  SBHWidgetStackViewController *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  SBLogWidgets();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138544130;
    v21 = v10;
    v22 = 2048;
    v23 = self;
    v24 = 2114;
    v25 = v6;
    v26 = 2114;
    v27 = v7;
    _os_log_impl(&dword_1CFEF3000, v8, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> leafIcon:%{public}@ didChangeActiveDataSource:%{public}@", (uint8_t *)&v20, 0x2Au);

  }
  if (objc_msgSend(v6, "isWidgetIcon"))
  {
    v11 = v6;
    objc_msgSend(v11, "iconDataSources");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "containsObject:", self->_activeWidget);
    if (self->_pauseReasons)
    {
      if ((v13 & 1) == 0)
        -[SBHWidgetStackViewController _removeWidget:animated:](self, "_removeWidget:animated:", self->_activeWidget, 0);
      objc_msgSend(v11, "activeDataSource");
      v14 = (SBLeafIconDataSource *)objc_claimAutoreleasedReturnValue();
      activeWidget = self->_activeWidget;
      self->_activeWidget = v14;

      pageControl = self->_pageControl;
      objc_msgSend(v11, "iconDataSources");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPageControl setCurrentPage:](pageControl, "setCurrentPage:", objc_msgSend(v17, "indexOfObject:", self->_activeWidget));
    }
    else
    {
      if ((v13 & 1) != 0)
      {
LABEL_11:
        -[SBHWidgetStackViewController updateImageAnimated:](self, "updateImageAnimated:", 1);
        -[SBHWidgetStackViewController _updateAccessibilityValue](self, "_updateAccessibilityValue");

        goto LABEL_12;
      }
      -[SBHWidgetStackViewController _removeWidget:animated:](self, "_removeWidget:animated:", self->_activeWidget, 1);
      objc_msgSend(v11, "activeDataSource");
      v18 = (SBLeafIconDataSource *)objc_claimAutoreleasedReturnValue();
      v17 = self->_activeWidget;
      self->_activeWidget = v18;
    }

    -[SBHWidgetStackViewController view](self, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setNeedsLayout");

    goto LABEL_11;
  }
LABEL_12:

}

- (SBLeafIconDataSource)visiblyActiveDataSource
{
  return self->_activeWidget;
}

- (void)setIconImageInfo:(SBIconImageInfo *)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  SBIconImageInfo *p_iconImageInfo;
  void *v13;
  void *v14;
  id v15;

  v7 = v6;
  v8 = v5;
  v9 = v4;
  v10 = v3;
  p_iconImageInfo = &self->_iconImageInfo;
  if (!SBIconImageInfoEqualToIconImageInfo(self->_iconImageInfo.size.width, self->_iconImageInfo.size.height, self->_iconImageInfo.scale, self->_iconImageInfo.continuousCornerRadius, v3, v4, v5, v6))
  {
    p_iconImageInfo->size.width = v10;
    p_iconImageInfo->size.height = v9;
    p_iconImageInfo->scale = v8;
    p_iconImageInfo->continuousCornerRadius = v7;
    -[SBHWidgetStackViewController view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "layer");
    v15 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "setCornerRadius:", v7);
    objc_msgSend(v15, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);
    -[SBHWidgetStackViewController view](self, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setNeedsLayout");

  }
}

- (void)setEditing:(BOOL)a3
{
  -[SBHWidgetStackViewController setEditing:animated:](self, "setEditing:animated:", a3, 0);
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v6;

  if (self->_editing != a3)
  {
    v4 = a4;
    self->_editing = a3;
    -[SBHWidgetStackViewController _flashPageControlAnimated:](self, "_flashPageControlAnimated:", a4);
    if (v4)
      v6 = 3;
    else
      v6 = 2;
    -[SBHWidgetStackViewController _layoutWithAnimationUpdateMode:](self, "_layoutWithAnimationUpdateMode:", v6);
  }
}

- (void)setListLayoutProvider:(id)a3
{
  SBIconListLayoutProvider *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id *p_widgetContainerViewControllersToRemove;
  uint64_t v11;
  id v12;
  void (**v13)(_QWORD);
  uint64_t v14;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  void *v24;
  SBHWidgetStackViewController *v25;
  SBIconListLayoutProvider *v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  SBHWidgetStackViewController *v30;
  __int16 v31;
  _BOOL4 v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = (SBIconListLayoutProvider *)a3;
  if (self->_listLayoutProvider != v4)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[SBLeafIconDataSource uniqueIdentifier](self->_activeWidget, "uniqueIdentifier");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = 0;
      }
      -[SBHWidgetStackViewController _effectiveWidgetContainerViewControllers](self, "_effectiveWidgetContainerViewControllers");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKey:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      -[SBHWidgetStackViewController _widgetContainerViewControllersForListLayoutProvider:](self, "_widgetContainerViewControllersForListLayoutProvider:", v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "bs_setSafeObject:forKey:", v8, v6);

    }
    p_widgetContainerViewControllersToRemove = (id *)&self->_widgetContainerViewControllersToRemove;
    if (!self->_widgetContainerViewControllersToRemove)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = *p_widgetContainerViewControllersToRemove;
      *p_widgetContainerViewControllersToRemove = (id)v11;

    }
    v21 = MEMORY[0x1E0C809B0];
    v22 = 3221225472;
    v23 = __54__SBHWidgetStackViewController_setListLayoutProvider___block_invoke;
    v24 = &unk_1E8D84EF0;
    v25 = self;
    v26 = v4;
    v13 = (void (**)(_QWORD))_Block_copy(&v21);
    v14 = objc_msgSend(*p_widgetContainerViewControllersToRemove, "count", v21, v22, v23, v24, v25);
    SBLogWidgets();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v28 = v17;
      v29 = 2048;
      v30 = self;
      v31 = 1026;
      v32 = v14 != 0;
      _os_log_impl(&dword_1CFEF3000, v15, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p>; received new iconListLayoutProvider. canReuseViewControllerFromLastFullyRenderedLayoutProvider: %{public}d",
        buf,
        0x1Cu);

    }
    -[SBHWidgetStackViewController _effectiveWidgetContainerViewControllers](self, "_effectiveWidgetContainerViewControllers");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v13[2](v13);
      objc_msgSend(*p_widgetContainerViewControllersToRemove, "allValues");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBHWidgetStackViewController resizeSnapshotsForWidgetContainerViewControllers:isFakeWidget:reason:](self, "resizeSnapshotsForWidgetContainerViewControllers:isFakeWidget:reason:", v19, isKindOfClass & 1, CFSTR("List Layout Provider Change Animation"));

      -[SBHWidgetStackViewController _removeWidgetContainerViewControllers:animated:](self, "_removeWidgetContainerViewControllers:animated:", v18, 0);
      v20 = *p_widgetContainerViewControllersToRemove;
      *p_widgetContainerViewControllersToRemove = 0;
    }
    else
    {
      if ((isKindOfClass & 1) == 0)
        objc_storeStrong((id *)&self->_widgetContainerViewControllersToRemove, v18);
      v13[2](v13);
      objc_msgSend(v18, "allValues");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBHWidgetStackViewController resizeSnapshotsForWidgetContainerViewControllers:isFakeWidget:reason:](self, "resizeSnapshotsForWidgetContainerViewControllers:isFakeWidget:reason:", v20, isKindOfClass & 1, CFSTR("List Layout Provider Change Animation"));
    }

  }
}

void __54__SBHWidgetStackViewController_setListLayoutProvider___block_invoke(uint64_t a1)
{
  NSObject *v2;
  objc_class *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  SBLogWidgets();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v7 = 138543874;
    v8 = v4;
    v9 = 2048;
    v10 = v5;
    v11 = 2114;
    v12 = v6;
    _os_log_impl(&dword_1CFEF3000, v2, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> iconListLayoutProvider changed to <%{public}@>", (uint8_t *)&v7, 0x20u);

  }
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1208), *(id *)(a1 + 40));
}

- (void)resizeSnapshotsForWidgetContainerViewControllers:(id)a3 isFakeWidget:(BOOL)a4 reason:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  BOOL v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  SBHWidgetStackViewController *v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a3;
  SBLogWidgets();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v18 = v12;
    v19 = 2048;
    v20 = self;
    v21 = 2080;
    v22 = "-[SBHWidgetStackViewController resizeSnapshotsForWidgetContainerViewControllers:isFakeWidget:reason:]";
    _os_log_impl(&dword_1CFEF3000, v10, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> %s; acquiring _imageUpdatesDisabledForNewListLayoutProviderAssertion",
      buf,
      0x20u);

  }
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __101__SBHWidgetStackViewController_resizeSnapshotsForWidgetContainerViewControllers_isFakeWidget_reason___block_invoke;
  v14[3] = &unk_1E8D8C010;
  v16 = a4;
  v14[4] = self;
  v15 = v8;
  v13 = v8;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v14);

}

void __101__SBHWidgetStackViewController_resizeSnapshotsForWidgetContainerViewControllers_isFakeWidget_reason___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;

  objc_msgSend(a2, "buildSnapshotResizeCoordinatorForSnapshotSize:expectNewViewController:", *(_BYTE *)(a1 + 48) == 0, *(double *)(*(_QWORD *)(a1 + 32) + 1296), *(double *)(*(_QWORD *)(a1 + 32) + 1304));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "disableImageUpdatesForReason:", *(_QWORD *)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v3, "setUpResize");
    v5 = (void *)MEMORY[0x1E0DC3F10];
    v6 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __101__SBHWidgetStackViewController_resizeSnapshotsForWidgetContainerViewControllers_isFakeWidget_reason___block_invoke_2;
    v11[3] = &unk_1E8D84EF0;
    v11[4] = *(_QWORD *)(a1 + 32);
    v12 = v3;
    v8[0] = v6;
    v8[1] = 3221225472;
    v8[2] = __101__SBHWidgetStackViewController_resizeSnapshotsForWidgetContainerViewControllers_isFakeWidget_reason___block_invoke_3;
    v8[3] = &unk_1E8D87728;
    v8[4] = *(_QWORD *)(a1 + 32);
    v9 = v4;
    v10 = v12;
    v7 = v4;
    objc_msgSend(v5, "animateWithDuration:animations:completion:", v11, v8, 0.3);

  }
}

uint64_t __101__SBHWidgetStackViewController_resizeSnapshotsForWidgetContainerViewControllers_isFakeWidget_reason___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_incrementWidgetSnapshotAnimationCount");
  return objc_msgSend(*(id *)(a1 + 40), "resize");
}

uint64_t __101__SBHWidgetStackViewController_resizeSnapshotsForWidgetContainerViewControllers_isFakeWidget_reason___block_invoke_3(id *a1)
{
  uint64_t v2;

  objc_msgSend(a1[4], "_decrementWidgetSnapshotAnimationCount");
  objc_msgSend(a1[5], "invalidate");
  v2 = *((_QWORD *)a1[4] + 156);
  if ((objc_opt_respondsToSelector() & 1) != 0 && !v2)
    objc_msgSend(a1[6], "finishResize");
  return objc_msgSend(a1[4], "_layoutWithAnimationUpdateMode:", 1);
}

- (void)setShowingContextMenu:(BOOL)a3
{
  _BOOL8 v3;
  BSInvalidatable *v5;
  BSInvalidatable *imageUpdatesDisabledForContextMenuAssertion;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  SBHWidgetStackViewController *v17;
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (self->_showingContextMenu != a3)
  {
    v3 = a3;
    self->_showingContextMenu = a3;
    if (a3)
    {
      if (self->_imageUpdatesDisabledForContextMenuAssertion)
      {
LABEL_10:
        -[SBHWidgetStackViewController _flashPageControlAnimated:](self, "_flashPageControlAnimated:", 1);
        -[SBHWidgetStackViewController _layoutWithAnimationUpdateMode:](self, "_layoutWithAnimationUpdateMode:", 3);
        -[SBHWidgetStackViewController _widgetContextMenuController](self, "_widgetContextMenuController");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setShowingContextMenu:", v3);

        return;
      }
      -[SBHWidgetStackViewController _disableImageUpdatesForReason:animateChangesUponInvalidation:](self, "_disableImageUpdatesForReason:animateChangesUponInvalidation:", CFSTR("SBHWidgetStackImageUpdatesDisabledForContextMenuReason"), 1);
      v5 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
      imageUpdatesDisabledForContextMenuAssertion = self->_imageUpdatesDisabledForContextMenuAssertion;
      self->_imageUpdatesDisabledForContextMenuAssertion = v5;

      SBLogWidgets();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = (objc_class *)objc_opt_class();
        NSStringFromClass(v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138543874;
        v15 = v9;
        v16 = 2048;
        v17 = self;
        v18 = 2080;
        v19 = "-[SBHWidgetStackViewController setShowingContextMenu:]";
        _os_log_impl(&dword_1CFEF3000, v7, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> %s; acquiring _imageUpdatesDisabledForContextMenuAssertion",
          (uint8_t *)&v14,
          0x20u);

      }
    }
    else
    {
      SBLogWidgets();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = (objc_class *)objc_opt_class();
        NSStringFromClass(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138543874;
        v15 = v12;
        v16 = 2048;
        v17 = self;
        v18 = 2080;
        v19 = "-[SBHWidgetStackViewController setShowingContextMenu:]";
        _os_log_impl(&dword_1CFEF3000, v10, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> %s; invalidating _imageUpdatesDisabledForContextMenuAssertion",
          (uint8_t *)&v14,
          0x20u);

      }
      -[BSInvalidatable invalidate](self->_imageUpdatesDisabledForContextMenuAssertion, "invalidate");
      v7 = self->_imageUpdatesDisabledForContextMenuAssertion;
      self->_imageUpdatesDisabledForContextMenuAssertion = 0;
    }

    goto LABEL_10;
  }
}

- (UIEdgeInsets)minimumPreferredEdgeInsetsForContextMenu
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  UIEdgeInsets result;

  if (-[SBWidgetIcon isWidgetStackIcon](self->_icon, "isWidgetStackIcon")
    || self->_alwaysShowsAsStack
    || -[SBHWidgetSettings stackAlwaysShowsPageControl](self->_widgetSettings, "stackAlwaysShowsPageControl"))
  {
    -[UIPageControl frame](self->_pageControl, "frame");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    -[SBHWidgetStackViewController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bounds");
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;

    v24.origin.x = v4;
    v24.origin.y = v6;
    v24.size.width = v8;
    v24.size.height = v10;
    if (CGRectGetMinX(v24) >= 0.0)
    {
      v26.origin.x = v4;
      v26.origin.y = v6;
      v26.size.width = v8;
      v26.size.height = v10;
      CGRectGetMaxX(v26);
      v27.origin.x = v13;
      v27.origin.y = v15;
      v27.size.width = v17;
      v27.size.height = v19;
      CGRectGetWidth(v27);
    }
    else
    {
      v25.origin.x = v4;
      v25.origin.y = v6;
      v25.size.width = v8;
      v25.size.height = v10;
      CGRectGetMinX(v25);
    }
    UIEdgeInsetsMakeWithEdges();
  }
  else
  {
    v20 = *MEMORY[0x1E0DC49E8];
    v21 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v22 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v23 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  }
  result.right = v23;
  result.bottom = v22;
  result.left = v21;
  result.top = v20;
  return result;
}

- (void)willShowContextMenuAtLocation:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  char v7;
  id v8;

  y = a3.y;
  x = a3.x;
  -[SBHWidgetStackViewController _widgetContextMenuController](self, "_widgetContextMenuController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[SBHWidgetStackViewController _widgetContextMenuController](self, "_widgetContextMenuController");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "willShowContextMenuAtLocation:", x, y);

  }
}

- (void)setOverlapping:(BOOL)a3
{
  if (self->_overlapping != a3)
  {
    self->_overlapping = a3;
    -[SBHWidgetStackViewController _layoutWithAnimationUpdateMode:](self, "_layoutWithAnimationUpdateMode:", 3);
  }
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  if (self->_userInteractionEnabled != a3)
  {
    self->_userInteractionEnabled = a3;
    -[SBHWidgetStackViewController _updateWidgetViewHitTesting](self, "_updateWidgetViewHitTesting");
  }
}

- (void)evaluateBackground
{
  -[SBHWidgetStackViewController _updateWidgetViewClippingAndBackgroundView](self, "_updateWidgetViewClippingAndBackgroundView");
  -[SBHWidgetStackViewController _updateWidgetViewHitTesting](self, "_updateWidgetViewHitTesting");
  -[SBHWidgetStackViewController _configureBackgroundViewIfNecessary](self, "_configureBackgroundViewIfNecessary");
  -[SBHWidgetStackViewController _updateWidgetViewStyleConfiguration](self, "_updateWidgetViewStyleConfiguration");
}

- (BOOL)wantsCaptureOnlyBackgroundView
{
  return -[SBWidgetIcon isWidgetStackIcon](self->_icon, "isWidgetStackIcon")
      || -[SBHWidgetStackViewController _shouldDrawSystemBackgroundMaterialForWidget:](self, "_shouldDrawSystemBackgroundMaterialForWidget:", self->_activeWidget);
}

- (void)setBackgroundViewProvider:(id)a3
{
  void *v4;
  id backgroundViewProvider;
  UIView *backgroundView;

  if (self->_backgroundViewProvider != a3)
  {
    v4 = (void *)objc_msgSend(a3, "copy");
    backgroundViewProvider = self->_backgroundViewProvider;
    self->_backgroundViewProvider = v4;

    backgroundView = self->_backgroundView;
    if (backgroundView)
      -[SBHWidgetStackViewController _teardownBackgroundView:contactDelegate:](self, "_teardownBackgroundView:contactDelegate:", backgroundView, 1);
    -[SBHWidgetStackViewController _createBackgroundViewIfNecessary:](self, "_createBackgroundViewIfNecessary:", 1);
  }
}

- (void)setBackgroundViewConfigurator:(id)a3
{
  void *v4;
  id backgroundViewConfigurator;
  void *v6;

  if (self->_backgroundViewConfigurator != a3)
  {
    v4 = (void *)objc_msgSend(a3, "copy");
    backgroundViewConfigurator = self->_backgroundViewConfigurator;
    self->_backgroundViewConfigurator = v4;

    if (!self->_backgroundViewConfigurator)
    {
      v6 = _Block_copy(self->_backgroundViewProvider);
      -[SBHWidgetStackViewController setBackgroundViewProvider:](self, "setBackgroundViewProvider:", 0);
      -[SBHWidgetStackViewController setBackgroundViewProvider:](self, "setBackgroundViewProvider:", v6);

    }
    -[SBHWidgetStackViewController _configureBackgroundViewIfNecessary](self, "_configureBackgroundViewIfNecessary");
  }
}

- (void)setBrightness:(double)a3
{
  id v5;
  UIView *v6;
  UIView *dimmingView;
  UIView *v8;
  void *v9;
  UIView *v10;
  void *v11;
  double v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  double v17;

  if (self->_brightness != a3)
  {
    self->_brightness = a3;
    if (a3 < 1.0 && !self->_dimmingView)
    {
      v5 = objc_alloc(MEMORY[0x1E0DC3F10]);
      -[UIView bounds](self->_containerView, "bounds");
      v6 = (UIView *)objc_msgSend(v5, "initWithFrame:");
      dimmingView = self->_dimmingView;
      self->_dimmingView = v6;

      -[UIView setAutoresizingMask:](self->_dimmingView, "setAutoresizingMask:", 18);
      v8 = self->_dimmingView;
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](v8, "setBackgroundColor:", v9);

      v10 = self->_dimmingView;
      -[SBHWidgetStackViewController continuousCornerRadius](self, "continuousCornerRadius");
      -[UIView _setContinuousCornerRadius:](v10, "_setContinuousCornerRadius:");
      -[UIView addSubview:](self->_containerView, "addSubview:", self->_dimmingView);
    }
    -[SBHWidgetStackViewController icon](self, "icon");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (BSFloatIsOne())
      v12 = 0.3;
    else
      v12 = 0.0;
    v13 = (void *)MEMORY[0x1E0DC3F10];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __46__SBHWidgetStackViewController_setBrightness___block_invoke;
    v15[3] = &unk_1E8D865D8;
    v15[4] = self;
    v16 = v11;
    v17 = a3;
    v14 = v11;
    objc_msgSend(v13, "animateWithDuration:animations:", v15, v12);

  }
}

void __46__SBHWidgetStackViewController_setBrightness___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  char v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "widgetSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 0.0;
  if ((objc_msgSend(v2, "isHitTestingDisabled") & 1) != 0)
    goto LABEL_12;
  v4 = objc_msgSend(*(id *)(a1 + 40), "isLaunchEnabled");

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "activeWidget");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uniqueIdentifier");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "_effectiveWidgetContainerViewControllers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v7, "containsInteractiveControls") & 1) != 0)
    {
LABEL_11:

LABEL_12:
      goto LABEL_13;
    }
    objc_msgSend(*(id *)(a1 + 40), "gridSizeClass");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v8 != CFSTR("SBHIconGridSizeClassSmall"))
    {
      objc_msgSend(*(id *)(a1 + 40), "gridSizeClass");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v9, "isEqualToString:", CFSTR("SBHIconGridSizeClassSmall")) & 1) == 0
        && (objc_msgSend(*(id *)(a1 + 32), "isWidgetHitTestingDisabled") & 1) == 0
        && !objc_msgSend(*(id *)(a1 + 32), "alwaysShowsAsStack"))
      {
        v10 = objc_msgSend(*(id *)(a1 + 32), "highlightsAtAnySize");

        if ((v10 & 1) == 0)
          goto LABEL_11;
        goto LABEL_10;
      }

    }
LABEL_10:
    v3 = (1.0 - *(double *)(a1 + 48)) * 0.5;
    goto LABEL_11;
  }
LABEL_13:
  objc_msgSend(*(id *)(a1 + 32), "dimmingView");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAlpha:", v3);

}

- (void)setPresentationMode:(unint64_t)a3
{
  if (self->_presentationMode != a3)
  {
    self->_presentationMode = a3;
    -[SBHWidgetStackViewController _updatePresentationModeForWidgetViewControllers](self, "_updatePresentationModeForWidgetViewControllers");
  }
}

- (void)setLegibilitySettings:(id)a3
{
  UIPageControl *pageControl;
  void *v6;
  UIPageControl *v7;
  void *v8;
  id v9;

  v9 = a3;
  if ((-[_UILegibilitySettings isEqual:](self->_legibilitySettings, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    pageControl = self->_pageControl;
    objc_msgSend(v9, "primaryColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPageControl setCurrentPageIndicatorTintColor:](pageControl, "setCurrentPageIndicatorTintColor:", v6);

    v7 = self->_pageControl;
    objc_msgSend(v9, "secondaryColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPageControl setPageIndicatorTintColor:](v7, "setPageIndicatorTintColor:", v8);

  }
}

- (void)setImageViewAlignment:(unint64_t)a3
{
  void *v4;
  id v5;

  if (self->_imageViewAlignment != a3)
  {
    self->_imageViewAlignment = a3;
    -[SBHWidgetStackViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNeedsLayout");

    -[SBHWidgetStackViewController view](self, "view");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layoutIfNeeded");

  }
}

- (void)setApproximateLayoutPosition:(SBIconApproximateLayoutPosition)a3
{
  unint64_t vertical;
  unint64_t horizontal;
  SBIconApproximateLayoutPosition *p_approximateLayoutPosition;

  vertical = a3.vertical;
  horizontal = a3.horizontal;
  p_approximateLayoutPosition = &self->_approximateLayoutPosition;
  if (!SBIconApproximateLayoutPositionEqualToApproximateLayoutPosition(self->_approximateLayoutPosition.horizontal, self->_approximateLayoutPosition.vertical, a3.horizontal, a3.vertical))
  {
    p_approximateLayoutPosition->horizontal = horizontal;
    p_approximateLayoutPosition->vertical = vertical;
    -[SBHWidgetStackViewController _updateApproximateLayoutPositionForWidgetViewControllers](self, "_updateApproximateLayoutPositionForWidgetViewControllers");
  }
}

- (NSArray)applicationShortcutItems
{
  void *v2;
  void *v3;

  -[SBHWidgetStackViewController _widgetContextMenuController](self, "_widgetContextMenuController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "applicationShortcutItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)didSelectApplicationShortcutItem:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBHWidgetStackViewController _widgetContextMenuController](self, "_widgetContextMenuController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didSelectApplicationShortcutItem:", v4);

}

- (id)_widgetContextMenuController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[SBHWidgetStackViewController _effectiveWidgetContainerViewControllers](self, "_effectiveWidgetContainerViewControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBLeafIconDataSource uniqueIdentifier](self->_activeWidget, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "widgetContextMenuController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)addCustomImageViewControllerObserver:(id)a3
{
  id v4;
  NSHashTable *customImageViewObservers;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  customImageViewObservers = self->_customImageViewObservers;
  v8 = v4;
  if (!customImageViewObservers)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v7 = self->_customImageViewObservers;
    self->_customImageViewObservers = v6;

    v4 = v8;
    customImageViewObservers = self->_customImageViewObservers;
  }
  -[NSHashTable addObject:](customImageViewObservers, "addObject:", v4);

}

- (void)removeCustomImageViewControllerObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_customImageViewObservers, "removeObject:", a3);
}

- (void)updateImageAnimated:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if ((-[BSUIScrollView isTracking](self->_scrollView, "isTracking") & 1) == 0
    && !-[SBHWidgetStackViewController isOverlapping](self, "isOverlapping"))
  {
    -[SBHWidgetStackViewController _scrollToActiveWidgetAnimated:](self, "_scrollToActiveWidgetAnimated:", v3);
  }
}

- (id)disableImageUpdatesForReason:(id)a3
{
  return -[SBHWidgetStackViewController _disableImageUpdatesForReason:animateChangesUponInvalidation:](self, "_disableImageUpdatesForReason:animateChangesUponInvalidation:", a3, 0);
}

- (id)_disableImageUpdatesForReason:(id)a3 animateChangesUponInvalidation:(BOOL)a4
{
  id v6;
  NSHashTable *v7;
  NSHashTable *imageUpdateDisableAssertions;
  id v9;
  void *v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  SBHWidgetStackViewController *v19;
  id v20;
  BOOL v21;
  id location;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  SBHWidgetStackViewController *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!self->_imageUpdateDisableAssertions)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v7 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    imageUpdateDisableAssertions = self->_imageUpdateDisableAssertions;
    self->_imageUpdateDisableAssertions = v7;

  }
  objc_initWeak(&location, self);
  v9 = objc_alloc(MEMORY[0x1E0D01868]);
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __93__SBHWidgetStackViewController__disableImageUpdatesForReason_animateChangesUponInvalidation___block_invoke;
  v18 = &unk_1E8D8C038;
  objc_copyWeak(&v20, &location);
  v21 = a4;
  v19 = self;
  v10 = (void *)objc_msgSend(v9, "initWithIdentifier:forReason:invalidationBlock:", CFSTR("widgetStack.disableImageUpdates"), v6, &v15);
  SBLogWidgets();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v24 = v13;
    v25 = 2048;
    v26 = self;
    v27 = 2080;
    v28 = "-[SBHWidgetStackViewController _disableImageUpdatesForReason:animateChangesUponInvalidation:]";
    v29 = 2114;
    v30 = v10;
    _os_log_impl(&dword_1CFEF3000, v11, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> %s; acquiring 'widgetStack.disableImageUpdates' assertion %{public}@",
      buf,
      0x2Au);

  }
  -[NSHashTable addObject:](self->_imageUpdateDisableAssertions, "addObject:", v10, v15, v16, v17, v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

  return v10;
}

void __93__SBHWidgetStackViewController__disableImageUpdatesForReason_animateChangesUponInvalidation___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  uint64_t v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "imageUpdateDisableAssertions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObject:", v3);

    objc_msgSend(v5, "updateImageAnimated:", *(unsigned __int8 *)(a1 + 48));
    objc_msgSend(v5, "_updateWidgetViewsWithAnimationUpdateMode:", 2);
    objc_msgSend(v5, "_updateWidgetViewClippingAndBackgroundView");
  }
  SBLogWidgets();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 32);
    v11 = 138544130;
    v12 = v9;
    v13 = 2048;
    v14 = v10;
    v15 = 2080;
    v16 = "-[SBHWidgetStackViewController _disableImageUpdatesForReason:animateChangesUponInvalidation:]_block_invoke";
    v17 = 2114;
    v18 = v3;
    _os_log_impl(&dword_1CFEF3000, v7, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> %s; invalidating 'widgetStack.disableImageUpdates' assertion %{public}@",
      (uint8_t *)&v11,
      0x2Au);

  }
}

- (id)cancelTouchesForCurrentEventInHostedContent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[SBLeafIconDataSource uniqueIdentifier](self->_activeWidget, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHWidgetStackViewController _effectiveWidgetContainerViewControllers](self, "_effectiveWidgetContainerViewControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "cancelTouchesForCurrentEventInHostedContent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (UIView)snapshotView
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[SBHWidgetStackViewController _layoutWithAnimationUpdateMode:](self, "_layoutWithAnimationUpdateMode:", 2);
  -[SBLeafIconDataSource uniqueIdentifier](self->_activeWidget, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHWidgetStackViewController _effectiveWidgetContainerViewControllers](self, "_effectiveWidgetContainerViewControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "snapshotView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackgroundColor:", v7);

  }
  return (UIView *)v6;
}

- (UIView)springLoadingEffectTargetView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[SBLeafIconDataSource uniqueIdentifier](self->_activeWidget, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHWidgetStackViewController _effectiveWidgetContainerViewControllers](self, "_effectiveWidgetContainerViewControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v6;
}

- (BOOL)_scrollToActiveWidgetAnimated:(BOOL)a3
{
  _BOOL4 v3;
  int64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  SBLeafIconDataSource *v26;
  SBLeafIconDataSource *activeWidget;
  BSUIScrollView *scrollView;
  void *v29;
  void *v30;

  v3 = a3;
  if (-[NSHashTable count](self->_imageUpdateDisableAssertions, "count"))
    return 0;
  -[BSUIScrollView contentOffset](self->_scrollView, "contentOffset");
  v5 = -[SBHWidgetStackViewController _newActiveWidgetIndexForContentOffset:](self, "_newActiveWidgetIndexForContentOffset:");
  -[SBLeafIcon iconDataSources](self->_icon, "iconDataSources");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBLeafIcon activeDataSource](self->_icon, "activeDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "indexOfObject:", v7);

  if (v8 == v5)
    return 0;
  self->_showStackBorderWhenShowingPageControl = 1;
  -[SBHWidgetStackViewController _setPageControlHidden:animated:](self, "_setPageControlHidden:animated:", 0, 1);
  if (v3)
  {
    v10 = -[SBLeafIcon iconDataSourceCount](self->_icon, "iconDataSourceCount");
    v11 = v8 - v5;
    if (v8 <= v5)
      v12 = 0;
    else
      v12 = v10;
    if (v8 <= v5)
      v13 = v10;
    else
      v13 = 0;
    v14 = v11 - v12;
    v15 = v13 + v11;
    v16 = -[SBHWidgetStackViewController preferredDirection](self, "preferredDirection");
    if (v8 >= v5)
      v17 = v15;
    else
      v17 = v14;
    if (v16 == 2)
      v18 = v14;
    else
      v18 = v15;
    if (v16)
      v19 = v18;
    else
      v19 = v17;
    -[BSUIScrollView contentOffset](self->_scrollView, "contentOffset");
    v21 = v20;
    v23 = v22;
    -[SBHWidgetStackViewController _pageSize](self, "_pageSize");
    v25 = v24 * round(v23 / v24) + (double)v19 * v24;
    -[BSUIScrollView contentOffset](self->_scrollView, "contentOffset");
    if ((BSPointEqualToPoint() & 1) != 0)
      return 0;
    -[BSUIScrollView _setContentOffsetWithDecelerationAnimation:](self->_scrollView, "_setContentOffsetWithDecelerationAnimation:", v21, v25);
  }
  else
  {
    -[SBHWidgetStackViewController _restartPageControlTimer](self, "_restartPageControlTimer");
    -[SBLeafIcon activeDataSource](self->_icon, "activeDataSource");
    v26 = (SBLeafIconDataSource *)objc_claimAutoreleasedReturnValue();
    activeWidget = self->_activeWidget;
    self->_activeWidget = v26;

    -[UIPageControl setCurrentPage:](self->_pageControl, "setCurrentPage:", v8);
    scrollView = self->_scrollView;
    -[SBHWidgetStackViewController _restingContentOffset](self, "_restingContentOffset");
    -[BSUIScrollView setContentOffset:](scrollView, "setContentOffset:");
    -[SBHWidgetStackViewController view](self, "view");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setNeedsLayout");

    -[SBHWidgetStackViewController view](self, "view");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "layoutIfNeeded");

  }
  return 1;
}

- (void)_removeWidgetContainerViewControllers:(id)a3 animated:(BOOL)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  BOOL v10;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __79__SBHWidgetStackViewController__removeWidgetContainerViewControllers_animated___block_invoke;
  v8[3] = &unk_1E8D8C060;
  v8[4] = self;
  v9 = v6;
  v10 = a4;
  v7 = v6;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v8);

}

void __79__SBHWidgetStackViewController__removeWidgetContainerViewControllers_animated___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_widgetWithUniqueIdentifier:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "_removeWidget:widgetContainerViewControllers:animated:", v3, *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
    v3 = v4;
  }

}

- (void)_removeWidget:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  -[SBHWidgetStackViewController _effectiveWidgetContainerViewControllers](self, "_effectiveWidgetContainerViewControllers");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[SBHWidgetStackViewController _removeWidget:widgetContainerViewControllers:animated:](self, "_removeWidget:widgetContainerViewControllers:animated:", v6, v7, v4);

}

- (void)_removeWidget:(id)a3 widgetContainerViewControllers:(id)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
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
  _QWORD v30[4];
  id v31;
  _QWORD v32[5];
  _QWORD aBlock[4];
  id v34;
  id v35;
  SBHWidgetStackViewController *v36;

  v5 = a5;
  v8 = a4;
  objc_msgSend(a3, "uniqueIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v8, "removeObjectForKey:", v9);
    v11 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __86__SBHWidgetStackViewController__removeWidget_widgetContainerViewControllers_animated___block_invoke;
    aBlock[3] = &unk_1E8D84F18;
    v34 = v9;
    v12 = v10;
    v35 = v12;
    v36 = self;
    v13 = _Block_copy(aBlock);
    v14 = v13;
    if (v5)
    {
      v15 = objc_alloc(MEMORY[0x1E0DC3F10]);
      -[UIView bounds](self->_containerView, "bounds");
      v16 = (void *)objc_msgSend(v15, "initWithFrame:");
      -[UIView center](self->_containerView, "center");
      objc_msgSend(v16, "setCenter:");
      objc_msgSend(v16, "setClipsToBounds:", 1);
      objc_msgSend(v16, "_setContinuousCornerRadius:", self->_iconImageInfo.continuousCornerRadius);
      objc_msgSend(v16, "layer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setAllowsGroupOpacity:", 1);

      -[SBHWidgetStackViewController view](self, "view");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addSubview:", v16);

      -[SBHWidgetStackViewController view](self, "view");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "bounds");
      objc_msgSend(v16, "bounds");
      UIRectCenteredIntegralRect();
      v21 = v20;
      v23 = v22;
      v25 = v24;
      v27 = v26;

      objc_msgSend(v12, "view");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setFrame:", v21, v23, v25, v27);
      v29 = (void *)MEMORY[0x1E0DC3F10];
      v32[0] = v11;
      v32[1] = 3221225472;
      v32[2] = __86__SBHWidgetStackViewController__removeWidget_widgetContainerViewControllers_animated___block_invoke_62;
      v32[3] = &unk_1E8D84C50;
      v32[4] = self;
      v30[0] = v11;
      v30[1] = 3221225472;
      v30[2] = __86__SBHWidgetStackViewController__removeWidget_widgetContainerViewControllers_animated___block_invoke_2;
      v30[3] = &unk_1E8D86600;
      v31 = v14;
      objc_msgSend(v29, "animateWithDuration:animations:completion:", v32, v30, 0.4);

    }
    else
    {
      (*((void (**)(void *))v13 + 2))(v13);
    }

  }
}

void __86__SBHWidgetStackViewController__removeWidget_widgetContainerViewControllers_animated___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  SBLogWidgets();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v7 = 138543362;
    v8 = v3;
    _os_log_impl(&dword_1CFEF3000, v2, OS_LOG_TYPE_DEFAULT, "Removing widget with unique identifier %{public}@", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "setUserVisibilityStatus:", 1);
  objc_msgSend(*(id *)(a1 + 48), "bs_removeChildViewController:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "widgetViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "widgetStackViewController:didRemoveViewController:", v5, v6);

  }
}

uint64_t __86__SBHWidgetStackViewController__removeWidget_widgetContainerViewControllers_animated___block_invoke_62(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1168), "setAlpha:", 1.0);
}

uint64_t __86__SBHWidgetStackViewController__removeWidget_widgetContainerViewControllers_animated___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setOverrideIconImageAppearance:(id)a3
{
  SBHIconImageAppearance *v4;
  SBHIconImageAppearance *overrideIconImageAppearance;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v7 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    v4 = (SBHIconImageAppearance *)objc_msgSend(v7, "copy");
    overrideIconImageAppearance = self->_overrideIconImageAppearance;
    self->_overrideIconImageAppearance = v4;

    -[SBHWidgetStackViewController _effectiveWidgetContainerViewControllers](self, "_effectiveWidgetContainerViewControllers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __63__SBHWidgetStackViewController_setOverrideIconImageAppearance___block_invoke;
    v8[3] = &unk_1E8D8C088;
    v9 = v7;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v8);

  }
}

uint64_t __63__SBHWidgetStackViewController_setOverrideIconImageAppearance___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "setOverrideIconImageAppearance:", *(_QWORD *)(a1 + 32));
}

- (void)setOverrideIconImageStyleConfiguration:(id)a3
{
  SBHIconImageStyleConfiguration *v4;
  SBHIconImageStyleConfiguration *overrideIconImageStyleConfiguration;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v7 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    v4 = (SBHIconImageStyleConfiguration *)objc_msgSend(v7, "copy");
    overrideIconImageStyleConfiguration = self->_overrideIconImageStyleConfiguration;
    self->_overrideIconImageStyleConfiguration = v4;

    -[SBHWidgetStackViewController _effectiveWidgetContainerViewControllers](self, "_effectiveWidgetContainerViewControllers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __71__SBHWidgetStackViewController_setOverrideIconImageStyleConfiguration___block_invoke;
    v8[3] = &unk_1E8D8C088;
    v9 = v7;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v8);

  }
}

uint64_t __71__SBHWidgetStackViewController_setOverrideIconImageStyleConfiguration___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "setOverrideIconImageStyleConfiguration:", *(_QWORD *)(a1 + 32));
}

- (id)effectiveIconImageAppearance
{
  void *v3;
  void *v4;
  void *v5;

  -[SBHWidgetStackViewController overrideIconImageAppearance](self, "overrideIconImageAppearance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHWidgetStackViewController traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3E88], "sbh_iconImageAppearanceFromTraitCollection:overrideIconImageAppearance:", v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setHost:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_host);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_host, obj);
    if (obj)
      -[SBHWidgetStackViewController _layoutWithAnimationUpdateMode:](self, "_layoutWithAnimationUpdateMode:", 2);
    else
      -[SBHWidgetStackViewController discardAllWidgetViewControllers](self, "discardAllWidgetViewControllers");
    v5 = obj;
  }

}

- (id)sourceView
{
  void *v3;
  SBLeafIconDataSource *activeWidget;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  id WeakRetained;
  void *v14;
  void *v15;
  NSObject *v16;
  objc_class *v17;
  void *v18;
  int v20;
  void *v21;
  __int16 v22;
  SBHWidgetStackViewController *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[SBLeafIconDataSource uniqueIdentifier](self->_activeWidget, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  activeWidget = self->_activeWidget;
  if (activeWidget)
  {
    -[SBHWidgetStackViewController iconImageInfo](self, "iconImageInfo");
    v5 = !-[SBHWidgetStackViewController _createViewControllerForWidgetIfNecessary:usingIconImageInfo:](self, "_createViewControllerForWidgetIfNecessary:usingIconImageInfo:", activeWidget);
  }
  else
  {
    v5 = 1;
  }
  -[SBHWidgetStackViewController _effectiveWidgetContainerViewControllers](self, "_effectiveWidgetContainerViewControllers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    objc_msgSend(v6, "objectForKey:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v8, "snapshotView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if (-[SBHWidgetStackViewController _shouldDrawSystemBackgroundMaterialForWidget:](self, "_shouldDrawSystemBackgroundMaterialForWidget:", self->_activeWidget))
    {
      objc_setAssociatedObject(v9, "SBHTransparentWidgetKey", MEMORY[0x1E0C9AAB0], (void *)3);
    }
    if (objc_msgSend(v8, "wantsTintedAppearanceBackground"))
      objc_setAssociatedObject(v9, "SBHTintedWidgetKey", MEMORY[0x1E0C9AAB0], (void *)3);
  }
  if ((v5 & 1) == 0)
  {
    SBLogWidgets();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138544130;
      v21 = v12;
      v22 = 2048;
      v23 = self;
      v24 = 2080;
      v25 = "-[SBHWidgetStackViewController sourceView]";
      v26 = 2114;
      v27 = v8;
      _os_log_impl(&dword_1CFEF3000, v10, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> %s; view controller '%{public}@' didn't exist; we need to remove it now.",
        (uint8_t *)&v20,
        0x2Au);

    }
    -[SBHWidgetStackViewController bs_removeChildViewController:](self, "bs_removeChildViewController:", v8);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v8, "widgetViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "widgetStackViewController:didRemoveViewController:", self, v14);

    objc_msgSend(v7, "removeObjectForKey:", v3);
  }
  if (!v9)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBackgroundColor:", v15);

    SBLogWidgets();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543874;
      v21 = v18;
      v22 = 2048;
      v23 = self;
      v24 = 2080;
      v25 = "-[SBHWidgetStackViewController sourceView]";
      _os_log_impl(&dword_1CFEF3000, v16, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> %s; returning blank source view",
        (uint8_t *)&v20,
        0x20u);

    }
  }

  return v9;
}

- (id)sourceBackgroundView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  int v19;
  NSObject *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_10;
  objc_getAssociatedObject(v4, "SBHTintedWidgetKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  if (v7)
  {
    objc_msgSend(v5, "bounds");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    -[SBHWidgetStackViewController iconImageInfo](self, "iconImageInfo");
    +[SBHWidgetContainerViewController buildGradientBackgroundViewWithFrame:continuousCornerRadius:](SBHWidgetContainerViewController, "buildGradientBackgroundViewWithFrame:continuousCornerRadius:", v9, v11, v13, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  objc_getAssociatedObject(v5, "SBHTransparentWidgetKey");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "BOOLValue");

  if (!v19)
  {
LABEL_10:
    v17 = 0;
    goto LABEL_11;
  }
  SBLogWidgets();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v20))
  {
    v21 = (void *)MEMORY[0x1E0CB3940];
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringWithFormat:", CFSTR("<%@: %p>"), v23, self);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v28 = v24;
    _os_signpost_emit_with_name_impl(&dword_1CFEF3000, v20, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_LAYOUT_STACK_CREATE_BACKGROUND", "%{public}@", buf, 0xCu);

  }
  -[SBHWidgetStackViewController _createBackgroundView](self, "_createBackgroundView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHWidgetStackViewController _configureBackgroundViewIfNecessary:](self, "_configureBackgroundViewIfNecessary:", v17);
  SBLogWidgets();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v25))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CFEF3000, v25, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_LAYOUT_STACK_CREATE_BACKGROUND", " isAnimation=YES ", buf, 2u);
  }

LABEL_11:
  return v17;
}

- (CGRect)visibleBounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[SBHWidgetStackViewController iconImageInfo](self, "iconImageInfo");
  v3 = v2;
  v5 = v4;
  v6 = 0.0;
  v7 = 0.0;
  result.size.height = v5;
  result.size.width = v3;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (double)continuousCornerRadius
{
  double v2;

  -[SBHWidgetStackViewController iconImageInfo](self, "iconImageInfo");
  return v2;
}

- (void)setShowsSquareCorners:(BOOL)a3
{
  if (self->_showsSquareCorners != a3)
  {
    self->_showsSquareCorners = a3;
    -[UIView setClipsToBounds:](self->_backgroundView, "setClipsToBounds:", !a3);
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v12;
  void *v13;
  id v14;

  v14 = a3;
  -[SBHWidgetStackViewController _pageSize](self, "_pageSize");
  v5 = v4;
  -[SBHWidgetStackViewController _scrollViewContentSize](self, "_scrollViewContentSize");
  v7 = v6;
  objc_msgSend(v14, "contentOffset");
  v10 = v9;
  if (v8 >= 0.0 && v8 <= v7 - v5)
  {
    v12 = v8;
    if (objc_msgSend(v14, "isScrollAnimating"))
      -[UIPageControl setCurrentPage:](self->_pageControl, "setCurrentPage:", -[SBHWidgetStackViewController _newActiveWidgetIndexForContentOffset:](self, "_newActiveWidgetIndexForContentOffset:", v10, v12));
    -[SBHWidgetStackViewController view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setNeedsLayout");

  }
  else
  {
    -[SBHWidgetStackViewController _updateActiveWidgetIndexAndScrollViewContentOffset](self, "_updateActiveWidgetIndexAndScrollViewContentOffset");
  }

}

- (void)scrollViewWillBeginScrolling:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = (void *)-[NSHashTable copy](self->_observers, "copy", a3, 0);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "widgetStackViewControllerWillBeginScrolling:", self);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)scrollViewWillBeginDragging:(id)a3
{
  BSInvalidatable *v4;
  BSInvalidatable *scrollingTouchCancellationAssertion;

  -[SBHWidgetStackViewController _updateActiveWidgetIndexAndScrollViewContentOffset](self, "_updateActiveWidgetIndexAndScrollViewContentOffset", a3);
  if (!self->_scrollingTouchCancellationAssertion)
  {
    -[SBHWidgetStackViewController cancelTouchesForCurrentEventInHostedContent](self, "cancelTouchesForCurrentEventInHostedContent");
    v4 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    scrollingTouchCancellationAssertion = self->_scrollingTouchCancellationAssertion;
    self->_scrollingTouchCancellationAssertion = v4;

  }
  self->_showStackBorderWhenShowingPageControl = 1;
  -[SBHWidgetStackViewController _setPageControlHidden:animated:](self, "_setPageControlHidden:animated:", 0, 1);
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  BSInvalidatable *scrollingTouchCancellationAssertion;
  BSInvalidatable *v8;
  int64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  scrollingTouchCancellationAssertion = self->_scrollingTouchCancellationAssertion;
  if (scrollingTouchCancellationAssertion)
  {
    -[BSInvalidatable invalidate](scrollingTouchCancellationAssertion, "invalidate");
    v8 = self->_scrollingTouchCancellationAssertion;
    self->_scrollingTouchCancellationAssertion = 0;

  }
  v9 = -[SBHWidgetStackViewController _newActiveWidgetIndexForContentOffset:](self, "_newActiveWidgetIndexForContentOffset:", a5->x, a5->y);
  -[UIPageControl setCurrentPage:](self->_pageControl, "setCurrentPage:", v9);
  -[SBHWidgetStackViewController delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SBLeafIcon iconDataSources](self->_icon, "iconDataSources");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndex:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "widgetStackViewController:didActivateDataSource:fromUserInteraction:", self, v12, 1);

  }
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  id v3;

  v3 = a3;
  if (objc_msgSend(v3, "isScrollAnimating"))
    objc_msgSend(v3, "stopScrollingAndZooming");

}

- (void)scrollViewDidEndScrolling:(id)a3
{
  -[SBHWidgetStackViewController _updateActiveWidgetIndexAndScrollViewContentOffset](self, "_updateActiveWidgetIndexAndScrollViewContentOffset", a3);
  -[SBHWidgetStackViewController _restartPageControlTimer](self, "_restartPageControlTimer");
  -[SBHWidgetStackViewController _updateWidgetViewsWithAnimationUpdateMode:](self, "_updateWidgetViewsWithAnimationUpdateMode:", 3);
}

- (void)customImageViewControllerWantsLabelHiddenDidChange:(id)a3
{
  NSObject *v4;
  objc_class *v5;
  void *v6;
  NSHashTable *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  SBHWidgetStackViewController *v21;
  __int16 v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  SBLogWidgets();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v19 = v6;
    v20 = 2048;
    v21 = self;
    v22 = 2080;
    v23 = "-[SBHWidgetStackViewController customImageViewControllerWantsLabelHiddenDidChange:]";
    _os_log_impl(&dword_1CFEF3000, v4, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> %s", buf, 0x20u);

  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = self->_customImageViewObservers;
  v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v11);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v12, "customImageViewControllerWantsLabelHiddenDidChange:", self, (_QWORD)v13);
        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSHashTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (void)widgetContainerViewControllerContentViewControllerDidActivate:(id)a3
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  void *v12;
  __int16 v13;
  SBHWidgetStackViewController *v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogWidgets();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543874;
    v12 = v7;
    v13 = 2048;
    v14 = self;
    v15 = 2080;
    v16 = "-[SBHWidgetStackViewController widgetContainerViewControllerContentViewControllerDidActivate:]";
    _os_log_impl(&dword_1CFEF3000, v5, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> %s", (uint8_t *)&v11, 0x20u);

  }
  if (-[NSHashTable containsObject:](self->_containerViewControllersRequiringLayoutUponActivation, "containsObject:", v4))
  {
    -[NSHashTable removeObject:](self->_containerViewControllersRequiringLayoutUponActivation, "removeObject:", v4);
    -[SBHWidgetStackViewController _effectiveWidgetContainerViewControllers](self, "_effectiveWidgetContainerViewControllers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allValues");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "containsObject:", v4);

    if (v10)
      -[SBHWidgetStackViewController _layoutWithAnimationUpdateMode:](self, "_layoutWithAnimationUpdateMode:", 1);
  }

}

- (void)widgetContainerViewControllerInitialWidgetContentReadinessChanged:(id)a3 widgetContentIsReady:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  NSMutableDictionary *v10;
  int64_t v11;
  dispatch_time_t v12;
  _QWORD block[5];
  NSMutableDictionary *v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  SBHWidgetStackViewController *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  _BOOL4 v23;
  uint64_t v24;

  v4 = a4;
  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  SBLogWidgets();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v17 = v9;
    v18 = 2048;
    v19 = self;
    v20 = 2080;
    v21 = "-[SBHWidgetStackViewController widgetContainerViewControllerInitialWidgetContentReadinessChanged:widgetContentIsReady:]";
    v22 = 1026;
    v23 = v4;
    _os_log_impl(&dword_1CFEF3000, v7, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> %s. Widget content is ready? %{public}d", buf, 0x26u);

  }
  v10 = self->_widgetContainerViewControllersToRemove;
  if (-[NSMutableDictionary count](v10, "count"))
  {
    if (v4)
      v11 = 0;
    else
      v11 = 3000000000;
    v12 = dispatch_time(0, v11);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __119__SBHWidgetStackViewController_widgetContainerViewControllerInitialWidgetContentReadinessChanged_widgetContentIsReady___block_invoke;
    block[3] = &unk_1E8D84F18;
    block[4] = self;
    v14 = v10;
    v15 = v6;
    dispatch_after(v12, MEMORY[0x1E0C80D38], block);

  }
}

void __119__SBHWidgetStackViewController_widgetContainerViewControllerInitialWidgetContentReadinessChanged_widgetContentIsReady___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_removeWidgetContainerViewControllers:animated:", *(_QWORD *)(a1 + 40), 1);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 1200);
  *(_QWORD *)(v2 + 1200) = 0;

  v4 = *(void **)(a1 + 48);
  if (v4)
  {
    objc_msgSend(v4, "view");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHidden:", 0);

  }
}

- (void)widgetContainerViewControllerContentViewControllerDidUpdateStyleConfiguration:(id)a3
{
  id v4;
  BOOL v5;
  _BOOL4 v6;
  UIView *backgroundView;
  id v8;

  v4 = a3;
  if (!self->_overlapping)
  {
    v8 = v4;
    v5 = -[BSUIScrollView isScrolling](self->_scrollView, "isScrolling");
    v4 = v8;
    if (!v5)
    {
      v6 = -[SBHWidgetStackViewController _alwaysShowStackBorder](self, "_alwaysShowStackBorder");
      v4 = v8;
      if (!v6)
      {
        backgroundView = self->_backgroundView;
        if (!backgroundView)
          goto LABEL_7;
        -[SBHWidgetStackViewController _teardownBackgroundView:contactDelegate:](self, "_teardownBackgroundView:contactDelegate:", backgroundView, 1);
        goto LABEL_6;
      }
    }
  }
  if (!self->_backgroundView)
  {
    v8 = v4;
    -[SBHWidgetStackViewController _createBackgroundViewIfNecessary:](self, "_createBackgroundViewIfNecessary:", 0);
LABEL_6:
    v4 = v8;
  }
LABEL_7:

}

- (void)_requireLayoutUponActivationForWidgetContainerViewController:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  NSHashTable *containerViewControllersRequiringLayoutUponActivation;
  NSHashTable *v8;
  NSHashTable *v9;
  id v10;

  v10 = a3;
  -[SBHWidgetStackViewController _effectiveWidgetContainerViewControllers](self, "_effectiveWidgetContainerViewControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v10);

  if (v6)
  {
    containerViewControllersRequiringLayoutUponActivation = self->_containerViewControllersRequiringLayoutUponActivation;
    if (!containerViewControllersRequiringLayoutUponActivation)
    {
      objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
      v8 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
      v9 = self->_containerViewControllersRequiringLayoutUponActivation;
      self->_containerViewControllersRequiringLayoutUponActivation = v8;

      containerViewControllersRequiringLayoutUponActivation = self->_containerViewControllersRequiringLayoutUponActivation;
    }
    -[NSHashTable addObject:](containerViewControllersRequiringLayoutUponActivation, "addObject:", v10);
  }

}

- (BOOL)_shouldHideWidgetWithUniqueIdentifier:(id)a3
{
  NSMutableDictionary *widgetContainerViewControllersToRemove;
  id v4;
  void *v5;
  char v6;

  widgetContainerViewControllersToRemove = self->_widgetContainerViewControllersToRemove;
  v4 = a3;
  -[NSMutableDictionary allKeys](widgetContainerViewControllersToRemove, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (BOOL)_createViewControllerForWidgetIfNecessary:(id)a3 usingIconImageInfo:(SBIconImageInfo *)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v11;
  id WeakRetained;
  void *v13;
  void *v14;
  uint64_t v15;
  SBHWidgetContainerViewController *v16;
  BOOL v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  SBHWidgetContainerViewController *v22;
  void *v23;
  void *v24;
  void *v25;
  BSUIScrollView *v26;
  BOOL v27;
  id v28;
  void *v29;
  uint64_t v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v37;
  unsigned int v38;
  BSUIScrollView *v39;
  void *v40;
  void *v41;
  _QWORD v42[4];
  id v43;
  BSUIScrollView *v44;
  SBHWidgetContainerViewController *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  BOOL v49;

  v7 = v6;
  v8 = v5;
  v9 = v4;
  v11 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(v11, "uniqueIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHWidgetStackViewController _effectiveWidgetContainerViewControllers](self, "_effectiveWidgetContainerViewControllers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", v13);
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (SBHWidgetContainerViewController *)v15;
    v17 = 0;
  }
  else
  {
    objc_msgSend(WeakRetained, "widgetStackViewController:viewControllerForDataSource:", self, v11);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18 && !self->_widgetSnapshotAnimationCount)
    {
      -[SBHWidgetStackViewController widgetIcon](self, "widgetIcon");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "gridSizeClass");
      v20 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(WeakRetained, "widgetStackViewController:containerApplicationNameForDataSource:", self, v11);
      v21 = objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(WeakRetained, "widgetStackViewController:isDataSourceBlockedForScreenTimeExpiration:", self, v11);
      v40 = (void *)v21;
      v41 = (void *)v20;
      v22 = -[SBHWidgetContainerViewController initWithWidgetViewController:widgetDataSource:gridSizeClass:iconImageInfo:applicationName:]([SBHWidgetContainerViewController alloc], "initWithWidgetViewController:widgetDataSource:gridSizeClass:iconImageInfo:applicationName:", v18, v11, v20, v21, self->_iconImageInfo.size.width, self->_iconImageInfo.size.height, self->_iconImageInfo.scale, self->_iconImageInfo.continuousCornerRadius);
      -[SBHWidgetContainerViewController setDelegate:](v22, "setDelegate:", self);
      -[SBHWidgetStackViewController overrideIconImageAppearance](self, "overrideIconImageAppearance");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBHWidgetContainerViewController setOverrideIconImageAppearance:](v22, "setOverrideIconImageAppearance:", v23);

      -[SBHWidgetStackViewController overrideIconImageStyleConfiguration](self, "overrideIconImageStyleConfiguration");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBHWidgetContainerViewController setOverrideIconImageStyleConfiguration:](v22, "setOverrideIconImageStyleConfiguration:", v24);

      -[SBHWidgetContainerViewController view](v22, "view");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = self->_scrollView;
      v27 = -[SBHWidgetStackViewController _containerRequiresClippingToBoundsForWidget:](self, "_containerRequiresClippingToBoundsForWidget:", v11);
      v37 = (void *)MEMORY[0x1E0DC3F10];
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __93__SBHWidgetStackViewController__createViewControllerForWidgetIfNecessary_usingIconImageInfo___block_invoke;
      v42[3] = &unk_1E8D8C0B0;
      v28 = v25;
      v43 = v28;
      v46 = v9;
      v47 = v8;
      v39 = v26;
      v44 = v39;
      v48 = v7;
      v16 = v22;
      v45 = v16;
      v49 = v27;
      v29 = v28;
      objc_msgSend(v37, "performWithoutAnimation:", v42);
      objc_msgSend(v28, "setHidden:", -[SBHWidgetStackViewController _shouldHideWidgetWithUniqueIdentifier:](self, "_shouldHideWidgetWithUniqueIdentifier:", v13));
      -[SBHWidgetContainerViewController setBlockedForScreenTimeExpiration:](v16, "setBlockedForScreenTimeExpiration:", v38);
      objc_msgSend(v14, "setObject:forKey:", v16, v13);
      -[BSUIScrollView addSubview:](self->_scrollView, "addSubview:", v28);
      -[SBHWidgetContainerViewController setPresentationMode:](v16, "setPresentationMode:", self->_presentationMode);
      v30 = objc_opt_class();
      v31 = v18;
      if (v30)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v32 = v31;
        else
          v32 = 0;
      }
      else
      {
        v32 = 0;
      }
      v33 = v32;

      objc_msgSend(v33, "multiplexedViewController");
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v34)
        -[SBHWidgetStackViewController _requireLayoutUponActivationForWidgetContainerViewController:](self, "_requireLayoutUponActivationForWidgetContainerViewController:", v16);

      v17 = 1;
    }
    else
    {
      v17 = 0;
      v16 = 0;
    }

  }
  -[SBHWidgetContainerViewController parentViewController](v16, "parentViewController", v37);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v35)
    -[SBHWidgetStackViewController bs_addChildViewController:withSuperview:](self, "bs_addChildViewController:withSuperview:", v16, self->_scrollView);

  return v17;
}

uint64_t __93__SBHWidgetStackViewController__createViewControllerForWidgetIfNecessary_usingIconImageInfo___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  BSRectWithSize();
  objc_msgSend(v2, "setBounds:");
  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "bounds");
  UIRectGetCenter();
  objc_msgSend(v3, "setCenter:");
  objc_msgSend(*(id *)(a1 + 32), "_setContinuousCornerRadius:", *(double *)(a1 + 72));
  return objc_msgSend(*(id *)(a1 + 48), "setRequiresClippingToBounds:", *(unsigned __int8 *)(a1 + 80));
}

- (void)_createBackgroundViewIfNecessary:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  UIView *v10;
  UIView *backgroundView;
  NSObject *v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  if (-[SBHWidgetStackViewController _appearState](self, "_appearState")
    && !self->_backgroundView
    && (!v3
     || self->_overlapping
     || -[BSUIScrollView isScrolling](self->_scrollView, "isScrolling")
     || -[SBHWidgetStackViewController _alwaysShowStackBorder](self, "_alwaysShowStackBorder")))
  {
    SBLogWidgets();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v5))
    {
      v6 = (void *)MEMORY[0x1E0CB3940];
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", CFSTR("<%@: %p>"), v8, self);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v14 = v9;
      _os_signpost_emit_with_name_impl(&dword_1CFEF3000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_LAYOUT_STACK_CREATE_BACKGROUND", "%{public}@", buf, 0xCu);

    }
    -[SBHWidgetStackViewController _createBackgroundView](self, "_createBackgroundView");
    v10 = (UIView *)objc_claimAutoreleasedReturnValue();
    backgroundView = self->_backgroundView;
    self->_backgroundView = v10;

    if (self->_backgroundView)
    {
      -[SBHWidgetStackViewController _configureBackgroundViewIfNecessary](self, "_configureBackgroundViewIfNecessary");
      -[UIView insertSubview:atIndex:](self->_containerView, "insertSubview:atIndex:", self->_backgroundView, 0);
      -[SBHWidgetStackViewController _updateBackgroundViewWithAnimationUpdateMode:allowingOutsetting:](self, "_updateBackgroundViewWithAnimationUpdateMode:allowingOutsetting:", 1, 0);
    }
    SBLogWidgets();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CFEF3000, v12, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_LAYOUT_STACK_CREATE_BACKGROUND", " isAnimation=YES ", buf, 2u);
    }

  }
}

- (id)_createBackgroundView
{
  void (**backgroundViewProvider)(id, SEL);
  void *v4;

  backgroundViewProvider = (void (**)(id, SEL))self->_backgroundViewProvider;
  if (backgroundViewProvider)
    backgroundViewProvider[2](backgroundViewProvider, a2);
  else
    objc_msgSend(MEMORY[0x1E0D47498], "materialViewWithRecipe:", 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClipsToBounds:", !self->_showsSquareCorners);
  objc_msgSend(v4, "setAutoresizingMask:", 18);
  return v4;
}

- (void)_teardownBackgroundView:(id)a3 contactDelegate:(BOOL)a4
{
  _BOOL4 v4;
  UIView *v6;
  void *v7;
  UIView *v8;
  UIView *v9;

  v4 = a4;
  v6 = (UIView *)a3;
  if (v6)
  {
    if (self->_backgroundView == v6)
    {
      self->_backgroundView = 0;
      v8 = v6;

      v6 = v8;
      if (!v4)
        goto LABEL_9;
    }
    else if (!v4)
    {
      goto LABEL_9;
    }
    v9 = v6;
    -[SBHWidgetStackViewController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v7, "widgetStackViewController:didFinishUsingBackgroundView:", self, v9);

    v6 = v9;
  }
LABEL_9:

}

- (void)discardAllWidgetViewControllers
{
  id v3;

  -[SBHWidgetStackViewController _effectiveWidgetContainerViewControllers](self, "_effectiveWidgetContainerViewControllers");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SBHWidgetStackViewController _removeWidgetContainerViewControllers:animated:](self, "_removeWidgetContainerViewControllers:animated:", v3, 0);
  objc_msgSend(v3, "removeAllObjects");

}

- (BOOL)_containerRequiresClippingToBoundsForWidget:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)_layoutWithAnimationUpdateMode:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  SBLogWidgets();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v5))
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    SBStringFromAnimationUpdateMode();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("<%@: %p updateMode: %@>"), v8, self, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v13 = v10;
    _os_signpost_emit_with_name_impl(&dword_1CFEF3000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_LAYOUT_STACK", "updateMode=%{public}@", buf, 0xCu);

  }
  if (objc_msgSend(MEMORY[0x1E0DC3F10], "_isInRetargetableAnimationBlock"))
    a3 = 1;
  -[SBHWidgetStackViewController _updateBackgroundViewWithAnimationUpdateMode:](self, "_updateBackgroundViewWithAnimationUpdateMode:", a3);
  -[SBHWidgetStackViewController _updateWidgetViewsWithAnimationUpdateMode:](self, "_updateWidgetViewsWithAnimationUpdateMode:", a3);
  -[SBHWidgetStackViewController _updateWidgetViewClippingAndBackgroundView](self, "_updateWidgetViewClippingAndBackgroundView");
  -[SBHWidgetStackViewController _updateWidgetViewHitTesting](self, "_updateWidgetViewHitTesting");
  -[SBHWidgetStackViewController _updateWidgetViewEdgeAntialiasing](self, "_updateWidgetViewEdgeAntialiasing");
  -[SBHWidgetStackViewController _updateScrollViewDelaysContentTouches](self, "_updateScrollViewDelaysContentTouches");
  -[SBHWidgetStackViewController _updatePageControlWithAnimationUpdateMode:](self, "_updatePageControlWithAnimationUpdateMode:", a3);
  SBLogWidgets();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CFEF3000, v11, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_LAYOUT_STACK", " isAnimation=YES ", buf, 2u);
  }

}

- (void)_updateWidgetViewsWithAnimationUpdateMode:(int64_t)a3
{
  SBHWidgetStackViewController *v3;
  id WeakRetained;
  BOOL v5;
  NSObject *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  long double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  uint64_t v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  uint64_t v34;
  double v35;
  double v36;
  uint64_t v37;
  BOOL v38;
  BOOL v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  BOOL v47;
  char v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  int64_t v53;
  double v54;
  uint64_t v55;
  double v56;
  double v57;
  double v58;
  double v59;
  BOOL v60;
  double v61;
  double v62;
  int v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  BOOL v70;
  BOOL v71;
  double v72;
  double v73;
  BOOL v74;
  SBFFluidBehaviorSettings *animationSettings;
  void *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  id v80;
  void *v81;
  void *v82;
  NSObject *v83;
  id v84;
  double v85;
  double v86;
  uint64_t v87;
  double v88;
  double v89;
  void *v90;
  double v91;
  double v92;
  double v93;
  double v94;
  long double v95;
  uint64_t v96;
  int64_t v98;
  double continuousCornerRadius;
  double v100;
  double v101;
  double v102;
  double v103;
  uint64_t v104;
  uint64_t v105;
  SBHWidgetStackViewController *v106;
  int v107;
  void *v108;
  void *v109;
  _QWORD v110[4];
  id v111;
  _QWORD v112[5];
  BOOL v113;
  _QWORD v114[4];
  id v115;
  CGAffineTransform v116;
  double v117;
  BOOL v118;
  BOOL v119;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform buf;
  uint64_t v123;
  CGRect v124;
  CGRect v125;

  v3 = self;
  v123 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  if (-[NSHashTable count](v3->_imageUpdateDisableAssertions, "count"))
    v5 = 1;
  else
    v5 = WeakRetained == 0;
  if (v5)
    goto LABEL_80;
  v84 = WeakRetained;
  SBLogWidgets();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v6))
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    SBStringFromAnimationUpdateMode();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("<%@: %p updateMode: %@>"), v9, v3, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf.a) = 138543362;
    *(_QWORD *)((char *)&buf.a + 4) = v11;
    _os_signpost_emit_with_name_impl(&dword_1CFEF3000, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_LAYOUT_STACK_WIDGET_VIEWS", "updateMode=%{public}@", (uint8_t *)&buf, 0xCu);

  }
  -[SBHWidgetStackViewController iconImageInfo](v3, "iconImageInfo");
  v91 = v13;
  v92 = v12;
  v93 = v15;
  v94 = v14;
  BSRectWithSize();
  v17 = v16;
  v19 = v18;
  -[SBLeafIcon iconDataSources](v3->_icon, "iconDataSources");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v104 = objc_msgSend(v20, "indexOfObject:", v3->_activeWidget);

  -[BSUIScrollView contentOffset](v3->_scrollView, "contentOffset");
  v95 = v21;
  -[SBHWidgetStackViewController _restingContentOffset](v3, "_restingContentOffset");
  v23 = v22;
  BSRectWithSize();
  v102 = v25;
  v103 = v24;
  v100 = v27;
  v101 = v26;
  continuousCornerRadius = v3->_iconImageInfo.continuousCornerRadius;
  -[SBHWidgetStackViewController _effectiveWidgetContainerViewControllers](v3, "_effectiveWidgetContainerViewControllers");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBLeafIcon iconDataSources](v3->_icon, "iconDataSources");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v108, "count");
  if (-[SBHWidgetStackViewController _appearState](v3, "_appearState"))
  {
    LOBYTE(v107) = 0;
    if (!v29)
      goto LABEL_77;
    goto LABEL_11;
  }
  v107 = !-[SBHWidgetStackViewController forcesVisible](v3, "forcesVisible");
  if (v29)
  {
LABEL_11:
    v30 = -46.0 / v17 + 1.0;
    v31 = v29 - 1;
    v32 = -1;
    if (v95 > v23)
      v32 = 1;
    v105 = v32;
    v33 = v17 * 0.5;
    v89 = v19 * 0.5 + v23;
    v85 = -6.0 / v17 + 1.0;
    v86 = (v17 + -1.0) / v17;
    v34 = 0;
    v35 = fabs(fmod(v95, v23));
    v36 = vabdd_f64(v35, v23);
    if (v35 > v23 * 0.5)
      v35 = v36;
    v88 = v35;
    v90 = v28;
    v96 = v29;
    v106 = v3;
    v87 = v29 - 1;
    while (1)
    {
      v37 = v34 - v104;
      if (v29 != 1)
      {
        if (v104 || v31 != v34)
        {
          if (v34)
            v38 = 0;
          else
            v38 = v104 == v31;
          if (v38)
            v37 = 1;
        }
        else
        {
          v37 = -1;
        }
      }
      v39 = v37 && v29 == 2;
      v40 = v39 ? v105 : v37;
      v41 = -[SBHWidgetStackViewController _showAdjacentWidgets](v3, "_showAdjacentWidgets");
      v42 = v41 << 63 >> 63;
      v43 = v41;
      objc_msgSend(v108, "objectAtIndex:", v34);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "uniqueIdentifier");
      v45 = objc_claimAutoreleasedReturnValue();
      v46 = v45;
      v47 = v40 >= v42 && v40 <= v43;
      v48 = v47 ? v107 : 1;
      v109 = (void *)v45;
      if ((v48 & 1) == 0)
        break;
      objc_msgSend(v28, "objectForKey:", v45);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = v49;
      if (!v49)
        goto LABEL_76;
      objc_msgSend(v49, "setUserVisibilityStatus:", 1);
      -[SBHWidgetStackViewController bs_removeChildViewController:](v3, "bs_removeChildViewController:", v50);
      if (-[BSUIScrollView isScrolling](v3->_scrollView, "isScrolling"))
        goto LABEL_76;
      objc_msgSend(v28, "removeObjectForKey:", v109);
      -[SBHWidgetStackViewController delegate](v3, "delegate");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v50, "widgetViewController");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "widgetStackViewController:didRemoveViewController:", v3, v52);
LABEL_74:

        v29 = v96;
      }

LABEL_76:
      if (v29 == ++v34)
        goto LABEL_77;
    }
    if (-[SBHWidgetStackViewController _createViewControllerForWidgetIfNecessary:usingIconImageInfo:](v3, "_createViewControllerForWidgetIfNecessary:usingIconImageInfo:", v44, v94, v93, v92, v91))
    {
      v53 = 1;
    }
    else
    {
      v53 = a3;
    }
    objc_msgSend(v28, "objectForKey:", v46);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "view");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = v89 + v19 * (double)v40;
    v55 = -[SBHWidgetStackViewController _containerRequiresClippingToBoundsForWidget:](v3, "_containerRequiresClippingToBoundsForWidget:", v44);
    objc_msgSend(v51, "center");
    v57 = v56;
    v59 = v58;
    objc_msgSend(v51, "bounds");
    v125.origin.y = v102;
    v125.origin.x = v103;
    v125.size.height = v100;
    v125.size.width = v101;
    v60 = CGRectEqualToRect(v124, v125);
    objc_msgSend(v51, "_continuousCornerRadius");
    v62 = v61;
    v63 = objc_msgSend(v50, "requiresClippingToBounds");
    if (v57 != v33 || v59 != v54)
      objc_msgSend(v51, "setCenter:", v33, v54);
    if (!v60)
      objc_msgSend(v51, "setBounds:", v103, v102, v101, v100);
    if (vabdd_f64(v62, continuousCornerRadius) >= 2.22044605e-16)
      objc_msgSend(v51, "_setContinuousCornerRadius:", continuousCornerRadius);
    v3 = v106;
    if (v55 != v63)
      objc_msgSend(v50, "setRequiresClippingToBounds:", v55);
    v64 = (v30 + -1.0) * vabdd_f64(v54 - v19 * 0.5, v95) / v19 + 1.0;
    if (v30 >= v64)
      v64 = v30;
    v65 = fmin(v64, 1.0);
    if (-[SBHWidgetStackViewController _insetWidgetsForTrackingAppearance](v106, "_insetWidgetsForTrackingAppearance"))
    {
      v66 = v85 * v65;
    }
    else if (v106->_overlapping)
    {
      v66 = v86;
    }
    else
    {
      v66 = v65;
    }
    if (-[SBHWidgetStackViewController isOverlapping](v106, "isOverlapping"))
      v67 = 0.75;
    else
      v67 = 1.0;
    -[SBHWidgetStackViewController _backgroundColorForWidgetWithDistanceFromRestingContentOffset:](v106, "_backgroundColorForWidgetWithDistanceFromRestingContentOffset:", v88);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "alphaComponent");
    v69 = v68;
    memset(&buf, 0, sizeof(buf));
    CGAffineTransformMakeScale(&buf, v66, v66);
    v98 = v53;
    if (v51)
      objc_msgSend(v51, "transform");
    else
      memset(&t2, 0, sizeof(t2));
    t1 = buf;
    v70 = CGAffineTransformEqualToTransform(&t1, &t2);
    v71 = !v70;
    objc_msgSend(v51, "alpha");
    v73 = vabdd_f64(v72, v69);
    v74 = v73 >= 2.22044605e-16;
    if (!v70 || v73 >= 2.22044605e-16)
    {
      if (!v70)
        -[SBHWidgetStackViewController _incrementWidgetScaleAnimationCount](v106, "_incrementWidgetScaleAnimationCount");
      animationSettings = v106->_animationSettings;
      v76 = (void *)MEMORY[0x1E0DC3F10];
      v77 = MEMORY[0x1E0C809B0];
      v114[0] = MEMORY[0x1E0C809B0];
      v114[1] = 3221225472;
      v114[2] = __74__SBHWidgetStackViewController__updateWidgetViewsWithAnimationUpdateMode___block_invoke;
      v114[3] = &unk_1E8D8C0D8;
      v118 = v71;
      v115 = v51;
      v116 = buf;
      v119 = v74;
      v117 = v67;
      v112[0] = v77;
      v112[1] = 3221225472;
      v112[2] = __74__SBHWidgetStackViewController__updateWidgetViewsWithAnimationUpdateMode___block_invoke_2;
      v112[3] = &unk_1E8D8C100;
      v113 = v71;
      v112[4] = v106;
      v78 = v76;
      v3 = v106;
      objc_msgSend(v78, "sb_animateWithSettings:mode:animations:completion:", animationSettings, v98, v114, v112);

      v31 = v87;
    }
    v28 = v90;
    goto LABEL_74;
  }
LABEL_77:
  objc_msgSend(v108, "bs_map:", &__block_literal_global_59);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v110[0] = MEMORY[0x1E0C809B0];
  v110[1] = 3221225472;
  v110[2] = __74__SBHWidgetStackViewController__updateWidgetViewsWithAnimationUpdateMode___block_invoke_4;
  v110[3] = &unk_1E8D8C148;
  v111 = v79;
  v80 = v79;
  objc_msgSend(v28, "bs_filter:", v110);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = (void *)objc_msgSend(v81, "mutableCopy");

  -[SBHWidgetStackViewController _removeWidgetContainerViewControllers:animated:](v3, "_removeWidgetContainerViewControllers:animated:", v82, 1);
  SBLogWidgets();
  v83 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v83))
  {
    LOWORD(buf.a) = 0;
    _os_signpost_emit_with_name_impl(&dword_1CFEF3000, v83, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_LAYOUT_STACK_WIDGET_VIEWS", " isAnimation=YES ", (uint8_t *)&buf, 2u);
  }

  -[SBHWidgetStackViewController _updateVisiblySettledForWidgetViewControllers](v3, "_updateVisiblySettledForWidgetViewControllers");
  -[SBHWidgetStackViewController _updatePresentationModeForWidgetViewControllers](v3, "_updatePresentationModeForWidgetViewControllers");
  -[SBHWidgetStackViewController _updateShowsSnapshotWhenDeactivatedForWidgetViewControllers](v3, "_updateShowsSnapshotWhenDeactivatedForWidgetViewControllers");
  -[SBHWidgetStackViewController _updatePauseReasonForWidgetViewControllers](v3, "_updatePauseReasonForWidgetViewControllers");
  -[SBHWidgetStackViewController _updateApproximateLayoutPositionForWidgetViewControllers](v3, "_updateApproximateLayoutPositionForWidgetViewControllers");

  WeakRetained = v84;
LABEL_80:

}

uint64_t __74__SBHWidgetStackViewController__updateWidgetViewsWithAnimationUpdateMode___block_invoke(uint64_t result)
{
  uint64_t v1;
  void *v2;
  __int128 v3;
  _OWORD v4[3];

  v1 = result;
  if (*(_BYTE *)(result + 96))
  {
    v2 = *(void **)(result + 32);
    v3 = *(_OWORD *)(v1 + 56);
    v4[0] = *(_OWORD *)(v1 + 40);
    v4[1] = v3;
    v4[2] = *(_OWORD *)(v1 + 72);
    result = objc_msgSend(v2, "setTransform:", v4);
  }
  if (*(_BYTE *)(v1 + 97))
    return objc_msgSend(*(id *)(v1 + 32), "setAlpha:", *(double *)(v1 + 88));
  return result;
}

uint64_t __74__SBHWidgetStackViewController__updateWidgetViewsWithAnimationUpdateMode___block_invoke_2(uint64_t result)
{
  if (*(_BYTE *)(result + 40))
    return objc_msgSend(*(id *)(result + 32), "_decrementWidgetScaleAnimationCount");
  return result;
}

uint64_t __74__SBHWidgetStackViewController__updateWidgetViewsWithAnimationUpdateMode___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uniqueIdentifier");
}

uint64_t __74__SBHWidgetStackViewController__updateWidgetViewsWithAnimationUpdateMode___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) ^ 1;
}

- (void)_updateBackgroundViewWithAnimationUpdateMode:(int64_t)a3
{
  -[SBHWidgetStackViewController _updateBackgroundViewWithAnimationUpdateMode:allowingOutsetting:](self, "_updateBackgroundViewWithAnimationUpdateMode:allowingOutsetting:", a3, 1);
}

- (void)_updateBackgroundViewWithAnimationUpdateMode:(int64_t)a3 allowingOutsetting:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  _BOOL4 v14;
  void *v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
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
  unint64_t v30;
  UIView *v31;
  UIView *v32;
  double v33;
  double v34;
  _BOOL4 v35;
  double v36;
  int v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  BOOL v53;
  double v54;
  _BOOL4 v55;
  _BOOL4 v56;
  double v57;
  double v58;
  double v59;
  _BOOL4 v60;
  double v61;
  UIView *v62;
  double v63;
  _BOOL4 v64;
  double v65;
  BOOL v66;
  UIView *v67;
  int v68;
  double v69;
  double v70;
  BOOL v71;
  double v72;
  double v73;
  _BOOL4 v74;
  int v75;
  void *v76;
  void *v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  BSUIScrollView *scrollView;
  int64_t v87;
  NSObject *v88;
  double v89;
  double v90;
  double v91;
  int64_t v92;
  double v93;
  double v94;
  SBFFluidBehaviorSettings *animationSettings;
  double v96;
  double v97;
  double v98;
  UIView *v99;
  double v100;
  UIView *v101;
  UIView *v102;
  BSUIScrollView *v103;
  _QWORD v104[5];
  _QWORD v105[4];
  UIView *v106;
  UIView *v107;
  UIView *v108;
  BSUIScrollView *v109;
  double v110;
  double v111;
  CGFloat v112;
  CGFloat v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  BOOL v121;
  char v122;
  BOOL v123;
  char v124;
  BOOL v125;
  BOOL v126;
  BOOL v127;
  BOOL v128;
  uint8_t buf[4];
  void *v130;
  uint64_t v131;
  CGRect v132;
  CGRect v133;
  CGRect v134;
  CGRect v135;

  v4 = a4;
  v131 = *MEMORY[0x1E0C80C00];
  SBLogWidgets();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v7))
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    SBStringFromAnimationUpdateMode();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("<%@: %p updateMode: %@>"), v10, self, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v130 = v12;
    _os_signpost_emit_with_name_impl(&dword_1CFEF3000, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_LAYOUT_STACK_BACKGROUND", "updateMode=%{public}@", buf, 0xCu);

  }
  v92 = a3;

  -[SBHWidgetStackViewController _createBackgroundViewIfNecessary:](self, "_createBackgroundViewIfNecessary:", 1);
  v13 = -[SBHWidgetStackViewController _alwaysShowStackBorder](self, "_alwaysShowStackBorder");
  v14 = -[SBHWidgetStackViewController isOverlapping](self, "isOverlapping");
  -[SBHWidgetStackViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bounds");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  -[SBHWidgetStackViewController iconImageInfo](self, "iconImageInfo");
  BSRectWithSize();
  v25 = v24;
  v27 = v26;
  -[SBHWidgetStackViewController iconImageInfo](self, "iconImageInfo");
  v29 = v28;
  v30 = -[SBHWidgetStackViewController imageViewAlignment](self, "imageViewAlignment");
  v31 = self->_containerView;
  v32 = self->_backgroundView;
  v103 = self->_scrollView;
  v102 = self->_dimmingView;
  v97 = v25;
  if (-[SBHWidgetStackViewController isOverlapping](self, "isOverlapping") && v4)
  {
    v33 = v21 + 16.0;
    v34 = v23 + 16.0;
    v29 = v29 + 8.0;
  }
  else
  {
    v35 = -[SBHWidgetStackViewController _insetWidgetsForTrackingAppearance](self, "_insetWidgetsForTrackingAppearance");
    v34 = v23;
    v33 = v21;
    if (v35 && v4)
    {
      v36 = 1.0 - 6.0 / v21;
      v33 = v21 * v36 + 6.0;
      v34 = v23 * v36 + 6.0;
      v29 = v29 * v36 + 3.0;
    }
  }
  v37 = !v13 || v14 || !v4;
  if (v37)
  {
    v38 = v34;
  }
  else
  {
    v29 = v29 + 3.0;
    v38 = v34 + 6.0;
  }
  if (v37)
    v39 = v33;
  else
    v39 = v33 + 6.0;
  UIRectGetCenter();
  v98 = v40;
  v94 = v41;
  v96 = v27;
  v42 = -((v23 - v27) * 0.5);
  if (v30)
    v42 = (v23 - v27) * 0.5;
  v93 = v42;
  if (-[SBHWidgetStackViewController showsSquareCorners](self, "showsSquareCorners"))
    v43 = 0.0;
  else
    v43 = v29;
  UIRectGetCenter();
  v45 = v44;
  v47 = v46;
  UIRectGetCenter();
  v49 = v48;
  v100 = v50;
  -[UIView center](v31, "center");
  v89 = v47;
  v90 = v45;
  v53 = v52 == v47;
  v54 = v43;
  v55 = !v53 || v51 != v45;
  -[UIView bounds](v31, "bounds");
  v134.origin.x = v17;
  v134.origin.y = v19;
  v134.size.width = v39;
  v134.size.height = v38;
  v56 = CGRectEqualToRect(v132, v134);
  -[UIView _continuousCornerRadius](v31, "_continuousCornerRadius");
  v58 = vabdd_f64(v57, v43);
  v99 = v32;
  v91 = v49;
  if (v32)
  {
    -[UIView center](v32, "center");
    v60 = v59 != v49;
    v61 = v100;
    v62 = v32;
    LODWORD(v32) = v63 != v100 || v60;
    -[UIView bounds](v62, "bounds");
    v135.origin.x = v17;
    v135.origin.y = v19;
    v135.size.width = v39;
    v135.size.height = v38;
    v64 = !CGRectEqualToRect(v133, v135);
    -[UIView _continuousCornerRadius](v62, "_continuousCornerRadius");
    v66 = vabdd_f64(v65, v43) > 2.22044605e-16;
    v67 = v102;
  }
  else
  {
    v64 = 0;
    v66 = 0;
    v67 = v102;
    v61 = v100;
  }
  v101 = v31;
  v68 = !v56;
  v69 = v94 + v93;
  if (v67)
  {
    -[UIView _continuousCornerRadius](v67, "_continuousCornerRadius");
    v71 = vabdd_f64(v70, v54) > 2.22044605e-16;
  }
  else
  {
    v71 = 0;
  }
  -[BSUIScrollView center](v103, "center");
  v74 = v73 != v69 || v72 != v98;
  v75 = v55 | v68;
  if (v58 > 2.22044605e-16)
    v75 = 1;
  if (((v75 | v32 | v64) & 1) != 0 || v66 || v71 || v74)
  {
    -[SBHWidgetStackViewController _incrementBackgroundAnimationCount](self, "_incrementBackgroundAnimationCount");
    animationSettings = self->_animationSettings;
    v76 = (void *)MEMORY[0x1E0DC3F10];
    v105[0] = MEMORY[0x1E0C809B0];
    v105[1] = 3221225472;
    v105[2] = __96__SBHWidgetStackViewController__updateBackgroundViewWithAnimationUpdateMode_allowingOutsetting___block_invoke;
    v105[3] = &unk_1E8D88728;
    v121 = v55;
    v106 = v101;
    v110 = v90;
    v111 = v89;
    v122 = v68;
    v112 = v17;
    v113 = v19;
    v114 = v39;
    v115 = v38;
    v123 = v58 > 2.22044605e-16;
    v116 = v54;
    v124 = (char)v32;
    v107 = v99;
    v117 = v91;
    v118 = v61;
    v125 = v64;
    v126 = v66;
    v127 = v71;
    v108 = v102;
    v128 = v74;
    v109 = v103;
    v119 = v98;
    v120 = v69;
    v104[0] = MEMORY[0x1E0C809B0];
    v104[1] = 3221225472;
    v104[2] = __96__SBHWidgetStackViewController__updateBackgroundViewWithAnimationUpdateMode_allowingOutsetting___block_invoke_2;
    v104[3] = &unk_1E8D888B0;
    v104[4] = self;
    v77 = v76;
    v67 = v102;
    objc_msgSend(v77, "sb_animateWithSettings:mode:animations:completion:", animationSettings, v92, v105, v104);

  }
  -[BSUIScrollView bounds](self->_scrollView, "bounds");
  if (v79 != v97 || v78 != v96)
  {
    -[BSUIScrollView bounds](self->_scrollView, "bounds");
    -[BSUIScrollView setBounds:](self->_scrollView, "setBounds:");
  }
  -[SBHWidgetStackViewController _scrollViewContentSize](self, "_scrollViewContentSize");
  v81 = v80;
  v83 = v82;
  -[BSUIScrollView contentSize](self->_scrollView, "contentSize");
  if (v85 != v81 || v84 != v83)
  {
    -[BSUIScrollView setContentSize:](self->_scrollView, "setContentSize:", v81, v83);
    scrollView = self->_scrollView;
    -[SBHWidgetStackViewController _restingContentOffset](self, "_restingContentOffset");
    -[BSUIScrollView setContentOffset:](scrollView, "setContentOffset:");
  }
  v87 = -[SBLeafIcon iconDataSourceCount](self->_icon, "iconDataSourceCount");
  if (v87 > 1 != -[BSUIScrollView isScrollEnabled](self->_scrollView, "isScrollEnabled"))
    -[BSUIScrollView setScrollEnabled:](self->_scrollView, "setScrollEnabled:", v87 > 1);
  -[SBHWidgetStackViewController _configureBackgroundViewIfNecessary](self, "_configureBackgroundViewIfNecessary");
  SBLogWidgets();
  v88 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v88))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CFEF3000, v88, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_LAYOUT_STACK_BACKGROUND", " isAnimation=YES ", buf, 2u);
  }

}

uint64_t __96__SBHWidgetStackViewController__updateBackgroundViewWithAnimationUpdateMode_allowingOutsetting___block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = result;
  if (*(_BYTE *)(result + 152))
    result = objc_msgSend(*(id *)(result + 32), "setCenter:", *(double *)(result + 64), *(double *)(result + 72));
  if (*(_BYTE *)(v1 + 153))
    result = objc_msgSend(*(id *)(v1 + 32), "setBounds:", *(double *)(v1 + 80), *(double *)(v1 + 88), *(double *)(v1 + 96), *(double *)(v1 + 104));
  if (*(_BYTE *)(v1 + 154))
    result = objc_msgSend(*(id *)(v1 + 32), "_setContinuousCornerRadius:", *(double *)(v1 + 112));
  if (*(_BYTE *)(v1 + 155))
    result = objc_msgSend(*(id *)(v1 + 40), "setCenter:", *(double *)(v1 + 120), *(double *)(v1 + 128));
  if (*(_BYTE *)(v1 + 156))
    result = objc_msgSend(*(id *)(v1 + 40), "setBounds:", *(double *)(v1 + 80), *(double *)(v1 + 88), *(double *)(v1 + 96), *(double *)(v1 + 104));
  if (*(_BYTE *)(v1 + 157))
    result = objc_msgSend(*(id *)(v1 + 40), "_setContinuousCornerRadius:", *(double *)(v1 + 112));
  if (*(_BYTE *)(v1 + 158))
    result = objc_msgSend(*(id *)(v1 + 48), "_setContinuousCornerRadius:", *(double *)(v1 + 112));
  if (*(_BYTE *)(v1 + 159))
    return objc_msgSend(*(id *)(v1 + 56), "setCenter:", *(double *)(v1 + 136), *(double *)(v1 + 144));
  return result;
}

uint64_t __96__SBHWidgetStackViewController__updateBackgroundViewWithAnimationUpdateMode_allowingOutsetting___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_decrementBackgroundAnimationCount");
}

- (void)_updatePageControlWithAnimationUpdateMode:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  int64_t v12;
  UIPageControl *v13;
  _BOOL4 v14;
  _BOOL4 v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  BOOL v36;
  NSInteger v37;
  BOOL v38;
  UIPageControl *pageControl;
  BOOL v40;
  BOOL v41;
  NSObject *p_super;
  SBFFluidBehaviorSettings *animationSettings;
  void *v44;
  NSObject *v45;
  _QWORD v46[4];
  UIPageControl *v47;
  unint64_t v48;
  CGFloat v49;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;
  CGAffineTransform v53;
  double v54;
  double v55;
  BOOL v56;
  BOOL v57;
  BOOL v58;
  BOOL v59;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform buf;
  uint64_t v63;
  CGRect v64;
  CGRect v65;

  v63 = *MEMORY[0x1E0C80C00];
  if (-[SBHWidgetStackViewController _appearState](self, "_appearState"))
  {
    SBLogWidgets();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v5))
    {
      v6 = (void *)MEMORY[0x1E0CB3940];
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      SBStringFromAnimationUpdateMode();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", CFSTR("<%@: %p updateMode: %@>"), v8, self, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.a) = 138543362;
      *(_QWORD *)((char *)&buf.a + 4) = v10;
      _os_signpost_emit_with_name_impl(&dword_1CFEF3000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_LAYOUT_STACK_PAGE_CONTROL", "updateMode=%{public}@", (uint8_t *)&buf, 0xCu);

    }
    v11 = -[SBLeafIcon iconDataSourceCount](self->_icon, "iconDataSourceCount");
    if (v11 == -[UIPageControl numberOfPages](self->_pageControl, "numberOfPages"))
      v12 = a3;
    else
      v12 = 2;
    v13 = self->_pageControl;
    v14 = -[SBHWidgetStackViewController _pageControlIsHorizontallyConstrained](self, "_pageControlIsHorizontallyConstrained");
    v15 = -[SBHWidgetStackViewController _alwaysShowStackBorder](self, "_alwaysShowStackBorder");
    -[SBHWidgetStackViewController view](self, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bounds");
    v18 = v17;
    v20 = v19;

    v21 = *MEMORY[0x1E0C9D538];
    v22 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    -[UIPageControl sizeForNumberOfPages:](v13, "sizeForNumberOfPages:", v11);
    v24 = v23;
    v26 = v25;
    v27 = v23 * 0.25;
    v28 = 0.0;
    v29 = 3.0;
    if (!v15)
      v29 = 0.0;
    v30 = v29 + v27;
    if (v14)
      v28 = 2.0;
    v31 = v30 - v28;
    if (objc_msgSend((id)*MEMORY[0x1E0DC4730], "userInterfaceLayoutDirection") == 1)
      v32 = -v31;
    else
      v32 = v18 + v31;
    v33 = v20 * 0.5;
    memset(&buf, 0, sizeof(buf));
    CGAffineTransformMakeScale(&buf, 0.65, 0.65);
    -[UIPageControl center](self->_pageControl, "center");
    v36 = v33 != v35 || v32 != v34;
    v37 = -[UIPageControl numberOfPages](self->_pageControl, "numberOfPages");
    v38 = v37 != v11;
    pageControl = self->_pageControl;
    if (pageControl)
      -[UIPageControl transform](pageControl, "transform");
    else
      memset(&t2, 0, sizeof(t2));
    t1 = buf;
    v40 = !CGAffineTransformEqualToTransform(&t1, &t2);
    -[UIPageControl bounds](v13, "bounds");
    v65.origin.x = v21;
    v65.origin.y = v22;
    v65.size.width = v24;
    v65.size.height = v26;
    v41 = !CGRectEqualToRect(v64, v65);
    if (v36 || v37 != v11 || v40 || v41)
    {
      animationSettings = self->_animationSettings;
      v44 = (void *)MEMORY[0x1E0DC3F10];
      v46[0] = MEMORY[0x1E0C809B0];
      v46[1] = 3221225472;
      v46[2] = __74__SBHWidgetStackViewController__updatePageControlWithAnimationUpdateMode___block_invoke;
      v46[3] = &unk_1E8D8C170;
      v56 = v38;
      v47 = v13;
      v48 = v11;
      v57 = v41;
      v49 = v21;
      v50 = v22;
      v51 = v24;
      v52 = v26;
      v58 = v40;
      v53 = buf;
      v59 = v36;
      v54 = v32;
      v55 = v33;
      objc_msgSend(v44, "sb_animateWithSettings:mode:animations:completion:", animationSettings, v12, v46, 0);
      SBLogWidgets();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v45))
      {
        LOWORD(t1.a) = 0;
        _os_signpost_emit_with_name_impl(&dword_1CFEF3000, v45, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_LAYOUT_STACK_PAGE_CONTROL", " isAnimation=YES ", (uint8_t *)&t1, 2u);
      }

      p_super = &v47->super.super.super.super;
    }
    else
    {
      SBLogWidgets();
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(p_super))
      {
        LOWORD(t1.a) = 0;
        _os_signpost_emit_with_name_impl(&dword_1CFEF3000, p_super, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_LAYOUT_STACK_PAGE_CONTROL", " isAnimation=YES ", (uint8_t *)&t1, 2u);
      }
    }

  }
}

uint64_t __74__SBHWidgetStackViewController__updatePageControlWithAnimationUpdateMode___block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  _OWORD v5[3];

  if (*(_BYTE *)(a1 + 144))
    objc_msgSend(*(id *)(a1 + 32), "setNumberOfPages:", *(_QWORD *)(a1 + 40));
  if (*(_BYTE *)(a1 + 145))
    objc_msgSend(*(id *)(a1 + 32), "setBounds:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  if (*(_BYTE *)(a1 + 146))
  {
    v2 = *(void **)(a1 + 32);
    v3 = *(_OWORD *)(a1 + 96);
    v5[0] = *(_OWORD *)(a1 + 80);
    v5[1] = v3;
    v5[2] = *(_OWORD *)(a1 + 112);
    objc_msgSend(v2, "setTransform:", v5);
  }
  if (*(_BYTE *)(a1 + 147))
    objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 128), *(double *)(a1 + 136));
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (id)_effectiveWidgetContainerViewControllers
{
  return -[SBHWidgetStackViewController _widgetContainerViewControllersForListLayoutProvider:](self, "_widgetContainerViewControllersForListLayoutProvider:", self->_listLayoutProvider);
}

- (id)_widgetContainerViewControllersForListLayoutProvider:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *widgetContainerViewControllersForLayoutOptions;
  void *v7;
  void *v8;

  v4 = a3;
  if (!self->_widgetContainerViewControllersForLayoutOptions)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    widgetContainerViewControllersForLayoutOptions = self->_widgetContainerViewControllersForLayoutOptions;
    self->_widgetContainerViewControllersForLayoutOptions = v5;

  }
  _SBHLayoutOptionsKeyTypeForListLayoutProvider(v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_widgetContainerViewControllersForLayoutOptions, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](self->_widgetContainerViewControllersForLayoutOptions, "setObject:forKey:", v8, v7);
  }

  return v8;
}

- (CGSize)_scrollViewContentSize
{
  double v2;
  double v3;
  double v4;
  CGSize result;

  -[SBHWidgetStackViewController _pageSize](self, "_pageSize");
  v4 = v3 * 3.0;
  result.height = v4;
  result.width = v2;
  return result;
}

- (CGPoint)_restingContentOffset
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGPoint result;

  -[SBHWidgetStackViewController _pageSize](self, "_pageSize");
  v4 = v3;
  -[SBHWidgetStackViewController _scrollViewContentSize](self, "_scrollViewContentSize");
  v6 = v4 * (double)(uint64_t)round((v5 - v4) * 0.5 / v4);
  v7 = 0.0;
  result.y = v6;
  result.x = v7;
  return result;
}

- (id)_backgroundColorForWidgetWithDistanceFromRestingContentOffset:(double)a3
{
  double v3;
  void *v4;
  void *v5;

  v3 = fmin(fmax(a3 / 60.0, 0.0), 0.3);
  if (-[SBHWidgetStackViewController _alwaysShowStackBorder](self, "_alwaysShowStackBorder"))
    v3 = v3 + 0.2;
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "colorWithAlphaComponent:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)_pageControlIsHorizontallyConstrained
{
  unint64_t v2;

  v2 = SBHScreenTypeForCurrentDevice();
  return (v2 > 0x2F) | (0x4451411uLL >> v2) & 1;
}

- (void)_setPageControlHidden:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  double v7;
  NSTimer *pageControlHidingTimer;
  NSTimer *v9;
  UIPageControl *v10;
  uint64_t v11;
  void *v12;
  SBFFluidBehaviorSettings *animationSettings;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  UIPageControl *v18;
  double v19;

  v4 = a4;
  if (-[SBHWidgetStackViewController _alwaysShowStackPageControl](self, "_alwaysShowStackPageControl")
    || (v7 = 0.0, !a3))
  {
    pageControlHidingTimer = self->_pageControlHidingTimer;
    v7 = 1.0;
    if (pageControlHidingTimer)
    {
      -[NSTimer invalidate](pageControlHidingTimer, "invalidate");
      v9 = self->_pageControlHidingTimer;
      self->_pageControlHidingTimer = 0;

    }
  }
  v10 = self->_pageControl;
  -[UIPageControl alpha](v10, "alpha");
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    if (v4)
      v11 = 3;
    else
      v11 = 2;
    v12 = (void *)MEMORY[0x1E0DC3F10];
    animationSettings = self->_animationSettings;
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __63__SBHWidgetStackViewController__setPageControlHidden_animated___block_invoke;
    v17 = &unk_1E8D84C78;
    v18 = v10;
    v19 = v7;
    objc_msgSend(v12, "sb_animateWithSettings:mode:animations:completion:", animationSettings, v11, &v14, 0);
    -[SBHWidgetStackViewController _layoutWithAnimationUpdateMode:](self, "_layoutWithAnimationUpdateMode:", v11, v14, v15, v16, v17);

  }
}

uint64_t __63__SBHWidgetStackViewController__setPageControlHidden_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", *(double *)(a1 + 40));
}

- (void)_restartPageControlTimer
{
  -[SBHWidgetStackViewController _restartPageControlTimerWithTimeInterval:](self, "_restartPageControlTimerWithTimeInterval:", 0.8);
}

- (void)_restartPageControlTimerWithTimeInterval:(double)a3
{
  NSTimer *pageControlHidingTimer;
  NSTimer *v6;
  void *v7;
  NSTimer *v8;
  NSTimer *v9;
  _QWORD v10[4];
  id v11;
  id location;

  pageControlHidingTimer = self->_pageControlHidingTimer;
  if (pageControlHidingTimer)
  {
    -[NSTimer invalidate](pageControlHidingTimer, "invalidate");
    v6 = self->_pageControlHidingTimer;
    self->_pageControlHidingTimer = 0;

  }
  objc_initWeak(&location, self);
  v7 = (void *)MEMORY[0x1E0C99E88];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __73__SBHWidgetStackViewController__restartPageControlTimerWithTimeInterval___block_invoke;
  v10[3] = &unk_1E8D88690;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v7, "scheduledTimerWithTimeInterval:repeats:block:", 0, v10, a3);
  v8 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  v9 = self->_pageControlHidingTimer;
  self->_pageControlHidingTimer = v8;

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __73__SBHWidgetStackViewController__restartPageControlTimerWithTimeInterval___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "setShowStackBorderWhenShowingPageControl:", 0);
    objc_msgSend(v3, "_setPageControlHidden:animated:", 1, 1);
    objc_msgSend(v3, "pageControlHidingTimer");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "invalidate");

    objc_msgSend(v3, "setPageControlHidingTimer:", 0);
    WeakRetained = v3;
  }

}

- (int64_t)_newActiveWidgetIndexForContentOffset:(CGPoint)a3
{
  double y;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  int64_t v12;
  int64_t v13;

  y = a3.y;
  -[SBHWidgetStackViewController _pageSize](self, "_pageSize", a3.x);
  v6 = v5;
  -[SBHWidgetStackViewController _restingContentOffset](self, "_restingContentOffset");
  v8 = (y - v7) / v6;
  -[SBLeafIcon iconDataSources](self->_icon, "iconDataSources");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "indexOfObject:", self->_activeWidget);

  v11 = (uint64_t)(round(v8) + (double)v10);
  v12 = -[SBLeafIcon iconDataSourceCount](self->_icon, "iconDataSourceCount");
  if (v12 <= v11)
    v13 = 0;
  else
    v13 = v11;
  if (v11 >= 0)
    return v13;
  else
    return v12 - 1;
}

- (void)_updateActiveWidgetIndexAndScrollViewContentOffset
{
  double v3;
  long double v4;
  unint64_t v5;
  unint64_t v6;
  SBLeafIconDataSource *v7;
  SBLeafIconDataSource *activeWidget;
  double v9;
  long double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  id v19;

  -[BSUIScrollView contentOffset](self->_scrollView, "contentOffset");
  v4 = v3;
  v5 = -[SBHWidgetStackViewController _newActiveWidgetIndexForContentOffset:](self, "_newActiveWidgetIndexForContentOffset:");
  -[SBLeafIcon iconDataSources](self->_icon, "iconDataSources");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v19, "count");
  if (v5 < v6)
  {
    objc_msgSend(v19, "objectAtIndex:", v5);
    v7 = (SBLeafIconDataSource *)objc_claimAutoreleasedReturnValue();
    activeWidget = self->_activeWidget;
    self->_activeWidget = v7;

  }
  if (-[UIPageControl numberOfPages](self->_pageControl, "numberOfPages") != v6)
    -[UIPageControl setNumberOfPages:](self->_pageControl, "setNumberOfPages:", v6);
  if (-[UIPageControl currentPage](self->_pageControl, "currentPage") != v5)
    -[UIPageControl setCurrentPage:](self->_pageControl, "setCurrentPage:", v5);
  -[SBHWidgetStackViewController _pageSize](self, "_pageSize");
  v10 = v9;
  -[SBHWidgetStackViewController _restingContentOffset](self, "_restingContentOffset");
  v12 = v11;
  v14 = v13;
  v15 = fmod(v4, v10);
  v16 = 0.0;
  if (v15 > v10 * 0.5)
    v16 = v10;
  -[BSUIScrollView setContentOffset:](self->_scrollView, "setContentOffset:", v12, v14 + v15 - v16);
  -[SBHWidgetStackViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setNeedsLayout");

  if ((-[BSUIScrollView isScrollAnimating](self->_scrollView, "isScrollAnimating") & 1) == 0)
  {
    -[SBHWidgetStackViewController delegate](self, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v18, "widgetStackViewController:didActivateDataSource:fromUserInteraction:", self, self->_activeWidget, -[BSUIScrollView isTracking](self->_scrollView, "isTracking"));

  }
}

- (void)_incrementWidgetScaleAnimationCount
{
  unint64_t widgetScaleAnimationCount;

  widgetScaleAnimationCount = self->_widgetScaleAnimationCount;
  self->_widgetScaleAnimationCount = widgetScaleAnimationCount + 1;
  if (!widgetScaleAnimationCount)
  {
    -[SBHWidgetStackViewController _updateWidgetViewClippingAndBackgroundView](self, "_updateWidgetViewClippingAndBackgroundView");
    -[SBHWidgetStackViewController _updateWidgetViewHitTesting](self, "_updateWidgetViewHitTesting");
    -[SBHWidgetStackViewController _updateScrollViewDelaysContentTouches](self, "_updateScrollViewDelaysContentTouches");
  }
}

- (void)_decrementWidgetScaleAnimationCount
{
  unint64_t widgetScaleAnimationCount;
  unint64_t v4;

  widgetScaleAnimationCount = self->_widgetScaleAnimationCount;
  if (widgetScaleAnimationCount)
  {
    v4 = widgetScaleAnimationCount - 1;
    self->_widgetScaleAnimationCount = v4;
    if (!v4)
    {
      -[SBHWidgetStackViewController _updateWidgetViewClippingAndBackgroundView](self, "_updateWidgetViewClippingAndBackgroundView");
      -[SBHWidgetStackViewController _updateWidgetViewHitTesting](self, "_updateWidgetViewHitTesting");
      -[SBHWidgetStackViewController _updateScrollViewDelaysContentTouches](self, "_updateScrollViewDelaysContentTouches");
    }
  }
}

- (void)_incrementWidgetSnapshotAnimationCount
{
  ++self->_widgetSnapshotAnimationCount;
}

- (void)_decrementWidgetSnapshotAnimationCount
{
  unint64_t widgetSnapshotAnimationCount;

  widgetSnapshotAnimationCount = self->_widgetSnapshotAnimationCount;
  if (widgetSnapshotAnimationCount)
    self->_widgetSnapshotAnimationCount = widgetSnapshotAnimationCount - 1;
}

- (void)_incrementBackgroundAnimationCount
{
  unint64_t backgroundAnimationCount;

  backgroundAnimationCount = self->_backgroundAnimationCount;
  self->_backgroundAnimationCount = backgroundAnimationCount + 1;
  if (!backgroundAnimationCount)
  {
    -[SBHWidgetStackViewController _updateWidgetViewClippingAndBackgroundView](self, "_updateWidgetViewClippingAndBackgroundView");
    -[SBHWidgetStackViewController _updateWidgetViewHitTesting](self, "_updateWidgetViewHitTesting");
  }
}

- (void)_decrementBackgroundAnimationCount
{
  unint64_t backgroundAnimationCount;
  unint64_t v4;

  backgroundAnimationCount = self->_backgroundAnimationCount;
  if (backgroundAnimationCount)
  {
    v4 = backgroundAnimationCount - 1;
    self->_backgroundAnimationCount = v4;
    if (!v4)
    {
      -[SBHWidgetStackViewController _updateWidgetViewClippingAndBackgroundView](self, "_updateWidgetViewClippingAndBackgroundView");
      -[SBHWidgetStackViewController _updateWidgetViewHitTesting](self, "_updateWidgetViewHitTesting");
    }
  }
}

- (void)_updateWidgetViewClippingAndBackgroundView
{
  id WeakRetained;
  BOOL v4;
  NSObject *v5;
  uint64_t v6;
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL4 v9;
  _BOOL4 v10;
  uint64_t v11;
  NSObject *v12;
  uint8_t v13[16];
  uint8_t buf[16];

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  if (-[NSHashTable count](self->_imageUpdateDisableAssertions, "count"))
    v4 = 1;
  else
    v4 = WeakRetained == 0;
  if (!v4)
  {
    SBLogWidgets();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CFEF3000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_LAYOUT_STACK_WIDGET_VIEWS_CLIPPING_AND_BACKGROUND_VIEW", " isAnimation=YES ", buf, 2u);
    }

    if (self->_widgetScaleAnimationCount
      || self->_backgroundAnimationCount
      || -[BSUIScrollView isScrolling](self->_scrollView, "isScrolling")
      || self->_overlapping
      || -[SBHWidgetStackViewController _alwaysShowStackBorder](self, "_alwaysShowStackBorder")
      || -[SBHWidgetStackViewController _insetWidgetsForTrackingAppearance](self, "_insetWidgetsForTrackingAppearance"))
    {
      -[SBHWidgetStackViewController _createBackgroundViewIfNecessary:](self, "_createBackgroundViewIfNecessary:", 1);
      v6 = 0;
    }
    else
    {
      v6 = 1;
    }
    v7 = -[SBHWidgetStackViewController clipsWidgetsToViewBounds](self, "clipsWidgetsToViewBounds");
    v8 = -[SBHWidgetStackViewController _showAdjacentWidgets](self, "_showAdjacentWidgets");
    v9 = -[SBHWidgetStackViewController _isContentViewExtendingOutsideBounds](self, "_isContentViewExtendingOutsideBounds");
    if (v7)
    {
      if (self->_widgetSnapshotAnimationCount)
        v10 = 0;
      else
        v10 = v9;
      v11 = v8 | v10;
    }
    else
    {
      v11 = 0;
    }
    -[UIView setClipsToBounds:](self->_containerView, "setClipsToBounds:", v11);
    -[UIView setHidden:](self->_backgroundView, "setHidden:", v6);
    SBLogWidgets();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v12))
    {
      *(_WORD *)v13 = 0;
      _os_signpost_emit_with_name_impl(&dword_1CFEF3000, v12, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_LAYOUT_STACK_WIDGET_VIEWS_CLIPPING_AND_BACKGROUND_VIEW", " isAnimation=YES ", v13, 2u);
    }

  }
}

+ (BOOL)_shouldDrawSystemBackgroundMaterialForWidget:(id)a3 widgetViewController:(id)a4
{
  id v5;
  id v6;
  BOOL v7;
  char v9;
  void *v10;
  char isKindOfClass;

  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v9 = objc_msgSend(v6, "isTransparent");
LABEL_11:
            v7 = v9;
            goto LABEL_5;
          }
        }
        else
        {
          objc_opt_self();
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
          {
            v9 = objc_msgSend(v6, "usesSystemBackgroundMaterial");
            goto LABEL_11;
          }
        }
        v7 = 0;
        goto LABEL_5;
      }
    }
  }
  v7 = 1;
LABEL_5:

  return v7;
}

- (BOOL)_shouldDrawSystemBackgroundMaterialForWidget:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  char v14;

  v4 = a3;
  -[SBHWidgetStackViewController _effectiveWidgetContainerViewControllers](self, "_effectiveWidgetContainerViewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "widgetViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_class();
  v10 = v8;
  if (v9)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
  }
  else
  {
    v11 = 0;
  }
  v12 = v11;

  objc_msgSend(v12, "multiplexedViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend((id)objc_opt_class(), "_shouldDrawSystemBackgroundMaterialForWidget:widgetViewController:", v4, v13);
  return v14;
}

- (void)_configureBackgroundViewIfNecessary
{
  -[SBHWidgetStackViewController _configureBackgroundViewIfNecessary:](self, "_configureBackgroundViewIfNecessary:", self->_backgroundView);
}

- (void)_configureBackgroundViewIfNecessary:(id)a3
{
  id v4;
  void (**backgroundViewConfigurator)(void);
  id v6;

  v4 = a3;
  if (v4)
  {
    backgroundViewConfigurator = (void (**)(void))self->_backgroundViewConfigurator;
    if (backgroundViewConfigurator)
    {
      if (self->_activeWidget)
      {
        v6 = v4;
        backgroundViewConfigurator[2]();
        v4 = v6;
      }
    }
  }

}

- (void)_updateWidgetViewHitTesting
{
  NSObject *v3;
  _BOOL8 v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[8];
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  SBLogWidgets();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CFEF3000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_LAYOUT_STACK_UPDATE_WIDGET_VIEW_HIT_TESTING", " isAnimation=YES ", buf, 2u);
  }

  v4 = -[SBHWidgetStackViewController isWidgetHitTestingDisabled](self, "isWidgetHitTestingDisabled");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[SBHWidgetStackViewController _effectiveWidgetContainerViewControllers](self, "_effectiveWidgetContainerViewControllers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "view");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "bs_setHitTestingDisabled:", v4);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v8);
  }

  SBLogWidgets();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CFEF3000, v12, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_LAYOUT_STACK_UPDATE_WIDGET_VIEW_HIT_TESTING", " isAnimation=YES ", buf, 2u);
  }

}

- (void)_updateWidgetViewEdgeAntialiasing
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  int v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  NSObject *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[16];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  SBLogWidgets();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CFEF3000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_LAYOUT_STACK_UPDATE_WIDGET_VIEW_EDGE_ANTIALIASING", " isAnimation=YES ", buf, 2u);
  }

  v4 = self->_editing || self->_forcesEdgeAntialiasing;
  if (!self->_forcesEdgeAntialiasing)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[SBLeafIcon iconDataSources](self->_icon, "iconDataSources");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v19 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v11 = objc_msgSend(v10, "iconSupportsRasterization:", self->_icon);
          else
            v11 = 1;
          v4 = v4 & v11 & self->_editing & !-[SBHWidgetStackViewController _shouldDrawSystemBackgroundMaterialForWidget:](self, "_shouldDrawSystemBackgroundMaterialForWidget:", v10);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v7);
    }

  }
  -[SBHWidgetStackViewController traitCollection](self, "traitCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "displayScale");
  v14 = v13;

  -[SBHWidgetStackViewController containerView](self, "containerView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setAllowsEdgeAntialiasing:", v4);
  objc_msgSend(v16, "setShouldRasterize:", v4);
  objc_msgSend(v16, "setRasterizationScale:", v14);
  SBLogWidgets();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CFEF3000, v17, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_LAYOUT_STACK_UPDATE_WIDGET_VIEW_EDGE_ANTIALIASING", " isAnimation=YES ", buf, 2u);
  }

}

- (void)_updateWidgetViewStyleConfiguration
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[SBHWidgetStackViewController _effectiveWidgetContainerViewControllers](self, "_effectiveWidgetContainerViewControllers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "updateStyleConfiguration");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)_updateScrollViewDelaysContentTouches
{
  _BOOL8 v3;

  objc_opt_class();
  v3 = (objc_opt_isKindOfClass() & 1) == 0
    || -[BSUIScrollView isScrolling](self->_scrollView, "isScrolling")
    || self->_widgetScaleAnimationCount != 0;
  -[BSUIScrollView setDelaysContentTouches:](self->_scrollView, "setDelaysContentTouches:", v3);
}

- (void)_updatePresentationModeForWidgetViewControllers
{
  void *v3;
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
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[SBHWidgetStackViewController _effectiveWidgetContainerViewControllers](self, "_effectiveWidgetContainerViewControllers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
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
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setPresentationMode:", self->_presentationMode);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)_updateShowsSnapshotWhenDeactivatedForWidgetViewControllers
{
  void *v3;
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
  if (!self->_widgetSnapshotAnimationCount)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    -[SBHWidgetStackViewController _effectiveWidgetContainerViewControllers](self, "_effectiveWidgetContainerViewControllers", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "allValues");
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
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setShowsSnapshotWhenDeactivated:", self->_showsSnapshotWhenDeactivated);
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

  }
}

- (void)_updateApproximateLayoutPositionForWidgetViewControllers
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = -[SBHWidgetStackViewController approximateLayoutPosition](self, "approximateLayoutPosition");
  v5 = v4;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[SBHWidgetStackViewController _effectiveWidgetContainerViewControllers](self, "_effectiveWidgetContainerViewControllers", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "setApproximateLayoutPosition:", v3, v5);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (BOOL)_showAdjacentWidgets
{
  return -[BSUIScrollView isScrolling](self->_scrollView, "isScrolling");
}

- (BOOL)_isContentViewExtendingOutsideBounds
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  -[SBHWidgetStackViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayScale");

  -[SBHWidgetStackViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");

  -[SBHWidgetStackViewController iconImageInfo](self, "iconImageInfo");
  BSRectWithSize();
  UIRectIntegralWithScale();
  v6 = v5;
  v8 = v7;
  UIRectIntegralWithScale();
  return v10 > v6 || v9 > v8;
}

- (BOOL)_isScrollViewTracking
{
  if (self->_alwaysShowsAsStack)
    return 1;
  else
    return -[BSUIScrollView isTracking](self->_scrollView, "isTracking");
}

- (BOOL)_insetWidgetsForTrackingAppearance
{
  void *v3;
  _BOOL4 alwaysShowsAsStack;

  -[SBHWidgetStackViewController icon](self, "icon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isWidgetStackIcon") & 1) != 0)
  {

  }
  else
  {
    alwaysShowsAsStack = self->_alwaysShowsAsStack;

    if (!alwaysShowsAsStack)
      return 0;
  }
  return (-[BSUIScrollView isTracking](self->_scrollView, "isTracking") & 1) != 0 || self->_alwaysShowsAsStack;
}

- (BOOL)_alwaysShowStackBorder
{
  void *v3;
  _BOOL4 alwaysShowsAsStack;

  -[SBHWidgetStackViewController icon](self, "icon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isWidgetStackIcon") & 1) != 0)
  {

  }
  else
  {
    alwaysShowsAsStack = self->_alwaysShowsAsStack;

    if (!alwaysShowsAsStack)
      return 0;
  }
  if (-[SBHWidgetSettings stackAlwaysShowsBorder](self->_widgetSettings, "stackAlwaysShowsBorder")
    || -[SBHWidgetStackViewController _insetWidgetsForTrackingAppearance](self, "_insetWidgetsForTrackingAppearance")
    || self->_editing
    || self->_showingContextMenu)
  {
    return 1;
  }
  if (self->_showStackBorderWhenShowingPageControl)
  {
    -[UIPageControl alpha](self->_pageControl, "alpha");
    return BSFloatIsOne();
  }
  return 0;
}

- (BOOL)_alwaysShowStackPageControl
{
  return self->_alwaysShowsAsStack
      || -[SBHWidgetSettings stackAlwaysShowsPageControl](self->_widgetSettings, "stackAlwaysShowsPageControl")
      || self->_editing
      || self->_showingContextMenu;
}

- (void)_flashPageControlAnimated:(BOOL)a3
{
  -[SBHWidgetStackViewController flashPageControlAnimated:withTimeInterval:](self, "flashPageControlAnimated:withTimeInterval:", a3, 0.8);
}

- (void)_updateAccessibilityValue
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  objc_class *v11;
  void *v12;
  UIView *containerView;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[SBHWidgetStackViewController icon](self, "icon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isWidgetStackIcon"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(v3, "iconDataSources");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v18 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "icon:displayNameForLocation:", v3, CFSTR("SBIconLocationRoot"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            objc_msgSend(v4, "addObject:", v10);
          }
          else
          {
            v11 = (objc_class *)objc_opt_class();
            NSStringFromClass(v11);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v12);

          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v7);
    }

    containerView = self->_containerView;
    v14 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v4, "componentsJoinedByString:", CFSTR(","));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("widget-stack:<%@>"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setAccessibilityIdentifier:](containerView, "setAccessibilityIdentifier:", v16);

  }
}

- (void)_handleInstalledAppsChanged:(id)a3
{
  void *v4;
  void *v5;
  id WeakRetained;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("SBInstalledApplicationsUpdatedBundleIDs"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  -[SBLeafIcon iconDataSources](self->_icon, "iconDataSources");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v20 = v7;
    obj = v7;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v24;
      do
      {
        v11 = 0;
        v21 = v9;
        do
        {
          if (*(_QWORD *)v24 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v11);
          objc_msgSend(WeakRetained, "widgetStackViewController:containerBundleIdentifierForDataSource:", self, v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13 && objc_msgSend(v5, "containsObject:", v13))
          {
            objc_msgSend(v12, "uniqueIdentifier");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[SBHWidgetStackViewController _effectiveWidgetContainerViewControllers](self, "_effectiveWidgetContainerViewControllers");
            v15 = v10;
            v16 = WeakRetained;
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "objectForKey:", v14);
            v18 = v5;
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            WeakRetained = v16;
            v10 = v15;
            objc_msgSend(v19, "setBlockedForScreenTimeExpiration:", objc_msgSend(WeakRetained, "widgetStackViewController:isDataSourceBlockedForScreenTimeExpiration:", self, v12));

            v5 = v18;
            v9 = v21;

          }
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v9);
    }

    v7 = v20;
  }

}

- (id)_widgetWithUniqueIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[SBLeafIcon iconDataSources](self->_icon, "iconDataSources");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__SBHWidgetStackViewController__widgetWithUniqueIdentifier___block_invoke;
  v9[3] = &unk_1E8D8AE40;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "bs_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __60__SBHWidgetStackViewController__widgetWithUniqueIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)_logAllViewControllers
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1CFEF3000, log, OS_LOG_TYPE_DEBUG, "[ViewControllerDebug] Beginning view controller enumeration ------------------------------------------", v1, 2u);
}

void __54__SBHWidgetStackViewController__logAllViewControllers__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;

  v4 = a2;
  v5 = a3;
  SBLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    __54__SBHWidgetStackViewController__logAllViewControllers__block_invoke_cold_1(v4, v6);

  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_105);
}

void __54__SBHWidgetStackViewController__logAllViewControllers__block_invoke_104(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;

  v2 = a2;
  SBLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __54__SBHWidgetStackViewController__logAllViewControllers__block_invoke_104_cold_1((uint64_t)v2, v3, v4);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8;

  v8 = a4;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("alpha")))
  {
    objc_msgSend(v8, "alpha");
    if (BSFloatIsZero())
    {
      self->_flashPageControlOnNextAlphaChange = 1;
    }
    else if (self->_flashPageControlOnNextAlphaChange)
    {
      -[SBHWidgetStackViewController _flashPageControlAnimated:](self, "_flashPageControlAnimated:", 1);
    }
  }

}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  if (self->_widgetSettings == a3)
  {
    -[SBHWidgetStackViewController _layoutWithAnimationUpdateMode:](self, "_layoutWithAnimationUpdateMode:", 2, a4);
    -[SBHWidgetStackViewController _flashPageControlAnimated:](self, "_flashPageControlAnimated:", 1);
  }
}

- (void)_setupStateCapture
{
  id v3;
  objc_class *v4;
  void *v5;
  BSInvalidatable *v6;
  BSInvalidatable *stateCaptureInvalidatable;
  id v8;
  id location;

  if (!self->_stateCaptureInvalidatable)
  {
    objc_initWeak(&location, self);
    v3 = MEMORY[0x1E0C80D38];
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_copyWeak(&v8, &location);
    BSLogAddStateCaptureBlockWithTitle();
    v6 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    stateCaptureInvalidatable = self->_stateCaptureInvalidatable;
    self->_stateCaptureInvalidatable = v6;

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

__CFString *__50__SBHWidgetStackViewController__setupStateCapture__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;
  __CFString *v4;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  id v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", WeakRetained);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x1E0C809B0];
    v7 = 3221225472;
    v8 = __50__SBHWidgetStackViewController__setupStateCapture__block_invoke_2;
    v9 = &unk_1E8D84EF0;
    v10 = v2;
    v11 = WeakRetained;
    v3 = v2;
    objc_msgSend(v3, "appendBodySectionWithName:multilinePrefix:block:", 0, 0, &v6);
    objc_msgSend(v3, "build", v6, v7, v8, v9);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = &stru_1E8D8E958;
  }

  return v4;
}

void __50__SBHWidgetStackViewController__setupStateCapture__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "widgetIcon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "appendObject:withName:", v3, CFSTR("widgetIcon"));

  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "viewIfLoaded");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v5, "appendBool:withName:", objc_msgSend(v6, "isHidden"), CFSTR("viewIsHidden"));

  v8 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "widgetViewControllers");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v8, "sbh_appendDescriptionsForViewControllers:", v10);

}

- (void)_teardownStateCapture
{
  BSInvalidatable *stateCaptureInvalidatable;
  BSInvalidatable *v4;

  stateCaptureInvalidatable = self->_stateCaptureInvalidatable;
  if (stateCaptureInvalidatable)
  {
    -[BSInvalidatable invalidate](stateCaptureInvalidatable, "invalidate");
    v4 = self->_stateCaptureInvalidatable;
    self->_stateCaptureInvalidatable = 0;

  }
}

- (SBIconImageInfo)iconImageInfo
{
  return self;
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (BOOL)isShowingContextMenu
{
  return self->_showingContextMenu;
}

- (BOOL)isOverlapping
{
  return self->_overlapping;
}

- (BOOL)isUserInteractionEnabled
{
  return self->_userInteractionEnabled;
}

- (id)backgroundViewProvider
{
  return self->_backgroundViewProvider;
}

- (id)backgroundViewConfigurator
{
  return self->_backgroundViewConfigurator;
}

- (double)brightness
{
  return self->_brightness;
}

- (BOOL)automaticallyUpdatesVisiblySettled
{
  return self->_automaticallyUpdatesVisiblySettled;
}

- (void)setAutomaticallyUpdatesVisiblySettled:(BOOL)a3
{
  self->_automaticallyUpdatesVisiblySettled = a3;
}

- (unint64_t)presentationMode
{
  return self->_presentationMode;
}

- (BOOL)showsSnapshotWhenDeactivated
{
  return self->_showsSnapshotWhenDeactivated;
}

- (unint64_t)imageViewAlignment
{
  return self->_imageViewAlignment;
}

- (unint64_t)pauseReasons
{
  return self->_pauseReasons;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
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

- (SBIconViewCustomImageViewHosting)host
{
  return (SBIconViewCustomImageViewHosting *)objc_loadWeakRetained((id *)&self->_host);
}

- (BOOL)showsSquareCorners
{
  return self->_showsSquareCorners;
}

- (BOOL)alwaysShowsAsStack
{
  return self->_alwaysShowsAsStack;
}

- (void)setAlwaysShowsAsStack:(BOOL)a3
{
  self->_alwaysShowsAsStack = a3;
}

- (BOOL)highlightsAtAnySize
{
  return self->_highlightsAtAnySize;
}

- (void)setHighlightsAtAnySize:(BOOL)a3
{
  self->_highlightsAtAnySize = a3;
}

- (BOOL)forcesEdgeAntialiasing
{
  return self->_forcesEdgeAntialiasing;
}

- (BOOL)clipsWidgetsToViewBounds
{
  return self->_clipsWidgetsToViewBounds;
}

- (void)setClipsWidgetsToViewBounds:(BOOL)a3
{
  self->_clipsWidgetsToViewBounds = a3;
}

- (int64_t)preferredDirection
{
  return self->_preferredDirection;
}

- (void)setPreferredDirection:(int64_t)a3
{
  self->_preferredDirection = a3;
}

- (BOOL)forcesVisible
{
  return self->_forcesVisible;
}

- (void)setForcesVisible:(BOOL)a3
{
  self->_forcesVisible = a3;
}

- (UIPageControl)pageControl
{
  return self->_pageControl;
}

- (void)setPageControl:(id)a3
{
  objc_storeStrong((id *)&self->_pageControl, a3);
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (SBHWidgetStackViewControllerDataSource)dataSource
{
  return (SBHWidgetStackViewControllerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (SBHWidgetStackViewControllerDelegate)delegate
{
  return (SBHWidgetStackViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SBHIconImageAppearance)overrideIconImageAppearance
{
  return self->_overrideIconImageAppearance;
}

- (SBHIconImageStyleConfiguration)overrideIconImageStyleConfiguration
{
  return self->_overrideIconImageStyleConfiguration;
}

- (SBWidgetIcon)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (SBLeafIconDataSource)activeWidget
{
  return self->_activeWidget;
}

- (void)setActiveWidget:(id)a3
{
  objc_storeStrong((id *)&self->_activeWidget, a3);
}

- (BSUIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_scrollView, a3);
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_containerView, a3);
}

- (NSTimer)pageControlHidingTimer
{
  return self->_pageControlHidingTimer;
}

- (void)setPageControlHidingTimer:(id)a3
{
  objc_storeStrong((id *)&self->_pageControlHidingTimer, a3);
}

- (UIView)dimmingView
{
  return self->_dimmingView;
}

- (void)setDimmingView:(id)a3
{
  objc_storeStrong((id *)&self->_dimmingView, a3);
}

- (BOOL)showStackBorderWhenShowingPageControl
{
  return self->_showStackBorderWhenShowingPageControl;
}

- (void)setShowStackBorderWhenShowingPageControl:(BOOL)a3
{
  self->_showStackBorderWhenShowingPageControl = a3;
}

- (BOOL)flashPageControlOnNextAppearance
{
  return self->_flashPageControlOnNextAppearance;
}

- (void)setFlashPageControlOnNextAppearance:(BOOL)a3
{
  self->_flashPageControlOnNextAppearance = a3;
}

- (BOOL)flashPageControlOnNextAlphaChange
{
  return self->_flashPageControlOnNextAlphaChange;
}

- (void)setFlashPageControlOnNextAlphaChange:(BOOL)a3
{
  self->_flashPageControlOnNextAlphaChange = a3;
}

- (NSMutableDictionary)widgetContainerViewControllersForLayoutOptions
{
  return self->_widgetContainerViewControllersForLayoutOptions;
}

- (void)setWidgetContainerViewControllersForLayoutOptions:(id)a3
{
  objc_storeStrong((id *)&self->_widgetContainerViewControllersForLayoutOptions, a3);
}

- (NSMutableDictionary)widgetContainerViewControllersToRemove
{
  return self->_widgetContainerViewControllersToRemove;
}

- (void)setWidgetContainerViewControllersToRemove:(id)a3
{
  objc_storeStrong((id *)&self->_widgetContainerViewControllersToRemove, a3);
}

- (SBIconListLayoutProvider)listLayoutProvider
{
  return self->_listLayoutProvider;
}

- (SBHWidgetSettings)widgetSettings
{
  return self->_widgetSettings;
}

- (void)setWidgetSettings:(id)a3
{
  objc_storeStrong((id *)&self->_widgetSettings, a3);
}

- (SBFFluidBehaviorSettings)animationSettings
{
  return self->_animationSettings;
}

- (void)setAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_animationSettings, a3);
}

- (unint64_t)widgetScaleAnimationCount
{
  return self->_widgetScaleAnimationCount;
}

- (void)setWidgetScaleAnimationCount:(unint64_t)a3
{
  self->_widgetScaleAnimationCount = a3;
}

- (unint64_t)backgroundAnimationCount
{
  return self->_backgroundAnimationCount;
}

- (void)setBackgroundAnimationCount:(unint64_t)a3
{
  self->_backgroundAnimationCount = a3;
}

- (unint64_t)widgetSnapshotAnimationCount
{
  return self->_widgetSnapshotAnimationCount;
}

- (void)setWidgetSnapshotAnimationCount:(unint64_t)a3
{
  self->_widgetSnapshotAnimationCount = a3;
}

- (NSHashTable)imageUpdateDisableAssertions
{
  return self->_imageUpdateDisableAssertions;
}

- (void)setImageUpdateDisableAssertions:(id)a3
{
  objc_storeStrong((id *)&self->_imageUpdateDisableAssertions, a3);
}

- (BSInvalidatable)scrollingTouchCancellationAssertion
{
  return self->_scrollingTouchCancellationAssertion;
}

- (void)setScrollingTouchCancellationAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_scrollingTouchCancellationAssertion, a3);
}

- (BSInvalidatable)imageUpdatesDisabledForContextMenuAssertion
{
  return self->_imageUpdatesDisabledForContextMenuAssertion;
}

- (void)setImageUpdatesDisabledForContextMenuAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_imageUpdatesDisabledForContextMenuAssertion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageUpdatesDisabledForContextMenuAssertion, 0);
  objc_storeStrong((id *)&self->_scrollingTouchCancellationAssertion, 0);
  objc_storeStrong((id *)&self->_imageUpdateDisableAssertions, 0);
  objc_storeStrong((id *)&self->_animationSettings, 0);
  objc_storeStrong((id *)&self->_widgetSettings, 0);
  objc_storeStrong((id *)&self->_listLayoutProvider, 0);
  objc_storeStrong((id *)&self->_widgetContainerViewControllersToRemove, 0);
  objc_storeStrong((id *)&self->_widgetContainerViewControllersForLayoutOptions, 0);
  objc_storeStrong((id *)&self->_dimmingView, 0);
  objc_storeStrong((id *)&self->_pageControlHidingTimer, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_activeWidget, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_overrideIconImageStyleConfiguration, 0);
  objc_storeStrong((id *)&self->_overrideIconImageAppearance, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_pageControl, 0);
  objc_destroyWeak((id *)&self->_host);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong(&self->_backgroundViewConfigurator, 0);
  objc_storeStrong(&self->_backgroundViewProvider, 0);
  objc_storeStrong((id *)&self->_stateCaptureInvalidatable, 0);
  objc_storeStrong((id *)&self->_containerViewControllersRequiringLayoutUponActivation, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_customImageViewObservers, 0);
}

void __54__SBHWidgetStackViewController__logAllViewControllers__block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v4 = 134217984;
  v5 = objc_msgSend(a1, "unsignedIntegerValue");
  OUTLINED_FUNCTION_4(&dword_1CFEF3000, a2, v3, "[ViewControllerDebug] layout options %lu", (uint8_t *)&v4);
}

void __54__SBHWidgetStackViewController__logAllViewControllers__block_invoke_104_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_4(&dword_1CFEF3000, a2, a3, "[ViewControllerDebug] widgetUniqueIdentifier: %@", (uint8_t *)&v3);
}

@end
