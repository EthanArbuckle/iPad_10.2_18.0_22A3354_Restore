@implementation MTAWorldClockPadViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (MTAWorldClockPadViewController)init
{
  MTAWorldClockPadViewController *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSUserActivity *userActivity;
  MTAWorldClockPadViewController *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MTAWorldClockPadViewController;
  v2 = -[MTAWorldClockPadViewController init](&v12, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("WORLD_CLOCK"), &stru_10009A4D0, 0));
    -[MTAWorldClockPadViewController setTitle:](v2, "setTitle:", v4);

    -[MTAWorldClockPadViewController setEdgesForExtendedLayout:](v2, "setEdgesForExtendedLayout:", 4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("globe")));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockPadViewController tabBarItem](v2, "tabBarItem"));
    objc_msgSend(v6, "setImage:", v5);

    v2->_addedClockIndex = 0x7FFFFFFFFFFFFFFFLL;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockPadViewController title](v2, "title"));
    v8 = objc_claimAutoreleasedReturnValue(+[NSUserActivity mtUserActivityWithActivityType:title:](NSUserActivity, "mtUserActivityWithActivityType:title:", CFSTR("com.apple.clock.worldclock"), v7));
    userActivity = v2->_userActivity;
    v2->_userActivity = (NSUserActivity *)v8;

    v10 = v2;
  }

  return v2;
}

- (void)restoreWithUserActivity:(id)a3
{
  +[MTAAddClockViewController addCityFromUserActivity:parentViewController:](MTAAddClockViewController, "addCityFromUserActivity:parentViewController:", a3, self);
}

- (BOOL)shouldShowAddView
{
  return self->_addClockNavigationController == 0;
}

- (void)showAddView
{
  UINavigationController *v3;
  UINavigationController *addClockNavigationController;
  void *v5;
  void *v6;
  void *v7;
  MTAAddClockViewController *v8;

  if (-[MTAWorldClockPadViewController shouldShowAddView](self, "shouldShowAddView"))
  {
    v8 = objc_alloc_init(MTAAddClockViewController);
    -[MTAAddClockViewController setDelegate:](v8, "setDelegate:", self);
    v3 = (UINavigationController *)objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v8);
    addClockNavigationController = self->_addClockNavigationController;
    self->_addClockNavigationController = v3;

    -[UINavigationController setModalPresentationStyle:](self->_addClockNavigationController, "setModalPresentationStyle:", 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController presentationController](self->_addClockNavigationController, "presentationController"));
    objc_msgSend(v5, "setDelegate:", self);

    -[MTAWorldClockPadViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", self->_addClockNavigationController, 1, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTAStateStore shared](MTAStateStore, "shared"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTAStateStoreEvent eventWithType:](MTAStateStoreEvent, "eventWithType:", 3));
    objc_msgSend(v6, "pushEvent:", v7);

  }
}

- (void)addClock:(id)a3
{
  -[MTAWorldClockPadViewController setEditing:](self, "setEditing:", 0);
  -[MTAWorldClockPadViewController showAddView](self, "showAddView");
}

- (BOOL)shouldToggleEditView
{
  return self->_addClockNavigationController == 0;
}

- (void)toggleEditView
{
  if (-[MTAWorldClockPadViewController shouldToggleEditView](self, "shouldToggleEditView"))
    -[MTAWorldClockPadViewController setEditing:](self, "setEditing:", -[MTAWorldClockPadViewController isEditing](self, "isEditing") ^ 1);
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MTAWorldClockPadViewController;
  -[MTAWorldClockPadViewController setEditing:animated:](&v10, "setEditing:animated:", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockPadViewController collectionViewController](self, "collectionViewController"));
  objc_msgSend(v6, "setEditing:", v4);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTAStateStore shared](MTAStateStore, "shared"));
  if (v4)
    v8 = 5;
  else
    v8 = 4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MTAStateStoreEvent eventWithType:](MTAStateStoreEvent, "eventWithType:", v8));
  objc_msgSend(v7, "pushEvent:", v9);

}

- (void)updateClocksForSize:(CGSize)a3 transitionCoordinator:(id)a4
{
  double height;
  double width;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  NSString *v13;
  _BOOL4 IsAccessibilityCategory;
  NSComparisonResult v15;
  void *v16;
  double v17;
  double v18;
  float v19;
  float v20;
  unint64_t v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;

  height = a3.height;
  width = a3.width;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockPadViewController collectionViewController](self, "collectionViewController", a4));
  v31 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "collectionView"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockPadViewController collectionViewController](self, "collectionViewController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "collectionViewLayout"));

  if (v31 && v9)
  {
    if (width > height)
      v10 = 1;
    else
      v10 = 2;
    v11 = objc_msgSend(v9, "rowsPerPage");
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v13 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "preferredContentSizeCategory"));

    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v13);
    v15 = UIContentSizeCategoryCompareToCategory(v13, UIContentSizeCategoryAccessibilityLarge);
    if (IsAccessibilityCategory)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
      objc_msgSend(v16, "_scaledValueForValue:", 150.0);
      v18 = v17;

    }
    else
    {
      v18 = 225.0;
    }
    if (width <= height)
    {
      v20 = 3.0;
      if (IsAccessibilityCategory)
        v20 = 2.0;
    }
    else
    {
      v19 = width / v18;
      v20 = floorf(v19);
    }
    if (v15 == NSOrderedDescending)
      v21 = 1;
    else
      v21 = (unint64_t)v20;
    v22 = objc_msgSend(v9, "columnsPerPage");
    if (v11 != (id)v10 || v22 != (id)v21)
    {
      objc_msgSend(v9, "setRowsPerPage:", v10);
      objc_msgSend(v9, "setColumnsPerPage:", v21);
      objc_msgSend(v9, "setScrollDirection:", width > height);
      if (width <= height)
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockPadViewController horizontalMapHeightConstraint](self, "horizontalMapHeightConstraint"));
        objc_msgSend(v29, "setActive:", 0);

        v25 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockPadViewController verticalMapHeightConstraint](self, "verticalMapHeightConstraint"));
        objc_msgSend(v25, "setActive:", 1);
      }
      else
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockPadViewController verticalMapHeightConstraint](self, "verticalMapHeightConstraint"));
        objc_msgSend(v23, "setActive:", 0);

        v24 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockPadViewController horizontalMapHeightConstraint](self, "horizontalMapHeightConstraint"));
        objc_msgSend(v24, "setActive:", 1);

        v25 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockPadViewController collectionViewController](self, "collectionViewController"));
        objc_msgSend(v25, "cellHeight");
        v27 = -v26;
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockPadViewController horizontalMapHeightConstraint](self, "horizontalMapHeightConstraint"));
        objc_msgSend(v28, "setConstant:", v27);

      }
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "collectionViewLayout"));
      objc_msgSend(v30, "invalidateLayout");

      objc_msgSend(v31, "setShowsHorizontalScrollIndicator:", width > height);
      objc_msgSend(v31, "setShowsVerticalScrollIndicator:", width <= height);
    }

  }
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (id)contentScrollView
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockPadViewController collectionViewController](self, "collectionViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "contentScrollView"));

  return v3;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  MTAWorldClockCollectionViewController *v14;
  MTAWorldClockGridLayout *v15;
  MTAWorldClockCollectionViewController *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  MTAWorldClockMapView *v25;
  void *v26;
  void *v27;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)MTAWorldClockPadViewController;
  -[MTAWorldClockPadViewController viewDidLoad](&v28, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockPadViewController editButtonItem](self, "editButtonItem"));
  objc_msgSend(v3, "setTarget:", self);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockPadViewController editButtonItem](self, "editButtonItem"));
  objc_msgSend(v4, "setAction:", "toggleEditView");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockPadViewController editButtonItem](self, "editButtonItem"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockPadViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v6, "setLeftBarButtonItem:", v5);

  v7 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 4, self, "addClock:");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockPadViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v8, "setRightBarButtonItem:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v9, "addObserver:selector:name:object:", self, "handleApplicationDidEnterBackground", UIApplicationDidEnterBackgroundNotification, 0);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v10, "addObserver:selector:name:object:", self, "handleApplicationWillEnterForeground", UIApplicationWillEnterForegroundNotification, 0);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v11, "addObserver:selector:name:object:", self, "handleContentSizeChange:", UIContentSizeCategoryDidChangeNotification, 0);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_backgroundColor](UIColor, "mtui_backgroundColor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockPadViewController view](self, "view"));
  objc_msgSend(v13, "setBackgroundColor:", v12);

  v14 = [MTAWorldClockCollectionViewController alloc];
  v15 = objc_opt_new(MTAWorldClockGridLayout);
  v16 = -[MTAWorldClockCollectionViewController initWithCollectionViewLayout:](v14, "initWithCollectionViewLayout:", v15);
  -[MTAWorldClockPadViewController setCollectionViewController:](self, "setCollectionViewController:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockPadViewController collectionViewController](self, "collectionViewController"));
  objc_msgSend(v17, "setDelegate:", self);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockPadViewController collectionViewController](self, "collectionViewController"));
  -[MTAWorldClockPadViewController addChildViewController:](self, "addChildViewController:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockPadViewController collectionViewController](self, "collectionViewController"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "view"));
  objc_msgSend(v20, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockPadViewController view](self, "view"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockPadViewController collectionViewController](self, "collectionViewController"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "view"));
  objc_msgSend(v21, "addSubview:", v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockPadViewController collectionViewController](self, "collectionViewController"));
  objc_msgSend(v24, "didMoveToParentViewController:", self);

  v25 = -[MTAWorldClockMapView initWithFrame:]([MTAWorldClockMapView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[MTAWorldClockPadViewController setMapView:](self, "setMapView:", v25);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockPadViewController view](self, "view"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockPadViewController mapView](self, "mapView"));
  objc_msgSend(v26, "addSubview:", v27);

  -[MTAWorldClockPadViewController setupConstraints](self, "setupConstraints");
}

- (void)setupConstraints
{
  void *v3;
  void *v4;
  NSMutableArray *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
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
  void *v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;

  v44 = (id)objc_claimAutoreleasedReturnValue(-[MTAWorldClockPadViewController mapView](self, "mapView"));
  objc_msgSend(v44, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockPadViewController collectionViewController](self, "collectionViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "view"));

  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v5 = objc_opt_new(NSMutableArray);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "topAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockPadViewController view](self, "view"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:", v8));
  -[NSMutableArray addObject:](v5, "addObject:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "leadingAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockPadViewController view](self, "view"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "leadingAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v12));
  -[NSMutableArray addObject:](v5, "addObject:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "trailingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockPadViewController view](self, "view"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "trailingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v16));
  -[NSMutableArray addObject:](v5, "addObject:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "heightAnchor"));
  -[MTAWorldClockPadViewController mapHeight](self, "mapHeight");
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToConstant:"));
  -[MTAWorldClockPadViewController setVerticalMapHeightConstraint:](self, "setVerticalMapHeightConstraint:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "heightAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockPadViewController view](self, "view"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "safeAreaLayoutGuide"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "heightAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockPadViewController collectionViewController](self, "collectionViewController"));
  objc_msgSend(v24, "cellHeight");
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:constant:", v23, -v25));
  -[MTAWorldClockPadViewController setHorizontalMapHeightConstraint:](self, "setHorizontalMapHeightConstraint:", v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "leadingAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockPadViewController view](self, "view"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "leadingAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v29));
  -[NSMutableArray addObject:](v5, "addObject:", v30);

  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "trailingAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockPadViewController view](self, "view"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "trailingAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:", v33));
  -[NSMutableArray addObject:](v5, "addObject:", v34);

  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "bottomAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:", v36));
  -[NSMutableArray addObject:](v5, "addObject:", v37);

  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bottomAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockPadViewController view](self, "view"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "safeAreaLayoutGuide"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "bottomAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:constant:", v41, 0.0));
  -[MTAWorldClockPadViewController setCollectionBottomConstraint:](self, "setCollectionBottomConstraint:", v42);

  v43 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockPadViewController collectionBottomConstraint](self, "collectionBottomConstraint"));
  -[NSMutableArray addObject:](v5, "addObject:", v43);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v5);
}

- (double)mapHeight
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double Height;
  void *v8;
  double v9;
  double v10;
  double v11;
  CGRect v13;
  CGRect v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockPadViewController collectionViewController](self, "collectionViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "collectionViewLayout"));

  if (objc_msgSend(v4, "scrollDirection") == (id)1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockPadViewController view](self, "view"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "safeAreaLayoutGuide"));
    objc_msgSend(v6, "layoutFrame");
    Height = CGRectGetHeight(v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockPadViewController collectionViewController](self, "collectionViewController"));
    objc_msgSend(v8, "cellHeight");
    v10 = Height - v9;

  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockPadViewController view](self, "view"));
    objc_msgSend(v5, "bounds");
    +[MTAWorldClockMapView mapHeightForWidth:](MTAWorldClockMapView, "mapHeightForWidth:", CGRectGetWidth(v14));
    v10 = v11;
  }

  return v10;
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v8;
  void *v9;
  double v10;
  double v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MTAWorldClockPadViewController;
  -[MTAWorldClockPadViewController viewWillLayoutSubviews](&v12, "viewWillLayoutSubviews");
  if (!self->_initializedCurrentPage)
  {
    self->_initializedCurrentPage = 1;
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockPadViewController collectionViewController](self, "collectionViewController"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "collectionView"));

    objc_msgSend(v4, "contentSize");
    if (v6 == CGSizeZero.width && v5 == CGSizeZero.height)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collectionViewLayout"));
      objc_msgSend(v8, "invalidateLayout");

    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockPadViewController view](self, "view"));
    objc_msgSend(v9, "bounds");
    -[MTAWorldClockPadViewController updateClocksForSize:transitionCoordinator:](self, "updateClocksForSize:transitionCoordinator:", 0, v10, v11);

  }
}

- (void)startUpdates
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockPadViewController mapView](self, "mapView"));
  objc_msgSend(v3, "startUpdatingTime");

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockPadViewController collectionViewController](self, "collectionViewController", 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collectionView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "visibleCells"));

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v10), "start");
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)stopUpdates
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockPadViewController mapView](self, "mapView"));
  objc_msgSend(v3, "stopUpdatingTime");

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockPadViewController collectionViewController](self, "collectionViewController", 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collectionView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "visibleCells"));

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v10), "stop");
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)MTAWorldClockPadViewController;
  -[MTAWorldClockPadViewController viewWillAppear:](&v17, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[WorldClockManager sharedManager](WorldClockManager, "sharedManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cities"));

  if (!v5)
    objc_msgSend(v4, "loadCities");
  if (self->_initializedCurrentPage)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockPadViewController view](self, "view"));
    objc_msgSend(v6, "bounds");
    -[MTAWorldClockPadViewController updateClocksForSize:transitionCoordinator:](self, "updateClocksForSize:transitionCoordinator:", 0, v7, v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockPadViewController collectionViewController](self, "collectionViewController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "collectionView"));
    objc_msgSend(v10, "reloadData");

  }
  if (!v5 || self->_initializedCurrentPage)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockPadViewController mapView](self, "mapView"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cities"));
    objc_msgSend(v11, "setCities:", v12);

  }
  -[MTAWorldClockPadViewController startUpdates](self, "startUpdates");
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockPadViewController deferAddedCity](self, "deferAddedCity"));

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockPadViewController deferAddedCity](self, "deferAddedCity"));
    -[MTAWorldClockPadViewController addCityWithoutUserInteraction:](self, "addCityWithoutUserInteraction:", v14);

    -[MTAWorldClockPadViewController setDeferAddedCity:](self, "setDeferAddedCity:", 0);
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockPadViewController deferRemovedCity](self, "deferRemovedCity"));

  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockPadViewController deferRemovedCity](self, "deferRemovedCity"));
    -[MTAWorldClockPadViewController removeCityWithoutUserInteraction:](self, "removeCityWithoutUserInteraction:", v16);

    -[MTAWorldClockPadViewController setDeferRemovedCity:](self, "setDeferRemovedCity:", 0);
  }

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void (**viewLoadedAction)(void);
  id v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)MTAWorldClockPadViewController;
  -[MTAWorldClockPadViewController viewDidAppear:](&v14, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserActivity keywords](self->_userActivity, "keywords"));
  v5 = v4;
  if (!v4)
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[WorldClockManager sharedManager](WorldClockManager, "sharedManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cities"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "na_map:", &stru_100099268));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "setByAddingObjectsFromArray:", v8));
  -[NSUserActivity setKeywords:](self->_userActivity, "setKeywords:", v9);

  if (!v4)
  -[NSUserActivity becomeCurrent](self->_userActivity, "becomeCurrent");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockPadViewController collectionViewController](self, "collectionViewController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "collectionView"));
  objc_msgSend(v11, "flashScrollIndicators");

  viewLoadedAction = (void (**)(void))self->_viewLoadedAction;
  if (viewLoadedAction)
  {
    viewLoadedAction[2]();
    v13 = self->_viewLoadedAction;
    self->_viewLoadedAction = 0;

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[NSUserActivity resignCurrent](self->_userActivity, "resignCurrent");
  -[MTAWorldClockPadViewController stopUpdates](self, "stopUpdates");
  v5.receiver = self;
  v5.super_class = (Class)MTAWorldClockPadViewController;
  -[MTAWorldClockPadViewController viewWillDisappear:](&v5, "viewWillDisappear:", v3);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[5];
  id v21;
  objc_super v22;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)MTAWorldClockPadViewController;
  -[MTAWorldClockPadViewController viewWillTransitionToSize:withTransitionCoordinator:](&v22, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockPadViewController collectionViewController](self, "collectionViewController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "collectionView"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "indexPathsForVisibleItems"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "sortedArrayUsingComparator:", &stru_1000992A8));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockPadViewController mapView](self, "mapView"));
  objc_msgSend(v13, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockPadViewController view](self, "view"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "window"));

  if (v15 && width >= 668.0)
    -[MTAWorldClockPadViewController updateClocksForSize:transitionCoordinator:](self, "updateClocksForSize:transitionCoordinator:", v7, width, height);
  v19 = v9;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10000E468;
  v20[3] = &unk_1000992D0;
  v20[4] = self;
  v21 = v12;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10000E4CC;
  v18[3] = &unk_1000992F8;
  v16 = v9;
  v17 = v12;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v20, v18);

}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6;
  void *v7;
  id v8;
  UINavigationController *v9;
  UINavigationController *addClockNavigationController;
  _QWORD v11[5];
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MTAWorldClockPadViewController;
  -[MTAWorldClockPadViewController willTransitionToTraitCollection:withTransitionCoordinator:](&v12, "willTransitionToTraitCollection:withTransitionCoordinator:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockPadViewController traitCollection](self, "traitCollection"));
  if (objc_msgSend(v7, "horizontalSizeClass") == (id)2)
  {
    v8 = objc_msgSend(v6, "horizontalSizeClass");

    if (v8 == (id)1)
    {
      if (self->_addClockNavigationController)
      {
        v9 = (UINavigationController *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockPadViewController presentedViewController](self, "presentedViewController"));
        addClockNavigationController = self->_addClockNavigationController;

        if (v9 == addClockNavigationController)
        {
          v11[0] = _NSConcreteStackBlock;
          v11[1] = 3221225472;
          v11[2] = sub_10000E5E0;
          v11[3] = &unk_100099320;
          v11[4] = self;
          -[MTAWorldClockPadViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v11);
        }
      }
    }
  }
  else
  {

  }
}

- (void)handleApplicationWillEnterForeground
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockPadViewController mapView](self, "mapView"));
  objc_msgSend(v3, "startUpdatingTime");

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockPadViewController collectionViewController](self, "collectionViewController", 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collectionView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "visibleCells"));

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v10), "start");
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)handleApplicationDidEnterBackground
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockPadViewController mapView](self, "mapView"));
  objc_msgSend(v3, "stopUpdatingTime");

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockPadViewController collectionViewController](self, "collectionViewController", 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collectionView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "visibleCells"));

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v10), "start");
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)handleContentSizeChange:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockPadViewController collectionViewController](self, "collectionViewController", a3));
  objc_msgSend(v4, "handleContentSizeChange");

  v5 = (id)objc_claimAutoreleasedReturnValue(-[MTAWorldClockPadViewController view](self, "view"));
  objc_msgSend(v5, "setNeedsUpdateConstraints");

}

- (void)collectionView:(id)a3 didRemoveCity:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockPadViewController mapView](self, "mapView"));
  objc_msgSend(v6, "removeCity:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[WorldClockManager sharedManager](WorldClockManager, "sharedManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cities"));
  v9 = objc_msgSend(v8, "count");

  if (!v9)
    -[MTAWorldClockPadViewController setEditing:](self, "setEditing:", 0);
}

- (void)setStatusBarStyle:(int64_t)a3
{
  self->_statusBarStyle = a3;
  -[MTAWorldClockPadViewController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
}

- (void)setPrefersStatusBarHidden:(BOOL)a3
{
  self->_prefersStatusBarHidden = a3;
  -[MTAWorldClockPadViewController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
}

- (int64_t)preferredStatusBarStyle
{
  return self->_statusBarStyle;
}

- (BOOL)prefersStatusBarHidden
{
  return self->_prefersStatusBarHidden;
}

- (void)addCityWithoutUserInteraction:(id)a3
{
  -[MTAWorldClockPadViewController addClockViewController:addCity:](self, "addClockViewController:addCity:", 0, a3);
  -[MTAWorldClockPadViewController dismissAddViewController:](self, "dismissAddViewController:", 0);
}

- (void)addClockViewController:(id)a3 addCity:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[WorldClockManager sharedManager](WorldClockManager, "sharedManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockPadViewController collectionViewController](self, "collectionViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "collectionView"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cities"));
  v10 = objc_msgSend(v9, "count");

  v11 = objc_msgSend(v6, "addCity:", v5);
  if (v11 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v12 = 0;
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", v11, 0));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cities"));
    v14 = objc_msgSend(v13, "count");

    if (v10 != v14)
    {
      objc_msgSend(v6, "saveCities");
      v17 = v12;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v17, 1));
      objc_msgSend(v8, "insertItemsAtIndexPaths:", v15);

      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "collectionViewLayout"));
      objc_msgSend(v16, "invalidateLayout");

      +[MTAnalytics incrementEventCount:](MTAnalytics, "incrementEventCount:", kMTCAWorldClockAdds);
    }
  }
  self->_addedClockIndex = (int64_t)v11;

}

- (void)removeCityWithoutUserInteraction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[WorldClockManager sharedManager](WorldClockManager, "sharedManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cities"));
  v7 = objc_msgSend(v6, "indexOfObject:", v4);

  if (v7 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(-[MTAWorldClockPadViewController collectionViewController](self, "collectionViewController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v7, 0));
    objc_msgSend(v9, "removeCityAtIndexPath:", v8);

  }
}

- (void)dismissAddViewController:(id)a3
{
  UINavigationController *addClockNavigationController;
  _QWORD v5[5];

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000EC9C;
  v5[3] = &unk_100099320;
  v5[4] = self;
  -[MTAWorldClockPadViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v5);
  addClockNavigationController = self->_addClockNavigationController;
  self->_addClockNavigationController = 0;

}

- (void)presentationControllerWillDismiss:(id)a3
{
  UINavigationController *addClockNavigationController;

  -[MTAWorldClockPadViewController finishAddViewControllerDismissal:](self, "finishAddViewControllerDismissal:", 1);
  addClockNavigationController = self->_addClockNavigationController;
  self->_addClockNavigationController = 0;

}

- (void)finishAddViewControllerDismissal:(BOOL)a3
{
  int64_t addedClockIndex;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  addedClockIndex = self->_addedClockIndex;
  if (addedClockIndex != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[MTAWorldClockPadViewController scrollToCityAtIndex:animated:](self, "scrollToCityAtIndex:animated:", addedClockIndex, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[WorldClockManager sharedManager](WorldClockManager, "sharedManager"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cities"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", self->_addedClockIndex));

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockPadViewController mapView](self, "mapView"));
    objc_msgSend(v8, "addCity:", v7);

    self->_addedClockIndex = 0x7FFFFFFFFFFFFFFFLL;
  }
  v10 = (id)objc_claimAutoreleasedReturnValue(+[MTAStateStore shared](MTAStateStore, "shared"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MTAStateStoreEvent eventWithType:](MTAStateStoreEvent, "eventWithType:", 4));
  objc_msgSend(v10, "pushEvent:", v9);

}

- (void)scrollToCityAtIndex:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[MTAWorldClockPadViewController collectionViewController](self, "collectionViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", a3, 0));
  objc_msgSend(v7, "scrollToPageContainingIndexPath:animated:", v6, v4);

}

- (void)reloadState
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[WorldClockManager sharedManager](WorldClockManager, "sharedManager"));
  objc_msgSend(v2, "loadCities");

}

- (void)saveState
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[WorldClockManager sharedManager](WorldClockManager, "sharedManager"));
  objc_msgSend(v2, "saveCities");

}

- (void)restoreIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  char *v12;
  void *v13;
  uint64_t v14;
  id v15;

  v15 = a3;
  v4 = objc_msgSend(v15, "section");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockPadViewController collectionViewController](self, "collectionViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "collectionView"));
  if ((uint64_t)v4 >= (uint64_t)objc_msgSend(v6, "numberOfSections"))
  {
LABEL_7:

    goto LABEL_8;
  }
  v7 = objc_msgSend(v15, "row");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockPadViewController collectionViewController](self, "collectionViewController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "collectionView"));
  v10 = objc_msgSend(v9, "numberOfItemsInSection:", objc_msgSend(v15, "section"));

  if ((uint64_t)v7 < (uint64_t)v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    v12 = (char *)objc_msgSend(v11, "orientation") - 3;

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockPadViewController collectionViewController](self, "collectionViewController"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "collectionView"));
    v6 = v13;
    if ((unint64_t)v12 >= 2)
      v14 = 4;
    else
      v14 = 32;
    objc_msgSend(v13, "scrollToItemAtIndexPath:atScrollPosition:animated:", v15, v14, 0);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)prepareStateForUrlLaunch
{
  UINavigationController *addClockNavigationController;
  id viewLoadedAction;

  addClockNavigationController = self->_addClockNavigationController;
  self->_addClockNavigationController = 0;

  viewLoadedAction = self->_viewLoadedAction;
  self->_viewLoadedAction = 0;

}

- (id)deferAddedCity
{
  return self->deferAddedCity;
}

- (void)setDeferAddedCity:(id)a3
{
  objc_storeStrong((id *)&self->deferAddedCity, a3);
}

- (id)deferRemovedCity
{
  return self->deferRemovedCity;
}

- (void)setDeferRemovedCity:(id)a3
{
  objc_storeStrong((id *)&self->deferRemovedCity, a3);
}

- (id)viewLoadedAction
{
  return self->_viewLoadedAction;
}

- (void)setViewLoadedAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (MTAWorldClockCollectionViewController)collectionViewController
{
  return self->_collectionViewController;
}

- (void)setCollectionViewController:(id)a3
{
  objc_storeStrong((id *)&self->_collectionViewController, a3);
}

- (MTAWorldClockMapView)mapView
{
  return self->_mapView;
}

- (void)setMapView:(id)a3
{
  objc_storeStrong((id *)&self->_mapView, a3);
}

- (NSLayoutConstraint)verticalMapHeightConstraint
{
  return self->_verticalMapHeightConstraint;
}

- (void)setVerticalMapHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_verticalMapHeightConstraint, a3);
}

- (NSLayoutConstraint)horizontalMapHeightConstraint
{
  return self->_horizontalMapHeightConstraint;
}

- (void)setHorizontalMapHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_horizontalMapHeightConstraint, a3);
}

- (NSLayoutConstraint)collectionBottomConstraint
{
  return self->_collectionBottomConstraint;
}

- (void)setCollectionBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_collectionBottomConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionBottomConstraint, 0);
  objc_storeStrong((id *)&self->_horizontalMapHeightConstraint, 0);
  objc_storeStrong((id *)&self->_verticalMapHeightConstraint, 0);
  objc_storeStrong((id *)&self->_mapView, 0);
  objc_storeStrong((id *)&self->_collectionViewController, 0);
  objc_storeStrong(&self->_viewLoadedAction, 0);
  objc_storeStrong((id *)&self->deferRemovedCity, 0);
  objc_storeStrong((id *)&self->deferAddedCity, 0);
  objc_storeStrong((id *)&self->_userActivity, 0);
  objc_storeStrong((id *)&self->_addClockNavigationController, 0);
}

@end
