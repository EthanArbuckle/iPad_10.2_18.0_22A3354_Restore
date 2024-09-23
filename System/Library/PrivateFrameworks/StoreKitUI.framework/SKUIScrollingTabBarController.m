@implementation SKUIScrollingTabBarController

+ (BOOL)areScrollingTabsAllowed
{
  if (areScrollingTabsAllowed_sOnceToken != -1)
    dispatch_once(&areScrollingTabsAllowed_sOnceToken, &__block_literal_global_21);
  return areScrollingTabsAllowed_sAreScrollingTabsAllowed;
}

void __56__SKUIScrollingTabBarController_areScrollingTabsAllowed__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  areScrollingTabsAllowed_sAreScrollingTabsAllowed = objc_msgSend(v0, "BOOLForKey:", CFSTR("AllowsScrollingTabs"));

}

- (SKUIScrollingTabBarController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6;
  id v7;
  SKUIScrollingTabBarController *v8;
  SKUIScrollingTabBarController *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIScrollingTabBarController initWithNibName:bundle:].cold.1();
  }
  v11.receiver = self;
  v11.super_class = (Class)SKUIScrollingTabBarController;
  v8 = -[SKUIScrollingTabBarController initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, v6, v7);
  v9 = v8;
  if (v8)
  {
    v8->_chargeEnabledOnTabBarButtonsContainer = 1;
    v8->_indexOfViewControllerWithUpdatedContentSize = 0x7FFFFFFFFFFFFFFFLL;
    v8->_scrollEnabled = objc_msgSend((id)objc_opt_class(), "areScrollingTabsAllowed");
  }

  return v9;
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[SKUIScrollingTabBarController _setViewControllers:collectionViewsUpdateHandler:forFinalTearDown:](self, "_setViewControllers:collectionViewsUpdateHandler:forFinalTearDown:", 0, 0, 1);
  -[SKUIProxyScrollView setDelegate:](self->_proxyScrollView, "setDelegate:", 0);
  -[SKUIScrollingTabBarContentCollectionView setDataSource:](self->_contentCollectionView, "setDataSource:", 0);
  -[SKUIScrollingTabBarContentCollectionView setDelegate:](self->_contentCollectionView, "setDelegate:", 0);
  -[SKUICrossFadingTabBar tabBarButtons](self->_tabBar, "tabBarButtons");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)SKUIScrollingTabBarController;
  -[SKUIViewController dealloc](&v8, sel_dealloc);
}

- (id)childViewControllerForStatusBarHidden
{
  UIViewController *v3;

  v3 = self->_transientViewController;
  if (!v3)
    v3 = self->_topLevelFocusedViewController;
  return v3;
}

- (id)childViewControllerForStatusBarStyle
{
  UIViewController *v3;

  v3 = self->_transientViewController;
  if (!v3)
    v3 = self->_topLevelFocusedViewController;
  return v3;
}

- (id)presentedViewController
{
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SKUIScrollingTabBarController;
  -[SKUIScrollingTabBarController presentedViewController](&v5, sel_presentedViewController);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    if (self->_isDelegatingPresentedViewControllerLogicToSelectedViewController)
      return 0;
    self->_isDelegatingPresentedViewControllerLogicToSelectedViewController = 1;
    -[UIViewController presentedViewController](self->_topLevelFocusedViewController, "presentedViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    self->_isDelegatingPresentedViewControllerLogicToSelectedViewController = 0;
  }
  return v3;
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v3;
  id v4;
  unint64_t v5;
  objc_super v7;

  -[SKUIScrollingTabBarController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = (id)objc_msgSend(v3, "tabBarControllerSupportedInterfaceOrientations:", self);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SKUIScrollingTabBarController;
    v4 = -[SKUIViewController supportedInterfaceOrientations](&v7, sel_supportedInterfaceOrientations);
  }
  v5 = (unint64_t)v4;

  return v5;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  double Width;
  double v18;
  double Height;
  double v20;
  SKUIScrollingTabBarContentCollectionView *v21;
  SKUIScrollingTabBarContentCollectionView *contentCollectionView;
  void *v23;
  SKUIScrollingTabBarContentCollectionView *v24;
  void *v25;
  void *v26;
  UIView *v27;
  UIView *tabBarContainerView;
  SKUICrossFadingTabBar *v29;
  SKUICrossFadingTabBar *tabBar;
  void *v31;
  SKUIDynamicBarAnimator *v32;
  SKUIDynamicBarAnimator *dynamicBarAnimator;
  void *v34;
  objc_super v35;
  uint64_t v36;
  _QWORD v37[2];
  CGRect v38;
  CGRect v39;

  v37[1] = *MEMORY[0x1E0C80C00];
  v35.receiver = self;
  v35.super_class = (Class)SKUIScrollingTabBarController;
  -[SKUIScrollingTabBarController viewDidLoad](&v35, sel_viewDidLoad);
  -[SKUIScrollingTabBarController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  objc_msgSend(v3, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = objc_alloc(MEMORY[0x1E0DC3F10]);
  v14 = (void *)objc_msgSend(v13, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v14, "setHidden:", 1);
  objc_msgSend(v3, "addSubview:", v14);
  self->_contentCollectionViewItemSize.width = v10;
  self->_contentCollectionViewItemSize.height = v12;
  v15 = objc_alloc_init(MEMORY[0x1E0DC3610]);
  objc_msgSend(v15, "setScrollDirection:", 1);
  objc_msgSend(v15, "setMinimumInteritemSpacing:", 0.0);
  objc_msgSend(v15, "setMinimumLineSpacing:", 0.0);
  v36 = *MEMORY[0x1E0DC4A18];
  v37[0] = &unk_1E749B588;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_setRowAlignmentsOptions:", v16);

  v38.origin.x = v6;
  v38.origin.y = v8;
  v38.size.width = v10;
  v38.size.height = v12;
  Width = CGRectGetWidth(v38);
  if (Width >= 2.0)
    v18 = Width;
  else
    v18 = 2.0;
  v39.origin.x = v6;
  v39.origin.y = v8;
  v39.size.width = v18;
  v39.size.height = v12;
  Height = CGRectGetHeight(v39);
  if (Height >= 2.0)
    v20 = Height;
  else
    v20 = 2.0;
  v21 = -[SKUIScrollingTabBarContentCollectionView initWithFrame:collectionViewLayout:]([SKUIScrollingTabBarContentCollectionView alloc], "initWithFrame:collectionViewLayout:", v15, v6, v8, v18, v20);
  contentCollectionView = self->_contentCollectionView;
  self->_contentCollectionView = v21;

  -[SKUIScrollingTabBarContentCollectionView panGestureRecognizer](self->_contentCollectionView, "panGestureRecognizer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "_setHysteresis:", 15.0);

  -[SKUIScrollingTabBarContentCollectionView setAllowsSelection:](self->_contentCollectionView, "setAllowsSelection:", 0);
  v24 = self->_contentCollectionView;
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIScrollingTabBarContentCollectionView setBackgroundColor:](v24, "setBackgroundColor:", v25);

  -[SKUIScrollingTabBarContentCollectionView setDataSource:](self->_contentCollectionView, "setDataSource:", self);
  -[SKUIScrollingTabBarContentCollectionView setDelegate:](self->_contentCollectionView, "setDelegate:", self);
  -[SKUIScrollingTabBarContentCollectionView registerClass:forCellWithReuseIdentifier:](self->_contentCollectionView, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), 0x1E73B38F0);
  -[SKUIScrollingTabBarContentCollectionView setScrollsToTop:](self->_contentCollectionView, "setScrollsToTop:", 0);
  -[SKUIScrollingTabBarContentCollectionView setShowsHorizontalScrollIndicator:](self->_contentCollectionView, "setShowsHorizontalScrollIndicator:", 0);
  -[SKUIScrollingTabBarContentCollectionView setShowsVerticalScrollIndicator:](self->_contentCollectionView, "setShowsVerticalScrollIndicator:", 0);
  -[SKUIScrollingTabBarContentCollectionView setPagingEnabled:](self->_contentCollectionView, "setPagingEnabled:", 1);
  objc_msgSend(v3, "addSubview:", self->_contentCollectionView);
  -[SKUIScrollingTabBarController _updateHorizontalScrollingAvailability](self, "_updateHorizontalScrollingAvailability");
  -[SKUIScrollingTabBarController _tabBarBackdropGroupName](self, "_tabBarBackdropGroupName");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  tabBarContainerView = self->_tabBarContainerView;
  self->_tabBarContainerView = v27;

  objc_msgSend(v3, "addSubview:", self->_tabBarContainerView);
  v29 = objc_alloc_init(SKUICrossFadingTabBar);
  tabBar = self->_tabBar;
  self->_tabBar = v29;

  -[SKUICrossFadingTabBar _setChargeEnabled:](self->_tabBar, "_setChargeEnabled:", self->_chargeEnabledOnTabBarButtonsContainer);
  -[SKUICrossFadingTabBar backgroundView](self->_tabBar, "backgroundView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setBackdropBarGroupName:", v26);
  -[UIView addSubview:](self->_tabBarContainerView, "addSubview:", self->_tabBar);
  -[SKUIScrollingTabBarController _updateTabBarButtons](self, "_updateTabBarButtons");
  v32 = objc_alloc_init(SKUIDynamicBarAnimator);
  dynamicBarAnimator = self->_dynamicBarAnimator;
  self->_dynamicBarAnimator = v32;

  -[SKUIDynamicBarAnimator setDelegate:](self->_dynamicBarAnimator, "setDelegate:", self);
  -[SKUIScrollingTabBarController _updateDynamicBarGeometry](self, "_updateDynamicBarGeometry");
  if (self->_transientViewController)
  {
    -[SKUIScrollingTabBarContentCollectionView setHidden:](self->_contentCollectionView, "setHidden:", 1);
    -[UIViewController view](self->_transientViewController, "view");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "insertSubview:belowSubview:", v34, self->_tabBarContainerView);

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
  SKUIProxyScrollView *proxyScrollView;
  void *v13;
  double v14;
  double v15;
  void *v16;
  uint64_t (*v17)(double, double, double, double);
  CGSize *p_contentCollectionViewItemSize;
  _BOOL4 v19;
  double v20;
  double v21;
  void *v22;
  id v23;
  void *v24;
  double Width;
  double v26;
  double Height;
  double v28;
  objc_super v29;
  CGRect v30;
  CGRect v31;

  v29.receiver = self;
  v29.super_class = (Class)SKUIScrollingTabBarController;
  -[SKUIScrollingTabBarController viewDidLayoutSubviews](&v29, sel_viewDidLayoutSubviews);
  -[SKUIScrollingTabBarController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  proxyScrollView = self->_proxyScrollView;
  if (proxyScrollView)
  {
    -[SKUIProxyScrollView superview](proxyScrollView, "superview");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
      objc_msgSend(v3, "addSubview:", self->_proxyScrollView);
  }
  v15 = *MEMORY[0x1E0C9D538];
  v14 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v16 = (void *)SKUIMPUFoundationFramework();
  v17 = (uint64_t (*)(double, double, double, double))SKUIWeakLinkedSymbolForString("MPUSizeEqualToSize", v16);
  p_contentCollectionViewItemSize = &self->_contentCollectionViewItemSize;
  if ((v17(self->_contentCollectionViewItemSize.width, self->_contentCollectionViewItemSize.height, v9, v11) & 1) != 0)
  {
    v19 = 0;
  }
  else
  {
    if (self->_shouldPreserveFocusUponNextContentCollectionViewItemSizeChange)
    {
      v19 = p_contentCollectionViewItemSize->width > 0.00000011920929;
      if (p_contentCollectionViewItemSize->width > 0.00000011920929)
      {
        -[SKUIScrollingTabBarContentCollectionView contentOffset](self->_contentCollectionView, "contentOffset", p_contentCollectionViewItemSize->width);
        v14 = v20;
        UIRoundToViewScale();
        v15 = v21;
      }
      self->_shouldPreserveFocusUponNextContentCollectionViewItemSizeChange = 0;
    }
    else
    {
      v19 = 0;
    }
    p_contentCollectionViewItemSize->width = v9;
    self->_contentCollectionViewItemSize.height = v11;
    -[SKUIScrollingTabBarContentCollectionView collectionViewLayout](self->_contentCollectionView, "collectionViewLayout");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_alloc_init((Class)objc_msgSend((id)objc_opt_class(), "invalidationContextClass"));

    objc_msgSend(v23, "setInvalidateFlowLayoutDelegateMetrics:", 1);
    -[SKUIScrollingTabBarContentCollectionView collectionViewLayout](self->_contentCollectionView, "collectionViewLayout");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "invalidateLayoutWithContext:", v23);

  }
  v30.origin.x = v5;
  v30.origin.y = v7;
  v30.size.width = v9;
  v30.size.height = v11;
  Width = CGRectGetWidth(v30);
  if (Width >= 2.0)
    v26 = Width;
  else
    v26 = 2.0;
  v31.origin.x = v5;
  v31.origin.y = v7;
  v31.size.width = v26;
  v31.size.height = v11;
  Height = CGRectGetHeight(v31);
  if (Height >= 2.0)
    v28 = Height;
  else
    v28 = 2.0;
  -[SKUIScrollingTabBarContentCollectionView setFrame:](self->_contentCollectionView, "setFrame:", v5, v7, v26, v28);
  if (v19)
    -[SKUIScrollingTabBarContentCollectionView setContentOffset:](self->_contentCollectionView, "setContentOffset:", v15, v14);
  -[SKUIScrollingTabBarController _updateLayoutOfTabBar](self, "_updateLayoutOfTabBar");
  -[SKUIScrollingTabBarController _updateForHorizontalLayoutChange](self, "_updateForHorizontalLayoutChange");

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  _QWORD v6[5];
  _QWORD v7[5];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SKUIScrollingTabBarController;
  -[SKUIViewController viewWillAppear:](&v8, sel_viewWillAppear_, a3);
  -[SKUIScrollingTabBarController transitionCoordinator](self, "transitionCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6[4] = self;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __48__SKUIScrollingTabBarController_viewWillAppear___block_invoke;
    v7[3] = &unk_1E739FF90;
    v7[4] = self;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __48__SKUIScrollingTabBarController_viewWillAppear___block_invoke_2;
    v6[3] = &unk_1E739FF90;
    objc_msgSend(v4, "animateAlongsideTransition:completion:", v7, v6);
  }
  else
  {
    -[SKUIScrollingTabBarController _updateStatusBarPositionForcingVisible:](self, "_updateStatusBarPositionForcingVisible:", 0);
  }

}

uint64_t __48__SKUIScrollingTabBarController_viewWillAppear___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateStatusBarPositionForcingVisible:", 0);
}

uint64_t __48__SKUIScrollingTabBarController_viewWillAppear___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "isCancelled");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "_updateStatusBarPositionForcingVisible:", 1);
  return result;
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  _QWORD v6[5];
  _QWORD v7[5];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SKUIScrollingTabBarController;
  -[SKUIScrollingTabBarController viewWillDisappear:](&v8, sel_viewWillDisappear_, a3);
  -[SKUIScrollingTabBarController transitionCoordinator](self, "transitionCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6[4] = self;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __51__SKUIScrollingTabBarController_viewWillDisappear___block_invoke;
    v7[3] = &unk_1E739FF90;
    v7[4] = self;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __51__SKUIScrollingTabBarController_viewWillDisappear___block_invoke_2;
    v6[3] = &unk_1E739FF90;
    objc_msgSend(v4, "animateAlongsideTransition:completion:", v7, v6);
  }
  else
  {
    -[SKUIScrollingTabBarController _updateStatusBarPositionForcingVisible:](self, "_updateStatusBarPositionForcingVisible:", 1);
  }

}

uint64_t __51__SKUIScrollingTabBarController_viewWillDisappear___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateStatusBarPositionForcingVisible:", 1);
}

uint64_t __51__SKUIScrollingTabBarController_viewWillDisappear___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "isCancelled");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "_updateStatusBarPositionForcingVisible:", 0);
  return result;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  objc_super v9;
  _QWORD v10[5];

  height = a3.height;
  width = a3.width;
  v7 = a4;
  -[SKUIScrollingTabBarController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v8, "tabBarController:willTransitionToSize:withTransitionCoordinator:", self, v7, width, height);
  self->_shouldPreserveFocusUponNextContentCollectionViewItemSizeChange = 1;
  if (v7)
  {
    ++self->_referenceCountForIgnoringContentOffsetUpdateRequests;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __84__SKUIScrollingTabBarController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
    v10[3] = &unk_1E739FF90;
    v10[4] = self;
    objc_msgSend(v7, "animateAlongsideTransition:completion:", 0, v10);
  }
  v9.receiver = self;
  v9.super_class = (Class)SKUIScrollingTabBarController;
  -[SKUIScrollingTabBarController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);

}

uint64_t __84__SKUIScrollingTabBarController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t result)
{
  --*(_QWORD *)(*(_QWORD *)(result + 32) + 1224);
  return result;
}

- (id)contentScrollView
{
  SKUIProxyScrollView *v3;
  SKUIProxyScrollView *v4;
  SKUIProxyScrollView *proxyScrollView;
  void *v6;

  if (!self->_proxyScrollView && -[SKUIScrollingTabBarController isViewLoaded](self, "isViewLoaded"))
  {
    v3 = [SKUIProxyScrollView alloc];
    v4 = -[SKUIProxyScrollView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    proxyScrollView = self->_proxyScrollView;
    self->_proxyScrollView = v4;

    -[SKUIProxyScrollView setHidden:](self->_proxyScrollView, "setHidden:", 1);
    -[SKUIProxyScrollView setDelegate:](self->_proxyScrollView, "setDelegate:", self);
    -[SKUIProxyScrollView setScrollEnabled:](self->_proxyScrollView, "setScrollEnabled:", 0);
    -[SKUIProxyScrollView setScrollsToTop:](self->_proxyScrollView, "setScrollsToTop:", 0);
    -[SKUIScrollingTabBarController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", self->_proxyScrollView);

  }
  return self->_proxyScrollView;
}

- (id)rotatingSnapshotViewForWindow:(id)a3
{
  UIViewController *v4;
  void *v5;

  v4 = self->_transientViewController;
  if (!v4)
    v4 = self->_topLevelFocusedViewController;
  -[UIViewController view](v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

- (UIEdgeInsets)_edgeInsetsForChildViewController:(id)a3 insetsAreAbsolute:(BOOL *)a4
{
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
  objc_super v17;
  UIEdgeInsets result;

  v17.receiver = self;
  v17.super_class = (Class)SKUIScrollingTabBarController;
  -[SKUIScrollingTabBarController _edgeInsetsForChildViewController:insetsAreAbsolute:](&v17, sel__edgeInsetsForChildViewController_insetsAreAbsolute_, a3);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[SKUIScrollingTabBarController contentViewControllerBottomInsetAdjustment](self, "contentViewControllerBottomInsetAdjustment");
  v13 = v12;
  if (a4)
    *a4 = 0;
  v14 = v7;
  v15 = v9;
  v16 = v11;
  result.right = v16;
  result.bottom = v13;
  result.left = v15;
  result.top = v14;
  return result;
}

- (void)setClientContext:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  objc_super v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SKUIScrollingTabBarController;
  -[SKUIViewController setClientContext:](&v15, sel_setClientContext_, v4);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_viewControllers;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v10, "conformsToProtocol:", &unk_1EF404628, (_QWORD)v11))
          objc_msgSend(v10, "setClientContext:", v4);
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    }
    while (v7);
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_super v6;

  if ((void *)_SKUIScrollingTabFocusedContentScrollViewContentSizeObservationContext == a6)
  {
    -[SKUIScrollingTabBarController _updateHidesBarsOnSwipeAvailability](self, "_updateHidesBarsOnSwipeAvailability", a3, a4, a5);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)SKUIScrollingTabBarController;
    -[SKUIScrollingTabBarController observeValueForKeyPath:ofObject:change:context:](&v6, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (BOOL)dynamicBarAnimator:(id)a3 canHideBarsByDraggingWithOffset:(double)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect v11;

  -[UIScrollView contentSize](self->_focusedContentScrollView, "contentSize", a3);
  v7 = v6;
  -[UIScrollView contentInset](self->_focusedContentScrollView, "contentInset");
  v9 = v7 + v8;
  -[UIScrollView bounds](self->_focusedContentScrollView, "bounds");
  return v9 - CGRectGetMaxY(v11) - a4 > 49.0;
}

- (void)dynamicBarAnimatorDidUpdate:(id)a3
{
  -[SKUIScrollingTabBarController _updateNavigationBarsForVerticalLayoutChange](self, "_updateNavigationBarsForVerticalLayoutChange", a3);
  -[SKUIScrollingTabBarController _updateLayoutOfTabBar](self, "_updateLayoutOfTabBar");
  -[SKUIScrollingTabBarController _updateFocusedViewControllerInsetsForVerticalLayoutChange](self, "_updateFocusedViewControllerInsetsForVerticalLayoutChange");
}

- (void)scrollViewDidChangeContentInset:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;

  if (self->_proxyScrollView == a3)
  {
    objc_msgSend(a3, "contentInset");
    if (self->_proxyScrollViewContentInsetAdjustment.left != v5
      || self->_proxyScrollViewContentInsetAdjustment.top != v4
      || self->_proxyScrollViewContentInsetAdjustment.right != v7
      || self->_proxyScrollViewContentInsetAdjustment.bottom != v6)
    {
      self->_proxyScrollViewContentInsetAdjustment.top = v4;
      self->_proxyScrollViewContentInsetAdjustment.left = v5;
      self->_proxyScrollViewContentInsetAdjustment.bottom = v6;
      self->_proxyScrollViewContentInsetAdjustment.right = v7;
      -[SKUIScrollingTabBarController _updateViewControllerContentScrollViewInset](self, "_updateViewControllerContentScrollViewInset");
    }
  }
}

- (void)scrollingTabBarContentCollectionViewDidLayoutSubviews:(id)a3
{
  if (self->_contentCollectionView == a3)
    -[SKUIScrollingTabBarController _updateForHorizontalLayoutChange](self, "_updateForHorizontalLayoutChange");
}

- (void)scrollingTabBarControllerItemContextRequestsContentOffsetUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  CGRect v15;

  v4 = a3;
  if (!self->_referenceCountForIgnoringContentOffsetUpdateRequests)
  {
    v14 = v4;
    objc_msgSend(v4, "viewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isViewLoaded"))
    {
      objc_msgSend(v5, "view");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "window");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        -[SKUIScrollingTabBarController _parentCellForViewController:](self, "_parentCellForViewController:", v5);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          objc_msgSend(v14, "nestedPagingScrollView");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "contentOffset");
          v11 = v10;
          -[SKUIScrollingTabBarContentCollectionView contentOffset](self->_contentCollectionView, "contentOffset");
          v13 = v12;
          objc_msgSend(v8, "frame");
          -[SKUIScrollingTabBarContentCollectionView setContentOffset:](self->_contentCollectionView, "setContentOffset:", v11 + CGRectGetMinX(v15), v13);

        }
      }
    }

    v4 = v14;
  }

}

- (void)scrollingTabBarControllerItemContextRequestsContentSizeUpdate:(id)a3
{
  NSArray *viewControllers;
  void *v5;

  viewControllers = self->_viewControllers;
  objc_msgSend(a3, "viewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->_indexOfViewControllerWithUpdatedContentSize = -[NSArray indexOfObject:](viewControllers, "indexOfObject:", v5);

  if (!-[SKUIScrollingTabBarContentCollectionView isPerformingLayout](self->_contentCollectionView, "isPerformingLayout"))-[SKUIScrollingTabBarController _updateForHorizontalLayoutChange](self, "_updateForHorizontalLayoutChange");
}

- (void)scrollingTabBarControllerItemContext:(id)a3 observedNavigationStackDidChange:(id)a4
{
  if (self->_topLevelFocusedViewController == a4)
    -[SKUIScrollingTabBarController _updateHorizontalScrollingAvailability](self, "_updateHorizontalScrollingAvailability", a3);
}

- (void)tabBarBackgroundExtendsBehindPaletteDidChangeForPalette:(id)a3
{
  if (self->_tabBarPalette == a3)
  {
    if (objc_msgSend(a3, "isAttached"))
      -[SKUIScrollingTabBarController _updateTabBarBackgroundsAndHairlines](self, "_updateTabBarBackgroundsAndHairlines");
  }
}

- (void)observedScrollViewDidScroll:(id)a3
{
  double v4;
  id v5;

  v5 = a3;
  -[SKUIScrollingTabBarController _updateDynamicBarGeometry](self, "_updateDynamicBarGeometry");
  if (self->_focusedScrollViewIsDragging)
  {
    if (self->_shouldShowBarsAfterDraggingDownward)
    {
      if (-[SKUIScrollingTabBarController _focusedContentScrollViewIsScrolledToOrPastBottom](self, "_focusedContentScrollViewIsScrolledToOrPastBottom"))
      {
        -[SKUIDynamicBarAnimator attemptTransitionToState:animated:](self->_dynamicBarAnimator, "attemptTransitionToState:animated:", 1, 1);
      }
      self->_shouldShowBarsAfterDraggingDownward = 0;
    }
    objc_msgSend(v5, "contentOffset");
    -[SKUIDynamicBarAnimator updateDraggingWithOffset:](self->_dynamicBarAnimator, "updateDraggingWithOffset:", v4);
  }
  -[SKUIScrollingTabBarController _updateNavigationBarsForVerticalLayoutChange](self, "_updateNavigationBarsForVerticalLayoutChange");
  -[SKUIScrollingTabBarController _updateFocusedViewControllerInsetsForVerticalLayoutChange](self, "_updateFocusedViewControllerInsetsForVerticalLayoutChange");

}

- (void)observedScrollViewWillBeginDragging:(id)a3
{
  double v4;

  self->_focusedScrollViewIsDragging = 1;
  objc_msgSend(a3, "contentOffset");
  -[SKUIDynamicBarAnimator beginDraggingWithOffset:](self->_dynamicBarAnimator, "beginDraggingWithOffset:", v4);
  self->_shouldShowBarsAfterDraggingDownward = -[SKUIScrollingTabBarController _focusedContentScrollViewIsScrolledToOrPastBottom](self, "_focusedContentScrollViewIsScrolledToOrPastBottom");
}

- (void)observedScrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint)a5
{
  if (self->_focusedScrollViewIsDragging)
  {
    self->_focusedScrollViewIsDragging = 0;
    -[SKUIDynamicBarAnimator endDraggingWithTargetOffset:velocity:](self->_dynamicBarAnimator, "endDraggingWithTargetOffset:velocity:", a3, a5.y, a4.y * 1000.0, a5.x);
  }
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  if (self->_contentCollectionView == a3)
    return -[NSArray count](self->_viewControllers, "count");
  else
    return 0;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  SKUIScrollingTabBarContentCollectionView *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v22;
  _QWORD v23[4];
  SKUIScrollingTabBarContentCollectionView *v24;
  id v25;
  id v26;

  v6 = (SKUIScrollingTabBarContentCollectionView *)a3;
  v7 = a4;
  v8 = v7;
  if (self->_contentCollectionView == v6)
  {
    ++self->_referenceCountForIgnoringContentOffsetUpdateRequests;
    -[NSArray objectAtIndex:](self->_viewControllers, "objectAtIndex:", objc_msgSend(v7, "item"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable objectForKey:](self->_viewControllerToItemContext, "objectForKey:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "collectionViewCell");
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (void *)v12;
      -[SKUIScrollingTabBarContentCollectionView layoutAttributesForItemAtIndexPath:](v6, "layoutAttributesForItemAtIndexPath:", v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x1E0DC3F10];
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __71__SKUIScrollingTabBarController_collectionView_cellForItemAtIndexPath___block_invoke;
      v23[3] = &unk_1E73A02E8;
      v24 = v6;
      v25 = v14;
      v9 = v13;
      v26 = v9;
      v16 = v14;
      objc_msgSend(v15, "performWithoutAnimation:", v23);

    }
    else
    {
      -[SKUIScrollingTabBarContentCollectionView dequeueReusableCellWithReuseIdentifier:forIndexPath:](v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", 0x1E73B38F0, v8);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setCollectionViewCell:", v9);
    }
    v17 = (id)objc_msgSend(v10, "view");
    if (objc_msgSend(v11, "viewControllerIsNavigationController"))
    {
      objc_msgSend(v10, "viewControllers");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "firstObject");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = (id)objc_msgSend(v19, "view");
    }
    -[SKUIScrollingTabBarController _viewControllerContentScrollViewContentInsetDescriptor](self, "_viewControllerContentScrollViewContentInsetDescriptor");
    objc_msgSend(v11, "applyNewContentInsetDescriptor:", &v22);
    objc_msgSend(v9, "setManagesViewControllerContainerViewLayout:", 0);
    objc_msgSend(v9, "setViewController:", v10);
    --self->_referenceCountForIgnoringContentOffsetUpdateRequests;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

uint64_t __71__SKUIScrollingTabBarController_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_applyLayoutAttributes:toView:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  NSMapTable *viewControllerToItemContext;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  id v20;

  v7 = a4;
  objc_msgSend(a3, "bounds");
  v9 = v8;
  v11 = v10;
  viewControllerToItemContext = self->_viewControllerToItemContext;
  objc_msgSend(v7, "viewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](viewControllerToItemContext, "objectForKey:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "prepareViewControllerForDisplayWithSize:", v9, v11);
  v15 = (void *)MEMORY[0x1E0DC3F10];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __83__SKUIScrollingTabBarController_collectionView_willDisplayCell_forItemAtIndexPath___block_invoke;
  v19[3] = &unk_1E739FD10;
  v19[4] = self;
  v18 = v7;
  v20 = v18;
  objc_msgSend(v15, "performWithoutAnimation:", v19);
  -[SKUIScrollingTabBarController delegate](self, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v18, "viewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "tabBarController:willDisplayViewController:", self, v17);

  }
}

uint64_t __83__SKUIScrollingTabBarController_collectionView_willDisplayCell_forItemAtIndexPath___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateLayoutOfCollectionViewCell:", *(_QWORD *)(a1 + 40));
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(a4, "viewController", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](self->_viewControllerToItemContext, "objectForKey:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "notifyOfUpdatedAppearanceStatus:", 0, 0);
  -[SKUIScrollingTabBarController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "tabBarController:didEndDisplayingViewController:", self, v8);

}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  double v5;
  double v6;
  double height;
  double width;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGSize result;
  CGRect v21;

  if (self->_contentCollectionView == a3)
  {
    width = self->_contentCollectionViewItemSize.width;
    height = self->_contentCollectionViewItemSize.height;
    -[NSArray objectAtIndex:](self->_viewControllers, "objectAtIndex:", objc_msgSend(a5, "item"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable objectForKey:](self->_viewControllerToItemContext, "objectForKey:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "nestedPagingScrollViewContentWidth");
    v13 = v12;
    if (objc_msgSend(v10, "isViewLoaded"))
    {
      objc_msgSend(v10, "view");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "bounds");
      v15 = CGRectGetWidth(v21);

      if (v15 > 0.00000011920929)
      {
        UIRoundToViewScale();
        v13 = v16;
      }
    }
    if (v13 <= width)
      v17 = width;
    else
      v17 = v13;
    if (v17 >= 2.0)
      v5 = v17;
    else
      v5 = 2.0;
    if (height >= 2.0)
      v6 = height;
    else
      v6 = 2.0;

  }
  else
  {
    v5 = *MEMORY[0x1E0C9D820];
    v6 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  v18 = v5;
  v19 = v6;
  result.height = v19;
  result.width = v18;
  return result;
}

- (void)decodeRestorableStateWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  objc_super v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("_SKUIScrollingTabStateRestorationSelectedViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[SKUIScrollingTabBarController allViewControllers](self, "allViewControllers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsObject:", v5);

    if (v7)
      -[SKUIScrollingTabBarController setSelectedViewController:](self, "setSelectedViewController:", v5);
  }
  v8.receiver = self;
  v8.super_class = (Class)SKUIScrollingTabBarController;
  -[SKUIScrollingTabBarController decodeRestorableStateWithCoder:](&v8, sel_decodeRestorableStateWithCoder_, v4);

}

- (void)encodeRestorableStateWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  -[SKUIScrollingTabBarController selectedViewController](self, "selectedViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_SKUIScrollingTabStateRestorationSelectedViewController"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ignoreSnapshotOnNextApplicationLaunch");

  }
  v7.receiver = self;
  v7.super_class = (Class)SKUIScrollingTabBarController;
  -[SKUIScrollingTabBarController encodeRestorableStateWithCoder:](&v7, sel_encodeRestorableStateWithCoder_, v4);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SKUIScrollingTabBarController;
  v4 = a3;
  -[SKUIScrollingTabBarController traitCollectionDidChange:](&v11, sel_traitCollectionDidChange_, v4);
  objc_msgSend(v4, "displayScale", v11.receiver, v11.super_class);
  v6 = v5;

  -[SKUIScrollingTabBarController traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayScale");
  v9 = vabdd_f64(v6, v8);

  if (v9 > 0.00000011920929)
  {
    if (-[SKUIScrollingTabBarController isViewLoaded](self, "isViewLoaded"))
    {
      -[SKUIScrollingTabBarController view](self, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setNeedsLayout");

    }
  }
}

- (double)contentViewControllerBottomInsetAdjustment
{
  double v3;

  -[SKUIScrollingTabBarController _viewControllerContentScrollViewContentInsetDescriptor](self, "_viewControllerContentScrollViewContentInsetDescriptor", 0, 0);
  -[SKUIScrollingTabBarController _effectiveBottomBarOffset](self, "_effectiveBottomBarOffset");
  return 0.0 - v3;
}

- (unint64_t)selectedIndex
{
  void *v4;
  void *v5;
  unint64_t v6;

  if (self->_transientViewController)
    return 0x7FFFFFFFFFFFFFFFLL;
  -[SKUIScrollingTabBarController viewControllers](self, "viewControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIScrollingTabBarController selectedViewController](self, "selectedViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "indexOfObject:", v5);

  return v6;
}

- (UIViewController)selectedViewController
{
  return self->_topLevelFocusedViewController;
}

- (void)setAdditionalTabBarButtonsContainerPositionOffset:(UIOffset)a3
{
  double v4;
  double v5;
  UIOffset *p_additionalTabBarButtonsContainerPositionOffset;
  char v8;
  _BYTE v9[23];
  char v10;
  _BYTE v11[23];
  UIOffset v12;
  _BYTE v13[23];
  _BYTE v14[23];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[SKUIScrollingTabBarController _roundedOffsetFromOffset:](self, "_roundedOffsetFromOffset:", a3.horizontal, a3.vertical);
  p_additionalTabBarButtonsContainerPositionOffset = &self->_additionalTabBarButtonsContainerPositionOffset;
  if (self->_additionalTabBarButtonsContainerPositionOffset.horizontal != v4
    || self->_additionalTabBarButtonsContainerPositionOffset.vertical != v5)
  {
    v12 = *p_additionalTabBarButtonsContainerPositionOffset;
    p_additionalTabBarButtonsContainerPositionOffset->horizontal = v4;
    self->_additionalTabBarButtonsContainerPositionOffset.vertical = v5;
    if (-[SKUIScrollingTabBarController isViewLoaded](self, "isViewLoaded"))
    {
      if (self->_additionalPositionOffsetsAtomicUpdateRequestCount)
      {
        if (!self->_additionalPositionOffsetsUpdateRecord.didUpdateAdditionalTabBarButtonsContainerPositionOffset)
        {
          self->_additionalPositionOffsetsUpdateRecord.didUpdateAdditionalTabBarButtonsContainerPositionOffset = 1;
          self->_additionalPositionOffsetsUpdateRecord.oldAdditionalTabBarButtonsContainerPositionOffset = v12;
        }
      }
      else
      {
        *(_DWORD *)&v14[3] = 0;
        *(_DWORD *)v14 = 0;
        *(_DWORD *)&v13[3] = 0;
        *(_DWORD *)v13 = 0;
        *(UIOffset *)&v14[7] = v12;
        *(_OWORD *)&v13[7] = *MEMORY[0x1E0DC51A8];
        v8 = 1;
        *(_OWORD *)v9 = *(_OWORD *)v14;
        *(CGFloat *)&v9[15] = v12.vertical;
        v10 = 0;
        *(_OWORD *)v11 = *(_OWORD *)v13;
        *(_QWORD *)&v11[15] = *(_QWORD *)&v13[15];
        -[SKUIScrollingTabBarController _updateAdditionalPositionOffsetsWithUpdateRecord:](self, "_updateAdditionalPositionOffsetsWithUpdateRecord:", &v8);
      }
    }
  }
}

- (void)setAdditionalTabBarPalettePositionOffset:(UIOffset)a3
{
  double v4;
  double v5;
  UIOffset *p_additionalTabBarPalettePositionOffset;
  char v8;
  _BYTE v9[23];
  char v10;
  _BYTE v11[23];
  UIOffset v12;
  _BYTE v13[23];
  _BYTE v14[23];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[SKUIScrollingTabBarController _roundedOffsetFromOffset:](self, "_roundedOffsetFromOffset:", a3.horizontal, a3.vertical);
  p_additionalTabBarPalettePositionOffset = &self->_additionalTabBarPalettePositionOffset;
  if (self->_additionalTabBarPalettePositionOffset.horizontal != v4
    || self->_additionalTabBarPalettePositionOffset.vertical != v5)
  {
    v12 = *p_additionalTabBarPalettePositionOffset;
    p_additionalTabBarPalettePositionOffset->horizontal = v4;
    self->_additionalTabBarPalettePositionOffset.vertical = v5;
    if (-[SKUIScrollingTabBarController isViewLoaded](self, "isViewLoaded"))
    {
      if (self->_additionalPositionOffsetsAtomicUpdateRequestCount)
      {
        if (!self->_additionalPositionOffsetsUpdateRecord.didUpdateAdditionalTabBarPalettePositionOffset)
        {
          self->_additionalPositionOffsetsUpdateRecord.didUpdateAdditionalTabBarPalettePositionOffset = 1;
          self->_additionalPositionOffsetsUpdateRecord.oldAdditionalTabBarPalettePositionOffset = v12;
        }
      }
      else
      {
        *(_DWORD *)&v14[3] = 0;
        *(_DWORD *)v14 = 0;
        *(_DWORD *)&v13[3] = 0;
        *(_DWORD *)v13 = 0;
        *(_OWORD *)&v14[7] = *MEMORY[0x1E0DC51A8];
        *(UIOffset *)&v13[7] = v12;
        v8 = 0;
        *(_OWORD *)v9 = *(_OWORD *)v14;
        *(_QWORD *)&v9[15] = *(_QWORD *)&v14[15];
        v10 = 1;
        *(_OWORD *)v11 = *(_OWORD *)v13;
        *(CGFloat *)&v11[15] = v12.vertical;
        -[SKUIScrollingTabBarController _updateAdditionalPositionOffsetsWithUpdateRecord:](self, "_updateAdditionalPositionOffsetsWithUpdateRecord:", &v8);
      }
    }
  }
}

- (void)setChargeEnabledOnTabBarButtonsContainer:(BOOL)a3
{
  _BOOL8 v3;

  if (self->_chargeEnabledOnTabBarButtonsContainer != a3)
  {
    v3 = a3;
    self->_chargeEnabledOnTabBarButtonsContainer = a3;
    if (-[SKUIScrollingTabBarController isViewLoaded](self, "isViewLoaded"))
      -[SKUICrossFadingTabBar _setChargeEnabled:](self->_tabBar, "_setChargeEnabled:", v3);
  }
}

- (void)setScrollEnabled:(BOOL)a3
{
  int v4;

  if (a3)
    v4 = objc_msgSend((id)objc_opt_class(), "areScrollingTabsAllowed");
  else
    v4 = 0;
  if (self->_scrollEnabled != v4)
  {
    self->_scrollEnabled = v4;
    -[SKUIScrollingTabBarController _updateHorizontalScrollingAvailability](self, "_updateHorizontalScrollingAvailability");
  }
}

- (void)setSelectedIndex:(unint64_t)a3
{
  -[SKUIScrollingTabBarController _selectTabAtIndex:shouldFallbackToPoppingToTabRootContent:](self, "_selectTabAtIndex:shouldFallbackToPoppingToTabRootContent:", a3, 0);
}

- (void)setSelectedViewController:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  -[SKUIScrollingTabBarController viewControllers](self, "viewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  -[SKUIScrollingTabBarController setSelectedIndex:](self, "setSelectedIndex:", v6);
}

- (void)setTransientViewController:(id)a3
{
  -[SKUIScrollingTabBarController setTransientViewController:animated:](self, "setTransientViewController:animated:", a3, 1);
}

- (void)setTransientViewController:(id)a3 animated:(BOOL)a4
{
  UIViewController *v6;
  UIViewController **p_transientViewController;
  UIViewController *transientViewController;
  UIViewController *v9;
  __int128 v10;
  SKUIScrollingTabBarControllerItemContext *transientViewControllerItemContext;
  SKUIScrollingTabBarControllerItemContext *v12;
  void *v13;
  void *v14;
  void *v15;
  UIViewController *v16;
  SKUIScrollingTabBarControllerItemContext *v17;
  SKUIScrollingTabBarControllerItemContext *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  SKUIScrollingTabBarControllerItemContext *v23;
  _OWORD v24[2];
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;

  v6 = (UIViewController *)a3;
  p_transientViewController = &self->_transientViewController;
  transientViewController = self->_transientViewController;
  if (transientViewController != v6)
  {
    v9 = transientViewController;
    if (v9)
    {
      v10 = *(_OWORD *)(MEMORY[0x1E0DC49E8] + 16);
      v26 = *MEMORY[0x1E0DC49E8];
      v27 = v10;
      transientViewControllerItemContext = self->_transientViewControllerItemContext;
      v28 = 0;
      -[SKUIScrollingTabBarControllerItemContext applyNewContentInsetDescriptor:](transientViewControllerItemContext, "applyNewContentInsetDescriptor:", &v26);
      v12 = self->_transientViewControllerItemContext;
      self->_transientViewControllerItemContext = 0;

      -[UIViewController willMoveToParentViewController:](v9, "willMoveToParentViewController:", 0);
      if (-[UIViewController isViewLoaded](v9, "isViewLoaded"))
      {
        -[UIViewController view](v9, "view");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "removeFromSuperview");

      }
      -[UIViewController removeFromParentViewController](v9, "removeFromParentViewController");
    }
    objc_storeStrong((id *)&self->_transientViewController, a3);
    if (*p_transientViewController)
    {
      -[SKUIScrollingTabBarController addChildViewController:](self, "addChildViewController:");
      if (-[SKUIScrollingTabBarController isViewLoaded](self, "isViewLoaded"))
      {
        -[SKUIScrollingTabBarController view](self, "view");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIViewController view](*p_transientViewController, "view");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "insertSubview:belowSubview:", v15, self->_tabBarContainerView);

      }
      -[UIViewController didMoveToParentViewController:](*p_transientViewController, "didMoveToParentViewController:", self);
    }
    v16 = *p_transientViewController;
    if (v9)
    {
      if (v16)
      {
LABEL_15:
        v17 = -[SKUIScrollingTabBarControllerItemContext initWithViewController:]([SKUIScrollingTabBarControllerItemContext alloc], "initWithViewController:", *p_transientViewController);
        v18 = self->_transientViewControllerItemContext;
        self->_transientViewControllerItemContext = v17;

        v19 = -[UIViewController view](*p_transientViewController, "view");
        if (-[SKUIScrollingTabBarControllerItemContext viewControllerIsNavigationController](self->_transientViewControllerItemContext, "viewControllerIsNavigationController"))
        {
          -[UIViewController viewControllers](*p_transientViewController, "viewControllers");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "firstObject");
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          v22 = (id)objc_msgSend(v21, "view");
        }
        v28 = 0;
        v26 = 0u;
        v27 = 0u;
        -[SKUIScrollingTabBarController _viewControllerContentScrollViewContentInsetDescriptor](self, "_viewControllerContentScrollViewContentInsetDescriptor");
        v23 = self->_transientViewControllerItemContext;
        v24[0] = v26;
        v24[1] = v27;
        v25 = v28;
        -[SKUIScrollingTabBarControllerItemContext applyNewContentInsetDescriptor:](v23, "applyNewContentInsetDescriptor:", v24);
        goto LABEL_18;
      }
    }
    else if (!v16)
    {
      goto LABEL_18;
    }
    -[SKUIScrollingTabBarContentCollectionView setHidden:](self->_contentCollectionView, "setHidden:", v16 != 0);
    -[SKUIScrollingTabBarController _updateForHorizontalLayoutChange](self, "_updateForHorizontalLayoutChange");
    -[SKUIScrollingTabBarController _updateHidesBarsOnSwipeAvailability](self, "_updateHidesBarsOnSwipeAvailability");
    if (*p_transientViewController)
      goto LABEL_15;
LABEL_18:
    -[SKUIScrollingTabBarController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");

  }
}

- (void)setViewControllers:(id)a3
{
  SKUIScrollingTabBarController *v4;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__SKUIScrollingTabBarController_setViewControllers___block_invoke;
  v5[3] = &unk_1E739FD38;
  v5[4] = self;
  v4 = self;
  -[SKUIScrollingTabBarController _setViewControllers:collectionViewsUpdateHandler:forFinalTearDown:](v4, "_setViewControllers:collectionViewsUpdateHandler:forFinalTearDown:", a3, v5, 0);

}

uint64_t __52__SKUIScrollingTabBarController_setViewControllers___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1128), "reloadData");
  return objc_msgSend(*(id *)(a1 + 32), "_updateScrollViewContentOffsetsToTargetContentOffsets");
}

- (UIView)tabBar
{
  return self->_tabBarContainerView;
}

- (CGRect)tabBarButtonsContainerFrame
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
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect result;

  if (-[SKUIScrollingTabBarController isViewLoaded](self, "isViewLoaded"))
  {
    -[SKUIScrollingTabBarController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUICrossFadingTabBar bounds](self->_tabBar, "bounds");
    objc_msgSend(v3, "convertRect:fromView:", self->_tabBar);
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;

    -[SKUICrossFadingTabBar traitCollection](self->_tabBar, "traitCollection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "displayScale");
    v14 = v13;

    if (v14 < 0.00000011920929)
    {
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "scale");
      v14 = v16;

    }
    v17 = v7 - 1.0 / v14;
    v18 = v11 + 1.0 / v14;
  }
  else
  {
    v5 = *MEMORY[0x1E0C9D628];
    v17 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v9 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v18 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  v19 = v5;
  v20 = v9;
  result.size.height = v18;
  result.size.width = v20;
  result.origin.y = v17;
  result.origin.x = v19;
  return result;
}

- (CGRect)tabBarPaletteFrame
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
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  if (-[SKUIScrollingTabBarPalette isAttached](self->_tabBarPalette, "isAttached"))
  {
    -[SKUIScrollingTabBarController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIScrollingTabBarPalette bounds](self->_tabBarPalette, "bounds");
    objc_msgSend(v3, "convertRect:fromView:", self->_tabBarPalette);
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;

  }
  else
  {
    v5 = *MEMORY[0x1E0C9D628];
    v7 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v9 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v11 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
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

- (id)existingTabBarPalette
{
  return self->_tabBarPalette;
}

- (id)tabBarPaletteWithHeight:(double)a3
{
  SKUIScrollingTabBarPalette *tabBarPalette;
  double v6;
  double v7;
  void *v8;
  double Width;
  SKUIScrollingTabBarPalette *v10;
  SKUIScrollingTabBarPalette *v11;
  void *v12;
  void *v13;
  CGRect v15;

  tabBarPalette = self->_tabBarPalette;
  if (!tabBarPalette)
  {
    v6 = *MEMORY[0x1E0C9D648];
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    -[SKUIScrollingTabBarController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    Width = CGRectGetWidth(v15);

    v10 = -[SKUIScrollingTabBarPalette initWithFrame:]([SKUIScrollingTabBarPalette alloc], "initWithFrame:", v6, v7, Width, a3);
    v11 = self->_tabBarPalette;
    self->_tabBarPalette = v10;

    -[SKUIScrollingTabBarPalette _backgroundView](self->_tabBarPalette, "_backgroundView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIScrollingTabBarController _tabBarBackdropGroupName](self, "_tabBarBackdropGroupName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBackdropBarGroupName:", v13);

    tabBarPalette = self->_tabBarPalette;
  }
  return tabBarPalette;
}

- (void)attachTabBarPalette:(id)a3
{
  -[SKUIScrollingTabBarController attachTabBarPalette:animated:completion:](self, "attachTabBarPalette:animated:completion:", a3, 0, 0);
}

- (void)attachTabBarPalette:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v6;
  SKUIScrollingTabBarPalette *v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  SKUIScrollingTabBarController *v20;
  id v21;
  _QWORD v22[5];
  _QWORD v23[4];
  id v24;
  SKUIScrollingTabBarController *v25;
  _QWORD aBlock[5];
  id v27;
  id v28;

  v6 = a4;
  v8 = (SKUIScrollingTabBarPalette *)a3;
  v9 = a5;
  if (v8 && self->_tabBarPalette == v8)
  {
    -[SKUIScrollingTabBarController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIScrollingTabBarPalette _setAttached:](self->_tabBarPalette, "_setAttached:", 1);
    -[SKUIScrollingTabBarPalette _setDelegate:](self->_tabBarPalette, "_setDelegate:", self);
    -[SKUIScrollingTabBarController _updateViewControllerContentScrollViewInset](self, "_updateViewControllerContentScrollViewInset");
    v11 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __73__SKUIScrollingTabBarController_attachTabBarPalette_animated_completion___block_invoke;
    aBlock[3] = &unk_1E73A47A8;
    aBlock[4] = self;
    v12 = v10;
    v27 = v12;
    v28 = v9;
    v13 = _Block_copy(aBlock);
    v14 = v13;
    if (v6)
    {
      v23[0] = v11;
      v23[1] = 3221225472;
      v23[2] = __73__SKUIScrollingTabBarController_attachTabBarPalette_animated_completion___block_invoke_2;
      v23[3] = &unk_1E739FD10;
      v24 = v12;
      v25 = self;
      v22[0] = v11;
      v22[1] = 3221225472;
      v22[2] = __73__SKUIScrollingTabBarController_attachTabBarPalette_animated_completion___block_invoke_3;
      v22[3] = &unk_1E739FD38;
      v22[4] = self;
      v16 = v11;
      v17 = 3221225472;
      v18 = __73__SKUIScrollingTabBarController_attachTabBarPalette_animated_completion___block_invoke_4;
      v19 = &unk_1E73A0248;
      v20 = self;
      v21 = v14;
      -[SKUIScrollingTabBarController _animatePaletteWithSetup:animations:completion:](self, "_animatePaletteWithSetup:animations:completion:", v23, v22, &v16);

    }
    else
    {
      (*((void (**)(void *))v13 + 2))(v13);
      -[SKUIScrollingTabBarController _updateTabBarBackgroundsAndHairlines](self, "_updateTabBarBackgroundsAndHairlines");
    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", v16, v17, v18, v19, v20);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "postNotificationName:object:", CFSTR("SKUIScrollingTabBarControllerPaletteWasAttached"), self);

  }
}

uint64_t __73__SKUIScrollingTabBarController_attachTabBarPalette_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1248), "insertSubview:belowSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1288), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1240));
  objc_msgSend(*(id *)(a1 + 40), "setNeedsLayout");
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __73__SKUIScrollingTabBarController_attachTabBarPalette_animated_completion___block_invoke_2(uint64_t a1)
{
  double v2;
  double v3;
  void *v4;
  CGFloat Height;
  CGAffineTransform v7;
  CGRect v8;

  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1288), "frame");
  v8.size.height = v2 + 5.0;
  v8.origin.y = v3 + -5.0;
  v4 = *(void **)(*(_QWORD *)(a1 + 40) + 1288);
  Height = CGRectGetHeight(v8);
  CGAffineTransformMakeTranslation(&v7, 0.0, Height);
  return objc_msgSend(v4, "setTransform:", &v7);
}

uint64_t __73__SKUIScrollingTabBarController_attachTabBarPalette_animated_completion___block_invoke_3(uint64_t a1)
{
  void *v1;
  CGAffineTransform v3;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 1288);
  CGAffineTransformMakeTranslation(&v3, 0.0, 5.0);
  return objc_msgSend(v1, "setTransform:", &v3);
}

uint64_t __73__SKUIScrollingTabBarController_attachTabBarPalette_animated_completion___block_invoke_4(uint64_t a1)
{
  void *v2;
  __int128 v3;
  _OWORD v5[3];

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 1288);
  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v5[0] = *MEMORY[0x1E0C9BAA8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v2, "setTransform:", v5);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)detachTabBarPalette:(id)a3
{
  -[SKUIScrollingTabBarController detachTabBarPalette:animated:completion:](self, "detachTabBarPalette:animated:completion:", a3, 0, 0);
}

- (void)detachTabBarPalette:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v6;
  SKUIScrollingTabBarPalette *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[9];
  _QWORD aBlock[5];
  id v23;

  v6 = a4;
  v8 = (SKUIScrollingTabBarPalette *)a3;
  v9 = a5;
  v10 = v9;
  if (v8 && self->_tabBarPalette == v8)
  {
    v11 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __73__SKUIScrollingTabBarController_detachTabBarPalette_animated_completion___block_invoke;
    aBlock[3] = &unk_1E73A1578;
    aBlock[4] = self;
    v23 = v9;
    v12 = _Block_copy(aBlock);
    v13 = v12;
    if (v6)
    {
      -[SKUIScrollingTabBarPalette frame](self->_tabBarPalette, "frame");
      v21[0] = v11;
      v21[1] = 3221225472;
      v21[2] = __73__SKUIScrollingTabBarController_detachTabBarPalette_animated_completion___block_invoke_2;
      v21[3] = &unk_1E73A2F30;
      v21[4] = self;
      v21[5] = v14;
      v21[6] = v15;
      v21[7] = v16;
      v21[8] = v17;
      v19[0] = v11;
      v19[1] = 3221225472;
      v19[2] = __73__SKUIScrollingTabBarController_detachTabBarPalette_animated_completion___block_invoke_3;
      v19[3] = &unk_1E73A0248;
      v19[4] = self;
      v20 = v13;
      -[SKUIScrollingTabBarController _animatePaletteWithSetup:animations:completion:](self, "_animatePaletteWithSetup:animations:completion:", 0, v21, v19);

    }
    else
    {
      (*((void (**)(void *))v12 + 2))(v12);
    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "postNotificationName:object:", CFSTR("SKUIScrollingTabBarControllerPaletteWasDetached"), self);

  }
}

uint64_t __73__SKUIScrollingTabBarController_detachTabBarPalette_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1288), "_setAttached:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_updateViewControllerContentScrollViewInset");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1288), "removeFromSuperview");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1288), "_setDelegate:", 0);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 1288);
  *(_QWORD *)(v2 + 1288) = 0;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsLayout");

  objc_msgSend(*(id *)(a1 + 32), "_updateTabBarBackgroundsAndHairlines");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __73__SKUIScrollingTabBarController_detachTabBarPalette_animated_completion___block_invoke_2(uint64_t a1)
{
  void *v1;
  CGFloat Height;
  CGAffineTransform v4;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 1288);
  Height = CGRectGetHeight(*(CGRect *)(a1 + 40));
  CGAffineTransformMakeTranslation(&v4, 0.0, Height + 5.0);
  return objc_msgSend(v1, "setTransform:", &v4);
}

uint64_t __73__SKUIScrollingTabBarController_detachTabBarPalette_animated_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  __int128 v3;
  _OWORD v5[3];

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 1288);
  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v5[0] = *MEMORY[0x1E0C9BAA8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v2, "setTransform:", v5);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)willUpdateAdditionalTabBarComponentsPositionOffsets
{
  ++self->_additionalPositionOffsetsAtomicUpdateRequestCount;
}

- (void)didUpdateAdditionalTabBarComponentsPositionOffsets
{
  unint64_t additionalPositionOffsetsAtomicUpdateRequestCount;
  unint64_t v3;
  $93282CE957A1E3B8DA280A36C3B3484A *p_additionalPositionOffsetsUpdateRecord;
  __int128 v5;
  UIOffset v6;
  _OWORD v7[3];

  additionalPositionOffsetsAtomicUpdateRequestCount = self->_additionalPositionOffsetsAtomicUpdateRequestCount;
  if (additionalPositionOffsetsAtomicUpdateRequestCount)
  {
    v3 = additionalPositionOffsetsAtomicUpdateRequestCount - 1;
    self->_additionalPositionOffsetsAtomicUpdateRequestCount = v3;
    if (!v3)
    {
      p_additionalPositionOffsetsUpdateRecord = &self->_additionalPositionOffsetsUpdateRecord;
      v5 = *(_OWORD *)&self->_additionalPositionOffsetsUpdateRecord.oldAdditionalTabBarButtonsContainerPositionOffset.vertical;
      v7[0] = *(_OWORD *)&self->_additionalPositionOffsetsUpdateRecord.didUpdateAdditionalTabBarButtonsContainerPositionOffset;
      v7[1] = v5;
      v7[2] = self->_additionalPositionOffsetsUpdateRecord.oldAdditionalTabBarPalettePositionOffset;
      -[SKUIScrollingTabBarController _updateAdditionalPositionOffsetsWithUpdateRecord:](self, "_updateAdditionalPositionOffsetsWithUpdateRecord:", v7);
      p_additionalPositionOffsetsUpdateRecord->didUpdateAdditionalTabBarButtonsContainerPositionOffset = 0;
      v6 = (UIOffset)*MEMORY[0x1E0DC51A8];
      p_additionalPositionOffsetsUpdateRecord->oldAdditionalTabBarButtonsContainerPositionOffset = (UIOffset)*MEMORY[0x1E0DC51A8];
      p_additionalPositionOffsetsUpdateRecord->didUpdateAdditionalTabBarPalettePositionOffset = 0;
      p_additionalPositionOffsetsUpdateRecord->oldAdditionalTabBarPalettePositionOffset = v6;
    }
  }
}

- (void)updateTabBarComponentPositionOffsetsWithPresentationValues
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __91__SKUIScrollingTabBarController_updateTabBarComponentPositionOffsetsWithPresentationValues__block_invoke;
  v2[3] = &unk_1E739FD38;
  v2[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v2);
}

void __91__SKUIScrollingTabBarController_updateTabBarComponentPositionOffsetsWithPresentationValues__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  unsigned int (*v28)(uint64_t, double, double);
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  id v43;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1248), "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentationLayer");
  v43 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1288), "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentationLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentationLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "bounds");
  objc_msgSend(v7, "convertRect:fromLayer:", v43);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "presentationLayer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  objc_msgSend(v18, "convertRect:fromLayer:", v4);
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;

  v27 = (void *)SKUIMPUFoundationFramework();
  v28 = (unsigned int (*)(uint64_t, double, double))SKUIWeakLinkedSymbolForString("MPUSizeEqualToSize", v27);
  if (v28(objc_msgSend(v43, "bounds"), v13, v15)
    && (((uint64_t (*)(uint64_t, double, double))v28)(objc_msgSend(v4, "bounds"), v24, v26) & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "willUpdateAdditionalTabBarComponentsPositionOffsets");
    v29 = *MEMORY[0x1E0DC51A8];
    v30 = *(double *)(MEMORY[0x1E0DC51A8] + 8);
    objc_msgSend(*(id *)(a1 + 32), "setAdditionalTabBarButtonsContainerPositionOffset:", *MEMORY[0x1E0DC51A8], v30);
    objc_msgSend(*(id *)(a1 + 32), "setAdditionalTabBarPalettePositionOffset:", v29, v30);
    objc_msgSend(*(id *)(a1 + 32), "didUpdateAdditionalTabBarComponentsPositionOffsets");
    objc_msgSend(*(id *)(a1 + 32), "view");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setNeedsLayout");

    objc_msgSend(*(id *)(a1 + 32), "view");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "layoutIfNeeded");

    objc_msgSend(*(id *)(a1 + 32), "view");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1248), "bounds");
    objc_msgSend(v33, "convertRect:fromView:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1248));
    v35 = v34;
    v37 = v36;

    objc_msgSend(*(id *)(a1 + 32), "view");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1288), "bounds");
    objc_msgSend(v38, "convertRect:fromView:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1288));
    v40 = v39;
    v42 = v41;

    objc_msgSend(*(id *)(a1 + 32), "willUpdateAdditionalTabBarComponentsPositionOffsets");
    objc_msgSend(*(id *)(a1 + 32), "setAdditionalTabBarButtonsContainerPositionOffset:", v9 - v35, v11 - v37);
    objc_msgSend(*(id *)(a1 + 32), "setAdditionalTabBarPalettePositionOffset:", v20 - v40, v22 - v42);
    objc_msgSend(*(id *)(a1 + 32), "didUpdateAdditionalTabBarComponentsPositionOffsets");
  }
  else
  {
    NSLog(CFSTR("Invalid size returned from presentation values. Not updating tab bar component offsets."));
  }

}

- (void)hideBarWithTransition:(int)a3
{
  uint64_t v3;
  void *v5;
  uint64_t v6;
  double v10;
  double v11;
  double v12;
  void *v13;
  _QWORD v14[5];
  _QWORD v15[8];

  if (!self->_tabBarExplicitlyHidden)
  {
    v3 = *(_QWORD *)&a3;
    self->_tabBarExplicitlyHidden = 1;
    -[SKUIScrollingTabBarController _updateHidesBarsOnSwipeAvailability](self, "_updateHidesBarsOnSwipeAvailability");
    -[SKUIScrollingTabBarController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layoutIfNeeded");

    -[UIView bounds](self->_tabBarContainerView, "bounds");
    v10 = *MEMORY[0x1E0DC51A8];
    v11 = *(double *)(MEMORY[0x1E0DC51A8] + 8);
    v12 = 0.0;
    switch((int)v3)
    {
      case 1:
        v10 = v10 - CGRectGetWidth(*(CGRect *)&v6);
        goto LABEL_6;
      case 2:
        v10 = v10 + CGRectGetWidth(*(CGRect *)&v6);
        goto LABEL_6;
      case 6:
        goto LABEL_7;
      case 7:
        v11 = v11 + CGRectGetHeight(*(CGRect *)&v6);
LABEL_6:
        v12 = 1.0;
LABEL_7:
        v13 = (void *)MEMORY[0x1E0DC3F10];
        objc_msgSend((id)objc_opt_class(), "durationForTransition:", v3);
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __55__SKUIScrollingTabBarController_hideBarWithTransition___block_invoke;
        v15[3] = &unk_1E73A47D0;
        v15[4] = self;
        *(double *)&v15[5] = v10;
        *(double *)&v15[6] = v11;
        *(double *)&v15[7] = v12;
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __55__SKUIScrollingTabBarController_hideBarWithTransition___block_invoke_2;
        v14[3] = &unk_1E73A0108;
        v14[4] = self;
        objc_msgSend(v13, "animateWithDuration:animations:completion:", v15, v14);
        break;
      default:
        -[UIView setHidden:](self->_tabBarContainerView, "setHidden:", 1);
        if (-[UIViewController conformsToProtocol:](self->_topLevelFocusedViewController, "conformsToProtocol:", &unk_1EF4AAD10))-[UIViewController scrollingTabBarBottomInsetAdjustmentDidChange](self->_topLevelFocusedViewController, "scrollingTabBarBottomInsetAdjustmentDidChange");
        break;
    }
  }
}

uint64_t __55__SKUIScrollingTabBarController_hideBarWithTransition___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  *(_OWORD *)(*(_QWORD *)(a1 + 32) + 1256) = *(_OWORD *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 32);
  if (*(double *)(v2 + 1256) != *MEMORY[0x1E0DC51A8]
    || *(double *)(v2 + 1264) != *(double *)(MEMORY[0x1E0DC51A8] + 8))
  {
    objc_msgSend((id)v2, "_updateLayoutOfTabBar");
    v2 = *(_QWORD *)(a1 + 32);
  }
  if (*(double *)(a1 + 56) < 0.999999881)
  {
    objc_msgSend(*(id *)(v2 + 1248), "setAlpha:");
    v2 = *(_QWORD *)(a1 + 32);
  }
  result = objc_msgSend(*(id *)(v2 + 1296), "conformsToProtocol:", &unk_1EF4AAD10);
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1296), "scrollingTabBarBottomInsetAdjustmentDidChange");
  return result;
}

uint64_t __55__SKUIScrollingTabBarController_hideBarWithTransition___block_invoke_2(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(*(_QWORD *)(result + 32) + 1248), "setHidden:", 1);
  return result;
}

- (void)showBarWithTransition:(int)a3
{
  uint64_t v3;
  void *v5;
  uint64_t v6;
  UIOffset *v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  _QWORD v15[5];
  _QWORD v16[5];

  if (self->_tabBarExplicitlyHidden)
  {
    v3 = *(_QWORD *)&a3;
    -[SKUIScrollingTabBarController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layoutIfNeeded");

    -[UIView bounds](self->_tabBarContainerView, "bounds");
    v10 = (UIOffset *)MEMORY[0x1E0DC51A8];
    v11 = *MEMORY[0x1E0DC51A8];
    v12 = *(double *)(MEMORY[0x1E0DC51A8] + 8);
    v13 = 0.0;
    switch((int)v3)
    {
      case 1:
        v11 = v11 + CGRectGetWidth(*(CGRect *)&v6);
        goto LABEL_6;
      case 2:
        v11 = v11 - CGRectGetWidth(*(CGRect *)&v6);
        goto LABEL_6;
      case 3:
        v12 = v12 + CGRectGetHeight(*(CGRect *)&v6);
LABEL_6:
        v13 = 1.0;
        goto LABEL_7;
      case 6:
LABEL_7:
        -[UIView setHidden:](self->_tabBarContainerView, "setHidden:", 0);
        self->_tabBarExplicitHidingOffset.horizontal = v11;
        self->_tabBarExplicitHidingOffset.vertical = v12;
        -[SKUIScrollingTabBarController _updateLayoutOfTabBar](self, "_updateLayoutOfTabBar");
        -[UIView setAlpha:](self->_tabBarContainerView, "setAlpha:", v13);
        v14 = (void *)MEMORY[0x1E0DC3F10];
        objc_msgSend((id)objc_opt_class(), "durationForTransition:", v3);
        v15[4] = self;
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __55__SKUIScrollingTabBarController_showBarWithTransition___block_invoke;
        v16[3] = &unk_1E739FD38;
        v16[4] = self;
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __55__SKUIScrollingTabBarController_showBarWithTransition___block_invoke_2;
        v15[3] = &unk_1E73A0108;
        objc_msgSend(v14, "animateWithDuration:animations:completion:", v16, v15);
        break;
      default:
        -[UIView setHidden:](self->_tabBarContainerView, "setHidden:", 0);
        self->_tabBarExplicitlyHidden = 0;
        self->_tabBarExplicitHidingOffset = *v10;
        -[SKUIScrollingTabBarController _updateLayoutOfTabBar](self, "_updateLayoutOfTabBar");
        -[UIView setAlpha:](self->_tabBarContainerView, "setAlpha:", 1.0);
        if (-[UIViewController conformsToProtocol:](self->_topLevelFocusedViewController, "conformsToProtocol:", &unk_1EF4AAD10))-[UIViewController scrollingTabBarBottomInsetAdjustmentDidChange](self->_topLevelFocusedViewController, "scrollingTabBarBottomInsetAdjustmentDidChange");
        break;
    }
  }
}

uint64_t __55__SKUIScrollingTabBarController_showBarWithTransition___block_invoke(uint64_t a1)
{
  uint64_t result;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1272) = 0;
  *(_OWORD *)(*(_QWORD *)(a1 + 32) + 1256) = *MEMORY[0x1E0DC51A8];
  objc_msgSend(*(id *)(a1 + 32), "_updateLayoutOfTabBar");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1248), "setAlpha:", 1.0);
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1296), "conformsToProtocol:", &unk_1EF4AAD10);
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1296), "scrollingTabBarBottomInsetAdjustmentDidChange");
  return result;
}

uint64_t __55__SKUIScrollingTabBarController_showBarWithTransition___block_invoke_2(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "_updateHidesBarsOnSwipeAvailability");
  return result;
}

- (void)_tabBarButtonTapped:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a3;
  if (self->_transientViewController)
    -[SKUIScrollingTabBarController setTransientViewController:animated:](self, "setTransientViewController:animated:", 0, 0);
  -[SKUICrossFadingTabBar tabBarButtons](self->_tabBar, "tabBarButtons");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "indexOfObject:", v6);

  -[SKUIScrollingTabBarController _selectTabAtIndex:shouldFallbackToPoppingToTabRootContent:](self, "_selectTabAtIndex:shouldFallbackToPoppingToTabRootContent:", v5, 1);
}

- (id)_deepestFocusedViewControllerWithTopLevelFocusedViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double Width;
  double v9;
  double v10;
  CGRect v12;

  v4 = a3;
  -[NSMapTable objectForKey:](self->_viewControllerToItemContext, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nestedPagingScrollView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4;
  if (v6)
  {
    -[SKUIScrollingTabBarContentCollectionView bounds](self->_contentCollectionView, "bounds");
    Width = CGRectGetWidth(v12);
    if (Width >= 2.0)
      v9 = Width;
    else
      v9 = 2.0;
    objc_msgSend(v6, "contentOffset");
    if (v10 < 0.0)
      v10 = 0.0;
    objc_msgSend(v5, "viewControllerInNestedPagingScrollViewAtPageIndex:", vcvtmd_u64_f64(v10 / v9));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (void)_discardUndesirableLastSelectedPageIndexesWithHorizontalLayoutContext:(id *)a3
{
  NSArray *viewControllers;
  unint64_t var0;
  void *v6;
  id v7;

  if (a3->var0 != a3->var1)
  {
    viewControllers = self->_viewControllers;
    if (a3->var2 >= 0.5)
      var0 = a3->var0;
    else
      var0 = a3->var1;
    -[NSArray objectAtIndex:](viewControllers, "objectAtIndex:", var0);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMapTable objectForKey:](self->_viewControllerToItemContext, "objectForKey:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLastSelectedPageIndex:", 0);

  }
}

- (double)_effectiveBottomBarOffset
{
  double result;

  if (self->_tabBarExplicitlyHidden)
  {
    -[SKUIScrollingTabBarController _viewControllerContentScrollViewContentInsetDescriptor](self, "_viewControllerContentScrollViewContentInsetDescriptor", 0, 0, 0, 0);
    return 0.0;
  }
  else
  {
    -[SKUIDynamicBarAnimator bottomBarOffset](self->_dynamicBarAnimator, "bottomBarOffset");
  }
  return result;
}

- (double)_effectiveTopBarHeight
{
  void *v2;
  void *v3;
  double Height;
  double result;
  CGRect v6;

  if (self->_tabBarExplicitlyHidden)
  {
    -[UIViewController navigationController](self->_focusedViewController, "navigationController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "navigationBar");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bounds");
    Height = CGRectGetHeight(v6);

    return Height;
  }
  else
  {
    -[SKUIDynamicBarAnimator topBarHeight](self->_dynamicBarAnimator, "topBarHeight");
  }
  return result;
}

- (BOOL)_focusedContentScrollViewIsScrolledToOrPastBottom
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect v8;

  -[UIScrollView contentSize](self->_focusedContentScrollView, "contentSize");
  v4 = v3;
  -[UIScrollView contentInset](self->_focusedContentScrollView, "contentInset");
  v6 = v5;
  -[UIScrollView bounds](self->_focusedContentScrollView, "bounds");
  return CGRectGetMaxY(v8) >= v4 + v6;
}

- (void)_invalidateContentCollectionViewLayoutForUpdatedContentSizeWithHorizontalLayoutContext:(id *)a3 indexOfViewControllerWithUpdatedContentSize:(unint64_t)a4
{
  uint64_t v7;
  double v8;
  BOOL v9;
  void *v10;
  void *v11;
  double Width;
  NSMapTable *viewControllerToItemContext;
  void *v14;
  void *v15;
  double v16;
  double v17;
  id v18;
  void *v19;
  id v20;
  CGRect v21;

  -[SKUIScrollingTabBarContentCollectionView collectionViewLayout](self->_contentCollectionView, "collectionViewLayout");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v9 = a3->var0 != a4 || a3->var0 == a3->var1;
  v20 = (id)v7;
  if (v9)
  {
    v17 = *MEMORY[0x1E0C9D538];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a4, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "layoutAttributesForItemAtIndexPath:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "frame");
    Width = CGRectGetWidth(v21);

    viewControllerToItemContext = self->_viewControllerToItemContext;
    -[NSArray objectAtIndex:](self->_viewControllers, "objectAtIndex:", a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable objectForKey:](viewControllerToItemContext, "objectForKey:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "nestedPagingScrollViewContentWidth");
    v17 = v16 - Width;

  }
  v18 = objc_alloc_init((Class)objc_msgSend((id)objc_opt_class(), "invalidationContextClass"));
  objc_msgSend(v18, "setInvalidateFlowLayoutDelegateMetrics:", 1);
  objc_msgSend(v18, "setContentOffsetAdjustment:", v17, v8);
  -[SKUIScrollingTabBarContentCollectionView collectionViewLayout](self->_contentCollectionView, "collectionViewLayout");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "invalidateLayoutWithContext:", v18);

}

- (void)_notifyViewControllerAppearanceProgressUpdateWithHorizontalLayoutContext:(id *)a3
{
  unint64_t var0;
  unint64_t var1;
  double v8;
  _BOOL8 v10;
  void *v11;
  double var2;
  void *v13;
  void *v14;
  id v15;

  var0 = a3->var0;
  var1 = a3->var1;
  v8 = 1.0 - a3->var2;
  v10 = v8 < 0.999999881 && var1 == var0;
  -[NSArray objectAtIndex:](self->_viewControllers, "objectAtIndex:");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](self->_viewControllerToItemContext, "objectForKey:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "notifyOfUpdatedAppearanceStatus:", *(_QWORD *)&v8, v10);
  if (a3->var1 != a3->var0)
  {
    var2 = a3->var2;
    -[NSArray objectAtIndex:](self->_viewControllers, "objectAtIndex:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable objectForKey:](self->_viewControllerToItemContext, "objectForKey:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "notifyOfUpdatedAppearanceStatus:", *(_QWORD *)&var2, 0);

  }
}

- (id)_parentCellForViewController:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a3;
  if (objc_msgSend(v3, "isViewLoaded"))
  {
    objc_msgSend(v3, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "superview");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      do
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          break;
        objc_msgSend(v5, "superview");
        v6 = objc_claimAutoreleasedReturnValue();

        v5 = (void *)v6;
      }
      while (v6);
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_animatePaletteWithSetup:(id)a3 animations:(id)a4 completion:(id)a5
{
  void (**v8)(_QWORD);
  id v9;
  id v10;
  unint64_t activePaletteTransitions;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;

  v8 = (void (**)(_QWORD))a3;
  v9 = a4;
  v10 = a5;
  activePaletteTransitions = self->_activePaletteTransitions;
  if (!activePaletteTransitions)
  {
    -[SKUIScrollingTabBarPalette bounds](self->_tabBarPalette, "bounds");
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v14, v13 + -5.0, v15, v12 + 5.0);
    objc_msgSend(v16, "setClipsToBounds:", 1);
    objc_msgSend(v16, "addSubview:", self->_tabBarPalette);
    -[SKUIScrollingTabBarPalette layer](self->_tabBarPalette, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setValue:forKey:", v16, CFSTR("SKUIScrollingTabBarPaletteClippingView"));

    -[UIView insertSubview:belowSubview:](self->_tabBarContainerView, "insertSubview:belowSubview:", v16, self->_tabBar);
    -[SKUIScrollingTabBarPalette setTabBarBackgroundExtendsBehindPalette:](self->_tabBarPalette, "setTabBarBackgroundExtendsBehindPalette:", 0);
    -[SKUIScrollingTabBarController _updateTabBarBackgroundsAndHairlines](self, "_updateTabBarBackgroundsAndHairlines");
    if (v8)
      v8[2](v8);

    activePaletteTransitions = self->_activePaletteTransitions;
  }
  self->_activePaletteTransitions = activePaletteTransitions + 1;
  v18 = SKUIMPUFoundationFramework();
  v19 = SKUIWeakLinkedClassForString(CFSTR("MPUSpringAnimationFactory"), v18);
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __80__SKUIScrollingTabBarController__animatePaletteWithSetup_animations_completion___block_invoke;
  v21[3] = &unk_1E73A0248;
  v21[4] = self;
  v22 = v10;
  v20 = v10;
  objc_msgSend(v19, "animateUsingSpringWithDamping:mass:stiffness:velocity:animations:options:completion:", v9, 1024, v21, 700.0, 2.0, 300.0, 0.0);

}

void __80__SKUIScrollingTabBarController__animatePaletteWithSetup_animations_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  --*(_QWORD *)(*(_QWORD *)(a1 + 32) + 1040);
  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v2 + 1040))
  {
    objc_msgSend(*(id *)(v2 + 1288), "setTabBarBackgroundExtendsBehindPalette:", 1);
    objc_msgSend(*(id *)(a1 + 32), "_updateTabBarBackgroundsAndHairlines");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1288), "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "valueForKey:", CFSTR("SKUIScrollingTabBarPaletteClippingView"));
    v8 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1288), "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValue:forKey:", 0, CFSTR("SKUIScrollingTabBarPaletteClippingView"));

    objc_msgSend(v8, "removeFromSuperview");
    v7 = *(_QWORD *)(a1 + 40);
    if (v7)
      (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, a2);

  }
}

- (void)_popVisibleNavigationStacksToRootWithHorizontalLayoutContext:(id *)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a3->var0 != a3->var1)
  {
    -[SKUIScrollingTabBarContentCollectionView visibleCells](self->_contentCollectionView, "visibleCells");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v10;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7), "viewController");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v8, "conformsToProtocol:", &unk_1EF4AAE30))
            objc_msgSend(v8, "popToNavigationStackRootContentAnimated:withBehavior:", 0, 1);

          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v5);
    }

  }
}

- (UIOffset)_roundedOffsetFromOffset:(UIOffset)a3
{
  CGFloat vertical;
  CGFloat horizontal;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  UIOffset result;

  vertical = a3.vertical;
  horizontal = a3.horizontal;
  if (-[SKUIScrollingTabBarController isViewLoaded](self, "isViewLoaded"))
  {
    -[SKUIScrollingTabBarController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    UIRoundToViewScale();
    horizontal = v7;
    UIRoundToViewScale();
    vertical = v8;

  }
  v9 = horizontal;
  v10 = vertical;
  result.vertical = v10;
  result.horizontal = v9;
  return result;
}

- (void)_setFocusedViewController:(id)a3 showBarsIfNeeded:(BOOL)a4 animated:(BOOL)a5 notifyDelegate:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  UIViewController *v10;
  UIViewController *v11;
  UIViewController **p_focusedViewController;
  UIViewController *focusedViewController;
  UIScrollView *focusedContentScrollView;
  UIViewController *topLevelFocusedViewController;
  UIScrollView *v16;
  UIScrollView *v17;
  UIScrollView *v18;
  void *v19;
  UIViewController *v20;

  v6 = a6;
  v7 = a4;
  v10 = (UIViewController *)a3;
  v20 = v10;
  if (v10)
  {
    -[SKUIScrollingTabBarController _deepestFocusedViewControllerWithTopLevelFocusedViewController:](self, "_deepestFocusedViewControllerWithTopLevelFocusedViewController:", v10);
    v11 = (UIViewController *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  p_focusedViewController = &self->_focusedViewController;
  focusedViewController = self->_focusedViewController;
  if (focusedViewController != v11)
  {
    if (self->_canHideBarsOnSwipe
      && -[UIViewController conformsToProtocol:](focusedViewController, "conformsToProtocol:", &unk_1EF408B00))
    {
      -[UIViewController setScrollViewDelegateObserver:](*p_focusedViewController, "setScrollViewDelegateObserver:", 0);
    }
    focusedContentScrollView = self->_focusedContentScrollView;
    if (focusedContentScrollView)
      -[UIScrollView removeObserver:forKeyPath:context:](focusedContentScrollView, "removeObserver:forKeyPath:context:", self, CFSTR("contentSize"), _SKUIScrollingTabFocusedContentScrollViewContentSizeObservationContext);
    topLevelFocusedViewController = self->_topLevelFocusedViewController;
    if (topLevelFocusedViewController != v20)
      objc_storeStrong((id *)&self->_topLevelFocusedViewController, a3);
    objc_storeStrong((id *)&self->_focusedViewController, v11);
    -[UIViewController contentScrollView](v11, "contentScrollView");
    v16 = (UIScrollView *)objc_claimAutoreleasedReturnValue();
    v17 = self->_focusedContentScrollView;
    self->_focusedContentScrollView = v16;

    v18 = self->_focusedContentScrollView;
    if (v18)
      -[UIScrollView addObserver:forKeyPath:options:context:](v18, "addObserver:forKeyPath:options:context:", self, CFSTR("contentSize"), 0, _SKUIScrollingTabFocusedContentScrollViewContentSizeObservationContext);
    if (self->_canHideBarsOnSwipe
      && -[UIViewController conformsToProtocol:](*p_focusedViewController, "conformsToProtocol:", &unk_1EF408B00))
    {
      -[UIViewController setScrollViewDelegateObserver:](*p_focusedViewController, "setScrollViewDelegateObserver:", self);
    }
    if (v7)
      -[SKUIDynamicBarAnimator attemptTransitionToState:animated:](self->_dynamicBarAnimator, "attemptTransitionToState:animated:", 1, 1);
    -[SKUIScrollingTabBarController _updateHidesBarsOnSwipeAvailability](self, "_updateHidesBarsOnSwipeAvailability");
    -[SKUIScrollingTabBarController _updateHorizontalScrollingAvailability](self, "_updateHorizontalScrollingAvailability");
    if (topLevelFocusedViewController != v20)
    {
      -[SKUIScrollingTabBarController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
      if (v6)
      {
        -[SKUIScrollingTabBarController delegate](self, "delegate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v19, "tabBarController:didSelectViewController:", self, self->_topLevelFocusedViewController);

      }
    }
  }

}

- (void)_selectTabAtIndex:(unint64_t)a3 shouldFallbackToPoppingToTabRootContent:(BOOL)a4
{
  _BOOL4 v4;
  SKUIScrollingTabBarContentCollectionView *contentCollectionView;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double MinX;
  void *v14;
  void *v15;
  double Width;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  SKUIScrollingTabBarContentCollectionView *v23;
  double v24;
  double v25;
  uint64_t v26;
  UIViewController *v27;
  void *v28;
  void *v29;
  int v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  id v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;

  v4 = a4;
  contentCollectionView = self->_contentCollectionView;
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a3, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIScrollingTabBarContentCollectionView layoutAttributesForItemAtIndexPath:](contentCollectionView, "layoutAttributesForItemAtIndexPath:", v8);
  v37 = (id)objc_claimAutoreleasedReturnValue();

  -[SKUIScrollingTabBarContentCollectionView contentOffset](self->_contentCollectionView, "contentOffset");
  v10 = v9;
  v12 = v11;
  objc_msgSend(v37, "frame");
  MinX = CGRectGetMinX(v38);
  -[NSArray objectAtIndex:](self->_viewControllers, "objectAtIndex:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](self->_viewControllerToItemContext, "objectForKey:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIScrollingTabBarContentCollectionView bounds](self->_contentCollectionView, "bounds");
  Width = CGRectGetWidth(v39);
  v17 = MinX + Width * (double)(unint64_t)objc_msgSend(v15, "lastSelectedPageIndex");
  -[SKUIScrollingTabBarContentCollectionView collectionViewLayout](self->_contentCollectionView, "collectionViewLayout");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "targetContentOffsetForProposedContentOffset:", v17, v12);
  v20 = v19;
  v22 = v21;

  if (vabdd_f64(v20, v10) > 0.00000011920929)
  {
    v23 = self->_contentCollectionView;
    v24 = v20;
    v25 = v22;
    v26 = 0;
LABEL_13:
    -[SKUIScrollingTabBarContentCollectionView setContentOffset:animated:](v23, "setContentOffset:animated:", v26, v24, v25);
    goto LABEL_14;
  }
  if (v4)
  {
    if (-[UIViewController conformsToProtocol:](self->_topLevelFocusedViewController, "conformsToProtocol:", &unk_1EF4AAE30))
    {
      v27 = self->_topLevelFocusedViewController;
      if ((-[UIViewController isShowingNavigationStackRootContent](v27, "isShowingNavigationStackRootContent") & 1) == 0)
      {
        -[SKUIScrollingTabBarController delegate](self, "delegate");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[SKUIScrollingTabBarController delegate](self, "delegate");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v29, "tabBarController:shouldFallbackToRootForController:", self, v14);

          if (v30)
          {
            -[UIViewController popToNavigationStackRootContentAnimated:withBehavior:](v27, "popToNavigationStackRootContentAnimated:withBehavior:", 1, 0);

            goto LABEL_14;
          }
        }
        else
        {

        }
      }

    }
    if (objc_msgSend(v15, "lastSelectedPageIndex"))
    {
      objc_msgSend(v37, "frame");
      v31 = CGRectGetMinX(v40);
      -[SKUIScrollingTabBarContentCollectionView collectionViewLayout](self->_contentCollectionView, "collectionViewLayout");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "targetContentOffsetForProposedContentOffset:", v31, v22);
      v34 = v33;
      v36 = v35;

      v23 = self->_contentCollectionView;
      v24 = v34;
      v25 = v36;
      v26 = 1;
      goto LABEL_13;
    }
  }
LABEL_14:

}

- (void)_setViewControllers:(id)a3 collectionViewsUpdateHandler:(id)a4 forFinalTearDown:(BOOL)a5
{
  NSArray *v8;
  void (**v9)(void);
  NSArray *viewControllers;
  void *v11;
  NSArray *v12;
  NSArray *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _OWORD *v18;
  uint64_t i;
  void *v20;
  SKUIScrollingTabBarController *v21;
  void *v22;
  __int128 v23;
  void *v24;
  void *v25;
  NSArray *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  void *v32;
  SKUIScrollingTabBarControllerItemContext *v33;
  NSMapTable *viewControllerToItemContext;
  NSMapTable *v35;
  NSMapTable *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t k;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t m;
  void *v47;
  UIViewController *v48;
  UIViewController *focusedViewController;
  UIViewController *v50;
  void *v51;
  NSUInteger v52;
  unint64_t v53;
  SKUIScrollingTabBarController *v54;
  unint64_t v55;
  NSUInteger v56;
  double Width;
  unint64_t v58;
  double v59;
  double v60;
  double v61;
  unint64_t v62;
  BOOL v63;
  UIViewController *v64;
  UIViewController *v65;
  NSArray *v66;
  void (**v67)(void);
  NSUInteger v68;
  id v69;
  void *v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _OWORD v83[2];
  uint64_t v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  _BYTE v89[128];
  _BYTE v90[128];
  _BYTE v91[128];
  _BYTE v92[128];
  uint64_t v93;
  CGRect v94;

  v93 = *MEMORY[0x1E0C80C00];
  v8 = (NSArray *)a3;
  v9 = (void (**)(void))a4;
  viewControllers = self->_viewControllers;
  if (viewControllers == v8 || -[NSArray isEqualToArray:](viewControllers, "isEqualToArray:", v8))
    goto LABEL_74;
  v63 = a5;
  v67 = v9;
  v65 = self->_transientViewController;
  if (v65)
    -[SKUIScrollingTabBarController setTransientViewController:animated:](self, "setTransientViewController:animated:", 0, 0);
  v64 = self->_topLevelFocusedViewController;
  v62 = -[SKUIScrollingTabBarController selectedIndex](self, "selectedIndex");
  v11 = (void *)-[NSArray copy](self->_viewControllers, "copy");
  v66 = v8;
  v12 = (NSArray *)-[NSArray copy](v8, "copy");
  v13 = self->_viewControllers;
  self->_viewControllers = v12;

  ++self->_referenceCountForIgnoringContentOffsetUpdateRequests;
  v70 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v11, "count"));
  v85 = 0u;
  v86 = 0u;
  v87 = 0u;
  v88 = 0u;
  v14 = v11;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v85, v92, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v86;
    v18 = (_OWORD *)MEMORY[0x1E0DC49E8];
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v86 != v17)
          objc_enumerationMutation(v14);
        v20 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * i);
        if (!-[NSArray containsObject:](self->_viewControllers, "containsObject:", v20))
        {
          objc_msgSend(v20, "parentViewController");
          v21 = (SKUIScrollingTabBarController *)objc_claimAutoreleasedReturnValue();

          if (v21 == self)
          {
            objc_msgSend(v70, "addObject:", v20);
            objc_msgSend(v20, "willMoveToParentViewController:", 0);
          }
          -[NSMapTable objectForKey:](self->_viewControllerToItemContext, "objectForKey:", v20);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "prepareViewControllerForTearDown");
          v23 = v18[1];
          v83[0] = *v18;
          v83[1] = v23;
          v84 = 0;
          objc_msgSend(v22, "applyNewContentInsetDescriptor:", v83);
          -[SKUIScrollingTabBarController _parentCellForViewController:](self, "_parentCellForViewController:", v20);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setViewController:", 0);
          -[NSMapTable removeObjectForKey:](self->_viewControllerToItemContext, "removeObjectForKey:", v20);

        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v85, v92, 16);
    }
    while (v16);
  }

  --self->_referenceCountForIgnoringContentOffsetUpdateRequests;
  v68 = -[NSArray count](self->_viewControllers, "count");
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v68);
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  v82 = 0u;
  v26 = self->_viewControllers;
  v27 = -[NSArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v79, v91, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v80;
    do
    {
      for (j = 0; j != v28; ++j)
      {
        if (*(_QWORD *)v80 != v29)
          objc_enumerationMutation(v26);
        v31 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * j);
        if ((objc_msgSend(v14, "containsObject:", v31) & 1) == 0)
        {
          objc_msgSend(v25, "addObject:", v31);
          if (objc_msgSend(v31, "conformsToProtocol:", &unk_1EF404628))
          {
            -[SKUIViewController clientContext](self, "clientContext");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "setClientContext:", v32);

          }
          -[SKUIScrollingTabBarController addChildViewController:](self, "addChildViewController:", v31);
          v33 = -[SKUIScrollingTabBarControllerItemContext initWithViewController:]([SKUIScrollingTabBarControllerItemContext alloc], "initWithViewController:", v31);
          -[SKUIScrollingTabBarControllerItemContext setDelegate:](v33, "setDelegate:", self);
          viewControllerToItemContext = self->_viewControllerToItemContext;
          if (!viewControllerToItemContext)
          {
            v35 = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, v68);
            v36 = self->_viewControllerToItemContext;
            self->_viewControllerToItemContext = v35;

            viewControllerToItemContext = self->_viewControllerToItemContext;
          }
          -[NSMapTable setObject:forKey:](viewControllerToItemContext, "setObject:forKey:", v33, v31);

        }
      }
      v28 = -[NSArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v79, v91, 16);
    }
    while (v28);
  }

  if (v67)
    v67[2]();
  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  v37 = v25;
  v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v75, v90, 16);
  if (v38)
  {
    v39 = v38;
    v40 = *(_QWORD *)v76;
    do
    {
      for (k = 0; k != v39; ++k)
      {
        if (*(_QWORD *)v76 != v40)
          objc_enumerationMutation(v37);
        objc_msgSend(*(id *)(*((_QWORD *)&v75 + 1) + 8 * k), "didMoveToParentViewController:", self);
      }
      v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v75, v90, 16);
    }
    while (v39);
  }
  v69 = v37;

  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  v42 = v70;
  v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v71, v89, 16);
  if (v43)
  {
    v44 = v43;
    v45 = *(_QWORD *)v72;
    do
    {
      for (m = 0; m != v44; ++m)
      {
        if (*(_QWORD *)v72 != v45)
          objc_enumerationMutation(v42);
        v47 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * m);
        objc_msgSend(v47, "removeFromParentViewController");
        -[SKUIScrollingTabBarController _deepestFocusedViewControllerWithTopLevelFocusedViewController:](self, "_deepestFocusedViewControllerWithTopLevelFocusedViewController:", v47);
        v48 = (UIViewController *)objc_claimAutoreleasedReturnValue();
        focusedViewController = self->_focusedViewController;

        if (v48 == focusedViewController)
          -[SKUIScrollingTabBarController _setFocusedViewController:showBarsIfNeeded:animated:notifyDelegate:](self, "_setFocusedViewController:showBarsIfNeeded:animated:notifyDelegate:", 0, 1, 0, 0);
        if (objc_msgSend(v47, "conformsToProtocol:", &unk_1EF404628))
          objc_msgSend(v47, "setClientContext:", 0);
      }
      v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v71, v89, 16);
    }
    while (v44);
  }

  if (v63 || !-[SKUIScrollingTabBarController isViewLoaded](self, "isViewLoaded"))
  {
    v50 = v64;
    v51 = v69;
    if (!v64)
      goto LABEL_71;
  }
  else
  {
    -[SKUIScrollingTabBarController _updateTabBarButtons](self, "_updateTabBarButtons");
    v50 = v64;
    if (!v64)
    {
      -[SKUIScrollingTabBarController _updateForHorizontalLayoutChange](self, "_updateForHorizontalLayoutChange");
      v51 = v69;
      goto LABEL_71;
    }
    -[SKUIScrollingTabBarContentCollectionView setNeedsLayout](self->_contentCollectionView, "setNeedsLayout");
    v51 = v69;
  }
  v52 = -[NSArray indexOfObject:](self->_viewControllers, "indexOfObject:", v50);
  if (v52 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v56 = v52;
    -[SKUIScrollingTabBarContentCollectionView bounds](self->_contentCollectionView, "bounds");
    Width = CGRectGetWidth(v94);
    v58 = v62;
    if (Width > 0.00000011920929)
    {
      -[SKUIScrollingTabBarContentCollectionView contentSize](self->_contentCollectionView, "contentSize");
      v60 = v59;
      -[SKUIScrollingTabBarContentCollectionView contentOffset](self->_contentCollectionView, "contentOffset");
      if (v61 < 0.0)
        v61 = 0.0;
      if (v61 >= v60 - Width)
        v61 = v60 - Width;
      v58 = vcvtad_u64_f64(v61 / Width);
    }
    if (v58 == v56)
      goto LABEL_71;
    v54 = self;
    v55 = v56;
    goto LABEL_69;
  }
  if (v62 >= -[NSArray count](self->_viewControllers, "count"))
    v53 = 0;
  else
    v53 = v62;
  if (v53 < -[NSArray count](self->_viewControllers, "count")
    && v53 != -[SKUIScrollingTabBarController selectedIndex](self, "selectedIndex"))
  {
    v54 = self;
    v55 = v53;
LABEL_69:
    -[SKUIScrollingTabBarController setSelectedIndex:](v54, "setSelectedIndex:", v55);
  }
LABEL_71:
  if (v65)
    -[SKUIScrollingTabBarController setTransientViewController:animated:](self, "setTransientViewController:animated:", v65, 0);

  v8 = v66;
  v9 = v67;
LABEL_74:

}

- (id)_tabBarBackdropGroupName
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> Backdrop Group"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_updateAdditionalPositionOffsetsWithUpdateRecord:(id *)a3
{
  _BOOL4 var0;
  _BOOL4 var2;
  double vertical;
  double horizontal;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  if (!self->_tabBarExplicitlyHidden)
  {
    var0 = a3->var0;
    var2 = a3->var2;
    horizontal = a3->var1.horizontal;
    vertical = a3->var1.vertical;
    v9 = a3->var3.horizontal;
    v8 = a3->var3.vertical;
    if (a3->var0)
    {
      -[UIView center](self->_tabBarContainerView, "center");
      -[UIView setCenter:](self->_tabBarContainerView, "setCenter:", v10 - horizontal + self->_additionalTabBarButtonsContainerPositionOffset.horizontal, v11 - vertical + self->_additionalTabBarButtonsContainerPositionOffset.vertical);
    }
    else if (!a3->var2)
    {
      return;
    }
    if (-[SKUIScrollingTabBarPalette isAttached](self->_tabBarPalette, "isAttached"))
    {
      -[SKUIScrollingTabBarPalette center](self->_tabBarPalette, "center");
      if (var0)
      {
        v12 = horizontal + v12 - self->_additionalTabBarButtonsContainerPositionOffset.horizontal;
        v13 = vertical + v13 - self->_additionalTabBarButtonsContainerPositionOffset.vertical;
      }
      if (var2)
      {
        v12 = v12 - v9 + self->_additionalTabBarPalettePositionOffset.horizontal;
        v13 = v13 - v8 + self->_additionalTabBarPalettePositionOffset.vertical;
      }
      -[SKUIScrollingTabBarPalette setCenter:](self->_tabBarPalette, "setCenter:", v12, v13);
    }
  }
}

- (void)_updateDynamicBarGeometry
{
  void *v3;
  void *v4;
  double Height;
  void *v6;
  double v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;

  -[UIViewController navigationController](self->_focusedViewController, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  Height = CGRectGetHeight(v18);

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "statusBarFrame");
  v7 = CGRectGetHeight(v19);

  -[SKUIDynamicBarAnimator setTopBarHeight:forState:](self->_dynamicBarAnimator, "setTopBarHeight:forState:", 1, Height);
  -[SKUIDynamicBarAnimator setTopBarHeight:forState:](self->_dynamicBarAnimator, "setTopBarHeight:forState:", 0, -1.0 - v7);
  -[SKUIDynamicBarAnimator setBottomBarOffset:forState:](self->_dynamicBarAnimator, "setBottomBarOffset:forState:", 1, 0.0);
  -[SKUIDynamicBarAnimator setBottomBarOffset:forState:](self->_dynamicBarAnimator, "setBottomBarOffset:forState:", 0, 49.0);
  -[UIScrollView bounds](self->_focusedContentScrollView, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[UIScrollView contentInset](self->_focusedContentScrollView, "contentInset");
  v17 = Height - v16;
  v20.origin.x = v9;
  v20.origin.y = v11;
  v20.size.width = v13;
  v20.size.height = v15;
  -[SKUIDynamicBarAnimator setMinimumTopBarHeight:](self->_dynamicBarAnimator, "setMinimumTopBarHeight:", v17 - CGRectGetMinY(v20));
  -[SKUIDynamicBarAnimator setMaximumBottomBarOffset:](self->_dynamicBarAnimator, "setMaximumBottomBarOffset:", 1.79769313e308);
}

- (void)_updateFocusedViewControllerInsetsForVerticalLayoutChange
{
  void *v3;
  void *v4;
  void *v5;
  double MaxY;
  CGRect v7;

  -[SKUIScrollingTabBarController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController navigationController](self->_focusedViewController, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "navigationBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SKUIScrollingTabBarController _viewControllerContentScrollViewContentInsetDescriptor](self, "_viewControllerContentScrollViewContentInsetDescriptor", 0, 0);
  objc_msgSend(v5, "bounds");
  objc_msgSend(v3, "convertRect:fromView:", v5);
  MaxY = CGRectGetMaxY(v7);
  -[SKUIScrollingTabBarController _effectiveBottomBarOffset](self, "_effectiveBottomBarOffset");
  -[UIScrollView contentInset](self->_focusedContentScrollView, "contentInset");
  -[UIScrollView setContentInset:](self->_focusedContentScrollView, "setContentInset:", MaxY);
  -[UIScrollView scrollIndicatorInsets](self->_focusedContentScrollView, "scrollIndicatorInsets");
  -[UIScrollView setScrollIndicatorInsets:](self->_focusedContentScrollView, "setScrollIndicatorInsets:", MaxY);

}

- (void)_updateFocusedViewControllerWithHorizontalLayoutContext:(id *)a3
{
  double var2;
  unint64_t var0;
  id v7;

  var2 = a3->var2;
  if (var2 == (double)a3->var1 || var2 <= 0.5)
    var0 = a3->var0;
  else
    var0 = a3->var1;
  -[NSArray objectAtIndex:](self->_viewControllers, "objectAtIndex:", var0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[SKUIScrollingTabBarController _setFocusedViewController:showBarsIfNeeded:animated:notifyDelegate:](self, "_setFocusedViewController:showBarsIfNeeded:animated:notifyDelegate:", v7, 1, 1, 1);

}

- (void)_updateForHorizontalLayoutChange
{
  double x;
  double y;
  double width;
  double height;
  double v7;
  double v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  double v30;
  double v31;
  double v32;
  uint64_t v33;
  uint64_t v34;
  double v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;

  v41 = *MEMORY[0x1E0C80C00];
  -[SKUIScrollingTabBarContentCollectionView bounds](self->_contentCollectionView, "bounds");
  x = v42.origin.x;
  y = v42.origin.y;
  width = v42.size.width;
  height = v42.size.height;
  v7 = CGRectGetWidth(v42);
  if (v7 >= 2.0)
    v8 = v7;
  else
    v8 = 2.0;
  -[SKUIScrollingTabBarContentCollectionView collectionViewLayout](self->_contentCollectionView, "collectionViewLayout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layoutAttributesForElementsInRect:", x, y, width, height);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v12)
  {
    v13 = v12;
    v14 = 0;
    v15 = 0;
    v16 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v37 != v16)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * i), "frame");
        v49.origin.x = v18;
        v49.origin.y = v19;
        v49.size.width = v20;
        v49.size.height = v21;
        v43.origin.x = x;
        v43.origin.y = y;
        v43.size.width = width;
        v43.size.height = height;
        if (!CGRectIntersectsRect(v43, v49))
        {
          if (!v14)
            v14 = objc_alloc_init(MEMORY[0x1E0CB3788]);
          objc_msgSend(v14, "addIndex:", v15 + i);
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      v15 += i;
    }
    while (v13);
  }
  else
  {
    v14 = 0;
  }

  if (objc_msgSend(v14, "count"))
  {
    v22 = (void *)objc_msgSend(v11, "mutableCopy");
    objc_msgSend(v22, "removeObjectsAtIndexes:", v14);

    v11 = v22;
  }
  objc_msgSend(v11, "sortedArrayUsingComparator:", &__block_literal_global_156);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v23, "count"))
  {
    objc_msgSend(v23, "firstObject");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "indexPath");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "item");

    objc_msgSend(v23, "lastObject");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "indexPath");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "item");

    if (v29 == v26 + 1)
    {
      objc_msgSend(v27, "frame");
      v50.origin.x = x;
      v50.origin.y = y;
      v50.size.width = width;
      v50.size.height = height;
      v45 = CGRectIntersection(v44, v50);
      v30 = CGRectGetWidth(v45) / v8;
    }
    else
    {
      objc_msgSend(v24, "frame");
      v51.origin.x = x;
      v51.origin.y = y;
      v51.size.width = width;
      v51.size.height = height;
      v47 = CGRectIntersection(v46, v51);
      v31 = CGRectGetWidth(v47);
      v48.origin.x = x;
      v48.origin.y = y;
      v48.size.width = width;
      v48.size.height = height;
      v30 = 1.0 - v31 / CGRectGetWidth(v48);
    }
    if (v30 < 0.0)
      v30 = 0.0;
    v32 = fmin(v30, 1.0);
    if (self->_indexOfViewControllerWithUpdatedContentSize == 0x7FFFFFFFFFFFFFFFLL)
    {
      v33 = v26;
      v34 = v29;
      v35 = v32;
      -[SKUIScrollingTabBarController _popVisibleNavigationStacksToRootWithHorizontalLayoutContext:](self, "_popVisibleNavigationStacksToRootWithHorizontalLayoutContext:", &v33);
      -[SKUIScrollingTabBarController _updateLayoutOfVisibleCollectionViewCells](self, "_updateLayoutOfVisibleCollectionViewCells");
      v33 = v26;
      v34 = v29;
      v35 = v32;
      -[SKUIScrollingTabBarController _updateTabBarButtonsSelectionProgressWithHorizontalLayoutContext:](self, "_updateTabBarButtonsSelectionProgressWithHorizontalLayoutContext:", &v33);
      v33 = v26;
      v34 = v29;
      v35 = v32;
      -[SKUIScrollingTabBarController _updateFocusedViewControllerWithHorizontalLayoutContext:](self, "_updateFocusedViewControllerWithHorizontalLayoutContext:", &v33);
      v33 = v26;
      v34 = v29;
      v35 = v32;
      -[SKUIScrollingTabBarController _discardUndesirableLastSelectedPageIndexesWithHorizontalLayoutContext:](self, "_discardUndesirableLastSelectedPageIndexesWithHorizontalLayoutContext:", &v33);
      v33 = v26;
      v34 = v29;
      v35 = v32;
      -[SKUIScrollingTabBarController _notifyViewControllerAppearanceProgressUpdateWithHorizontalLayoutContext:](self, "_notifyViewControllerAppearanceProgressUpdateWithHorizontalLayoutContext:", &v33);
    }
    else
    {
      v33 = v26;
      v34 = v29;
      v35 = v32;
      -[SKUIScrollingTabBarController _invalidateContentCollectionViewLayoutForUpdatedContentSizeWithHorizontalLayoutContext:indexOfViewControllerWithUpdatedContentSize:](self, "_invalidateContentCollectionViewLayoutForUpdatedContentSizeWithHorizontalLayoutContext:indexOfViewControllerWithUpdatedContentSize:", &v33);
      self->_indexOfViewControllerWithUpdatedContentSize = 0x7FFFFFFFFFFFFFFFLL;
      -[SKUIScrollingTabBarContentCollectionView layoutIfNeeded](self->_contentCollectionView, "layoutIfNeeded");
    }

  }
}

uint64_t __65__SKUIScrollingTabBarController__updateForHorizontalLayoutChange__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "indexPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "item");

  objc_msgSend(v4, "indexPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "item");
  v9 = -1;
  if (v6 >= v8)
    v9 = 1;
  if (v6 == v8)
    return 0;
  else
    return v9;
}

- (void)_updateHidesBarsOnSwipeAvailability
{
  UIScrollView *focusedContentScrollView;
  _BOOL4 v4;
  SKUIScrollingTabBarController *v5;
  double v6;
  double v7;
  void *v8;
  CGRect v9;

  focusedContentScrollView = self->_focusedContentScrollView;
  if (!focusedContentScrollView || self->_transientViewController || self->_tabBarExplicitlyHidden)
  {
    v4 = 0;
  }
  else
  {
    -[UIScrollView contentSize](focusedContentScrollView, "contentSize");
    v7 = v6;
    -[SKUIScrollingTabBarController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    v4 = v7 > CGRectGetHeight(v9) * 1.5;

  }
  if (self->_canHideBarsOnSwipe != v4)
  {
    self->_canHideBarsOnSwipe = v4;
    if (-[UIViewController conformsToProtocol:](self->_focusedViewController, "conformsToProtocol:", &unk_1EF408B00))
    {
      if (self->_canHideBarsOnSwipe)
        v5 = self;
      else
        v5 = 0;
      -[UIViewController setScrollViewDelegateObserver:](self->_focusedViewController, "setScrollViewDelegateObserver:", v5);
    }
    if (!self->_canHideBarsOnSwipe)
      -[SKUIDynamicBarAnimator attemptTransitionToState:animated:](self->_dynamicBarAnimator, "attemptTransitionToState:animated:", 1, 0);
  }
}

- (void)_updateHorizontalScrollingAvailability
{
  uint64_t v3;

  if (self->_scrollEnabled)
  {
    if (-[UIViewController conformsToProtocol:](self->_topLevelFocusedViewController, "conformsToProtocol:", &unk_1EF4AAE30))v3 = -[UIViewController isShowingNavigationStackRootContent](self->_topLevelFocusedViewController, "isShowingNavigationStackRootContent");
    else
      v3 = 1;
  }
  else
  {
    v3 = 0;
  }
  -[SKUIScrollingTabBarContentCollectionView setScrollEnabled:](self->_contentCollectionView, "setScrollEnabled:", v3);
}

- (void)_updateLayoutOfCollectionViewCell:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double Width;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  CGFloat x;
  CGFloat y;
  CGFloat v27;
  CGFloat height;
  double v29;
  double v30;
  double v31;
  double v32;
  double MinY;
  unint64_t v34;
  void *v35;
  char v36;
  void *v37;
  id v38;
  double v39;
  double v40;
  CGFloat v41;
  double v42;
  double v43;
  double v44;
  double v45;
  id v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;

  v4 = a3;
  objc_msgSend(v4, "layoutIfNeeded");
  objc_msgSend(v4, "viewController");
  v46 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewControllerContainerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[SKUIScrollingTabBarContentCollectionView contentSize](self->_contentCollectionView, "contentSize");
  v40 = v15;
  -[SKUIScrollingTabBarContentCollectionView bounds](self->_contentCollectionView, "bounds");
  Width = CGRectGetWidth(v47);
  if (Width >= 2.0)
    v17 = Width;
  else
    v17 = 2.0;
  -[SKUIScrollingTabBarContentCollectionView contentOffset](self->_contentCollectionView, "contentOffset");
  v19 = v18;
  -[NSMapTable objectForKey:](self->_viewControllerToItemContext, "objectForKey:", v46);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "nestedPagingScrollView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v21)
  {
    objc_msgSend(v21, "contentOffset");
    v42 = v24;
    v43 = v23;
    -[SKUIScrollingTabBarContentCollectionView convertRect:fromView:](self->_contentCollectionView, "convertRect:fromView:", v6, v8, v10, v12, v14);
    v41 = v14;
    x = v48.origin.x;
    y = v48.origin.y;
    v44 = v17;
    v27 = v48.size.width;
    height = v48.size.height;
    v45 = v19;
    v29 = v19 - CGRectGetMinX(v48);
    if (v29 >= 0.0)
      v30 = v29;
    else
      v30 = 0.0;
    v49.origin.x = x;
    v49.origin.y = y;
    v49.size.width = v27;
    v17 = v44;
    v49.size.height = height;
    v31 = CGRectGetWidth(v49) - v44;
    if (v30 >= v31)
      v32 = v31;
    else
      v32 = v30;
    v50.origin.x = v8;
    v50.origin.y = v10;
    v50.size.width = v12;
    v50.size.height = v41;
    MinY = CGRectGetMinY(v50);
    v51.origin.x = v8;
    v51.origin.y = v10;
    v51.size.width = v12;
    v51.size.height = v41;
    objc_msgSend(v5, "setFrame:", v32, MinY, v44, CGRectGetHeight(v51));
    if (v43 != v32)
      objc_msgSend(v20, "updateNestedPagingScrollViewContentOffset:", v32, v42);
    v34 = vcvtmd_u64_f64((v44 * 0.5 + v32) / v44);
    v19 = v45;
  }
  else
  {
    objc_msgSend(v5, "setFrame:", v8, v10, v12, v14);
    v34 = 0;
  }
  objc_msgSend(v20, "setLastSelectedPageIndex:", v34);
  if (objc_msgSend(v20, "viewControllerIsNavigationController"))
  {
    -[SKUIScrollingTabBarContentCollectionView layer](self->_contentCollectionView, "layer");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "needsLayout");

    if ((v36 & 1) == 0)
    {
      objc_msgSend(v46, "navigationBar");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v37, "conformsToProtocol:", &unk_1EF479FD0))
      {
        v38 = v37;
        objc_msgSend(v38, "positionOffset");
        v39 = v19;
        if (v19 >= 0.0)
        {
          v39 = 0.0;
          if (v19 > v40 - v17)
            v39 = v19 - (v40 - v17);
        }
        objc_msgSend(v38, "setPositionOffset:", v39);

      }
    }
  }

}

- (void)_updateLayoutOfTabBar
{
  double v3;
  double v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  _BOOL4 v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double vertical;
  double horizontal;
  double v21;
  double MaxY;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGFloat v30;
  SKUIScrollingTabBarBackgroundView *tabBarExtendedBackgroundView;
  double v32;
  double v33;
  double v34;
  double v35;
  id v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;

  if (-[SKUIScrollingTabBarController isViewLoaded](self, "isViewLoaded"))
  {
    -[SKUIScrollingTabBarController view](self, "view");
    v36 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "bounds");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v11 = -[SKUIScrollingTabBarPalette isAttached](self->_tabBarPalette, "isAttached");
    v12 = 0.0;
    if (v11)
    {
      objc_msgSend(v36, "traitCollection");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "displayScale");
      v15 = v14;

      if (v15 < 0.00000011920929)
      {
        objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "scale");
        v15 = v17;

      }
      -[SKUIScrollingTabBarPalette paletteHeight](self->_tabBarPalette, "paletteHeight");
      v12 = 1.0 / v15 + v18;
    }
    if (self->_tabBarExplicitlyHidden)
    {
      horizontal = self->_tabBarExplicitHidingOffset.horizontal;
      vertical = self->_tabBarExplicitHidingOffset.vertical;
      v35 = 0.0;
      v33 = vertical;
      v34 = horizontal;
    }
    else
    {
      -[SKUIScrollingTabBarController _effectiveBottomBarOffset](self, "_effectiveBottomBarOffset");
      v35 = v21;
      horizontal = self->_additionalTabBarButtonsContainerPositionOffset.horizontal;
      vertical = self->_additionalTabBarButtonsContainerPositionOffset.vertical;
      v33 = self->_additionalTabBarPalettePositionOffset.vertical;
      v34 = self->_additionalTabBarPalettePositionOffset.horizontal;
    }
    v37.origin.x = v4;
    v37.origin.y = v6;
    v37.size.width = v8;
    v37.size.height = v10;
    MaxY = CGRectGetMaxY(v37);
    v38.origin.x = v4;
    v38.origin.y = v6;
    v38.size.width = v8;
    v38.size.height = v12 + 49.0;
    -[UIView setFrame:](self->_tabBarContainerView, "setFrame:", v4 + horizontal, vertical + v35 + MaxY - CGRectGetHeight(v38), v8, v38.size.height);
    -[UIView bounds](self->_tabBarContainerView, "bounds");
    v27 = v23;
    v28 = v24;
    v29 = v25;
    v30 = v26;
    tabBarExtendedBackgroundView = self->_tabBarExtendedBackgroundView;
    if (tabBarExtendedBackgroundView)
      -[SKUIScrollingTabBarBackgroundView setFrame:](tabBarExtendedBackgroundView, "setFrame:", v23, v24, v25, v26);
    if (v11)
      -[SKUIScrollingTabBarPalette setFrame:](self->_tabBarPalette, "setFrame:", v34 + v27 - horizontal, v33 + v28 - vertical, v29, v12);
    v39.origin.x = v27;
    v39.origin.y = v28;
    v39.size.width = v29;
    v39.size.height = v30;
    v32 = CGRectGetMaxY(v39);
    v40.origin.x = v27;
    v40.origin.y = v28;
    v40.size.width = v29;
    v40.size.height = 49.0;
    -[SKUICrossFadingTabBar setFrame:](self->_tabBar, "setFrame:", v27, v32 - CGRectGetHeight(v40), v29, 49.0);

  }
}

- (void)_updateLayoutOfVisibleCollectionViewCells
{
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
  -[SKUIScrollingTabBarContentCollectionView visibleCells](self->_contentCollectionView, "visibleCells");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
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
        -[SKUIScrollingTabBarController _updateLayoutOfCollectionViewCell:](self, "_updateLayoutOfCollectionViewCell:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)_updateNavigationBarsForVerticalLayoutChange
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  double v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  CGAffineTransform v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;
  CGRect v29;

  v28 = *MEMORY[0x1E0C80C00];
  -[SKUIScrollingTabBarContentCollectionView visibleCells](self->_contentCollectionView, "visibleCells");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v24;
    v8 = 0.0;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v24 != v7)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "viewController");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[SKUIScrollingTabBarController _deepestFocusedViewControllerWithTopLevelFocusedViewController:](self, "_deepestFocusedViewControllerWithTopLevelFocusedViewController:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "navigationController");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "navigationBar");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v13, "conformsToProtocol:", &unk_1EF479FD0))
        {
          v14 = v13;
          objc_msgSend(v14, "positionOffset");
          v16 = v15;
          -[SKUIScrollingTabBarController _effectiveBottomBarOffset](self, "_effectiveBottomBarOffset");
          v18 = v17;
          objc_msgSend(v14, "frame");
          v19 = v18 - CGRectGetHeight(v29);
          objc_msgSend(v14, "setPositionOffset:", v16, v19);
          if ((v6 & 1) != 0)
          {
            if (vabdd_f64(v8, v19) > 0.00000011920929)
              v8 = 0.0;
          }
          else
          {
            v8 = v19;
          }

          v6 = 1;
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v5);
  }
  else
  {
    v8 = 0.0;
  }
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "statusBar");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  CGAffineTransformMakeTranslation(&v22, 0.0, v8);
  objc_msgSend(v21, "setTransform:", &v22);

}

- (void)_updateScrollViewContentOffsetsToTargetContentOffsets
{
  void *v3;
  double Width;
  double v5;
  double v6;
  double MidX;
  double v8;
  double v9;
  CGRect v10;
  CGRect v11;

  if (-[SKUIScrollingTabBarController isViewLoaded](self, "isViewLoaded"))
  {
    -[SKUIScrollingTabBarController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bounds");
    Width = CGRectGetWidth(v10);

    -[SKUIScrollingTabBarContentCollectionView contentSize](self->_contentCollectionView, "contentSize");
    v6 = v5;
    -[SKUIScrollingTabBarContentCollectionView bounds](self->_contentCollectionView, "bounds");
    MidX = CGRectGetMidX(v11);
    if (MidX < 1.0)
      MidX = 1.0;
    if (MidX >= v6)
      MidX = v6;
    v8 = round((MidX + -1.0) / Width);
    -[SKUIScrollingTabBarContentCollectionView contentOffset](self->_contentCollectionView, "contentOffset");
    if (v9 != Width * v8)
      -[SKUIScrollingTabBarContentCollectionView setContentOffset:](self->_contentCollectionView, "setContentOffset:");
  }
}

- (void)_updateStatusBarPositionForcingVisible:(BOOL)a3
{
  __int128 v3;
  void *v4;
  void *v5;
  CGFloat v6;
  CGFloat v7;
  void *v8;
  void *v9;
  CGAffineTransform v10;
  CGAffineTransform v11;

  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v11.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v11.c = v3;
  *(_OWORD *)&v11.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  if (!a3)
  {
    -[UIViewController navigationController](self->_focusedViewController, "navigationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "navigationBar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "conformsToProtocol:", &unk_1EF479FD0))
    {
      objc_msgSend(v5, "positionOffset");
      CGAffineTransformMakeTranslation(&v11, v6, v7);
    }

  }
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "statusBar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v11;
  objc_msgSend(v9, "setTransform:", &v10);

}

- (void)_updateTabBarBackgroundsAndHairlines
{
  uint64_t v3;
  SKUIScrollingTabBarBackgroundView *v4;
  SKUIScrollingTabBarBackgroundView *v5;
  SKUIScrollingTabBarBackgroundView *tabBarExtendedBackgroundView;
  SKUIScrollingTabBarBackgroundView *v7;
  void *v8;
  void *v9;
  id v10;

  if (-[SKUIScrollingTabBarPalette tabBarBackgroundExtendsBehindPalette](self->_tabBarPalette, "tabBarBackgroundExtendsBehindPalette"))
  {
    if (-[SKUIScrollingTabBarPalette isAttached](self->_tabBarPalette, "isAttached"))
    {
      if (self->_tabBarExtendedBackgroundView)
      {
        v3 = 1;
      }
      else
      {
        v4 = [SKUIScrollingTabBarBackgroundView alloc];
        -[UIView bounds](self->_tabBarContainerView, "bounds");
        v5 = -[SKUIScrollingTabBarBackgroundView initWithFrame:](v4, "initWithFrame:");
        tabBarExtendedBackgroundView = self->_tabBarExtendedBackgroundView;
        self->_tabBarExtendedBackgroundView = v5;

        v3 = 1;
        -[SKUIScrollingTabBarBackgroundView setShowsBackdrop:](self->_tabBarExtendedBackgroundView, "setShowsBackdrop:", 1);
        -[SKUIScrollingTabBarBackgroundView setShowsTopHairline:](self->_tabBarExtendedBackgroundView, "setShowsTopHairline:", 1);
        v7 = self->_tabBarExtendedBackgroundView;
        -[SKUIScrollingTabBarController _tabBarBackdropGroupName](self, "_tabBarBackdropGroupName");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[SKUIScrollingTabBarBackgroundView setBackdropBarGroupName:](v7, "setBackdropBarGroupName:", v8);

        -[UIView insertSubview:atIndex:](self->_tabBarContainerView, "insertSubview:atIndex:", self->_tabBarExtendedBackgroundView, 0);
      }
    }
    else
    {
      v3 = 0;
    }
  }
  else
  {
    v3 = 0;
  }
  -[SKUIScrollingTabBarBackgroundView setHidden:](self->_tabBarExtendedBackgroundView, "setHidden:", v3 ^ 1);
  -[SKUICrossFadingTabBar backgroundView](self->_tabBar, "backgroundView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHidden:", v3);
  objc_msgSend(v10, "setUsesOpaqueColorForTopHairline:", v3 ^ 1);
  -[SKUIScrollingTabBarPalette _backgroundView](self->_tabBarPalette, "_backgroundView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setShowsBackdrop:", v3 ^ 1);
  objc_msgSend(v9, "setShowsTopHairline:", v3 ^ 1);
  objc_msgSend(v9, "setShowsBottomHairline:", 1);

}

- (void)_updateTabBarButtons
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  SKUICrossFadingTabBarButton *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSArray *obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  -[SKUICrossFadingTabBar tabBarButtons](self->_tabBar, "tabBarButtons");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v25 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v5);
  }
  v18 = v3;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = self->_viewControllers;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v21;
    do
    {
      for (j = 0; j != v9; ++j)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * j), "tabBarItem");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_alloc_init(SKUICrossFadingTabBarButton);
        objc_msgSend(v13, "title");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[SKUICrossFadingTabBarButton setTitle:](v14, "setTitle:", v15);

        objc_msgSend(v13, "image");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[SKUICrossFadingTabBarButton setImage:](v14, "setImage:", v16);

        objc_msgSend(v13, "selectedImage");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[SKUICrossFadingTabBarButton setSelectedImage:](v14, "setSelectedImage:", v17);

        -[SKUICrossFadingTabBarButton addTarget:action:forControlEvents:](v14, "addTarget:action:forControlEvents:", self, sel__tabBarButtonTapped_, 1);
        if (!v10)
          v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        objc_msgSend(v10, "addObject:", v14);
        objc_msgSend(v13, "setView:", v14);

      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
  }

  -[SKUICrossFadingTabBar setTabBarButtons:](self->_tabBar, "setTabBarButtons:", v10);
}

- (void)_updateTabBarButtonsSelectionProgressWithHorizontalLayoutContext:(id *)a3
{
  double var2;
  void *v6;
  _QWORD v7[5];
  __int128 v8;
  double v9;
  double v10;

  if (a3->var0 == a3->var1)
    var2 = 0.0;
  else
    var2 = a3->var2;
  -[SKUICrossFadingTabBar tabBarButtons](self->_tabBar, "tabBarButtons");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __98__SKUIScrollingTabBarController__updateTabBarButtonsSelectionProgressWithHorizontalLayoutContext___block_invoke;
  v7[3] = &unk_1E73A4818;
  v7[4] = self;
  v8 = *(_OWORD *)&a3->var0;
  v9 = a3->var2;
  v10 = var2;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v7);

}

uint64_t __98__SKUIScrollingTabBarController__updateTabBarButtonsSelectionProgressWithHorizontalLayoutContext___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  double v3;
  unint64_t v4;
  unint64_t v5;

  v3 = 0.0;
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 1336))
  {
    v4 = *(_QWORD *)(a1 + 40);
    if (v4 <= a3)
    {
      v5 = *(_QWORD *)(a1 + 48);
      if (v5 >= a3)
      {
        if (v4 == a3)
        {
          v3 = 1.0 - *(double *)(a1 + 64);
        }
        else if (v5 == a3)
        {
          v3 = *(double *)(a1 + 64);
        }
      }
    }
  }
  return objc_msgSend(a2, "setSelectionProgress:", v3);
}

- (void)_updateViewControllerContentScrollViewInset
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  SKUIScrollingTabBarControllerItemContext *transientViewControllerItemContext;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v19 = 0;
  v17 = 0u;
  v18 = 0u;
  -[SKUIScrollingTabBarController _viewControllerContentScrollViewContentInsetDescriptor](self, "_viewControllerContentScrollViewContentInsetDescriptor");
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = self->_viewControllers;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v13, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        -[NSMapTable objectForKey:](self->_viewControllerToItemContext, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v7));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v17;
        v11 = v18;
        v12 = v19;
        objc_msgSend(v8, "applyNewContentInsetDescriptor:", &v10);

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v13, v20, 16);
    }
    while (v5);
  }

  transientViewControllerItemContext = self->_transientViewControllerItemContext;
  v10 = v17;
  v11 = v18;
  v12 = v19;
  -[SKUIScrollingTabBarControllerItemContext applyNewContentInsetDescriptor:](transientViewControllerItemContext, "applyNewContentInsetDescriptor:", &v10);
}

- ($6FC496E8309A5FF7C7AA8B90E862B691)_viewControllerContentScrollViewContentInsetDescriptor
{
  __int128 v5;
  $6FC496E8309A5FF7C7AA8B90E862B691 *result;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;

  v5 = *(_OWORD *)&self->_proxyScrollViewContentInsetAdjustment.bottom;
  *(_OWORD *)&retstr->var0.top = *(_OWORD *)&self->_proxyScrollViewContentInsetAdjustment.top;
  *(_OWORD *)&retstr->var0.bottom = v5;
  retstr->var1 = 49.0;
  result = ($6FC496E8309A5FF7C7AA8B90E862B691 *)-[SKUIScrollingTabBarPalette isAttached](self->_tabBarPalette, "isAttached");
  if ((_DWORD)result)
  {
    -[SKUIScrollingTabBarController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "displayScale");
    v10 = v9;

    if (v10 < 0.00000011920929)
    {
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "scale");
      v10 = v12;

    }
    result = ($6FC496E8309A5FF7C7AA8B90E862B691 *)-[SKUIScrollingTabBarPalette paletteHeight](self->_tabBarPalette, "paletteHeight");
    v14 = 1.0 / v10 + v13 + 49.0;
    retstr->var1 = v14;
  }
  else
  {
    v14 = 49.0;
  }
  retstr->var0.bottom = v14 + retstr->var0.bottom;
  return result;
}

- (void)_viewControllerNeedsNestedPagingScrollViewUpdate:(id)a3
{
  id v3;

  -[NSMapTable objectForKey:](self->_viewControllerToItemContext, "objectForKey:", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateForPossibleNestedPagingScrollViewChange");

}

- (SKUITabBarControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (SKUITabBarControllerDelegate *)a3;
}

- (UIViewController)transientViewController
{
  return self->_transientViewController;
}

- (NSArray)viewControllers
{
  return self->_viewControllers;
}

- (UIOffset)additionalTabBarButtonsContainerPositionOffset
{
  double horizontal;
  double vertical;
  UIOffset result;

  horizontal = self->_additionalTabBarButtonsContainerPositionOffset.horizontal;
  vertical = self->_additionalTabBarButtonsContainerPositionOffset.vertical;
  result.vertical = vertical;
  result.horizontal = horizontal;
  return result;
}

- (UIOffset)additionalTabBarPalettePositionOffset
{
  double horizontal;
  double vertical;
  UIOffset result;

  horizontal = self->_additionalTabBarPalettePositionOffset.horizontal;
  vertical = self->_additionalTabBarPalettePositionOffset.vertical;
  result.vertical = vertical;
  result.horizontal = horizontal;
  return result;
}

- (BOOL)chargeEnabledOnTabBarButtonsContainer
{
  return self->_chargeEnabledOnTabBarButtonsContainer;
}

- (BOOL)scrollEnabled
{
  return self->_scrollEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewControllers, 0);
  objc_storeStrong((id *)&self->_transientViewController, 0);
  objc_storeStrong((id *)&self->_viewControllerToItemContext, 0);
  objc_storeStrong((id *)&self->_transientViewControllerItemContext, 0);
  objc_storeStrong((id *)&self->_topLevelFocusedViewController, 0);
  objc_storeStrong((id *)&self->_tabBarPalette, 0);
  objc_storeStrong((id *)&self->_tabBarExtendedBackgroundView, 0);
  objc_storeStrong((id *)&self->_tabBarContainerView, 0);
  objc_storeStrong((id *)&self->_tabBar, 0);
  objc_storeStrong((id *)&self->_proxyScrollView, 0);
  objc_storeStrong((id *)&self->_focusedViewController, 0);
  objc_storeStrong((id *)&self->_focusedContentScrollView, 0);
  objc_storeStrong((id *)&self->_dynamicBarAnimator, 0);
  objc_storeStrong((id *)&self->_contentCollectionView, 0);
}

- (void)initWithNibName:bundle:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIScrollingTabBarController initWithNibName:bundle:]";
}

@end
