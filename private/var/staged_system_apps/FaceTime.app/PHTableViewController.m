@implementation PHTableViewController

- (PHTableViewController)initWithStyle:(int64_t)a3
{
  PHTableViewController *v3;
  PHTableViewController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PHTableViewController;
  v3 = -[PHTableViewController initWithStyle:](&v6, "initWithStyle:", a3);
  v4 = v3;
  if (v3)
    -[PHTableViewController commonInit](v3, "commonInit");
  return v4;
}

- (PHTableViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  PHTableViewController *v4;
  PHTableViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PHTableViewController;
  v4 = -[PHTableViewController initWithNibName:bundle:](&v7, "initWithNibName:bundle:", a3, a4);
  v5 = v4;
  if (v4)
    -[PHTableViewController commonInit](v4, "commonInit");
  return v5;
}

- (PHTableViewController)initWithCoder:(id)a3
{
  PHTableViewController *v3;
  PHTableViewController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PHTableViewController;
  v3 = -[PHTableViewController initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[PHTableViewController commonInit](v3, "commonInit");
  return v4;
}

- (void)commonInit
{
  NSCache *v3;
  NSCache *rowHeightCache;
  PHTableViewController *v5;
  id v6;
  PHTableViewController *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  self->_contentUnavailable = 0;
  self->_needsReloadData = 1;
  v3 = (NSCache *)objc_alloc_init((Class)NSCache);
  rowHeightCache = self->_rowHeightCache;
  self->_rowHeightCache = v3;

  self->_whitePointAdaptivityStyle = 0;
  v11 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v11, "addObserver:selector:name:object:", self, "handleUIApplicationDidBecomeActiveNotification:", UIApplicationDidBecomeActiveNotification, 0);
  if (-[PHTableViewController conformsToProtocol:](self, "conformsToProtocol:", &OBJC_PROTOCOL___PHTabBarItemProtocol))
  {
    v5 = self;
    v6 = objc_alloc((Class)UITabBarItem);
    v7 = (PHTableViewController *)objc_claimAutoreleasedReturnValue(-[PHTableViewController tabBarItemTitle](v5, "tabBarItemTitle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHTableViewController tabBarItemImage](v5, "tabBarItemImage"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHTableViewController tabBarItemSelectedImage](v5, "tabBarItemSelectedImage"));

    v10 = objc_msgSend(v6, "initWithTitle:image:selectedImage:", v7, v8, v9);
LABEL_3:

    goto LABEL_4;
  }
  if (!-[PHTableViewController conformsToProtocol:](self, "conformsToProtocol:", &OBJC_PROTOCOL___PHTabBarSystemItemProtocol))
  {
    v10 = 0;
    goto LABEL_10;
  }
  v7 = self;
  v10 = objc_msgSend(objc_alloc((Class)UITabBarItem), "initWithTabBarSystemItem:tag:", -[PHTableViewController tabBarSystemItem](v7, "tabBarSystemItem"), -[PHTableViewController tabBarSystemItemTag](v7, "tabBarSystemItemTag"));
  if ((objc_opt_respondsToSelector(v7, "tabBarSystemItemTitle") & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHTableViewController tabBarSystemItemTitle](v7, "tabBarSystemItemTitle"));
    if (objc_msgSend(v8, "length"))
      objc_msgSend(v10, "_setInternalTitle:", v8);
    goto LABEL_3;
  }
LABEL_4:

LABEL_10:
  -[PHTableViewController setTabBarItem:](self, "setTabBarItem:", v10);

}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHTableViewController dataSourcePrefetchingOperationQueue](self, "dataSourcePrefetchingOperationQueue"));
  objc_msgSend(v3, "cancelAllOperations");

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)PHTableViewController;
  -[PHTableViewController dealloc](&v5, "dealloc");
}

- (NSOperationQueue)dataSourcePrefetchingOperationQueue
{
  NSOperationQueue *dataSourcePrefetchingOperationQueue;
  NSOperationQueue *v4;
  NSOperationQueue *v5;

  dataSourcePrefetchingOperationQueue = self->_dataSourcePrefetchingOperationQueue;
  if (!dataSourcePrefetchingOperationQueue)
  {
    v4 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    v5 = self->_dataSourcePrefetchingOperationQueue;
    self->_dataSourcePrefetchingOperationQueue = v4;

    -[NSOperationQueue setMaxConcurrentOperationCount:](self->_dataSourcePrefetchingOperationQueue, "setMaxConcurrentOperationCount:", 1);
    dataSourcePrefetchingOperationQueue = self->_dataSourcePrefetchingOperationQueue;
  }
  return dataSourcePrefetchingOperationQueue;
}

- (void)didReceiveMemoryWarning
{
  id v3;
  NSObject *v4;
  id v5;
  objc_super v6;
  uint8_t buf[4];
  id v8;

  v3 = sub_10000E6C4();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v8 = (id)objc_opt_class(self);
    v5 = v8;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ received memory warning, purging variables that can be dynamically restored.", buf, 0xCu);

  }
  v6.receiver = self;
  v6.super_class = (Class)PHTableViewController;
  -[PHTableViewController didReceiveMemoryWarning](&v6, "didReceiveMemoryWarning");
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PHTableViewController;
  -[PHTableViewController viewDidLoad](&v7, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHTableViewController navigationController](self, "navigationController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "navigationBar"));
  objc_msgSend(v4, "setPrefersLargeTitles:", 1);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHTableViewController tableView](self, "tableView"));
  objc_msgSend(v5, "setPrefetchDataSource:", self);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "addObserver:selector:name:object:", self, "handleUIContentSizeCategoryDidChangeNotification:", UIContentSizeCategoryDidChangeNotification, 0);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PHTableViewController;
  -[PHTableViewController viewWillAppear:](&v5, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "handleUIApplicationDidEnterBackgroundNotification:", UIApplicationDidEnterBackgroundNotification, 0);
  objc_msgSend(v4, "removeObserver:name:object:", self, UIApplicationWillEnterForegroundNotification, 0);
  -[PHTableViewController updateTitleDisplayModeIfNeeded:](self, "updateTitleDisplayModeIfNeeded:", 0);

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PHTableViewController;
  -[PHTableViewController viewWillDisappear:](&v5, "viewWillDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "handleUIApplicationWillEnterForegroundNotification:", UIApplicationWillEnterForegroundNotification, 0);
  objc_msgSend(v4, "removeObserver:name:object:", self, UIApplicationDidEnterBackgroundNotification, 0);

}

- (void)setContentUnavailable:(BOOL)a3
{
  -[PHTableViewController setContentUnavailable:animated:](self, "setContentUnavailable:animated:", a3, 0);
}

- (void)setContentUnavailable:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  void *v8;
  _QWORD *v9;
  _QWORD *v10;
  void *v11;
  _QWORD v12[5];
  BOOL v13;
  _QWORD v14[5];
  BOOL v15;

  if (self->_contentUnavailable != a3)
  {
    v4 = a4;
    self->_contentUnavailable = a3;
    if (a3
      || (v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHTableViewController contentUnavailableView](self, "contentUnavailableView")),
          v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "superview")),
          v8,
          v7,
          v8))
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_100039EB4;
      v14[3] = &unk_10008A278;
      v15 = a3;
      v14[4] = self;
      v9 = objc_retainBlock(v14);
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100039F40;
      v12[3] = &unk_100089908;
      v13 = a3;
      v12[4] = self;
      v10 = objc_retainBlock(v12);
      v11 = v10;
      if (v4)
      {
        +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 4, v10, v9, 0.300000012, 0.0);
      }
      else
      {
        ((void (*)(_QWORD *))v10[2])(v10);
        ((void (*)(_QWORD *, uint64_t))v9[2])(v9, 1);
      }

    }
  }
}

- (void)reloadDataIfNeeded
{
  void *v3;
  unsigned int v4;
  void *v5;

  if (-[PHTableViewController needsReloadData](self, "needsReloadData"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHTableViewController tableView](self, "tableView"));
    v4 = -[PHTableViewController tableViewCanPerformReloadData:](self, "tableViewCanPerformReloadData:", v3);

    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHTableViewController tableView](self, "tableView"));
      objc_msgSend(v5, "reloadData");

      -[PHTableViewController setNeedsReloadData:](self, "setNeedsReloadData:", 0);
    }
  }
}

- (int64_t)preferredWhitePointAdaptivityStyle
{
  return -[PHTableViewController whitePointAdaptivityStyle](self, "whitePointAdaptivityStyle");
}

- (PHContentUnavailable)contentUnavailableView
{
  PHContentUnavailable *contentUnavailableView;
  id v4;
  void *v5;
  PHContentUnavailable *v6;
  PHContentUnavailable *v7;
  void *v8;
  void *v9;

  contentUnavailableView = self->_contentUnavailableView;
  if (!contentUnavailableView)
  {
    v4 = objc_alloc((Class)_UIContentUnavailableView);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHTableViewController view](self, "view"));
    objc_msgSend(v5, "bounds");
    v6 = (PHContentUnavailable *)objc_msgSend(v4, "initWithFrame:title:", self->_contentUnavailableViewTitle);
    v7 = self->_contentUnavailableView;
    self->_contentUnavailableView = v6;

    -[PHContentUnavailable setAlpha:](self->_contentUnavailableView, "setAlpha:", 0.0);
    -[PHContentUnavailable setAutoresizingMask:](self->_contentUnavailableView, "setAutoresizingMask:", 18);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHTableViewController view](self, "view"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "backgroundColor"));
    -[PHContentUnavailable setBackgroundColor:](self->_contentUnavailableView, "setBackgroundColor:", v9);

    -[PHContentUnavailable setHidden:](self->_contentUnavailableView, "setHidden:", 1);
    contentUnavailableView = self->_contentUnavailableView;
  }
  return contentUnavailableView;
}

- (void)setContentUnavailableViewTitle:(id)a3
{
  NSString *v5;
  NSString *v6;

  v5 = (NSString *)a3;
  if (self->_contentUnavailableViewTitle != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_contentUnavailableViewTitle, a3);
    -[PHContentUnavailable setTitle:](self->_contentUnavailableView, "setTitle:", self->_contentUnavailableViewTitle);
    v5 = v6;
  }

}

- (void)makeUIForDefaultPNG
{
  void *v3;
  id v4;

  if (+[UIApplication shouldMakeUIForDefaultPNG](UIApplication, "shouldMakeUIForDefaultPNG"))
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[PHTableViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v4, "setLeftBarButtonItem:", 0);
    objc_msgSend(v4, "setRightBarButtonItem:", 0);
    objc_msgSend(v4, "setTitleView:", 0);
    -[PHTableViewController setContentUnavailableViewTitle:](self, "setContentUnavailableViewTitle:", 0);
    -[PHTableViewController setTabBarItem:](self, "setTabBarItem:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHTableViewController tableView](self, "tableView"));
    objc_msgSend(v3, "setHidden:", 1);

    -[PHTableViewController setTitle:](self, "setTitle:", 0);
  }
}

- (BOOL)shouldNavigationControllerPresentLargeTitles
{
  return 0;
}

- (void)updateTitleDisplayModeIfNeeded
{
  -[PHTableViewController updateTitleDisplayModeIfNeeded:](self, "updateTitleDisplayModeIfNeeded:", 1);
}

- (void)updateTitleDisplayModeIfNeeded:(BOOL)a3
{
  _BOOL4 v3;
  unsigned int v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  PHTableViewController *v11;
  void *v12;
  id v13;

  v3 = a3;
  if (-[PHTableViewController isViewLoaded](self, "isViewLoaded"))
  {
    v5 = -[PHTableViewController shouldNavigationControllerPresentLargeTitles](self, "shouldNavigationControllerPresentLargeTitles");
    if (v5)
      v6 = 1;
    else
      v6 = 2;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHTableViewController navigationItem](self, "navigationItem"));
    v8 = objc_msgSend(v7, "largeTitleDisplayMode");

    if (v8 != (id)v6)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHTableViewController navigationItem](self, "navigationItem"));
      objc_msgSend(v9, "setLargeTitleDisplayMode:", v6);

      if ((v3 & v5) == 1)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHTableViewController navigationController](self, "navigationController"));
        v11 = (PHTableViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "visibleViewController"));

        if (v11 == self)
        {
          v13 = (id)objc_claimAutoreleasedReturnValue(-[PHTableViewController navigationController](self, "navigationController"));
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "navigationBar"));
          objc_msgSend(v12, "sizeToFit");

        }
      }
    }
  }
}

- (void)setWhitePointAdaptivityStyle:(int64_t)a3
{
  if (self->_whitePointAdaptivityStyle != a3)
  {
    self->_whitePointAdaptivityStyle = a3;
    -[PHTableViewController setNeedsWhitePointAdaptivityStyleUpdate](self, "setNeedsWhitePointAdaptivityStyleUpdate");
  }
}

- (void)tableView:(id)a3 cancelPrefetchingForRowsAtIndexPaths:(id)a4
{
  id v4;
  id v5;
  void *i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *j;
  void *v15;
  void *v16;
  unsigned int v17;
  id obj;
  uint64_t v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];

  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = a4;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v4)
  {
    v5 = v4;
    v19 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v19)
          objc_enumerationMutation(obj);
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i), "hash")));
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v7));

        v23 = 0u;
        v24 = 0u;
        v21 = 0u;
        v22 = 0u;
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHTableViewController dataSourcePrefetchingOperationQueue](self, "dataSourcePrefetchingOperationQueue"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "operations"));

        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v22;
          do
          {
            for (j = 0; j != v12; j = (char *)j + 1)
            {
              if (*(_QWORD *)v22 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)j);
              v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "name"));
              v17 = objc_msgSend(v16, "isEqualToString:", v8);

              if (v17)
                objc_msgSend(v15, "cancel");
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          }
          while (v12);
        }

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v5);
  }

}

- (BOOL)tableViewCanPerformReloadData:(id)a3
{
  id v4;
  unsigned int v5;

  v4 = a3;
  if (-[PHTableViewController isReloadingData](self, "isReloadingData")
    || (objc_msgSend(v4, "_isAnimatingScroll") & 1) != 0
    || (objc_msgSend(v4, "_isAnimatingZoom") & 1) != 0
    || (objc_msgSend(v4, "isEditing") & 1) != 0
    || (objc_msgSend(v4, "isDragging") & 1) != 0
    || (objc_msgSend(v4, "isDecelerating") & 1) != 0
    || (objc_msgSend(v4, "isTracking") & 1) != 0
    || (objc_msgSend(v4, "isZoomBouncing") & 1) != 0)
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    v5 = objc_msgSend(v4, "isZooming") ^ 1;
  }

  return v5;
}

- (void)tableView:(id)a3 performReloadRowsAtIndexPaths:(id)a4 withRowAnimation:(int64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void **v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  PHTableViewController *v17;
  id v18;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (-[PHTableViewController tableViewCanPerformReloadData:](self, "tableViewCanPerformReloadData:", v10))
  {
    -[PHTableViewController setReloadingData:](self, "setReloadingData:", 1);
    +[CATransaction begin](CATransaction, "begin");
    v13 = _NSConcreteStackBlock;
    v14 = 3221225472;
    v15 = sub_10003A764;
    v16 = &unk_10008A2A0;
    v17 = self;
    v18 = v12;
    +[CATransaction setCompletionBlock:](CATransaction, "setCompletionBlock:", &v13);
    objc_msgSend(v10, "beginUpdates", v13, v14, v15, v16, v17);
    objc_msgSend(v10, "reloadRowsAtIndexPaths:withRowAnimation:", v11, a5);
    objc_msgSend(v10, "endUpdates");
    +[CATransaction commit](CATransaction, "commit");

  }
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v6;
  id v7;

  if (a4 == 1)
  {
    v6 = a5;
    v7 = (id)objc_claimAutoreleasedReturnValue(-[PHTableViewController rowHeightCache](self, "rowHeightCache"));
    objc_msgSend(v7, "removeObjectForKey:", v6);

  }
}

- (void)tableView:(id)a3 willBeginEditingRowAtIndexPath:(id)a4
{
  -[PHTableViewController setEditingRow:](self, "setEditingRow:", 1, a4);
}

- (void)tableView:(id)a3 didEndEditingRowAtIndexPath:(id)a4
{
  -[PHTableViewController setEditingRow:](self, "setEditingRow:", 0, a4);
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v7;
  id v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  NSNumber *v17;
  void *v18;
  id v19;
  CGRect v20;

  v7 = a5;
  v8 = a4;
  v19 = (id)objc_claimAutoreleasedReturnValue(-[PHTableViewController rowHeightCache](self, "rowHeightCache"));
  objc_msgSend(v8, "bounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v20.origin.x = v10;
  v20.origin.y = v12;
  v20.size.width = v14;
  v20.size.height = v16;
  v17 = +[NSNumber numberWithCGFloat:](NSNumber, "numberWithCGFloat:", CGRectGetHeight(v20));
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  objc_msgSend(v19, "setObject:forKey:", v18, v7);

}

- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v6;
  id v7;

  v6 = a5;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[PHTableViewController rowHeightCache](self, "rowHeightCache"));
  objc_msgSend(v7, "removeObjectForKey:", v6);

}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHTableViewController rowHeightCache](self, "rowHeightCache"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v5));

  if (v7)
  {
    objc_msgSend(v7, "CGFloatValue");
    v9 = v8;
  }
  else
  {
    v9 = UITableViewAutomaticDimension;
  }

  return v9;
}

- (void)handleUIContentSizeCategoryDidChangeNotification:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;

  v4 = a3;
  v5 = sub_10000E6C4();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412546;
    v10 = (id)objc_opt_class(self);
    v11 = 2112;
    v12 = v4;
    v7 = v10;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ is handling <%@>", (uint8_t *)&v9, 0x16u);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHTableViewController rowHeightCache](self, "rowHeightCache"));
  objc_msgSend(v8, "removeAllObjects");

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PHTableViewController;
  v4 = a3;
  -[PHTableViewController traitCollectionDidChange:](&v8, "traitCollectionDidChange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHTableViewController traitCollection](self, "traitCollection", v8.receiver, v8.super_class));
  v6 = objc_msgSend(v5, "userInterfaceStyle");

  v7 = objc_msgSend(v4, "userInterfaceStyle");
  if (v6 && v7 != v6)
  {
    if (-[PHTableViewController contentUnavailable](self, "contentUnavailable"))
    {
      -[PHTableViewController setContentUnavailable:](self, "setContentUnavailable:", 0);
      -[PHTableViewController setContentUnavailableView:](self, "setContentUnavailableView:", 0);
      -[PHTableViewController setContentUnavailable:](self, "setContentUnavailable:", 1);
    }
  }
}

- (BOOL)contentUnavailable
{
  return self->_contentUnavailable;
}

- (void)setContentUnavailableView:(id)a3
{
  objc_storeStrong((id *)&self->_contentUnavailableView, a3);
}

- (NSString)contentUnavailableViewTitle
{
  return self->_contentUnavailableViewTitle;
}

- (BOOL)isEditingRow
{
  return self->_editingRow;
}

- (void)setEditingRow:(BOOL)a3
{
  self->_editingRow = a3;
}

- (BOOL)needsReloadData
{
  return self->_needsReloadData;
}

- (void)setNeedsReloadData:(BOOL)a3
{
  self->_needsReloadData = a3;
}

- (BOOL)isReloadingData
{
  return self->_reloadingData;
}

- (void)setReloadingData:(BOOL)a3
{
  self->_reloadingData = a3;
}

- (NSCache)rowHeightCache
{
  return self->_rowHeightCache;
}

- (void)setRowHeightCache:(id)a3
{
  objc_storeStrong((id *)&self->_rowHeightCache, a3);
}

- (int64_t)whitePointAdaptivityStyle
{
  return self->_whitePointAdaptivityStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rowHeightCache, 0);
  objc_storeStrong((id *)&self->_contentUnavailableViewTitle, 0);
  objc_storeStrong((id *)&self->_contentUnavailableView, 0);
  objc_storeStrong((id *)&self->_dataSourcePrefetchingOperationQueue, 0);
}

@end
