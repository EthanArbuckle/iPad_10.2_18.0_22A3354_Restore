@implementation MainWindowContentContainerViewController

- (void)loadView
{
  void *v3;
  void *v4;
  id v5;
  UISegmentedControl *v6;
  UISegmentedControl *segmentedControl;
  void *v8;
  id v9;

  v9 = objc_alloc_init((Class)UIView);
  objc_msgSend(v9, "setAutoresizingMask:", 18);
  -[MainWindowContentContainerViewController addChildViewController:](self, "addChildViewController:", self->_splitViewController);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UISplitViewController view](self->_splitViewController, "view"));
  objc_msgSend(v9, "addSubview:", v3);

  -[UISplitViewController didMoveToParentViewController:](self->_splitViewController, "didMoveToParentViewController:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MainWindowContentContainerViewController traitCollection](self, "traitCollection"));
  v5 = objc_msgSend(v4, "horizontalSizeClass");

  if (v5 == (id)2)
  {
    v6 = (UISegmentedControl *)objc_claimAutoreleasedReturnValue(-[RootNavigationController viewSwitcher](self->_rootNavigationController, "viewSwitcher"));
    segmentedControl = self->_segmentedControl;
    self->_segmentedControl = v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](self->_containerViewController, "view"));
    objc_msgSend(v8, "addSubview:", self->_segmentedControl);

  }
  -[MainWindowContentContainerViewController setView:](self, "setView:", v9);

}

- (void)viewWillLayoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  id v12;

  v12 = (id)objc_claimAutoreleasedReturnValue(-[MainWindowContentContainerViewController view](self, "view"));
  objc_msgSend(v12, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UISplitViewController view](self->_splitViewController, "view"));
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  -[MainWindowContentContainerViewController layoutSegmentedControl](self, "layoutSegmentedControl");
}

- (void)layoutSegmentedControl
{
  UISegmentedControl *segmentedControl;
  void *v4;
  double v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  int IsCompact;
  double v17;
  _QWORD *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[10];
  CGRect v24;

  segmentedControl = self->_segmentedControl;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](self->_containerViewController, "view"));
  objc_msgSend(v4, "bounds");
  -[UISegmentedControl sizeThatFits:](segmentedControl, "sizeThatFits:", v5, v6);
  v8 = v7;
  v10 = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MainWindowContentContainerViewController view](self, "view"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "window"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](self->_containerViewController, "view"));
  objc_msgSend(v12, "bounds");
  objc_msgSend(v13, "convertPoint:fromView:", v12, CGRectGetWidth(v24) * 0.5, 0.0);
  v15 = v14;

  IsCompact = EKUICurrentHeightSizeClassIsCompact(v12);
  v17 = 33.0;
  if (IsCompact)
    v17 = 5.0;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10000E760;
  v23[3] = &unk_1001B2B98;
  v23[4] = self;
  v23[5] = v15;
  v23[6] = v8;
  v23[7] = v10;
  *(double *)&v23[8] = v17;
  v23[9] = 0x4042000000000000;
  v18 = objc_retainBlock(v23);
  v19 = v18;
  if (self->_animatingSidebar)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[UISplitViewController transitionCoordinator](self->_splitViewController, "transitionCoordinator"));
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100037660;
    v21[3] = &unk_1001B2BC0;
    v22 = v19;
    objc_msgSend(v20, "animateAlongsideTransition:completion:", v21, 0);

  }
  else
  {
    ((void (*)(_QWORD *))v18[2])(v18);
  }

}

- (MainWindowContentContainerViewController)initWithRootNavigationController:(id)a3
{
  id v5;
  MainWindowContentContainerViewController *v6;
  MainWindowContentContainerViewController *v7;
  id *p_rootNavigationController;
  UISplitViewController *v9;
  UISplitViewController *splitViewController;
  void *v11;
  UIViewController *v12;
  UIViewController *containerViewController;
  void *v14;
  void *v15;
  void *v16;
  MainWindowWrapperNavigationController *v17;
  void *v18;
  objc_super v20;

  v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MainWindowContentContainerViewController;
  v6 = -[MainWindowContentContainerViewController init](&v20, "init");
  v7 = v6;
  if (v6)
  {
    p_rootNavigationController = (id *)&v6->_rootNavigationController;
    objc_storeStrong((id *)&v6->_rootNavigationController, a3);
    v9 = (UISplitViewController *)objc_msgSend(objc_alloc((Class)UISplitViewController), "initWithStyle:", 1);
    splitViewController = v7->_splitViewController;
    v7->_splitViewController = v9;

    -[UISplitViewController setDelegate:](v7->_splitViewController, "setDelegate:", v7);
    -[UISplitViewController setPreferredDisplayMode:](v7->_splitViewController, "setPreferredDisplayMode:", 1);
    -[UISplitViewController setPrimaryEdge:](v7->_splitViewController, "setPrimaryEdge:", 1);
    -[UISplitViewController setPresentsWithGesture:](v7->_splitViewController, "setPresentsWithGesture:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "EKUI_viewHierarchy"));
    +[MainWindowRootViewController sidebarWidthForViewHierarchy:](MainWindowRootViewController, "sidebarWidthForViewHierarchy:", v11);
    -[UISplitViewController setMinimumPrimaryColumnWidth:](v7->_splitViewController, "setMinimumPrimaryColumnWidth:");
    +[MainWindowRootViewController sidebarWidthForViewHierarchy:](MainWindowRootViewController, "sidebarWidthForViewHierarchy:", v11);
    -[UISplitViewController setMaximumPrimaryColumnWidth:](v7->_splitViewController, "setMaximumPrimaryColumnWidth:");
    v12 = (UIViewController *)objc_alloc_init((Class)UIViewController);
    containerViewController = v7->_containerViewController;
    v7->_containerViewController = v12;

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](v7->_containerViewController, "view"));
    objc_msgSend(v14, "setAutoresizingMask:", 18);

    -[UIViewController addChildViewController:](v7->_containerViewController, "addChildViewController:", *p_rootNavigationController);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](v7->_containerViewController, "view"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_rootNavigationController, "view"));
    objc_msgSend(v15, "addSubview:", v16);

    objc_msgSend(*p_rootNavigationController, "didMoveToParentViewController:", v7->_containerViewController);
    v17 = -[MainWindowWrapperNavigationController initWithRootViewController:]([MainWindowWrapperNavigationController alloc], "initWithRootViewController:", v7->_containerViewController);
    -[MainWindowWrapperNavigationController setNavigationBarHidden:animated:](v17, "setNavigationBarHidden:animated:", 1, 0);
    -[UISplitViewController setViewController:forColumn:](v7->_splitViewController, "setViewController:forColumn:", v17, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v18, "addObserver:selector:name:object:", v7, "keyboardFrameChanged:", UIKeyboardWillChangeFrameNotification, 0);

    objc_msgSend(*p_rootNavigationController, "setViewSwitcherLayoutHandler:", v7);
  }

  return v7;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  char isKindOfClass;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void **v18;
  id WeakRetained;
  id v20;
  UISegmentedControl *segmentedControl;
  UISegmentedControl *v22;
  UISegmentedControl *v23;
  void *v24;
  void **v25;
  void ***v26;
  void **v27;
  void **v28;
  void **v29;
  objc_super v30;
  objc_super v31;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "horizontalSizeClass");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MainWindowContentContainerViewController traitCollection](self, "traitCollection"));
  v10 = objc_msgSend(v9, "horizontalSizeClass");

  if (v8 == v10)
  {
    v31.receiver = self;
    v31.super_class = (Class)MainWindowContentContainerViewController;
    -[MainWindowContentContainerViewController willTransitionToTraitCollection:withTransitionCoordinator:](&v31, "willTransitionToTraitCollection:withTransitionCoordinator:", v6, v7);
    goto LABEL_16;
  }
  if (self->_searchResultsController)
  {
    if (!self->_animatingSidebar)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_searchBar);
      v18 = (void **)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "text"));

      -[MainWindowContentContainerViewController endSearch:](self, "endSearch:", 0);
      goto LABEL_10;
    }
    -[UISplitViewController setViewController:forColumn:](self->_splitViewController, "setViewController:forColumn:", 0, 0);
    goto LABEL_8;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController presentedViewController](self->_rootNavigationController, "presentedViewController"));
  v12 = objc_opt_class(UISearchController);
  isKindOfClass = objc_opt_isKindOfClass(v11, v12);

  if ((isKindOfClass & 1) == 0)
  {
LABEL_8:
    v18 = 0;
    goto LABEL_10;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController presentedViewController](self->_rootNavigationController, "presentedViewController"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "searchResultsUpdater"));

  objc_msgSend(v15, "setShouldLeaveSearchString:", 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController presentedViewController](self->_rootNavigationController, "presentedViewController"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "searchBar"));
  v18 = (void **)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "text"));

  -[RootNavigationController dismissViewControllerAnimated:completion:](self->_rootNavigationController, "dismissViewControllerAnimated:completion:", 0, 0);
LABEL_10:
  v30.receiver = self;
  v30.super_class = (Class)MainWindowContentContainerViewController;
  -[MainWindowContentContainerViewController willTransitionToTraitCollection:withTransitionCoordinator:](&v30, "willTransitionToTraitCollection:withTransitionCoordinator:", v6, v7);
  v20 = objc_msgSend(v6, "horizontalSizeClass");
  segmentedControl = self->_segmentedControl;
  if (v20 == (id)2)
  {
    if (!segmentedControl)
    {
      v22 = (UISegmentedControl *)objc_claimAutoreleasedReturnValue(-[RootNavigationController viewSwitcher](self->_rootNavigationController, "viewSwitcher"));
      v23 = self->_segmentedControl;
      self->_segmentedControl = v22;

    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](self->_containerViewController, "view"));
    objc_msgSend(v24, "addSubview:", self->_segmentedControl);

    v29 = _NSConcreteStackBlock;
    v25 = (void **)sub_100037944;
    v26 = &v29;
  }
  else
  {
    -[UISegmentedControl removeFromSuperview](segmentedControl, "removeFromSuperview");
    v28 = _NSConcreteStackBlock;
    v25 = (void **)sub_1000379D0;
    v26 = &v28;
  }
  v26[1] = (void **)3221225472;
  v26[2] = v25;
  v26[3] = (void **)&unk_1001B2BE8;
  v26[4] = v18;
  v26[5] = (void **)&self->super.super.super.isa;
  v27 = v18;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", 0, v26);

LABEL_16:
}

- (BOOL)_isWindowSizeFullscreen:(CGSize)a3
{
  double height;
  double width;
  void *v5;
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

  height = a3.height;
  width = a3.width;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MainWindowContentContainerViewController view](self, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "window"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "screen"));
  objc_msgSend(v7, "bounds");
  v9 = v8;
  v11 = v10;

  if (width >= height)
    v12 = height;
  else
    v12 = width;
  if (v9 >= v11)
    v13 = v11;
  else
    v13 = v9;
  if (vabdd_f64(v12, v13) >= 2.22044605e-16)
    return 0;
  if (width >= height)
    v14 = width;
  else
    v14 = height;
  if (v9 >= v11)
    v15 = v9;
  else
    v15 = v11;
  return vabdd_f64(v14, v15) < 2.22044605e-16;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  long double v9;
  long double v10;
  UISplitViewControllerSplitBehavior v11;
  unsigned int v12;
  char v13;
  double v14;
  uint64_t v15;
  objc_super v16;
  _QWORD v17[5];
  char v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "targetTransform");
    v9 = *((double *)&v22 + 1);
    objc_msgSend(v8, "targetTransform");
    v10 = *(double *)&v19;
  }
  else
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v10 = 0.0;
    v9 = 0.0;
  }
  v11 = -[UISplitViewController splitBehavior](self->_splitViewController, "splitBehavior");
  v12 = -[MainWindowContentContainerViewController _isWindowSizeFullscreen:](self, "_isWindowSizeFullscreen:", width, height);
  v13 = v12;
  if (v12)
  {
    v14 = atan2(v9, v10) * 57.2957795;
    if (fabs(v14) == 180.0 || v14 == 0.0)
    {
      if (v11 == UISplitViewControllerSplitBehaviorOverlay)
        v15 = 3;
      else
        v15 = 2;
    }
    else if (v11 == UISplitViewControllerSplitBehaviorOverlay)
    {
      v15 = 2;
    }
    else
    {
      v15 = 3;
    }
  }
  else
  {
    v15 = 3;
  }
  -[UISplitViewController setPreferredDisplayMode:](self->_splitViewController, "setPreferredDisplayMode:", v15);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100037C48;
  v17[3] = &unk_1001B2C10;
  v17[4] = self;
  v18 = v13;
  objc_msgSend(v8, "animateAlongsideTransition:completion:", 0, v17);
  v16.receiver = self;
  v16.super_class = (Class)MainWindowContentContainerViewController;
  -[MainWindowContentContainerViewController viewWillTransitionToSize:withTransitionCoordinator:](&v16, "viewWillTransitionToSize:withTransitionCoordinator:", v8, width, height);

}

- (void)splitViewController:(id)a3 willHideColumn:(int64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  _QWORD v14[15];

  if (!a4)
  {
    v14[5] = v7;
    v14[6] = v6;
    v14[13] = v4;
    v14[14] = v5;
    self->_animatingSidebar = 1;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100037DB4;
    v14[3] = &unk_1001B2538;
    v14[4] = self;
    v9 = objc_retainBlock(v14);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100037DE4;
    v13[3] = &unk_1001B2538;
    v13[4] = self;
    v10 = objc_retainBlock(v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UISplitViewController transitionCoordinator](self->_splitViewController, "transitionCoordinator"));

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[UISplitViewController transitionCoordinator](self->_splitViewController, "transitionCoordinator"));
      objc_msgSend(v12, "animateAlongsideTransition:completion:", v9, v10);

    }
    else
    {
      ((void (*)(_QWORD *))v9[2])(v9);
      ((void (*)(_QWORD *))v10[2])(v10);
    }

  }
}

- (void)setSearchBar:(id)a3
{
  MainWindowSearchBar **p_searchBar;
  id v5;
  id v6;

  p_searchBar = &self->_searchBar;
  v6 = a3;
  v5 = objc_storeWeak((id *)p_searchBar, v6);
  objc_msgSend(v6, "setHeightObserver:", self);

}

- (void)keyboardFrameChanged:(id)a3
{
  CGRect *p_keyboardFrame;
  void *v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  id v9;

  p_keyboardFrame = &self->_keyboardFrame;
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", UIKeyboardFrameEndUserInfoKey));
  objc_msgSend(v4, "CGRectValue");
  p_keyboardFrame->origin.x = v5;
  p_keyboardFrame->origin.y = v6;
  p_keyboardFrame->size.width = v7;
  p_keyboardFrame->size.height = v8;

}

- (void)updateSearchViewControllerToolbar
{
  -[UINavigationController setToolbarHidden:](self->_searchResultsNavController, "setToolbarHidden:", (id)-[UISplitViewController splitBehavior](self->_splitViewController, "splitBehavior") != (id)2);
}

- (void)continueSearchWithTerm:(id)a3
{
  id v4;
  void *v5;
  id WeakRetained;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MainWindowContentContainerViewController delegate](self, "delegate"));
  objc_msgSend(v5, "searchTapped");

  WeakRetained = objc_loadWeakRetained((id *)&self->_searchBar);
  objc_msgSend(WeakRetained, "setText:", v4);

  v7 = objc_loadWeakRetained((id *)&self->_searchBar);
  -[MainWindowContentContainerViewController searchBar:textDidChange:](self, "searchBar:textDidChange:", v7, v4);

}

- (id)startSearch
{
  -[MainWindowContentContainerViewController setupSearch:](self, "setupSearch:", 0);
  return -[UISplitViewController transitionCoordinator](self->_splitViewController, "transitionCoordinator");
}

- (void)cancelSearch
{
  SearchResultsViewController *searchResultsController;
  MainWindowSearchBar **p_searchBar;
  id WeakRetained;
  unsigned int v6;
  id v7;

  searchResultsController = self->_searchResultsController;
  p_searchBar = &self->_searchBar;
  WeakRetained = objc_loadWeakRetained((id *)&self->_searchBar);
  v7 = WeakRetained;
  if (searchResultsController)
  {
    -[MainWindowContentContainerViewController searchBarCancelButtonClicked:](self, "searchBarCancelButtonClicked:", WeakRetained);
  }
  else
  {
    v6 = objc_msgSend(WeakRetained, "isFirstResponder");

    if (!v6)
      return;
    v7 = objc_loadWeakRetained((id *)p_searchBar);
    objc_msgSend(v7, "resignFirstResponder");
  }

}

- (void)setupSearch:(BOOL)a3
{
  _BOOL4 v3;
  SearchResultsViewController *v5;
  void *v6;
  void *v7;
  SearchResultsViewController *v8;
  SearchResultsViewController *searchResultsController;
  id WeakRetained;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  UINavigationController *v16;
  UINavigationController *searchResultsNavController;
  uint64_t v18;
  void *v19;
  _QWORD v20[5];
  _QWORD v21[5];
  id v22;

  if (!self->_searchResultsNavController)
  {
    v3 = a3;
    v5 = [SearchResultsViewController alloc];
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController model](self->_rootNavigationController, "model"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RootNavigationController window](self->_rootNavigationController, "window"));
    v8 = -[SearchResultsViewController initWithModel:window:](v5, "initWithModel:window:", v6, v7);
    searchResultsController = self->_searchResultsController;
    self->_searchResultsController = v8;

    -[SearchResultsViewController setSearchResultsDelegate:](self->_searchResultsController, "setSearchResultsDelegate:", self);
    WeakRetained = objc_loadWeakRetained((id *)&self->_searchBar);
    -[SearchResultsViewController setSearchBar:](self->_searchResultsController, "setSearchBar:", WeakRetained);

    -[ListViewController setDestination:](self->_searchResultsController, "setDestination:", 2);
    -[ListViewController setOverrideExtendedEdges:](self->_searchResultsController, "setOverrideExtendedEdges:", 0);
    v11 = objc_alloc((Class)UIBarButtonItem);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Today"), &stru_1001B67C0, 0));
    v14 = objc_msgSend(v11, "initWithTitle:style:target:action:", v13, 0, self, "todayToolbarItemPressed");
    v22 = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v22, 1));
    -[SearchResultsViewController setToolbarItems:](self->_searchResultsController, "setToolbarItems:", v15);

    -[MainWindowContentContainerViewController setupSearchNavBarHeight](self, "setupSearchNavBarHeight");
    v16 = (UINavigationController *)objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", self->_searchResultsController);
    searchResultsNavController = self->_searchResultsNavController;
    self->_searchResultsNavController = v16;

    if ((id)-[UISplitViewController splitBehavior](self->_splitViewController, "splitBehavior") == (id)1)
      v18 = 2;
    else
      v18 = 3;
    -[UISplitViewController setPreferredDisplayMode:](self->_splitViewController, "setPreferredDisplayMode:", v18);
    -[UISplitViewController setViewController:forColumn:](self->_splitViewController, "setViewController:forColumn:", self->_searchResultsNavController, 0);
    -[UISplitViewController showColumn:](self->_splitViewController, "showColumn:", 0);
    self->_animatingSidebar = v3;
    if (v3)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[UISplitViewController transitionCoordinator](self->_splitViewController, "transitionCoordinator"));
      v20[4] = self;
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_100038388;
      v21[3] = &unk_1001B2C38;
      v21[4] = self;
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_1000383EC;
      v20[3] = &unk_1001B2C38;
      objc_msgSend(v19, "animateAlongsideTransition:completion:", v21, v20);

    }
    -[MainWindowContentContainerViewController updateSearchViewControllerToolbar](self, "updateSearchViewControllerToolbar");
  }
}

- (void)searchResultsViewController:(id)a3 didSelectEvent:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  if ((id)-[UISplitViewController splitBehavior](self->_splitViewController, "splitBehavior") == (id)2)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_searchBar);
    -[MainWindowContentContainerViewController searchBarCancelButtonClicked:](self, "searchBarCancelButtonClicked:", WeakRetained);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UISplitViewController transitionCoordinator](self->_splitViewController, "transitionCoordinator"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10003851C;
    v10[3] = &unk_1001B2C60;
    v10[4] = self;
    v11 = v6;
    v12 = v7;
    objc_msgSend(v9, "animateAlongsideTransition:completion:", v10, 0);

  }
  else
  {
    -[RootNavigationController searchResultsViewController:didSelectEvent:](self->_rootNavigationController, "searchResultsViewController:didSelectEvent:", v6, v7);
  }

}

- (void)todayToolbarItemPressed
{
  SearchResultsViewController *searchResultsController;
  uint64_t v3;
  id v4;

  searchResultsController = self->_searchResultsController;
  v3 = CUIKTodayDate(self, a2);
  v4 = (id)objc_claimAutoreleasedReturnValue(v3);
  -[SearchResultsViewController scrollToDate:animated:](searchResultsController, "scrollToDate:animated:", v4, 1);

}

- (void)todayTapped
{
  if (self->_searchResultsController)
    -[MainWindowContentContainerViewController todayToolbarItemPressed](self, "todayToolbarItemPressed");
}

- (void)setupSearchNavBarHeight
{
  MainWindowSearchBar **p_searchBar;
  id WeakRetained;
  double v5;
  double v6;
  double v7;
  id v8;
  double v9;
  void *v10;
  id v11;

  p_searchBar = &self->_searchBar;
  WeakRetained = objc_loadWeakRetained((id *)&self->_searchBar);
  objc_msgSend(WeakRetained, "frame");
  v6 = v5;

  v7 = 60.0;
  if (v6 > 60.0)
  {
    v8 = objc_loadWeakRetained((id *)p_searchBar);
    objc_msgSend(v8, "frame");
    v7 = v9;

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsViewController navigationItem](self->_searchResultsController, "navigationItem"));
  objc_msgSend(v10, "_setMinimumDesiredHeight:forBarMetrics:", 0, v7);

  v11 = (id)objc_claimAutoreleasedReturnValue(-[SearchResultsViewController navigationItem](self->_searchResultsController, "navigationItem"));
  objc_msgSend(v11, "_setMinimumDesiredHeight:forBarMetrics:", 1, v7);

}

- (void)resetSearchBar
{
  MainWindowSearchBar **p_searchBar;
  id WeakRetained;
  id v4;
  id v5;

  p_searchBar = &self->_searchBar;
  WeakRetained = objc_loadWeakRetained((id *)&self->_searchBar);
  objc_msgSend(WeakRetained, "setText:", 0);

  v4 = objc_loadWeakRetained((id *)p_searchBar);
  objc_msgSend(v4, "resignFirstResponder");

  v5 = objc_loadWeakRetained((id *)p_searchBar);
  objc_msgSend(v5, "setShowsCancelButton:animated:", 0, 1);

}

- (void)teardownSearch
{
  UINavigationController *searchResultsNavController;
  SearchResultsViewController *searchResultsController;

  -[MainWindowContentContainerViewController resetSearchBar](self, "resetSearchBar");
  searchResultsNavController = self->_searchResultsNavController;
  self->_searchResultsNavController = 0;

  searchResultsController = self->_searchResultsController;
  self->_searchResultsController = 0;

}

- (void)endSearch:(BOOL)a3
{
  _BOOL4 v3;
  _QWORD *v5;
  _QWORD *v6;
  void *v7;
  _QWORD v8[5];
  _QWORD v9[5];

  v3 = a3;
  -[UISplitViewController hideColumn:](self->_splitViewController, "hideColumn:", 0);
  -[MainWindowContentContainerViewController resetSearchBar](self, "resetSearchBar");
  self->_animatingSidebar = v3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100038834;
  v9[3] = &unk_1001B2C38;
  v9[4] = self;
  v5 = objc_retainBlock(v9);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100038864;
  v8[3] = &unk_1001B2C38;
  v8[4] = self;
  v6 = objc_retainBlock(v8);
  if (v3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[UISplitViewController transitionCoordinator](self->_splitViewController, "transitionCoordinator"));
    objc_msgSend(v7, "animateAlongsideTransition:completion:", v5, v6);

  }
  else
  {
    ((void (*)(_QWORD *, _QWORD))v5[2])(v5, 0);
    ((void (*)(_QWORD *, _QWORD))v6[2])(v6, 0);
  }

}

- (void)searchBarTextDidBeginEditing:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[MainWindowContentContainerViewController delegate](self, "delegate", a3));
  objc_msgSend(v3, "searchTapped");

}

- (void)searchBarCancelButtonClicked:(id)a3
{
  -[MainWindowContentContainerViewController endSearch:](self, "endSearch:", 1);
}

- (void)searchBarSearchButtonClicked:(id)a3
{
  -[SearchResultsViewController searchBarSearchButtonClicked:](self->_searchResultsController, "searchBarSearchButtonClicked:", a3);
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "length"))
    -[MainWindowContentContainerViewController setupSearch:](self, "setupSearch:", 1);
  -[SearchResultsViewController searchBar:textDidChange:](self->_searchResultsController, "searchBar:textDidChange:", v7, v6);

}

- (MainWindowContentContainerDelegate)delegate
{
  return (MainWindowContentContainerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (MainWindowSearchBar)searchBar
{
  return (MainWindowSearchBar *)objc_loadWeakRetained((id *)&self->_searchBar);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_searchBar);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_segmentedControl, 0);
  objc_storeStrong((id *)&self->_searchResultsController, 0);
  objc_storeStrong((id *)&self->_searchResultsNavController, 0);
  objc_storeStrong((id *)&self->_rootNavigationController, 0);
  objc_storeStrong((id *)&self->_containerViewController, 0);
  objc_storeStrong((id *)&self->_splitViewController, 0);
}

@end
