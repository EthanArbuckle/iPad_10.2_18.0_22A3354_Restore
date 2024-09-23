@implementation VUIDebugViewController

- (VUIDebugViewController)init
{
  VUIDebugViewController *v2;
  VUIDebugViewDataSource *v3;
  VUIDebugViewDataSource *dataSource;
  NSArray *additionalMetricsTitles;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  id location;
  objc_super v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)VUIDebugViewController;
  v2 = -[VUIDebugViewController init](&v12, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(VUIDebugViewDataSource);
    dataSource = v2->_dataSource;
    v2->_dataSource = v3;

    additionalMetricsTitles = v2->_additionalMetricsTitles;
    v2->_additionalMetricsTitles = (NSArray *)&unk_1EA0BBB80;

    objc_initWeak(&location, v2);
    v13[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __30__VUIDebugViewController_init__block_invoke;
    v9[3] = &unk_1E9F99F98;
    objc_copyWeak(&v10, &location);
    v7 = (id)-[VUIDebugViewController registerForTraitChanges:withHandler:](v2, "registerForTraitChanges:withHandler:", v6, v9);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __30__VUIDebugViewController_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setRequiresRelayout:", 1);

}

- (int64_t)preferredStatusBarStyle
{
  return 0;
}

- (void)loadView
{
  VUIDebugContainerView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  VUIDebugContainerView *v8;
  void *v9;
  UICollectionView *v10;
  void *v11;
  void *v12;
  UICollectionView *collectionView;
  UICollectionView *v14;
  VUIDebugContainerView *containerView;
  VUIDebugContainerView *v16;
  id v17;

  v3 = [VUIDebugContainerView alloc];
  v4 = *MEMORY[0x1E0C9D648];
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v8 = -[VUIDebugContainerView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], v5, v6, v7);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemLightGrayColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIDebugContainerView setBackgroundColor:](v8, "setBackgroundColor:", v9);

  v17 = objc_alloc_init(MEMORY[0x1E0DC3610]);
  objc_msgSend(v17, "setScrollDirection:", 0);
  objc_msgSend(v17, "setMinimumLineSpacing:", 0.0);
  objc_msgSend(v17, "setMinimumInteritemSpacing:", 0.0);
  objc_msgSend(v17, "setSectionInset:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
  v10 = (UICollectionView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC35B8]), "initWithFrame:collectionViewLayout:", v17, v4, v5, v6, v7);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView setBackgroundColor:](v10, "setBackgroundColor:", v11);

  -[UICollectionView layer](v10, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setMasksToBounds:", 1);

  -[UICollectionView setShowsVerticalScrollIndicator:](v10, "setShowsVerticalScrollIndicator:", 0);
  -[UICollectionView setShowsHorizontalScrollIndicator:](v10, "setShowsHorizontalScrollIndicator:", 0);
  -[UICollectionView setAlwaysBounceVertical:](v10, "setAlwaysBounceVertical:", 1);
  -[UICollectionView setDelegate:](v10, "setDelegate:", self);
  -[UICollectionView setDataSource:](v10, "setDataSource:", self);
  -[UICollectionView setAutoresizingMask:](v10, "setAutoresizingMask:", 18);
  -[UICollectionView setOpaque:](v10, "setOpaque:", 0);
  -[UICollectionView registerClass:forCellWithReuseIdentifier:](v10, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("VUIDebugViewDefaultsCellReuseIdentifier"));
  -[UICollectionView registerClass:forCellWithReuseIdentifier:](v10, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("VUIDebugViewNavigationCellReuseIdentifier"));
  -[UICollectionView registerClass:forSupplementaryViewOfKind:withReuseIdentifier:](v10, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), *MEMORY[0x1E0DC48A8], CFSTR("VUIDebugViewHeaderReuseIdentifier"));
  collectionView = self->_collectionView;
  self->_collectionView = v10;
  v14 = v10;

  -[VUIDebugContainerView setCollectionView:](v8, "setCollectionView:", v14);
  containerView = self->_containerView;
  self->_containerView = v8;
  v16 = v8;

  -[VUIDebugViewController setView:](self, "setView:", self->_containerView);
  self->_requiresRelayout = 1;

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  +[VUIMetricsController sharedInstance](VUIMetricsController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsInDebugMode:", 1);

  v11.receiver = self;
  v11.super_class = (Class)VUIDebugViewController;
  -[VUIDebugViewController viewDidLoad](&v11, sel_viewDidLoad);
  -[VUIDebugViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNavigationBarHidden:", 0);

  -[VUIDebugViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "navigationBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPrefersLargeTitles:", 1);

  -[VUIDebugViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:", CFSTR("Debug"));

  -[VUIDebugViewController navigationController](self, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "navigationBar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3658], "vui_keyColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTintColor:", v10);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[VUIMetricsController sharedInstance](VUIMetricsController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsInDebugMode:", 0);

  v4.receiver = self;
  v4.super_class = (Class)VUIDebugViewController;
  -[VUIDebugViewController dealloc](&v4, sel_dealloc);
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VUIDebugViewController;
  -[VUIDebugViewController viewDidLayoutSubviews](&v4, sel_viewDidLayoutSubviews);
  if (self->_requiresRelayout)
  {
    -[UICollectionView collectionViewLayout](self->_collectionView, "collectionViewLayout");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "invalidateLayout");

    -[VUIDebugContainerView setNeedsLayout](self->_containerView, "setNeedsLayout");
    self->_requiresRelayout = 0;
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
  v9.super_class = (Class)VUIDebugViewController;
  v7 = a4;
  -[VUIDebugViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __77__VUIDebugViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E9F99FC0;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, 0);

}

void __77__VUIDebugViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
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
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "collectionViewLayout");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidateLayout");

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "setNeedsLayout");
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 968) = 1;
  }
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 3;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int64_t v10;

  v6 = a3;
  if (a4)
  {
    if (a4 == 2)
    {
      -[VUIDebugViewDataSource defaultsDataSource](self->_dataSource, "defaultsDataSource");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v7, "count");
    }
    else
    {
      if (a4 != 1)
      {
        v10 = 0;
        goto LABEL_9;
      }
      -[VUIDebugViewDataSource metricsDataSource](self->_dataSource, "metricsDataSource");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "count");
      -[VUIDebugViewController additionalMetricsTitles](self, "additionalMetricsTitles");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "count") + v8;

    }
  }
  else
  {
    v10 = 1;
  }
LABEL_9:

  return v10;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  double Width;
  double v6;
  CGSize result;
  CGRect v8;

  objc_msgSend(a3, "bounds");
  Width = CGRectGetWidth(v8);
  v6 = 60.0;
  result.height = v6;
  result.width = Width;
  return result;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "section"))
  {
    if (objc_msgSend(v7, "section") == 1)
    {
      -[VUIDebugViewDataSource metricsDataSource](self->_dataSource, "metricsDataSource");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "count");

      if (objc_msgSend(v7, "row") >= v9)
      {
        v14 = objc_msgSend(v7, "row") % v9;
        objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("VUIDebugViewNavigationCellReuseIdentifier"), v7);
        v11 = (id)objc_claimAutoreleasedReturnValue();
        -[VUIDebugViewController additionalMetricsTitles](self, "additionalMetricsTitles");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectAtIndexedSubscript:", v14);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "configureWithTitle:", v13);
        goto LABEL_10;
      }
      -[VUIDebugViewDataSource metricsDataSource](self->_dataSource, "metricsDataSource");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (objc_msgSend(v7, "section") != 2)
      {
        v11 = objc_alloc_init(MEMORY[0x1E0DC35C0]);
        goto LABEL_12;
      }
      -[VUIDebugViewDataSource defaultsDataSource](self->_dataSource, "defaultsDataSource");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v12 = v10;
    objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("VUIDebugViewDefaultsCellReuseIdentifier"), v7);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "configureCellWithDefaults:", v13);
LABEL_10:

    goto LABEL_12;
  }
  objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("VUIDebugViewNavigationCellReuseIdentifier"), v7);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "configureWithTitle:", CFSTR("UI Widgets"));
LABEL_12:

  return v11;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v6;
  void *v7;
  const __CFString *v8;

  v6 = a5;
  objc_msgSend(a3, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", *MEMORY[0x1E0DC48A8], CFSTR("VUIDebugViewHeaderReuseIdentifier"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "section"))
  {
    v8 = CFSTR("UI");
    goto LABEL_7;
  }
  if (objc_msgSend(v6, "section") == 1)
  {
    v8 = CFSTR("Metrics");
LABEL_7:
    objc_msgSend(v7, "configureHeaderViewWithTitle:", v8);
    goto LABEL_8;
  }
  if (objc_msgSend(v6, "section") == 2)
  {
    v8 = CFSTR("Application Defaults");
    goto LABEL_7;
  }
LABEL_8:

  return v7;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  VUIDebugMetricsEventControllerGenerator *v12;
  void *v13;
  VUIDebugMetricsEventControllerGenerator *v14;
  VUIMetricsRenderSessionListViewController *v15;
  void *v16;
  void *v17;
  VUIDocumentDataSource *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  VUIMetricsRenderSessionListViewController *v23;
  void *v24;
  id v25;

  v25 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "section"))
  {
    if (objc_msgSend(v6, "section") == 1)
    {
      v7 = objc_msgSend(v6, "row");
      -[VUIDebugViewDataSource metricsDataSource](self->_dataSource, "metricsDataSource");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "count");

      if (v7 == v9)
      {
        +[VUIMetricsController sharedInstance](VUIMetricsController, "sharedInstance");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "getRecentEventsForDebuggerUI");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = [VUIDebugMetricsEventControllerGenerator alloc];
        objc_msgSend(v11, "allObjects");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[VUIDebugMetricsEventControllerGenerator initWithMetrics:](v12, "initWithMetrics:", v13);

        -[VUIDebugMetricsEventControllerGenerator viewController](v14, "viewController");
        v15 = (VUIMetricsRenderSessionListViewController *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v23 = [VUIMetricsRenderSessionListViewController alloc];
        +[VUIMetricsDiskManager sharedInstance](VUIMetricsDiskManager, "sharedInstance");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = -[VUIMetricsRenderSessionListViewController initWithStorageDataSource:](v23, "initWithStorageDataSource:", v11);
      }

      -[VUIDebugViewController navigationController](self, "navigationController");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "pushViewController:animated:", v15, 1);

    }
    else if (objc_msgSend(v6, "section") == 2)
    {
      objc_msgSend(v25, "deselectItemAtIndexPath:animated:", v6, 0);
    }
  }
  else
  {
    +[VUITVAppLauncher sharedInstance](VUITVAppLauncher, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "appController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = -[VUIDocumentDataSource initWithDocumentRef:]([VUIDocumentDataSource alloc], "initWithDocumentRef:", CFSTR("UIMain"));
    +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "appContext");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "viewControllerWithDocumentDataSource:appContext:", v18, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    -[VUIDebugViewController navigationController](self, "navigationController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "pushViewController:animated:", v21, 1);

  }
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  double Width;
  double v6;
  CGSize result;
  CGRect v8;

  if ((unint64_t)a5 > 2)
  {
    Width = *MEMORY[0x1E0C9D820];
    v6 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  else
  {
    objc_msgSend(a3, "bounds");
    Width = CGRectGetWidth(v8);
    v6 = 56.0;
  }
  result.height = v6;
  result.width = Width;
  return result;
}

- (id)preferredFocusEnvironments
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[VUIDebugViewController collectionView](self, "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4
{
  return 1;
}

- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v6 = a4;
  objc_msgSend(v6, "nextFocusedIndexPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "previouslyFocusedIndexPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "cellForItemAtIndexPath:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "lightGrayColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBackgroundColor:", v11);

  if (v8)
  {
    objc_msgSend(v15, "cellForItemAtIndexPath:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  objc_msgSend(v12, "contentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBackgroundColor:", v14);

}

- (void)_dismissViewController
{
  -[VUIDebugViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (VUIDebugContainerView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_containerView, a3);
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (BOOL)requiresRelayout
{
  return self->_requiresRelayout;
}

- (void)setRequiresRelayout:(BOOL)a3
{
  self->_requiresRelayout = a3;
}

- (VUIDebugViewDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (NSArray)additionalMetricsTitles
{
  return self->_additionalMetricsTitles;
}

- (void)setAdditionalMetricsTitles:(id)a3
{
  objc_storeStrong((id *)&self->_additionalMetricsTitles, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalMetricsTitles, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
}

@end
