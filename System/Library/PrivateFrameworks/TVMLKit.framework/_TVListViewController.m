@implementation _TVListViewController

- (void)dealloc
{
  objc_super v3;

  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__delayedUpdatePreview, 0);
  v3.receiver = self;
  v3.super_class = (Class)_TVListViewController;
  -[_TVMLCollectionViewController dealloc](&v3, sel_dealloc);
}

- (void)updateWithViewElement:(id)a3 cellMetrics:(TVCellMetrics *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSIndexPath *secondCellIndexPath;
  NSIndexPath *v14;
  NSIndexPath *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  NSIndexPath *v19;
  NSIndexPath *v20;
  IKViewElement *relatedContentElement;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  CGSize cellSize;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  objc_super v40;
  _QWORD v41[5];

  v6 = a3;
  objc_msgSend(v6, "appDocument");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "templateElement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "tv_elementType");

  if (v9 == 74)
    self->_configureForStackTemplate = 1;
  objc_msgSend(v6, "sections");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "firstItemElement");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  secondCellIndexPath = self->_secondCellIndexPath;
  self->_secondCellIndexPath = 0;

  if (objc_msgSend(v12, "tv_elementType") == 55 && objc_msgSend(v12, "tv_textStyle") == 3)
  {
    if (objc_msgSend(v11, "numberOfItems") < 2)
    {
      objc_msgSend(v6, "sections");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "count");

      if (v17 < 2)
        goto LABEL_10;
      *(_QWORD *)&cellSize.height = &cellSize;
      *(_QWORD *)&v32 = 0x3032000000;
      *((_QWORD *)&v32 + 1) = __Block_byref_object_copy__5;
      *(_QWORD *)&v33 = __Block_byref_object_dispose__5;
      *((_QWORD *)&v33 + 1) = 0;
      objc_msgSend(v6, "sections", 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v41[0] = MEMORY[0x24BDAC760];
      v41[1] = 3221225472;
      v41[2] = __59___TVListViewController_updateWithViewElement_cellMetrics___block_invoke;
      v41[3] = &unk_24EB87C38;
      v41[4] = &cellSize;
      objc_msgSend(v18, "enumerateObjectsUsingBlock:", v41);

      v19 = (NSIndexPath *)objc_msgSend(*(id *)(*(_QWORD *)&cellSize.height + 40), "copy");
      v20 = self->_secondCellIndexPath;
      self->_secondCellIndexPath = v19;

      _Block_object_dispose(&cellSize, 8);
      v15 = (NSIndexPath *)*((_QWORD *)&v33 + 1);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", 1, 0);
      v14 = (NSIndexPath *)objc_claimAutoreleasedReturnValue();
      v15 = self->_secondCellIndexPath;
      self->_secondCellIndexPath = v14;
    }

  }
LABEL_10:
  self->_relatedContentElementValid = 0;
  relatedContentElement = self->_relatedContentElement;
  self->_relatedContentElement = 0;

  self->_previewUpdated = 0;
  v40.receiver = self;
  v40.super_class = (Class)_TVListViewController;
  v22 = *(_OWORD *)&a4->cellMargin.top;
  v37 = *(_OWORD *)&a4->cellInsetAlt.bottom;
  v38 = v22;
  v39 = *(_OWORD *)&a4->cellMargin.bottom;
  v23 = *(_OWORD *)&a4->cellInset.top;
  v33 = *(_OWORD *)&a4->cellPadding.bottom;
  v34 = v23;
  v24 = *(_OWORD *)&a4->cellInsetAlt.top;
  v35 = *(_OWORD *)&a4->cellInset.bottom;
  v36 = v24;
  v25 = *(_OWORD *)&a4->cellPadding.top;
  cellSize = a4->cellSize;
  v32 = v25;
  -[_TVMLCollectionViewController updateWithViewElement:cellMetrics:](&v40, sel_updateWithViewElement_cellMetrics_, v6, &cellSize);
  -[_TVMLCollectionViewController lastFocusedIndexPath](self, "lastFocusedIndexPath");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v26)
  {
    -[_TVMLCollectionViewController collectionElement](self, "collectionElement");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "sections");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v28, "count"))
    {
      objc_msgSend(v28, "objectAtIndex:", 0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v29 = 0;
    }
    if (objc_msgSend(v29, "numberOfItems") >= 1)
    {
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 0, 0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[_TVMLCollectionViewController setLastFocusedIndexPath:](self, "setLastFocusedIndexPath:", v30);

    }
  }

}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_TVListViewController;
  -[_TVMLCollectionViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[_TVMLCollectionViewController collectionWrappingView](self, "collectionWrappingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCollectionGradientMask:", 5);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v16.receiver = self;
  v16.super_class = (Class)_TVListViewController;
  -[_TVListViewController viewWillAppear:](&v16, sel_viewWillAppear_, a3);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[_TVMLCollectionViewController collectionView](self, "collectionView", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPathsForSelectedItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9);
        -[_TVMLCollectionViewController collectionView](self, "collectionView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "deselectItemAtIndexPath:animated:", v10, 0);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    }
    while (v7);
  }

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  NSIndexPath *lastPreviewedIndexPath;
  NSIndexPath *v6;
  NSIndexPath *pendingPreviewIndexPath;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_TVListViewController;
  -[_TVMLCollectionViewController viewDidAppear:](&v8, sel_viewDidAppear_, a3);
  -[_TVMLCollectionViewController lastFocusedIndexPath](self, "lastFocusedIndexPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && !self->_pendingPreviewIndexPath)
  {
    lastPreviewedIndexPath = self->_lastPreviewedIndexPath;

    if (!lastPreviewedIndexPath)
    {
      -[_TVMLCollectionViewController lastFocusedIndexPath](self, "lastFocusedIndexPath");
      v6 = (NSIndexPath *)objc_claimAutoreleasedReturnValue();
      pendingPreviewIndexPath = self->_pendingPreviewIndexPath;
      self->_pendingPreviewIndexPath = v6;

      objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__delayedUpdatePreview, 0);
      -[_TVListViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__delayedUpdatePreview, 0, 0.0);
    }
  }
  else
  {

  }
}

- (void)didMoveToParentViewController:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_TVListViewController;
  -[_TVListViewController didMoveToParentViewController:](&v5, sel_didMoveToParentViewController_);
  if (!a3)
    objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__delayedUpdatePreview, 0);
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_TVListViewController;
  -[_TVMLCollectionViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[_TVListViewController _updateCellMetrics](self, "_updateCellMetrics");
}

- (id)makeCollectionViewWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TVCollectionViewFlowLayout *v8;
  _TVListView *v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = objc_alloc_init(_TVCollectionViewFlowLayout);
  -[UICollectionViewFlowLayout setScrollDirection:](v8, "setScrollDirection:", 0);
  -[UICollectionViewFlowLayout setMinimumInteritemSpacing:](v8, "setMinimumInteritemSpacing:", 0.0);
  -[UICollectionViewFlowLayout setSectionInset:](v8, "setSectionInset:", *MEMORY[0x24BDF7718], *(double *)(MEMORY[0x24BDF7718] + 8), *(double *)(MEMORY[0x24BDF7718] + 16), *(double *)(MEMORY[0x24BDF7718] + 24));
  v9 = -[_TVCollectionView initWithFrame:collectionViewLayout:]([_TVListView alloc], "initWithFrame:collectionViewLayout:", v8, x, y, width, height);
  -[_TVListView setAutoresizingMask:](v9, "setAutoresizingMask:", 18);
  -[_TVListView registerClass:forSupplementaryViewOfKind:withReuseIdentifier:](v9, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), *MEMORY[0x24BDF7630], CFSTR("TVListHeaderViewIdentifier"));
  -[_TVCollectionView setDelegate:](v9, "setDelegate:", self);
  -[_TVListView setDataSource:](v9, "setDataSource:", self);
  -[_TVListView setBackgroundColor:](v9, "setBackgroundColor:", 0);
  -[_TVListView setOpaque:](v9, "setOpaque:", 0);
  -[_TVListView setClipsToBounds:](v9, "setClipsToBounds:", 0);
  -[_TVListView setShowsVerticalScrollIndicator:](v9, "setShowsVerticalScrollIndicator:", 0);
  -[_TVListView setConfigureForStackTemplate:](v9, "setConfigureForStackTemplate:", self->_configureForStackTemplate);

  return v9;
}

- (BOOL)contentFlowsVertically
{
  return 1;
}

- (void)updateViewLayoutAnimated:(BOOL)a3 relayout:(BOOL)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[_TVMLCollectionViewController collectionView](self, "collectionView", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionViewLayout");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[_TVMLCollectionViewController collectionElement](self, "collectionElement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "style");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tv_interitemSpacing");
  objc_msgSend(v8, "setMinimumLineSpacing:");

  -[_TVListViewController _updateCellMetrics](self, "_updateCellMetrics");
}

- (Class)cellClassForElement:(id)a3
{
  id v3;
  objc_class *v4;

  v3 = a3;
  if (objc_msgSend(v3, "elementType") != 53
    && objc_msgSend(v3, "elementType") != 14
    && objc_msgSend(v3, "tv_elementType") == 55)
  {
    objc_msgSend(v3, "tv_textStyle");
  }
  v4 = (objc_class *)(id)objc_opt_class();

  return v4;
}

- (CGSize)expectedCellSizeForElement:(id)a3 atIndexPath:(id)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  v6 = a3;
  -[_TVListViewController _expectedCellSizeForElement:inSectionIndex:](self, "_expectedCellSizeForElement:inSectionIndex:", v6, objc_msgSend(a4, "section"));
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)updateVisibleCell:(id)a3 atIndexPath:(id)a4 withElement:(id)a5
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
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v10, "tv_elementType") == 53 || objc_msgSend(v10, "tv_elementType") == 14)
  {
    -[_TVListViewController _viewControllerForElement:](self, "_viewControllerForElement:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_viewControllerFromElement:existingController:", v10, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (v8 && objc_msgSend(v10, "tv_elementType") == 55 && objc_msgSend(v10, "tv_textStyle") == 3)
  {
    objc_msgSend(v8, "contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "subviews");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_viewFromElement:existingView:", v10, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setDisabled:", objc_msgSend(v10, "isDisabled"));
    objc_msgSend(v8, "setNeedsLayout");

  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)_TVListViewController;
    -[_TVMLCollectionViewController updateVisibleCell:atIndexPath:withElement:](&v19, sel_updateVisibleCell_atIndexPath_withElement_, v8, v9, v10);
  }

}

- (void)updateSupplementaryViewsForSectionAtOldIndex:(int64_t)a3 oldElement:(id)a4 withNewIndex:(int64_t)a5 newElement:(id)a6 requiresReload:(BOOL *)a7 requiresRelayout:(BOOL *)a8
{
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  _QWORD *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;

  v39 = a6;
  v13 = (void *)MEMORY[0x24BDD15D8];
  v14 = a4;
  objc_msgSend(v13, "indexPathForItem:inSection:", 0, a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "header");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend(v39, "header");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[_TVListViewController _expectedHeaderCellSizeForElement:section:](self, "_expectedHeaderCellSizeForElement:section:", v17, a5);
    v19 = v18;
    v21 = v20;

  }
  else
  {
    v19 = *MEMORY[0x24BDBF148];
    v21 = *(double *)(MEMORY[0x24BDBF148] + 8);
  }

  objc_msgSend(v14, "header");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = (_QWORD *)MEMORY[0x24BDF7630];
  if (v22)
  {
    -[_TVMLCollectionViewController collectionView](self, "collectionView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "layoutAttributesForSupplementaryElementOfKind:atIndexPath:", *v23, v15);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "frame");
    v27 = v26;
    v29 = v28;

  }
  else
  {
    v27 = *MEMORY[0x24BDBF148];
    v29 = *(double *)(MEMORY[0x24BDBF148] + 8);
  }

  if (v19 == v27 && v21 == v29)
  {
    -[_TVMLCollectionViewController collectionView](self, "collectionView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "_visibleSupplementaryViewOfKind:atIndexPath:", *v23, v15);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      v33 = (void *)MEMORY[0x24BDD1968];
      objc_msgSend(v39, "header");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[_TVListViewController _marginForHeaderCellForElement:section:](self, "_marginForHeaderCellForElement:section:", v34, a5);
      objc_msgSend(v33, "valueWithUIEdgeInsets:");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setValue:forTVViewStyle:", v35, CFSTR("padding"));

      +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "header");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = (id)objc_msgSend(v36, "_viewFromElement:existingView:", v37, v32);

    }
  }
  else
  {
    *a7 = 1;
  }

}

- (void)didUpdateCollectionViewByNeedingReload:(BOOL)a3 focusUpdate:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  NSIndexPath *lastPreviewedIndexPath;
  void *v8;
  int v9;
  void *v10;
  NSIndexPath *pendingPreviewIndexPath;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSIndexPath *v16;
  void *v17;
  char v18;
  NSIndexPath *v19;
  void *v20;
  char isKindOfClass;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  char v32;
  NSIndexPath *v33;
  NSIndexPath *v34;
  void *v35;
  NSIndexPath *v36;
  void *v37;
  NSMutableArray *v38;
  NSIndexPath *v39;
  NSIndexPath *v40;
  void *v41;
  NSMutableArray *cachedListChildViewControllers;
  _QWORD v43[4];
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v4 = a4;
  v5 = a3;
  v50 = *MEMORY[0x24BDAC8D0];
  lastPreviewedIndexPath = self->_lastPreviewedIndexPath;
  self->_lastPreviewedIndexPath = 0;

  -[_TVMLCollectionViewController collectionElement](self, "collectionElement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isDisabled");

  if (!v9)
  {
    if (v4)
    {
      objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__delayedUpdatePreview, 0);
      pendingPreviewIndexPath = self->_pendingPreviewIndexPath;
      self->_pendingPreviewIndexPath = 0;

      objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "focusedView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      -[_TVMLCollectionViewController collectionView](self, "collectionView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "isDescendantOfView:", v14))
      {

      }
      else
      {
        -[_TVListViewController parentViewController](self, "parentViewController");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          -[_TVMLCollectionViewController collectionView](self, "collectionView");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "remembersLastFocusedIndexPath");

          if (v23)
          {
            v47 = 0u;
            v48 = 0u;
            v45 = 0u;
            v46 = 0u;
            -[_TVMLCollectionViewController collectionView](self, "collectionView");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "visibleCells");
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
            if (v26)
            {
              v27 = v26;
              v28 = *(_QWORD *)v46;
              do
              {
                for (i = 0; i != v27; ++i)
                {
                  if (*(_QWORD *)v46 != v28)
                    objc_enumerationMutation(v25);
                  v30 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                    objc_msgSend(v30, "setShouldAppearSelected:", 0);
                }
                v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
              }
              while (v27);
            }

          }
          -[_TVListViewController parentViewController](self, "parentViewController");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v31, "setNeedsFocusUpdateToList");

          if ((v32 & 1) == 0)
          {
            -[_TVMLCollectionViewController lastFocusedIndexPath](self, "lastFocusedIndexPath");
            v33 = (NSIndexPath *)objc_claimAutoreleasedReturnValue();
            v34 = self->_pendingPreviewIndexPath;
            self->_pendingPreviewIndexPath = v33;

            objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__delayedUpdatePreview, 0);
            if (self->_pendingPreviewIndexPath)
              -[_TVListViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__delayedUpdatePreview, 0, 0.0);
          }
        }
      }
      -[_TVMLCollectionViewController collectionView](self, "collectionView");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "_setRemembersPreviouslyFocusedItem:", 0);

      if (v5)
        goto LABEL_33;
      goto LABEL_35;
    }
    -[_TVMLCollectionViewController lastFocusedIndexPath](self, "lastFocusedIndexPath");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
      goto LABEL_32;
    v16 = self->_pendingPreviewIndexPath;
    if (!v16)
      goto LABEL_29;
    -[_TVMLCollectionViewController lastFocusedIndexPath](self, "lastFocusedIndexPath");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[NSIndexPath isEqual:](v16, "isEqual:", v17);

    if ((v18 & 1) == 0)
    {
      -[_TVMLCollectionViewController lastFocusedIndexPath](self, "lastFocusedIndexPath");
      v39 = (NSIndexPath *)objc_claimAutoreleasedReturnValue();
      v40 = self->_pendingPreviewIndexPath;
      self->_pendingPreviewIndexPath = v39;

      if (v5)
        goto LABEL_33;
LABEL_35:
      objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      cachedListChildViewControllers = self->_cachedListChildViewControllers;
      v43[0] = MEMORY[0x24BDAC760];
      v43[1] = 3221225472;
      v43[2] = __76___TVListViewController_didUpdateCollectionViewByNeedingReload_focusUpdate___block_invoke;
      v43[3] = &unk_24EB87C60;
      v44 = v41;
      v38 = v41;
      -[NSMutableArray enumerateObjectsUsingBlock:](cachedListChildViewControllers, "enumerateObjectsUsingBlock:", v43);
      -[NSMutableArray removeObjectsAtIndexes:](self->_cachedListChildViewControllers, "removeObjectsAtIndexes:", v38);

      goto LABEL_36;
    }
    if (self->_pendingPreviewIndexPath)
    {
      objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__delayedUpdatePreview, 0);
      v19 = self->_pendingPreviewIndexPath;
      self->_pendingPreviewIndexPath = 0;
    }
    else
    {
LABEL_29:
      -[_TVMLCollectionViewController lastFocusedIndexPath](self, "lastFocusedIndexPath");
      v36 = (NSIndexPath *)objc_claimAutoreleasedReturnValue();
      v19 = self->_lastPreviewedIndexPath;
      self->_lastPreviewedIndexPath = v36;
    }

    goto LABEL_31;
  }
  -[_TVMLCollectionViewController lastFocusedIndexPath](self, "lastFocusedIndexPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
LABEL_31:
    -[_TVMLCollectionViewController lastFocusedIndexPath](self, "lastFocusedIndexPath");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[_TVListViewController _updatedPreviewWithItemAtIndexPath:](self, "_updatedPreviewWithItemAtIndexPath:", v37);

  }
LABEL_32:
  if (!v5)
    goto LABEL_35;
LABEL_33:
  v38 = self->_cachedListChildViewControllers;
  self->_cachedListChildViewControllers = 0;
LABEL_36:

}

- (void)updateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  NSIndexPath *v21;
  NSIndexPath *pendingPreviewIndexPath;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(v5, "nextFocusedIndexPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVMLCollectionViewController collectionElement](self, "collectionElement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v6, "section");
  if (v9 >= objc_msgSend(v8, "count")
    || (v10 = objc_msgSend(v6, "item"),
        objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v6, "section")),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "numberOfItems"),
        v11,
        v13 = v6,
        v10 >= v12))
  {

    v13 = 0;
  }
  if (!v6)
  {
    -[_TVMLCollectionViewController collectionView](self, "collectionView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v24, "remembersLastFocusedIndexPath") & 1) != 0)
    {

LABEL_24:
      v23 = 0;
      goto LABEL_25;
    }
    if (-[_TVListViewController isAlwaysSoftFocusEnabled](self, "isAlwaysSoftFocusEnabled"))
    {

    }
    else
    {
      -[UIViewController tv_associatedIKViewElement](self->_previewController, "tv_associatedIKViewElement");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "tv_elementType");

      if (v26 != 14)
        goto LABEL_24;
    }
    -[_TVMLCollectionViewController collectionView](self, "collectionView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v27, "_remembersPreviouslyFocusedItem");

    goto LABEL_25;
  }
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[_TVMLCollectionViewController collectionView](self, "collectionView", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "visibleCells");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v32 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v20, "setShouldAppearSelected:", 0);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v17);
  }

  self->_secondIndexPathFocused = 0;
  -[_TVMLCollectionViewController setLastFocusedIndexPath:](self, "setLastFocusedIndexPath:", v13);
  -[_TVMLCollectionViewController lastFocusedIndexPath](self, "lastFocusedIndexPath");
  v21 = (NSIndexPath *)objc_claimAutoreleasedReturnValue();
  pendingPreviewIndexPath = self->_pendingPreviewIndexPath;
  self->_pendingPreviewIndexPath = v21;

  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__delayedUpdatePreview, 0);
  -[_TVListViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__delayedUpdatePreview, 0, 0.1);
  v23 = 0;
  if (objc_msgSend(v5, "focusHeading") == 1)
  {
    if (self->_secondCellIndexPath && objc_msgSend(v13, "isEqual:"))
    {
      v23 = 0;
      self->_secondIndexPathFocused = 1;
      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_25:
  -[_TVMLCollectionViewController collectionView](self, "collectionView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "remembersLastFocusedIndexPath");

  if ((_DWORD)v23 != v29)
  {
    -[_TVMLCollectionViewController collectionView](self, "collectionView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "_setRemembersPreviouslyFocusedItem:", v23);

  }
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGSize result;

  v6 = a5;
  -[_TVMLCollectionViewController collectionElement](self, "collectionElement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v6, "section"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "prototypeForItemAtIndex:", objc_msgSend(v6, "row"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "section");

  -[_TVListViewController _expectedCellSizeForElement:inSectionIndex:](self, "_expectedCellSizeForElement:inSectionIndex:", v10, v11);
  v13 = v12;
  v15 = v14;

  v16 = v13;
  v17 = v15;
  result.height = v17;
  result.width = v16;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
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
  objc_msgSend(v7, "objectAtIndexedSubscript:", a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "firstItemElement");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (double *)MEMORY[0x24BDF7718];
  v11 = *(double *)(MEMORY[0x24BDF7718] + 8);
  v12 = *(double *)(MEMORY[0x24BDF7718] + 24);
  if (objc_msgSend(v9, "tv_elementType") == 53
    || objc_msgSend(v9, "tv_elementType") == 14
    || (v13 = *v10, v14 = v10[2], objc_msgSend(v9, "tv_elementType") == 55) && objc_msgSend(v9, "tv_textStyle") == 3)
  {
    objc_msgSend(v9, "style");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "tv_margin");
    v13 = v16;
    v14 = v17;

  }
  v18 = v13;
  v19 = v11;
  v20 = v14;
  v21 = v12;
  result.right = v21;
  result.bottom = v20;
  result.left = v19;
  result.top = v18;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
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

  -[_TVMLCollectionViewController collectionElement](self, "collectionElement", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndex:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "header");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVListViewController _expectedHeaderCellSizeForElement:section:](self, "_expectedHeaderCellSizeForElement:section:", v10, a5);
  v12 = v11;
  v14 = v13;

  v15 = v12;
  v16 = v14;
  result.height = v16;
  result.width = v15;
  return result;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  objc_super v18;

  v8 = a4;
  v9 = a5;
  v18.receiver = self;
  v18.super_class = (Class)_TVListViewController;
  -[_TVMLCollectionViewController collectionView:willDisplayCell:forItemAtIndexPath:](&v18, sel_collectionView_willDisplayCell_forItemAtIndexPath_, a3, v8, v9);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "viewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[_TVListViewController childViewControllers](self, "childViewControllers");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "containsObject:", v10);

      if ((v12 & 1) == 0)
      {
        -[_TVListViewController addChildViewController:](self, "addChildViewController:", v10);
        objc_msgSend(v10, "didMoveToParentViewController:", self);
      }
    }

  }
  -[_TVMLCollectionViewController lastFocusedIndexPath](self, "lastFocusedIndexPath");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "isEqual:", v9)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && -[_TVListViewController _relatedElementIsGridAtIndexPath:](self, "_relatedElementIsGridAtIndexPath:", v9))
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "focusedView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[_TVMLCollectionViewController collectionView](self, "collectionView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isDescendantOfView:", v16);

    if ((v17 & 1) == 0)
      objc_msgSend(v8, "setShouldAppearSelected:", 1);
  }
  else
  {

  }
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  objc_super v13;

  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_TVListViewController;
  -[_TVMLCollectionViewController collectionView:didEndDisplayingCell:forItemAtIndexPath:](&v13, sel_collectionView_didEndDisplayingCell_forItemAtIndexPath_, a3, v8, a5);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "viewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[_TVListViewController childViewControllers](self, "childViewControllers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v10, "containsObject:", v9) & 1) != 0)
      {
        objc_msgSend(v9, "view");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isDescendantOfView:", v8);

        if (v12)
        {
          objc_msgSend(v9, "willMoveToParentViewController:", 0);
          objc_msgSend(v9, "removeFromParentViewController");
        }
      }
      else
      {

      }
    }

  }
}

- (void)templateControllerDidUpdateFocusFromView:(id)a3
{
  UIViewController *previewController;
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;

  previewController = self->_previewController;
  v5 = a3;
  -[UIViewController view](previewController, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isDescendantOfView:", v6);

  if (v7)
  {
    -[_TVMLCollectionViewController collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_TVMLCollectionViewController lastFocusedIndexPath](self, "lastFocusedIndexPath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cellForItemAtIndexPath:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v6, "updateFloatingViewControlStateForPreviouslyFocusedView:", v6);

  }
  -[_TVMLCollectionViewController collectionView](self, "collectionView");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v15, "remembersLastFocusedIndexPath") & 1) != 0)
    goto LABEL_14;
  v10 = -[_TVListViewController isAlwaysSoftFocusEnabled](self, "isAlwaysSoftFocusEnabled");
  if (!v10)
  {
    -[UIViewController tv_associatedIKViewElement](self->_previewController, "tv_associatedIKViewElement");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "tv_elementType") != 14)
    {

      goto LABEL_14;
    }
  }
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "focusedView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController view](self->_previewController, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "isDescendantOfView:", v13);

  if (v10)
  {

    if (!v14)
      return;
    goto LABEL_12;
  }

  if ((v14 & 1) != 0)
  {
LABEL_12:
    -[_TVMLCollectionViewController collectionView](self, "collectionView");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_setRemembersPreviouslyFocusedItem:", 1);
LABEL_14:

  }
}

- (void)collectionView:(id)a3 didHighlightItemAtIndexPath:(id)a4
{
  objc_msgSend(a3, "selectItemAtIndexPath:animated:scrollPosition:", a4, 0, 0);
}

- (void)collectionView:(id)a3 didUnhighlightItemAtIndexPath:(id)a4
{
  objc_msgSend(a3, "deselectItemAtIndexPath:animated:", a4, 0);
}

- (BOOL)collectionView:(id)a3 shouldHandleLongPressForItemAtIndexPath:(id)a4
{
  void *v4;
  BOOL v5;

  -[_TVListViewController traitCollection](self, "traitCollection", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "forceTouchCapability") != 2;

  return v5;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_TVListViewController;
  -[_TVMLCollectionViewController scrollViewDidScroll:](&v8, sel_scrollViewDidScroll_, v4);
  -[_TVListViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[_TVListViewController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "listViewController:didScrollWithScrollView:", self, v4);

  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  void *v7;
  double v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_TVListViewController;
  -[_TVMLCollectionViewController scrollViewWillEndDragging:withVelocity:targetContentOffset:](&v9, sel_scrollViewWillEndDragging_withVelocity_targetContentOffset_, a3, a4.x, a4.y);
  if (self->_secondIndexPathFocused)
  {
    -[_TVMLCollectionViewController collectionView](self, "collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contentInset");
    a5->y = -v8;

  }
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;

  v6 = a3;
  v7 = a4;
  -[_TVMLCollectionViewController collectionElement](self, "collectionElement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sections");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v7, "section"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "elementForItemAtIndex:", objc_msgSend(v7, "item"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "tv_elementType") == 53 || objc_msgSend(v11, "tv_elementType") == 14)
  {
    objc_msgSend(v11, "elementName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v12, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[_TVListViewController _viewControllerForElement:](self, "_viewControllerForElement:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bounds");
    objc_msgSend(v15, "setFrame:");
    objc_msgSend(v15, "setAutoresizingMask:", 18);
    objc_msgSend(v13, "setViewController:", v14);

  }
  else if (objc_msgSend(v11, "tv_elementType") == 55 && objc_msgSend(v11, "tv_textStyle") == 3)
  {
    objc_msgSend(v11, "elementName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v17, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_viewFromElement:existingView:", v11, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "setDisabled:", objc_msgSend(v11, "isDisabled"));
    objc_msgSend(v13, "contentView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addSubview:", v19);

    objc_msgSend(v13, "setNeedsLayout");
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)_TVListViewController;
    -[_TVMLCollectionViewController collectionView:cellForItemAtIndexPath:](&v21, sel_collectionView_cellForItemAtIndexPath_, v6, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "tv_elementType") == 23)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v13, "setDelegate:", self);
    }
  }

  return v13;
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
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[_TVMLCollectionViewController collectionElement](self, "collectionElement");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sections");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndex:", objc_msgSend(v8, "section"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v9, CFSTR("TVListHeaderViewIdentifier"), v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "transferLayoutStylesFromElement:", v13);
  v15 = (void *)MEMORY[0x24BDD1968];
  objc_msgSend(v13, "header");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v8, "section");

  -[_TVListViewController _marginForHeaderCellForElement:section:](self, "_marginForHeaderCellForElement:section:", v16, v17);
  objc_msgSend(v15, "valueWithUIEdgeInsets:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setValue:forTVViewStyle:", v18, CFSTR("padding"));

  objc_msgSend(v14, "tv_setAssociatedIKViewElement:", 0);
  +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "header");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (id)objc_msgSend(v19, "_viewFromElement:existingView:", v20, v14);

  return v14;
}

- (BOOL)listCell:(id)a3 shouldAppearSelectedForPreviouslyFocusedView:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  char v14;
  void *v15;
  char v16;
  void *v17;
  char v18;
  char v19;
  char v20;
  char v21;
  void *v22;

  v6 = (void *)MEMORY[0x24BDF6D38];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "mainScreen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "focusedView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIViewController view](self->_previewController, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isDescendantOfView:", v11);

  -[_TVMLCollectionViewController collectionView](self, "collectionView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v10, "isDescendantOfView:", v13);

  -[_TVMLCollectionViewController collectionView](self, "collectionView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v7, "isDescendantOfView:", v15);

  -[UIViewController view](self->_previewController, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v7, "isDescendantOfView:", v17);

  if (v8 == v7)
    v19 = v12;
  else
    v19 = 0;
  v20 = (v16 | v18) & ((v12 | v14) ^ 1);
  if (-[_TVListViewController isAlwaysSoftFocusEnabled](self, "isAlwaysSoftFocusEnabled"))
  {
    v21 = v19 | v20;
  }
  else
  {
    -[UIViewController tv_associatedIKViewElement](self->_previewController, "tv_associatedIKViewElement");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "tv_elementType") == 14)
      v21 = v19 | v20;
    else
      v21 = 0;

  }
  return v21;
}

- (id)impressionableElementsContainedInDocument:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[_TVMLCollectionViewController collectionElement](self, "collectionElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appDocument");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", v4);

  if (v7)
  {
    -[_TVMLCollectionViewController collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "visibleCells");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v23;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v23 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v15), "tv_impressionableElementsForDocument:", v4, (_QWORD)v22);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObjectsFromArray:", v16);

          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v13);
    }

    -[_TVMLCollectionViewController collectionWrappingView](self, "collectionWrappingView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "headerView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "tv_impressionableElementsForDocument:", v4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObjectsFromArray:", v19);

    if (objc_msgSend(v10, "count"))
    {
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v10);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = 0;
    }

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

+ (id)_shadowCollectionElementForCollectionElement:(id)a3
{
  id v3;
  _TVShadowViewElement *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  _TVShadowViewElementID *v12;
  _TVShadowViewElement *v13;
  _TVShadowViewElementID *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(_TVShadowViewElement);
  v15 = -[_TVShadowViewElementID initWithViewElement:]([_TVShadowViewElementID alloc], "initWithViewElement:", v3);
  -[_TVShadowViewElement setElementID:](v4, "setElementID:");
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v16 = v3;
  objc_msgSend(v3, "sections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v11, "elementType") == 49)
        {
          v12 = -[_TVShadowViewElementID initWithViewElement:]([_TVShadowViewElementID alloc], "initWithViewElement:", v11);
          v13 = objc_alloc_init(_TVShadowViewElement);
          -[_TVShadowViewElement setElementID:](v13, "setElementID:", v12);
          -[_TVShadowViewElement setParent:](v13, "setParent:", v4);
          objc_msgSend(v5, "addObject:", v13);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v5, "count"))
    -[_TVShadowViewElement setChildren:](v4, "setChildren:", v5);

  return v4;
}

- (void)_updateCellMetrics
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double cachedCellWidth;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  void *v48;
  double v49;
  double v50;
  double v52;
  void *v53;
  void *v54;
  NSDictionary *v55;
  NSDictionary *cachedListItemLockupHeightsBySection;
  _BOOL4 v57;
  BOOL v58;
  void *v59;
  _TVListViewController *v60;
  void *v61;
  id obj;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  -[_TVMLCollectionViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collectionViewLayout");
  v4 = objc_claimAutoreleasedReturnValue();

  -[_TVMLCollectionViewController collectionElement](self, "collectionElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "style");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tv_padding");
  v8 = v7;
  v10 = v9;

  -[_TVMLCollectionViewController collectionElement](self, "collectionElement");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "style");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "tv_width");
  v59 = (void *)v4;
  if (v13 == 0.0)
  {
    -[_TVMLCollectionViewController collectionView](self, "collectionView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bounds");
    v16 = v15 - v8 - v10;

  }
  else
  {
    v16 = v13;
  }

  cachedCellWidth = self->_cachedCellWidth;
  self->_cachedCellWidth = v16;
  v60 = self;
  v61 = (void *)objc_opt_new();
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  -[_TVMLCollectionViewController collectionElement](self, "collectionElement");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "sections");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v19;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
  if (v20)
  {
    v21 = v20;
    v22 = 0;
    v23 = *(_QWORD *)v64;
    v24 = *MEMORY[0x24BE51850];
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v64 != v23)
          objc_enumerationMutation(obj);
        v26 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
        if (objc_msgSend(v26, "numberOfItems") >= 1)
        {
          v27 = 0;
          while (1)
          {
            objc_msgSend(v26, "elementForItemAtIndex:", v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "elementName");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = objc_msgSend(v29, "isEqualToString:", v24);

            if ((v30 & 1) != 0)
              break;

            if (++v27 >= objc_msgSend(v26, "numberOfItems"))
              goto LABEL_30;
          }
          if (v28)
          {
            objc_msgSend(v28, "style");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "tv_height");
            v33 = v32;

            if (v33 <= 2.22044605e-16)
            {
              +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "_viewFromElement:existingView:", v28, 0);
              v34 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v28, "style");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "tv_padding");
              v39 = v38;
              v41 = v40;

              objc_msgSend(v34, "sizeThatFits:", v60->_cachedCellWidth, 0.0);
              v43 = v41 + v39 + v42;
              objc_msgSend(v28, "style");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "tv_minHeight");
              v46 = v45;

              if (v43 < v46 && v46 > 2.22044605e-16)
                v43 = v46;
              objc_msgSend(v28, "style");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "tv_maxHeight");
              v50 = v49;

              if (v43 <= v50 || v50 <= 2.22044605e-16)
                v52 = v43;
              else
                v52 = v50;
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v52);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v22);
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v61, "setObject:forKeyedSubscript:", v35, v53);

            }
            else
            {
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v33);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v22);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v61, "setObject:forKeyedSubscript:", v34, v35);
            }

          }
        }
LABEL_30:
        ++v22;
      }
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
    }
    while (v21);
  }

  if (objc_msgSend(v61, "count"))
    v54 = v61;
  else
    v54 = 0;
  v55 = v54;
  cachedListItemLockupHeightsBySection = v60->_cachedListItemLockupHeightsBySection;
  if (cachedListItemLockupHeightsBySection == v55)
  {
    objc_storeStrong((id *)&v60->_cachedListItemLockupHeightsBySection, v54);
    v58 = v16 == cachedCellWidth;
  }
  else
  {
    v57 = -[NSDictionary isEqualToDictionary:](cachedListItemLockupHeightsBySection, "isEqualToDictionary:", v55);
    objc_storeStrong((id *)&v60->_cachedListItemLockupHeightsBySection, v54);
    v58 = v57 && v16 == cachedCellWidth;
  }
  if (!v58)
    objc_msgSend(v59, "invalidateLayout");

}

- (void)_delayedUpdatePreview
{
  void *v3;
  void *v4;
  NSIndexPath *pendingPreviewIndexPath;
  NSIndexPath *v6;
  NSIndexPath *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  NSIndexPath *v15;
  id v16;
  id location;

  -[_TVListViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    pendingPreviewIndexPath = self->_pendingPreviewIndexPath;
    v6 = pendingPreviewIndexPath;
    v7 = self->_pendingPreviewIndexPath;
    self->_pendingPreviewIndexPath = 0;

    if ((-[NSIndexPath isEqual:](self->_lastPreviewedIndexPath, "isEqual:", v6) & 1) != 0)
    {
      if (v6)
        -[_TVListViewController _updatedPreviewWithItemAtIndexPath:](self, "_updatedPreviewWithItemAtIndexPath:", v6);
    }
    else
    {
      objc_storeStrong((id *)&self->_lastPreviewedIndexPath, pendingPreviewIndexPath);
      if (v6)
      {
        -[_TVMLCollectionViewController collectionElement](self, "collectionElement");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "sections");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectAtIndex:", -[NSIndexPath section](v6, "section"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "elementForItemAtIndex:", -[NSIndexPath row](v6, "row"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[_TVMLCollectionViewController collectionView](self, "collectionView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "cellForItemAtIndexPath:", v6);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_initWeak(&location, self);
        v14[0] = MEMORY[0x24BDAC760];
        v14[1] = 3221225472;
        v14[2] = __46___TVListViewController__delayedUpdatePreview__block_invoke;
        v14[3] = &unk_24EB85F08;
        objc_copyWeak(&v16, &location);
        v15 = v6;
        objc_msgSend(v11, "tv_dispatchEvent:canBubble:isCancelable:extraInfo:targetResponder:completionBlock:", CFSTR("highlight"), 1, 1, 0, v13, v14);

        objc_destroyWeak(&v16);
        objc_destroyWeak(&location);

      }
    }

  }
}

- (BOOL)_relatedElementIsGridAtIndexPath:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[_TVListViewController _relatedContentElementForIndexPath:](self, "_relatedContentElementForIndexPath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "children");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "tv_elementType") == 14;

  return v6;
}

- (id)_relatedContentElementForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[_TVMLCollectionViewController collectionElement](self, "collectionElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v4, "section"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "elementForItemAtIndex:", objc_msgSend(v4, "row"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v8, "children", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v13, "tv_elementType") == 43)
        {
          v10 = v13;
          goto LABEL_11;
        }
      }
      v10 = (id)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_11:

  return v10;
}

- (void)_updatedPreviewWithItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  char v6;
  id v7;
  UIViewController *v8;
  IKViewElement *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *i;
  void *v14;
  IKViewElement *v15;
  IKViewElement *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  IKViewElement *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  id v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[_TVListViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[_TVListViewController _relatedContentElementForIndexPath:](self, "_relatedContentElementForIndexPath:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v30 = 0;
      -[_TVListViewController _previewControllerWithElement:previewElement:](self, "_previewControllerWithElement:previewElement:", v7, &v30);
      v8 = (UIViewController *)objc_claimAutoreleasedReturnValue();
      v9 = (IKViewElement *)v30;
      if (v8)
        goto LABEL_21;
    }
    else
    {
      v9 = 0;
    }
    if (!self->_relatedContentElementValid)
    {

      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      -[_TVMLCollectionViewController collectionElement](self, "collectionElement");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "children");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = (id)objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      if (v7)
      {
        v12 = *(_QWORD *)v27;
        while (2)
        {
          for (i = 0; i != v7; i = (char *)i + 1)
          {
            if (*(_QWORD *)v27 != v12)
              objc_enumerationMutation(v11);
            v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
            if (objc_msgSend(v14, "tv_elementType") == 43)
            {
              v7 = v14;
              goto LABEL_17;
            }
          }
          v7 = (id)objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
          if (v7)
            continue;
          break;
        }
      }
LABEL_17:

      objc_storeStrong((id *)&self->_relatedContentElement, v7);
      self->_relatedContentElementValid = 1;
    }
    v15 = self->_relatedContentElement;

    if (v15)
    {
      v25 = v9;
      -[_TVListViewController _previewControllerWithElement:previewElement:](self, "_previewControllerWithElement:previewElement:", v15, &v25);
      v8 = (UIViewController *)objc_claimAutoreleasedReturnValue();
      v16 = v25;

      v9 = v16;
      v7 = v15;
    }
    else
    {
      v8 = 0;
      v7 = 0;
    }
LABEL_21:
    if (v9 != self->_previewElement || v8 != self->_previewController)
    {
      objc_storeStrong((id *)&self->_previewElement, v9);
      if (v8 != self->_previewController)
      {
        objc_storeStrong((id *)&self->_previewController, v8);
        -[_TVMLCollectionViewController collectionView](self, "collectionView");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "_setRemembersPreviouslyFocusedItem:", 0);

        -[_TVListViewController delegate](self, "delegate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "listViewController:updatePreviewViewController:", self, v8);

      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[UIViewController setAlwaysSoftFocusEnabled:](self->_previewController, "setAlwaysSoftFocusEnabled:", 0);
    -[_TVMLCollectionViewController lastFocusedIndexPath](self, "lastFocusedIndexPath");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "isEqual:", v4)
      && (-[_TVListViewController isAlwaysSoftFocusEnabled](self, "isAlwaysSoftFocusEnabled")
       || -[IKViewElement tv_elementType](v9, "tv_elementType") == 14))
    {
      objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "focusedView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIViewController view](self->_previewController, "view");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v21, "isDescendantOfView:", v22);

      if (!v23)
      {
LABEL_34:

        goto LABEL_35;
      }
      -[_TVMLCollectionViewController collectionView](self, "collectionView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "cellForItemAtIndexPath:", v4);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v19, "setShouldAppearSelected:", 1);
    }

    goto LABEL_34;
  }
LABEL_35:

}

- (id)_previewControllerWithElement:(id)a3 previewElement:(id *)a4
{
  void *v4;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  IKViewElement *v13;
  IKViewElement *previewElement;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  UIViewController *previewController;
  void *v22;
  UIViewController *v23;
  void *v24;
  void *v25;
  UIViewController *v26;
  void *v27;
  uint64_t v28;
  id v30;
  id obj;
  id *v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  objc_msgSend(v7, "children");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (!v9)
  {
    v23 = 0;
    goto LABEL_47;
  }
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v30 = v7;
  objc_msgSend(v7, "children");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (!v10)
  {
    v23 = 0;
    goto LABEL_46;
  }
  v11 = v10;
  v32 = a4;
  v33 = *(_QWORD *)v35;
  while (2)
  {
    v12 = 0;
    do
    {
      if (*(_QWORD *)v35 != v33)
        objc_enumerationMutation(obj);
      v13 = *(IKViewElement **)(*((_QWORD *)&v34 + 1) + 8 * v12);
      previewElement = self->_previewElement;
      if (previewElement == v13)
      {
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v12), "updateType"))
        {
          v23 = self->_previewController;
          if (a4)
            *a4 = objc_retainAutorelease(v13);
          goto LABEL_46;
        }
        previewElement = self->_previewElement;
      }
      if (previewElement == v13
        && (-[IKViewElement updateType](v13, "updateType") == 1 || -[IKViewElement updateType](v13, "updateType") == 2))
      {
        if (self->_previewUpdated)
        {
          -[UIViewController view](self->_previewController, "view");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v15) = 1;
          goto LABEL_25;
        }
        v15 = 1;
      }
      else
      {
        v15 = 0;
      }
      +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        -[UIViewController view](self->_previewController, "view");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v4;
      }
      else
      {
        v17 = 0;
      }
      objc_msgSend(v16, "_viewFromElement:existingView:", v13, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)

      -[UIViewController view](self->_previewController, "view");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = v15 ^ 1;
      if (v18 != v19)
        v20 = 1;
      if ((v20 & 1) == 0)
      {
        LOBYTE(v15) = 1;
        self->_previewUpdated = 1;
      }
LABEL_25:
      previewController = self->_previewController;
      if (v18)
      {
        -[UIViewController view](previewController, "view");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18 == v22)
        {
          v23 = self->_previewController;
        }
        else
        {
          v23 = (UIViewController *)objc_alloc_init(MEMORY[0x24BDF6F98]);
          -[UIViewController setView:](v23, "setView:", v18);
          -[UIViewController tv_setAssociatedIKViewElement:](v23, "tv_setAssociatedIKViewElement:", v13);
        }
      }
      else
      {
        -[UIViewController tv_associatedIKViewElement](previewController, "tv_associatedIKViewElement");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v24;
        if ((v15 & 1) != 0
          || objc_msgSend(v24, "tv_elementType") == 17 && -[IKViewElement tv_elementType](v13, "tv_elementType") == 17)
        {
          v26 = self->_previewController;
        }
        else
        {
          v26 = 0;
        }
        +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "_viewControllerFromElement:existingController:", v13, v26);
        v23 = (UIViewController *)objc_claimAutoreleasedReturnValue();

      }
      a4 = v32;
      if (v32 && v23)
      {
        *v32 = objc_retainAutorelease(v13);

        goto LABEL_46;
      }

      if (v23)
        goto LABEL_46;
      ++v12;
    }
    while (v11 != v12);
    v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    v11 = v28;
    v23 = 0;
    if (v28)
      continue;
    break;
  }
LABEL_46:

  v7 = v30;
LABEL_47:

  return v23;
}

- (id)_viewControllerForElement:(id)a3
{
  id v4;
  void *v5;
  void *v7;
  NSMutableArray *cachedListChildViewControllers;
  NSMutableArray *v9;
  NSMutableArray *v10;

  v4 = a3;
  -[_TVListViewController _cachedViewControllerForElement:](self, "_cachedViewControllerForElement:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_viewControllerFromElement:existingController:", v4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      cachedListChildViewControllers = self->_cachedListChildViewControllers;
      if (!cachedListChildViewControllers)
      {
        v9 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 1);
        v10 = self->_cachedListChildViewControllers;
        self->_cachedListChildViewControllers = v9;

        cachedListChildViewControllers = self->_cachedListChildViewControllers;
      }
      if ((-[NSMutableArray containsObject:](cachedListChildViewControllers, "containsObject:", v5) & 1) == 0)
        -[NSMutableArray addObject:](self->_cachedListChildViewControllers, "addObject:", v5);
    }
  }

  return v5;
}

- (id)_cachedViewControllerForElement:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  _TVShadowViewElementID *v10;
  void *v11;
  _TVShadowViewElementID *v12;
  _TVShadowViewElementID *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = self->_cachedListChildViewControllers;
  v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v10 = [_TVShadowViewElementID alloc];
        objc_msgSend(v9, "tv_associatedIKViewElement", (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[_TVShadowViewElementID initWithViewElement:](v10, "initWithViewElement:", v11);

        v13 = -[_TVShadowViewElementID initWithViewElement:]([_TVShadowViewElementID alloc], "initWithViewElement:", v4);
        if (-[_TVShadowViewElementID isEqual:](v12, "isEqual:", v13))
        {
          v6 = v9;

          goto LABEL_11;
        }

      }
      v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (CGSize)_expectedCellSizeForElement:(id)a3 inSectionIndex:(int64_t)a4
{
  id v6;
  double cachedCellWidth;
  void *v8;
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
  double v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  uint64_t v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  int v33;
  NSDictionary *cachedListItemLockupHeightsBySection;
  void *v35;
  void *v36;
  double v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  int v42;
  char v43;
  uint64_t v44;
  uint64_t i;
  void *v46;
  double v47;
  double v48;
  void *v49;
  double v50;
  double v51;
  void *v52;
  double v53;
  double v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  uint64_t v60;
  CGSize result;

  v60 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  cachedCellWidth = self->_cachedCellWidth;
  objc_msgSend(v6, "style");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "tv_padding");
  v10 = v9;
  v12 = v11;

  if (objc_msgSend(v6, "tv_elementType") == 53 || objc_msgSend(v6, "tv_elementType") == 14)
  {
    -[_TVListViewController _viewControllerForElement:](self, "_viewControllerForElement:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sizeThatFits:", cachedCellWidth, 0.0);
    cachedCellWidth = v15;
    v17 = v16;

  }
  else if (objc_msgSend(v6, "tv_elementType") == 55 && objc_msgSend(v6, "tv_textStyle") == 3)
  {
    +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "_viewFromElement:existingView:", v6, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "style");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "tv_padding");
    v24 = v23;
    v26 = v25;

    cachedCellWidth = self->_cachedCellWidth;
    objc_msgSend(v21, "sizeThatFits:", cachedCellWidth, 0.0);
    v17 = v26 + v24 + v27;

  }
  else
  {
    v28 = objc_msgSend(v6, "tv_elementType");
    objc_msgSend(v6, "style");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "tv_height");
    v31 = v30;
    if (v28 == 52)
    {
      if (v30 == 0.0)
        v17 = 1.0;
      else
        v17 = v30;

      cachedCellWidth = self->_cachedCellWidth;
    }
    else
    {

      if (v31 <= 2.22044605e-16)
      {
        objc_msgSend(v6, "elementName");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "isEqualToString:", *MEMORY[0x24BE51850]);

        v17 = 0.0;
        if (!v33)
          goto LABEL_18;
        cachedListItemLockupHeightsBySection = self->_cachedListItemLockupHeightsBySection;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary objectForKey:](cachedListItemLockupHeightsBySection, "objectForKey:", v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "doubleValue");
        v31 = v37;

        if (v31 <= 2.22044605e-16)
          goto LABEL_18;
      }
      v17 = v31;
      if (v31 == 0.0)
      {
LABEL_18:
        v57 = 0u;
        v58 = 0u;
        v55 = 0u;
        v56 = 0u;
        objc_msgSend(v6, "children", 0);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
        if (v39)
        {
          v40 = v39;
          v41 = 0;
          v42 = 0;
          v43 = 0;
          v44 = *(_QWORD *)v56;
          do
          {
            for (i = 0; i != v40; ++i)
            {
              if (*(_QWORD *)v56 != v44)
                objc_enumerationMutation(v38);
              v46 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
              if (objc_msgSend(v46, "tv_elementType") == 16 && !objc_msgSend(v46, "tv_imageType"))
              {
                objc_msgSend(v46, "height");
                v48 = v47;
                objc_msgSend(v46, "style");
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v49, "tv_margin");
                v51 = v48 + fmax(v50, v10);
                objc_msgSend(v46, "style");
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v52, "tv_margin");
                v17 = v51 + fmax(v53, v12);

              }
              else if (objc_msgSend(v46, "tv_elementType") == 55)
              {
                if (objc_msgSend(v46, "tv_textStyle") == 1)
                {
                  v41 = 1;
                }
                else if (objc_msgSend(v46, "tv_textStyle") == 2)
                {
                  v42 = 1;
                }
                else
                {
                  v43 |= objc_msgSend(v46, "tv_textStyle") == 0;
                }
              }
            }
            v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
          }
          while (v40);
        }
        else
        {
          v41 = 0;
          v42 = 0;
          v43 = 0;
        }

        if (v17 == 0.0)
        {
          if ((v41 & v42 & 1) != 0)
          {
            v54 = 90.0;
          }
          else if ((v43 & 1) != 0)
          {
            v54 = 40.0;
          }
          else
          {
            v54 = 70.0;
          }
          v17 = fmax(v17, v54);
        }
      }
      else
      {
        v17 = v31;
      }
    }
  }

  v18 = cachedCellWidth;
  v19 = v17;
  result.height = v19;
  result.width = v18;
  return result;
}

- (CGSize)_expectedHeaderCellSizeForElement:(id)a3 section:(int64_t)a4
{
  double cachedCellWidth;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGSize result;

  cachedCellWidth = self->_cachedCellWidth;
  if (a3)
  {
    v7 = a3;
    -[_TVListViewController _marginForHeaderCellForElement:section:](self, "_marginForHeaderCellForElement:section:", v7, a4);
    v9 = v8;
    v11 = v10;
    +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_viewFromElement:existingView:", v7, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "sizeThatFits:", cachedCellWidth, 0.0);
    cachedCellWidth = v14;
    v16 = v9 + v11 + v15;

  }
  else
  {
    v16 = 0.0;
  }
  v17 = cachedCellWidth;
  v18 = v16;
  result.height = v18;
  result.width = v17;
  return result;
}

- (UIEdgeInsets)_marginForHeaderCellForElement:(id)a3 section:(int64_t)a4
{
  void *v6;
  double v7;
  double v8;
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
  double v20;
  double v21;
  double v22;
  double v23;
  UIEdgeInsets result;

  objc_msgSend(a3, "style");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tv_margin");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  if (!a4)
  {
    -[_TVMLCollectionViewController collectionWrappingView](self, "collectionWrappingView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "headerView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      -[_TVMLCollectionViewController collectionWrappingView](self, "collectionWrappingView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "headerView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "tv_margin");
      v8 = fmax(v8 - v19, 0.0);

    }
  }
  v20 = v8;
  v21 = v10;
  v22 = v12;
  v23 = v14;
  result.right = v23;
  result.bottom = v22;
  result.left = v21;
  result.top = v20;
  return result;
}

- (_TVListViewControllerDelegate)delegate
{
  return (_TVListViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isAlwaysSoftFocusEnabled
{
  return self->_alwaysSoftFocusEnabled;
}

- (void)setAlwaysSoftFocusEnabled:(BOOL)a3
{
  self->_alwaysSoftFocusEnabled = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_secondCellIndexPath, 0);
  objc_storeStrong((id *)&self->_lastPreviewedIndexPath, 0);
  objc_storeStrong((id *)&self->_pendingPreviewIndexPath, 0);
  objc_storeStrong((id *)&self->_cachedListChildViewControllers, 0);
  objc_storeStrong((id *)&self->_cachedListItemLockupHeightsBySection, 0);
  objc_storeStrong((id *)&self->_previewController, 0);
  objc_storeStrong((id *)&self->_previewElement, 0);
  objc_storeStrong((id *)&self->_relatedContentElement, 0);
}

@end
