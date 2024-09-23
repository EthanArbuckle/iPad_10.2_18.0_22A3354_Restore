@implementation THBookmarkMenuPopoverViewController

- (THBookmarkMenuPopoverViewController)init
{
  THBookmarkMenuPopoverViewController *v2;
  THBookmarkMenuPopoverViewController *v3;
  void *v4;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)THBookmarkMenuPopoverViewController;
  v2 = -[THBookmarkMenuPopoverViewController initWithNibName:bundle:](&v7, "initWithNibName:bundle:", 0, 0);
  v3 = v2;
  if (v2)
  {
    -[THBookmarkMenuPopoverViewController setViewDelegate:](v2, "setViewDelegate:", v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection bc_allAPITraits](UITraitCollection, "bc_allAPITraits"));
    v5 = -[THBookmarkMenuPopoverViewController registerForTraitChanges:withAction:](v3, "registerForTraitChanges:withAction:", v4, "_traitCollectionDidChange:previousTraitCollection:");

  }
  return v3;
}

- (void)loadView
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THBookmarkMenuPopoverViewController;
  -[THBookmarkMenuPopoverViewController loadView](&v4, "loadView");
  v3 = objc_alloc_init((Class)UITableView);
  objc_msgSend(v3, "setDelegate:", self);
  objc_msgSend(v3, "setDataSource:", self);
  -[THBookmarkMenuPopoverViewController setTableView:](self, "setTableView:", v3);
  -[THBookmarkMenuPopoverViewController setView:](self, "setView:", v3);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  BEHairlineDividerView *v14;
  BEHairlineDividerView *headerDividerView;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  id v28;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)THBookmarkMenuPopoverViewController;
  -[THBookmarkMenuPopoverViewController viewDidLoad](&v29, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[THBookmarkMenuPopoverViewController navigationController](self, "navigationController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "navigationBar"));

  objc_msgSend(v4, "setTranslucent:", 0);
  objc_msgSend(v4, "_setHidesShadow:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[THBookmarkMenuPopoverViewController tableView](self, "tableView"));
  objc_msgSend(v5, "frame");
  v7 = v6;
  v9 = v8;
  objc_msgSend(v5, "setFrame:");
  objc_msgSend(v5, "setRowHeight:", 58.0);
  v10 = objc_alloc_init((Class)UIView);
  objc_msgSend(v5, "setTableFooterView:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v11, "scale");
  v13 = 1.0 / v12;

  v14 = (BEHairlineDividerView *)objc_msgSend(objc_alloc((Class)BEHairlineDividerView), "initWithFrame:", v7, v9, 340.0, v13);
  headerDividerView = self->_headerDividerView;
  self->_headerDividerView = v14;

  -[BEHairlineDividerView setAutoresizingMask:](self->_headerDividerView, "setAutoresizingMask:", 2);
  -[BEHairlineDividerView setHorizontal:](self->_headerDividerView, "setHorizontal:", 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "superview"));
  objc_msgSend(v16, "addSubview:", self->_headerDividerView);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[THBookmarkMenuPopoverViewController delegate](self, "delegate"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "bookmarkFetchedResultsController"));
  -[THBookmarkMenuPopoverViewController setBookmarkFetchedResultsController:](self, "setBookmarkFetchedResultsController:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[THBookmarkMenuPopoverViewController bookmarkFetchedResultsController](self, "bookmarkFetchedResultsController"));
  objc_msgSend(v19, "setDelegate:", self);

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "addNonBlockingObserver:selector:name:object:", self, "p_managedObjectContextDidSaveNotification:", NSManagedObjectContextDidSaveNotification, 0));
  -[THBookmarkMenuPopoverViewController setManagedObjectContextDidSaveObserver:](self, "setManagedObjectContextDidSaveObserver:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[THBookmarkMenuPopoverViewController bookmarkFetchedResultsController](self, "bookmarkFetchedResultsController"));
  v28 = 0;
  objc_msgSend(v22, "performFetch:", &v28);
  v23 = v28;

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[THBookmarkMenuPopoverViewController view](self, "view"));
  objc_msgSend(v24, "frame");
  -[THBookmarkMenuPopoverViewController setPreferredContentSize:](self, "setPreferredContentSize:", v25, v26);

  -[THBookmarkMenuPopoverViewController p_applyTheme](self, "p_applyTheme");
  -[THBookmarkMenuPopoverViewController p_syncWithStatusAnimated:](self, "p_syncWithStatusAnimated:", 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v27, "addObserver:selector:name:object:", self, "p_handleNotificationVantageDidChange:", CFSTR("THVantageDidChangeNotification"), 0);
  objc_msgSend(v27, "addObserver:selector:name:object:", self, "p_navigationHistoryDidChange:", THNavigationHistoryDidChangeNotification, 0);
  objc_msgSend(v27, "addObserver:selector:name:object:", self, "p_applicationDidEnterBackground:", UIApplicationDidEnterBackgroundNotification, 0);

}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  if (!-[THBookmarkMenuPopoverViewController tornDown](self, "tornDown"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THBookmarkMenuPopoverViewController dealloc]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THBookmarkMenuPopoverViewController.m"));
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, v5, 133, CFSTR("should have been torn down"));

  }
  -[THBookmarkMenuPopoverViewController teardown](self, "teardown");
  -[THBookmarkMenuPopoverViewController setTableView:](self, "setTableView:", 0);
  -[THBookmarkMenuPopoverViewController setDelegate:](self, "setDelegate:", 0);
  -[THBookmarkMenuPopoverViewController setViewDelegate:](self, "setViewDelegate:", 0);
  v6.receiver = self;
  v6.super_class = (Class)THBookmarkMenuPopoverViewController;
  -[THBookmarkMenuPopoverViewController dealloc](&v6, "dealloc");
}

- (void)setTheme:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THBookmarkMenuPopoverViewController;
  -[THBookmarkMenuPopoverViewController setTheme:](&v4, "setTheme:", a3);
  -[THBookmarkMenuPopoverViewController p_applyTheme](self, "p_applyTheme");
}

- (void)teardown
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[THBookmarkMenuPopoverViewController managedObjectContextDidSaveObserver](self, "managedObjectContextDidSaveObserver"));
  objc_msgSend(v3, "removeObserver:", v4);

  -[THBookmarkMenuPopoverViewController setManagedObjectContextDidSaveObserver:](self, "setManagedObjectContextDidSaveObserver:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[THBookmarkMenuPopoverViewController bookmarkFetchedResultsController](self, "bookmarkFetchedResultsController"));
  objc_msgSend(v5, "setDelegate:", 0);

  -[THBookmarkMenuPopoverViewController setBookmarkFetchedResultsController:](self, "setBookmarkFetchedResultsController:", 0);
  v7 = (id)objc_claimAutoreleasedReturnValue(-[THBookmarkMenuPopoverViewController tableView](self, "tableView"));
  objc_msgSend(v7, "setDelegate:", 0);
  objc_msgSend(v7, "setDataSource:", 0);
  -[THBookmarkMenuPopoverViewController setDelegate:](self, "setDelegate:", 0);
  -[THBookmarkMenuPopoverViewController setViewDelegate:](self, "setViewDelegate:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "removeObserver:", self);

  -[THBookmarkMenuPopoverViewController setReflowablePaginationController:](self, "setReflowablePaginationController:", 0);
  -[THBookmarkMenuPopoverViewController setTornDown:](self, "setTornDown:", 1);

}

- (void)setReflowablePaginationController:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_reflowablePaginationController);

  if (WeakRetained != obj)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[THBookmarkMenuPopoverViewController reflowablePaginationController](self, "reflowablePaginationController"));
    objc_msgSend(v5, "unregisterObserver:", self);

    objc_storeWeak((id *)&self->_reflowablePaginationController, obj);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[THBookmarkMenuPopoverViewController reflowablePaginationController](self, "reflowablePaginationController"));
    objc_msgSend(v6, "registerObserver:", self);

  }
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  UITableView *tableView;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)THBookmarkMenuPopoverViewController;
  -[THBookmarkMenuPopoverViewController viewWillLayoutSubviews](&v16, "viewWillLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[THBookmarkMenuPopoverViewController navigationController](self, "navigationController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "navigationBar"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "superview"));

  tableView = self->_tableView;
  -[UITableView bounds](tableView, "bounds");
  -[UITableView convertRect:toView:](tableView, "convertRect:toView:", v5);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v13, "scale");
  v15 = 1.0 / v14;

  -[BEHairlineDividerView setFrame:](self->_headerDividerView, "setFrame:", v8, v10, v12, v15);
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THBookmarkMenuPopoverViewController;
  -[THBookmarkMenuPopoverViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[THBookmarkMenuPopoverViewController p_syncWithStatusAnimated:](self, "p_syncWithStatusAnimated:", 0);
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THBookmarkMenuPopoverViewController;
  -[THBookmarkMenuPopoverViewController viewWillDisappear:](&v4, "viewWillDisappear:", a3);
  -[THBookmarkMenuPopoverViewController teardown](self, "teardown");
}

- (void)p_cancelEditingOnAllVisibleCells
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[THBookmarkMenuPopoverViewController tableView](self, "tableView", 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "visibleCells"));

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v8), "setEditing:", 0);
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[THBookmarkMenuPopoverViewController tableView](self, "tableView"));
  objc_msgSend(v9, "reloadData");

}

- (void)addRemoveBookmark:(id)a3
{
  -[THBookmarkMenuPopoverViewController p_cancelEditingOnAllVisibleCells](self, "p_cancelEditingOnAllVisibleCells", a3);
  -[THBookmarkMenuPopoverViewController setCurrentPageBookmarked:](self, "setCurrentPageBookmarked:", -[THBookmarkMenuPopoverViewController isCurrentPageBookmarked](self, "isCurrentPageBookmarked") ^ 1);
}

- (BOOL)isCurrentPageBookmarked
{
  THBookmarkMenuPopoverViewController *v2;
  void *v3;

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[THBookmarkMenuPopoverViewController delegate](self, "delegate"));
  LOBYTE(v2) = objc_msgSend(v3, "isCurrentPageBookmarkedForBookmarkMenuPopoverViewController:", v2);

  return (char)v2;
}

- (void)setCurrentPageBookmarked:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[THBookmarkMenuPopoverViewController delegate](self, "delegate"));
  objc_msgSend(v5, "setCurrentPageBookmarked:forBookmarkMenuPopoverViewController:", v3, self);

}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)paginationController:(id)a3 paginationCompleteStateChangedTo:(BOOL)a4
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[THBookmarkMenuPopoverViewController tableView](self, "tableView", a3, a4));
  objc_msgSend(v4, "reloadData");

}

- (void)dismissBookmarkMenu:(BOOL)a3 completion:(id)a4
{
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3, a4));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THBookmarkMenuPopoverViewController dismissBookmarkMenu:completion:]"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THBookmarkMenuPopoverViewController.m"));
  objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v4, v5, 250, CFSTR("Warning, dismissBookmarkMenu:completion: requested but not hooked up to anything"));

}

- (void)p_syncWithStatusAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[THBookmarkMenuPopoverViewController delegate](self, "delegate"));
  -[THBookmarkMenuPopoverViewController p_syncWithStatusForPage:animated:](self, "p_syncWithStatusForPage:animated:", objc_msgSend(v5, "currentAbsolutePageIndexForBookmarks"), v3);

}

- (id)p_addRemoveBookmarkIndexPath
{
  return +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", 0, 0);
}

- (void)p_syncWithStatusForPage:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  double v14;
  double v15;
  void *v16;
  _BOOL4 v17;
  double v18;
  double v19;
  void *v20;

  v4 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[THBookmarkMenuPopoverViewController tableView](self, "tableView", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[THBookmarkMenuPopoverViewController p_addRemoveBookmarkIndexPath](self, "p_addRemoveBookmarkIndexPath"));
  v20 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));
  if (v4)
    v9 = 0;
  else
    v9 = 5;
  objc_msgSend(v6, "reloadRowsAtIndexPaths:withRowAnimation:", v8, v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[THBookmarkMenuPopoverViewController bookmarkFetchedResultsController](self, "bookmarkFetchedResultsController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "sections"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndex:", 0));

  v13 = objc_msgSend(v12, "numberOfObjects");
  objc_msgSend(v6, "rowHeight");
  v15 = v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v17 = (char *)objc_msgSend(v16, "orientation") - 1 < (_BYTE *)&dword_0 + 2;

  v18 = dbl_314A00[v17];
  if (v15 * (double)((unint64_t)v13 + 1) < v18)
    v18 = v15 * (double)((unint64_t)v13 + 1);
  v19 = v15 * 3.0;
  if (v18 >= v15 * 3.0)
    v19 = v18;
  -[THBookmarkMenuPopoverViewController setPreferredContentSize:](self, "setPreferredContentSize:", 0.0, v19);

}

- (void)p_applyTheme
{
  void *v3;
  void *v4;
  void *v5;
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
  NSAttributedStringKey v17;
  void *v18;

  if (-[THBookmarkMenuPopoverViewController isViewLoaded](self, "isViewLoaded"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[THBookmarkMenuPopoverViewController theme](self, "theme"));

    if (v3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[THBookmarkMenuPopoverViewController themePage](self, "themePage"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[THBookmarkMenuPopoverViewController tableView](self, "tableView"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[THBookmarkMenuPopoverViewController navigationController](self, "navigationController"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "searchBackgroundColor"));
      if (!v7)
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "backgroundColorForTraitEnvironment:", self));
      objc_msgSend(v5, "setBackgroundColor:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tableViewSeparatorColor"));
      objc_msgSend(v5, "setSeparatorColor:", v8);

      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "popoverPresentationController"));
      objc_msgSend(v9, "setBackgroundColor:", v7);

      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "navigationBar"));
      objc_msgSend(v10, "setBarStyle:", objc_msgSend(v4, "isNight:", self));
      objc_msgSend(v10, "setBarTintColor:", v7);
      v17 = NSForegroundColorAttributeName;
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "popoverTitleColor"));
      v18 = v11;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
      objc_msgSend(v10, "setTitleTextAttributes:", v12);

      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "viewIfLoaded"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tintColor"));
      objc_msgSend(v13, "setTintColor:", v14);

      objc_msgSend(v13, "setBackgroundColor:", v7);
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "separatorColor"));
      -[BEHairlineDividerView setDividerColor:](self->_headerDividerView, "setDividerColor:", v15);

      -[THBookmarkMenuPopoverViewController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[THBookmarkMenuPopoverViewController tableView](self, "tableView"));
    objc_msgSend(v16, "reloadData");

  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  char *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD v28[4];
  void *v29;
  THBookmarkMenuPopoverViewController *v30;

  v6 = a3;
  v7 = a4;
  v8 = (char *)objc_msgSend(v7, "section");
  if (v8 == (_BYTE *)&dword_0 + 1)
  {
    v13 = (id)objc_claimAutoreleasedReturnValue(-[THBookmarkMenuPopoverViewController bookmarkFetchedResultsController](self, "bookmarkFetchedResultsController"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "sections"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndex:", 0));

    if (objc_msgSend(v14, "numberOfObjects"))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[THBookmarkMenuPopoverViewController p_tableViewBookmarkIndexPathToFetchedResultsControllerBookmarkIndexPath:](self, "p_tableViewBookmarkIndexPathToFetchedResultsControllerBookmarkIndexPath:", v7));
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[THBookmarkMenuPopoverViewController delegate](self, "delegate"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexPath:", v16));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "cachedAnnotationForFetchedObject:", v18));

      v20 = (void *)objc_claimAutoreleasedReturnValue(+[THPageLocation pageLocationWithAnnotation:](THPageLocation, "pageLocationWithAnnotation:", v19));
      objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[THBookmarkMenuPopoverViewController delegate](self, "delegate"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[THBookmarkMenuPopoverViewController viewDelegate](self, "viewDelegate"));
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_F70E4;
      v25[3] = &unk_426D80;
      v26 = v21;
      v27 = v20;
      v23 = v20;
      v24 = v21;
      objc_msgSend(v22, "dismissBookmarkMenu:completion:", 1, v25);

    }
    goto LABEL_7;
  }
  if (!v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[THBookmarkMenuPopoverViewController delegate](self, "delegate"));
    v10 = objc_msgSend(v9, "isBookmarkApplicable");

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[THBookmarkMenuPopoverViewController delegate](self, "delegate"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[THBookmarkMenuPopoverViewController viewDelegate](self, "viewDelegate"));
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_F70B4;
      v28[3] = &unk_426D80;
      v29 = v11;
      v30 = self;
      v13 = v11;
      objc_msgSend(v12, "dismissBookmarkMenu:completion:", 1, v28);

      v14 = v29;
LABEL_7:

    }
  }

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  int64_t v9;

  if (a4 != 1)
    return a4 == 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[THBookmarkMenuPopoverViewController bookmarkFetchedResultsController](self, "bookmarkFetchedResultsController", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sections"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndex:", 0));

  v8 = objc_msgSend(v7, "numberOfObjects");
  if ((unint64_t)v8 <= 1)
    v9 = 1;
  else
    v9 = (int64_t)v8;

  return v9;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  THBookmarkMenuTableViewCell *v4;

  v4 = (THBookmarkMenuTableViewCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("BookmarkCell"), a4));
  if (!v4)
    v4 = -[THBookmarkMenuTableViewCell initWithStyle:reuseIdentifier:]([THBookmarkMenuTableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("BookmarkCell"));
  return v4;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v7;
  char *v8;
  unsigned __int8 v9;
  void *v10;
  unsigned int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  int v20;
  __CFString *v21;
  __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  unsigned int v32;
  void *v33;
  id v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  THBookmarkMenuPopoverViewController *v59;
  void *v60;
  id v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  id v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  id v78;
  id v79;
  id v80;

  v80 = a4;
  v7 = a5;
  v8 = (char *)objc_msgSend(v7, "section");
  if (v8 == (_BYTE *)&dword_0 + 1)
  {
    v22 = (__CFString *)objc_claimAutoreleasedReturnValue(-[THBookmarkMenuPopoverViewController bookmarkFetchedResultsController](self, "bookmarkFetchedResultsController"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString sections](v22, "sections"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectAtIndex:", 0));

    v76 = v24;
    if (objc_msgSend(v24, "numberOfObjects"))
    {
      v78 = v7;
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[THBookmarkMenuPopoverViewController p_tableViewBookmarkIndexPathToFetchedResultsControllerBookmarkIndexPath:](self, "p_tableViewBookmarkIndexPathToFetchedResultsControllerBookmarkIndexPath:", v7));
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[THBookmarkMenuPopoverViewController delegate](self, "delegate"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString objectAtIndexPath:](v22, "objectAtIndexPath:", v25));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "cachedAnnotationForFetchedObject:", v27));

      v29 = (void *)objc_claimAutoreleasedReturnValue(+[THPageLocation pageLocationWithAnnotation:](THPageLocation, "pageLocationWithAnnotation:", v28));
      v30 = objc_msgSend(v28, "annotationAbsolutePhysicalPageIndex");
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[THBookmarkMenuPopoverViewController delegate](self, "delegate"));
      v32 = objc_msgSend(v31, "hasThumbnailImageForAbsolutePageIndex:", v30);

      if (v32
        && (v33 = (void *)objc_claimAutoreleasedReturnValue(-[THBookmarkMenuPopoverViewController delegate](self, "delegate")),
            v34 = objc_msgSend(v33, "thumbnailImageForAbsolutePageIndex:", v30),
            v33,
            v34))
      {
        v35 = objc_claimAutoreleasedReturnValue(+[UIImage imageWithCGImage:](UIImage, "imageWithCGImage:", v34));
      }
      else
      {
        v35 = 0;
      }
      v18 = (id)objc_claimAutoreleasedReturnValue(-[THBookmarkMenuPopoverViewController p_bookmarkTitleStringForLocation:](self, "p_bookmarkTitleStringForLocation:", v29));
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[THBookmarkMenuPopoverViewController theme](self, "theme"));
      v40 = objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "bookmarkLabelColor"));

      v19 = (void *)v40;
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[THBookmarkMenuPopoverViewController delegate](self, "delegate"));
      v42 = objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "pageNumberStringForLocation:", v29));

      v36 = (void *)v42;
      v37 = 3;
      v7 = v78;
    }
    else
    {
      v43 = THBundle();
      v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
      v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "localizedStringForKey:value:table:", CFSTR("No Bookmarks"), &stru_43D7D8, 0));

      v25 = (void *)objc_claimAutoreleasedReturnValue(-[THBookmarkMenuPopoverViewController theme](self, "theme"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "buttonTitleColorDisabled"));
      v36 = 0;
      v35 = 0;
      v37 = 0;
    }
  }
  else
  {
    if (v8)
    {
      v36 = 0;
      v19 = 0;
      v18 = 0;
      v25 = 0;
      v37 = 3;
      goto LABEL_28;
    }
    v9 = -[THBookmarkMenuPopoverViewController isCurrentPageBookmarked](self, "isCurrentPageBookmarked");
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[THBookmarkMenuPopoverViewController delegate](self, "delegate"));
    v11 = objc_msgSend(v10, "isBookPortraitOnly");

    v12 = THBundle();
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Add Bookmark"), &stru_43D7D8, 0));

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[THBookmarkMenuPopoverViewController delegate](self, "delegate"));
    v15 = objc_msgSend(v14, "isBookmarkApplicable");

    if ((v15 & 1) != 0)
    {
      if ((v9 & 1) != 0)
      {
        v16 = THBundle();
        v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
        v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("Remove Bookmark"), &stru_43D7D8, 0));

        v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 1.0, 0.231372549, 0.188235294, 1.0));
        v20 = 0;
        v21 = CFSTR("ib_bookmarks_thumb_remove");
        if (v11)
          v21 = CFSTR("ib_bookmarks_thumb_remove_portrait");
      }
      else
      {
        v18 = v76;
        v45 = (void *)objc_claimAutoreleasedReturnValue(-[THBookmarkMenuPopoverViewController theme](self, "theme"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "keyColor"));

        v21 = CFSTR("ib_bookmarks_thumb_add");
        if (v11)
          v21 = CFSTR("ib_bookmarks_thumb_add_portrait");
        v20 = 1;
      }
      v38 = 3;
    }
    else
    {
      v18 = v76;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.678431373, 1.0));
      v38 = 0;
      v21 = CFSTR("ib_bookmarks_thumb_add-D");
      if (v11)
        v21 = CFSTR("ib_bookmarks_thumb_add_portrait-D");
      v20 = 1;
    }
    v22 = v21;
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage th_imageNamed:](UIImage, "th_imageNamed:", v22));
    v25 = v46;
    if (!v20)
    {
      v36 = 0;
      v37 = v38;
      goto LABEL_27;
    }
    v35 = objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "imageWithRenderingMode:", 2));
    v36 = 0;
    v37 = v38;
  }

  v25 = (void *)v35;
LABEL_27:

LABEL_28:
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[THBookmarkMenuPopoverViewController themePage](self, "themePage"));
  v48 = objc_opt_class(THBookmarkMenuTableViewCell);
  TSUDynamicCast(v48, v80);
  v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
  v51 = v50;
  if (v50)
  {
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "thumbnail"));
    objc_msgSend(v52, "setImage:", v25);

    v53 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "tableViewSeparatorColor")));
    v75 = v36;
    v79 = v7;
    v54 = objc_msgSend(v53, "CGColor");
    v77 = v37;
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "thumbnail"));
    v56 = v51;
    v57 = v47;
    v58 = v25;
    v59 = self;
    v60 = v19;
    v61 = v18;
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "layer"));
    v63 = v54;
    v7 = v79;
    objc_msgSend(v62, "setBorderColor:", v63);

    v18 = v61;
    v19 = v60;
    self = v59;
    v25 = v58;
    v47 = v57;
    v51 = v56;

    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "bookmarkTitleLabel"));
    objc_msgSend(v64, "setText:", v18);

    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "bookmarkTitleLabel"));
    objc_msgSend(v65, "setTextColor:", v19);

    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "pageNumberLabel"));
    v36 = v75;
    objc_msgSend(v66, "setText:");

    v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "bookmarkPageNumberColor"));
    v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "pageNumberLabel"));
    objc_msgSend(v68, "setTextColor:", v67);

    v37 = v77;
  }
  objc_msgSend(v80, "setSelectionStyle:", v37);
  v69 = objc_alloc((Class)UIView);
  objc_msgSend(v80, "bounds");
  v70 = objc_msgSend(v69, "initWithFrame:");
  objc_msgSend(v80, "setSelectedBackgroundView:", v70);

  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "tableViewCellSelectedColor"));
  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "selectedBackgroundView"));
  objc_msgSend(v72, "setBackgroundColor:", v71);

  v73 = (void *)objc_claimAutoreleasedReturnValue(-[THBookmarkMenuPopoverViewController tableView](self, "tableView"));
  v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "backgroundColor"));
  objc_msgSend(v80, "setBackgroundColor:", v74);

}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  if (objc_msgSend(a4, "section", a3) != (char *)&dword_0 + 1)
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[THBookmarkMenuPopoverViewController bookmarkFetchedResultsController](self, "bookmarkFetchedResultsController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sections"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndex:", 0));

  v8 = objc_msgSend(v7, "numberOfObjects") != 0;
  return v8;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a5;
  v6 = objc_msgSend(v18, "section") == (char *)&dword_0 + 1;
  v7 = v18;
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[THBookmarkMenuPopoverViewController bookmarkFetchedResultsController](self, "bookmarkFetchedResultsController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sections"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndex:", 0));

    if (objc_msgSend(v10, "numberOfObjects"))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[THBookmarkMenuPopoverViewController delegate](self, "delegate"));
      v12 = objc_msgSend(v11, "isAnnotationWriteEnabled");

      if (v12)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[THBookmarkMenuPopoverViewController p_tableViewBookmarkIndexPathToFetchedResultsControllerBookmarkIndexPath:](self, "p_tableViewBookmarkIndexPathToFetchedResultsControllerBookmarkIndexPath:", v18));
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[THBookmarkMenuPopoverViewController delegate](self, "delegate"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexPath:", v13));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "cachedAnnotationForFetchedObject:", v15));

        v17 = (void *)objc_claimAutoreleasedReturnValue(-[THBookmarkMenuPopoverViewController delegate](self, "delegate"));
        objc_msgSend(v17, "removeBookmark:", v16);

      }
      else
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[THBookmarkMenuPopoverViewController delegate](self, "delegate"));
        objc_msgSend(v13, "denyBookmarkEdit");
      }

    }
    v7 = v18;
  }

}

- (id)p_bookmarkTitleStringForLocation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[THBookmarkMenuPopoverViewController delegate](self, "delegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sectionTitleStringForLocation:", v4));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[THBookmarkMenuPopoverViewController delegate](self, "delegate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sectionNumberStringForLocation:", v4));

  if (v8)
    v9 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %@"), v8, v6));
  else
    v9 = v6;
  v10 = v9;

  return v10;
}

- (void)p_managedObjectContextDidSaveNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THBookmarkMenuPopoverViewController p_managedObjectContextDidSaveNotification:]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THBookmarkMenuPopoverViewController.m"));
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, v6, 579, CFSTR("This operation must only be performed on the main thread."));

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[THBookmarkMenuPopoverViewController bookmarkFetchedResultsController](self, "bookmarkFetchedResultsController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "managedObjectContext"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "object"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "persistentStoreCoordinator"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "persistentStoreCoordinator"));

    if (v10 == v11)
      objc_msgSend(v8, "mergeChangesFromContextDidSaveNotification:", v12);

  }
}

- (void)controllerWillChangeContent:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[THBookmarkMenuPopoverViewController tableView](self, "tableView", a3));
  objc_msgSend(v3, "beginUpdates");

}

- (void)controller:(id)a3 didChangeSection:(id)a4 atIndex:(unint64_t)a5 forChangeType:(unint64_t)a6
{
  id v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v10 = a4;
  if (a6 == 2)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[THBookmarkMenuPopoverViewController tableView](self, "tableView"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", a5 + 1));
    objc_msgSend(v11, "deleteSections:withRowAnimation:", v12, 0);
    goto LABEL_5;
  }
  if (a6 == 1)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[THBookmarkMenuPopoverViewController tableView](self, "tableView"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", a5 + 1));
    objc_msgSend(v11, "insertSections:withRowAnimation:", v12, 0);
LABEL_5:

  }
  -[THBookmarkMenuPopoverViewController p_syncWithStatusAnimated:](self, "p_syncWithStatusAnimated:", 1);

}

- (id)p_fetchedResultsControllerBookmarkIndexPathToTableViewBookmarkIndexPath:(id)a3
{
  if (a3)
    return (id)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", objc_msgSend(a3, "row"), 1));
  else
    return 0;
}

- (id)p_tableViewBookmarkIndexPathToFetchedResultsControllerBookmarkIndexPath:(id)a3
{
  if (a3)
    return (id)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", objc_msgSend(a3, "row"), 0));
  else
    return 0;
}

- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void **v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v10 = a7;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[THBookmarkMenuPopoverViewController p_fetchedResultsControllerBookmarkIndexPathToTableViewBookmarkIndexPath:](self, "p_fetchedResultsControllerBookmarkIndexPathToTableViewBookmarkIndexPath:", a5));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[THBookmarkMenuPopoverViewController p_fetchedResultsControllerBookmarkIndexPathToTableViewBookmarkIndexPath:](self, "p_fetchedResultsControllerBookmarkIndexPathToTableViewBookmarkIndexPath:", v10));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[THBookmarkMenuPopoverViewController tableView](self, "tableView"));
  switch(a6)
  {
    case 3uLL:
      v18 = v11;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));
      objc_msgSend(v13, "deleteRowsAtIndexPaths:withRowAnimation:", v15, 0);

      v17 = v12;
      v14 = &v17;
      goto LABEL_6;
    case 2uLL:
      v19 = v11;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v19, 1));
      objc_msgSend(v13, "deleteRowsAtIndexPaths:withRowAnimation:", v16, 0);
      goto LABEL_8;
    case 1uLL:
      v20 = v12;
      v14 = &v20;
LABEL_6:
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v14, 1));
      objc_msgSend(v13, "insertRowsAtIndexPaths:withRowAnimation:", v16, 0);
LABEL_8:

      break;
  }

}

- (void)controllerDidChangeContent:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "sections"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndex:", 0));

  if (!objc_msgSend(v5, "numberOfObjects"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[THBookmarkMenuPopoverViewController tableView](self, "tableView"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", 0, 1));
    v10 = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));
    objc_msgSend(v6, "insertRowsAtIndexPaths:withRowAnimation:", v8, 0);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[THBookmarkMenuPopoverViewController tableView](self, "tableView"));
  objc_msgSend(v9, "endUpdates");

  -[THBookmarkMenuPopoverViewController p_syncWithStatusAnimated:](self, "p_syncWithStatusAnimated:", 1);
}

- (void)p_handleNotificationVantageDidChange:(id)a3
{
  -[THBookmarkMenuPopoverViewController p_syncWithStatusAnimated:](self, "p_syncWithStatusAnimated:", 0);
}

- (void)p_navigationHistoryDidChange:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[THBookmarkMenuPopoverViewController viewDelegate](self, "viewDelegate", a3));
  objc_msgSend(v3, "dismissBookmarkMenu:completion:", 1, 0);

}

- (void)p_applicationDidEnterBackground:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[THBookmarkMenuPopoverViewController viewDelegate](self, "viewDelegate", a3));
  objc_msgSend(v3, "dismissBookmarkMenu:completion:", 0, 0);

}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (NSFetchedResultsController)bookmarkFetchedResultsController
{
  return self->_bookmarkFetchedResultsController;
}

- (void)setBookmarkFetchedResultsController:(id)a3
{
  objc_storeStrong((id *)&self->_bookmarkFetchedResultsController, a3);
}

- (THBookmarkMenuPopoverUserModelDelegate)delegate
{
  return (THBookmarkMenuPopoverUserModelDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (THBookmarkMenuPopoverViewDelegate)viewDelegate
{
  return (THBookmarkMenuPopoverViewDelegate *)objc_loadWeakRetained((id *)&self->_viewDelegate);
}

- (void)setViewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_viewDelegate, a3);
}

- (THReflowablePaginationController)reflowablePaginationController
{
  return (THReflowablePaginationController *)objc_loadWeakRetained((id *)&self->_reflowablePaginationController);
}

- (BEHairlineDividerView)headerDividerView
{
  return self->_headerDividerView;
}

- (void)setHeaderDividerView:(id)a3
{
  objc_storeStrong((id *)&self->_headerDividerView, a3);
}

- (BOOL)tornDown
{
  return self->_tornDown;
}

- (void)setTornDown:(BOOL)a3
{
  self->_tornDown = a3;
}

- (id)managedObjectContextDidSaveObserver
{
  return self->_managedObjectContextDidSaveObserver;
}

- (void)setManagedObjectContextDidSaveObserver:(id)a3
{
  objc_storeStrong(&self->_managedObjectContextDidSaveObserver, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_managedObjectContextDidSaveObserver, 0);
  objc_storeStrong((id *)&self->_headerDividerView, 0);
  objc_destroyWeak((id *)&self->_reflowablePaginationController);
  objc_destroyWeak((id *)&self->_viewDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_bookmarkFetchedResultsController, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
}

@end
