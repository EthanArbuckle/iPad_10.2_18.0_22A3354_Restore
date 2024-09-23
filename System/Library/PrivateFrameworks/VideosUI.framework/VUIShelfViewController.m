@implementation VUIShelfViewController

- (void)viewWillLayoutSubviews
{
  VUIShelfView *containerView;
  void *v4;
  UICollectionView *collectionView;
  void *v6;
  void *v7;
  objc_super v8;
  CGRect v9;

  v8.receiver = self;
  v8.super_class = (Class)VUIShelfViewController;
  -[VUIShelfViewController viewWillLayoutSubviews](&v8, sel_viewWillLayoutSubviews);
  if (self->_shouldUpdateBeforeLayout)
  {
    self->_shouldUpdateBeforeLayout = 0;
    -[VUIShelfViewController _updateCollectionViewLayout:](self, "_updateCollectionViewLayout:", 1);
  }
  containerView = self->_containerView;
  -[VUIShelfViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  -[VUIShelfView setFrame:](containerView, "setFrame:");

  collectionView = self->_collectionView;
  v6 = (void *)MEMORY[0x1E0DC3F98];
  -[VUIShelfViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  objc_msgSend(v6, "vui_paddingForWindowWidth:", CGRectGetWidth(v9));
  -[UICollectionView setContentInset:](collectionView, "setContentInset:");

}

- (void)setHeaderView:(id)a3
{
  UIView *v5;

  v5 = (UIView *)a3;
  if (self->_headerView != v5)
  {
    objc_storeStrong((id *)&self->_headerView, a3);
    -[VUIShelfView setHeaderView:](self->_containerView, "setHeaderView:", v5);
  }

}

- (void)setContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_containerView, a3);
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (void)loadView
{
  VUIShelfView *v3;
  void *v4;
  void *v5;
  id v6;
  VUILegacyCollectionView *v7;
  VUILegacyCollectionView *v8;
  void *v9;
  VUIShelfView *v10;

  v3 = [VUIShelfView alloc];
  objc_msgSend(MEMORY[0x1E0DC3F98], "vui_keyWindow");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v10 = -[VUIShelfView initWithFrame:](v3, "initWithFrame:");

  -[VUIShelfView setAutoresizingMask:](v10, "setAutoresizingMask:", 18);
  objc_msgSend(MEMORY[0x1E0DC3658], "vui_primaryDynamicBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIShelfView setBackgroundColor:](v10, "setBackgroundColor:", v5);

  -[VUIShelfViewController setView:](self, "setView:", v10);
  -[VUIShelfViewController setContainerView:](self, "setContainerView:", v10);
  -[VUIShelfView setHeaderView:](v10, "setHeaderView:", self->_headerView);
  v6 = objc_alloc_init(MEMORY[0x1E0DB18D0]);
  objc_msgSend(v6, "setMinimumLineSpacing:", 0.0);
  v7 = [VUILegacyCollectionView alloc];
  v8 = -[VUILegacyCollectionView initWithFrame:collectionViewLayout:](v7, "initWithFrame:collectionViewLayout:", v6, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[VUILegacyCollectionView setAutoresizingMask:](v8, "setAutoresizingMask:", 18);
  objc_msgSend(MEMORY[0x1E0DC3658], "vui_primaryDynamicBackgroundColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUILegacyCollectionView setBackgroundColor:](v8, "setBackgroundColor:", v9);

  -[VUILegacyCollectionView setShowsVerticalScrollIndicator:](v8, "setShowsVerticalScrollIndicator:", 0);
  -[VUILegacyCollectionView setShowsHorizontalScrollIndicator:](v8, "setShowsHorizontalScrollIndicator:", 0);
  -[VUILegacyCollectionView setAlwaysBounceHorizontal:](v8, "setAlwaysBounceHorizontal:", 1);
  -[VUILegacyCollectionView setDelegate:](v8, "setDelegate:", self);
  -[VUILegacyCollectionView _setContentInsetAdjustmentBehavior:](v8, "_setContentInsetAdjustmentBehavior:", 2);
  -[VUIShelfViewController configureWithCollectionView:](self, "configureWithCollectionView:", v8);
  -[VUIShelfViewController setCollectionView:](self, "setCollectionView:", v8);
  -[VUIShelfView setCollectionView:](self->_containerView, "setCollectionView:", v8);
  -[VUIShelfView addSubview:](self->_containerView, "addSubview:", v8);
  -[VUIShelfViewController _updateCollectionViewLayout:](self, "_updateCollectionViewLayout:", 0);

}

- (VUIShelfViewController)initWithGridStyle:(int64_t)a3
{
  VUIShelfViewController *v4;
  VUIShelfViewController *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  id location;
  objc_super v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)VUIShelfViewController;
  v4 = -[VUIShelfViewController init](&v12, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_gridStyle = a3;
    objc_initWeak(&location, v4);
    v13[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __44__VUIShelfViewController_initWithGridStyle___block_invoke;
    v9[3] = &unk_1E9F99F98;
    objc_copyWeak(&v10, &location);
    v7 = (id)-[VUIShelfViewController registerForTraitChanges:withHandler:](v5, "registerForTraitChanges:withHandler:", v6, v9);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  return v5;
}

- (id)indexPathForPreferredFocusedViewInCollectionView:(id)a3
{
  id v4;
  void *v5;
  NSIndexPath *v6;

  v4 = a3;
  v5 = v4;
  if (self->_focusedIndexPath && objc_msgSend(v4, "vui_isIndexPathValid:"))
    v6 = self->_focusedIndexPath;
  else
    v6 = 0;

  return v6;
}

- (void)didMoveToParentViewController:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VUIShelfViewController;
  -[VUIShelfViewController didMoveToParentViewController:](&v4, sel_didMoveToParentViewController_, a3);
  -[VUIShelfViewController _ensureScrollViewSnaps](self, "_ensureScrollViewSnaps");
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)_updateCollectionViewLayout:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;
  id v7;

  v3 = a3;
  -[VUIShelfViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionViewLayout");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3F98], "vui_collectionInteritemSpace:gridType:", self->_gridStyle, 0);
  objc_msgSend(v7, "setMinimumInteritemSpacing:");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[VUIShelfViewController updateShelfLayout:](self, "updateShelfLayout:", v7);
  if (v3)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0DB1888]);
    objc_msgSend(v6, "setInvalidateLayout:", 1);
    objc_msgSend(v7, "invalidateLayoutWithContext:", v6);

  }
}

- (void)_snapTargetContentOffset:(CGPoint *)a3 toItemIndexPath:(id)a4 atItemOffset:(CGPoint)a5
{
  double x;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  double v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  id v35;

  x = a5.x;
  v35 = a4;
  -[VUIShelfViewController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v10 = v9;

  -[VUIShelfViewController collectionView](self, "collectionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contentSize");
  v13 = v12;

  -[VUIShelfViewController collectionView](self, "collectionView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "contentInset");
  v16 = v15;
  v18 = v17;

  v19 = v10 - v18 - v16;
  -[VUIShelfViewController collectionView](self, "collectionView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "layoutAttributesForItemAtIndexPath:", v35);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "frame");
  v26 = v22;
  if (v22 >= v13 - v19)
  {
    if (v13 >= v19)
    {
      v34 = v13 - v10 + v18;
      goto LABEL_8;
    }
  }
  else if (CGRectGetMidX(*(CGRect *)&v22) < x)
  {
    -[VUIShelfViewController collectionView](self, "collectionView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "numberOfItemsInSection:", objc_msgSend(v35, "section")) - 1;
    v29 = objc_msgSend(v35, "item");

    if (v28 > v29)
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", objc_msgSend(v35, "item") + 1, objc_msgSend(v35, "section"));
      v30 = objc_claimAutoreleasedReturnValue();

      -[VUIShelfViewController collectionView](self, "collectionView");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "layoutAttributesForItemAtIndexPath:", v30);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v32, "frame");
      v26 = v33;
      v21 = v32;
      v35 = (id)v30;
    }
  }
  v34 = v26 - v16;
LABEL_8:
  a3->x = v34;

}

- (id)_findSnappingItemFromContentOffset:(CGPoint *)a3 withVelocity:(CGPoint)a4
{
  double x;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  int v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;

  x = a4.x;
  -[VUIShelfViewController collectionView](self, "collectionView", a4.x, a4.y);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentSize");
  v9 = v8;
  -[VUIShelfViewController collectionView](self, "collectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "frame");
  v12 = v9 - v11;

  if (v12 > 0.0 && a3->x >= v12)
  {
    v14 = 0;
    v26 = 1;
  }
  else
  {
    -[VUIShelfViewController collectionView](self, "collectionView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "indexPathForItemAtPoint:", a3->x, a3->y);
    v14 = (id)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      -[VUIShelfViewController collectionView](self, "collectionView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "collectionViewLayout");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "minimumInteritemSpacing");
      v18 = v17;

      v19 = -v18;
      if (x > 0.0)
        v19 = v18;
      a3->x = v19 + a3->x;
      -[VUIShelfViewController collectionView](self, "collectionView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "indexPathForItemAtPoint:", a3->x, a3->y);
      v14 = (id)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
        -[VUIShelfViewController collectionView](self, "collectionView");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "collectionViewLayout");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "minimumLineSpacing");
        v24 = v23;

        a3->y = a3->y - v24;
        -[VUIShelfViewController collectionView](self, "collectionView");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "indexPathForItemAtPoint:", a3->x, a3->y);
        v14 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    v26 = 0;
  }
  -[VUIShelfViewController collectionView](self, "collectionView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "numberOfSections");

  if (!v14)
  {
    v29 = v28 - 1;
    if (v28 >= 1)
    {
      v30 = 0;
      do
      {
        -[VUIShelfViewController collectionView](self, "collectionView");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "numberOfItemsInSection:", v30);

        if (v32 < 1)
        {
          v33 = 0;
          ++v30;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, v30);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
        }
      }
      while (v30 < v28 && !v33);
      do
      {
        -[VUIShelfViewController collectionView](self, "collectionView");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v34, "numberOfItemsInSection:", v29);

        if (v35 < 1)
        {
          v36 = 0;
          if (--v29 < 0)
            break;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v35 - 1, v29);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          if (v29 < 0)
            break;
        }
      }
      while (!v36);
      if (v26)
        v37 = v36;
      else
        v37 = v33;
      v14 = v37;

    }
  }
  return v14;
}

- (void)_ensureScrollViewSnaps
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double MidY;
  double v17;
  double v18;
  CGRect v19;

  -[VUIShelfViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentInset");
  v5 = v4;

  -[VUIShelfViewController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentOffset");
  v8 = v7;
  v17 = v7;
  v18 = v9;

  -[VUIShelfViewController collectionView](self, "collectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v15 = v5 + v8;
  MidY = CGRectGetMidY(v19);

  -[VUIShelfViewController _findSnappingItemFromContentOffset:withVelocity:](self, "_findSnappingItemFromContentOffset:withVelocity:", &v15, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[VUIShelfViewController _snapTargetContentOffset:toItemIndexPath:atItemOffset:](self, "_snapTargetContentOffset:toItemIndexPath:atItemOffset:", &v17, v11, v15, MidY);
    v12 = v17;
    v13 = v18;
    -[VUIShelfViewController collectionView](self, "collectionView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setContentOffset:", v12, v13);

  }
}

void __44__VUIShelfViewController_initWithGridStyle___block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;
  void *v2;
  _BYTE *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[968] = 1;
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "containerView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setNeedsLayout");

    WeakRetained = v3;
  }

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  objc_super v8;

  height = a3.height;
  width = a3.width;
  v8.receiver = self;
  v8.super_class = (Class)VUIShelfViewController;
  v7 = a4;
  -[VUIShelfViewController viewWillTransitionToSize:withTransitionCoordinator:](&v8, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  -[VUIShelfViewController updateContentOffsetWithTransitionCoordinator:](self, "updateContentOffsetWithTransitionCoordinator:", v7, v8.receiver, v8.super_class);

}

- (void)updateContentOffsetWithTransitionCoordinator:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  double v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  CGRect v23;

  v4 = a3;
  -[VUIShelfViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentInset");
  v7 = v6;

  -[VUIShelfViewController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contentOffset");
  v10 = v9;
  v12 = v11;

  -[VUIShelfViewController collectionView](self, "collectionView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bounds");
  *(double *)&v22 = v7 + v10;
  *((_QWORD *)&v22 + 1) = CGRectGetMidY(v23);

  -[VUIShelfViewController _findSnappingItemFromContentOffset:withVelocity:](self, "_findSnappingItemFromContentOffset:withVelocity:", &v22, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIShelfViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setNeedsLayout");

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __71__VUIShelfViewController_updateContentOffsetWithTransitionCoordinator___block_invoke;
  v17[3] = &unk_1E9FA1B30;
  v17[4] = self;
  v18 = v14;
  v19 = v10;
  v20 = v12;
  v21 = v22;
  v16 = v14;
  objc_msgSend(v4, "animateAlongsideTransition:completion:", v17, 0);

}

void __71__VUIShelfViewController_updateContentOffsetWithTransitionCoordinator___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  __int128 v4;
  void *v5;
  __int128 v6;

  objc_msgSend(*(id *)(a1 + 32), "_updateCollectionViewLayout:", 1);
  if (*(_QWORD *)(a1 + 40))
  {
    v6 = *(_OWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "collectionView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "cellForItemAtIndexPath:", *(_QWORD *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_msgSend(*(id *)(a1 + 32), "_snapTargetContentOffset:toItemIndexPath:atItemOffset:", &v6, *(_QWORD *)(a1 + 40), *(double *)(a1 + 64), *(double *)(a1 + 72));
      v4 = v6;
      objc_msgSend(*(id *)(a1 + 32), "collectionView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setContentOffset:", v4);

    }
  }
}

- (UIView)headerView
{
  return self->_headerView;
}

- (int64_t)gridStyle
{
  return self->_gridStyle;
}

- (VUIShelfView)containerView
{
  return self->_containerView;
}

- (NSIndexPath)focusedIndexPath
{
  return self->_focusedIndexPath;
}

- (void)setFocusedIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_focusedIndexPath, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusedIndexPath, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
}

@end
