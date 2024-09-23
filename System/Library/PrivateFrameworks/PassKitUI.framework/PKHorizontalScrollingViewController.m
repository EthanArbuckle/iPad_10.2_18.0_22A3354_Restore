@implementation PKHorizontalScrollingViewController

- (PKHorizontalScrollingViewController)init
{
  PKHorizontalScrollingViewController *v2;
  UIScrollView *v3;
  UIScrollView *scrollView;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKHorizontalScrollingViewController;
  v2 = -[PKHorizontalScrollingViewController init](&v6, sel_init);
  if (v2)
  {
    v2->_isLowEndDevice = PKIsLowEndDevice();
    v2->_primaryIndex = 0x7FFFFFFFFFFFFFFFLL;
    v3 = (UIScrollView *)objc_alloc_init(MEMORY[0x1E0DC3C28]);
    scrollView = v2->_scrollView;
    v2->_scrollView = v3;

    v2->_lockUpdate._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (id)emptyViewControllers
{
  return 0;
}

- (int64_t)numberOfItems
{
  return 0;
}

- (int64_t)startingIndex
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)footerView
{
  return 0;
}

- (double)footerViewContentHeight
{
  return 0.0;
}

- (id)cachedDataAtIndex:(int64_t)a3
{
  return 0;
}

- (id)loadingDataObjectWithCurrentData:(id)a3 index:(int64_t)a4 swap:(BOOL)a5
{
  return 0;
}

- (BOOL)shouldResetContentOffsetAfterScrolling
{
  return 1;
}

- (void)enableScrollView:(BOOL)a3
{
  -[UIScrollView setUserInteractionEnabled:](self->_scrollView, "setUserInteractionEnabled:", a3);
}

- (void)clearPendingDataCollectionViewUpdates
{
  -[NSMutableDictionary removeAllObjects](self->_pendingDataCollectionViewUpdates, "removeAllObjects");
}

- (void)updateScrollViewContentOffsetWithNewPrimaryIndex:(int64_t)a3
{
  void *v4;
  UIScrollView *scrollView;
  id v6;

  -[PKHorizontalScrollingViewController _updatePrimaryIndex:](self, "_updatePrimaryIndex:", a3);
  -[PKHorizontalScrollingViewController viewIfLoaded](self, "viewIfLoaded");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = v4;
    -[PKHorizontalScrollingViewController _updateScrollViewContentSize](self, "_updateScrollViewContentSize");
    if (-[PKHorizontalScrollingViewController numberOfItems](self, "numberOfItems") >= 1)
    {
      scrollView = self->_scrollView;
      -[PKHorizontalScrollingViewController _startOfItemAtIndex:](self, "_startOfItemAtIndex:", self->_primaryIndex);
      -[UIScrollView setContentOffset:](scrollView, "setContentOffset:");
    }
    objc_msgSend(v6, "setNeedsLayout");
    v4 = v6;
  }

}

- (void)viewDidLoad
{
  void *v3;
  uint64_t v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *indicesToViewControllerMapping;
  NSMutableDictionary *v7;
  NSMutableDictionary *nonVisibleIndicesToViewControllerMapping;
  NSMutableSet *v9;
  NSMutableSet *unusedViewControllers;
  NSMutableDictionary *v11;
  NSMutableDictionary *pendingDataCollectionViewUpdates;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSMutableSet *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  UIScrollView *scrollView;
  void *v34;
  void *v35;
  CGFloat v36;
  CGFloat v37;
  UIScrollView *v38;
  void *v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  objc_super v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v49.receiver = self;
  v49.super_class = (Class)PKHorizontalScrollingViewController;
  -[PKHorizontalScrollingViewController viewDidLoad](&v49, sel_viewDidLoad);
  -[PKHorizontalScrollingViewController emptyViewControllers](self, "emptyViewControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  v5 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v4);
  indicesToViewControllerMapping = self->_indicesToViewControllerMapping;
  self->_indicesToViewControllerMapping = v5;

  v7 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v4);
  nonVisibleIndicesToViewControllerMapping = self->_nonVisibleIndicesToViewControllerMapping;
  self->_nonVisibleIndicesToViewControllerMapping = v7;

  v9 = (NSMutableSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", v4);
  unusedViewControllers = self->_unusedViewControllers;
  self->_unusedViewControllers = v9;

  v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  pendingDataCollectionViewUpdates = self->_pendingDataCollectionViewUpdates;
  self->_pendingDataCollectionViewUpdates = v11;

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v13 = v3;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v46 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
        objc_msgSend(v18, "setScrollingDelegate:", self);
        objc_msgSend(v18, "setContentInsetAdjustmentBehavior:", 3);
        -[PKHorizontalScrollingViewController footerViewContentHeight](self, "footerViewContentHeight");
        objc_msgSend(v18, "setContentInset:", 0.0, 0.0, v19, 0.0);
        -[UIScrollView panGestureRecognizer](self->_scrollView, "panGestureRecognizer");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setGestureRecognizerRequiredToFail:", v20);

        objc_msgSend(v18, "view");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setHidden:", 1);

        -[NSMutableSet addObject:](self->_unusedViewControllers, "addObject:", v18);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
    }
    while (v15);
  }

  -[PKHorizontalScrollingViewController _updatePrimaryIndex:](self, "_updatePrimaryIndex:", -[PKHorizontalScrollingViewController startingIndex](self, "startingIndex"));
  -[PKHorizontalScrollingViewController navigationItem](self, "navigationItem");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "pkui_setupScrollEdgeChromelessAppearance");
  v40 = v22;
  objc_msgSend(v22, "pkui_enableManualScrollEdgeAppearanceWithInitialProgress:", 0.0);
  -[PKHorizontalScrollingViewController view](self, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addSubview:", self->_scrollView);
  +[PKDashboardViewController backgroundColor](PKDashboardViewController, "backgroundColor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setBackgroundColor:", v24);

  -[PKHorizontalScrollingViewController footerView](self, "footerView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    -[PKHorizontalScrollingViewController footerView](self, "footerView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addSubview:", v26);

  }
  v39 = v23;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v27 = self->_unusedViewControllers;
  v28 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v42;
    do
    {
      for (j = 0; j != v29; ++j)
      {
        if (*(_QWORD *)v42 != v30)
          objc_enumerationMutation(v27);
        v32 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * j);
        -[PKHorizontalScrollingViewController addChildViewController:](self, "addChildViewController:", v32, v39);
        scrollView = self->_scrollView;
        objc_msgSend(v32, "view");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIScrollView addSubview:](scrollView, "addSubview:", v34);

        objc_msgSend(v32, "didMoveToParentViewController:", self);
      }
      v29 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
    }
    while (v29);
  }

  -[UIScrollView setShowsHorizontalScrollIndicator:](self->_scrollView, "setShowsHorizontalScrollIndicator:", 0);
  -[UIScrollView setDecelerationRate:](self->_scrollView, "setDecelerationRate:", *MEMORY[0x1E0DC5360]);
  -[UIScrollView setContentInsetAdjustmentBehavior:](self->_scrollView, "setContentInsetAdjustmentBehavior:", 2);
  -[UIScrollView setDelegate:](self->_scrollView, "setDelegate:", self);
  v35 = v39;
  objc_msgSend(v39, "bounds");
  self->_currentSize.width = v36;
  self->_currentSize.height = v37;
  -[PKHorizontalScrollingViewController _updateScrollViewContentSize](self, "_updateScrollViewContentSize");
  if (-[PKHorizontalScrollingViewController numberOfItems](self, "numberOfItems") >= 1)
  {
    v38 = self->_scrollView;
    -[PKHorizontalScrollingViewController _startOfItemAtIndex:](self, "_startOfItemAtIndex:", self->_primaryIndex);
    -[UIScrollView setContentOffset:](v38, "setContentOffset:");
  }
  -[UIScrollView contentOffset](self->_scrollView, "contentOffset", v39);
  -[PKHorizontalScrollingViewController _loadDataForContentOffset:](self, "_loadDataForContentOffset:");

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  objc_super v22;
  CGRect v23;

  v22.receiver = self;
  v22.super_class = (Class)PKHorizontalScrollingViewController;
  -[PKHorizontalScrollingViewController viewWillLayoutSubviews](&v22, sel_viewWillLayoutSubviews);
  -[PKHorizontalScrollingViewController _dequeueViewControllerForIndex:](self, "_dequeueViewControllerForIndex:", self->_primaryIndex);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKHorizontalScrollingViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
    objc_msgSend(v4, "pkui_adjustManualScrollEdgeAppearanceProgressForNavigationItem:", v5);
  else
    objc_msgSend(v5, "_setManualScrollEdgeAppearanceProgress:", 0.0);

  -[PKHorizontalScrollingViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  self->_currentSize.width = v12;
  self->_currentSize.height = v14;
  -[PKHorizontalScrollingViewController footerViewContentHeight](self, "footerViewContentHeight");
  v17 = v16;
  objc_msgSend(v7, "safeAreaInsets");
  v19 = v18;
  -[PKHorizontalScrollingViewController footerView](self, "footerView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[PKHorizontalScrollingViewController footerView](self, "footerView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setFrame:", 0.0, v11 + v15 - (v17 + v19), v13, v17 + v19);

  }
  v23.origin.x = v9;
  v23.origin.y = v11;
  v23.size.width = v13;
  v23.size.height = v15;
  if (!CGRectEqualToRect(v23, self->_previousBounds))
  {
    -[UIScrollView setFrame:](self->_scrollView, "setFrame:", v9, v11, v13, v15);
    -[PKHorizontalScrollingViewController _updateScrollViewContentSize](self, "_updateScrollViewContentSize");
  }
  -[PKHorizontalScrollingViewController _layoutCollectionViews](self, "_layoutCollectionViews");
  self->_previousBounds.origin.x = v9;
  self->_previousBounds.origin.y = v11;
  self->_previousBounds.size.width = v13;
  self->_previousBounds.size.height = v15;

}

- (void)_layoutCollectionViews
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  NSMutableDictionary *indicesToViewControllerMapping;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSMutableDictionary *nonVisibleIndicesToViewControllerMapping;
  uint64_t v12;
  NSIndexSet *visibleIndices;
  id v14;
  _QWORD v15[7];
  _QWORD v16[7];

  -[PKHorizontalScrollingViewController viewIfLoaded](self, "viewIfLoaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PKHorizontalScrollingViewController _yPositionForNonPrimaryViewControllers](self, "_yPositionForNonPrimaryViewControllers");
    v5 = v4;
    indicesToViewControllerMapping = self->_indicesToViewControllerMapping;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_primaryIndex);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](indicesToViewControllerMapping, "objectForKey:", v7);
    v14 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "adjustedContentInset");
    v10 = v9;
    nonVisibleIndicesToViewControllerMapping = self->_nonVisibleIndicesToViewControllerMapping;
    v12 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __61__PKHorizontalScrollingViewController__layoutCollectionViews__block_invoke;
    v16[3] = &unk_1E3E62088;
    v16[4] = self;
    v16[5] = v5;
    v16[6] = v9;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](nonVisibleIndicesToViewControllerMapping, "enumerateKeysAndObjectsUsingBlock:", v16);
    visibleIndices = self->_visibleIndices;
    v15[0] = v12;
    v15[1] = 3221225472;
    v15[2] = __61__PKHorizontalScrollingViewController__layoutCollectionViews__block_invoke_2;
    v15[3] = &unk_1E3E620B0;
    v15[4] = self;
    v15[5] = v5;
    v15[6] = v10;
    -[NSIndexSet enumerateIndexesUsingBlock:](visibleIndices, "enumerateIndexesUsingBlock:", v15);

  }
}

void __61__PKHorizontalScrollingViewController__layoutCollectionViews__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  unint64_t v17;
  unint64_t v18;
  double v19;
  id v20;

  v5 = a3;
  v6 = a2;
  objc_msgSend(v5, "collectionView");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  objc_msgSend(v5, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v9 + 976))
  {
    objc_msgSend((id)v9, "_startOfItemAtIndex:", v7);
    v11 = v10;
    v12 = *(double *)(a1 + 40);
    v13 = *(double *)(*(_QWORD *)(a1 + 32) + 1056);
    v14 = *(double *)(*(_QWORD *)(a1 + 32) + 1064);
    objc_msgSend(v20, "contentSize");
    v16 = fmax(v14, v15 + *(double *)(a1 + 48));
  }
  else
  {
    v17 = *(_QWORD *)(v9 + 1088);
    if (v7 >= v17)
      v18 = v17 + 1;
    else
      v18 = v17 - 1;
    objc_msgSend((id)v9, "_startOfItemAtIndex:", v18);
    v11 = v19;
    v13 = *(double *)(*(_QWORD *)(a1 + 32) + 1056);
    v16 = *(double *)(*(_QWORD *)(a1 + 32) + 1064);
    v12 = 0.0;
  }
  objc_msgSend(v8, "setFrame:", v11, v12, v13, v16);
  objc_msgSend(v20, "setContentOffset:", 0.0, -*(double *)(a1 + 48));

}

void __61__PKHorizontalScrollingViewController__layoutCollectionViews__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD *v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;

  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 1104);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD **)(a1 + 32);
  v9 = v8[136];
  objc_msgSend(v8, "_startOfItemAtIndex:", a2);
  v11 = v10;
  if (v9 == a2)
  {
    objc_msgSend(v7, "setFrame:", v10, 0.0, *(double *)(*(_QWORD *)(a1 + 32) + 1056), *(double *)(*(_QWORD *)(a1 + 32) + 1064));
  }
  else
  {
    v12 = *(double *)(a1 + 40);
    v13 = *(double *)(*(_QWORD *)(a1 + 32) + 1056);
    v14 = *(double *)(*(_QWORD *)(a1 + 32) + 1064);
    objc_msgSend(v6, "contentSize");
    objc_msgSend(v7, "setFrame:", v11, v12, v13, fmax(v14, v15 + *(double *)(a1 + 48)));
    objc_msgSend(v6, "setContentOffset:", 0.0, -*(double *)(a1 + 48));
  }

}

- (void)_updateScrollViewContentSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  double v9;
  id v10;

  -[PKHorizontalScrollingViewController viewIfLoaded](self, "viewIfLoaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v10 = v3;
    objc_msgSend(v3, "bounds");
    v5 = v4;
    v7 = v6;
    v8 = -[PKHorizontalScrollingViewController numberOfItems](self, "numberOfItems");
    v9 = v5 * (double)v8;
    if (v8 > 1)
      v9 = v9 + (double)(v8 - 1) * -24.0;
    -[UIScrollView setContentSize:](self->_scrollView, "setContentSize:", v9, v7);
    v3 = v10;
  }

}

- (void)_scrollViewStoppedScrolling
{
  void *v3;
  NSObject *scrollTimer;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;

  -[PKHorizontalScrollingViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

  -[PKHorizontalScrollingViewController _updatePrimaryViewScrolling](self, "_updatePrimaryViewScrolling");
  scrollTimer = self->_scrollTimer;
  if (scrollTimer)
    dispatch_source_cancel(scrollTimer);
  if (-[PKHorizontalScrollingViewController shouldResetContentOffsetAfterScrolling](self, "shouldResetContentOffsetAfterScrolling"))
  {
    -[PKHorizontalScrollingViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safeAreaInsets");
    v7 = v6;

    if (self->_childViewControllerVerticalOffset != -v7)
    {
      self->_childViewControllerVerticalOffset = -v7;
      -[PKHorizontalScrollingViewController _dequeueViewControllerForIndex:](self, "_dequeueViewControllerForIndex:", self->_primaryIndex);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "collectionView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setContentOffset:animated:", 1, 0.0, self->_childViewControllerVerticalOffset);

    }
  }
  -[PKHorizontalScrollingViewController _reloadPendingViewControllers](self, "_reloadPendingViewControllers");
}

- (void)resetVisibleViewControllersWithNewPrimaryIndex:(int64_t)a3
{
  NSMutableDictionary *indicesToViewControllerMapping;
  void *v6;
  void *v7;
  NSMutableDictionary *v8;
  uint64_t v9;
  NSMutableDictionary *nonVisibleIndicesToViewControllerMapping;
  NSMutableDictionary *v11;
  void *v12;
  UIScrollView *scrollView;
  void *v14;
  NSIndexSet *v15;
  NSIndexSet *visibleIndices;
  UIScrollView *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  id v28;
  _QWORD v29[5];
  _QWORD v30[4];
  id v31;
  PKHorizontalScrollingViewController *v32;

  indicesToViewControllerMapping = self->_indicesToViewControllerMapping;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_primaryIndex);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](indicesToViewControllerMapping, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = self->_indicesToViewControllerMapping;
  v9 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __86__PKHorizontalScrollingViewController_resetVisibleViewControllersWithNewPrimaryIndex___block_invoke;
  v30[3] = &unk_1E3E620D8;
  v28 = v7;
  v31 = v28;
  v32 = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v8, "enumerateKeysAndObjectsUsingBlock:", v30);
  -[NSMutableDictionary removeAllObjects](self->_indicesToViewControllerMapping, "removeAllObjects");
  nonVisibleIndicesToViewControllerMapping = self->_nonVisibleIndicesToViewControllerMapping;
  v29[0] = v9;
  v29[1] = 3221225472;
  v29[2] = __86__PKHorizontalScrollingViewController_resetVisibleViewControllersWithNewPrimaryIndex___block_invoke_2;
  v29[3] = &unk_1E3E62100;
  v29[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](nonVisibleIndicesToViewControllerMapping, "enumerateKeysAndObjectsUsingBlock:", v29);
  -[NSMutableDictionary removeAllObjects](self->_nonVisibleIndicesToViewControllerMapping, "removeAllObjects");
  -[PKHorizontalScrollingViewController _updatePrimaryIndex:](self, "_updatePrimaryIndex:", a3);
  v11 = self->_indicesToViewControllerMapping;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_primaryIndex);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", v28, v12);

  scrollView = self->_scrollView;
  objc_msgSend(v28, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScrollView bringSubviewToFront:](scrollView, "bringSubviewToFront:", v14);

  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", self->_primaryIndex);
  v15 = (NSIndexSet *)objc_claimAutoreleasedReturnValue();
  visibleIndices = self->_visibleIndices;
  self->_visibleIndices = v15;

  -[PKHorizontalScrollingViewController _updateScrollViewContentSize](self, "_updateScrollViewContentSize");
  -[UIScrollView setScrollEnabled:](self->_scrollView, "setScrollEnabled:", 1);
  v17 = self->_scrollView;
  -[PKHorizontalScrollingViewController _startOfItemAtIndex:](self, "_startOfItemAtIndex:", self->_primaryIndex);
  -[UIScrollView setContentOffset:](v17, "setContentOffset:");
  -[PKHorizontalScrollingViewController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setNeedsLayout");

  if (-[PKHorizontalScrollingViewController numberOfItems](self, "numberOfItems") <= 1)
  {
    -[UIScrollView contentOffset](self->_scrollView, "contentOffset");
    -[PKHorizontalScrollingViewController _loadDataForContentOffset:](self, "_loadDataForContentOffset:");
  }
  -[PKHorizontalScrollingViewController _reloadDataForViewControllerAtIndex:swap:](self, "_reloadDataForViewControllerAtIndex:swap:", self->_primaryIndex, 1);
  -[PKHorizontalScrollingViewController footerView](self, "footerView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[PKHorizontalScrollingViewController footerView](self, "footerView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "footer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setCurrentFooter:", v21);

    -[PKHorizontalScrollingViewController footerView](self, "footerView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setNextFooter:", 0);

    -[PKHorizontalScrollingViewController footerView](self, "footerView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setTransitionProgress:", 0.0);

  }
  -[PKHorizontalScrollingViewController view](self, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "safeAreaInsets");
  v26 = v25;

  if (v26 != self->_childViewControllerVerticalOffset)
  {
    objc_msgSend(v28, "collectionView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setContentOffset:animated:", 1, 0.0, -v26);

  }
}

void __86__PKHorizontalScrollingViewController_resetVisibleViewControllersWithNewPrimaryIndex___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  void *v4;
  id v5;

  if (*(void **)(a1 + 32) != a3)
  {
    v3 = *(void **)(*(_QWORD *)(a1 + 40) + 1000);
    v5 = a3;
    objc_msgSend(v3, "addObject:", v5);
    objc_msgSend(v5, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHidden:", 1);

    objc_msgSend(v5, "setVisible:", 0);
  }
}

void __86__PKHorizontalScrollingViewController_resetVisibleViewControllersWithNewPrimaryIndex___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  void *v4;
  id v5;

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 1000);
  v5 = a3;
  objc_msgSend(v3, "addObject:", v5);
  objc_msgSend(v5, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 1);

  objc_msgSend(v5, "setVisible:", 0);
}

- (void)_reloadPendingViewControllers
{
  NSMutableDictionary *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  int64_t primaryIndex;
  int64_t v12;
  void *v13;
  void *v14;
  int64_t v15;
  int64_t v16;
  int64_t v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v3 = self->_pendingDataCollectionViewUpdates;
  v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        -[NSMutableDictionary objectForKey:](self->_indicesToViewControllerMapping, "objectForKey:", v8, (_QWORD)v21);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v9)
        {
          -[NSMutableDictionary objectForKey:](self->_nonVisibleIndicesToViewControllerMapping, "objectForKey:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v9)
            continue;
        }
        -[NSMutableDictionary objectForKey:](self->_pendingDataCollectionViewUpdates, "objectForKey:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setData:swap:", v10, 0);

      }
      v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v5);
  }

  -[NSMutableDictionary removeAllObjects](self->_pendingDataCollectionViewUpdates, "removeAllObjects");
  primaryIndex = self->_primaryIndex;
  v12 = primaryIndex - 2;
  if (primaryIndex >= 2)
  {
    -[PKHorizontalScrollingViewController cachedDataAtIndex:](self, "cachedDataAtIndex:", primaryIndex - 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 && -[PKHorizontalScrollingViewController _canReloadViewControllers](self, "_canReloadViewControllers"))
    {
      -[PKHorizontalScrollingViewController _dequeueNonVisibleViewControllerForIndex:](self, "_dequeueNonVisibleViewControllerForIndex:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setData:swap:", v13, 0);

    }
  }
  v15 = -[PKHorizontalScrollingViewController numberOfItems](self, "numberOfItems", (_QWORD)v21);
  v16 = self->_primaryIndex;
  v17 = v16 + 2;
  if (v15 > v16 + 2)
  {
    -[PKHorizontalScrollingViewController cachedDataAtIndex:](self, "cachedDataAtIndex:", v16 + 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18 && -[PKHorizontalScrollingViewController _canReloadViewControllers](self, "_canReloadViewControllers"))
    {
      -[PKHorizontalScrollingViewController _dequeueNonVisibleViewControllerForIndex:](self, "_dequeueNonVisibleViewControllerForIndex:", v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setData:swap:", v18, 0);

    }
  }
  -[PKHorizontalScrollingViewController view](self, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setNeedsLayout");

  -[PKHorizontalScrollingViewController prefetchDataIfNecessary](self, "prefetchDataIfNecessary");
}

- (void)_updatePrimaryViewScrolling
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;

  -[PKHorizontalScrollingViewController _dequeueViewControllerForIndex:](self, "_dequeueViewControllerForIndex:", self->_primaryIndex);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentOffset");
  v5 = v4;
  v7 = v6;
  objc_msgSend(v3, "setScrollEnabled:", !self->_isScrolling);
  objc_msgSend(v3, "setContentOffset:", v5, v7);

}

- (void)_updateAlphaDuringTransition
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  NSIndexSet *visibleIndices;
  void *v10;
  int64_t v11;
  int64_t primaryIndex;
  int64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[7];

  -[UIScrollView contentOffset](self->_scrollView, "contentOffset");
  v4 = v3;
  -[PKHorizontalScrollingViewController _startOfItemAtIndex:](self, "_startOfItemAtIndex:", self->_primaryIndex);
  v6 = v5;
  -[PKHorizontalScrollingViewController _transitionProgress](self, "_transitionProgress");
  v8 = v7;
  visibleIndices = self->_visibleIndices;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __67__PKHorizontalScrollingViewController__updateAlphaDuringTransition__block_invoke;
  v18[3] = &unk_1E3E620B0;
  v18[4] = self;
  *(double *)&v18[5] = 1.0 - v7;
  *(double *)&v18[6] = v7;
  -[NSIndexSet enumerateIndexesUsingBlock:](visibleIndices, "enumerateIndexesUsingBlock:", v18);
  -[PKHorizontalScrollingViewController footerView](self, "footerView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    if (v4 >= v6)
    {
      if (v4 <= v6)
        goto LABEL_8;
      v13 = -[PKHorizontalScrollingViewController numberOfItems](self, "numberOfItems");
      v11 = self->_primaryIndex + 1;
      if (v13 <= v11)
        goto LABEL_8;
    }
    else
    {
      primaryIndex = self->_primaryIndex;
      v11 = primaryIndex - 1;
      if (primaryIndex < 1)
        goto LABEL_8;
    }
    -[PKHorizontalScrollingViewController _dequeueViewControllerForIndex:](self, "_dequeueViewControllerForIndex:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "footer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKHorizontalScrollingViewController footerView](self, "footerView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setNextFooter:", v15);

LABEL_8:
    -[PKHorizontalScrollingViewController footerView](self, "footerView", v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTransitionProgress:", v8);

  }
}

void __67__PKHorizontalScrollingViewController__updateAlphaDuringTransition__block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  void *v5;
  void *v6;
  void *v7;
  double *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "_dequeueViewControllerForIndex:", a2);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD **)(a1 + 32);
  if (v4[136] == a2)
  {
    objc_msgSend(v4, "footerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "footerView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "footer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setCurrentFooter:", v7);

    }
    v8 = (double *)(a1 + 40);
  }
  else
  {
    v8 = (double *)(a1 + 48);
  }
  objc_msgSend(v9, "setAlphaTransition:", *v8);

}

- (void)_loadDataForContentOffset:(CGPoint)a3
{
  NSIndexSet *visibleIndices;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id obj;
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[4];
  id v15;

  -[PKHorizontalScrollingViewController _visibileIndicesAtContentOffset:](self, "_visibileIndicesAtContentOffset:", a3.x, a3.y);
  obj = (id)objc_claimAutoreleasedReturnValue();
  if (!self->_visibleIndices)
  {
    visibleIndices = 0;
    goto LABEL_5;
  }
  if ((PKEqualObjects() & 1) == 0)
  {
    visibleIndices = self->_visibleIndices;
LABEL_5:
    v5 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __65__PKHorizontalScrollingViewController__loadDataForContentOffset___block_invoke;
    v14[3] = &unk_1E3E62128;
    v6 = obj;
    v15 = v6;
    -[NSIndexSet indexesPassingTest:](visibleIndices, "indexesPassingTest:", v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v5;
    v13[1] = 3221225472;
    v13[2] = __65__PKHorizontalScrollingViewController__loadDataForContentOffset___block_invoke_2;
    v13[3] = &unk_1E3E62150;
    v13[4] = self;
    objc_msgSend(v7, "enumerateIndexesUsingBlock:", v13);
    v12[0] = v5;
    v12[1] = 3221225472;
    v12[2] = __65__PKHorizontalScrollingViewController__loadDataForContentOffset___block_invoke_3;
    v12[3] = &unk_1E3E62128;
    v12[4] = self;
    objc_msgSend(v6, "indexesPassingTest:", v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v5;
    v11[1] = 3221225472;
    v11[2] = __65__PKHorizontalScrollingViewController__loadDataForContentOffset___block_invoke_4;
    v11[3] = &unk_1E3E62150;
    v11[4] = self;
    objc_msgSend(v8, "enumerateIndexesUsingBlock:", v11);
    objc_storeStrong((id *)&self->_visibleIndices, obj);
    -[PKHorizontalScrollingViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setNeedsLayout");

  }
  -[PKHorizontalScrollingViewController _updateAlphaDuringTransition](self, "_updateAlphaDuringTransition");

}

uint64_t __65__PKHorizontalScrollingViewController__loadDataForContentOffset___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsIndex:", a2) ^ 1;
}

_QWORD *__65__PKHorizontalScrollingViewController__loadDataForContentOffset___block_invoke_2(uint64_t a1, uint64_t a2)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (result[136] != a2)
    return (_QWORD *)objc_msgSend(result, "_retireViewControllerForIndex:", a2);
  return result;
}

uint64_t __65__PKHorizontalScrollingViewController__loadDataForContentOffset___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1096), "containsIndex:", a2) ^ 1;
}

uint64_t __65__PKHorizontalScrollingViewController__loadDataForContentOffset___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadDataForViewControllerAtIndex:swap:", a2, 0);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  void *v12;
  uint64_t i;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *scrollTimer;
  OS_dispatch_source *v21;
  OS_dispatch_source *v22;
  NSObject *v23;
  dispatch_time_t v24;
  NSObject *v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  int64_t v30;
  _QWORD v31[4];
  id v32;
  uint64_t v33;
  _QWORD aBlock[4];
  id v35;
  id location[2];

  v4 = a3;
  objc_msgSend(v4, "contentOffset");
  v6 = v5;
  v8 = v7;
  -[PKHorizontalScrollingViewController _startOfItemAtIndex:](self, "_startOfItemAtIndex:", self->_primaryIndex);
  v10 = v9;
  objc_initWeak(location, self);
  v11 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__PKHorizontalScrollingViewController_scrollViewDidScroll___block_invoke;
  aBlock[3] = &unk_1E3E62178;
  objc_copyWeak(&v35, location);
  v12 = _Block_copy(aBlock);
  if (self->_hasPrefetchedLeft || v6 > v10)
  {
    if (!self->_hasPrefetchedRight && v6 >= v10)
    {
      self->_hasPrefetchedRight = 1;
      for (i = 2; i != 5; ++i)
      {
        v16 = i + self->_primaryIndex;
        if (v16 >= -[PKHorizontalScrollingViewController numberOfItems](self, "numberOfItems"))
          break;
        v28[0] = v11;
        v28[1] = 3221225472;
        v28[2] = __59__PKHorizontalScrollingViewController_scrollViewDidScroll___block_invoke_4;
        v28[3] = &unk_1E3E621A0;
        v29 = v12;
        v30 = v16;
        -[PKHorizontalScrollingViewController fetchDataAtIndex:completion:](self, "fetchDataAtIndex:completion:", v16, v28);

      }
    }
  }
  else
  {
    v17 = 0;
    self->_hasPrefetchedLeft = 1;
    do
    {
      v18 = v17 + self->_primaryIndex;
      v19 = v18 - 2;
      if (v18 < 2)
        break;
      v31[0] = v11;
      v31[1] = 3221225472;
      v31[2] = __59__PKHorizontalScrollingViewController_scrollViewDidScroll___block_invoke_3;
      v31[3] = &unk_1E3E621A0;
      v32 = v12;
      v33 = v19;
      -[PKHorizontalScrollingViewController fetchDataAtIndex:completion:](self, "fetchDataAtIndex:completion:", v19, v31);

      --v17;
    }
    while (v17 != -3);
  }
  -[PKHorizontalScrollingViewController _loadDataForContentOffset:](self, "_loadDataForContentOffset:", v6, v8);
  scrollTimer = self->_scrollTimer;
  if (scrollTimer)
    dispatch_source_cancel(scrollTimer);
  v21 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
  v22 = self->_scrollTimer;
  self->_scrollTimer = v21;

  v23 = self->_scrollTimer;
  v24 = dispatch_time(0, 300000000);
  dispatch_source_set_timer(v23, v24, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
  v25 = self->_scrollTimer;
  v26[0] = v11;
  v26[1] = 3221225472;
  v26[2] = __59__PKHorizontalScrollingViewController_scrollViewDidScroll___block_invoke_5;
  v26[3] = &unk_1E3E61310;
  objc_copyWeak(&v27, location);
  dispatch_source_set_event_handler(v25, v26);
  dispatch_resume((dispatch_object_t)self->_scrollTimer);
  objc_destroyWeak(&v27);

  objc_destroyWeak(&v35);
  objc_destroyWeak(location);

}

void __59__PKHorizontalScrollingViewController_scrollViewDidScroll___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__PKHorizontalScrollingViewController_scrollViewDidScroll___block_invoke_2;
  block[3] = &unk_1E3E61EE8;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v12);
}

void __59__PKHorizontalScrollingViewController_scrollViewDidScroll___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  uint64_t v4;
  int v5;
  id *v6;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = *(_QWORD *)(a1 + 32);
    if (v4)
    {
      v6 = WeakRetained;
      objc_msgSend(WeakRetained[126], "setObject:forKey:", v4, *(_QWORD *)(a1 + 40));
      v5 = objc_msgSend(v6, "_canReloadViewControllers");
      v3 = v6;
      if (v5)
      {
        objc_msgSend(v6, "_reloadPendingViewControllers");
        v3 = v6;
      }
    }
  }

}

void __59__PKHorizontalScrollingViewController_scrollViewDidScroll___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  id v6;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = a2;
  objc_msgSend(v2, "numberWithInteger:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, v5, v6);

}

void __59__PKHorizontalScrollingViewController_scrollViewDidScroll___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  id v6;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = a2;
  objc_msgSend(v2, "numberWithInteger:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, v5, v6);

}

void __59__PKHorizontalScrollingViewController_scrollViewDidScroll___block_invoke_5(uint64_t a1)
{
  dispatch_source_t *WeakRetained;
  dispatch_source_t v2;
  dispatch_source_t *v3;

  WeakRetained = (dispatch_source_t *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    dispatch_source_cancel(WeakRetained[135]);
    v2 = v3[135];
    v3[135] = 0;

    -[dispatch_source_t _reloadPendingViewControllers](v3, "_reloadPendingViewControllers");
    WeakRetained = v3;
  }

}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4;

  self->_isScrolling = 1;
  self->_isDragging = 1;
  -[PKHorizontalScrollingViewController _updatePrimaryViewScrolling](self, "_updatePrimaryViewScrolling", a3);
  -[PKHorizontalScrollingViewController view](self, "view");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsLayout");

}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double x;
  double v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  _BOOL8 v13;
  CGFloat v14;

  x = a4.x;
  self->_isDragging = 0;
  -[UIScrollView contentOffset](self->_scrollView, "contentOffset", a3, a4.x, a4.y);
  v9 = -[PKHorizontalScrollingViewController _indexAtContentOffset:](self, "_indexAtContentOffset:", v8 + self->_currentSize.width * 0.5);
  v10 = v9;
  if (v9 == self->_primaryIndex)
  {
    v11 = v9;
    if (x <= 0.0
      || (v10 = v9 + 1, v9 + 1 >= -[PKHorizontalScrollingViewController numberOfItems](self, "numberOfItems")))
    {
      v13 = x < 0.0 && v11 != 0;
      v10 = v11 - v13;
    }
  }
  -[PKHorizontalScrollingViewController _startOfItemAtIndex:](self, "_startOfItemAtIndex:", v10);
  a5->x = v14;
  a5->y = 0.0;
  -[PKHorizontalScrollingViewController _switchPrimaryIndexToIndex:](self, "_switchPrimaryIndexToIndex:", v10);
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4 && self->_isScrolling)
  {
    self->_isScrolling = 0;
    -[PKHorizontalScrollingViewController _scrollViewStoppedScrolling](self, "_scrollViewStoppedScrolling", a3);
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  if (self->_isScrolling)
  {
    self->_isScrolling = 0;
    -[PKHorizontalScrollingViewController _scrollViewStoppedScrolling](self, "_scrollViewStoppedScrolling", a3);
  }
}

- (id)_dequeueViewControllerForIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  int64_t primaryIndex;
  UIScrollView *scrollView;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_indicesToViewControllerMapping, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    goto LABEL_4;
  -[NSMutableDictionary objectForKey:](self->_nonVisibleIndicesToViewControllerMapping, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](self->_nonVisibleIndicesToViewControllerMapping, "removeObjectForKey:", v5);
  if (v6
    || (-[PKHorizontalScrollingViewController _recoverUnusedViewController](self, "_recoverUnusedViewController"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        -[PKHorizontalScrollingViewController view](self, "view"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "setNeedsLayout"),
        v7,
        v6))
  {
LABEL_4:
    -[NSMutableDictionary setObject:forKey:](self->_indicesToViewControllerMapping, "setObject:forKey:", v6, v5);
    primaryIndex = self->_primaryIndex;
    if (primaryIndex == a3)
    {
      scrollView = self->_scrollView;
      objc_msgSend(v6, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIScrollView bringSubviewToFront:](scrollView, "bringSubviewToFront:", v10);

    }
    objc_msgSend(v6, "setVisible:", 1);
    objc_msgSend(v6, "collectionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setScrollEnabled:", primaryIndex == a3);

  }
  return v6;
}

- (id)_dequeueNonVisibleViewControllerForIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_indicesToViewControllerMapping, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = 0;
  }
  else
  {
    -[NSMutableDictionary objectForKey:](self->_nonVisibleIndicesToViewControllerMapping, "objectForKey:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7
      || (-[PKHorizontalScrollingViewController _recoverUnusedViewController](self, "_recoverUnusedViewController"),
          (v7 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[NSMutableDictionary setObject:forKey:](self->_nonVisibleIndicesToViewControllerMapping, "setObject:forKey:", v7, v5);
      objc_msgSend(v7, "setVisible:", 0);
      -[PKHorizontalScrollingViewController didDequeueViewController:](self, "didDequeueViewController:", v7);
      objc_msgSend(v7, "collectionView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setScrollEnabled:", self->_primaryIndex == a3);

    }
    -[PKHorizontalScrollingViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setNeedsLayout");

  }
  return v7;
}

- (id)_recoverUnusedViewController
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  int64_t primaryIndex;
  uint64_t v17;
  int64_t v18;
  int64_t v19;
  uint64_t v20;
  unint64_t v21;
  id v22;
  void *v23;
  uint64_t v25;
  NSMutableDictionary *obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  -[NSMutableSet anyObject](self->_unusedViewControllers, "anyObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHidden:", 0);

    -[NSMutableSet removeObject:](self->_unusedViewControllers, "removeObject:", v4);
    v6 = v4;
  }
  else
  {
    -[NSMutableDictionary allKeys](self->_nonVisibleIndicesToViewControllerMapping, "allKeys");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v25 = 1112;
    obj = self->_nonVisibleIndicesToViewControllerMapping;
    v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v12 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v28 != v12)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          v15 = objc_msgSend(v14, "integerValue", v25);
          primaryIndex = self->_primaryIndex;
          v17 = objc_msgSend(v14, "integerValue");
          v18 = self->_primaryIndex;
          v19 = v18 - v17;
          v20 = v17 - v18;
          if (v15 >= primaryIndex)
            v21 = v20;
          else
            v21 = v19;
          if (v21 > v11)
          {
            v22 = v14;

            v8 = v22;
            v11 = v21;
          }
        }
        v10 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v10);
    }

    if (v8)
    {
      objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v25), "objectForKey:", v8);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v25), "removeObjectForKey:", v8);
    }
    else
    {
      v23 = 0;
    }
    v6 = v23;

  }
  return v6;
}

- (void)_retireViewControllerForIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_indicesToViewControllerMapping, "objectForKey:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setVisible:", 0);
    -[NSMutableDictionary removeObjectForKey:](self->_indicesToViewControllerMapping, "removeObjectForKey:", v7);
    -[NSMutableDictionary objectForKey:](self->_nonVisibleIndicesToViewControllerMapping, "objectForKey:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[NSMutableDictionary removeObjectForKey:](self->_nonVisibleIndicesToViewControllerMapping, "removeObjectForKey:", v7);
      -[NSMutableSet addObject:](self->_unusedViewControllers, "addObject:", v6);
    }
    -[NSMutableDictionary setObject:forKey:](self->_nonVisibleIndicesToViewControllerMapping, "setObject:forKey:", v5, v7);

  }
}

- (id)_visibileIndicesAtContentOffset:(CGPoint)a3
{
  double x;
  double width;
  unint64_t v6;
  unint64_t v7;
  float v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  double v12;
  unint64_t v13;
  double v14;
  double v15;
  id v16;

  x = a3.x;
  width = self->_currentSize.width;
  v6 = -[PKHorizontalScrollingViewController numberOfItems](self, "numberOfItems", a3.x, a3.y);
  if (v6)
  {
    v7 = v6;
    v8 = x / (width + -24.0);
    v9 = vcvtms_u32_f32(v8);
    if (v6 <= v9)
      v10 = v6 - 1;
    else
      v10 = v9;
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3788]), "initWithIndex:", v10);
    if (v10)
    {
      -[PKHorizontalScrollingViewController _endOfItemAtIndex:](self, "_endOfItemAtIndex:", v10 - 1);
      if (v12 > x)
        objc_msgSend(v11, "addIndex:", v10 - 1);
    }
    v13 = v10 + 1;
    if (v13 < v7)
    {
      do
      {
        -[PKHorizontalScrollingViewController _startOfItemAtIndex:](self, "_startOfItemAtIndex:", v13);
        if (v14 <= x)
          break;
        -[PKHorizontalScrollingViewController _startOfItemAtIndex:](self, "_startOfItemAtIndex:", v13);
        if (v15 >= x + self->_currentSize.width)
          break;
        objc_msgSend(v11, "addIndex:", v13++);
      }
      while (v7 != v13);
    }
    if (self->_primaryIndex != 0x7FFFFFFFFFFFFFFFLL && (objc_msgSend(v11, "containsIndex:") & 1) == 0)
      objc_msgSend(v11, "addIndex:", self->_primaryIndex);
    v16 = (id)objc_msgSend(v11, "copy");

  }
  else
  {
    v16 = objc_alloc_init(MEMORY[0x1E0CB36B8]);
  }
  return v16;
}

- (unint64_t)_indexAtContentOffset:(CGPoint)a3
{
  float v3;

  v3 = a3.x / (self->_currentSize.width + -24.0);
  return vcvtms_u32_f32(v3);
}

- (double)_startOfItemAtIndex:(unint64_t)a3
{
  return (self->_currentSize.width + -24.0) * (double)a3;
}

- (double)_endOfItemAtIndex:(unint64_t)a3
{
  double v4;

  -[PKHorizontalScrollingViewController _startOfItemAtIndex:](self, "_startOfItemAtIndex:", a3);
  return v4 + self->_currentSize.width;
}

- (unint64_t)_primaryIndexAtOffset:(CGPoint)a3
{
  return -[PKHorizontalScrollingViewController _indexAtContentOffset:](self, "_indexAtContentOffset:", a3.x + self->_currentSize.width * 0.5, a3.y);
}

- (double)_transitionProgress
{
  double v3;
  double v4;
  double v5;

  -[PKHorizontalScrollingViewController _startOfItemAtIndex:](self, "_startOfItemAtIndex:", self->_primaryIndex);
  v4 = v3;
  -[UIScrollView contentOffset](self->_scrollView, "contentOffset");
  return fmax(fmin(vabdd_f64(v4, v5) / (self->_currentSize.width + -24.0), 1.0), 0.0);
}

- (double)_yPositionForNonPrimaryViewControllers
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;

  -[PKHorizontalScrollingViewController _dequeueViewControllerForIndex:](self, "_dequeueViewControllerForIndex:", self->_primaryIndex);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "adjustedContentInset");
  v5 = -v4;
  objc_msgSend(v3, "contentOffset");
  v7 = v5 - v6;

  return v7;
}

- (void)_switchPrimaryIndexToIndex:(unint64_t)a3
{
  NSMutableDictionary *indicesToViewControllerMapping;
  void *v6;
  NSMutableDictionary *v7;
  void *v8;
  void *v9;
  UIScrollView *scrollView;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  if (self->_primaryIndex != a3)
  {
    self->_hasPrefetchedLeft = 0;
    self->_hasPrefetchedRight = 0;
    indicesToViewControllerMapping = self->_indicesToViewControllerMapping;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](indicesToViewControllerMapping, "objectForKey:", v6);
    v18 = (id)objc_claimAutoreleasedReturnValue();

    -[PKHorizontalScrollingViewController _updatePrimaryIndex:](self, "_updatePrimaryIndex:", a3);
    v7 = self->_indicesToViewControllerMapping;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_primaryIndex);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](v7, "objectForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    scrollView = self->_scrollView;
    objc_msgSend(v9, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIScrollView bringSubviewToFront:](scrollView, "bringSubviewToFront:", v11);

    objc_msgSend(v9, "collectionView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setContentOffset:", 0.0, self->_childViewControllerVerticalOffset);

    -[PKHorizontalScrollingViewController footerView](self, "footerView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[PKHorizontalScrollingViewController footerView](self, "footerView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "footer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setCurrentFooter:", v15);

      -[PKHorizontalScrollingViewController footerView](self, "footerView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "footer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setNextFooter:", v17);

    }
  }
}

- (void)_updatePrimaryIndex:(int64_t)a3
{
  if (self->_primaryIndex != a3)
  {
    self->_primaryIndex = a3;
    -[PKHorizontalScrollingViewController didMoveToPrimaryIndex:](self, "didMoveToPrimaryIndex:");
  }
}

- (void)_reloadDataForViewControllerAtIndex:(unint64_t)a3 swap:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int64_t primaryIndex;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16[2];
  BOOL v17;
  id location;

  v4 = a4;
  -[PKHorizontalScrollingViewController _dequeueViewControllerForIndex:](self, "_dequeueViewControllerForIndex:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[PKHorizontalScrollingViewController cachedDataAtIndex:](self, "cachedDataAtIndex:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 && !self->_isLowEndDevice)
    {
      objc_msgSend(v7, "setData:swap:", v8, v4);
      -[PKHorizontalScrollingViewController footerView](self, "footerView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        primaryIndex = self->_primaryIndex;

        if (primaryIndex == a3)
        {
          -[PKHorizontalScrollingViewController footerView](self, "footerView");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "footer");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setCurrentFooter:", v14);

        }
      }
    }
    else
    {
      objc_msgSend(v7, "data");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKHorizontalScrollingViewController loadingDataObjectWithCurrentData:index:swap:](self, "loadingDataObjectWithCurrentData:index:swap:", v9, a3, v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
        objc_msgSend(v7, "setData:swap:", v10, 0);
      objc_initWeak(&location, self);
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __80__PKHorizontalScrollingViewController__reloadDataForViewControllerAtIndex_swap___block_invoke;
      v15[3] = &unk_1E3E621C8;
      objc_copyWeak(v16, &location);
      v16[1] = (id)a3;
      v15[4] = self;
      v17 = v4;
      -[PKHorizontalScrollingViewController fetchDataAtIndex:completion:](self, "fetchDataAtIndex:completion:", a3, v15);
      objc_destroyWeak(v16);
      objc_destroyWeak(&location);

    }
  }

}

void __80__PKHorizontalScrollingViewController__reloadDataForViewControllerAtIndex_swap___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD block[5];
  id v7;
  id v8[2];
  char v9;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__PKHorizontalScrollingViewController__reloadDataForViewControllerAtIndex_swap___block_invoke_2;
  block[3] = &unk_1E3E61A08;
  objc_copyWeak(v8, (id *)(a1 + 40));
  v8[1] = *(id *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 32);
  v9 = *(_BYTE *)(a1 + 56);
  block[4] = v4;
  v7 = v3;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(v8);
}

void __80__PKHorizontalScrollingViewController__reloadDataForViewControllerAtIndex_swap___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  void *v4;
  _BOOL8 v5;
  id *v6;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 56));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6[138], "objectForKey:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      objc_msgSend(v6[139], "objectForKey:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v4)
        goto LABEL_12;
    }
    if (*(_BYTE *)(a1 + 64))
    {
      v5 = 1;
    }
    else if (*(_QWORD *)(a1 + 56) == *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1088))
    {
      v5 = 0;
    }
    else
    {
      if (!objc_msgSend(v6, "_canReloadViewControllers"))
      {
        objc_msgSend(v6[126], "setObject:forKey:", *(_QWORD *)(a1 + 40), v3);
        goto LABEL_11;
      }
      v5 = *(_BYTE *)(a1 + 64) != 0;
    }
    objc_msgSend(v4, "setData:swap:", *(_QWORD *)(a1 + 40), v5);
LABEL_11:

LABEL_12:
    WeakRetained = v6;
  }

}

- (BOOL)_canReloadViewControllers
{
  if (!self->_isScrolling)
    return 1;
  if (self->_isLowEndDevice)
    return 0;
  return self->_isDragging;
}

- (void)horizontalScrollingChildViewController:(id)a3 scrollViewDidScroll:(id)a4
{
  NSMutableDictionary *indicesToViewControllerMapping;
  void *v7;
  int64_t primaryIndex;
  id v9;
  void *v10;
  id v11;
  double v12;
  void *v13;
  id v14;

  v14 = a4;
  indicesToViewControllerMapping = self->_indicesToViewControllerMapping;
  v7 = (void *)MEMORY[0x1E0CB37E8];
  primaryIndex = self->_primaryIndex;
  v9 = a3;
  objc_msgSend(v7, "numberWithInteger:", primaryIndex);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](indicesToViewControllerMapping, "objectForKey:", v10);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11 == v9)
  {
    objc_msgSend(v14, "contentOffset");
    self->_childViewControllerVerticalOffset = v12;
    -[PKHorizontalScrollingViewController view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setNeedsLayout");

  }
}

- (int64_t)primaryIndex
{
  return self->_primaryIndex;
}

- (NSIndexSet)visibleIndices
{
  return self->_visibleIndices;
}

- (NSMutableDictionary)indicesToViewControllerMapping
{
  return self->_indicesToViewControllerMapping;
}

- (NSMutableDictionary)nonVisibleIndicesToViewControllerMapping
{
  return self->_nonVisibleIndicesToViewControllerMapping;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonVisibleIndicesToViewControllerMapping, 0);
  objc_storeStrong((id *)&self->_indicesToViewControllerMapping, 0);
  objc_storeStrong((id *)&self->_visibleIndices, 0);
  objc_storeStrong((id *)&self->_scrollTimer, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_pendingDataCollectionViewUpdates, 0);
  objc_storeStrong((id *)&self->_unusedViewControllers, 0);
  objc_storeStrong((id *)&self->_pendingUpdates, 0);
  objc_destroyWeak((id *)&self->_dataSource);
}

@end
