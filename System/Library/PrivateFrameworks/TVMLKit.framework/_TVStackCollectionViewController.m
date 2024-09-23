@implementation _TVStackCollectionViewController

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  id v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    v5 = objc_storeWeak((id *)&self->_delegate, obj);
    self->_delegateFlags.respondsToStackCollectionViewControllerScrollViewDidScroll = objc_opt_respondsToSelector() & 1;

  }
}

- (void)updateWithViewElement:(id)a3
{
  id v5;
  NSUInteger v6;
  void *v7;
  _BOOL4 v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSIndexPath *v13;
  void *lastFocusedIndexPath;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  NSIndexPath *v19;
  unint64_t v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  _TVNeedsMoreContentEvaluator *needsMoreContentEvaluator;
  void *v27;
  void *v28;
  unint64_t v29;
  double v30;
  double v31;
  id v32;

  v5 = a3;
  objc_storeStrong((id *)&self->_viewElement, a3);
  v6 = -[NSArray count](self->_stackRows, "count");
  -[_TVStackCollectionViewController viewElement](self, "viewElement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  v8 = -[_TVStackCollectionViewController _updateWithCollectionListElement:autoHighlightIndexPath:](self, "_updateWithCollectionListElement:autoHighlightIndexPath:", v7, &v32);
  v9 = v32;
  v10 = v32;

  -[_TVStackCollectionViewController _configureBackgroundTintView](self, "_configureBackgroundTintView");
  if (!-[_TVStackCollectionViewController isViewLoaded](self, "isViewLoaded"))
  {
    v13 = (NSIndexPath *)v10;
    lastFocusedIndexPath = self->_lastFocusedIndexPath;
    self->_lastFocusedIndexPath = v13;
LABEL_18:

    goto LABEL_19;
  }
  if (v10)
    objc_storeStrong((id *)&self->_lastFocusedIndexPath, v9);
  -[_TVStackCollectionViewController collectionView](self, "collectionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v8)
  {
    objc_msgSend(v11, "reloadData");
  }
  else
  {
    objc_msgSend(v11, "collectionViewLayout");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "invalidateLayout");

  }
  if (v10)
  {
    -[_TVStackCollectionViewController collectionView](self, "collectionView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "tv_isFocusOnNonOwnedCell");

    if ((v17 & 1) == 0)
      -[_TVStackCollectionViewController setNeedsFocusUpdate](self, "setNeedsFocusUpdate");
    -[_TVStackCollectionViewController collectionView](self, "collectionView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "scrollToItemAtIndexPath:atScrollPosition:animated:", v10, 2, 1);

  }
  v19 = self->_lastFocusedIndexPath;
  if (v19)
  {
    v20 = -[NSIndexPath section](v19, "section");
    if (v20 < -[NSArray count](self->_stackSections, "count"))
    {
      -[_TVStackCollectionViewController collectionView](self, "collectionView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "contentOffset");
      v30 = v22;
      v31 = v23;

      -[NSArray objectAtIndex:](self->_stackSections, "objectAtIndex:", v20);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[_TVStackCollectionViewController _adjustedContentOffsetForRowIndex:targetContentOffset:](self, "_adjustedContentOffsetForRowIndex:targetContentOffset:", objc_msgSend(v24, "firstItemRowIndex"), &v30);
      -[_TVStackCollectionViewController collectionView](self, "collectionView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setContentOffset:", v30, v31);

    }
  }
  needsMoreContentEvaluator = self->_needsMoreContentEvaluator;
  -[_TVStackCollectionViewController _needsMoreTargetElement](self, "_needsMoreTargetElement");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVNeedsMoreContentEvaluator setViewElement:](needsMoreContentEvaluator, "setViewElement:", v27);

  if (-[NSArray count](self->_stackRows, "count") != v6
    || (-[_TVStackCollectionViewController viewElement](self, "viewElement"),
        v28 = (void *)objc_claimAutoreleasedReturnValue(),
        v29 = objc_msgSend(v28, "updateType"),
        v28,
        v29 >= 3))
  {
    -[_TVNeedsMoreContentEvaluator reset](self->_needsMoreContentEvaluator, "reset");
    -[_TVStackCollectionViewController view](self, "view");
    lastFocusedIndexPath = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(lastFocusedIndexPath, "setNeedsLayout");
    goto LABEL_18;
  }
LABEL_19:

}

- (void)loadView
{
  _TVCollectionViewFlowLayout *v3;
  _TVStackCollectionView *v4;
  _TVStackCollectionView *v5;
  _TVStackCollectionView *v6;
  _TVNeedsMoreContentEvaluator *v7;
  void *v8;
  _TVNeedsMoreContentEvaluator *v9;
  _TVNeedsMoreContentEvaluator *needsMoreContentEvaluator;
  _TVNeedsMoreContentEvaluator *v11;
  void *v12;
  NSIndexPath *lastFocusedIndexPath;
  unint64_t v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;

  v3 = objc_alloc_init(_TVCollectionViewFlowLayout);
  -[UICollectionViewFlowLayout setScrollDirection:](v3, "setScrollDirection:", 0);
  -[UICollectionViewFlowLayout setMinimumInteritemSpacing:](v3, "setMinimumInteritemSpacing:", 0.0);
  -[UICollectionViewFlowLayout setMinimumLineSpacing:](v3, "setMinimumLineSpacing:", 0.0);
  v4 = [_TVStackCollectionView alloc];
  v5 = -[_TVStackCollectionView initWithFrame:collectionViewLayout:](v4, "initWithFrame:collectionViewLayout:", v3, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v6 = v5;
  if (self->_configureForListTemplate)
    -[_TVStackCollectionView setClipsToBounds:](v5, "setClipsToBounds:", 0);
  -[_TVStackCollectionView registerClass:forCellWithReuseIdentifier:](v6, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("TVStackViewCollectionCellIdentifier"));
  -[_TVStackCollectionView setDelegate:](v6, "setDelegate:", self);
  -[_TVStackCollectionView setDataSource:](v6, "setDataSource:", self);
  -[_TVStackCollectionView setBackgroundColor:](v6, "setBackgroundColor:", 0);
  -[_TVStackCollectionView setOpaque:](v6, "setOpaque:", 0);
  -[_TVStackCollectionView setAutoresizingMask:](v6, "setAutoresizingMask:", 18);
  -[_TVStackCollectionView setShowsVerticalScrollIndicator:](v6, "setShowsVerticalScrollIndicator:", 0);
  -[_TVStackCollectionView setShowsHorizontalScrollIndicator:](v6, "setShowsHorizontalScrollIndicator:", 0);
  -[_TVStackCollectionView setAlwaysBounceVertical:](v6, "setAlwaysBounceVertical:", 1);
  -[_TVStackCollectionViewController setCollectionView:](self, "setCollectionView:", v6);
  v7 = [_TVNeedsMoreContentEvaluator alloc];
  -[_TVStackCollectionViewController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[_TVNeedsMoreContentEvaluator initWithScrollView:axis:](v7, "initWithScrollView:axis:", v8, 2);
  needsMoreContentEvaluator = self->_needsMoreContentEvaluator;
  self->_needsMoreContentEvaluator = v9;

  v11 = self->_needsMoreContentEvaluator;
  -[_TVStackCollectionViewController _needsMoreTargetElement](self, "_needsMoreTargetElement");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVNeedsMoreContentEvaluator setViewElement:](v11, "setViewElement:", v12);

  lastFocusedIndexPath = self->_lastFocusedIndexPath;
  if (lastFocusedIndexPath)
  {
    v14 = -[NSIndexPath section](lastFocusedIndexPath, "section");
    if (v14 < -[NSArray count](self->_stackSections, "count"))
    {
      -[_TVStackCollectionViewController collectionView](self, "collectionView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "contentOffset");
      v20 = v16;
      v21 = v17;

      -[NSArray objectAtIndex:](self->_stackSections, "objectAtIndex:", v14);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[_TVStackCollectionViewController _adjustedContentOffsetForRowIndex:targetContentOffset:](self, "_adjustedContentOffsetForRowIndex:targetContentOffset:", objc_msgSend(v18, "firstItemRowIndex"), &v20);
      -[_TVStackCollectionViewController collectionView](self, "collectionView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setContentOffset:", v20, v21);

    }
  }

}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  void *v5;
  NSIndexPath *v6;
  NSIndexPath *lastFocusedIndexPath;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_TVStackCollectionViewController;
  -[_TVStackCollectionViewController didUpdateFocusInContext:withAnimationCoordinator:](&v8, sel_didUpdateFocusInContext_withAnimationCoordinator_, a3, a4);
  -[_TVStackCollectionViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathForLastFocusedItem");
  v6 = (NSIndexPath *)objc_claimAutoreleasedReturnValue();
  lastFocusedIndexPath = self->_lastFocusedIndexPath;
  self->_lastFocusedIndexPath = v6;

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  uint64_t v4;
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
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  __int128 v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  double v48;
  _QWORD v49[4];
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  id location[2];
  __int128 v56;
  objc_super v57;

  v57.receiver = self;
  v57.super_class = (Class)_TVStackCollectionViewController;
  -[_TVStackCollectionViewController viewDidLayoutSubviews](&v57, sel_viewDidLayoutSubviews);
  -[_TVStackCollectionViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;

  -[_TVStackCollectionViewController viewElement](self, "viewElement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "style");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tv_padding");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  -[_TVStackCollectionViewController collectionView](self, "collectionView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "contentInset");
  if (v11 == v20 && v9 == v17 && v15 == v19)
  {
    v21 = v18;

    if (v13 == v21)
      goto LABEL_15;
  }
  else
  {

  }
  -[_TVStackCollectionViewController collectionView](self, "collectionView", v5);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "contentOffset");
  v24 = v23;
  v26 = v25;

  -[_TVStackCollectionViewController collectionView](self, "collectionView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "_effectiveContentInset");
  v29 = v28;
  v31 = v30;

  -[_TVStackCollectionViewController collectionView](self, "collectionView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setContentInset:", v9, v11, v13, v15);

  -[_TVStackCollectionViewController collectionView](self, "collectionView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "_effectiveContentInset");
  v35 = v34;
  v37 = v36;

  if (self->_configureForListTemplate)
  {
    v38 = *(_OWORD *)(MEMORY[0x24BDF7718] + 16);
    *(_OWORD *)location = *MEMORY[0x24BDF7718];
    v56 = v38;
    v53 = *(_OWORD *)location;
    v54 = v38;
    v51 = *(_OWORD *)location;
    v52 = v38;
    -[_TVStackCollectionViewController collectionView](self, "collectionView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    +[_TVCollectionWrappingView gradientConfigForCollection:gradientMask:gradientLengths:gradientInset:gradientBoundsInset:](_TVCollectionWrappingView, "gradientConfigForCollection:gradientMask:gradientLengths:gradientInset:gradientBoundsInset:", v39, 1, location, &v53, &v51);

    -[_TVStackCollectionViewController collectionView](self, "collectionView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "_setGradientMaskLengths:", *(double *)location, *(double *)&location[1], v56);

    -[_TVStackCollectionViewController collectionView](self, "collectionView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "_setGradientMaskEdgeInsets:", v53, v54);

    -[_TVStackCollectionViewController collectionView](self, "collectionView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "_setGradientBoundsInsets:", v51, v52);
  }
  else
  {
    -[_TVStackCollectionViewController collectionView](self, "collectionView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "_setGradientMaskLengths:", *MEMORY[0x24BDF7718], *(double *)(MEMORY[0x24BDF7718] + 8), *(double *)(MEMORY[0x24BDF7718] + 16), *(double *)(MEMORY[0x24BDF7718] + 24));
  }

  -[_TVStackCollectionViewController collectionView](self, "collectionView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "contentSize");
  v45 = v44;

  if (v26 <= -v29)
  {
    v26 = -v35;
  }
  else if (v26 >= v31 + v45 - v48)
  {
    v26 = v37 + v45 - v48;
  }
  -[_TVStackCollectionViewController collectionView](self, "collectionView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setContentOffset:animated:", 0, v24, v26);

LABEL_15:
  objc_initWeak(location, self);
  v47 = (void *)MEMORY[0x24BDE57D8];
  v49[0] = MEMORY[0x24BDAC760];
  v49[1] = 3221225472;
  v49[2] = __57___TVStackCollectionViewController_viewDidLayoutSubviews__block_invoke;
  v49[3] = &unk_24EB854F8;
  objc_copyWeak(&v50, location);
  objc_msgSend(v47, "setCompletionBlock:", v49);
  objc_destroyWeak(&v50);
  objc_destroyWeak(location);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_TVStackCollectionViewController;
  v4 = a3;
  -[_TVStackCollectionViewController traitCollectionDidChange:](&v10, sel_traitCollectionDidChange_, v4);
  -[_TVStackCollectionViewController traitCollection](self, "traitCollection", v10.receiver, v10.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 != v7)
  {
    -[_TVStackCollectionViewController _buildStackSections](self, "_buildStackSections");
    -[_TVStackCollectionViewController collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "collectionViewLayout");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "invalidateLayout");

    -[_TVStackCollectionViewController _updateBackgroundTintView](self, "_updateBackgroundTintView");
  }
}

- (void)preloadCellsInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = self->_viewControllers;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v12, "conformsToProtocol:", &unk_2557A6E78, (_QWORD)v13))
          objc_msgSend(v12, "preloadCellsInRect:", x, y, width, height);
      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (void)resetLastFocusedIndexPath
{
  NSIndexPath *lastFocusedIndexPath;
  NSArray *v4;
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

  v15 = *MEMORY[0x24BDAC8D0];
  lastFocusedIndexPath = self->_lastFocusedIndexPath;
  self->_lastFocusedIndexPath = 0;

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = self->_viewControllers;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
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
        if (objc_msgSend(v9, "conformsToProtocol:", &unk_2557A6E78, (_QWORD)v10))
          objc_msgSend(v9, "resetLastFocusedIndexPath");
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (id)_needsMoreTargetElement
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;

  -[_TVStackCollectionViewController viewElement](self, "viewElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "tv_elementType");
  -[_TVStackCollectionViewController viewElement](self, "viewElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 == 10)
  {
    objc_msgSend(v5, "parent");
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }

  return v6;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return -[NSArray count](self->_viewControllers, "count", a3);
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return 1;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  NSArray *viewControllers;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;

  v5 = a4;
  -[_TVStackCollectionViewController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("TVStackViewCollectionCellIdentifier"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  viewControllers = self->_viewControllers;
  v9 = objc_msgSend(v5, "section");

  -[NSArray objectAtIndex:](viewControllers, "objectAtIndex:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  objc_msgSend(v11, "setFrame:");
  objc_msgSend(v10, "tv_associatedIKViewElement");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "attributes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("markBackgroundSegment"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "BOOLValue");

  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "style");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "tv_backgroundColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18 && (v15 & 1) == 0)
  {
    objc_msgSend(v12, "style");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "tv_backgroundColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "color");
    v21 = objc_claimAutoreleasedReturnValue();

    v16 = (void *)v21;
  }
  objc_msgSend(v7, "setBackgroundColor:", v16);

  objc_msgSend(v7, "setViewController:", v10);
  return v7;
}

- (id)indexPathForPreferredFocusedViewInCollectionView:(id)a3
{
  void *v4;
  NSIndexPath *lastFocusedIndexPath;
  NSIndexPath *v6;

  -[_TVStackCollectionViewController collectionView](self, "collectionView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "tv_isFocusOnNonOwnedCell") & 1) != 0)
    lastFocusedIndexPath = 0;
  else
    lastFocusedIndexPath = self->_lastFocusedIndexPath;
  v6 = lastFocusedIndexPath;

  return v6;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  return 0;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v6;
  UIViewController *v7;
  void *v8;
  char v9;
  _QWORD v10[4];
  UIViewController *v11;
  id v12;

  v6 = a4;
  objc_msgSend(v6, "viewController");
  v7 = (UIViewController *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[_TVStackCollectionViewController childViewControllers](self, "childViewControllers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "containsObject:", v7);

    if ((v9 & 1) == 0)
    {
      -[_TVStackCollectionViewController addChildViewController:](self, "addChildViewController:", v7);
      -[UIViewController didMoveToParentViewController:](v7, "didMoveToParentViewController:", self);
      if (v7 == self->_backdropTintViewController)
        -[_TVStackCollectionViewController _updateBackgroundTintView](self, "_updateBackgroundTintView");
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __86___TVStackCollectionViewController_collectionView_willDisplayCell_forItemAtIndexPath___block_invoke;
      v10[3] = &unk_24EB848C0;
      v11 = v7;
      v12 = v6;
      dispatch_async(MEMORY[0x24BDAC9B8], v10);

    }
  }

}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;

  v10 = a4;
  objc_msgSend(v10, "viewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[_TVStackCollectionViewController childViewControllers](self, "childViewControllers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "containsObject:", v6) & 1) != 0)
    {
      objc_msgSend(v6, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isDescendantOfView:", v10);

      if (v9)
      {
        objc_msgSend(v6, "willMoveToParentViewController:", 0);
        objc_msgSend(v6, "removeFromParentViewController");
      }
    }
    else
    {

    }
  }

}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v6;
  void *v7;
  double v8;
  double v9;
  NSArray *stackSections;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  v6 = a5;
  -[_TVStackCollectionViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;
  stackSections = self->_stackSections;
  v11 = objc_msgSend(v6, "section");

  -[NSArray objectAtIndexedSubscript:](stackSections, "objectAtIndexedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sectionHeight");
  v14 = v13;

  v15 = v9;
  v16 = v14;
  result.height = v16;
  result.width = v15;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  void *v5;
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
  double v17;
  UIEdgeInsets result;

  -[NSArray objectAtIndexedSubscript:](self->_stackSections, "objectAtIndexedSubscript:", a5, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sectionSpacing");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (void)scrollViewDidScroll:(id)a3
{
  void *v4;
  id v5;

  -[_TVNeedsMoreContentEvaluator evaluateForState:](self->_needsMoreContentEvaluator, "evaluateForState:", 2);
  -[_TVStackCollectionViewController _updateBackgroundTintViewEffects](self, "_updateBackgroundTintViewEffects");
  if (self->_delegateFlags.respondsToStackCollectionViewControllerScrollViewDidScroll)
  {
    -[_TVStackCollectionViewController delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[_TVStackCollectionViewController collectionView](self, "collectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stackCollectionViewController:scrollViewDidScroll:", self, v4);

  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[_TVStackCollectionViewController navigationController](self, "navigationController", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "topViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "searchController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "searchBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resignFirstResponder");

}

- (BOOL)_updateWithCollectionListElement:(id)a3 autoHighlightIndexPath:(id *)a4
{
  id v5;
  double v6;
  double v7;
  id v8;
  void *v9;
  NSIndexPath *lastFocusedIndexPath;
  uint64_t i;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *j;
  void *v17;
  void *v18;
  _TVShadowViewElementID *v19;
  _TVShadowViewElementID *v20;
  uint64_t v21;
  id v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  _BOOL4 v27;
  void *v28;
  uint64_t v29;
  id v30;
  void *v31;
  uint64_t v32;
  id v33;
  int v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t k;
  void *v40;
  void *v41;
  NSArray *v42;
  NSArray *viewControllers;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id *location;
  id v52;
  void *v53;
  id v54;
  void *v55;
  id v56;
  int v57;
  id obj;
  _TVStackCollectionViewController *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
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
  uint64_t v79;

  v79 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  -[_TVStackCollectionViewController _maxViewWidth](self, "_maxViewWidth");
  v7 = v6;
  v8 = objc_alloc(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v5, "children");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = (void *)objc_msgSend(v8, "initWithCapacity:", objc_msgSend(v9, "count"));

  v61 = (void *)-[NSArray mutableCopy](self->_viewControllers, "mutableCopy");
  location = (id *)&self->_lastFocusedIndexPath;
  lastFocusedIndexPath = self->_lastFocusedIndexPath;
  if (lastFocusedIndexPath)
  {
    -[NSArray objectAtIndex:](self->_viewControllers, "objectAtIndex:", -[NSIndexPath section](lastFocusedIndexPath, "section"));
    v54 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v54 = 0;
  }
  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  v52 = v5;
  objc_msgSend(v5, "children");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v59 = self;
  v62 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v78, 16);
  if (!v62)
  {
    v53 = 0;
    v56 = 0;
    v57 = 0;
    goto LABEL_39;
  }
  v53 = 0;
  v56 = 0;
  v57 = 0;
  v60 = *(_QWORD *)v73;
  do
  {
    for (i = 0; i != v62; ++i)
    {
      if (*(_QWORD *)v73 != v60)
        objc_enumerationMutation(obj);
      v12 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
      v68 = 0u;
      v69 = 0u;
      v70 = 0u;
      v71 = 0u;
      v13 = v61;
      v14 = (id)objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v68, v77, 16);
      if (v14)
      {
        v63 = i;
        v15 = *(_QWORD *)v69;
        while (2)
        {
          for (j = 0; j != v14; j = (char *)j + 1)
          {
            if (*(_QWORD *)v69 != v15)
              objc_enumerationMutation(v13);
            v17 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * (_QWORD)j);
            objc_msgSend(v17, "tv_associatedIKViewElement");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = -[_TVShadowViewElementID initWithViewElement:]([_TVShadowViewElementID alloc], "initWithViewElement:", v18);
            v20 = -[_TVShadowViewElementID initWithViewElement:]([_TVShadowViewElementID alloc], "initWithViewElement:", v12);
            if (-[_TVShadowViewElementID isEqual:](v19, "isEqual:", v20))
            {
              v14 = v17;
              self = v59;
              v21 = -[NSArray indexOfObject:](v59->_viewControllers, "indexOfObject:", v14);

              goto LABEL_19;
            }

          }
          v14 = (id)objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v68, v77, 16);
          if (v14)
            continue;
          break;
        }
        v21 = 0x7FFFFFFFFFFFFFFFLL;
        self = v59;
LABEL_19:
        i = v63;
      }
      else
      {
        v21 = 0x7FFFFFFFFFFFFFFFLL;
      }

      -[_TVStackCollectionViewController _viewControllerWithElement:existingController:](self, "_viewControllerWithElement:existingController:", v12, v14);
      v22 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "view");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "tv_sizeThatFits:", v7, 0.0);
      v25 = v24;

      if (v25 == 0.0)
      {
        v26 = v22;
        v22 = 0;
LABEL_31:

        goto LABEL_32;
      }
      if (v22)
      {
        objc_msgSend(v55, "addObject:", v22);
        v27 = v21 != objc_msgSend(v55, "count") - 1;
        objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", 0, objc_msgSend(v55, "count") - 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v28;
        v29 = i;
        if (v54 == v22)
        {
          v30 = v28;

          v53 = v30;
        }
        v57 |= v27;
        objc_msgSend(v12, "autoHighlightIdentifier");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "length");

        if (v32)
        {
          v33 = v56;
          if (!v56)
            v33 = v26;
          v56 = v33;
          objc_msgSend(v12, "resetProperty:", 2);
        }
        i = v29;
        self = v59;
        goto LABEL_31;
      }
LABEL_32:
      if (v14 && v14 == v22)
        objc_msgSend(v13, "removeObjectIdenticalTo:", v14);

    }
    v62 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v78, 16);
  }
  while (v62);
LABEL_39:

  v34 = v57;
  if (objc_msgSend(v61, "count"))
  {
    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    v35 = v61;
    v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v64, v76, 16);
    if (v36)
    {
      v37 = v36;
      v38 = *(_QWORD *)v65;
      do
      {
        for (k = 0; k != v37; ++k)
        {
          if (*(_QWORD *)v65 != v38)
            objc_enumerationMutation(v35);
          v40 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * k);
          objc_msgSend(v40, "willMoveToParentViewController:", 0);
          objc_msgSend(v40, "view");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "removeFromSuperview");

          objc_msgSend(v40, "removeFromParentViewController");
        }
        v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v64, v76, 16);
      }
      while (v37);
    }

    v34 = 1;
    self = v59;
  }
  v42 = (NSArray *)objc_msgSend(v55, "copy");
  viewControllers = self->_viewControllers;
  self->_viewControllers = v42;

  -[_TVStackCollectionViewController viewElement](self, "viewElement");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "attributes");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("preloading"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (v46)
  {
    v47 = v52;
    if ((objc_msgSend(v46, "BOOLValue") & v34 & 1) != 0)
      goto LABEL_50;
  }
  else
  {
    v47 = v52;
    if ((v34 & 1) != 0)
    {
LABEL_50:
      -[_TVStackCollectionViewController view](self, "view");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "bounds");
      -[_TVStackCollectionViewController preloadCellsInRect:](self, "preloadCellsInRect:");

    }
  }
  objc_storeStrong(location, v53);
  -[_TVStackCollectionViewController _buildStackSections](self, "_buildStackSections");
  if (a4)
    *a4 = objc_retainAutorelease(v56);

  return v34 & 1;
}

- (id)_viewControllerWithElement:(id)a3 existingController:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _TVStackSupplementalViewController *v12;

  v5 = a3;
  v6 = a4;
  +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_viewControllerFromElement:existingController:", v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_viewFromElement:existingView:", v5, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v12 = (_TVStackSupplementalViewController *)v6;
      else
        v12 = objc_alloc_init(_TVStackSupplementalViewController);
      v8 = v12;
      -[_TVStackSupplementalViewController setView:](v12, "setView:", v11);
      objc_msgSend(v8, "tv_setAssociatedIKViewElement:", v5);
    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (void)_adjustedContentOffsetForRowIndex:(int64_t)a3 targetContentOffset:(CGPoint *)a4
{
  void *v7;
  double y;
  void *v9;
  double v10;
  char v11;
  void *v12;
  char v13;
  void *v14;
  double v15;
  double v16;
  CGFloat x;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  int64_t v25;
  uint64_t v26;
  double v27;
  void *v28;
  void *v29;
  double v30;
  unsigned int (**v31)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v32;
  double v33;
  int v34;
  int v35;
  double v36;
  _BOOL4 v37;
  double v38;
  double v39;
  int64_t v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint64_t v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  uint64_t v68;
  _QWORD v69[5];
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;

  -[NSArray objectAtIndexedSubscript:](self->_stackRows, "objectAtIndexedSubscript:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isHosted"))
  {
    y = a4->y;
    -[_TVStackCollectionViewController collectionView](self, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "contentOffset");
    if (y == v10)
    {
      v11 = objc_msgSend(v7, "isBounded");

      if ((v11 & 1) == 0)
        goto LABEL_49;
    }
    else
    {

    }
    -[_TVStackCollectionViewController collectionView](self, "collectionView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "tv_isFocusOnNonOwnedCell");

    if ((v13 & 1) == 0)
    {
      -[_TVStackCollectionViewController collectionView](self, "collectionView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "bounds");
      v16 = v15;
      x = a4->x;
      v18 = a4->y;
      objc_msgSend(v14, "_effectiveContentInset");
      v20 = v19;
      v22 = v21;
      objc_msgSend(v14, "contentSize");
      v24 = v23;
      v25 = a3 - 1;
      if (a3 < 1)
      {
        v27 = 0.0;
      }
      else
      {
        v26 = 0;
        v27 = 0.0;
        do
        {
          -[NSArray objectAtIndexedSubscript:](self->_stackRows, "objectAtIndexedSubscript:", v26);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = v28;
          if (v28)
          {
            objc_msgSend(v28, "rowMetrics");
            v30 = *((double *)&v70 + 1);
          }
          else
          {
            v73 = 0u;
            v74 = 0u;
            v71 = 0u;
            v72 = 0u;
            v30 = 0.0;
            v70 = 0u;
          }
          v27 = v27 + v30;

          ++v26;
        }
        while (a3 != v26);
      }
      v69[0] = MEMORY[0x24BDAC760];
      v69[1] = 3221225472;
      v69[2] = __90___TVStackCollectionViewController__adjustedContentOffsetForRowIndex_targetContentOffset___block_invoke;
      v69[3] = &unk_24EB85808;
      v69[4] = self;
      v31 = (unsigned int (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x22767F470](v69);
      v66 = 0uLL;
      if (v7)
      {
        objc_msgSend(v7, "rowMetrics");
        v32 = *((_QWORD *)&v61 + 1);
      }
      else
      {
        v64 = 0u;
        v65 = 0u;
        v62 = 0u;
        v63 = 0u;
        v61 = 0u;
        v32 = 0;
      }
      *(_QWORD *)&v67 = v32;
      *((_QWORD *)&v67 + 1) = a3;
      v68 = 1;
      if (!((unsigned int (**)(_QWORD, __int128 *, uint64_t, uint64_t))v31)[2](v31, &v66, 1, 1)
        || !((unsigned int (**)(_QWORD, __int128 *, _QWORD, uint64_t))v31)[2](v31, &v66, 0, 1))
      {
        goto LABEL_48;
      }
      if (v7)
      {
        objc_msgSend(v7, "rowMetrics");
      }
      else
      {
        v59 = 0u;
        v60 = 0u;
        v57 = 0u;
        v58 = 0u;
        v56 = 0u;
      }
      v49 = v22 + v24;
      v33 = floor((v16 - *(double *)&v67) * 0.5);
      if (v33 > 45.0)
      {
        v34 = 0;
        v35 = v27 + *((double *)&v56 + 1) * 0.5 - v18 < v16 * 0.5;
        while (1)
        {
          v55 = v68;
          v53 = v66;
          v54 = v67;
          if (((unsigned int (**)(_QWORD, __int128 *, _QWORD, _QWORD))v31)[2](v31, &v53, (v35 ^ 1) & 1, 0)
            && (v36 = floor((v16 - *(double *)&v54) * 0.5), v36 >= 45.0))
          {
            v66 = v53;
            v67 = v54;
            v68 = v55;
            v33 = v36;
          }
          else
          {
            v37 = v33 <= *(double *)&v66;
            if (v33 > *((double *)&v66 + 1))
              v37 = 0;
            if (((v37 | v34) & 1) != 0)
              break;
            v34 = 1;
            v35 ^= 1u;
            v36 = v33;
          }
          if (v36 <= 45.0)
            goto LABEL_35;
        }
      }
      v36 = v33;
LABEL_35:
      v38 = -v20;
      v39 = v49 - v16;
      v40 = *((_QWORD *)&v67 + 1);
      while (v25 > v40)
      {
        -[NSArray objectAtIndexedSubscript:](self->_stackRows, "objectAtIndexedSubscript:", v25);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = v41;
        if (v41)
        {
          objc_msgSend(v41, "rowMetrics");
          v43 = *((double *)&v52 + 1);
        }
        else
        {
          v43 = 0.0;
          v52 = 0u;
        }
        v27 = v27 - v43;

        --v25;
      }
      v44 = fmax(v38, v39);
      v45 = *(double *)&v66;
      -[NSArray objectAtIndexedSubscript:](self->_stackRows, "objectAtIndexedSubscript:", v40);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = v46;
      if (v45 > 0.0)
      {
        if (v46)
        {
          objc_msgSend(v46, "rowMetrics");
          v48 = v51;
          goto LABEL_47;
        }
      }
      else if (v46)
      {
        objc_msgSend(v46, "rowMetrics");
        v48 = v50;
LABEL_47:

        v18 = fmin(fmax(v38, v27 - v48 - v36), v44);
LABEL_48:
        a4->x = x;
        a4->y = v18;

        goto LABEL_49;
      }
      v48 = 0.0;
      goto LABEL_47;
    }
  }
LABEL_49:

}

- (double)_maxViewWidth
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[_TVStackCollectionViewController viewElement](self, "viewElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appDocument");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tv_adjustedWindowSize");
  v5 = v4;

  return v5;
}

- (void)_buildStackSections
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  NSArray *viewControllers;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  _TVStackRow *v13;
  void *v14;
  NSArray *v15;
  id v16;
  id v17;
  double v18;
  double v19;
  id v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  int v28;
  double v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  void *v36;
  void *v37;
  char *v38;
  double *v39;
  void *v40;
  uint64_t v41;
  NSArray *stackSections;
  uint64_t v43;
  NSArray *stackRows;
  void *v45;
  id v46;
  _TVStackRow *v47;
  void *v48;
  _TVStackCollectionViewController *v49;
  uint64_t v50;
  id v51;
  uint64_t v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _QWORD v57[4];
  id v58;
  id v59;
  _TVStackCollectionViewController *v60;
  id v61;
  _OWORD v62[5];
  _QWORD v63[4];
  id v64;
  id v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  uint64_t v73;
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  -[_TVStackCollectionViewController _maxViewWidth](self, "_maxViewWidth");
  v4 = v3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[NSArray count](self->_viewControllers, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", (2 * -[NSArray count](self->_viewControllers, "count")) | 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[NSArray count](self->_viewControllers, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  viewControllers = self->_viewControllers;
  v9 = MEMORY[0x24BDAC760];
  v63[0] = MEMORY[0x24BDAC760];
  v63[1] = 3221225472;
  v63[2] = __55___TVStackCollectionViewController__buildStackSections__block_invoke;
  v63[3] = &unk_24EB85830;
  v67 = v4;
  v10 = v7;
  v64 = v10;
  v68 = 1;
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v73 = 0;
  v11 = v6;
  v65 = v11;
  v12 = v5;
  v66 = v12;
  -[NSArray enumerateObjectsUsingBlock:](viewControllers, "enumerateObjectsUsingBlock:", v63);
  v13 = objc_alloc_init(_TVStackRow);
  memset((char *)v62 + 8, 0, 72);
  *(_QWORD *)&v62[0] = 1;
  -[_TVStackRow setRowMetrics:](v13, "setRowMetrics:", v62);
  v47 = v13;
  objc_msgSend(v11, "addObject:", v13);
  v48 = v10;
  +[TVMLUtilities rowSpacingMetricsForRowMetrics:](TVMLUtilities, "rowSpacingMetricsForRowMetrics:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = self->_viewControllers;
  v57[0] = v9;
  v57[1] = 3221225472;
  v57[2] = __55___TVStackCollectionViewController__buildStackSections__block_invoke_2;
  v57[3] = &unk_24EB85858;
  v16 = v12;
  v58 = v16;
  v17 = v11;
  v59 = v17;
  v60 = self;
  v46 = v14;
  v61 = v46;
  -[NSArray enumerateObjectsUsingBlock:](v15, "enumerateObjectsUsingBlock:", v57);
  v49 = self;
  -[_TVStackCollectionViewController collectionView](self, "collectionView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "bounds");
  v19 = v18;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v20 = v16;
  v52 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v53, v74, 16);
  if (v52)
  {
    v21 = *(_QWORD *)v54;
    v50 = *(_QWORD *)v54;
    v51 = v20;
    do
    {
      for (i = 0; i != v52; ++i)
      {
        if (*(_QWORD *)v54 != v21)
          objc_enumerationMutation(v20);
        v23 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
        v24 = objc_msgSend(v23, "firstRowIndex");
        v25 = objc_msgSend(v23, "rowCount");
        if (v25 >= 2)
        {
          v26 = v25;
          objc_msgSend(v17, "objectAtIndexedSubscript:", v24);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "isBounded");

          if (v28)
          {
            objc_msgSend(v23, "sectionHeight");
            v30 = v29;
            v31 = v24 - 1;
            v32 = -1;
            do
            {
              v33 = v32;
              if (v32 >= 0)
                v34 = v26 - 1;
              else
                v34 = 0;
              v35 = v34 + v31;
              do
              {
                if ((v35 & 0x8000000000000000) != 0 || v35 >= objc_msgSend(v17, "count"))
                  break;
                memset(v62, 0, sizeof(v62));
                objc_msgSend(v17, "objectAtIndexedSubscript:", v35);
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                v37 = v36;
                if (v36)
                  objc_msgSend(v36, "rowMetrics");
                else
                  memset(v62, 0, sizeof(v62));

                v38 = (char *)&v62[1] + 8;
                if (v33 >= 0)
                  v38 = (char *)&v62[1];
                v35 += v33;
                v39 = *(_QWORD *)&v62[0] == 1 ? (double *)((char *)v62 + 8) : (double *)v38;
                v30 = v30 + *v39;
              }
              while (*(_QWORD *)&v62[0] == 1);
              v32 = v33 + 2;
              v31 += 2;
            }
            while (v33 < 0);
            v21 = v50;
            v20 = v51;
            if ((v19 - v30) * 0.5 < 45.0)
            {
              do
              {
                objc_msgSend(v17, "objectAtIndexedSubscript:", v24);
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v40, "setBounded:", 0);

                ++v24;
                --v26;
              }
              while (v26);
            }
          }
        }
      }
      v52 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v53, v74, 16);
    }
    while (v52);
  }

  v41 = objc_msgSend(v20, "copy");
  stackSections = v49->_stackSections;
  v49->_stackSections = (NSArray *)v41;

  v43 = objc_msgSend(v17, "copy");
  stackRows = v49->_stackRows;
  v49->_stackRows = (NSArray *)v43;

}

- (void)_updateFirstItemRowIndexes
{
  NSArray *viewControllers;
  uint64_t v4;
  _QWORD v5[6];

  -[_TVStackCollectionViewController _maxViewWidth](self, "_maxViewWidth");
  viewControllers = self->_viewControllers;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __62___TVStackCollectionViewController__updateFirstItemRowIndexes__block_invoke;
  v5[3] = &unk_24EB85880;
  v5[5] = v4;
  v5[4] = self;
  -[NSArray enumerateObjectsUsingBlock:](viewControllers, "enumerateObjectsUsingBlock:", v5);
}

- (void)_configureBackgroundTintView
{
  UIViewController **p_backdropTintViewController;
  UIViewController *backdropTintViewController;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  UIView *v16;
  UIView *backdropTintView;
  void *v18;
  UIView *v19;
  void *v20;
  void *v21;
  void *v22;
  id *location;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  p_backdropTintViewController = &self->_backdropTintViewController;
  backdropTintViewController = self->_backdropTintViewController;
  self->_backdropTintViewController = 0;

  if (-[NSArray count](self->_viewControllers, "count"))
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v5 = self->_viewControllers;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v6)
    {
      v7 = v6;
      location = (id *)p_backdropTintViewController;
      v8 = *(_QWORD *)v25;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v25 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_msgSend(v10, "tv_associatedIKViewElement", location);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "attributes");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("markBackgroundSegment"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "BOOLValue");

          if (v14)
          {
            p_backdropTintViewController = (UIViewController **)location;
            objc_storeStrong(location, v10);
            goto LABEL_13;
          }

        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v7)
          continue;
        break;
      }
      v11 = 0;
      p_backdropTintViewController = (UIViewController **)location;
    }
    else
    {
      v11 = 0;
    }
LABEL_13:

    if (*p_backdropTintViewController)
    {
      if (self->_backdropTintView)
      {
        -[_TVStackCollectionViewController _updateBackgroundTintView](self, "_updateBackgroundTintView");
      }
      else
      {
        v15 = objc_alloc(MEMORY[0x24BDF6F90]);
        v16 = (UIView *)objc_msgSend(v15, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
        backdropTintView = self->_backdropTintView;
        self->_backdropTintView = v16;

        -[UIView setAutoresizingMask:](self->_backdropTintView, "setAutoresizingMask:", 50);
        -[UIView setUserInteractionEnabled:](self->_backdropTintView, "setUserInteractionEnabled:", 0);
        -[_TVStackCollectionViewController collectionView](self, "collectionView");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "insertSubview:atIndex:", self->_backdropTintView, 0);

      }
      v19 = self->_backdropTintView;
      objc_msgSend(v11, "style");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "tv_backgroundColor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "color");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v22)
      {
        objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.937254902, 0.937254902, 0.956862745, 1.0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
      }
      -[UIView setBackgroundColor:](v19, "setBackgroundColor:", v22);

    }
    else
    {
      -[_TVStackCollectionViewController _updateBackgroundTintView](self, "_updateBackgroundTintView");
    }

  }
}

- (void)_updateBackgroundTintView
{
  NSUInteger v3;
  UIViewController *backdropTintViewController;
  UIView *backdropTintView;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  UIView *v17;

  if (self->_backdropTintViewController)
  {
    v3 = -[NSArray indexOfObject:](self->_viewControllers, "indexOfObject:");
    if (v3 == 0x7FFFFFFFFFFFFFFFLL)
    {
      -[UIView removeFromSuperview](self->_backdropTintView, "removeFromSuperview");
      backdropTintViewController = self->_backdropTintViewController;
      self->_backdropTintViewController = 0;

      backdropTintView = self->_backdropTintView;
      self->_backdropTintView = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", 0, v3);
      v17 = (UIView *)objc_claimAutoreleasedReturnValue();
      -[_TVStackCollectionViewController collectionView](self, "collectionView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "frame");
      v8 = v7;
      v10 = v9;

      -[_TVStackCollectionViewController collectionView](self, "collectionView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "layoutAttributesForItemAtIndexPath:", v17);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "frame");
      v14 = v13;
      -[_TVStackCollectionViewController _maxContentSize](self, "_maxContentSize");
      -[UIView setFrame:](self->_backdropTintView, "setFrame:", v8, v14, v10, fmax(v15 - v14, 0.0));
      -[_TVStackCollectionViewController collectionView](self, "collectionView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "sendSubviewToBack:", self->_backdropTintView);

      -[_TVStackCollectionViewController _updateBackgroundTintViewEffects](self, "_updateBackgroundTintViewEffects");
      backdropTintView = v17;
    }
  }
  else
  {
    -[UIView removeFromSuperview](self->_backdropTintView, "removeFromSuperview");
    backdropTintView = self->_backdropTintView;
    self->_backdropTintView = 0;
  }

}

- (void)_updateBackgroundTintViewEffects
{
  UIView *backdropTintView;
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
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;

  backdropTintView = self->_backdropTintView;
  if (backdropTintView)
  {
    -[UIView frame](backdropTintView, "frame");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    -[_TVStackCollectionViewController _maxContentSize](self, "_maxContentSize");
    v11 = v10;
    -[UIView frame](self->_backdropTintView, "frame");
    v13 = fmax(v11 - v12, 0.0);
    if (v13 > 0.0)
    {
      -[_TVStackCollectionViewController collectionView](self, "collectionView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "contentSize");
      v16 = v15;
      -[_TVStackCollectionViewController collectionView](self, "collectionView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "bounds");
      v19 = v16 - v18;
      -[_TVStackCollectionViewController collectionView](self, "collectionView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "contentInset");
      v22 = v19 - v21;

      -[_TVStackCollectionViewController collectionView](self, "collectionView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "contentOffset");
      v25 = v24;

      if (v25 > v22)
      {
        -[_TVStackCollectionViewController collectionView](self, "collectionView");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "contentOffset");
        v13 = v13 + v27 - v22;

      }
    }
    -[UIView setFrame:](self->_backdropTintView, "setFrame:", v5, v7, v9, v13);
  }
}

- (CGSize)_maxContentSize
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  -[_TVStackCollectionViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentSize");
  v5 = v4;

  -[_TVStackCollectionViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;

  if (v5 < v8)
    v5 = v8;
  -[_TVStackCollectionViewController collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contentSize");
  v11 = v10;

  -[_TVStackCollectionViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  v14 = v13;

  if (v11 >= v14)
    v15 = v11;
  else
    v15 = v14;
  v16 = v5;
  result.height = v15;
  result.width = v16;
  return result;
}

- (IKViewElement)viewElement
{
  return self->_viewElement;
}

- (_TVStackCollectionViewControllerDelegate)delegate
{
  return (_TVStackCollectionViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_viewElement, 0);
  objc_storeStrong((id *)&self->_backdropTintView, 0);
  objc_storeStrong((id *)&self->_backdropTintViewController, 0);
  objc_storeStrong((id *)&self->_needsMoreContentEvaluator, 0);
  objc_storeStrong((id *)&self->_lastFocusedIndexPath, 0);
  objc_storeStrong((id *)&self->_stackRows, 0);
  objc_storeStrong((id *)&self->_stackSections, 0);
  objc_storeStrong((id *)&self->_viewControllers, 0);
}

@end
