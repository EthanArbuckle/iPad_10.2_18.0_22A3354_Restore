@implementation _TVShelfViewController

- (void)setDelegate:(id)a3
{
  _TVShelfViewController *v3;
  __TVShelfViewControllerDelegate **p_delegate;
  id v5;
  $05032283D48F08041E03719CC87EAAAC *p_delegateFlags;
  BOOL v7;

  v3 = self;
  p_delegate = &self->_delegate;
  v5 = a3;
  objc_storeWeak((id *)p_delegate, v5);
  p_delegateFlags = &v3->_delegateFlags;
  v3->_delegateFlags.hasUpdateRelatedView = objc_opt_respondsToSelector() & 1;
  v3->_delegateFlags.hasDidSettleOnItemAtIndexPath = objc_opt_respondsToSelector() & 1;
  v3->_delegateFlags.hasDidPlayItemAtIndexPath = objc_opt_respondsToSelector() & 1;
  v3->_delegateFlags.hasDidSelectItemAtIndexPath = objc_opt_respondsToSelector() & 1;
  LOBYTE(v3) = objc_opt_respondsToSelector();

  p_delegateFlags->hasDidSnapToItemAtIndexPath = v3 & 1;
  v7 = p_delegateFlags->hasUpdateRelatedView || p_delegateFlags->hasDidSettleOnItemAtIndexPath;
  p_delegateFlags->hasFocusDependentMethods = v7;
}

- (void)didMoveToParentViewController:(id)a3
{
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_TVShelfViewController;
  -[_TVShelfViewController didMoveToParentViewController:](&v7, sel_didMoveToParentViewController_);
  if (a3)
  {
    -[_TVMLCollectionViewController collectionView](self, "collectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "collectionViewLayout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "snapContent");

  }
  else
  {
    objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__delayedUpdatePreview, 0);
  }
}

- (void)updateWithViewElement:(id)a3 cellMetrics:(TVCellMetrics *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  unint64_t v11;
  void *v12;
  int v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSInteger v25;
  NSIndexPath *lastPreviewedIndexPath;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  _TVShelfViewController *v46;
  void *v47;
  void *v48;
  _TVShelfViewController *v49;
  int64_t listTemplateAlignment;
  void *v51;
  uint64_t v52;
  int64_t v53;
  int64_t v54;
  void *v55;
  void *v56;
  uint64_t v57;
  NSIndexPath *v58;
  NSIndexPath *pendingPreviewedIndexPath;
  NSIndexPath *v60;
  void *v61;
  id v62;
  id obj;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _OWORD v68[9];
  objc_super v69;
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(v6, "attributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("scrollPosition"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  self->_autohighlightScrollPosition = 0;
  objc_msgSend(v8, "lowercaseString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("left"));

  if ((v10 & 1) != 0)
  {
    v11 = 8;
LABEL_5:
    self->_autohighlightScrollPosition = v11;
    goto LABEL_6;
  }
  objc_msgSend(v8, "lowercaseString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("right"));

  if (v13)
  {
    v11 = 32;
    goto LABEL_5;
  }
LABEL_6:
  objc_msgSend(v6, "sections");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  self->_prominentSectionIndex = objc_msgSend(v14, "indexOfObjectPassingTest:", &__block_literal_global_15);

  v69.receiver = self;
  v69.super_class = (Class)_TVShelfViewController;
  v15 = *(_OWORD *)&a4->cellMargin.top;
  v68[6] = *(_OWORD *)&a4->cellInsetAlt.bottom;
  v68[7] = v15;
  v68[8] = *(_OWORD *)&a4->cellMargin.bottom;
  v16 = *(_OWORD *)&a4->cellInset.top;
  v68[2] = *(_OWORD *)&a4->cellPadding.bottom;
  v68[3] = v16;
  v17 = *(_OWORD *)&a4->cellInsetAlt.top;
  v68[4] = *(_OWORD *)&a4->cellInset.bottom;
  v68[5] = v17;
  v18 = *(_OWORD *)&a4->cellPadding.top;
  v68[0] = a4->cellSize;
  v68[1] = v18;
  -[_TVMLCollectionViewController updateWithViewElement:cellMetrics:](&v69, sel_updateWithViewElement_cellMetrics_, v6, v68);
  if (self->_lastPreviewedIndexPath)
  {
    objc_msgSend(v6, "sections");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "count");
    v21 = -[NSIndexPath section](self->_lastPreviewedIndexPath, "section");

    if (v20 <= v21)
      goto LABEL_9;
    objc_msgSend(v6, "sections");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectAtIndex:", -[NSIndexPath section](self->_lastPreviewedIndexPath, "section"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = objc_msgSend(v23, "numberOfItems");
    v25 = -[NSIndexPath item](self->_lastPreviewedIndexPath, "item");

    if (v24 <= v25)
    {
LABEL_9:
      lastPreviewedIndexPath = self->_lastPreviewedIndexPath;
      self->_lastPreviewedIndexPath = 0;

    }
  }
  -[_TVMLCollectionViewController collectionElement](self, "collectionElement");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v27, "updateType") == 2)
  {
    -[_TVShelfViewController view](self, "view");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "window");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v29)
      goto LABEL_23;
    v61 = v8;
    v62 = v6;
    -[_TVMLCollectionViewController collectionView](self, "collectionView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "indexPathsForVisibleSupplementaryElementsOfKind:");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    obj = v31;
    v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v70, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v65;
      do
      {
        for (i = 0; i != v33; ++i)
        {
          if (*(_QWORD *)v65 != v34)
            objc_enumerationMutation(obj);
          v36 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
          -[_TVMLCollectionViewController collectionElement](self, "collectionElement");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "sections");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "objectAtIndex:", objc_msgSend(v36, "section"));
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v39, "header");
          v40 = (void *)objc_claimAutoreleasedReturnValue();

          if (v40)
          {
            -[_TVMLCollectionViewController collectionView](self, "collectionView");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "supplementaryViewForElementKind:atIndexPath:", CFSTR("TVShelfLayoutElementKindHeader"), v36);
            v42 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v42, "subviews");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "firstObject");
            v44 = (void *)objc_claimAutoreleasedReturnValue();

            +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "header");
            v46 = self;
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "_viewFromElement:existingView:", v47, v44);
            v48 = (void *)objc_claimAutoreleasedReturnValue();

            self = v46;
            objc_msgSend(v48, "setNeedsLayout");

          }
        }
        v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v70, 16);
      }
      while (v33);
    }
    v27 = obj;

    v8 = v61;
    v6 = v62;
  }

LABEL_23:
  if (-[_TVShelfViewController isViewLoaded](self, "isViewLoaded"))
  {
    if (self->_configureForListTemplate)
    {
      v49 = self;
      listTemplateAlignment = self->_listTemplateAlignment;
      -[_TVShelfViewController view](v49, "view");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = objc_msgSend(v51, "semanticContentAttribute");
      v53 = listTemplateAlignment;
      self = v49;
      v54 = +[TVMLUtilities semanticAlignmentForAlignment:semanticContentAttribute:](TVMLUtilities, "semanticAlignmentForAlignment:semanticContentAttribute:", v53, v52);

      -[_TVMLCollectionViewController collectionWrappingView](v49, "collectionWrappingView");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = v55;
      if (v54 == 1)
        v57 = 8;
      else
        v57 = 16;
    }
    else
    {
      -[_TVMLCollectionViewController collectionWrappingView](self, "collectionWrappingView");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = v55;
      v57 = 0;
    }
    objc_msgSend(v55, "setCollectionGradientMask:", v57);

    -[_TVMLCollectionViewController lastFocusedIndexPath](self, "lastFocusedIndexPath");
    v58 = (NSIndexPath *)objc_claimAutoreleasedReturnValue();
    if (self->_delegateFlags.hasFocusDependentMethods)
    {
      pendingPreviewedIndexPath = self->_pendingPreviewedIndexPath;
      if (pendingPreviewedIndexPath != v58
        && (-[NSIndexPath isEqual:](pendingPreviewedIndexPath, "isEqual:", v58) & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__delayedUpdatePreview, 0);
        v60 = self->_lastPreviewedIndexPath;
        self->_lastPreviewedIndexPath = 0;

        objc_storeStrong((id *)&self->_pendingPreviewedIndexPath, v58);
        if (self->_pendingPreviewedIndexPath)
          -[_TVShelfViewController _delayedUpdatePreview](self, "_delayedUpdatePreview");
      }
    }

  }
}

- (void)viewDidLoad
{
  int64_t listTemplateAlignment;
  void *v4;
  int64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_TVShelfViewController;
  -[_TVMLCollectionViewController viewDidLoad](&v10, sel_viewDidLoad);
  if (self->_configureForListTemplate)
  {
    listTemplateAlignment = self->_listTemplateAlignment;
    -[_TVShelfViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = +[TVMLUtilities semanticAlignmentForAlignment:semanticContentAttribute:](TVMLUtilities, "semanticAlignmentForAlignment:semanticContentAttribute:", listTemplateAlignment, objc_msgSend(v4, "semanticContentAttribute"));

    -[_TVMLCollectionViewController collectionWrappingView](self, "collectionWrappingView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5 == 1)
      v8 = 8;
    else
      v8 = 16;
    objc_msgSend(v6, "setCollectionGradientMask:", v8);

  }
  -[_TVShelfViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_setSpeedBumpEdges:", self->_speedBumpEdges);

}

- (void)viewDidLayoutSubviews
{
  NSIndexPath *v3;
  NSIndexPath *lastPreviewedIndexPath;
  NSIndexPath *v5;
  NSIndexPath *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_TVShelfViewController;
  -[_TVMLCollectionViewController viewDidLayoutSubviews](&v7, sel_viewDidLayoutSubviews);
  if (self->_delegateFlags.hasFocusDependentMethods && !self->_lastPreviewedIndexPath)
  {
    -[_TVMLCollectionViewController lastFocusedIndexPath](self, "lastFocusedIndexPath");
    v3 = (NSIndexPath *)objc_claimAutoreleasedReturnValue();
    lastPreviewedIndexPath = self->_lastPreviewedIndexPath;
    self->_lastPreviewedIndexPath = v3;

    if (v3)
    {
      -[_TVMLCollectionViewController lastFocusedIndexPath](self, "lastFocusedIndexPath");
      v5 = (NSIndexPath *)objc_claimAutoreleasedReturnValue();
      v6 = self->_lastPreviewedIndexPath;
      self->_lastPreviewedIndexPath = v5;

      -[_TVShelfViewController _didSettleOnItemAtIndexPath:](self, "_didSettleOnItemAtIndexPath:", v5);
    }
  }
}

- (id)preferredFocusEnvironments
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  -[_TVMLCollectionViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[_TVMLCollectionViewController collectionView](self, "collectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v5;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a4;
  -[_TVMLCollectionViewController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "collectionViewLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "indexPathForSnappedContent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __77___TVShelfViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v11[3] = &unk_24EB85EE0;
  v12 = v8;
  v13 = v7;
  v9 = v7;
  v10 = v8;
  objc_msgSend(v5, "animateAlongsideTransition:completion:", v11, 0);

}

- (void)updateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSIndexPath *v14;
  NSIndexPath *pendingPreviewedIndexPath;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  double v22;
  double v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id location;

  v6 = a3;
  v7 = a4;
  -[_TVShelfViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "window");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    objc_msgSend(v6, "nextFocusedIndexPath");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v6, "nextFocusedIndexPath");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[_TVMLCollectionViewController setLastFocusedIndexPath:](self, "setLastFocusedIndexPath:", v12);

      if (self->_delegateFlags.hasFocusDependentMethods)
      {
        objc_msgSend(v6, "nextFocusedIndexPath");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (NSIndexPath *)objc_msgSend(v13, "copy");
        pendingPreviewedIndexPath = self->_pendingPreviewedIndexPath;
        self->_pendingPreviewedIndexPath = v14;

        objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__delayedUpdatePreview, 0);
        objc_msgSend(v6, "previouslyFocusedIndexPath");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {

        }
        else if (!self->_lastPreviewedIndexPath)
        {
          -[_TVShelfViewController _delayedUpdatePreview](self, "_delayedUpdatePreview");
          goto LABEL_17;
        }
        objc_msgSend(v6, "previouslyFocusedIndexPath");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {

        }
        else
        {
          objc_msgSend(v6, "nextFocusedIndexPath");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "isEqual:", self->_lastPreviewedIndexPath);

          if (v20)
          {
            objc_initWeak(&location, self);
            objc_msgSend(v6, "nextFocusedIndexPath");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v24[0] = MEMORY[0x24BDAC760];
            v24[1] = 3221225472;
            v24[2] = __72___TVShelfViewController_updateFocusInContext_withAnimationCoordinator___block_invoke;
            v24[3] = &unk_24EB85F08;
            objc_copyWeak(&v26, &location);
            v25 = v6;
            -[_TVShelfViewController dispatchEvent:forItemAtIndexPath:completionBlock:](self, "dispatchEvent:forItemAtIndexPath:completionBlock:", CFSTR("highlight"), v21, v24);

            objc_destroyWeak(&v26);
            objc_destroyWeak(&location);
            goto LABEL_17;
          }
        }
        objc_msgSend(v6, "_focusVelocity");
        if (fabs(v22) >= 7500.0)
          v23 = 0.6;
        else
          v23 = dbl_222E77110[self->_lastPreviewDelay == 0.6];
        self->_lastPreviewDelay = v23;
        -[_TVShelfViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__delayedUpdatePreview, 0);
      }
      else
      {
        objc_msgSend(v6, "nextFocusedIndexPath");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[_TVShelfViewController dispatchEvent:forItemAtIndexPath:completionBlock:](self, "dispatchEvent:forItemAtIndexPath:completionBlock:", CFSTR("highlight"), v17, 0);

      }
    }
  }
  else
  {

  }
LABEL_17:

}

- (id)makeCollectionViewWithFrame:(CGRect)a3
{
  _TVMLShelfView *v3;
  void *v4;

  v3 = -[_TVMLShelfView initWithFrame:]([_TVMLShelfView alloc], "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[_TVMLShelfView registerClass:forSupplementaryViewOfKind:withReuseIdentifier:](v3, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), CFSTR("TVShelfLayoutElementKindHeader"), CFSTR("ShelfViewSectionHeaderIdentifier"));
  -[_TVMLShelfView setAlwaysBounceHorizontal:](v3, "setAlwaysBounceHorizontal:", 1);
  -[_TVMLShelfView collectionViewLayout](v3, "collectionViewLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShouldSnapContent:", 1);

  return v3;
}

- (BOOL)contentFlowsVertically
{
  return 0;
}

- (unint64_t)preferredScrollPosition
{
  return self->_autohighlightScrollPosition;
}

- (CGSize)expectedCellSizeForElement:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  int64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  objc_super v19;
  CGSize result;

  v6 = a3;
  v7 = a4;
  if (-[_TVShelfViewController prominentSectionIndex](self, "prominentSectionIndex") == 0x7FFFFFFFFFFFFFFFLL
    || (v8 = -[_TVShelfViewController prominentSectionIndex](self, "prominentSectionIndex"),
        v8 == objc_msgSend(v7, "section")))
  {
    v19.receiver = self;
    v19.super_class = (Class)_TVShelfViewController;
    -[_TVMLCollectionViewController expectedCellSizeForElement:atIndexPath:](&v19, sel_expectedCellSizeForElement_atIndexPath_, v6, v7);
    v10 = v9;
    v12 = v11;
  }
  else
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("TVFactoryKeyCellMetrics"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "tv_cellMetricsValue");
      v12 = v18;
      v10 = v17;
    }
    else
    {
      v12 = 0.0;
      v10 = 0.0;
    }

  }
  v15 = v10;
  v16 = v12;
  result.height = v16;
  result.width = v15;
  return result;
}

- (void)updateViewLayoutAnimated:(BOOL)a3 relayout:(BOOL)a4
{
  _BOOL4 v5;
  _TVMLShelfViewLayout *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  _BOOL4 v27;
  uint64_t v28;
  TVShelfViewLayoutInvalidationContext *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  char v36;
  void *v37;
  double v38;
  uint64_t v39;

  v5 = a3;
  if (a3)
  {
    v7 = objc_alloc_init(_TVMLShelfViewLayout);
  }
  else
  {
    -[_TVMLCollectionViewController collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "collectionViewLayout");
    v7 = (_TVMLShelfViewLayout *)objc_claimAutoreleasedReturnValue();

  }
  -[_TVMLCollectionViewController collectionElement](self, "collectionElement");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "style");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "tv_interitemSpacing");
  v12 = v11;
  objc_msgSend(v10, "valueForStyle:", CFSTR("tv-line-spacing"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v10, "tv_lineSpacing");
    v15 = v14;
  }
  else
  {
    v15 = NAN;
  }

  -[_TVMLCollectionViewController collectionElement](self, "collectionElement");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "attributes");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("rowCount"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "intValue");

  if (v19)
  {
    v20 = v19;
  }
  else
  {
    -[_TVMLCollectionViewController collectionElement](self, "collectionElement");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "style");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v22, "tv_rowCount");

  }
  -[_TVMLCollectionViewController collectionView](self, "collectionView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "visibleSupplementaryViewsOfKind:", CFSTR("TVShelfLayoutElementKindHeader"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = a4
     || (-[_TVShelfViewLayout minimumInteritemSpacing](v7, "minimumInteritemSpacing"), v25 != v12)
     || (-[_TVShelfViewLayout minimumLineSpacing](v7, "minimumLineSpacing"), v26 != v15)
     || objc_msgSend(v24, "count") != 0;
  -[_TVMLCollectionViewController cellMetrics](self, "cellMetrics");
  -[_TVMLShelfViewLayout setCellMetrics:](v7, "setCellMetrics:", &v39);
  if (v20 <= 1)
    v28 = 1;
  else
    v28 = v20;
  -[_TVShelfViewLayout setRowCount:](v7, "setRowCount:", v28);
  -[_TVShelfViewLayout setProminentSectionIndex:](v7, "setProminentSectionIndex:", -[_TVShelfViewController prominentSectionIndex](self, "prominentSectionIndex"));
  -[_TVShelfViewLayout setMinimumInteritemSpacing:](v7, "setMinimumInteritemSpacing:", v12);
  -[_TVShelfViewLayout setMinimumLineSpacing:](v7, "setMinimumLineSpacing:", v15);
  if (v5)
  {
    -[_TVMLCollectionViewController collectionView](self, "collectionView");
    v29 = (TVShelfViewLayoutInvalidationContext *)objc_claimAutoreleasedReturnValue();
    -[TVShelfViewLayoutInvalidationContext setCollectionViewLayout:animated:](v29, "setCollectionViewLayout:animated:", v7, 1);
  }
  else
  {
    if (!v27)
      goto LABEL_22;
    v29 = objc_alloc_init(TVShelfViewLayoutInvalidationContext);
    -[TVShelfViewLayoutInvalidationContext setInvalidateLayout:](v29, "setInvalidateLayout:", 1);
    -[_TVMLShelfViewLayout invalidateLayoutWithContext:](v7, "invalidateLayoutWithContext:", v29);
  }

LABEL_22:
  -[_TVMLCollectionViewController collectionWrappingView](self, "collectionWrappingView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setCentered:", -[_TVShelfViewController isCentered](self, "isCentered"));

  -[_TVMLCollectionViewController collectionElement](self, "collectionElement");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "appDocument");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "templateElement");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v33, "style");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "tv_searchStyle");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "isEqualToString:", CFSTR("partial"));

  -[_TVMLCollectionViewController collectionWrappingView](self, "collectionWrappingView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 1.0;
  if ((v36 & 1) == 0)
    +[_TVShelfViewLayout defaultHeaderSelectionMargin](_TVShelfViewLayout, "defaultHeaderSelectionMargin", 1.0);
  objc_msgSend(v37, "setHeaderSelectionMargin:", v38);

}

- (void)dispatchEvent:(id)a3 forItemAtIndexPath:(id)a4 completionBlock:(id)a5
{
  __CFString *v8;
  id v9;
  id v10;
  void *v11;
  objc_super v12;

  v8 = (__CFString *)a3;
  v9 = a4;
  v10 = a5;
  if (CFSTR("select") == v8 && self->_delegateFlags.hasDidSelectItemAtIndexPath)
  {
    -[_TVShelfViewController delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "shelfViewController:didSelectItemAtIndexPath:", self, v9);
    goto LABEL_7;
  }
  if (CFSTR("play") == v8 && self->_delegateFlags.hasDidPlayItemAtIndexPath)
  {
    -[_TVShelfViewController delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "shelfViewController:didPlayItemAtIndexPath:", self, v9);
LABEL_7:

  }
  v12.receiver = self;
  v12.super_class = (Class)_TVShelfViewController;
  -[_TVMLCollectionViewController dispatchEvent:forItemAtIndexPath:completionBlock:](&v12, sel_dispatchEvent_forItemAtIndexPath_completionBlock_, v8, v9, v10);

}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_TVShelfViewController;
  -[_TVMLCollectionViewController collectionView:cellForItemAtIndexPath:](&v6, sel_collectionView_cellForItemAtIndexPath_, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_contentForCell:shouldHide:", v4, 1);
  return v4;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  CGSize result;
  CGRect v37;

  v8 = a3;
  v9 = a4;
  -[_TVMLCollectionViewController collectionElement](self, "collectionElement");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sections");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndex:", a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "header");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v12, "header");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "style");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "tv_width");
    v17 = v16;

    objc_msgSend(v14, "style");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "tv_height");
    v20 = v19;

    if (v20 <= 0.0 || v17 <= 0.0)
    {
      +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "header");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "_viewFromElement:existingView:", v22, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v35 = 0;
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v28 = 0u;
      if (v9)
        objc_msgSend(v9, "cellMetrics", (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, 0);
      objc_msgSend(v8, "bounds", v28, v29, v30, v31, v32, v33, v34, v35);
      objc_msgSend(v23, "sizeThatFits:", CGRectGetWidth(v37) - (0.0 + 0.0), 0.0);
      v17 = v24;
      v20 = v25;

    }
  }
  else
  {
    v17 = *MEMORY[0x24BDBF148];
    v20 = *(double *)(MEMORY[0x24BDBF148] + 8);
  }

  v26 = v17;
  v27 = v20;
  result.height = v27;
  result.width = v26;
  return result;
}

- (void)setHideHeader:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[_TVMLCollectionViewController collectionWrappingView](self, "collectionWrappingView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHeaderHidden:", v3);

}

- (BOOL)hideHeader
{
  void *v2;
  char v3;

  -[_TVMLCollectionViewController collectionWrappingView](self, "collectionWrappingView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isHeaderHidden");

  return v3;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  v6 = a5;
  -[_TVMLCollectionViewController collectionElement](self, "collectionElement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v6, "section"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "prototypeForItemAtIndex:", objc_msgSend(v6, "row"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVShelfViewController expectedCellSizeForElement:atIndexPath:](self, "expectedCellSizeForElement:atIndexPath:", v10, v6);
  v12 = v11;
  v14 = v13;

  v15 = v12;
  v16 = v14;
  result.height = v16;
  result.width = v15;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
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
  UIEdgeInsets result;

  -[_TVMLCollectionViewController collectionElement](self, "collectionElement", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "style");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "tv_margin");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  v18 = v11;
  v19 = v13;
  v20 = v15;
  v21 = v17;
  result.right = v21;
  result.bottom = v20;
  result.left = v19;
  result.top = v18;
  return result;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_TVShelfViewController;
  v8 = a4;
  -[_TVMLCollectionViewController collectionView:willDisplayCell:forItemAtIndexPath:](&v9, sel_collectionView_willDisplayCell_forItemAtIndexPath_, a3, v8, a5);
  objc_msgSend(v8, "_setSpeedBumpEdges:", self->_speedBumpEdges, v9.receiver, v9.super_class);
  objc_msgSend((id)objc_opt_class(), "_contentForCell:shouldHide:", v8, 0);

}

- (void)setSpeedBumpEdges:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  self->_speedBumpEdges = a3;
  if (-[_TVShelfViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[_TVShelfViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_setSpeedBumpEdges:", self->_speedBumpEdges);

    -[_TVMLCollectionViewController collectionView](self, "collectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "visibleCells");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __44___TVShelfViewController_setSpeedBumpEdges___block_invoke;
    v7[3] = &unk_24EB85F30;
    v7[4] = self;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v7);

  }
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
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

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[_TVMLCollectionViewController collectionElement](self, "collectionElement");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sections");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndex:", objc_msgSend(v8, "section"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v9, CFSTR("ShelfViewSectionHeaderIdentifier"), v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "subviews");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "subviews");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "makeObjectsPerformSelector:", sel_removeFromSuperview);

  objc_msgSend(v13, "header");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v16, "tv_setAssociatedIKViewElement:", 0);
    +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "header");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "_viewFromElement:existingView:", v20, v16);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "addSubview:", v21);
    objc_msgSend(v14, "bounds");
    objc_msgSend(v21, "setFrame:");

  }
  return v14;
}

- (void)_delayedUpdatePreview
{
  void *v3;
  void *v4;
  NSIndexPath *pendingPreviewedIndexPath;
  NSIndexPath *v6;
  NSIndexPath *v7;
  _QWORD v8[4];
  NSIndexPath *v9;
  id v10;
  id location;

  -[_TVShelfViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    pendingPreviewedIndexPath = self->_pendingPreviewedIndexPath;
    v6 = pendingPreviewedIndexPath;
    v7 = self->_pendingPreviewedIndexPath;
    self->_pendingPreviewedIndexPath = 0;

    self->_lastPreviewDelay = 0.0;
    if ((-[NSIndexPath isEqual:](self->_lastPreviewedIndexPath, "isEqual:", v6) & 1) == 0)
    {
      objc_storeStrong((id *)&self->_lastPreviewedIndexPath, pendingPreviewedIndexPath);
      objc_initWeak(&location, self);
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __47___TVShelfViewController__delayedUpdatePreview__block_invoke;
      v8[3] = &unk_24EB85F08;
      objc_copyWeak(&v10, &location);
      v9 = v6;
      -[_TVShelfViewController dispatchEvent:forItemAtIndexPath:completionBlock:](self, "dispatchEvent:forItemAtIndexPath:completionBlock:", CFSTR("highlight"), v9, v8);

      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }

  }
}

- (void)_didSettleOnItemAtIndexPath:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (self->_delegateFlags.hasDidSettleOnItemAtIndexPath)
  {
    -[_TVShelfViewController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "shelfViewController:didSettleOnItemAtIndexPath:", self, v6);

  }
  if (self->_delegateFlags.hasUpdateRelatedView)
  {
    -[_TVShelfViewController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "shelfViewController:updateRelatedView:", self, 0);

  }
}

+ (void)_contentForCell:(id)a3 shouldHide:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a4;
  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(v7, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v4)
      objc_msgSend(v5, "removeFromSuperview");
    else
      objc_msgSend(v7, "addSubview:", v5);

  }
}

- (void)updateWithViewElement:(id)a3
{
  id v4;
  uint64_t v5;

  v4 = a3;
  +[_TVLockupFactory cellMetricsForCollectionElement:](_TVLockupFactory, "cellMetricsForCollectionElement:", v4);
  -[_TVShelfViewController updateWithViewElement:cellMetrics:](self, "updateWithViewElement:cellMetrics:", v4, &v5);

}

- (__TVShelfViewControllerDelegate)delegate
{
  return (__TVShelfViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (unint64_t)speedBumpEdges
{
  return self->_speedBumpEdges;
}

- (BOOL)isCentered
{
  return self->_centered;
}

- (void)setCentered:(BOOL)a3
{
  self->_centered = a3;
}

- (int64_t)prominentSectionIndex
{
  return self->_prominentSectionIndex;
}

- (void)setProminentSectionIndex:(int64_t)a3
{
  self->_prominentSectionIndex = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lastPreviewedIndexPath, 0);
  objc_storeStrong((id *)&self->_pendingPreviewedIndexPath, 0);
}

@end
