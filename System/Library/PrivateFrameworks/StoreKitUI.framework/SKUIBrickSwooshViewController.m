@implementation SKUIBrickSwooshViewController

- (SKUIBrickSwooshViewController)initWithSwoosh:(id)a3
{
  id v4;
  SKUIBrickSwooshViewController *v5;
  void *v6;
  uint64_t v7;
  NSArray *bricks;
  uint64_t v9;
  NSString *swooshTitle;
  objc_super v12;

  v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIBrickSwooshViewController initWithSwoosh:].cold.1();
  }
  v12.receiver = self;
  v12.super_class = (Class)SKUIBrickSwooshViewController;
  v5 = -[SKUIBrickSwooshViewController init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "bricks");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    bricks = v5->_bricks;
    v5->_bricks = (NSArray *)v7;

    v5->_showBrickTitles = objc_msgSend(v4, "showsBrickTitles");
    objc_msgSend(v4, "title");
    v9 = objc_claimAutoreleasedReturnValue();
    swooshTitle = v5->_swooshTitle;
    v5->_swooshTitle = (NSString *)v9;

  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[UICollectionView setDataSource:](self->_collectionView, "setDataSource:", 0);
  -[UICollectionView setDelegate:](self->_collectionView, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SKUIBrickSwooshViewController;
  -[SKUIBrickSwooshViewController dealloc](&v3, sel_dealloc);
}

- (void)deselectAllItems
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
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[UICollectionView indexPathsForSelectedItems](self->_collectionView, "indexPathsForSelectedItems", 0);
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
        -[UICollectionView deselectItemAtIndexPath:animated:](self->_collectionView, "deselectItemAtIndexPath:animated:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++), 0);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (CGRect)frameForItemAtIndex:(int64_t)a3
{
  UICollectionView *collectionView;
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
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  collectionView = self->_collectionView;
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView cellForItemAtIndexPath:](collectionView, "cellForItemAtIndexPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "bounds");
  objc_msgSend(v5, "convertRect:toView:", 0);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (id)indexPathsForVisibleItems
{
  return -[UICollectionView indexPathsForVisibleItems](self->_collectionView, "indexPathsForVisibleItems");
}

- (id)popImageViewForItemAtIndex:(int64_t)a3
{
  UICollectionView *collectionView;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  NSMutableIndexSet *hiddenImageIndexSet;
  NSMutableIndexSet *v22;
  NSMutableIndexSet *v23;

  collectionView = self->_collectionView;
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a3, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView cellForItemAtIndexPath:](collectionView, "cellForItemAtIndexPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "itemImageView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "frame");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;

    v17 = objc_alloc(MEMORY[0x1E0DC3890]);
    objc_msgSend(v7, "itemImage");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v17, "initWithImage:", v18);

    -[SKUIBrickSwooshViewController view](self, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "convertRect:fromView:", v7, v10, v12, v14, v16);
    objc_msgSend(v19, "setFrame:");

    hiddenImageIndexSet = self->_hiddenImageIndexSet;
    if (!hiddenImageIndexSet)
    {
      v22 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E0CB3788]);
      v23 = self->_hiddenImageIndexSet;
      self->_hiddenImageIndexSet = v22;

      hiddenImageIndexSet = self->_hiddenImageIndexSet;
    }
    -[NSMutableIndexSet addIndex:](hiddenImageIndexSet, "addIndex:", a3);
    objc_msgSend(v7, "setItemImageHidden:", 1);
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (void)setBricks:(id)a3
{
  NSArray *v4;
  NSArray *bricks;

  if (self->_bricks != a3)
  {
    v4 = (NSArray *)objc_msgSend(a3, "copy");
    bricks = self->_bricks;
    self->_bricks = v4;

    -[UICollectionView reloadData](self->_collectionView, "reloadData");
  }
}

- (void)setClientContext:(id)a3
{
  double v4;
  double v5;
  double v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SKUIBrickSwooshViewController;
  -[SKUISwooshViewController setClientContext:](&v7, sel_setClientContext_, a3);
  -[SKUIBrickSwooshViewController _brickSwooshMetrics](self, "_brickSwooshMetrics");
  self->_metrics.cellHeight = v4;
  self->_metrics.cellWidth = v5;
  self->_metrics.interItemSpacing = v6;
}

- (void)setColorScheme:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v4 = a3;
  -[SKUISwooshViewController colorScheme](self, "colorScheme");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)SKUIBrickSwooshViewController;
    -[SKUISwooshViewController setColorScheme:](&v6, sel_setColorScheme_, v4);
    -[SKUISwooshView setColoringWithColorScheme:](self->_swooshView, "setColoringWithColorScheme:", v4);
  }

}

- (void)setDelegate:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  self->_delegateWantsWillDisplay = objc_opt_respondsToSelector() & 1;
  v5.receiver = self;
  v5.super_class = (Class)SKUIBrickSwooshViewController;
  -[SKUISwooshViewController setDelegate:](&v5, sel_setDelegate_, v4);

}

- (void)setImage:(id)a3 forItemAtIndex:(int64_t)a4
{
  UICollectionView *collectionView;
  void *v6;
  id v7;
  void *v8;
  id v9;

  collectionView = self->_collectionView;
  v6 = (void *)MEMORY[0x1E0CB36B0];
  v7 = a3;
  objc_msgSend(v6, "indexPathForItem:inSection:", a4, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView cellForItemAtIndexPath:](collectionView, "cellForItemAtIndexPath:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setItemImage:", v7);
}

- (void)unhideImages
{
  NSMutableIndexSet *hiddenImageIndexSet;
  NSMutableIndexSet *v4;
  _QWORD v5[5];

  hiddenImageIndexSet = self->_hiddenImageIndexSet;
  if (hiddenImageIndexSet)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __45__SKUIBrickSwooshViewController_unhideImages__block_invoke;
    v5[3] = &unk_1E73A4750;
    v5[4] = self;
    -[NSMutableIndexSet enumerateIndexesWithOptions:usingBlock:](hiddenImageIndexSet, "enumerateIndexesWithOptions:usingBlock:", 0, v5);
    v4 = self->_hiddenImageIndexSet;
    self->_hiddenImageIndexSet = 0;

  }
}

void __45__SKUIBrickSwooshViewController_unhideImages__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 1000);
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", a2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cellForItemAtIndexPath:", v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setItemImageHidden:", 0);
}

- (void)loadView
{
  SKUISwooshView *v3;
  SKUISwooshView *swooshView;
  SKUISwooshView *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  NSString *swooshTitle;
  double v15;
  double v16;
  UICollectionView *collectionView;
  double cellHeight;
  SKUISwooshCollectionViewLayout *v19;
  UICollectionView *v20;
  UICollectionView *v21;
  UICollectionView *v22;
  void *v23;
  UICollectionView *v24;
  float v25;

  if (!self->_swooshView)
  {
    v3 = objc_alloc_init(SKUISwooshView);
    swooshView = self->_swooshView;
    self->_swooshView = v3;

    v5 = self->_swooshView;
    -[SKUISwooshViewController colorScheme](self, "colorScheme");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUISwooshView setColoringWithColorScheme:](v5, "setColoringWithColorScheme:", v6);

    -[SKUISwooshView setTitle:](self->_swooshView, "setTitle:", self->_swooshTitle);
    -[SKUISwooshView contentInsets](self->_swooshView, "contentInsets");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    -[SKUISwooshView collectionViewInsets](self->_swooshView, "collectionViewInsets");
    swooshTitle = self->_swooshTitle;
    if (swooshTitle)
      v15 = v13;
    else
      v15 = 19.0;
    v16 = 0.0;
    if (swooshTitle)
      v16 = v8;
    -[SKUISwooshView setContentInsets:](self->_swooshView, "setContentInsets:", v16, v10, 0.0, v12);
    -[SKUISwooshView setCollectionViewInsets:](self->_swooshView, "setCollectionViewInsets:", v15, -v10, 19.0, -v12);
  }
  collectionView = self->_collectionView;
  if (!collectionView)
  {
    if (self->_showBrickTitles)
      cellHeight = self->_metrics.cellHeight + 29.0;
    else
      cellHeight = self->_metrics.cellHeight;
    v19 = objc_alloc_init(SKUISwooshCollectionViewLayout);
    -[UICollectionViewFlowLayout setMinimumInteritemSpacing:](v19, "setMinimumInteritemSpacing:", self->_metrics.interItemSpacing);
    -[UICollectionViewFlowLayout setMinimumLineSpacing:](v19, "setMinimumLineSpacing:", self->_metrics.interItemSpacing);
    -[UICollectionViewFlowLayout setScrollDirection:](v19, "setScrollDirection:", 1);
    -[SKUISwooshCollectionViewLayout setSnapsToItemBoundaries:](v19, "setSnapsToItemBoundaries:", 1);
    v20 = (UICollectionView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC35B8]), "initWithFrame:collectionViewLayout:", v19, 0.0, 0.0, 0.0, cellHeight);
    v21 = self->_collectionView;
    self->_collectionView = v20;

    -[UICollectionView setPrefetchingEnabled:](self->_collectionView, "setPrefetchingEnabled:", 0);
    -[UICollectionView registerClass:forCellWithReuseIdentifier:](self->_collectionView, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("a"));
    -[UICollectionView setAlwaysBounceHorizontal:](self->_collectionView, "setAlwaysBounceHorizontal:", 1);
    v22 = self->_collectionView;
    -[SKUISwooshView backgroundColor](self->_swooshView, "backgroundColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionView setBackgroundColor:](v22, "setBackgroundColor:", v23);

    -[UICollectionView setDataSource:](self->_collectionView, "setDataSource:", self);
    v24 = self->_collectionView;
    +[SKUISwooshCollectionViewLayout snapToBoundariesDecelerationRate](SKUISwooshCollectionViewLayout, "snapToBoundariesDecelerationRate");
    -[UICollectionView setDecelerationRate:](v24, "setDecelerationRate:", v25);
    -[UICollectionView setDelegate:](self->_collectionView, "setDelegate:", self);
    -[UICollectionView setScrollsToTop:](self->_collectionView, "setScrollsToTop:", 0);
    -[UICollectionView setShowsHorizontalScrollIndicator:](self->_collectionView, "setShowsHorizontalScrollIndicator:", 0);

    collectionView = self->_collectionView;
  }
  -[SKUISwooshView setCollectionView:](self->_swooshView, "setCollectionView:", collectionView);
  -[SKUISwooshView sizeToFit](self->_swooshView, "sizeToFit");
  -[SKUIBrickSwooshViewController setView:](self, "setView:", self->_swooshView);
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  objc_super v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)SKUIBrickSwooshViewController;
  -[SKUIBrickSwooshViewController viewWillAppear:](&v13, sel_viewWillAppear_, 1);
  -[UICollectionView indexPathsForSelectedItems](self->_collectionView, "indexPathsForSelectedItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
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
        -[UICollectionView deselectItemAtIndexPath:animated:](self->_collectionView, "deselectItemAtIndexPath:animated:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), 1);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
    }
    while (v6);
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
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("a"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "backgroundColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setBackgroundColor:", v9);
  -[SKUISwooshViewController colorScheme](self, "colorScheme");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setColoringWithColorScheme:", v10);

  -[SKUISwooshViewController delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v11, "swoosh:imageForCellAtIndex:", self, objc_msgSend(v6, "item"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  objc_msgSend(v8, "setItemImage:", v12);
  -[NSArray objectAtIndex:](self->_bricks, "objectAtIndex:", objc_msgSend(v6, "item"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "link");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isActionable");

  if ((v15 & 1) != 0)
  {
    if (self->_showBrickTitles)
    {
      objc_msgSend(v8, "setAccessibilityLabel:", 0);
      objc_msgSend(v13, "accessibilityLabel");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setTitle:", v16);

    }
    else
    {
      objc_msgSend(v13, "accessibilityLabel");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setAccessibilityLabel:", v17);

      objc_msgSend(v8, "setTitle:", 0);
    }
    -[SKUISwooshViewController clientContext](self, "clientContext");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setClientContext:", v18);

    objc_msgSend(v13, "countdown");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCountdown:", v19);

    objc_msgSend(v8, "setItemImageHidden:", 0);
  }
  else
  {
    objc_msgSend(v8, "setCountdown:", 0);
    objc_msgSend(v8, "setAccessibilityLabel:", 0);
    objc_msgSend(v8, "setItemImageHidden:", 1);
    objc_msgSend(v8, "setTitle:", 0);
  }
  if (self->_delegateWantsWillDisplay)
    objc_msgSend(v11, "swoosh:willDisplayCellAtIndex:", self, objc_msgSend(v6, "item"));

  return v8;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return -[NSArray count](self->_bricks, "count", a3, a4);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  -[SKUISwooshViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "swoosh:didSelectCellAtIndex:", self, objc_msgSend(v6, "item"));

}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  UIEdgeInsets result;

  v5 = *MEMORY[0x1E0DC49E8];
  v6 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v7 = 15.0;
  v8 = 15.0;
  result.right = v8;
  result.bottom = v6;
  result.left = v7;
  result.top = v5;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  double cellWidth;
  double cellHeight;
  CGSize result;

  cellHeight = self->_metrics.cellHeight;
  cellWidth = self->_metrics.cellWidth;
  if (self->_showBrickTitles)
    cellHeight = cellHeight + 29.0;
  result.height = cellHeight;
  result.width = cellWidth;
  return result;
}

- ($1AB5FA073B851C12C2339EC22442E995)_brickSwooshMetrics
{
  void *v2;
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  $1AB5FA073B851C12C2339EC22442E995 result;

  -[SKUISwooshViewController clientContext](self, "clientContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = SKUIUserInterfaceIdiom(v2);

  if (v3 == 1)
  {
    v4 = 30.0;
    v5 = 103.0;
    v6 = 210.0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    v9 = v8;

    v4 = 15.0;
    if (v9 <= 375.0)
    {
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "bounds");
      v12 = v11;

      v6 = dbl_1BBED1950[v12 > 320.0];
      v5 = 78.0;
      if (v12 > 320.0)
        v5 = 100.0;
    }
    else
    {
      v5 = 86.0;
      v6 = 175.0;
    }
  }
  v13 = v4;
  result.var2 = v13;
  result.var1 = v6;
  result.var0 = v5;
  return result;
}

- (NSArray)bricks
{
  return self->_bricks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swooshView, 0);
  objc_storeStrong((id *)&self->_swooshTitle, 0);
  objc_storeStrong((id *)&self->_hiddenImageIndexSet, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_bricks, 0);
}

- (void)initWithSwoosh:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIBrickSwooshViewController initWithSwoosh:]";
}

@end
