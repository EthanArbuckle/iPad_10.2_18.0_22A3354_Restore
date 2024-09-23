@implementation SKUIScrollingSegmentedController

- (SKUIScrollingSegmentedController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6;
  id v7;
  SKUIScrollingSegmentedController *v8;
  SKUIScrollingSegmentedController *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIScrollingSegmentedController initWithNibName:bundle:].cold.1();
  }
  v11.receiver = self;
  v11.super_class = (Class)SKUIScrollingSegmentedController;
  v8 = -[SKUIScrollingSegmentedController initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, v6, v7);
  v9 = v8;
  if (v8)
  {
    v8->_scrollingTabAppearanceStatus.progress = 1.0;
    *(_QWORD *)&v8->_scrollingTabAppearanceStatus.isBouncingOffTheEdge = 0;
    v8->_focusedViewControllerIndex = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v9;
}

- (void)dealloc
{
  NSMutableArray *v3;
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
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_titleObservingViewControllers;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "removeObserver:forKeyPath:context:", self, CFSTR("navigationItem.title"), _SKUIScrollingSegmentTitleValueObservationContext);
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  -[SKUIProxyScrollView setDelegate:](self->_proxyScrollView, "setDelegate:", 0);
  -[SKUIScrollingSegmentedControllerCollectionView setDataSource:](self->_contentCollectionView, "setDataSource:", 0);
  -[SKUIScrollingSegmentedControllerCollectionView setDelegate:](self->_contentCollectionView, "setDelegate:", 0);
  -[SKUIInteractiveSegmentedControl removeTarget:action:forControlEvents:](self->_titlesSegmentedControl, "removeTarget:action:forControlEvents:", self, sel__titlesSegmentedControlValueChangeAction_, 4096);
  v8.receiver = self;
  v8.super_class = (Class)SKUIScrollingSegmentedController;
  -[SKUIViewController dealloc](&v8, sel_dealloc);
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
  double v14;
  double v15;
  double v16;
  void *v17;
  id v18;
  void *v19;
  double Width;
  double v21;
  double Height;
  double v23;
  SKUIScrollingSegmentedControllerCollectionView *v24;
  SKUIScrollingSegmentedControllerCollectionView *contentCollectionView;
  void *v26;
  SKUIScrollingSegmentedControllerCollectionView *v27;
  void *v28;
  SKUIInteractiveSegmentedControl *v29;
  SKUIInteractiveSegmentedControl *titlesSegmentedControl;
  SKUIInteractiveSegmentedControl *v31;
  SKUIScrollingSegmentedControllerNavigationBarTitleView *v32;
  SKUIScrollingSegmentedControllerNavigationBarTitleView *navigationBarTitleView;
  double v34;
  objc_super v35;
  uint64_t v36;
  _QWORD v37[2];
  CGRect v38;
  CGRect v39;

  v37[1] = *MEMORY[0x1E0C80C00];
  v35.receiver = self;
  v35.super_class = (Class)SKUIScrollingSegmentedController;
  -[SKUIScrollingSegmentedController viewDidLoad](&v35, sel_viewDidLoad);
  -[SKUIScrollingSegmentedController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  self->_viewBackgroundIsWhite = 0;
  objc_msgSend(v3, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = objc_alloc(MEMORY[0x1E0DC3F10]);
  v14 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v34 = *MEMORY[0x1E0C9D648];
  v15 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v16 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v17 = (void *)objc_msgSend(v13, "initWithFrame:");
  objc_msgSend(v17, "setHidden:", 1);
  objc_msgSend(v3, "addSubview:", v17);
  self->_contentCollectionViewItemSize.width = v10;
  self->_contentCollectionViewItemSize.height = v12;
  v18 = objc_alloc_init(MEMORY[0x1E0DC3610]);
  objc_msgSend(v18, "setScrollDirection:", 1);
  objc_msgSend(v18, "setMinimumLineSpacing:", 0.0);
  v36 = *MEMORY[0x1E0DC4A18];
  v37[0] = &unk_1E749B5D0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "_setRowAlignmentsOptions:", v19);

  v38.origin.x = v6;
  v38.origin.y = v8;
  v38.size.width = v10;
  v38.size.height = v12;
  Width = CGRectGetWidth(v38);
  if (Width >= 2.0)
    v21 = Width;
  else
    v21 = 2.0;
  v39.origin.x = v6;
  v39.origin.y = v8;
  v39.size.width = v21;
  v39.size.height = v12;
  Height = CGRectGetHeight(v39);
  if (Height >= 2.0)
    v23 = Height;
  else
    v23 = 2.0;
  v24 = -[SKUIScrollingSegmentedControllerCollectionView initWithFrame:collectionViewLayout:]([SKUIScrollingSegmentedControllerCollectionView alloc], "initWithFrame:collectionViewLayout:", v18, v6, v8, v21, v23);
  contentCollectionView = self->_contentCollectionView;
  self->_contentCollectionView = v24;

  -[SKUIScrollingSegmentedControllerCollectionView panGestureRecognizer](self->_contentCollectionView, "panGestureRecognizer");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "_setHysteresis:", 15.0);

  -[SKUIScrollingSegmentedControllerCollectionView setAllowsSelection:](self->_contentCollectionView, "setAllowsSelection:", 0);
  v27 = self->_contentCollectionView;
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIScrollingSegmentedControllerCollectionView setBackgroundColor:](v27, "setBackgroundColor:", v28);

  -[SKUIScrollingSegmentedControllerCollectionView setDataSource:](self->_contentCollectionView, "setDataSource:", self);
  -[SKUIScrollingSegmentedControllerCollectionView setDelegate:](self->_contentCollectionView, "setDelegate:", self);
  -[SKUIScrollingSegmentedControllerCollectionView registerClass:forCellWithReuseIdentifier:](self->_contentCollectionView, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), 0x1E73B38F0);
  -[SKUIScrollingSegmentedControllerCollectionView setScrollsToTop:](self->_contentCollectionView, "setScrollsToTop:", 0);
  -[SKUIScrollingSegmentedControllerCollectionView setPreservesSuperviewLayoutMargins:](self->_contentCollectionView, "setPreservesSuperviewLayoutMargins:", 1);
  -[SKUIScrollingSegmentedControllerCollectionView setShowsHorizontalScrollIndicator:](self->_contentCollectionView, "setShowsHorizontalScrollIndicator:", 0);
  -[SKUIScrollingSegmentedControllerCollectionView setShowsVerticalScrollIndicator:](self->_contentCollectionView, "setShowsVerticalScrollIndicator:", 0);
  -[SKUIScrollingSegmentedControllerCollectionView setPagingEnabled:](self->_contentCollectionView, "setPagingEnabled:", 1);
  -[SKUIScrollingSegmentedControllerCollectionView setScrollEnabled:](self->_contentCollectionView, "setScrollEnabled:", self->_scrollEnabled);
  objc_msgSend(v3, "addSubview:", self->_contentCollectionView);
  -[SKUIScrollingSegmentedController _updateViewBackgroundColor](self, "_updateViewBackgroundColor");
  v29 = -[SKUIInteractiveSegmentedControl initWithFrame:]([SKUIInteractiveSegmentedControl alloc], "initWithFrame:", v34, v14, v15, v16);
  titlesSegmentedControl = self->_titlesSegmentedControl;
  self->_titlesSegmentedControl = v29;

  -[SKUIInteractiveSegmentedControl setDividerCreationBlock:](self->_titlesSegmentedControl, "setDividerCreationBlock:", &__block_literal_global_24);
  v31 = self->_titlesSegmentedControl;
  +[SKUIStandardInteractiveDividerView defaultWidth](SKUIStandardInteractiveDividerView, "defaultWidth");
  -[SKUIInteractiveSegmentedControl setDividerWidth:](v31, "setDividerWidth:");
  -[SKUIInteractiveSegmentedControl addTarget:action:forControlEvents:](self->_titlesSegmentedControl, "addTarget:action:forControlEvents:", self, sel__titlesSegmentedControlValueChangeAction_, 4096);
  -[SKUIScrollingSegmentedController _reloadTitleSegments](self, "_reloadTitleSegments");
  v32 = -[SKUIScrollingSegmentedControllerNavigationBarTitleView initWithFrame:]([SKUIScrollingSegmentedControllerNavigationBarTitleView alloc], "initWithFrame:", v34, v14, v15, v16);
  navigationBarTitleView = self->_navigationBarTitleView;
  self->_navigationBarTitleView = v32;

  -[SKUIScrollingSegmentedControllerNavigationBarTitleView setSegmentedControl:](self->_navigationBarTitleView, "setSegmentedControl:", self->_titlesSegmentedControl);
}

SKUIStandardInteractiveDividerView *__47__SKUIScrollingSegmentedController_viewDidLoad__block_invoke(double a1, double a2, double a3, double a4)
{
  return -[SKUIStandardInteractiveDividerView initWithFrame:]([SKUIStandardInteractiveDividerView alloc], "initWithFrame:", a1, a2, a3, a4);
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
  double width;
  _BOOL4 v18;
  double v19;
  double v20;
  void *v21;
  id v22;
  void *v23;
  double v24;
  double v25;
  double Height;
  double v27;
  void *v28;
  uint64_t (*v29)(uint64_t, double, double);
  uint64_t v30;
  double v31;
  objc_super v32;
  CGRect v33;
  CGRect v34;

  v32.receiver = self;
  v32.super_class = (Class)SKUIScrollingSegmentedController;
  -[SKUIScrollingSegmentedController viewDidLayoutSubviews](&v32, sel_viewDidLayoutSubviews);
  -[SKUIScrollingSegmentedController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPreservesSuperviewLayoutMargins:", 1);
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
  width = self->_contentCollectionViewItemSize.width;
  if (width == v9 && self->_contentCollectionViewItemSize.height == v11)
  {
    v18 = 0;
  }
  else
  {
    v18 = width > 0.00000011920929;
    if (width > 0.00000011920929)
    {
      -[SKUIScrollingSegmentedControllerCollectionView contentOffset](self->_contentCollectionView, "contentOffset");
      v14 = v19;
      UIRoundToViewScale();
      v15 = v20;
    }
    self->_contentCollectionViewItemSize.width = v9;
    self->_contentCollectionViewItemSize.height = v11;
    -[SKUIScrollingSegmentedControllerCollectionView collectionViewLayout](self->_contentCollectionView, "collectionViewLayout");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_alloc_init((Class)objc_msgSend((id)objc_opt_class(), "invalidationContextClass"));

    objc_msgSend(v22, "setInvalidateFlowLayoutDelegateMetrics:", 1);
    -[SKUIScrollingSegmentedControllerCollectionView collectionViewLayout](self->_contentCollectionView, "collectionViewLayout");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "invalidateLayoutWithContext:", v22);

  }
  v33.origin.x = v5;
  v33.origin.y = v7;
  v33.size.width = v9;
  v33.size.height = v11;
  v24 = CGRectGetWidth(v33);
  if (v24 >= 2.0)
    v25 = v24;
  else
    v25 = 2.0;
  v34.origin.x = v5;
  v34.origin.y = v7;
  v34.size.width = v25;
  v34.size.height = v11;
  Height = CGRectGetHeight(v34);
  if (Height >= 2.0)
    v27 = Height;
  else
    v27 = 2.0;
  -[SKUIScrollingSegmentedControllerCollectionView setFrame:](self->_contentCollectionView, "setFrame:", v5, v7, v25, v27);
  if (v18)
  {
    v28 = (void *)SKUIMPUFoundationFramework();
    v29 = (uint64_t (*)(uint64_t, double, double))SKUIWeakLinkedSymbolForString("MPUFloatEqualToFloat", v28);
    v30 = -[SKUIScrollingSegmentedControllerCollectionView contentOffset](self->_contentCollectionView, "contentOffset");
    if ((v29(v30, v15, v31) & 1) == 0)
      -[SKUIScrollingSegmentedControllerCollectionView setContentOffset:](self->_contentCollectionView, "setContentOffset:", v15, v14);
  }
  -[SKUIScrollingSegmentedController _updateTitlesSelectionProgress](self, "_updateTitlesSelectionProgress");
  -[SKUIScrollingSegmentedControllerNavigationBarTitleView setNeedsLayout](self->_navigationBarTitleView, "setNeedsLayout");

}

- (id)contentScrollView
{
  SKUIProxyScrollView *v3;
  SKUIProxyScrollView *v4;
  SKUIProxyScrollView *proxyScrollView;
  void *v6;

  if (!self->_proxyScrollView && -[SKUIScrollingSegmentedController isViewLoaded](self, "isViewLoaded"))
  {
    v3 = [SKUIProxyScrollView alloc];
    v4 = -[SKUIProxyScrollView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    proxyScrollView = self->_proxyScrollView;
    self->_proxyScrollView = v4;

    -[SKUIProxyScrollView setHidden:](self->_proxyScrollView, "setHidden:", 1);
    -[SKUIProxyScrollView setDelegate:](self->_proxyScrollView, "setDelegate:", self);
    -[SKUIProxyScrollView setScrollEnabled:](self->_proxyScrollView, "setScrollEnabled:", 0);
    -[SKUIProxyScrollView setScrollsToTop:](self->_proxyScrollView, "setScrollsToTop:", 0);
    -[SKUIScrollingSegmentedController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", self->_proxyScrollView);

  }
  return self->_proxyScrollView;
}

- (void)decodeRestorableStateWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  objc_super v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("_SKUIScrollingSegmentedControllerStateRestorationKeySelectedViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[SKUIScrollingSegmentedController viewControllers](self, "viewControllers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {
      v7 = objc_msgSend(v6, "indexOfObject:", v5);
      if (v7 != 0x7FFFFFFFFFFFFFFFLL)
        -[SKUIScrollingSegmentedController selectViewControllerAtIndex:animated:](self, "selectViewControllerAtIndex:animated:", v7, 0);
    }

  }
  v8.receiver = self;
  v8.super_class = (Class)SKUIScrollingSegmentedController;
  -[SKUIScrollingSegmentedController decodeRestorableStateWithCoder:](&v8, sel_decodeRestorableStateWithCoder_, v4);

}

- (void)encodeRestorableStateWithCoder:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  v5 = -[SKUIScrollingSegmentedController focusedViewControllerIndex](self, "focusedViewControllerIndex");
  -[SKUIScrollingSegmentedController viewControllers](self, "viewControllers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 != 0x7FFFFFFFFFFFFFFFLL && v5 < objc_msgSend(v6, "count"))
  {
    objc_msgSend(v7, "objectAtIndex:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("_SKUIScrollingSegmentedControllerStateRestorationKeySelectedViewController"));

  }
  v9.receiver = self;
  v9.super_class = (Class)SKUIScrollingSegmentedController;
  -[SKUIScrollingSegmentedController encodeRestorableStateWithCoder:](&v9, sel_encodeRestorableStateWithCoder_, v4);

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
  v15.super_class = (Class)SKUIScrollingSegmentedController;
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
  id v10;
  id v11;
  id v12;
  id v13;
  NSArray *viewControllers;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if ((void *)_SKUIScrollingSegmentTitleValueObservationContext == a6)
  {
    v13 = v11;
    viewControllers = self->_viewControllers;
    if (viewControllers)
    {
      v15 = -[NSArray indexOfObject:](viewControllers, "indexOfObject:", v13);
      if (v15 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v16 = v15;
        -[SKUIInteractiveSegmentedControl segments](self->_titlesSegmentedControl, "segments");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectAtIndex:", v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (-[SKUIScrollingSegmentedController _configureSegment:forViewController:](self, "_configureSegment:forViewController:", v18, v13)&& -[SKUIScrollingSegmentedController isViewLoaded](self, "isViewLoaded"))
        {
          -[SKUIScrollingSegmentedController view](self, "view");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setNeedsLayout");

        }
      }
    }

  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)SKUIScrollingSegmentedController;
    -[SKUIScrollingSegmentedController observeValueForKeyPath:ofObject:change:context:](&v20, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

- (void)scrollViewDidChangeContentInset:(id)a3
{
  SKUIProxyScrollView *v4;
  SKUIProxyScrollView *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  BOOL v11;
  BOOL v12;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = (SKUIProxyScrollView *)a3;
  v5 = v4;
  if (self->_proxyScrollView == v4)
  {
    -[SKUIProxyScrollView window](v4, "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[SKUIProxyScrollView contentInset](v5, "contentInset");
      v11 = self->_proxyScrollViewContentInsetAdjustment.left == v8
         && self->_proxyScrollViewContentInsetAdjustment.top == v7;
      v12 = v11 && self->_proxyScrollViewContentInsetAdjustment.right == v10;
      if (!v12 || self->_proxyScrollViewContentInsetAdjustment.bottom != v9)
      {
        self->_proxyScrollViewContentInsetAdjustment.top = v7;
        self->_proxyScrollViewContentInsetAdjustment.left = v8;
        self->_proxyScrollViewContentInsetAdjustment.bottom = v9;
        self->_proxyScrollViewContentInsetAdjustment.right = v10;
        -[SKUIScrollingSegmentedController _viewControllerContentScrollViewContentInset](self, "_viewControllerContentScrollViewContentInset");
        v15 = v14;
        v17 = v16;
        v19 = v18;
        v21 = v20;
        -[SKUIScrollingSegmentedController viewControllers](self, "viewControllers");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        if (v23)
        {
          v24 = v23;
          v25 = *(_QWORD *)v29;
          do
          {
            for (i = 0; i != v24; ++i)
            {
              if (*(_QWORD *)v29 != v25)
                objc_enumerationMutation(v22);
              -[NSMapTable objectForKey:](self->_viewControllerToItemContext, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i));
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "applyNewContentInset:", v15, v17, v19, v21);

            }
            v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
          }
          while (v24);
        }

      }
    }
  }

}

- (void)scrollingSegmentedControllerCollectionViewDidLayoutSubviews:(id)a3
{
  void *v4;
  void *v5;
  unint64_t v6;
  id WeakRetained;
  void *v8;

  if (self->_contentCollectionView != a3)
    return;
  -[SKUIScrollingSegmentedController _updateTitlesSelectionProgress](self, "_updateTitlesSelectionProgress");
  -[SKUIScrollingSegmentedController _indexPathOfFocusedItemAllowingLayoutIfNeeded:](self, "_indexPathOfFocusedItemAllowingLayoutIfNeeded:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
  {
    if (self->_focusedViewControllerIndex != 0x7FFFFFFFFFFFFFFFLL)
      self->_focusedViewControllerIndex = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_10;
  }
  v8 = v4;
  v6 = objc_msgSend(v4, "item");
  v5 = v8;
  if (self->_focusedViewControllerIndex == v6 || (self->_focusedViewControllerIndex = v6, v6 == 0x7FFFFFFFFFFFFFFFLL))
  {
LABEL_10:

    return;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "scrollingSegmentedController:didFocusViewControllerAtIndex:", self, self->_focusedViewControllerIndex);

}

- (void)contentScrollViewDidChangeForScrollingSegmentedControllerItemContext:(id)a3
{
  id WeakRetained;
  void *v5;
  NSArray *viewControllers;
  uint64_t v7;
  id v8;

  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "viewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    viewControllers = self->_viewControllers;
    if (viewControllers)
    {
      v7 = -[NSArray indexOfObject:](viewControllers, "indexOfObject:", v5);
      if (v7 != 0x7FFFFFFFFFFFFFFFLL)
        objc_msgSend(WeakRetained, "scrollingSegmentedController:contentScrollViewDidChangeForViewControllerAtIndex:", self, v7);
    }

  }
}

- (void)scrollingTabAppearanceStatusWasUpdated:(id)a3
{
  self->_scrollingTabAppearanceStatus = ($D35E09B864CB17FEE2308AEA3FA0107F)a3;
  if (-[SKUIScrollingSegmentedController isViewLoaded](self, "isViewLoaded"))
    -[SKUIScrollingSegmentedController _updateTitlesSelectionProgress](self, "_updateTitlesSelectionProgress");
}

- (UIScrollView)scrollingTabNestedPagingScrollView
{
  id v3;

  v3 = (id)-[SKUIScrollingSegmentedController view](self, "view");
  return (UIScrollView *)self->_contentCollectionView;
}

- (id)scrollingTabViewControllerInNestedPagingScrollViewAtPageIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndex:](self->_viewControllers, "objectAtIndex:", a3);
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
  void *v4;
  id v7;
  NSArray *viewControllers;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;

  if (self->_contentCollectionView == a3)
  {
    v7 = a4;
    objc_msgSend(a3, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", 0x1E73B38F0, v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    viewControllers = self->_viewControllers;
    v9 = objc_msgSend(v7, "item");

    -[NSArray objectAtIndex:](viewControllers, "objectAtIndex:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend(v10, "view");
    -[NSMapTable objectForKey:](self->_viewControllerToItemContext, "objectForKey:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIScrollingSegmentedController _viewControllerContentScrollViewContentInset](self, "_viewControllerContentScrollViewContentInset");
    objc_msgSend(v12, "applyNewContentInset:");
    objc_msgSend(v12, "updateAppliedContentInsetsAdjustment");
    objc_msgSend(v4, "setViewController:", v10);
    objc_msgSend(v4, "setMaximumContentWidth:", self->_maximumContentWidth);

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v7;
  void *v8;
  id v9;

  v7 = a5;
  if (self->_contentCollectionView == a3)
  {
    v9 = v7;
    -[SKUIScrollingSegmentedController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v8, "scrollingSegmentedController:didEndDisplayingViewControllerAtIndex:", self, objc_msgSend(v9, "item") % -[NSArray count](self->_viewControllers, "count"));

    v7 = v9;
  }

}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v7;
  void *v8;
  id v9;

  v7 = a5;
  if (self->_contentCollectionView == a3)
  {
    v9 = v7;
    -[SKUIScrollingSegmentedController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v8, "scrollingSegmentedController:willDisplayViewControllerAtIndex:", self, objc_msgSend(v9, "item") % -[NSArray count](self->_viewControllers, "count"));

    v7 = v9;
  }

}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  CGSize *p_contentCollectionViewItemSize;
  double width;
  double height;
  CGSize result;

  if (self->_contentCollectionView == a3)
    p_contentCollectionViewItemSize = &self->_contentCollectionViewItemSize;
  else
    p_contentCollectionViewItemSize = (CGSize *)MEMORY[0x1E0C9D820];
  width = p_contentCollectionViewItemSize->width;
  height = p_contentCollectionViewItemSize->height;
  if (p_contentCollectionViewItemSize->width < 2.0)
    width = 2.0;
  if (height < 2.0)
    height = 2.0;
  result.height = height;
  result.width = width;
  return result;
}

- (void)scrollViewDidScroll:(id)a3
{
  if (self->_contentCollectionView == a3)
  {
    -[SKUIScrollingSegmentedController _updateTitlesSelectionProgress](self, "_updateTitlesSelectionProgress");
    -[SKUIScrollingSegmentedController _updateViewBackgroundColor](self, "_updateViewBackgroundColor");
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  SKUIScrollingSegmentedControllerDelegate **p_delegate;
  id WeakRetained;
  char v6;
  id v7;

  if (self->_contentCollectionView == a3)
  {
    p_delegate = &self->_delegate;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      v7 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v7, "scrollingSegmentedControllerDidEndDecelerating:", self);

    }
  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  _BOOL8 v4;
  SKUIScrollingSegmentedControllerDelegate **p_delegate;
  id WeakRetained;
  char v8;
  id v9;

  if (self->_contentCollectionView == a3)
  {
    v4 = a4;
    p_delegate = &self->_delegate;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      v9 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v9, "scrollingSegmentedControllerDidEndDragging:willDecelerate:", self, v4);

    }
  }
}

- (void)scrollViewWillBeginDecelerating:(id)a3
{
  SKUIScrollingSegmentedControllerDelegate **p_delegate;
  id WeakRetained;
  char v6;
  id v7;

  if (self->_contentCollectionView == a3)
  {
    p_delegate = &self->_delegate;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      v7 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v7, "scrollingSegmentedControllerWillBeginDecelerating:", self);

    }
  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  SKUIScrollingSegmentedControllerDelegate **p_delegate;
  id WeakRetained;
  char v6;
  id v7;

  if (self->_contentCollectionView == a3)
  {
    p_delegate = &self->_delegate;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      v7 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v7, "scrollingSegmentedControllerWillBeginDragging:", self);

    }
  }
}

- (UIViewController)focusedViewController
{
  return (UIViewController *)-[NSArray objectAtIndex:](self->_viewControllers, "objectAtIndex:", self->_focusedViewControllerIndex);
}

- (void)setMaximumContentWidth:(double)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (vabdd_f64(self->_maximumContentWidth, a3) > 0.00000011920929)
  {
    self->_maximumContentWidth = a3;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[SKUIScrollingSegmentedControllerCollectionView visibleCells](self->_contentCollectionView, "visibleCells", 0);
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
          v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v9, "setMaximumContentWidth:", self->_maximumContentWidth);
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }

  }
}

- (void)setScrollEnabled:(BOOL)a3
{
  if (self->_scrollEnabled != a3)
  {
    self->_scrollEnabled = a3;
    -[SKUIScrollingSegmentedControllerCollectionView setScrollEnabled:](self->_contentCollectionView, "setScrollEnabled:");
  }
}

- (void)setViewControllers:(id)a3
{
  SKUIScrollingSegmentedController *v4;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__SKUIScrollingSegmentedController_setViewControllers___block_invoke;
  v5[3] = &unk_1E739FD38;
  v5[4] = self;
  v4 = self;
  -[SKUIScrollingSegmentedController _setViewControllers:viewUpdatesHandler:](v4, "_setViewControllers:viewUpdatesHandler:", a3, v5);

}

void __55__SKUIScrollingSegmentedController_setViewControllers___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_reloadTitleSegments");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1056), "reloadData");
  objc_msgSend(*(id *)(a1 + 32), "_updateScrollViewContentOffsetsToTargetContentOffsets");
  if (objc_msgSend(*(id *)(a1 + 32), "isViewLoaded"))
  {
    objc_msgSend(*(id *)(a1 + 32), "view");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setNeedsLayout");

    objc_msgSend(*(id *)(a1 + 32), "navigationBarTitleView");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setNeedsLayout");

  }
}

- (UIEdgeInsets)segmentedControlContentEdgeInsets
{
  void *v2;
  double v3;
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
  UIEdgeInsets result;

  -[SKUIScrollingSegmentedController navigationBarTitleView](self, "navigationBarTitleView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutMargins");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (void)setSegmentedControlContentEdgeInsets:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  id v7;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  -[SKUIScrollingSegmentedController navigationBarTitleView](self, "navigationBarTitleView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLayoutMargins:", top, left, bottom, right);

}

- (double)segmentedControlHeight
{
  void *v2;
  double v3;
  double v4;

  -[SKUIScrollingSegmentedController navigationBarTitleView](self, "navigationBarTitleView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "segmentedControlMinimumHeight");
  v4 = v3;

  return v4;
}

- (void)setSegmentedControlHeight:(double)a3
{
  id v4;

  -[SKUIScrollingSegmentedController navigationBarTitleView](self, "navigationBarTitleView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSegmentedControlMinimumHeight:", a3);

}

- (int64_t)segmentedControlLayoutStyle
{
  void *v2;
  int64_t v3;

  -[SKUIScrollingSegmentedController navigationBarTitleView](self, "navigationBarTitleView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "layoutStyle");

  return v3;
}

- (void)setSegmentedControlLayoutStyle:(int64_t)a3
{
  id v4;

  -[SKUIScrollingSegmentedController navigationBarTitleView](self, "navigationBarTitleView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLayoutStyle:", a3);

}

- (void)setWantsWhiteBackgroundBeyondLeftEdgeWhenBouncing:(BOOL)a3
{
  if (self->_wantsWhiteBackgroundBeyondLeftEdgeWhenBouncing != a3)
  {
    self->_wantsWhiteBackgroundBeyondLeftEdgeWhenBouncing = a3;
    -[SKUIScrollingSegmentedController _updateViewBackgroundColor](self, "_updateViewBackgroundColor");
  }
}

- (void)setWantsWhiteBackgroundBeyondRightEdgeWhenBouncing:(BOOL)a3
{
  if (self->_wantsWhiteBackgroundBeyondRightEdgeWhenBouncing != a3)
  {
    self->_wantsWhiteBackgroundBeyondRightEdgeWhenBouncing = a3;
    -[SKUIScrollingSegmentedController _updateViewBackgroundColor](self, "_updateViewBackgroundColor");
  }
}

- (void)replaceViewControllerAtIndex:(unint64_t)a3 withViewController:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  NSUInteger v12;
  SKUIScrollingSegmentedController *v13;
  _QWORD v14[5];
  id v15;
  NSUInteger v16;
  unint64_t v17;

  v6 = a4;
  v7 = (void *)-[NSArray mutableCopy](self->_viewControllers, "mutableCopy");
  objc_msgSend(v7, "replaceObjectAtIndex:withObject:", a3, v6);
  -[NSArray objectAtIndex:](self->_viewControllers, "objectAtIndex:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "title");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqualToString:", v10);

  if (v11)
  {
    v12 = -[NSArray count](self->_viewControllers, "count");
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __84__SKUIScrollingSegmentedController_replaceViewControllerAtIndex_withViewController___block_invoke;
    v14[3] = &unk_1E73A3520;
    v14[4] = self;
    v16 = v12;
    v17 = a3;
    v15 = v6;
    v13 = self;
    -[SKUIScrollingSegmentedController _setViewControllers:viewUpdatesHandler:](v13, "_setViewControllers:viewUpdatesHandler:", v7, v14);

  }
  else
  {
    -[SKUIScrollingSegmentedController setViewControllers:](self, "setViewControllers:", v7);
  }

}

void __84__SKUIScrollingSegmentedController_replaceViewControllerAtIndex_withViewController___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 1056);
  objc_msgSend(v2, "indexPathsForVisibleItems");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if ((unint64_t)objc_msgSend(v8, "item", (_QWORD)v13) % *(_QWORD *)(a1 + 48) == *(_QWORD *)(a1 + 56))
        {
          objc_msgSend(v2, "cellForItemAtIndexPath:", v8);
          v9 = objc_claimAutoreleasedReturnValue();
          if (v9)
          {
            v10 = (void *)v9;
            goto LABEL_12;
          }
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v5)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_12:

  v11 = (id)objc_msgSend(*(id *)(a1 + 40), "view");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1152), "objectForKey:", *(_QWORD *)(a1 + 40));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_viewControllerContentScrollViewContentInset");
  objc_msgSend(v12, "applyNewContentInset:");
  objc_msgSend(v10, "setViewController:", *(_QWORD *)(a1 + 40));

}

- (void)selectViewControllerAtIndex:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  SKUIScrollingSegmentedControllerCollectionView *contentCollectionView;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  id v25;
  CGRect v26;

  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = a4;
    if (-[NSArray count](self->_viewControllers, "count") > a3)
    {
      if ((-[SKUIScrollingSegmentedController isViewLoaded](self, "isViewLoaded") & 1) == 0)
      {
        -[SKUIScrollingSegmentedController view](self, "view");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "layoutIfNeeded");

      }
      -[SKUIScrollingSegmentedControllerCollectionView layoutIfNeeded](self->_contentCollectionView, "layoutIfNeeded");
      contentCollectionView = self->_contentCollectionView;
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a3, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIScrollingSegmentedControllerCollectionView layoutAttributesForItemAtIndexPath:](contentCollectionView, "layoutAttributesForItemAtIndexPath:", v9);
      v25 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v25, "frame");
      v11 = v10;
      v13 = v12;
      v15 = v14;
      v17 = v16;
      -[SKUIScrollingSegmentedControllerCollectionView contentOffset](self->_contentCollectionView, "contentOffset");
      v19 = v18;
      -[SKUIScrollingSegmentedControllerCollectionView contentInset](self->_contentCollectionView, "contentInset");
      v21 = v20;
      v23 = v22;
      v24 = v19 + v20;
      v26.origin.x = v11;
      v26.origin.y = v13;
      v26.size.width = v15;
      v26.size.height = v17;
      -[SKUIScrollingSegmentedControllerCollectionView setContentOffset:animated:](self->_contentCollectionView, "setContentOffset:animated:", v4, CGRectGetMinX(v26) - v23, v24 - v21);

    }
  }
}

- (void)_titlesSegmentedControlValueChangeAction:(id)a3
{
  if (self->_titlesSegmentedControl == a3)
  {
    objc_msgSend(a3, "selectionProgress");
    -[SKUIScrollingSegmentedController _scrollToTitlesSelectionProgress:animated:](self, "_scrollToTitlesSelectionProgress:animated:", 0);
  }
}

- (BOOL)_configureSegment:(id)a3 forViewController:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;

  v5 = a3;
  objc_msgSend(a4, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "title");
  v7 = objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = (__CFString *)v7;
  else
    v8 = &stru_1E73A9FB0;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v8);
  objc_msgSend(v5, "attributedTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10 == v9 || (objc_msgSend(v10, "isEqualToAttributedString:", v9) & 1) != 0)
  {
    v12 = 0;
  }
  else
  {
    objc_msgSend(v5, "setAttributedTitle:", v9);
    v12 = 1;
  }

  return v12;
}

- (id)_indexPathOfFocusedItemAllowingLayoutIfNeeded:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  double v6;
  double v7;
  double v8;
  SKUIScrollingSegmentedControllerCollectionView *v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  double v17;
  double v18;
  uint64_t i;
  void *v20;
  void *v21;
  double v22;
  id v23;
  id v24;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;
  CGRect v33;

  v3 = a3;
  v32 = *MEMORY[0x1E0C80C00];
  -[SKUIScrollingSegmentedControllerCollectionView bounds](self->_contentCollectionView, "bounds");
  UIRectGetCenter();
  v6 = v5;
  -[SKUIScrollingSegmentedControllerCollectionView contentOffset](self->_contentCollectionView, "contentOffset");
  v8 = v7;
  v9 = self->_contentCollectionView;
  -[SKUIScrollingSegmentedControllerCollectionView contentOffset](v9, "contentOffset");
  v11 = v10;
  if (v3)
    -[SKUIScrollingSegmentedControllerCollectionView layoutIfNeeded](v9, "layoutIfNeeded");
  -[SKUIScrollingSegmentedControllerCollectionView visibleCells](v9, "visibleCells");
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v12)
  {
    v13 = v12;
    v14 = 0;
    v15 = 0;
    v16 = *(_QWORD *)v28;
    v17 = v6 - v8 + v11;
    v18 = 0.0;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v28 != v16)
          objc_enumerationMutation(obj);
        -[SKUIScrollingSegmentedControllerCollectionView indexPathForCell:](v9, "indexPathForCell:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          -[SKUIScrollingSegmentedControllerCollectionView layoutAttributesForItemAtIndexPath:](v9, "layoutAttributesForItemAtIndexPath:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "frame");
          v22 = v17 - CGRectGetMidX(v33);
          if (!v14 || fabs(v22) < fabs(v18))
          {
            v23 = v20;

            v24 = v21;
            v14 = v23;
            v15 = v24;
            v18 = v22;
          }

        }
      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v13);
  }
  else
  {
    v14 = 0;
    v15 = 0;
  }

  return v14;
}

- (void)_reloadTitleSegments
{
  void *v3;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  uint64_t v12;
  SKUIStandardInteractiveSegment *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[SKUIInteractiveSegmentedControl segments](self->_titlesSegmentedControl, "segments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_viewControllers;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v4, "firstObject");
        v12 = objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          v13 = (SKUIStandardInteractiveSegment *)v12;
          objc_msgSend(v4, "removeObjectAtIndex:", 0);
        }
        else
        {
          v13 = objc_alloc_init(SKUIStandardInteractiveSegment);
        }
        -[SKUIScrollingSegmentedController _configureSegment:forViewController:](self, "_configureSegment:forViewController:", v13, v11);
        if (!v8)
          v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](self->_viewControllers, "count"));
        objc_msgSend(v8, "addObject:", v13);

      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  -[SKUIInteractiveSegmentedControl setSegments:](self->_titlesSegmentedControl, "setSegments:", v8);
  -[SKUIScrollingSegmentedController _updateTitlesSelectionProgress](self, "_updateTitlesSelectionProgress");
  -[SKUIScrollingSegmentedController navigationBarTitleView](self, "navigationBarTitleView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sizeToFit");

}

- (void)_scrollToTitlesSelectionProgress:(double)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  double v6;
  double v7;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  uint64_t v22;
  CGFloat rect;
  double rect_8;
  double rect_16;
  CGRect v27;
  CGRect v28;

  v4 = a4;
  -[SKUIScrollingSegmentedControllerCollectionView contentSize](self->_contentCollectionView, "contentSize");
  v7 = v6;
  -[SKUIScrollingSegmentedControllerCollectionView bounds](self->_contentCollectionView, "bounds");
  y = v27.origin.y;
  width = v27.size.width;
  height = v27.size.height;
  rect = v27.origin.x;
  rect_8 = v7;
  v11 = v7 - CGRectGetWidth(v27);
  -[SKUIScrollingSegmentedControllerCollectionView contentInset](self->_contentCollectionView, "contentInset");
  v13 = v12;
  v15 = v14;
  -[SKUIScrollingSegmentedControllerCollectionView contentOffset](self->_contentCollectionView, "contentOffset");
  rect_16 = v16;
  -[SKUIInteractiveSegmentedControl segments](self->_titlesSegmentedControl, "segments");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 1.0 / (double)(unint64_t)objc_msgSend(v17, "count");

  v19 = 0.0;
  if (1.0 - v18 > 0.00000011920929)
    v19 = (a3 + v18 * -0.5) / (1.0 - v18);
  v20 = v11 * v19 - v15;
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "userInterfaceLayoutDirection");

  if (v22 == 1)
  {
    v28.origin.x = rect;
    v28.origin.y = y;
    v28.size.width = width;
    v28.size.height = height;
    v20 = rect_8 - v20 - CGRectGetWidth(v28);
  }
  -[SKUIScrollingSegmentedControllerCollectionView setContentOffset:animated:](self->_contentCollectionView, "setContentOffset:animated:", v4, v20, v13 + rect_16 - v13);
}

- (void)_setViewControllers:(id)a3 viewUpdatesHandler:(id)a4
{
  NSArray *v6;
  void (**v7)(void);
  NSArray *viewControllers;
  void *v9;
  NSArray *v10;
  NSArray *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t i;
  void *v21;
  SKUIScrollingSegmentedController *v22;
  void *v23;
  void *v24;
  void *v25;
  NSArray *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void **p_vtable;
  uint64_t j;
  void *v32;
  void *v33;
  void *v34;
  NSMapTable *viewControllerToItemContext;
  uint64_t v36;
  uint64_t v37;
  NSArray *v38;
  void *v39;
  id v40;
  NSUInteger v41;
  void *v42;
  NSMapTable *v43;
  NSMapTable *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t k;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t m;
  void *v55;
  NSArray *v56;
  void (**v57)(void);
  void *v58;
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _BYTE v76[128];
  _BYTE v77[128];
  _BYTE v78[128];
  _BYTE v79[128];
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v6 = (NSArray *)a3;
  v7 = (void (**)(void))a4;
  viewControllers = self->_viewControllers;
  if (viewControllers != v6 && !-[NSArray isEqualToArray:](viewControllers, "isEqualToArray:", v6))
  {
    v57 = v7;
    v9 = (void *)-[NSArray copy](self->_viewControllers, "copy");
    v56 = v6;
    v10 = (NSArray *)-[NSArray copy](v6, "copy");
    v11 = self->_viewControllers;
    self->_viewControllers = v10;

    v58 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v9, "count"));
    v72 = 0u;
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    v12 = v9;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v72, v79, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v73;
      v16 = *MEMORY[0x1E0DC49E8];
      v17 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
      v18 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
      v19 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v73 != v15)
            objc_enumerationMutation(v12);
          v21 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
          if (!-[NSArray containsObject:](self->_viewControllers, "containsObject:", v21))
          {
            objc_msgSend(v21, "parentViewController");
            v22 = (SKUIScrollingSegmentedController *)objc_claimAutoreleasedReturnValue();

            if (v22 == self)
            {
              objc_msgSend(v58, "addObject:", v21);
              objc_msgSend(v21, "willMoveToParentViewController:", 0);
            }
            -[NSMapTable objectForKey:](self->_viewControllerToItemContext, "objectForKey:", v21);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "applyNewContentInset:", v16, v17, v18, v19);
            if (objc_msgSend(v21, "isViewLoaded"))
            {
              objc_msgSend(v21, "view");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "removeFromSuperview");

            }
            -[NSMapTable removeObjectForKey:](self->_viewControllerToItemContext, "removeObjectForKey:", v21);

          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v72, v79, 16);
      }
      while (v14);
    }

    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](self->_viewControllers, "count"));
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    v71 = 0u;
    v26 = self->_viewControllers;
    v27 = -[NSArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v68, v78, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v69;
      p_vtable = &OBJC_METACLASS___SKUIGallerySwooshPageSection.vtable;
      v59 = v12;
      do
      {
        for (j = 0; j != v28; ++j)
        {
          if (*(_QWORD *)v69 != v29)
            objc_enumerationMutation(v26);
          v32 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * j);
          if ((objc_msgSend(v12, "containsObject:", v32) & 1) == 0)
          {
            objc_msgSend(v25, "addObject:", v32);
            if (objc_msgSend(v32, "conformsToProtocol:", &unk_1EF404628))
            {
              -[SKUIViewController clientContext](self, "clientContext");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "setClientContext:", v33);

            }
            -[SKUIScrollingSegmentedController addChildViewController:](self, "addChildViewController:", v32);
            v34 = (void *)objc_msgSend(objc_alloc((Class)(p_vtable + 172)), "initWithViewController:", v32);
            objc_msgSend(v34, "setDelegate:", self);
            viewControllerToItemContext = self->_viewControllerToItemContext;
            if (!viewControllerToItemContext)
            {
              v36 = v28;
              v37 = v29;
              v38 = v26;
              v39 = v25;
              v40 = objc_alloc(MEMORY[0x1E0CB3748]);
              v41 = -[NSArray count](self->_viewControllers, "count");
              v42 = v40;
              v25 = v39;
              v26 = v38;
              v29 = v37;
              v28 = v36;
              p_vtable = (void **)(&OBJC_METACLASS___SKUIGallerySwooshPageSection + 24);
              v43 = (NSMapTable *)objc_msgSend(v42, "initWithKeyOptions:valueOptions:capacity:", 0, 0, v41);
              v44 = self->_viewControllerToItemContext;
              self->_viewControllerToItemContext = v43;

              viewControllerToItemContext = self->_viewControllerToItemContext;
            }
            -[NSMapTable setObject:forKey:](viewControllerToItemContext, "setObject:forKey:", v34, v32);

            v12 = v59;
          }
        }
        v28 = -[NSArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v68, v78, 16);
      }
      while (v28);
    }

    if (v57)
      v57[2]();
    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    v45 = v25;
    v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v64, v77, 16);
    if (v46)
    {
      v47 = v46;
      v48 = *(_QWORD *)v65;
      do
      {
        for (k = 0; k != v47; ++k)
        {
          if (*(_QWORD *)v65 != v48)
            objc_enumerationMutation(v45);
          objc_msgSend(*(id *)(*((_QWORD *)&v64 + 1) + 8 * k), "didMoveToParentViewController:", self);
        }
        v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v64, v77, 16);
      }
      while (v47);
    }

    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    v50 = v58;
    v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v60, v76, 16);
    if (v51)
    {
      v52 = v51;
      v53 = *(_QWORD *)v61;
      do
      {
        for (m = 0; m != v52; ++m)
        {
          if (*(_QWORD *)v61 != v53)
            objc_enumerationMutation(v50);
          v55 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * m);
          objc_msgSend(v55, "removeFromParentViewController");
          if (objc_msgSend(v55, "conformsToProtocol:", &unk_1EF404628))
            objc_msgSend(v55, "setClientContext:", 0);
        }
        v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v60, v76, 16);
      }
      while (v52);
    }

    -[SKUIScrollingSegmentedController _updateTitleValueObservation](self, "_updateTitleValueObservation");
    v6 = v56;
    v7 = v57;
  }

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

  if (-[SKUIScrollingSegmentedController isViewLoaded](self, "isViewLoaded"))
  {
    -[SKUIScrollingSegmentedController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bounds");
    Width = CGRectGetWidth(v10);

    -[SKUIScrollingSegmentedControllerCollectionView contentSize](self->_contentCollectionView, "contentSize");
    v6 = v5;
    -[SKUIScrollingSegmentedControllerCollectionView bounds](self->_contentCollectionView, "bounds");
    MidX = CGRectGetMidX(v11);
    if (MidX < 1.0)
      MidX = 1.0;
    if (MidX >= v6)
      MidX = v6;
    v8 = round((MidX + -1.0) / Width);
    -[SKUIScrollingSegmentedControllerCollectionView contentOffset](self->_contentCollectionView, "contentOffset");
    if (v9 != Width * v8)
      -[SKUIScrollingSegmentedControllerCollectionView setContentOffset:](self->_contentCollectionView, "setContentOffset:");
  }
}

- (void)_updateTitlesSelectionProgress
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  uint64_t v15;
  double v16;
  CGRect v17;

  -[SKUIScrollingSegmentedControllerCollectionView contentSize](self->_contentCollectionView, "contentSize");
  v4 = v3;
  -[SKUIScrollingSegmentedControllerCollectionView bounds](self->_contentCollectionView, "bounds");
  v5 = v4 - CGRectGetWidth(v17);
  -[SKUIScrollingSegmentedControllerCollectionView contentInset](self->_contentCollectionView, "contentInset");
  v7 = v6;
  -[SKUIScrollingSegmentedControllerCollectionView contentOffset](self->_contentCollectionView, "contentOffset");
  v9 = (v7 + v8) / v5;
  -[SKUIInteractiveSegmentedControl segments](self->_titlesSegmentedControl, "segments");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 1.0 / (double)(unint64_t)objc_msgSend(v10, "count");

  v12 = v11 * 0.5 + (1.0 - v11) * v9;
  if (v12 < v11 * 0.5)
    v12 = v11 * 0.5;
  if (v12 >= 1.0 - v11 * 0.5)
    v13 = 1.0 - v11 * 0.5;
  else
    v13 = v12;
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "userInterfaceLayoutDirection");

  v16 = 1.0 - v13;
  if (v15 != 1)
    v16 = v13;
  -[SKUIInteractiveSegmentedControl setSelectionProgress:](self->_titlesSegmentedControl, "setSelectionProgress:", v16);
}

- (void)_updateTitleValueObservation
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSMutableArray *titleObservingViewControllers;
  NSMutableArray *v11;
  NSMutableArray *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  NSMutableArray *v18;
  id obj;
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
  -[SKUIScrollingSegmentedController viewControllers](self, "viewControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)-[NSMutableArray mutableCopy](self->_titleObservingViewControllers, "mutableCopy");
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v25 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v4, "removeObject:", v9);
        if ((-[NSMutableArray containsObject:](self->_titleObservingViewControllers, "containsObject:", v9) & 1) == 0)
        {
          titleObservingViewControllers = self->_titleObservingViewControllers;
          if (!titleObservingViewControllers)
          {
            v11 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(obj, "count"));
            v12 = self->_titleObservingViewControllers;
            self->_titleObservingViewControllers = v11;

            titleObservingViewControllers = self->_titleObservingViewControllers;
          }
          -[NSMutableArray addObject:](titleObservingViewControllers, "addObject:", v9);
          objc_msgSend(v9, "addObserver:forKeyPath:options:context:", self, CFSTR("navigationItem.title"), 0, _SKUIScrollingSegmentTitleValueObservationContext);
        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v6);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v13 = v4;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v21;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * j), "removeObserver:forKeyPath:context:", self, CFSTR("navigationItem.title"), _SKUIScrollingSegmentTitleValueObservationContext);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v15);
  }

  -[NSMutableArray removeObjectsInArray:](self->_titleObservingViewControllers, "removeObjectsInArray:", v13);
  if (!-[NSMutableArray count](self->_titleObservingViewControllers, "count"))
  {
    v18 = self->_titleObservingViewControllers;
    self->_titleObservingViewControllers = 0;

  }
}

- (void)_updateViewBackgroundColor
{
  BOOL *p_wantsWhiteBackgroundBeyondLeftEdgeWhenBouncing;
  _BOOL4 wantsWhiteBackgroundBeyondRightEdgeWhenBouncing;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  id v10;
  CGRect v11;

  if (!-[SKUIScrollingSegmentedController isViewLoaded](self, "isViewLoaded"))
    return;
  p_wantsWhiteBackgroundBeyondLeftEdgeWhenBouncing = &self->_wantsWhiteBackgroundBeyondLeftEdgeWhenBouncing;
  if (self->_wantsWhiteBackgroundBeyondLeftEdgeWhenBouncing
    || (wantsWhiteBackgroundBeyondRightEdgeWhenBouncing = self->_wantsWhiteBackgroundBeyondRightEdgeWhenBouncing))
  {
    -[SKUIScrollingSegmentedControllerCollectionView contentOffset](self->_contentCollectionView, "contentOffset");
    v6 = v5;
    if (v5 > -0.00000011920929)
    {
      -[SKUIScrollingSegmentedControllerCollectionView contentSize](self->_contentCollectionView, "contentSize");
      v8 = v7;
      -[SKUIScrollingSegmentedControllerCollectionView bounds](self->_contentCollectionView, "bounds");
      if (v6 < v8 - CGRectGetWidth(v11) + 0.00000011920929)
      {
        wantsWhiteBackgroundBeyondRightEdgeWhenBouncing = 0;
        goto LABEL_9;
      }
      p_wantsWhiteBackgroundBeyondLeftEdgeWhenBouncing = &self->_wantsWhiteBackgroundBeyondRightEdgeWhenBouncing;
    }
    wantsWhiteBackgroundBeyondRightEdgeWhenBouncing = *p_wantsWhiteBackgroundBeyondLeftEdgeWhenBouncing;
  }
LABEL_9:
  if (self->_viewBackgroundIsWhite != wantsWhiteBackgroundBeyondRightEdgeWhenBouncing)
  {
    self->_viewBackgroundIsWhite = wantsWhiteBackgroundBeyondRightEdgeWhenBouncing;
    if (wantsWhiteBackgroundBeyondRightEdgeWhenBouncing)
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[SKUIScrollingSegmentedController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBackgroundColor:", v10);

  }
}

- (UIEdgeInsets)_viewControllerContentScrollViewContentInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_proxyScrollViewContentInsetAdjustment.top;
  left = self->_proxyScrollViewContentInsetAdjustment.left;
  bottom = self->_proxyScrollViewContentInsetAdjustment.bottom;
  right = self->_proxyScrollViewContentInsetAdjustment.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)_viewControllerNeedsContentScrollViewUpdates:(id)a3
{
  id v3;

  -[NSMapTable objectForKey:](self->_viewControllerToItemContext, "objectForKey:", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateAppliedContentInsetsAdjustment");

}

- (SKUIScrollingSegmentedControllerDelegate)delegate
{
  return (SKUIScrollingSegmentedControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (double)maximumContentWidth
{
  return self->_maximumContentWidth;
}

- (NSArray)viewControllers
{
  return self->_viewControllers;
}

- (BOOL)scrollEnabled
{
  return self->_scrollEnabled;
}

- (unint64_t)focusedViewControllerIndex
{
  return self->_focusedViewControllerIndex;
}

- (SKUIScrollingSegmentedControllerNavigationBarTitleView)navigationBarTitleView
{
  return self->_navigationBarTitleView;
}

- (BOOL)wantsWhiteBackgroundBeyondLeftEdgeWhenBouncing
{
  return self->_wantsWhiteBackgroundBeyondLeftEdgeWhenBouncing;
}

- (BOOL)wantsWhiteBackgroundBeyondRightEdgeWhenBouncing
{
  return self->_wantsWhiteBackgroundBeyondRightEdgeWhenBouncing;
}

- (SKUIInteractiveSegmentedControl)_titlesSegmentedControl
{
  return self->_titlesSegmentedControl;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewControllers, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_viewControllerToItemContext, 0);
  objc_storeStrong((id *)&self->_titlesSegmentedControl, 0);
  objc_storeStrong((id *)&self->_titleObservingViewControllers, 0);
  objc_storeStrong((id *)&self->_proxyScrollView, 0);
  objc_storeStrong((id *)&self->_navigationBarTitleView, 0);
  objc_storeStrong((id *)&self->_contentCollectionView, 0);
}

- (void)initWithNibName:bundle:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIScrollingSegmentedController initWithNibName:bundle:]";
}

@end
