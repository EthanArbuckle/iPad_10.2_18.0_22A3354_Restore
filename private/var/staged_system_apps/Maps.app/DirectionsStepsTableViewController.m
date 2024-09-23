@implementation DirectionsStepsTableViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (Class)dataSourceClass
{
  return (Class)objc_opt_class(DirectionsStepsListDataSource);
}

- (DirectionsStepsTableViewController)init
{
  DirectionsStepsTableViewController *v2;
  DirectionsStepsTableViewController *v3;
  DirectionsStepsListDataSource *v4;
  DirectionsStepsListDataSource *dataSource;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DirectionsStepsTableViewController;
  v2 = -[DirectionsStepsTableViewController initWithNibName:bundle:](&v7, "initWithNibName:bundle:", 0, 0);
  v3 = v2;
  if (v2)
  {
    v4 = (DirectionsStepsListDataSource *)objc_alloc_init((Class)objc_msgSend((id)objc_opt_class(v2), "dataSourceClass"));
    dataSource = v3->_dataSource;
    v3->_dataSource = v4;

  }
  return v3;
}

- (UITableView)tableView
{
  -[DirectionsStepsTableViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  return (UITableView *)objc_loadWeakRetained((id *)&self->_tableView);
}

- (int64_t)tableViewStyle
{
  return 0;
}

- (void)viewDidLoad
{
  MapsThemeTableView *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  MapsThemeTableView *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  NSLayoutConstraint *v20;
  NSLayoutConstraint *tableTopEdgeConstraint;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  objc_super v33;

  v33.receiver = self;
  v33.super_class = (Class)DirectionsStepsTableViewController;
  -[DirectionsStepsTableViewController viewDidLoad](&v33, "viewDidLoad");
  v3 = [MapsThemeTableView alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsTableViewController view](self, "view"));
  objc_msgSend(v4, "bounds");
  v9 = -[MapsThemeTableView initWithFrame:style:](v3, "initWithFrame:style:", -[DirectionsStepsTableViewController tableViewStyle](self, "tableViewStyle"), v5, v6, v7, v8);

  -[MapsThemeTableView setTranslatesAutoresizingMaskIntoConstraints:](v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MapsThemeTableView setInsetsLayoutMarginsFromSafeArea:](v9, "setInsetsLayoutMarginsFromSafeArea:", 1);
  -[MapsThemeTableView setInsetsContentViewsToSafeArea:](v9, "setInsetsContentViewsToSafeArea:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor separatorColor](UIColor, "separatorColor"));
  -[MapsThemeTableView setSeparatorColor:](v9, "setSeparatorColor:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsTableViewController view](self, "view"));
  objc_msgSend(v11, "addSubview:", v9);

  -[DirectionsStepsTableViewController setTableView:](self, "setTableView:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsTableViewController dataSource](self, "dataSource"));
  objc_msgSend(v12, "setTableView:", v9);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsTableViewController dataSource](self, "dataSource"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsTableViewController tableView](self, "tableView"));
  objc_msgSend(v14, "setDelegate:", v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsTableViewController dataSource](self, "dataSource"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsTableViewController tableView](self, "tableView"));
  objc_msgSend(v16, "setDataSource:", v15);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsTableViewController view](self, "view"));
  LODWORD(v18) = 1148846080;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeTableView _maps_constraintsEqualToEdgesOfView:priority:](v9, "_maps_constraintsEqualToEdgesOfView:priority:", v17, v18));

  v20 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "topConstraint"));
  tableTopEdgeConstraint = self->_tableTopEdgeConstraint;
  self->_tableTopEdgeConstraint = v20;

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "allConstraints"));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsTableViewController dataSource](self, "dataSource"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsTableViewController view](self, "view"));
  objc_msgSend(v23, "setCollapsingHeaderSuperview:topAnchorConstraint:", v24, self->_tableTopEdgeConstraint);

  -[NSLayoutConstraint constant](self->_tableTopEdgeConstraint, "constant");
  self->_showsHairline = v25 > 2.22044605e-16;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsTableViewController dataSource](self, "dataSource"));
  objc_msgSend(v26, "setScrollDirectionHandler:", &stru_1011DA310);

  v27 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsTableViewController tableView](self, "tableView"));
  objc_msgSend(v28, "setTableFooterView:", v27);

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsTableViewController tableView](self, "tableView"));
  objc_msgSend(v29, "setBackgroundView:", 0);

  v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsTableViewController tableView](self, "tableView"));
  objc_msgSend(v31, "setBackgroundColor:", v30);

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsTableViewController tableView](self, "tableView"));
  objc_msgSend(v32, "setSeparatorInset:", 0.0, 16.0, 0.0, 16.0);

  -[DirectionsStepsTableViewController setDebugViewControllerEnabled:](self, "setDebugViewControllerEnabled:", -[DirectionsStepsTableViewController shouldShowDebugViewController](self, "shouldShowDebugViewController"));
}

- (void)viewDidLayoutSubviews
{
  double v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DirectionsStepsTableViewController;
  -[DirectionsStepsTableViewController viewDidLayoutSubviews](&v4, "viewDidLayoutSubviews");
  -[NSLayoutConstraint constant](self->_tableTopEdgeConstraint, "constant");
  if (self->_showsHairline != v3 > 2.22044605e-16)
    -[DirectionsStepsTableViewController setShowsHairline:](self, "setShowsHairline:", v3 > 2.22044605e-16);
}

- (void)viewLayoutMarginsDidChange
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DirectionsStepsTableViewController;
  -[DirectionsStepsTableViewController viewLayoutMarginsDidChange](&v4, "viewLayoutMarginsDidChange");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsTableViewController dataSource](self, "dataSource"));
  objc_msgSend(v3, "invalidateLayoutAndReloadData");

}

- (GEOComposedRoute)route
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsTableViewController dataSource](self, "dataSource"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "route"));

  return (GEOComposedRoute *)v3;
}

- (void)setRoute:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[DirectionsStepsTableViewController dataSource](self, "dataSource"));
  objc_msgSend(v5, "setRoute:", v4);

}

- (unint64_t)options
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsTableViewController dataSource](self, "dataSource"));
  v3 = objc_msgSend(v2, "options");

  return (unint64_t)v3;
}

- (void)setOptions:(unint64_t)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[DirectionsStepsTableViewController dataSource](self, "dataSource"));
  objc_msgSend(v4, "setOptions:", a3);

}

- (RouteStepListDelegate)delegate
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsTableViewController dataSource](self, "dataSource"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "delegate"));

  return (RouteStepListDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[DirectionsStepsTableViewController dataSource](self, "dataSource"));
  objc_msgSend(v5, "setDelegate:", v4);

}

- (id)routeStepForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsTableViewController dataSource](self, "dataSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "routeStepForIndexPath:", v4));

  return v6;
}

- (UIScrollViewDelegate)scrollViewDelegate
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsTableViewController dataSource](self, "dataSource"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "scrollViewDelegate"));

  return (UIScrollViewDelegate *)v3;
}

- (void)setScrollViewDelegate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[DirectionsStepsTableViewController dataSource](self, "dataSource"));
  objc_msgSend(v5, "setScrollViewDelegate:", v4);

}

- (NavigationDebugViewsController)debugViewsController
{
  NavigationDebugViewsController *debugViewsController;
  NavigationDebugViewsController *v4;
  NavigationDebugViewsController *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;

  debugViewsController = self->_debugViewsController;
  if (!debugViewsController)
  {
    v4 = -[NavigationDebugViewsController initWithDelegate:]([NavigationDebugViewsController alloc], "initWithDelegate:", 0);
    v5 = self->_debugViewsController;
    self->_debugViewsController = v4;

    -[NavigationDebugViewsController setShowTraceControlsForStaleLocations:](self->_debugViewsController, "setShowTraceControlsForStaleLocations:", 0);
    -[NavigationDebugViewsController setAutomaticallyHideTraceControls:](self->_debugViewsController, "setAutomaticallyHideTraceControls:", 0);
    -[NavigationDebugViewsController setUpCameraSnapshotPickerVCFromViewController:](self->_debugViewsController, "setUpCameraSnapshotPickerVCFromViewController:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
    v7 = objc_msgSend(v6, "isCurrentlyConnectedToCarAppScene");

    debugViewsController = self->_debugViewsController;
    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "chromeViewController"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mapView"));
      -[NavigationDebugViewsController setMapView:](debugViewsController, "setMapView:", v10);

      debugViewsController = self->_debugViewsController;
    }
  }
  return debugViewsController;
}

- (BOOL)shouldShowDebugViewController
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("PlaybackControls"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
    if (objc_msgSend(v6, "isCurrentlyConnectedToCarAppScene"))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
      v8 = objc_msgSend(v7, "isCarAppSceneHostingNavigation");

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsTableViewController dataSource](self, "dataSource"));
  if (objc_msgSend(v9, "enableNavigationUpdates"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    v11 = objc_msgSend(v10, "isNavigatingFromTrace");

  }
  else
  {
    v11 = 0;
  }

  return v4 & v8 & v11;
}

- (void)setDebugViewControllerEnabled:(BOOL)a3
{
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
  void *v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  CGFloat v25;
  void *v26;
  double v27;
  double v28;
  double Height;
  CGFloat v30;
  double left;
  double right;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  double bottom;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  _QWORD v50[3];
  CGRect v51;
  CGRect v52;
  CGRect v53;

  if (self->_debugViewControllerEnabled != a3)
  {
    self->_debugViewControllerEnabled = a3;
    if (a3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsTableViewController debugViewsController](self, "debugViewsController"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "debugControlsView"));

      objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsTableViewController view](self, "view"));
      objc_msgSend(v6, "addSubview:", v5);

      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leadingAnchor"));
      v47 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsTableViewController view](self, "view"));
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "safeAreaLayoutGuide"));
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "leadingAnchor"));
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "constraintEqualToAnchor:constant:", v44, 8.0));
      v48 = v5;
      v50[0] = v43;
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "trailingAnchor"));
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsTableViewController view](self, "view"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "safeAreaLayoutGuide"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "trailingAnchor"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:constant:", v8, -8.0));
      v50[1] = v9;
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bottomAnchor"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsTableViewController view](self, "view"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "safeAreaLayoutGuide"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bottomAnchor"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:constant:", v13, -8.0));
      v50[2] = v14;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v50, 3));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v15);

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsTableViewController debugViewsController](self, "debugViewsController"));
      objc_msgSend(v16, "didManuallyAddDebugViews");

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsTableViewController tableView](self, "tableView"));
      objc_msgSend(v17, "bounds");
      v19 = v18;
      v21 = v20;
      v23 = v22;
      v25 = v24;

      v26 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsTableViewController debugViewsController](self, "debugViewsController"));
      objc_msgSend(v26, "debugViewHeight");
      v28 = v27;

      v51.origin.x = v19;
      v51.origin.y = v21;
      v51.size.width = v23;
      v51.size.height = v25;
      Height = CGRectGetHeight(v51);
      v52.origin.x = v19;
      v52.origin.y = v21;
      v52.size.width = v23;
      v52.size.height = v28;
      v30 = Height - CGRectGetHeight(v52);
      objc_msgSend(v48, "setFrame:", 0.0, v30, v23, v28);
      left = UIEdgeInsetsZero.left;
      right = UIEdgeInsetsZero.right;
      v53.origin.x = 0.0;
      v53.origin.y = v30;
      v53.size.width = v23;
      v53.size.height = v28;
      v33 = CGRectGetHeight(v53);
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsTableViewController tableView](self, "tableView"));
      objc_msgSend(v34, "setContentInset:", UIEdgeInsetsZero.top, left, v33, right);

    }
    else if (self->_debugViewsController)
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsTableViewController debugViewsController](self, "debugViewsController"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "debugControlsView"));
      objc_msgSend(v36, "removeFromSuperview");

      v37 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsTableViewController debugViewsController](self, "debugViewsController"));
      objc_msgSend(v37, "didManuallyRemoveDebugViews");

      v38 = UIEdgeInsetsZero.left;
      bottom = UIEdgeInsetsZero.bottom;
      v40 = UIEdgeInsetsZero.right;
      v49 = (id)objc_claimAutoreleasedReturnValue(-[DirectionsStepsTableViewController tableView](self, "tableView"));
      objc_msgSend(v49, "setContentInset:", UIEdgeInsetsZero.top, v38, bottom, v40);

    }
  }
}

- (void)updateTheme
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DirectionsStepsTableViewController;
  -[MapsThemeViewController updateTheme](&v4, "updateTheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsTableViewController tableView](self, "tableView"));
  objc_msgSend(v3, "reloadData");

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsTableViewController dataSource](self, "dataSource"));
  objc_msgSend(v5, "suspendAutoscrollingToStep");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsTableViewController dataSource](self, "dataSource"));
  objc_msgSend(v6, "reloadData");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsTableViewController dataSource](self, "dataSource"));
  objc_msgSend(v7, "resumeAutoscrollingToStep");

  v8.receiver = self;
  v8.super_class = (Class)DirectionsStepsTableViewController;
  -[DirectionsStepsTableViewController viewWillAppear:](&v8, "viewWillAppear:", v3);
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DirectionsStepsTableViewController;
  -[DirectionsStepsTableViewController viewDidAppear:](&v5, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsTableViewController dataSource](self, "dataSource"));
  objc_msgSend(v4, "scrollToCurrentStep");

}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (DirectionsStepsListDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setTableView:(id)a3
{
  objc_storeWeak((id *)&self->_tableView, a3);
}

- (void)setDebugViewsController:(id)a3
{
  objc_storeStrong((id *)&self->_debugViewsController, a3);
}

- (BOOL)debugViewControllerEnabled
{
  return self->_debugViewControllerEnabled;
}

- (BOOL)showsHairline
{
  return self->_showsHairline;
}

- (void)setShowsHairline:(BOOL)a3
{
  self->_showsHairline = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugViewsController, 0);
  objc_destroyWeak((id *)&self->_tableView);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_tableTopEdgeConstraint, 0);
  objc_storeStrong((id *)&self->_doneButtonItem, 0);
}

@end
