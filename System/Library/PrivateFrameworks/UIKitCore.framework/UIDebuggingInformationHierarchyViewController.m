@implementation UIDebuggingInformationHierarchyViewController

- (UIDebuggingInformationHierarchyViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  UIDebuggingInformationHierarchyViewController *v4;
  void *v5;
  void *v6;
  UIDebuggingInformationInspectorDetailViewController *v7;
  UIDebuggingInformationInspectorDetailViewController *detail;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)UIDebuggingInformationHierarchyViewController;
  v4 = -[UIViewController initWithNibName:bundle:](&v10, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
  {
    +[UIDebuggingInformationOverlay overlay](UIDebuggingInformationOverlay, "overlay");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "inspectedWindow");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDebuggingInformationHierarchyViewController setRootViewForInspection:](v4, "setRootViewForInspection:", v6);

    registerTouchObserver(v4);
    v7 = objc_alloc_init(UIDebuggingInformationInspectorDetailViewController);
    detail = v4->_detail;
    v4->_detail = v7;

  }
  return v4;
}

- (void)_showWindowChange
{
  void *v3;
  id v4;

  v4 = (id)objc_opt_new();
  -[UIViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pushViewController:animated:", v4, 1);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  UIBarButtonItem *v5;
  UIBarButtonItem *v6;
  NSArray *v7;
  NSArray *normalItems;
  UIView *v9;
  UILabel *v10;
  UILabel *v11;
  void *v12;
  UIBarButtonItem *v13;
  UIBarButtonItem *v14;
  UIBarButtonItem *v15;
  NSArray *v16;
  NSArray *showingOverlayItems;
  UIDebuggingInformationHierarchyLayout *v18;
  UICollectionView *v19;
  void *v20;
  UICollectionView *v21;
  void *v22;
  UICollectionView *collectionView;
  UICollectionView *v24;
  void *v25;
  UICollectionView *v26;
  void *v27;
  void *v28;
  void *v29;
  UIRefreshControl *v30;
  void *v31;
  void *v32;
  UIBarButtonItem *v33;
  objc_super v34;
  _QWORD v35[3];
  _QWORD v36[4];

  v36[3] = *MEMORY[0x1E0C80C00];
  v34.receiver = self;
  v34.super_class = (Class)UIDebuggingInformationHierarchyViewController;
  -[UIViewController viewDidLoad](&v34, sel_viewDidLoad);
  -[UIViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTranslucent:", 1);

  v33 = -[UIBarButtonItem initWithTitle:style:target:action:]([UIBarButtonItem alloc], "initWithTitle:style:target:action:", CFSTR("Window"), 0, self, sel__showWindowChange);
  v5 = -[UIBarButtonItem initWithTitle:style:target:action:]([UIBarButtonItem alloc], "initWithTitle:style:target:action:", CFSTR("Inspect"), 0, self, sel_chooseNewTarget_);
  v36[0] = v33;
  v6 = -[UIBarButtonItem initWithBarButtonSystemItem:target:action:]([UIBarButtonItem alloc], "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
  v36[1] = v6;
  v36[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 3);
  v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
  normalItems = self->_normalItems;
  self->_normalItems = v7;

  -[UIViewController setToolbarItems:](self, "setToolbarItems:", self->_normalItems);
  v9 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", 0.0, 0.0, 200.0, 44.0);
  v10 = [UILabel alloc];
  -[UIView bounds](v9, "bounds");
  v11 = -[UILabel initWithFrame:](v10, "initWithFrame:");
  -[UILabel setText:](v11, "setText:", CFSTR("Tap a view to inspect it."));
  objc_msgSend(off_1E167A828, "systemFontOfSize:", 12.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v11, "setFont:", v12);

  -[UILabel setTextAlignment:](v11, "setTextAlignment:", 1);
  -[UIView addSubview:](v9, "addSubview:", v11);
  v13 = -[UIBarButtonItem initWithBarButtonSystemItem:target:action:]([UIBarButtonItem alloc], "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
  v35[0] = v13;
  v14 = -[UIBarButtonItem initWithCustomView:]([UIBarButtonItem alloc], "initWithCustomView:", v9);
  v35[1] = v14;
  v15 = -[UIBarButtonItem initWithBarButtonSystemItem:target:action:]([UIBarButtonItem alloc], "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
  v35[2] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 3);
  v16 = (NSArray *)objc_claimAutoreleasedReturnValue();
  showingOverlayItems = self->_showingOverlayItems;
  self->_showingOverlayItems = v16;

  v18 = objc_alloc_init(UIDebuggingInformationHierarchyLayout);
  -[UIDebuggingInformationHierarchyLayout setDelegate:](v18, "setDelegate:", self);
  v19 = [UICollectionView alloc];
  -[UIViewController view](self, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bounds");
  v21 = -[UICollectionView initWithFrame:collectionViewLayout:](v19, "initWithFrame:collectionViewLayout:", v18);

  +[UIColor whiteColor](UIColor, "whiteColor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView setBackgroundColor:](v21, "setBackgroundColor:", v22);

  -[UICollectionView setDataSource:](v21, "setDataSource:", self);
  -[UICollectionView setDelegate:](v21, "setDelegate:", self);
  -[UIView setAutoresizingMask:](v21, "setAutoresizingMask:", 18);
  -[UICollectionView registerClass:forCellWithReuseIdentifier:](v21, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("reuseIdentifier"));
  -[UICollectionView registerClass:forSupplementaryViewOfKind:withReuseIdentifier:](v21, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), CFSTR("line"), CFSTR("separator-line"));
  collectionView = self->_collectionView;
  self->_collectionView = v21;
  v24 = v21;

  -[UIViewController view](self, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addSubview:", self->_collectionView);

  v26 = self->_collectionView;
  -[UIViewController view](self, "view");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "bounds");
  -[UICollectionView setFrame:](v26, "setFrame:");

  -[UIViewController view](self, "view");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIColor whiteColor](UIColor, "whiteColor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setBackgroundColor:", v29);

  v30 = objc_alloc_init(UIRefreshControl);
  -[UIDebuggingInformationHierarchyViewController setRefreshControl:](self, "setRefreshControl:", v30);

  -[UIDebuggingInformationHierarchyViewController refreshControl](self, "refreshControl");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "addTarget:action:forControlEvents:", self, sel_refresh_, 4096);

  -[UIDebuggingInformationHierarchyViewController refreshControl](self, "refreshControl");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScrollView setRefreshControl:](self->_collectionView, "setRefreshControl:", v32);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIDebuggingInformationHierarchyViewController;
  -[UIViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[UIDebuggingInformationHierarchyViewController refresh:](self, "refresh:", 0);
  -[UIDebuggingInformationHierarchyViewController highlightView:](self, "highlightView:", 0);
  -[UIViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setToolbarHidden:", 0);

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIDebuggingInformationHierarchyViewController;
  -[UIViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  -[UIViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setToolbarHidden:", 1);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIDebuggingInformationHierarchyViewController;
  -[UIViewController viewWillTransitionToSize:withTransitionCoordinator:](&v7, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  -[UIViewController view](self->_detail, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  objc_msgSend(v5, "setFrame:");

}

- (void)chooseNewTarget:(id)a3
{
  id v3;

  -[UIViewController setToolbarItems:animated:](self, "setToolbarItems:animated:", self->_showingOverlayItems, 1);
  +[UIDebuggingInformationOverlay overlay](UIDebuggingInformationOverlay, "overlay");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCheckingTouches:", 1);

}

- (void)didReceiveNewView:(id)a3
{
  void *v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  id v14;

  v14 = a3;
  -[UIViewController setToolbarItems:animated:](self, "setToolbarItems:animated:", self->_normalItems, 1);
  -[UIDebuggingInformationHierarchyViewController data](self, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v6 = 0;
    do
    {
      -[UIDebuggingInformationHierarchyViewController data](self, "data");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndexedSubscript:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "view");
      v9 = (id)objc_claimAutoreleasedReturnValue();

      if (v9 == v14)
      {
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v6, 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIDebuggingInformationHierarchyViewController collectionView](self, "collectionView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "selectItemAtIndexPath:animated:scrollPosition:", v10, 1, 1);

        -[UIDebuggingInformationHierarchyViewController highlightView:](self, "highlightView:", v14);
      }
      ++v6;
      -[UIDebuggingInformationHierarchyViewController data](self, "data");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count");

    }
    while (v6 < v13);
  }

}

- (void)refresh:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  +[UIDebuggingInformationOverlay overlay](UIDebuggingInformationOverlay, "overlay", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "inspectedWindow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDebuggingInformationHierarchyViewController setRootViewForInspection:](self, "setRootViewForInspection:", v5);

  -[UIDebuggingInformationHierarchyViewController refreshControl](self, "refreshControl");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[UIDebuggingInformationHierarchyViewController refreshControl](self, "refreshControl");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "endRefreshing");

  }
  -[UIDebuggingInformationHierarchyViewController collectionView](self, "collectionView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reloadData");

}

- (void)setRootViewForInspection:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_storeStrong((id *)&self->_rootViewForInspection, a3);
  v5 = v8;
  if (v8)
  {
    -[UIDebuggingInformationHierarchyViewController getViewsRecursiveWithLevel:forView:](self, "getViewsRecursiveWithLevel:forView:", 0, v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDebuggingInformationHierarchyViewController setData:](self, "setData:", v6);

    -[UIDebuggingInformationHierarchyViewController collectionView](self, "collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "reloadData");

    v5 = v8;
  }

}

- (id)getViewsRecursiveWithLevel:(unint64_t)a3 forView:(id)a4
{
  id v6;
  UIDebuggingInformationHierarchyDataContainer *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = -[UIDebuggingInformationHierarchyDataContainer initWithView:atLevel:]([UIDebuggingInformationHierarchyDataContainer alloc], "initWithView:atLevel:", v6, a3);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObjects:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(v6, "subviews");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    v13 = a3 + 1;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        -[UIDebuggingInformationHierarchyViewController getViewsRecursiveWithLevel:forView:](self, "getViewsRecursiveWithLevel:forView:", v13, *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v14));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObjectsFromArray:", v15);

        ++v14;
      }
      while (v11 != v14);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

  v16 = (void *)objc_msgSend(v8, "copy");
  return v16;
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIDebuggingInformationHierarchyViewController;
  -[UIViewController viewDidLayoutSubviews](&v5, sel_viewDidLayoutSubviews);
  -[NSArray lastObject](self->_normalItems, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIDebuggingInformationOverlay overlay](UIDebuggingInformationOverlay, "overlay");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEnabled:", objc_msgSend(v4, "isFullscreen") ^ 1);

}

- (void)displayDetailsForCell:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(a3, "indexPath");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[UIDebuggingInformationHierarchyViewController data](self, "data");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndexedSubscript:", objc_msgSend(v8, "row"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIDebuggingInformationInspectorDetailViewController inspectView:](self->_detail, "inspectView:", v6);
    -[UIViewController navigationController](self, "navigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pushViewController:animated:", self->_detail, 1);

  }
}

- (void)collapseBeneathCell:(id)a3
{
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  UICollectionView *collectionView;
  _QWORD v15[5];
  id v16;

  objc_msgSend(a3, "indexPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = -[UIDebuggingInformationHierarchyViewController indentationLevelForIndexPath:](self, "indentationLevelForIndexPath:", v4);
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", objc_msgSend(v4, "row") + 1, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_opt_new();
    if (-[UIDebuggingInformationHierarchyViewController indentationLevelForIndexPath:](self, "indentationLevelForIndexPath:", v6) <= v5)
    {
      v13 = v6;
    }
    else
    {
      do
      {
        v8 = objc_msgSend(v6, "row");
        -[UIDebuggingInformationHierarchyViewController data](self, "data");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "count");

        if (v8 < v10)
        {
          -[UIDebuggingInformationHierarchyViewController data](self, "data");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setCollapsed:", 1);

          objc_msgSend(v7, "addObject:", v6);
        }
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", objc_msgSend(v6, "row") + 1, 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v6 = v13;
      }
      while (-[UIDebuggingInformationHierarchyViewController indentationLevelForIndexPath:](self, "indentationLevelForIndexPath:", v13) > v5);
    }
    collectionView = self->_collectionView;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __69__UIDebuggingInformationHierarchyViewController_collapseBeneathCell___block_invoke;
    v15[3] = &unk_1E16B2218;
    v15[4] = self;
    v16 = v4;
    -[UICollectionView performBatchUpdates:completion:](collectionView, "performBatchUpdates:completion:", 0, v15);

  }
}

void __69__UIDebuggingInformationHierarchyViewController_collapseBeneathCell___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(*(id *)(a1 + 32), "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndexedSubscript:", objc_msgSend(*(id *)(a1 + 40), "row"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "collapsed");

  if ((v4 & 1) == 0)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1048), "scrollToItemAtIndexPath:atScrollPosition:animated:", *(_QWORD *)(a1 + 40), 1, 1);
}

- (void)expandBeneathCell:(id)a3
{
  void *v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  UICollectionView *collectionView;
  _QWORD v14[5];
  id v15;

  objc_msgSend(a3, "indexPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = -[UIDebuggingInformationHierarchyViewController indentationLevelForIndexPath:](self, "indentationLevelForIndexPath:", v4);
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", objc_msgSend(v4, "row") + 1, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[UIDebuggingInformationHierarchyViewController indentationLevelForIndexPath:](self, "indentationLevelForIndexPath:", v6) <= v5)
    {
      v12 = v6;
    }
    else
    {
      do
      {
        v7 = objc_msgSend(v6, "row");
        -[UIDebuggingInformationHierarchyViewController data](self, "data");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "count");

        if (v7 < v9)
        {
          -[UIDebuggingInformationHierarchyViewController data](self, "data");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setCollapsed:", 0);

        }
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", objc_msgSend(v6, "row") + 1, 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v6 = v12;
      }
      while (-[UIDebuggingInformationHierarchyViewController indentationLevelForIndexPath:](self, "indentationLevelForIndexPath:", v12) > v5);
    }
    collectionView = self->_collectionView;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __67__UIDebuggingInformationHierarchyViewController_expandBeneathCell___block_invoke;
    v14[3] = &unk_1E16B2218;
    v14[4] = self;
    v15 = v4;
    -[UICollectionView performBatchUpdates:completion:](collectionView, "performBatchUpdates:completion:", 0, v14);

  }
}

void __67__UIDebuggingInformationHierarchyViewController_expandBeneathCell___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(*(id *)(a1 + 32), "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndexedSubscript:", objc_msgSend(*(id *)(a1 + 40), "row"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "collapsed");

  if ((v4 & 1) == 0)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1048), "scrollToItemAtIndexPath:atScrollPosition:animated:", *(_QWORD *)(a1 + 40), 1, 1);
}

- (BOOL)shouldHighlightSelectedCells
{
  void *v2;
  char v3;

  +[UIDebuggingInformationOverlay overlay](UIDebuggingInformationOverlay, "overlay");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFullscreen") ^ 1;

  return v3;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v6 = a4;
  +[UIDebuggingInformationOverlay overlay](UIDebuggingInformationOverlay, "overlay");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isFullscreen");

  if (v8)
  {
    -[UIDebuggingInformationHierarchyViewController highlightView:](self, "highlightView:", 0);
    objc_msgSend(v15, "cellForItemAtIndexPath:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setNeedsLayout");
    objc_msgSend(v9, "deliverToggle");
  }
  else
  {
    objc_msgSend(v15, "cellForItemAtIndexPath:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setNeedsLayout");
    -[UIDebuggingInformationHierarchyViewController data](self, "data");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIDebuggingInformationHierarchyViewController highlightedView](self, "highlightedView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = v12;
    if (v12 == v13)
    {
      -[UICollectionView deselectItemAtIndexPath:animated:](self->_collectionView, "deselectItemAtIndexPath:animated:", v6, 0);
      v14 = 0;
    }
    -[UIDebuggingInformationHierarchyViewController highlightView:](self, "highlightView:", v14);

  }
}

- (BOOL)shouldCollapseAtIndexPath:(id)a3
{
  unint64_t v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  char v9;

  v4 = objc_msgSend(a3, "row");
  -[UIDebuggingInformationHierarchyViewController data](self, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v4 >= v6)
    v4 = v6;
  -[UIDebuggingInformationHierarchyViewController data](self, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "collapsed");

  return v9;
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  id v4;

  objc_msgSend(a3, "cellForItemAtIndexPath:", a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsLayout");

}

- (unint64_t)indentationLevelForIndexPath:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;

  v4 = a3;
  v5 = objc_msgSend(v4, "row");
  -[UIDebuggingInformationHierarchyViewController data](self, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v5 >= v7)
    goto LABEL_4;
  -[UIDebuggingInformationHierarchyViewController data](self, "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v4, "row"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[UIDebuggingInformationHierarchyViewController data](self, "data");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v4, "row"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "level");

  }
  else
  {
LABEL_4:
    v13 = 0;
  }

  return v13;
}

- (id)colorForIndentationLevel:(unint64_t)a3
{
  return +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", a3, 0.2, 1.0);
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[UIDebuggingInformationHierarchyViewController data](self, "data", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  __CFString *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  unint64_t v23;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("reuseIdentifier"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDebuggingInformationHierarchyViewController data](self, "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = CFSTR("Deallocated");
  }
  objc_msgSend(v7, "setName:", v12);
  objc_msgSend(v7, "setDelegate:", self);
  objc_msgSend(v7, "bounds");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  objc_msgSend(v7, "contentView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setFrame:", v14, v16, v18, v20);

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", objc_msgSend(v6, "row") + 1, objc_msgSend(v6, "section"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[UIDebuggingInformationHierarchyViewController indentationLevelForIndexPath:](self, "indentationLevelForIndexPath:", v22);
  if (v23 <= -[UIDebuggingInformationHierarchyViewController indentationLevelForIndexPath:](self, "indentationLevelForIndexPath:", v6))objc_msgSend(v7, "setDisclosureIndicatorHidden:", 1);

  return v7;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  return (id)objc_msgSend(a3, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", a4, CFSTR("separator-line"), a5);
}

- (void)highlightView:(id)a3
{
  UIView *highlightedView;
  CGColor *originalBorderColor;
  void *v6;
  double originalBorderWidth;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  id v19;

  v19 = a3;
  highlightedView = self->_highlightedView;
  if (highlightedView)
  {
    originalBorderColor = self->_originalBorderColor;
    -[UIView layer](highlightedView, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBorderColor:", originalBorderColor);

    originalBorderWidth = self->_originalBorderWidth;
    -[UIView layer](self->_highlightedView, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBorderWidth:", originalBorderWidth);

  }
  -[UIDebuggingInformationHierarchyViewController setHighlightedView:](self, "setHighlightedView:", v19);
  objc_msgSend(v19, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  self->_originalBorderColor = (CGColor *)objc_msgSend(v9, "borderColor");

  objc_msgSend(v19, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "borderWidth");
  self->_originalBorderWidth = v11;

  +[UIColor redColor](UIColor, "redColor");
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v13 = objc_msgSend(v12, "CGColor");
  -[UIView layer](self->_highlightedView, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setBorderColor:", v13);

  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "scale");
  v17 = 1.0 / v16;
  -[UIView layer](self->_highlightedView, "layer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setBorderWidth:", v17);

}

- (NSMutableArray)keys
{
  return self->_keys;
}

- (void)setKeys:(id)a3
{
  objc_storeStrong((id *)&self->_keys, a3);
}

- (NSMutableDictionary)managedValues
{
  return self->_managedValues;
}

- (void)setManagedValues:(id)a3
{
  objc_storeStrong((id *)&self->_managedValues, a3);
}

- (NSMutableDictionary)observersForKeys
{
  return self->_observersForKeys;
}

- (void)setObserversForKeys:(id)a3
{
  objc_storeStrong((id *)&self->_observersForKeys, a3);
}

- (NSMutableDictionary)controlsForKeys
{
  return self->_controlsForKeys;
}

- (void)setControlsForKeys:(id)a3
{
  objc_storeStrong((id *)&self->_controlsForKeys, a3);
}

- (NSArray)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (UIView)rootViewForInspection
{
  return self->_rootViewForInspection;
}

- (UIRefreshControl)refreshControl
{
  return self->_refreshControl;
}

- (void)setRefreshControl:(id)a3
{
  objc_storeStrong((id *)&self->_refreshControl, a3);
}

- (UIView)highlightedView
{
  return self->_highlightedView;
}

- (void)setHighlightedView:(id)a3
{
  objc_storeStrong((id *)&self->_highlightedView, a3);
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (CGColor)originalBorderColor
{
  return self->_originalBorderColor;
}

- (void)setOriginalBorderColor:(CGColor *)a3
{
  self->_originalBorderColor = a3;
}

- (double)originalBorderWidth
{
  return self->_originalBorderWidth;
}

- (void)setOriginalBorderWidth:(double)a3
{
  self->_originalBorderWidth = a3;
}

- (UIDebuggingInformationInspectorDetailViewController)detail
{
  return self->_detail;
}

- (void)setDetail:(id)a3
{
  objc_storeStrong((id *)&self->_detail, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detail, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_highlightedView, 0);
  objc_storeStrong((id *)&self->_refreshControl, 0);
  objc_storeStrong((id *)&self->_rootViewForInspection, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_controlsForKeys, 0);
  objc_storeStrong((id *)&self->_observersForKeys, 0);
  objc_storeStrong((id *)&self->_managedValues, 0);
  objc_storeStrong((id *)&self->_keys, 0);
  objc_storeStrong((id *)&self->_normalItems, 0);
  objc_storeStrong((id *)&self->_showingOverlayItems, 0);
}

@end
