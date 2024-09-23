@implementation _TVCarouselView

- (_TVCarouselView)initWithFrame:(CGRect)a3
{
  _TVCarouselView *v3;
  _TVCarouselCollectionView *v4;
  double x;
  double y;
  double width;
  double height;
  _TVCarouselCollectionViewLayout *v9;
  uint64_t v10;
  _TVCarouselCollectionView *collectionView;
  uint64_t v12;
  NSDictionary *collectionToDatasourceIndexMap;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  UIFocusGuide *v19;
  UIFocusGuide *focusGuide;
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
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  objc_super v39;
  _QWORD v40[4];
  _QWORD v41[3];
  CGRect v42;
  CGRect v43;

  v41[1] = *MEMORY[0x24BDAC8D0];
  v39.receiver = self;
  v39.super_class = (Class)_TVCarouselView;
  v3 = -[_TVCarouselView initWithFrame:](&v39, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [_TVCarouselCollectionView alloc];
    -[_TVCarouselView bounds](v3, "bounds");
    v43 = CGRectInset(v42, 0.0, 0.0);
    x = v43.origin.x;
    y = v43.origin.y;
    width = v43.size.width;
    height = v43.size.height;
    v9 = objc_alloc_init(_TVCarouselCollectionViewLayout);
    v10 = -[_TVCarouselCollectionView initWithFrame:collectionViewLayout:](v4, "initWithFrame:collectionViewLayout:", v9, x, y, width, height);
    collectionView = v3->_collectionView;
    v3->_collectionView = (_TVCarouselCollectionView *)v10;

    -[_TVCarouselCollectionView setAutoresizingMask:](v3->_collectionView, "setAutoresizingMask:", 18);
    -[_TVCarouselCollectionView setDataSource:](v3->_collectionView, "setDataSource:", v3);
    -[_TVCarouselCollectionView setDelegate:](v3->_collectionView, "setDelegate:", v3);
    -[_TVCarouselCollectionView setOpaque:](v3->_collectionView, "setOpaque:", 0);
    -[_TVCarouselCollectionView setBackgroundColor:](v3->_collectionView, "setBackgroundColor:", 0);
    -[_TVCarouselCollectionView setClipsToBounds:](v3->_collectionView, "setClipsToBounds:", 0);
    -[_TVCarouselCollectionView setShowsHorizontalScrollIndicator:](v3->_collectionView, "setShowsHorizontalScrollIndicator:", 0);
    -[_TVCarouselCollectionView setShowsVerticalScrollIndicator:](v3->_collectionView, "setShowsVerticalScrollIndicator:", 0);
    v3->_itemSize = (CGSize)vdupq_n_s64(0x4049000000000000uLL);
    v3->_interitemSpacing = 10.0;
    -[_TVCarouselView addSubview:](v3, "addSubview:", v3->_collectionView);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 0);
    v12 = objc_claimAutoreleasedReturnValue();
    collectionToDatasourceIndexMap = v3->_collectionToDatasourceIndexMap;
    v3->_collectionToDatasourceIndexMap = (NSDictionary *)v12;

    v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E80]), "initWithTarget:action:", v3, sel__handlePlayGesture_);
    objc_msgSend(v38, "setAllowedPressTypes:", &unk_24FD45E78);
    -[_TVCarouselView addGestureRecognizer:](v3, "addGestureRecognizer:", v38);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *MEMORY[0x24BDF7528];
    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v14;
    objc_msgSend(v14, "addObserver:selector:name:object:", v3, sel__applicationDidEnterBackgroundNotification_, v15, v16);

    v17 = *MEMORY[0x24BDF7510];
    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v3, sel__applicationDidBecomeActiveNotification_, v17, v18);

    objc_msgSend(v14, "addObserver:selector:name:object:", v3, sel__accessibilityReducedMotionNotification_, *MEMORY[0x24BDF7310], 0);
    v3->_focusThrottleTimeInterval = 0.25;
    v3->_numFocusChangesInInterval = 0;
    v3->_autoscrollInterval = 10.0;
    v3->_unitScrollDuration = 4.0;
    v19 = (UIFocusGuide *)objc_alloc_init(MEMORY[0x24BDF6A58]);
    focusGuide = v3->_focusGuide;
    v3->_focusGuide = v19;

    v41[0] = v3->_collectionView;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v41, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIFocusGuide setPreferredFocusEnvironments:](v3->_focusGuide, "setPreferredFocusEnvironments:", v21);

    -[_TVCarouselView addLayoutGuide:](v3, "addLayoutGuide:", v3->_focusGuide);
    v32 = (void *)MEMORY[0x24BDD1628];
    -[_TVCarouselView leftAnchor](v3, "leftAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIFocusGuide leftAnchor](v3->_focusGuide, "leftAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:", v35);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = v34;
    -[_TVCarouselView topAnchor](v3, "topAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIFocusGuide topAnchor](v3->_focusGuide, "topAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:constant:", v22, 1.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v40[1] = v23;
    -[_TVCarouselView rightAnchor](v3, "rightAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIFocusGuide rightAnchor](v3->_focusGuide, "rightAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v40[2] = v26;
    -[_TVCarouselView bottomAnchor](v3, "bottomAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIFocusGuide bottomAnchor](v3->_focusGuide, "bottomAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:constant:", v28, -1.0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v40[3] = v29;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v40, 4);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "activateConstraints:", v30);

    v3->_pageControlMargin = 5.0;
  }
  return v3;
}

- (void)tv_setShowcaseFactor:(double)a3
{
  self->_showcaseFactor = a3;
  -[_TVCarouselView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setHeaderView:(id)a3
{
  UIView *v5;
  UIView *headerView;
  void *v7;
  UIView *v8;

  v5 = (UIView *)a3;
  headerView = self->_headerView;
  v8 = v5;
  if (headerView != v5)
  {
    -[UIView removeFromSuperview](headerView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_headerView, a3);
    -[_TVCarouselView headerView](self, "headerView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_TVCarouselView addSubview:](self, "addSubview:", v7);

  }
  -[_TVCarouselView setNeedsLayout](self, "setNeedsLayout");

}

- (void)setScrollMode:(unint64_t)a3
{
  NSObject *autoScrollTimer;

  if (self->_scrollMode != a3)
  {
    self->_scrollMode = a3;
    autoScrollTimer = self->_autoScrollTimer;
    if (a3 || !autoScrollTimer)
    {
      if (a3 == 2)
      {
        if (autoScrollTimer)
          dispatch_suspend(autoScrollTimer);
      }
    }
    else
    {
      dispatch_resume(autoScrollTimer);
    }
  }
}

- (void)setShowsPageControl:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  self->_showsPageControl = a3;
  -[_TVCarouselView pageControl](self, "pageControl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (!v5)
    {
      v6 = (void *)objc_opt_new();
      objc_msgSend(v6, "setHidesForSinglePage:", 1);
      objc_msgSend(v6, "addTarget:action:forControlEvents:", self, sel__pageControlValueChanged_, 4096);
      -[_TVCarouselView setPageControl:](self, "setPageControl:", v6);
      -[_TVCarouselView pageControl](self, "pageControl");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setHidesForSinglePage:", 1);

      -[_TVCarouselView pageControl](self, "pageControl");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[_TVCarouselView addSubview:](self, "addSubview:", v8);

    }
    -[_TVCarouselView setNeedsLayout](self, "setNeedsLayout");
  }
  else if (v5)
  {
    -[_TVCarouselView pageControl](self, "pageControl");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeFromSuperview");

    -[_TVCarouselView setPageControl:](self, "setPageControl:", 0);
  }
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  NSIndexPath *focusedIndexPath;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_TVCarouselView;
  -[_TVCarouselView layoutSubviews](&v10, sel_layoutSubviews);
  -[_TVCarouselView itemSize](self, "itemSize");
  v4 = v3;
  -[_TVCarouselView interitemSpacing](self, "interitemSpacing");
  v6 = v5 + v4 * 0.5 + 10.0;
  -[_TVCarouselView bounds](self, "bounds");
  v8 = v6 - v7 * 0.5;
  if (v8 < 0.0)
    v8 = 0.0;
  -[_TVCarouselCollectionView _setVisibleRectEdgeInsets:](self->_collectionView, "_setVisibleRectEdgeInsets:", 0.0, -v8, 0.0, -v8);
  if (self->_flags.firstLayoutPass)
  {
    self->_flags.firstLayoutPass = 0;
    -[_TVCarouselView layoutBelowIfNeeded](self, "layoutBelowIfNeeded");
    -[_TVCarouselView _updateAutoScrollTimer](self, "_updateAutoScrollTimer");
    focusedIndexPath = self->_focusedIndexPath;
    if (focusedIndexPath)
      -[_TVCarouselView _updateContentOffsetForFocusedIndex:animated:](self, "_updateContentOffsetForFocusedIndex:animated:", -[NSIndexPath item](focusedIndexPath, "item"), 0);
  }
  -[_TVCarouselView _updatePageControl](self, "_updatePageControl");
}

- (void)_startContinuousScroll
{
  int64_t v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  id v12;

  if (!self->_displayLink)
  {
    v3 = -[_TVCarouselView _centerCollectionViewCellIndex](self, "_centerCollectionViewCellIndex");
    -[_TVCarouselView _setContentOffsetForCollectionViewIndex:](self, "_setContentOffsetForCollectionViewIndex:", v3);
    -[_TVCarouselView _collectionView](self, "_collectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentOffset");
    v6 = v5;
    v8 = v7;

    -[_TVCarouselView _contentOffsetXForCollectionViewIndex:](self, "_contentOffsetXForCollectionViewIndex:", v3 + 1);
    v10 = v9;
    -[_TVCarouselView setOffsetChangePerSecond:](self, "setOffsetChangePerSecond:", (v9 - v6) / self->_unitScrollDuration);
    -[_TVCarouselView setTargetContentOffset:](self, "setTargetContentOffset:", v10, v8);
    -[_TVCarouselView setPreviousDisplayLinkTimestamp:](self, "setPreviousDisplayLinkTimestamp:", 0.0);
    -[_TVCarouselView _stopContinuousScroll](self, "_stopContinuousScroll");
    objc_msgSend(MEMORY[0x24BDE5670], "displayLinkWithTarget:selector:", self, sel_displayLinkDidFire_);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addToRunLoop:forMode:", v11, *MEMORY[0x24BDBCB80]);

    -[_TVCarouselView setDisplayLink:](self, "setDisplayLink:", v12);
  }
}

- (void)displayLinkDidFire:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;

  -[_TVCarouselView displayLink](self, "displayLink", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timestamp");
  v6 = v5;

  -[_TVCarouselView previousDisplayLinkTimestamp](self, "previousDisplayLinkTimestamp");
  if (v7 == 0.0)
  {
    v9 = 0.0;
  }
  else
  {
    -[_TVCarouselView previousDisplayLinkTimestamp](self, "previousDisplayLinkTimestamp");
    v9 = v6 - v8;
  }
  -[_TVCarouselView setPreviousDisplayLinkTimestamp:](self, "setPreviousDisplayLinkTimestamp:", v6);
  if (-[_TVCarouselView _canScrollCarouselView](self, "_canScrollCarouselView"))
  {
    -[_TVCarouselView _collectionView](self, "_collectionView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "contentOffset");
    v12 = v11;
    v14 = v13;

    -[_TVCarouselView offsetChangePerSecond](self, "offsetChangePerSecond");
    v16 = v12 + v15 * v9;
    -[_TVCarouselView _collectionView](self, "_collectionView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setContentOffset:animated:", 0, v16, v14);

    -[_TVCarouselView displayLink](self, "displayLink");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "targetTimestamp");
    v20 = v19 - v6;
    -[_TVCarouselView offsetChangePerSecond](self, "offsetChangePerSecond");
    v22 = v20 * v21;

    -[_TVCarouselView _collectionView](self, "_collectionView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "contentOffset");
    v25 = v22 + v24;
    -[_TVCarouselView targetContentOffset](self, "targetContentOffset");
    v27 = v26;

    if (v25 >= v27)
      -[_TVCarouselView _focusItemAtIndex:](self, "_focusItemAtIndex:", -[_TVCarouselView _centerCollectionViewCellIndex](self, "_centerCollectionViewCellIndex") + 1);
  }
}

- (void)_stopContinuousScroll
{
  CADisplayLink *displayLink;

  -[CADisplayLink invalidate](self->_displayLink, "invalidate");
  displayLink = self->_displayLink;
  self->_displayLink = 0;

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[_TVCarouselView _stopAutoScrollTimer](self, "_stopAutoScrollTimer");
  -[_TVCarouselView _stopContinuousScroll](self, "_stopContinuousScroll");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)_TVCarouselView;
  -[_TVCarouselView dealloc](&v4, sel_dealloc);
}

- (id)_collectionView
{
  return self->_collectionView;
}

- (void)_pageControlValueChanged:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(v4, "currentPage");
  v6 = objc_msgSend(v4, "interactionState");

  -[_TVCarouselView _centerItemAtPageIndex:animated:](self, "_centerItemAtPageIndex:animated:", v5, v6 != 2);
}

- (void)didMoveToWindow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_TVCarouselView;
  -[_TVCarouselView didMoveToWindow](&v4, sel_didMoveToWindow);
  -[_TVCarouselView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    self->_flags.firstLayoutPass = 1;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_TVCarouselView;
  -[_TVCarouselView didUpdateFocusInContext:withAnimationCoordinator:](&v5, sel_didUpdateFocusInContext_withAnimationCoordinator_, a3, a4);
  -[_TVCarouselView _updateAutoScrollTimer](self, "_updateAutoScrollTimer");
  -[_TVCarouselView _updateIdleModeLayoutAttributes](self, "_updateIdleModeLayoutAttributes");
}

- (id)preferredFocusedView
{
  return self->_collectionView;
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double height;

  height = self->_itemSize.height;
  result.height = height;
  return result;
}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_TVCarouselView;
  -[_TVCarouselView setSemanticContentAttribute:](&v5, sel_setSemanticContentAttribute_);
  -[_TVCarouselCollectionView setSemanticContentAttribute:](self->_collectionView, "setSemanticContentAttribute:", a3);
}

- (id)indexPathForPreferredFocusedViewInCollectionView:(id)a3
{
  int64_t v3;

  v3 = -[_TVCarouselView _centerCollectionViewCellIndex](self, "_centerCollectionViewCellIndex", a3);
  return (id)objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", v3, 0);
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id WeakRetained;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int64_t v10;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  self->_numberOfRealItemsForDataSource = objc_msgSend(WeakRetained, "numberOfItemsInCarouselView:", self);

  -[_TVCarouselCollectionView setScrollEnabled:](self->_collectionView, "setScrollEnabled:", self->_numberOfRealItemsForDataSource > 1);
  -[_TVCarouselView collectionToDatasourceIndexMap](self, "collectionToDatasourceIndexMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (!v7)
  {
    -[_TVCarouselView _prepareIndexMap:](self, "_prepareIndexMap:", 0x7FFFFFFFFFFFFFFFLL);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_TVCarouselView setCollectionToDatasourceIndexMap:](self, "setCollectionToDatasourceIndexMap:", v8);

  }
  -[_TVCarouselView collectionToDatasourceIndexMap](self, "collectionToDatasourceIndexMap");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  return v10;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id WeakRetained;
  void *v10;

  self->_indexToDeque = objc_msgSend(a4, "item", a3);
  -[_TVCarouselView collectionToDatasourceIndexMap](self, "collectionToDatasourceIndexMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_indexToDeque);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntegerValue");

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "carouselView:cellForItemAtIndex:", self, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  self->_indexToDeque = 0x7FFFFFFFFFFFFFFFLL;
  return v10;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  _TVCarouselView *v5;
  TVCarouselViewDelegate **p_delegate;
  id v7;
  id WeakRetained;
  uint64_t v9;

  if ((*(_BYTE *)&self->_carouselViewFlags & 2) == 0)
    return 1;
  v5 = self;
  p_delegate = &self->_delegate;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v9 = -[_TVCarouselView _itemIndexForIndexPath:](v5, "_itemIndexForIndexPath:", v7);

  LOBYTE(v5) = objc_msgSend(WeakRetained, "carouselView:shouldHighlightItemAtIndex:", v5, v9);
  return (char)v5;
}

- (void)collectionView:(id)a3 didHighlightItemAtIndexPath:(id)a4
{
  TVCarouselViewDelegate **p_delegate;
  id v6;
  unint64_t v7;
  id WeakRetained;

  if ((*(_BYTE *)&self->_carouselViewFlags & 4) != 0)
  {
    p_delegate = &self->_delegate;
    v6 = a4;
    WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    v7 = -[_TVCarouselView _itemIndexForIndexPath:](self, "_itemIndexForIndexPath:", v6);

    objc_msgSend(WeakRetained, "carouselView:didHighlightItemAtIndex:", self, v7);
  }
}

- (void)collectionView:(id)a3 didUnhighlightItemAtIndexPath:(id)a4
{
  TVCarouselViewDelegate **p_delegate;
  id v6;
  unint64_t v7;
  id WeakRetained;

  if ((*(_BYTE *)&self->_carouselViewFlags & 8) != 0)
  {
    p_delegate = &self->_delegate;
    v6 = a4;
    WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    v7 = -[_TVCarouselView _itemIndexForIndexPath:](self, "_itemIndexForIndexPath:", v6);

    objc_msgSend(WeakRetained, "carouselView:didUnhighlightItemAtIndex:", self, v7);
  }
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  _TVCarouselView *v5;
  TVCarouselViewDelegate **p_delegate;
  id v7;
  id WeakRetained;
  uint64_t v9;

  if ((*(_BYTE *)&self->_carouselViewFlags & 0x10) == 0)
    return 1;
  v5 = self;
  p_delegate = &self->_delegate;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v9 = -[_TVCarouselView _itemIndexForIndexPath:](v5, "_itemIndexForIndexPath:", v7);

  LOBYTE(v5) = objc_msgSend(WeakRetained, "carouselView:shouldSelectItemAtIndex:", v5, v9);
  return (char)v5;
}

- (BOOL)collectionView:(id)a3 shouldDeselectItemAtIndexPath:(id)a4
{
  _TVCarouselView *v5;
  TVCarouselViewDelegate **p_delegate;
  id v7;
  id WeakRetained;
  uint64_t v9;

  if ((*(_BYTE *)&self->_carouselViewFlags & 0x20) == 0)
    return 1;
  v5 = self;
  p_delegate = &self->_delegate;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v9 = -[_TVCarouselView _itemIndexForIndexPath:](v5, "_itemIndexForIndexPath:", v7);

  LOBYTE(v5) = objc_msgSend(WeakRetained, "carouselView:shouldDeselectItemAtIndex:", v5, v9);
  return (char)v5;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  TVCarouselViewDelegate **p_delegate;
  id v6;
  unint64_t v7;
  id WeakRetained;

  if ((*(_BYTE *)&self->_carouselViewFlags & 0x40) != 0)
  {
    p_delegate = &self->_delegate;
    v6 = a4;
    WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    v7 = -[_TVCarouselView _itemIndexForIndexPath:](self, "_itemIndexForIndexPath:", v6);

    objc_msgSend(WeakRetained, "carouselView:didSelectItemAtIndex:", self, v7);
  }
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  TVCarouselViewDelegate **p_delegate;
  id v6;
  unint64_t v7;
  id WeakRetained;

  if ((*(_BYTE *)&self->_carouselViewFlags & 0x80) != 0)
  {
    p_delegate = &self->_delegate;
    v6 = a4;
    WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    v7 = -[_TVCarouselView _itemIndexForIndexPath:](self, "_itemIndexForIndexPath:", v6);

    objc_msgSend(WeakRetained, "carouselView:didDeselectItemAtIndex:", self, v7);
  }
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  unint64_t v11;
  id WeakRetained;
  unsigned int (**v13)(void);
  id v14;
  _QWORD v15[6];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!self->_focusedIndexPath)
    -[_TVCarouselView _updateContentOffsetForFocusedIndex:animated:](self, "_updateContentOffsetForFocusedIndex:animated:", 0x7FFFFFFFFFFFFFFFLL, 0);
  v11 = -[_TVCarouselView _itemIndexForIndexPath:](self, "_itemIndexForIndexPath:", v10);
  if ((*((_BYTE *)&self->_carouselViewFlags + 1) & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "carouselView:willDisplayCell:forItemAtIndex:", self, v9, v11);

  }
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __69___TVCarouselView_collectionView_willDisplayCell_forItemAtIndexPath___block_invoke;
  v15[3] = &unk_24FD409A8;
  v15[4] = self;
  v15[5] = v11;
  v13 = (unsigned int (**)(void))MEMORY[0x2348A7F6C](v15);
  if (v13[2]() && (*((_BYTE *)&self->_carouselViewFlags + 1) & 0x20) != 0)
  {
    v14 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v14, "carouselView:willDisplayItemAtIndex:", self, v11);

  }
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v7;
  unint64_t v8;
  id WeakRetained;
  unsigned int (**v10)(void);
  id v11;
  _QWORD v12[6];

  v7 = a4;
  v8 = -[_TVCarouselView _previousItemIndexForIndexPath:](self, "_previousItemIndexForIndexPath:", a5);
  if ((*((_BYTE *)&self->_carouselViewFlags + 1) & 2) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "carouselView:didEndDisplayingCell:forItemAtIndex:", self, v7, v8);

  }
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __74___TVCarouselView_collectionView_didEndDisplayingCell_forItemAtIndexPath___block_invoke;
  v12[3] = &unk_24FD409A8;
  v12[4] = self;
  v12[5] = v8;
  v10 = (unsigned int (**)(void))MEMORY[0x2348A7F6C](v12);
  if (v10[2]() && (*((_BYTE *)&self->_carouselViewFlags + 1) & 0x40) != 0)
  {
    v11 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v11, "carouselView:didEndDisplayingItemAtIndex:", self, v8);

  }
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  double v7;
  double v8;

  v4 = a3;
  if (self->_scrollMode != 1)
  {
    if (self->_firstFocusChangeInInterval)
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "timeIntervalSinceDate:", self->_firstFocusChangeInInterval);
      v8 = v7;

      if (v8 < self->_focusThrottleTimeInterval)
      {
        v5 = self->_numFocusChangesInInterval < 1;
        goto LABEL_8;
      }
      self->_numFocusChangesInInterval = 0;
    }
    v5 = 1;
    goto LABEL_8;
  }
  v5 = 0;
LABEL_8:

  return v5;
}

- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4
{
  return 1;
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y;
  double x;
  int64_t v9;
  int64_t v10;
  int v11;
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
  uint64_t v26;
  uint64_t v27;
  NSIndexPath *v28;
  NSIndexPath *focusedIndexPath;
  void *v30;
  CGFloat v31;

  y = a4.y;
  x = a4.x;
  v9 = -[_TVCarouselView _centerCollectionViewCellIndex](self, "_centerCollectionViewCellIndex", a3);
  v10 = v9;
  v11 = y == *(double *)(MEMORY[0x24BDBEFB0] + 8) && x == *MEMORY[0x24BDBEFB0];
  if (v11 == 1)
  {
    -[_TVCarouselView _contentOffsetXForCollectionViewIndex:](self, "_contentOffsetXForCollectionViewIndex:", v9);
    v13 = v12;
    -[_TVCarouselView itemSize](self, "itemSize");
    v15 = v13 + v14 * 0.5;
    -[_TVCarouselView interitemSpacing](self, "interitemSpacing");
    v17 = v16 * 0.5 + v15;
    -[_TVCarouselView _contentOffsetXForCollectionViewIndex:](self, "_contentOffsetXForCollectionViewIndex:", v10);
    v19 = v18;
    -[_TVCarouselView itemSize](self, "itemSize");
    v21 = v19 - v20 * 0.5;
    -[_TVCarouselView interitemSpacing](self, "interitemSpacing");
    v23 = v21 - v22 * 0.5;
  }
  else
  {
    -[_TVCarouselView _contentOffsetXForCollectionViewIndex:](self, "_contentOffsetXForCollectionViewIndex:", v9 + 1);
    v17 = v24;
    -[_TVCarouselView _contentOffsetXForCollectionViewIndex:](self, "_contentOffsetXForCollectionViewIndex:", v10 - 1);
  }
  v25 = floor(a5->x);
  if (v25 <= v23)
    v26 = -1;
  else
    v26 = v25 >= v17;
  v27 = v26 + v10;
  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", v27, 0);
  v28 = (NSIndexPath *)objc_claimAutoreleasedReturnValue();
  focusedIndexPath = self->_focusedIndexPath;
  self->_focusedIndexPath = v28;

  if (((v26 != 0) & ~v11) == 0)
  {
    -[_TVCarouselView _collectionView](self, "_collectionView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "contentOffset");
    a5->x = v31;

    -[_TVCarouselView _setContentOffsetForCollectionViewIndex:animated:](self, "_setContentOffsetForCollectionViewIndex:animated:", v27, 1);
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id WeakRetained;
  NSIndexPath *focusedIndexPath;
  int64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  NSIndexPath *v13;
  NSIndexPath *v14;
  id v15;

  v15 = a3;
  if ((*((_BYTE *)&self->_carouselViewFlags + 1) & 4) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "carouselViewDidScroll:", self);

  }
  focusedIndexPath = self->_focusedIndexPath;
  if (focusedIndexPath)
  {
    if (-[NSIndexPath item](focusedIndexPath, "item") != 0x7FFFFFFFFFFFFFFFLL)
    {
      v6 = -[_TVCarouselView _centerCollectionViewCellIndex](self, "_centerCollectionViewCellIndex");
      -[_TVCarouselView _contentOffsetXForCollectionViewIndex:](self, "_contentOffsetXForCollectionViewIndex:", v6 + 1);
      v8 = v7;
      -[_TVCarouselView _contentOffsetXForCollectionViewIndex:](self, "_contentOffsetXForCollectionViewIndex:", v6 - 1);
      v10 = v9;
      objc_msgSend(v15, "contentOffset");
      if (floor(v11) <= v10 || (objc_msgSend(v15, "contentOffset"), floor(v12) >= v8))
      {
        -[_TVCarouselView _focusItemAtIndex:](self, "_focusItemAtIndex:", -[NSIndexPath item](self->_focusedIndexPath, "item"));
        objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", v6, 0);
        v13 = (NSIndexPath *)objc_claimAutoreleasedReturnValue();
        v14 = self->_focusedIndexPath;
        self->_focusedIndexPath = v13;

      }
    }
  }

}

- (void)_handlePlayGesture:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  unint64_t v7;
  id WeakRetained;
  id v9;

  if (objc_msgSend(a3, "state") == 3 && (*((_BYTE *)&self->_carouselViewFlags + 1) & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "focusedView");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[_TVCarouselView visibleCells](self, "visibleCells");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "containsObject:", v9);

      if (v6)
      {
        v7 = -[_TVCarouselView indexForCell:](self, "indexForCell:", v9);
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(WeakRetained, "carouselView:didPlayItemAtIndex:", self, v7);

      }
    }

  }
}

- (id)_cellForItemAtIndex:(unint64_t)a3
{
  _TVCarouselCollectionView *collectionView;
  void *v4;
  void *v5;

  collectionView = self->_collectionView;
  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVCarouselCollectionView cellForItemAtIndexPath:](collectionView, "cellForItemAtIndexPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)focusedCell
{
  void *focusedIndexPath;

  focusedIndexPath = self->_focusedIndexPath;
  if (focusedIndexPath)
  {
    -[_TVCarouselView _cellForItemAtIndex:](self, "_cellForItemAtIndex:", objc_msgSend(focusedIndexPath, "item"));
    focusedIndexPath = (void *)objc_claimAutoreleasedReturnValue();
  }
  return focusedIndexPath;
}

- (id)dequeueReusableCellWithReuseIdentifier:(id)a3 forIndex:(unint64_t)a4
{
  id v5;
  unint64_t indexToDeque;
  void *v7;
  _TVCarouselCollectionView *collectionView;
  void *v9;

  v5 = a3;
  indexToDeque = self->_indexToDeque;
  if (indexToDeque == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("-dequeueReusableCellWithReuseIdentifier:forIndex: may only be called from -carouselView:cellForItemAtIndex:"));
    v7 = 0;
  }
  else
  {
    collectionView = self->_collectionView;
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", indexToDeque, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_TVCarouselCollectionView dequeueReusableCellWithReuseIdentifier:forIndexPath:](collectionView, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v5, v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (unint64_t)indexForCell:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;

  -[_TVCarouselCollectionView indexPathForCell:](self->_collectionView, "indexPathForCell:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[_TVCarouselView collectionToDatasourceIndexMap](self, "collectionToDatasourceIndexMap");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v4, "item"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "unsignedIntegerValue");

  }
  else
  {
    v8 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v8;
}

- (void)registerClass:(Class)a3 forCellWithReuseIdentifier:(id)a4
{
  -[_TVCarouselCollectionView registerClass:forCellWithReuseIdentifier:](self->_collectionView, "registerClass:forCellWithReuseIdentifier:", a3, a4);
}

- (void)registerNib:(id)a3 forCellWithReuseIdentifier:(id)a4
{
  -[_TVCarouselCollectionView registerNib:forCellWithReuseIdentifier:](self->_collectionView, "registerNib:forCellWithReuseIdentifier:", a3, a4);
}

- (void)reloadData
{
  NSIndexPath *focusedIndexPath;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id WeakRetained;

  objc_storeStrong((id *)&self->_previousCollectionToDatasourceIndexMap, self->_collectionToDatasourceIndexMap);
  -[_TVCarouselView setCollectionToDatasourceIndexMap:](self, "setCollectionToDatasourceIndexMap:", 0);
  focusedIndexPath = self->_focusedIndexPath;
  self->_focusedIndexPath = 0;

  -[_TVCarouselCollectionView reloadData](self->_collectionView, "reloadData");
  -[_TVCarouselView _updateAutoScrollTimer](self, "_updateAutoScrollTimer");
  -[_TVCarouselView _updatePageControl](self, "_updatePageControl");
  if ((*((_BYTE *)&self->_carouselViewFlags + 2) & 1) != 0)
  {
    -[_TVCarouselView collectionToDatasourceIndexMap](self, "collectionToDatasourceIndexMap");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[_TVCarouselView _centerCollectionViewCellIndex](self, "_centerCollectionViewCellIndex"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "integerValue");

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "carouselView:didCenterItemAtIndex:", self, v7);

  }
}

- (void)setInteritemSpacing:(double)a3
{
  -[_TVCarouselView setInteritemSpacing:animated:](self, "setInteritemSpacing:animated:", 0, a3);
}

- (void)setInteritemSpacing:(double)a3 animated:(BOOL)a4
{
  if (vabdd_f64(self->_interitemSpacing, a3) > 0.00000011920929)
  {
    self->_interitemSpacing = a3;
    -[_TVCarouselView _updateCollectionViewLayoutAnimated:](self, "_updateCollectionViewLayoutAnimated:", a4);
  }
}

- (void)setItemSize:(CGSize)a3
{
  if (self->_itemSize.width != a3.width || self->_itemSize.height != a3.height)
  {
    self->_itemSize = a3;
    -[_TVCarouselView _updateCollectionViewLayout](self, "_updateCollectionViewLayout");
  }
}

- (void)setAutoscrollInterval:(double)a3
{
  if (vabdd_f64(self->_autoscrollInterval, a3) > 2.22044605e-16)
  {
    if (a3 < 0.5 && a3 > 2.22044605e-16)
      a3 = 0.5;
    self->_autoscrollInterval = a3;
    -[_TVCarouselView _updateAutoScrollTimer](self, "_updateAutoScrollTimer");
  }
}

- (void)setUnitScrollDuration:(double)a3
{
  if (vabdd_f64(self->_unitScrollDuration, a3) > 2.22044605e-16)
  {
    if (a3 < 0.5 && a3 > 2.22044605e-16)
      a3 = 0.5;
    self->_unitScrollDuration = a3;
    -[_TVCarouselView _updateAutoScrollTimer](self, "_updateAutoScrollTimer");
  }
}

- (void)setDelegate:(id)a3
{
  id v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  id obj;

  obj = a3;
  -[_TVCarouselView delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != obj || !obj && (*(_BYTE *)&self->_carouselViewFlags & 1) != 0)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    self->_carouselViewFlags = ($369F20C4059AE0935D9B998A99959B13)(*(_DWORD *)&self->_carouselViewFlags & 0xFFFFFFFE | (obj != 0));
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = 2;
    else
      v5 = 0;
    self->_carouselViewFlags = ($369F20C4059AE0935D9B998A99959B13)(*(_DWORD *)&self->_carouselViewFlags & 0xFFFFFFFD | v5);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = 4;
    else
      v6 = 0;
    self->_carouselViewFlags = ($369F20C4059AE0935D9B998A99959B13)(*(_DWORD *)&self->_carouselViewFlags & 0xFFFFFFFB | v6);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = 8;
    else
      v7 = 0;
    self->_carouselViewFlags = ($369F20C4059AE0935D9B998A99959B13)(*(_DWORD *)&self->_carouselViewFlags & 0xFFFFFFF7 | v7);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = 16;
    else
      v8 = 0;
    self->_carouselViewFlags = ($369F20C4059AE0935D9B998A99959B13)(*(_DWORD *)&self->_carouselViewFlags & 0xFFFFFFEF | v8);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = 32;
    else
      v9 = 0;
    self->_carouselViewFlags = ($369F20C4059AE0935D9B998A99959B13)(*(_DWORD *)&self->_carouselViewFlags & 0xFFFFFFDF | v9);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v10 = 64;
    else
      v10 = 0;
    self->_carouselViewFlags = ($369F20C4059AE0935D9B998A99959B13)(*(_DWORD *)&self->_carouselViewFlags & 0xFFFFFFBF | v10);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v11 = 128;
    else
      v11 = 0;
    self->_carouselViewFlags = ($369F20C4059AE0935D9B998A99959B13)(*(_DWORD *)&self->_carouselViewFlags & 0xFFFFFF7F | v11);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v12 = 256;
    else
      v12 = 0;
    self->_carouselViewFlags = ($369F20C4059AE0935D9B998A99959B13)(*(_DWORD *)&self->_carouselViewFlags & 0xFFFFFEFF | v12);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v13 = 512;
    else
      v13 = 0;
    self->_carouselViewFlags = ($369F20C4059AE0935D9B998A99959B13)(*(_DWORD *)&self->_carouselViewFlags & 0xFFFFFDFF | v13);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v14 = 1024;
    else
      v14 = 0;
    self->_carouselViewFlags = ($369F20C4059AE0935D9B998A99959B13)(*(_DWORD *)&self->_carouselViewFlags & 0xFFFFFBFF | v14);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v15 = 2048;
    else
      v15 = 0;
    self->_carouselViewFlags = ($369F20C4059AE0935D9B998A99959B13)(*(_DWORD *)&self->_carouselViewFlags & 0xFFFFF7FF | v15);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v16 = 4096;
    else
      v16 = 0;
    self->_carouselViewFlags = ($369F20C4059AE0935D9B998A99959B13)(*(_DWORD *)&self->_carouselViewFlags & 0xFFFFEFFF | v16);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v17 = 0x2000;
    else
      v17 = 0;
    self->_carouselViewFlags = ($369F20C4059AE0935D9B998A99959B13)(*(_DWORD *)&self->_carouselViewFlags & 0xFFFFDFFF | v17);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v18 = 0x4000;
    else
      v18 = 0;
    self->_carouselViewFlags = ($369F20C4059AE0935D9B998A99959B13)(*(_DWORD *)&self->_carouselViewFlags & 0xFFFFBFFF | v18);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v19 = 0x8000;
    else
      v19 = 0;
    self->_carouselViewFlags = ($369F20C4059AE0935D9B998A99959B13)(*(_DWORD *)&self->_carouselViewFlags & 0xFFFF7FFF | v19);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v20 = 0x10000;
    else
      v20 = 0;
    self->_carouselViewFlags = ($369F20C4059AE0935D9B998A99959B13)(*(_DWORD *)&self->_carouselViewFlags & 0xFFFEFFFF | v20);
  }

}

- (NSArray)visibleCells
{
  return (NSArray *)-[_TVCarouselCollectionView visibleCells](self->_collectionView, "visibleCells");
}

- (void)centerItemAtPageIndex:(int64_t)a3
{
  -[_TVCarouselView _centerItemAtPageIndex:animated:](self, "_centerItemAtPageIndex:animated:", a3, 1);
}

- (void)_centerItemAtPageIndex:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v4 = a4;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[_TVCarouselView collectionToDatasourceIndexMap](self, "collectionToDatasourceIndexMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allKeysForObject:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "integerValue");

    -[_TVCarouselView _updateContentOffsetForFocusedIndex:animated:](self, "_updateContentOffsetForFocusedIndex:animated:", v9, v4);
  }

}

- (int64_t)_centerCollectionViewCellIndex
{
  uint64_t v2;
  uint64_t v3;

  v2 = -[_TVCarouselCollectionView numberOfItemsInSection:](self->_collectionView, "numberOfItemsInSection:", 0);
  if (v2 >= 0)
    v3 = v2;
  else
    v3 = v2 + 1;
  return v3 >> 1;
}

- (int64_t)_numberOfCells
{
  void *v3;
  int64_t v4;

  if (self->_numberOfRealItemsForDataSource < 2)
    return self->_numberOfRealItemsForDataSource;
  -[_TVCarouselCollectionView collectionViewLayout](self->_collectionView, "collectionViewLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_expectedNumberOfCells");

  return v4;
}

- (void)calculateChangeSetForFocusedIndex:(int64_t)a3 newDataSourceMap:(id)a4 indexesToRemove:(id *)a5 indexesToAdd:(id *)a6 indexesToReload:(id *)a7
{
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  int64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  unint64_t i;
  id v37;
  void *v38;
  id v39;
  void *v40;
  id *v41;
  id v42;

  v42 = a4;
  -[_TVCarouselView collectionToDatasourceIndexMap](self, "collectionToDatasourceIndexMap");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copy");

  v14 = objc_msgSend(v13, "count");
  if (v14 == objc_msgSend(v42, "count"))
  {
    v41 = a5;
    -[_TVCarouselView collectionToDatasourceIndexMap](self, "collectionToDatasourceIndexMap");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");

    v17 = -[_TVCarouselView _centerCollectionViewCellIndex](self, "_centerCollectionViewCellIndex");
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = a3 - v17;
    if (a3 != v17)
    {
      v21 = 0;
      if (v20 < 0)
        v20 = v17 - a3;
      if ((unint64_t)v20 <= 1)
        v22 = 1;
      else
        v22 = v20;
      v23 = v16 - 1;
      do
      {
        objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", v21, 0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addObject:", v24);

        objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", v23, 0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObject:", v25);

        ++v21;
        --v23;
      }
      while (v22 != v21);
    }
    if (a3 <= v17)
      v26 = v18;
    else
      v26 = v19;
    if (a3 <= v17)
      v27 = v19;
    else
      v27 = v18;
    *a6 = objc_retainAutorelease(v26);
    *v41 = objc_retainAutorelease(v27);

  }
  else
  {
    v28 = objc_msgSend(v13, "count");
    v29 = objc_msgSend(v42, "count");
    v30 = objc_msgSend(v13, "count");
    if (v28 >= v29)
    {
      if (v30 > objc_msgSend(v42, "count"))
      {
        for (i = 0; i < objc_msgSend(v42, "count"); ++i)
        {
          v37 = *a7;
          objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", i, 0);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "addObject:", v38);

        }
        for (; i < objc_msgSend(v13, "count"); ++i)
        {
          v39 = *a5;
          objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", i, 0);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "addObject:", v40);

        }
      }
    }
    else
    {
      v31 = 0;
      if (v30)
      {
        do
        {
          v32 = *a7;
          objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", v31, 0);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "addObject:", v33);

          ++v31;
        }
        while (v31 < objc_msgSend(v13, "count"));
      }
      for (; v31 < objc_msgSend(v42, "count"); ++v31)
      {
        v34 = *a6;
        objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", v31, 0);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "addObject:", v35);

      }
    }
  }

}

- (void)_focusItemAtIndex:(int64_t)a3
{
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id WeakRetained;
  id v19;
  id v20;
  id v21;

  if (-[_TVCarouselView _canScrollCarouselView](self, "_canScrollCarouselView") && !self->_flags.layoutUpdateInProgress)
  {
    v5 = -[_TVCarouselView _centerCollectionViewCellIndex](self, "_centerCollectionViewCellIndex");
    -[_TVCarouselView collectionToDatasourceIndexMap](self, "collectionToDatasourceIndexMap");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "integerValue");

    -[_TVCarouselView pageControl](self, "pageControl");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setCurrentPage:", v9);

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_TVCarouselView _prepareIndexMap:](self, "_prepareIndexMap:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v12;
    v21 = v13;
    v19 = v11;
    -[_TVCarouselView calculateChangeSetForFocusedIndex:newDataSourceMap:indexesToRemove:indexesToAdd:indexesToReload:](self, "calculateChangeSetForFocusedIndex:newDataSourceMap:indexesToRemove:indexesToAdd:indexesToReload:", a3, v14, &v21, &v20, &v19);
    v15 = v21;

    v16 = v20;
    v17 = v19;

    -[_TVCarouselView _updateCarouselWithDataSource:indicesToRemove:indicesToAdd:indicesToReload:](self, "_updateCarouselWithDataSource:indicesToRemove:indicesToAdd:indicesToReload:", v14, v15, v16, v17);
    -[_TVCarouselView _setContentOffsetForCollectionViewIndex:](self, "_setContentOffsetForCollectionViewIndex:", v5);
    -[_TVCarouselView _updateAutoScrollTimer](self, "_updateAutoScrollTimer");
    if ((*((_BYTE *)&self->_carouselViewFlags + 2) & 1) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "carouselView:didCenterItemAtIndex:", self, v9);

    }
  }
}

- (void)_setContentOffsetForCollectionViewIndex:(int64_t)a3
{
  -[_TVCarouselView _setContentOffsetForCollectionViewIndex:animated:](self, "_setContentOffsetForCollectionViewIndex:animated:", a3, 0);
}

- (void)_setContentOffsetForCollectionViewIndex:(int64_t)a3 animated:(BOOL)a4
{
  _QWORD v4[6];
  BOOL v5;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __68___TVCarouselView__setContentOffsetForCollectionViewIndex_animated___block_invoke;
  v4[3] = &unk_24FD409D0;
  v4[4] = self;
  v4[5] = a3;
  v5 = a4;
  objc_msgSend(MEMORY[0x24BDF6F90], "performWithoutAnimation:", v4);
}

- (void)_updateCarouselWithDataSource:(id)a3 indicesToRemove:(id)a4 indicesToAdd:(id)a5 indicesToReload:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)MEMORY[0x24BDF6F90];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __94___TVCarouselView__updateCarouselWithDataSource_indicesToRemove_indicesToAdd_indicesToReload___block_invoke;
  v19[3] = &unk_24FD409F8;
  v19[4] = self;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v23 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  objc_msgSend(v14, "performWithoutAnimation:", v19);

}

- (id)_prepareIndexMap:(int64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t numberOfRealItemsForDataSource;
  void *v9;
  uint64_t v10;
  id WeakRetained;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  int64_t v16;
  int64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v5 = -[_TVCarouselView _numberOfCells](self, "_numberOfCells");
  v6 = v5;
  if (v5 >= 0)
    v7 = v5;
  else
    v7 = v5 + 1;
  numberOfRealItemsForDataSource = self->_numberOfRealItemsForDataSource;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && numberOfRealItemsForDataSource)
  {
    v10 = v7 >> 1;
    if (a3 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if ((*((_BYTE *)&self->_carouselViewFlags + 1) & 0x80) != 0)
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        a3 = objc_msgSend(WeakRetained, "indexForPreferredCenteredViewInCarouselView:", self);

      }
      else
      {
        a3 = 0;
      }
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v12, v13);

    if (v6 >= 2)
    {
      v14 = v10 - 1;
      v15 = v10 + 1;
      v16 = a3;
      do
      {
        if (v16 + 1 == numberOfRealItemsForDataSource)
          v16 = 0;
        else
          ++v16;
        if (a3 >= 1)
          v17 = a3;
        else
          v17 = numberOfRealItemsForDataSource;
        a3 = v17 - 1;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v15);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKey:", v18, v19);

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v14);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKey:", v20, v21);

        --v14;
        ++v15;
      }
      while (v14 != -1);
    }
  }
  v22 = (void *)objc_msgSend(v9, "copy");

  return v22;
}

- (double)_contentOffsetXForCollectionViewIndex:(int64_t)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double Width;
  CGRect v13;
  CGRect v14;
  CGRect v15;

  -[_TVCarouselCollectionView collectionViewLayout](self->_collectionView, "collectionViewLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemSize");
  v7 = v6;
  objc_msgSend(v5, "minimumInteritemSpacing");
  v9 = v8;
  -[_TVCarouselView bounds](self, "bounds");
  if (CGRectGetWidth(v13) > 0.0)
  {
    -[_TVCarouselView bounds](self, "bounds");
    Width = CGRectGetWidth(v15);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bounds");
    Width = CGRectGetWidth(v14);

  }
  return v7 * 0.5 + (double)a3 * (v7 + v9) - Width * 0.5;
}

- (void)_updateCollectionViewLayout
{
  -[_TVCarouselView _updateCollectionViewLayoutAnimated:](self, "_updateCollectionViewLayoutAnimated:", 0);
}

- (void)_updateCollectionViewLayoutAnimated:(BOOL)a3
{
  _BOOL8 v3;
  NSIndexPath *focusedIndexPath;
  _TVCarouselCollectionViewLayout *v6;

  v3 = a3;
  self->_flags.layoutUpdateInProgress = 1;
  v6 = objc_alloc_init(_TVCarouselCollectionViewLayout);
  -[_TVCarouselView _collectionViewLayoutItemSize](self, "_collectionViewLayoutItemSize");
  -[_TVCarouselCollectionViewLayout setItemSize:](v6, "setItemSize:");
  -[_TVCarouselCollectionViewLayout setMinimumInteritemSpacing:](v6, "setMinimumInteritemSpacing:", self->_interitemSpacing);
  -[_TVCarouselCollectionView setCollectionViewLayout:animated:](self->_collectionView, "setCollectionViewLayout:animated:", v6, v3);
  focusedIndexPath = self->_focusedIndexPath;
  if (focusedIndexPath)
    -[_TVCarouselView _updateContentOffsetForFocusedIndex:animated:](self, "_updateContentOffsetForFocusedIndex:animated:", -[NSIndexPath item](focusedIndexPath, "item"), 0);
  self->_flags.layoutUpdateInProgress = 0;

}

- (void)_updateContentOffsetForFocusedIndex:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  NSIndexPath *v8;
  NSIndexPath *focusedIndexPath;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int64_t v13;
  _QWORD v14[6];
  _QWORD v15[7];

  v4 = a4;
  -[_TVCarouselView window](self, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", a3, 0);
    v8 = (NSIndexPath *)objc_claimAutoreleasedReturnValue();
    focusedIndexPath = self->_focusedIndexPath;
    self->_focusedIndexPath = v8;

    v10 = -[_TVCarouselCollectionView numberOfItemsInSection:](self->_collectionView, "numberOfItemsInSection:", 0);
    if (self->_scrollMode != 1)
    {
      if (v10 >= 0)
        v11 = v10;
      else
        v11 = v10 + 1;
      v15[0] = MEMORY[0x24BDAC760];
      v12 = v11 >> 1;
      v15[1] = 3221225472;
      v15[2] = __64___TVCarouselView__updateContentOffsetForFocusedIndex_animated___block_invoke;
      v15[3] = &unk_24FD40A20;
      if (a3 == 0x7FFFFFFFFFFFFFFFLL)
        v13 = v12;
      else
        v13 = a3;
      v15[4] = self;
      v15[5] = v13;
      v15[6] = v12;
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __64___TVCarouselView__updateContentOffsetForFocusedIndex_animated___block_invoke_2;
      v14[3] = &unk_24FD40A48;
      v14[4] = self;
      v14[5] = v12;
      -[_TVCarouselView _animatePagedCenteringAnimated:animations:completion:](self, "_animatePagedCenteringAnimated:animations:completion:", v4, v15, v14);
    }
  }
}

- (void)_animatePagedCenteringAnimated:(BOOL)a3 animations:(id)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  double v10;
  id v11;

  v6 = a3;
  v11 = a4;
  v8 = a5;
  v9 = (void *)MEMORY[0x24BDF6F90];
  v10 = 0.0;
  if (v6)
    -[_TVCarouselView _centeringAnimationDuration](self, "_centeringAnimationDuration", 0.0);
  objc_msgSend(v9, "animateWithDuration:delay:options:animations:completion:", 327686, v11, v8, v10, 0.0);

}

- (BOOL)_canScrollCarouselView
{
  void *v3;
  BOOL v4;

  -[_TVCarouselView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = -[_TVCarouselCollectionView numberOfItemsInSection:](self->_collectionView, "numberOfItemsInSection:", 0) > 1;
  else
    v4 = 0;

  return v4;
}

- (void)_updateAutoScrollTimer
{
  void *v3;
  void *v4;
  void *v5;
  BOOL IsReduceMotionEnabled;
  unint64_t scrollMode;

  if (!-[_TVCarouselView _canScrollCarouselView](self, "_canScrollCarouselView"))
    goto LABEL_8;
  if (!self->_focusedIndexPath)
    -[_TVCarouselView _updateContentOffsetForFocusedIndex:animated:](self, "_updateContentOffsetForFocusedIndex:animated:", 0x7FFFFFFFFFFFFFFFLL, 0);
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "focusedView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isDescendantOfView:", self) & 1) != 0)
    goto LABEL_7;
  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "applicationState"))
  {

LABEL_7:
LABEL_8:
    -[_TVCarouselView _stopAutoScrollTimer](self, "_stopAutoScrollTimer");
    -[_TVCarouselView _stopContinuousScroll](self, "_stopContinuousScroll");
    return;
  }
  IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();

  if (IsReduceMotionEnabled)
    goto LABEL_8;
  scrollMode = self->_scrollMode;
  if (scrollMode == 1)
  {
    -[_TVCarouselView _startContinuousScroll](self, "_startContinuousScroll");
  }
  else if (!scrollMode && fabs(self->_autoscrollInterval) > 2.22044605e-16)
  {
    -[_TVCarouselView _startAutoScrollTimer](self, "_startAutoScrollTimer");
  }
}

- (void)_startAutoScrollTimer
{
  OS_dispatch_source *v3;
  OS_dispatch_source *autoScrollTimer;
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id location;

  -[_TVCarouselView _stopAutoScrollTimer](self, "_stopAutoScrollTimer");
  if (self->_autoscrollInterval > 0.0)
  {
    objc_initWeak(&location, self);
    v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, MEMORY[0x24BDAC9B8]);
    autoScrollTimer = self->_autoScrollTimer;
    self->_autoScrollTimer = v3;

    v5 = self->_autoScrollTimer;
    v6 = dispatch_time(0, (uint64_t)(self->_autoscrollInterval * 1000000000.0));
    dispatch_source_set_timer(v5, v6, (unint64_t)(self->_autoscrollInterval * 1000000000.0), 0x1DCD6500uLL);
    v7 = self->_autoScrollTimer;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __40___TVCarouselView__startAutoScrollTimer__block_invoke;
    v8[3] = &unk_24FD40A70;
    objc_copyWeak(&v9, &location);
    dispatch_source_set_event_handler(v7, v8);
    dispatch_resume((dispatch_object_t)self->_autoScrollTimer);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

- (void)_stopAutoScrollTimer
{
  OS_dispatch_source *autoScrollTimer;
  OS_dispatch_source *v4;
  NSObject *v5;
  OS_dispatch_source *v6;
  _QWORD handler[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  OS_dispatch_source *v13;

  autoScrollTimer = self->_autoScrollTimer;
  if (autoScrollTimer)
  {
    v8 = 0;
    v9 = &v8;
    v10 = 0x3032000000;
    v11 = __Block_byref_object_copy_;
    v12 = __Block_byref_object_dispose_;
    v4 = autoScrollTimer;
    v5 = self->_autoScrollTimer;
    v13 = v4;
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __39___TVCarouselView__stopAutoScrollTimer__block_invoke;
    handler[3] = &unk_24FD40A98;
    handler[4] = &v8;
    dispatch_source_set_cancel_handler(v5, handler);
    dispatch_source_cancel((dispatch_source_t)v9[5]);
    v6 = self->_autoScrollTimer;
    self->_autoScrollTimer = 0;

    _Block_object_dispose(&v8, 8);
  }
}

- (void)_updateIdleModeLayoutAttributes
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  CGAffineTransform v16;
  CGAffineTransform v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (-[_TVCarouselView shouldScaleOnIdleFocus](self, "shouldScaleOnIdleFocus"))
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[_TVCarouselCollectionView visibleCells](self->_collectionView, "visibleCells");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v19;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v19 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v7++), "_setIdleModeLayoutAttributes:", 0);
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v5);
    }

    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "focusedView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "isDescendantOfView:", self))
    {
      -[_TVCarouselCollectionView visibleCells](self->_collectionView, "visibleCells");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "containsObject:", v9);

      if (v11)
      {
        objc_msgSend(v9, "bounds");
        if (v12 >= v13)
          v14 = v12;
        else
          v14 = v13;
        memset(&v17, 0, sizeof(v17));
        CGAffineTransformMakeScale(&v17, (v14 + 20.0) / v14, (v14 + 20.0) / v14);
        v15 = (void *)objc_opt_new();
        v16 = v17;
        objc_msgSend(v15, "setTransform:", &v16);
        objc_msgSend(v9, "_setIdleModeLayoutAttributes:", v15);

      }
    }

  }
}

- (unint64_t)_previousItemIndexForIndexPath:(id)a3
{
  id v4;
  void *v5;
  NSDictionary *previousCollectionToDatasourceIndexMap;
  void *v7;
  void *v8;
  NSDictionary *v9;
  void *v10;
  void *v11;
  unint64_t v12;

  v4 = a3;
  v5 = v4;
  previousCollectionToDatasourceIndexMap = self->_previousCollectionToDatasourceIndexMap;
  if (previousCollectionToDatasourceIndexMap
    && (objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v4, "item")),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        -[NSDictionary objectForKeyedSubscript:](previousCollectionToDatasourceIndexMap, "objectForKeyedSubscript:", v7),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        v8))
  {
    v9 = self->_previousCollectionToDatasourceIndexMap;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v5, "item"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "unsignedIntegerValue");

  }
  else
  {
    v12 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v12;
}

- (unint64_t)_itemIndexForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v4 = a3;
  -[_TVCarouselView collectionToDatasourceIndexMap](self, "collectionToDatasourceIndexMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = objc_msgSend(v4, "item");

  objc_msgSend(v6, "numberWithInteger:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unsignedIntegerValue");

  return v10;
}

- (CGSize)_collectionViewLayoutItemSize
{
  double width;
  double height;
  CGSize result;

  width = self->_itemSize.width;
  height = self->_itemSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)_centeringAnimationDuration
{
  return 0.8;
}

- (void)_updatePageControl
{
  void *v3;
  void *v4;
  uint64_t v5;
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
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;

  -[_TVCarouselView pageControl](self, "pageControl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[_TVCarouselView dataSource](self, "dataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "numberOfItemsInCarouselView:", self);

    -[_TVCarouselView pageControl](self, "pageControl");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNumberOfPages:", v5);

    -[_TVCarouselView pageControl](self, "pageControl");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sizeForNumberOfPages:", v5);
    v9 = v8;
    v11 = v10;

    -[_TVCarouselView frame](self, "frame");
    v13 = (v12 - v9) * 0.5;
    -[_TVCarouselView pageControlMargin](self, "pageControlMargin");
    v15 = v14;
    -[_TVCarouselView frame](self, "frame");
    v17 = v16 - v11 - v15;
    -[_TVCarouselView pageControl](self, "pageControl");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setFrame:", v13, v17, v9, v11);

    -[_TVCarouselView collectionToDatasourceIndexMap](self, "collectionToDatasourceIndexMap");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[NSIndexPath item](self->_focusedIndexPath, "item"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKeyedSubscript:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "integerValue");

    -[_TVCarouselView pageControl](self, "pageControl");
    v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setCurrentPage:", v22);

  }
}

- (TVCarouselViewDataSource)dataSource
{
  return (TVCarouselViewDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (TVCarouselViewDelegate)delegate
{
  return (TVCarouselViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (CGSize)itemSize
{
  double width;
  double height;
  CGSize result;

  width = self->_itemSize.width;
  height = self->_itemSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)interitemSpacing
{
  return self->_interitemSpacing;
}

- (unint64_t)scrollMode
{
  return self->_scrollMode;
}

- (double)autoscrollInterval
{
  return self->_autoscrollInterval;
}

- (double)unitScrollDuration
{
  return self->_unitScrollDuration;
}

- (CGPoint)focusDirection
{
  double x;
  double y;
  CGPoint result;

  x = self->_focusDirection.x;
  y = self->_focusDirection.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setFocusDirection:(CGPoint)a3
{
  self->_focusDirection = a3;
}

- (UIView)headerView
{
  return self->_headerView;
}

- (double)showcaseFactor
{
  return self->_showcaseFactor;
}

- (void)setShowcaseFactor:(double)a3
{
  self->_showcaseFactor = a3;
}

- (BOOL)shouldScaleOnIdleFocus
{
  return self->_shouldScaleOnIdleFocus;
}

- (void)setShouldScaleOnIdleFocus:(BOOL)a3
{
  self->_shouldScaleOnIdleFocus = a3;
}

- (BOOL)showsPageControl
{
  return self->_showsPageControl;
}

- (double)pageControlMargin
{
  return self->_pageControlMargin;
}

- (void)setPageControlMargin:(double)a3
{
  self->_pageControlMargin = a3;
}

- (NSDictionary)collectionToDatasourceIndexMap
{
  return self->_collectionToDatasourceIndexMap;
}

- (void)setCollectionToDatasourceIndexMap:(id)a3
{
  objc_storeStrong((id *)&self->_collectionToDatasourceIndexMap, a3);
}

- (UIFocusGuide)focusGuide
{
  return self->_focusGuide;
}

- (void)setFocusGuide:(id)a3
{
  objc_storeStrong((id *)&self->_focusGuide, a3);
}

- (CADisplayLink)displayLink
{
  return self->_displayLink;
}

- (void)setDisplayLink:(id)a3
{
  objc_storeStrong((id *)&self->_displayLink, a3);
}

- (double)previousDisplayLinkTimestamp
{
  return self->_previousDisplayLinkTimestamp;
}

- (void)setPreviousDisplayLinkTimestamp:(double)a3
{
  self->_previousDisplayLinkTimestamp = a3;
}

- (CGPoint)targetContentOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_targetContentOffset.x;
  y = self->_targetContentOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setTargetContentOffset:(CGPoint)a3
{
  self->_targetContentOffset = a3;
}

- (double)offsetChangePerSecond
{
  return self->_offsetChangePerSecond;
}

- (void)setOffsetChangePerSecond:(double)a3
{
  self->_offsetChangePerSecond = a3;
}

- (NSDate)firstFocusChangeInInterval
{
  return self->_firstFocusChangeInInterval;
}

- (void)setFirstFocusChangeInInterval:(id)a3
{
  objc_storeStrong((id *)&self->_firstFocusChangeInInterval, a3);
}

- (UIPageControl)pageControl
{
  return self->_pageControl;
}

- (void)setPageControl:(id)a3
{
  objc_storeStrong((id *)&self->_pageControl, a3);
}

- (double)focusThrottleTimeInterval
{
  return self->_focusThrottleTimeInterval;
}

- (void)setFocusThrottleTimeInterval:(double)a3
{
  self->_focusThrottleTimeInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pageControl, 0);
  objc_storeStrong((id *)&self->_firstFocusChangeInInterval, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_focusGuide, 0);
  objc_storeStrong((id *)&self->_collectionToDatasourceIndexMap, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_previousCollectionToDatasourceIndexMap, 0);
  objc_storeStrong((id *)&self->_focusedIndexPath, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_autoScrollTimer, 0);
}

@end
