@implementation VUILibraryStackViewController

- (VUILibraryStackViewController)init
{
  VUILibraryStackViewController *v2;
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;
  id location;
  objc_super v9;
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)VUILibraryStackViewController;
  v2 = -[VUILibraryStackViewController init](&v9, sel_init);
  if (v2)
  {
    objc_initWeak(&location, v2);
    v10[0] = objc_opt_class();
    v10[1] = objc_opt_class();
    v10[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __37__VUILibraryStackViewController_init__block_invoke;
    v6[3] = &unk_1E9F99F98;
    objc_copyWeak(&v7, &location);
    v4 = (id)-[VUILibraryStackViewController registerForTraitChanges:withHandler:](v2, "registerForTraitChanges:withHandler:", v3, v6);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)viewDidLoad
{
  id v3;
  VUILegacyCollectionView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  UICollectionView *v9;
  UICollectionView *stackCollectionView;
  UICollectionView *v11;
  void *v12;
  VUILibraryStackView *v13;
  VUILibraryStackView *stackView;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)VUILibraryStackViewController;
  -[VUILibraryStackViewController viewDidLoad](&v15, sel_viewDidLoad);
  self->_lastAppearWidth = 0.0;
  v3 = objc_alloc_init(MEMORY[0x1E0DC3610]);
  if (objc_msgSend(MEMORY[0x1E0DC69E0], "isUniquelyiPadEnabled"))
    objc_msgSend(v3, "setSectionInsetReference:", 1);
  v4 = [VUILegacyCollectionView alloc];
  v5 = *MEMORY[0x1E0C9D648];
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v9 = -[VUILegacyCollectionView initWithFrame:collectionViewLayout:](v4, "initWithFrame:collectionViewLayout:", v3, *MEMORY[0x1E0C9D648], v6, v7, v8);
  stackCollectionView = self->_stackCollectionView;
  self->_stackCollectionView = v9;

  v11 = self->_stackCollectionView;
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView setBackgroundColor:](v11, "setBackgroundColor:", v12);

  -[UICollectionView setAutoresizingMask:](self->_stackCollectionView, "setAutoresizingMask:", 18);
  -[UICollectionView setShowsVerticalScrollIndicator:](self->_stackCollectionView, "setShowsVerticalScrollIndicator:", 0);
  -[UICollectionView setShowsHorizontalScrollIndicator:](self->_stackCollectionView, "setShowsHorizontalScrollIndicator:", 0);
  -[UICollectionView setAlwaysBounceVertical:](self->_stackCollectionView, "setAlwaysBounceVertical:", 1);
  -[UICollectionView registerClass:forCellWithReuseIdentifier:](self->_stackCollectionView, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("VUILibraryCollectionCellReuseIdentifier"));
  -[UICollectionView registerClass:forCellWithReuseIdentifier:](self->_stackCollectionView, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("VUILibraryMenuCellReuseIdentifier"));
  -[UICollectionView registerClass:forCellWithReuseIdentifier:](self->_stackCollectionView, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("VUILibraryBannerCellReuseIdentifier"));
  -[UICollectionView setDelegate:](self->_stackCollectionView, "setDelegate:", self);
  v13 = -[VUILibraryStackView initWithFrame:]([VUILibraryStackView alloc], "initWithFrame:", v5, v6, v7, v8);
  stackView = self->_stackView;
  self->_stackView = v13;

  -[VUILibraryStackView setCollectionView:](self->_stackView, "setCollectionView:", self->_stackCollectionView);
  -[VUILibraryStackViewController configureWithCollectionView:](self, "configureWithCollectionView:", self->_stackCollectionView);
  self->_requiresRelayout = 1;

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VUILibraryStackViewController;
  -[VUILibraryStackViewController viewDidLayoutSubviews](&v4, sel_viewDidLayoutSubviews);
  -[VUILibraryStackViewController _updateNavigationBarPadding](self, "_updateNavigationBarPadding");
  if (self->_requiresRelayout)
  {
    -[UICollectionView collectionViewLayout](self->_stackCollectionView, "collectionViewLayout");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "invalidateLayout");

    -[VUILibraryStackView setNeedsLayout](self->_stackView, "setNeedsLayout");
    self->_requiresRelayout = 0;
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VUILibraryStackViewController;
  -[VUILibraryStackViewController viewDidAppear:](&v9, sel_viewDidAppear_, a3);
  -[VUILibraryStackViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;

  if (self->_lastAppearWidth != v6)
    -[VUILibraryStackViewController _invalidateLayouts](self, "_invalidateLayouts");
  self->_lastAppearWidth = v6;
  -[VUILibraryStackViewController _updateNavigationBarPadding](self, "_updateNavigationBarPadding");
  -[VUILibraryStackViewController navigationController](self, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "navigationBar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sizeToFit");

}

- (VUILibraryStackView)stackView
{
  return self->_stackView;
}

- (UICollectionView)stackCollectionView
{
  return self->_stackCollectionView;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  id v11;

  v11 = a4;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = v11;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v11, "viewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[VUILibraryStackViewController childViewControllers](self, "childViewControllers");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "containsObject:", v8);

      if ((v10 & 1) == 0)
      {
        -[VUILibraryStackViewController addChildViewController:](self, "addChildViewController:", v8);
        objc_msgSend(v8, "didMoveToParentViewController:", self);
      }
    }

    v7 = v11;
  }

}

- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5
{
  return 0.0;
}

- (void)_updateNavigationBarPadding
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  char v12;
  void *v13;
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
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  CGRect v39;

  -[VUILibraryStackViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  if (objc_msgSend(MEMORY[0x1E0DC69E0], "isUniquelyiPadEnabled"))
  {
    v12 = -[VUILibraryStackViewController vuiIsRTL](self, "vuiIsRTL");
    -[VUILibraryStackViewController view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "safeAreaInsets");
    v15 = v14;
    v17 = v16;

    if ((v12 & 1) != 0)
      v9 = v9 - v17;
    else
      v9 = v9 - v15;
  }
  v39.origin.x = v5;
  v39.origin.y = v7;
  v39.size.width = v9;
  v39.size.height = v11;
  objc_msgSend(MEMORY[0x1E0DC3F98], "vui_paddingForWindowWidth:", CGRectGetWidth(v39));
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  -[VUILibraryStackViewController navigationController](self, "navigationController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "navigationBar");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "layoutMargins");
  if (v21 == v31 && v19 == v28 && v25 == v30)
  {
    v34 = v29;

    if (v23 == v34)
      return;
  }
  else
  {

  }
  -[VUILibraryStackViewController navigationController](self, "navigationController");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "navigationBar");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setLayoutMargins:", v19, v21, v23, v25);

  -[VUILibraryStackViewController navigationController](self, "navigationController");
  v38 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "navigationBar");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setNeedsLayout");

}

- (void)_invalidateLayouts
{
  void *v3;

  -[UICollectionView collectionViewLayout](self->_stackCollectionView, "collectionViewLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidateLayout");

  -[VUILibraryStackView setNeedsLayout](self->_stackView, "setNeedsLayout");
}

void __37__VUILibraryStackViewController_init__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint8_t v15[16];

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    *((_BYTE *)WeakRetained + 976) = 1;
    objc_msgSend(v5, "traitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "vuiPreferredContentSizeCategory");
    v11 = objc_msgSend(v6, "vuiPreferredContentSizeCategory");

    if (v10 != v11)
    {
      if (objc_msgSend(v8, "vuiIsViewLoaded"))
      {
        objc_msgSend(v8, "vuiView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "window");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          VUIDefaultLogObject();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v15 = 0;
            _os_log_impl(&dword_1D96EE000, v14, OS_LOG_TYPE_INFO, "VUILibraryStackViewController:: size category changed, update traits to relayout the collection view", v15, 2u);
          }

          objc_msgSend(v8, "updateTraitsIfNeeded");
        }
      }
    }
  }

}

- (void)scrollToTop
{
  id v2;

  -[VUILibraryStackViewController stackCollectionView](self, "stackCollectionView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scrollToTopIfPossible:", 1);

}

- (void)configureWithCollectionView:(id)a3
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Subclasses must override _configureWithCollectionView and not call super"));
}

- (int64_t)preferredStatusBarStyle
{
  return 0;
}

- (void)viewDidDisappear:(BOOL)a3
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
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)VUILibraryStackViewController;
  -[VUILibraryStackViewController viewDidDisappear:](&v14, sel_viewDidDisappear_, a3);
  if (-[VUILibraryStackViewController isMovingFromParentViewController](self, "isMovingFromParentViewController"))
  {
    -[VUILibraryStackViewController childViewControllers](self, "childViewControllers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
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
          objc_msgSend(v9, "willMoveToParentViewController:", 0);
          objc_msgSend(v9, "removeFromParentViewController");
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
      }
      while (v6);
    }

  }
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

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;

  v12 = a4;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = v12;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v12, "viewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[VUILibraryStackViewController childViewControllers](self, "childViewControllers");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v9, "containsObject:", v8) & 1) != 0)
      {
        objc_msgSend(v8, "view");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isDescendantOfView:", v12);

        if (v11)
        {
          objc_msgSend(v8, "willMoveToParentViewController:", 0);
          objc_msgSend(v8, "removeFromParentViewController");
        }
      }
      else
      {

      }
    }

    v7 = v12;
  }

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)VUILibraryStackViewController;
  v7 = a4;
  -[VUILibraryStackViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __84__VUILibraryStackViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E9F99FC0;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, 0);

}

void __84__VUILibraryStackViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  if (objc_msgSend(*(id *)(a1 + 32), "isViewLoaded")
    && (objc_msgSend(*(id *)(a1 + 32), "view"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v2, "window"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        v2,
        v3))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1000), "collectionViewLayout");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidateLayout");

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "setNeedsLayout");
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 976) = 1;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackCollectionView, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_focusedIndexPath, 0);
}

@end
