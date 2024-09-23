@implementation MapsRouteListViewController

- (MapsRouteListViewController)initWithAvailableRoutes:(id)a3 unavailableRoutes:(id)a4 isAllSavedRoutes:(BOOL)a5
{
  id v8;
  id v9;
  MapsRouteListViewController *v10;
  MapsRouteListViewController *v11;
  void *v12;
  void *v13;
  void *v14;
  NSMutableArray *v15;
  NSMutableArray *routesData;
  NSMutableArray *v17;
  NSMutableArray *unavailableRoutes;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v20.receiver = self;
  v20.super_class = (Class)MapsRouteListViewController;
  v10 = -[MapsRouteListViewController initWithNibName:bundle:](&v20, "initWithNibName:bundle:", 0, 0);
  v11 = v10;
  if (v10)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v10, "cardPresentationController"));
    objc_msgSend(v12, "setPresentedModally:", 1);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v11, "cardPresentationController"));
    objc_msgSend(v13, "setTakesAvailableHeight:", 1);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v11, "cardPresentationController"));
    objc_msgSend(v14, "setHideGrabber:", 1);

    v15 = (NSMutableArray *)objc_msgSend(v8, "mutableCopy");
    routesData = v11->_routesData;
    v11->_routesData = v15;

    v17 = (NSMutableArray *)objc_msgSend(v9, "mutableCopy");
    unavailableRoutes = v11->_unavailableRoutes;
    v11->_unavailableRoutes = v17;

    v11->_isAllSavedRoutes = a5;
  }

  return v11;
}

- (void)dealloc
{
  objc_super v3;

  GEOConfigRemoveDelegateListenerForAllKeys(self, a2);
  v3.receiver = self;
  v3.super_class = (Class)MapsRouteListViewController;
  -[MapsRouteListViewController dealloc](&v3, "dealloc");
}

+ (BOOL)wantsDefaultHeaderContentViews
{
  return 1;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  MapsAddButton *v13;
  void *v14;
  void *v15;
  MapsAddButton *v16;
  id v17;
  void **v18;
  uint64_t v19;
  UINavigationItem *v20;
  void *v21;
  UINavigationItem *navItem;
  UINavigationBar *v23;
  void *v24;
  UINavigationBar *navBar;
  UINavigationBar *v26;
  _TtC4Maps14EmptyStateView *v27;
  _TtC4Maps14EmptyStateView *emptyState;
  void *v29;
  UITableView *v30;
  UITableView *tableView;
  UITableView *v32;
  uint64_t v33;
  objc_class *v34;
  NSString *v35;
  void *v36;
  UITableView *v37;
  uint64_t v38;
  objc_class *v39;
  NSString *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  UINavigationBar *v45;
  void *v46;
  void *v47;
  UINavigationBar *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  UINavigationBar *v67;
  void *v68;
  void *v69;
  void *v70;
  UINavigationItem *v71;
  void *v72;
  MapsAddButton *v73;
  void *v74;
  void *v75;
  objc_super v76;
  uint64_t v77;
  _QWORD v78[4];
  uint64_t v79;
  _QWORD v80[2];
  void *v81;

  v76.receiver = self;
  v76.super_class = (Class)MapsRouteListViewController;
  -[ContaineeViewController viewDidLoad](&v76, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRouteListViewController view](self, "view"));
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("RouteLibraryView"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRouteListViewController view](self, "view"));
  objc_msgSend(v5, "setBackgroundColor:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  objc_msgSend(v6, "setAccessibilityIdentifier:", CFSTR("RouteLibraryHeader"));
  LODWORD(v4) = -[MapsRouteListViewController _isForDisplayingUnavailableRoutes](self, "_isForDisplayingUnavailableRoutes");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = v7;
  if ((_DWORD)v4)
    v9 = CFSTR("[RouteCreation] Unavailable Route Library Title");
  else
    v9 = CFSTR("[RouteCreation] Route Library Title");
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", v9, CFSTR("localized string not found"), 0));

  v75 = (void *)v10;
  v11 = objc_claimAutoreleasedReturnValue(+[LibraryUIUtilities iOSNavbarTitleButtonItemWithTitle:](_TtC4Maps18LibraryUIUtilities, "iOSNavbarTitleButtonItemWithTitle:", v10));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[LibraryUIUtilities closeButtonItemWithTarget:action:](_TtC4Maps18LibraryUIUtilities, "closeButtonItemWithTarget:action:", self, "handleDismissAction:"));
  objc_storeStrong((id *)&self->_closeItem, v12);
  v13 = [MapsAddButton alloc];
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("[RouteCreation] Route Library Create"), CFSTR("localized string not found"), 0));
  v16 = -[MapsAddButton initWithTitle:](v13, "initWithTitle:", v15);

  -[MapsAddButton addTarget:action:forControlEvents:](v16, "addTarget:action:forControlEvents:", self, "_pressedCreate", 64);
  v73 = v16;
  v17 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithCustomView:", v16);
  objc_storeStrong((id *)&self->_createItem, v17);
  v74 = v12;
  v72 = v17;
  if (-[MapsRouteListViewController _isForDisplayingUnavailableRoutes](self, "_isForDisplayingUnavailableRoutes"))
  {
    v81 = v12;
    v18 = &v81;
    v19 = 1;
  }
  else
  {
    v80[0] = v12;
    v80[1] = v17;
    v18 = (void **)v80;
    v19 = 2;
  }
  v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v18, v19));
  v20 = (UINavigationItem *)objc_msgSend(objc_alloc((Class)UINavigationItem), "initWithTitle:", &stru_1011EB268);
  v79 = v11;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v79, 1));
  -[UINavigationItem setLeftBarButtonItems:](v20, "setLeftBarButtonItems:", v21);

  -[UINavigationItem setRightBarButtonItems:](v20, "setRightBarButtonItems:", v70);
  navItem = self->_navItem;
  self->_navItem = v20;
  v71 = v20;

  v23 = objc_opt_new(UINavigationBar);
  -[UINavigationBar setTranslatesAutoresizingMaskIntoConstraints:](v23, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationBar standardAppearance](v23, "standardAppearance"));
  objc_msgSend(v24, "configureWithTransparentBackground");

  -[UINavigationBar pushNavigationItem:animated:](v23, "pushNavigationItem:animated:", v71, 0);
  navBar = self->_navBar;
  self->_navBar = v23;
  v26 = v23;

  objc_msgSend(v6, "addSubview:", v26);
  v27 = objc_opt_new(_TtC4Maps14EmptyStateView);
  emptyState = self->_emptyState;
  self->_emptyState = v27;

  -[EmptyStateView setAccessibilityIdentifier:](self->_emptyState, "setAccessibilityIdentifier:", CFSTR("EmptyStateView"));
  -[EmptyStateView setTranslatesAutoresizingMaskIntoConstraints:](self->_emptyState, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:](UIImage, "_systemImageNamed:", CFSTR("location.bottomleft.forward.to.point.topright.scurvepath")));
  -[EmptyStateView setImage:](self->_emptyState, "setImage:", v29);

  v30 = (UITableView *)objc_msgSend(objc_alloc((Class)UITableView), "initWithFrame:style:", 2, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  tableView = self->_tableView;
  self->_tableView = v30;

  -[UITableView setTranslatesAutoresizingMaskIntoConstraints:](self->_tableView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UITableView setDataSource:](self->_tableView, "setDataSource:", self);
  -[UITableView setDelegate:](self->_tableView, "setDelegate:", self);
  v32 = self->_tableView;
  v33 = objc_opt_class(RouteLibraryCell);
  v34 = (objc_class *)objc_opt_class(RouteLibraryCell);
  v35 = NSStringFromClass(v34);
  v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
  -[UITableView registerClass:forCellReuseIdentifier:](v32, "registerClass:forCellReuseIdentifier:", v33, v36);

  v37 = self->_tableView;
  v38 = objc_opt_class(UITableViewCell);
  v39 = (objc_class *)objc_opt_class(UITableViewCell);
  v40 = NSStringFromClass(v39);
  v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
  -[UITableView registerClass:forCellReuseIdentifier:](v37, "registerClass:forCellReuseIdentifier:", v38, v41);

  v42 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, 0.0, 2.22507386e-308);
  -[UITableView setTableHeaderView:](self->_tableView, "setTableHeaderView:", v42);

  v43 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[UITableView setBackgroundColor:](self->_tableView, "setBackgroundColor:", v43);

  -[UITableView setSeparatorInset:](self->_tableView, "setSeparatorInset:", 0.0, 96.0, 0.0, 0.0);
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  objc_msgSend(v44, "setAccessibilityIdentifier:", CFSTR("RouteLibraryContentView"));

  -[UITableView setAccessibilityIdentifier:](self->_tableView, "setAccessibilityIdentifier:", CFSTR("RouteLibraryTableView"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationBar topAnchor](v26, "topAnchor"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topAnchor"));
  +[LibraryUIUtilities NavBarChromeHeaderTopYOffset](_TtC4Maps18LibraryUIUtilities, "NavBarChromeHeaderTopYOffset");
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "constraintEqualToAnchor:constant:", v65));
  v78[0] = v64;
  v45 = v26;
  v63 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationBar leadingAnchor](v26, "leadingAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leadingAnchor"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "constraintEqualToAnchor:", v46));
  v78[1] = v47;
  v48 = v45;
  v67 = v45;
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationBar trailingAnchor](v45, "trailingAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trailingAnchor"));
  v69 = (void *)v11;
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "constraintEqualToAnchor:", v50));
  v78[2] = v51;
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationBar bottomAnchor](v48, "bottomAnchor"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bottomAnchor"));
  v68 = v6;
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "constraintEqualToAnchor:", v53));
  v78[3] = v54;
  v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v78, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v55);

  v77 = objc_opt_class(UITraitUserInterfaceStyle);
  v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v77, 1));
  v57 = -[MapsRouteListViewController registerForTraitChanges:withTarget:action:](self, "registerForTraitChanges:withTarget:action:", v56, self, "_userInterfaceStyleDidChange");

  -[MapsRouteListViewController _updateContent](self, "_updateContent");
  -[MapsRouteListViewController _updateCreationButtons](self, "_updateCreationButtons");
  v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v58, "addObserver:selector:name:object:", self, "_updatedSavedRoutes:", CFSTR("MapsSavedRoutesDidUpdateNotification"), 0);

  v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v59, "addObserver:selector:name:object:", self, "_updateCreationButtons", CFSTR("UsingOfflineMapsStateChangedNotification"), 0);

  v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v60, "addObserver:selector:name:object:", self, "_updatedSavedRoutes:", MURouteSnapshotManagerDidPurgeNotification, 0);

  _GEOConfigAddDelegateListenerForKey(MapsConfig_RouteCreationAvailable, off_1014B55A8, &_dispatch_main_q, self);
  v61 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld"), -[NSMutableArray count](self->_routesData, "count")));

  objc_msgSend(v61, "captureUserAction:onTarget:eventValue:", 21, 135, v62);
}

- (void)didBecomeCurrent
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MapsRouteListViewController;
  -[ContaineeViewController didBecomeCurrent](&v3, "didBecomeCurrent");
  -[UITableView reloadData](self->_tableView, "reloadData");
}

- (void)_updatedSavedRoutes:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  id location;

  v4 = a3;
  if (self->_isAllSavedRoutes)
  {
    objc_initWeak(&location, self);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100BA7838;
    v5[3] = &unk_1011E7CA0;
    objc_copyWeak(&v6, &location);
    +[MapsSavedRoutesManager fetchSavedRoutesWithType:completion:](MapsSavedRoutesManager, "fetchSavedRoutesWithType:completion:", 3, v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }

}

- (void)_updateContent
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  _QWORD v27[4];

  if (self->_isAllSavedRoutes && !-[NSMutableArray count](self->_routesData, "count"))
  {
    -[MapsRouteListViewController _updateCreationButtons](self, "_updateCreationButtons");
    -[MapsRouteListViewController _updateEmptyState](self, "_updateEmptyState");
    -[UITableView removeFromSuperview](self->_tableView, "removeFromSuperview");
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
    objc_msgSend(v15, "addSubview:", self->_emptyState);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[EmptyStateView centerXAnchor](self->_emptyState, "centerXAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "centerXAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:"));
    v27[0] = v23;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[EmptyStateView centerYAnchor](self->_emptyState, "centerYAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "safeAreaLayoutGuide"));
    v22 = v16;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "centerYAnchor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:"));
    v27[1] = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[EmptyStateView leadingAnchor](self->_emptyState, "leadingAnchor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "leadingAnchor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintGreaterThanOrEqualToAnchor:constant:", v9, 16.0));
    v27[2] = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[EmptyStateView trailingAnchor](self->_emptyState, "trailingAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "trailingAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintLessThanOrEqualToAnchor:constant:", v13, 16.0));
    v27[3] = v14;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v27, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v17);

    v4 = v18;
  }
  else
  {
    -[MapsRouteListViewController _updateCreationButtons](self, "_updateCreationButtons");
    -[EmptyStateView removeFromSuperview](self->_emptyState, "removeFromSuperview");
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
    objc_msgSend(v3, "addSubview:", self->_tableView);

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView topAnchor](self->_tableView, "topAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "topAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:"));
    v26[0] = v23;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView leadingAnchor](self->_tableView, "leadingAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
    v22 = v5;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "leadingAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:"));
    v26[1] = v19;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView trailingAnchor](self->_tableView, "trailingAnchor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "trailingAnchor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:", v8));
    v26[2] = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView bottomAnchor](self->_tableView, "bottomAnchor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bottomAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v12));
    v26[3] = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v26, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v14);
  }

}

- (void)_updateCreationButtons
{
  int BOOL;
  void *v4;
  unsigned int v5;
  int v6;
  MapsAddButton *v7;
  void *v8;
  _TtC4Maps14EmptyStateView *emptyState;
  UIBarButtonItem *createItem;
  void *v11;
  MapsAddButton *v12;
  void *v13;
  void *v14;
  UIBarButtonItem *v15;
  _QWORD v16[2];
  UIBarButtonItem *closeItem;

  BOOL = GEOConfigGetBOOL(MapsConfig_RouteCreationAvailable, off_1014B55A8);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
  v5 = objc_msgSend(v4, "isUsingOfflineMaps");

  v6 = v5 | BOOL ^ 1;
  if (-[NSMutableArray count](self->_routesData, "count"))
  {
    if (v6)
    {
      closeItem = self->_closeItem;
      v7 = (MapsAddButton *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &closeItem, 1));
    }
    else
    {
      createItem = self->_createItem;
      v16[0] = self->_closeItem;
      v16[1] = createItem;
      v7 = (MapsAddButton *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v16, 2));
    }
    -[UINavigationItem setRightBarButtonItems:](self->_navItem, "setRightBarButtonItems:", v7);
    goto LABEL_8;
  }
  v15 = self->_closeItem;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
  -[UINavigationItem setRightBarButtonItems:](self->_navItem, "setRightBarButtonItems:", v8);

  emptyState = self->_emptyState;
  if (v6)
  {
    -[EmptyStateView setButton:](emptyState, "setButton:", 0);
    return;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[EmptyStateView button](emptyState, "button"));

  if (!v11)
  {
    v12 = [MapsAddButton alloc];
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("[RouteCreation] Route Library Create Route"), CFSTR("localized string not found"), 0));
    v7 = -[MapsAddButton initWithTitle:](v12, "initWithTitle:", v14);

    -[MapsAddButton addTarget:action:forControlEvents:](v7, "addTarget:action:forControlEvents:", self, "emptyStateCreateButtonTapped:", 64);
    -[MapsAddButton setAccessibilityIdentifier:](v7, "setAccessibilityIdentifier:", CFSTR("CardButtonActionButton"));
    -[EmptyStateView setButton:](self->_emptyState, "setButton:", v7);
LABEL_8:

  }
}

- (void)_enterRouteCreation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v3, "captureUserAction:onTarget:eventValue:", 465, 135, 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRouteListViewController view](self, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "window"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "windowScene"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "delegate"));

  v8 = objc_opt_class(MapsSceneDelegate);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
    v9 = v7;
  else
    v9 = 0;
  v10 = v9;

  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "appCoordinator"));
  objc_msgSend(v11, "enterRouteCreationWithRoute:originMapItem:destinationMapItem:userInfo:completion:", 0, 0, 0, 0, 0);

}

- (void)_userInterfaceStyleDidChange
{
  -[UITableView reloadData](self->_tableView, "reloadData");
}

- (void)_pressedCreate
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;

  v3 = sub_1004320DC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = 136315138;
    v6 = "-[MapsRouteListViewController _pressedCreate]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v5, 0xCu);
  }

  -[MapsRouteListViewController _enterRouteCreation](self, "_enterRouteCreation");
}

- (void)emptyStateCreateButtonTapped:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;

  v4 = sub_1004320DC();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 136315138;
    v7 = "-[MapsRouteListViewController emptyStateCreateButtonTapped:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v6, 0xCu);
  }

  -[MapsRouteListViewController _enterRouteCreation](self, "_enterRouteCreation");
}

- (void)_updateEmptyState
{
  void *v3;
  void *v4;
  void *v5;
  int BOOL;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id location;

  if (-[NSMutableArray count](self->_unavailableRoutes, "count"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("[RouteCreation] Route Library Unavailable Routes"), CFSTR("localized string not found"), 0));
    -[EmptyStateView setDisclosureTitle:](self->_emptyState, "setDisclosureTitle:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", CFSTR("%lu"), -[NSMutableArray count](self->_unavailableRoutes, "count")));
    -[EmptyStateView setDisclosureSubtitle:](self->_emptyState, "setDisclosureSubtitle:", v5);

    objc_initWeak(&location, self);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100BA841C;
    v15[3] = &unk_1011AD260;
    objc_copyWeak(&v16, &location);
    -[EmptyStateView setDisclosureAction:](self->_emptyState, "setDisclosureAction:", v15);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else
  {
    -[EmptyStateView setDisclosureTitle:](self->_emptyState, "setDisclosureTitle:", 0);
    -[EmptyStateView setDisclosureSubtitle:](self->_emptyState, "setDisclosureSubtitle:", 0);
    -[EmptyStateView setDisclosureAction:](self->_emptyState, "setDisclosureAction:", 0);
  }
  BOOL = GEOConfigGetBOOL(MapsConfig_RouteCreationAvailable, off_1014B55A8);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = v7;
  if (BOOL)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("[RouteCreation] Route Library Empty Title"), CFSTR("localized string not found"), 0));
    -[EmptyStateView setTitle:](self->_emptyState, "setTitle:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v11 = v10;
    v12 = CFSTR("[RouteCreation] Route Library Empty Detail");
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("[RouteCreation] Route Library Empty Unavailable Title"), CFSTR("localized string not found"), 0));
    -[EmptyStateView setTitle:](self->_emptyState, "setTitle:", v13);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v11 = v10;
    v12 = CFSTR("[RouteCreation] Route Library Empty Unavailable Detail");
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", v12, CFSTR("localized string not found"), 0));
  -[EmptyStateView setSubtitle:](self->_emptyState, "setSubtitle:", v14);

}

- (void)_presentUnavailableRoutesList
{
  void *v3;
  void *v4;
  MapsRouteListViewController *v5;

  v5 = -[MapsRouteListViewController initWithAvailableRoutes:unavailableRoutes:isAllSavedRoutes:]([MapsRouteListViewController alloc], "initWithAvailableRoutes:unavailableRoutes:isAllSavedRoutes:", 0, self->_unavailableRoutes, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController containeeDelegate](self, "containeeDelegate"));
  -[ContaineeViewController setContaineeDelegate:](v5, "setContaineeDelegate:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v4, "presentViewController:animated:completion:", v5, 1, 0);

}

- (BOOL)_isForDisplayingUnavailableRoutes
{
  return !self->_routesData && -[NSMutableArray count](self->_unavailableRoutes, "count") != 0;
}

- (id)_routeDataForSection:(int64_t)a3
{
  _BOOL4 v4;
  unsigned int v5;
  uint64_t v6;

  v4 = a3 != 0;
  v5 = -[MapsRouteListViewController _isForDisplayingUnavailableRoutes](self, "_isForDisplayingUnavailableRoutes");
  v6 = v4;
  if (v5)
    v6 = 1;
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                 + OBJC_IVAR___MapsRouteListViewController__routesData[v6]));
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if (!self->_routesData)
    return 1;
  if (-[NSMutableArray count](self->_unavailableRoutes, "count", a3))
    return 2;
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  char *v12;
  int v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;

  v6 = a3;
  if (a4 != 1)
  {
    if (a4)
    {
      v8 = sub_1004318FC();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v14 = 136315650;
        v15 = "-[MapsRouteListViewController tableView:numberOfRowsInSection:]";
        v16 = 2080;
        v17 = "MapsRouteListViewController.m";
        v18 = 1024;
        v19 = 401;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v14, 0x1Cu);
      }

      if (sub_100A70734())
      {
        v10 = sub_1004318FC();
        v11 = objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          v12 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v14 = 138412290;
          v15 = v12;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v14, 0xCu);

        }
      }
      a4 = 0;
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRouteListViewController _routeDataForSection:](self, "_routeDataForSection:", 0));
      a4 = (int64_t)objc_msgSend(v7, "count");

    }
  }

  return a4;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  objc_class *v10;
  NSString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  uint64_t v23;
  objc_class *v24;
  NSString *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  objc_class *v33;
  NSString *v34;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRouteListViewController _routeDataForSection:](self, "_routeDataForSection:", objc_msgSend(v7, "section")));
  v9 = objc_msgSend(v7, "section");
  if (v9 == (id)1)
  {
    v24 = (objc_class *)objc_opt_class(UITableViewCell);
    v25 = NSStringFromClass(v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", v26));

    objc_msgSend(v13, "setAccessoryType:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIListContentConfiguration valueCellConfiguration](UIListContentConfiguration, "valueCellConfiguration"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "secondaryTextProperties"));
    objc_msgSend(v28, "setColor:", v27);

    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("[RouteCreation] Route Library Unavailable Routes"), CFSTR("localized string not found"), 0));
    objc_msgSend(v14, "setText:", v30);

    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", CFSTR("%lu"), objc_msgSend(v8, "count")));
    objc_msgSend(v14, "setSecondaryText:", v31);

    objc_msgSend(v13, "setContentConfiguration:", v14);
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[UIBackgroundConfiguration listCellConfiguration](UIBackgroundConfiguration, "listCellConfiguration"));
    objc_msgSend(v32, "setCornerRadius:", 10.0);
    objc_msgSend(v13, "setBackgroundConfiguration:", v32);

  }
  else if (v9)
  {
    v33 = (objc_class *)objc_opt_class(UITableViewCell);
    v34 = NSStringFromClass(v33);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v34);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", v14));
  }
  else
  {
    v10 = (objc_class *)objc_opt_class(RouteLibraryCell);
    v11 = NSStringFromClass(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", v12));

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v7, "row")));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "traitCollection"));
    v16 = objc_msgSend(v15, "userInterfaceStyle");
    objc_msgSend(v6, "frame");
    objc_msgSend(v13, "setRouteData:delegate:userInterfaceStyle:inWidth:", v14, self, v16, v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "window"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "screen"));
    objc_msgSend(v19, "scale");
    v21 = v20;
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "traitCollection"));
    objc_msgSend(v13, "setSnapshotWithRouteData:scale:userInterfaceStyle:", v14, objc_msgSend(v22, "userInterfaceStyle"), v21);

    if (-[MapsRouteListViewController _isForDisplayingUnavailableRoutes](self, "_isForDisplayingUnavailableRoutes"))
      v23 = 0;
    else
      v23 = 3;
    objc_msgSend(v13, "setSelectionStyle:", v23);
  }

  return v13;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  void *v4;
  void *v5;

  if (a4
    || !-[MapsRouteListViewController _isForDisplayingUnavailableRoutes](self, "_isForDisplayingUnavailableRoutes", a3))
  {
    v5 = 0;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("[RouteCreation] Route Library Unavailable Message"), CFSTR("localized string not found"), 0));

  }
  return v5;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return UITableViewAutomaticDimension;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  GEOMapServiceTraits *v18;
  GEOMapServiceTraits *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  void *v36;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);
  if (!-[MapsRouteListViewController _isForDisplayingUnavailableRoutes](self, "_isForDisplayingUnavailableRoutes"))
  {
    v8 = objc_msgSend(v7, "section");
    if (v8 == (id)1)
    {
      -[MapsRouteListViewController _presentUnavailableRoutesList](self, "_presentUnavailableRoutesList");
    }
    else if (!v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_routesData, "objectAtIndexedSubscript:", objc_msgSend(v7, "row")));
      v10 = sub_1004320DC();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v34 = "-[MapsRouteListViewController tableView:didSelectRowAtIndexPath:]";
        v35 = 2112;
        v36 = v9;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
      }

      v12 = objc_msgSend(objc_alloc((Class)GEORouteBuilder_PersistentData), "initWithPersistentData:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "buildRoute"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRouteListViewController _maps_platformController](self, "_maps_platformController"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "chromeViewController"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "currentTraits"));
      v17 = v16;
      if (v16)
        v18 = v16;
      else
        v18 = objc_opt_new(GEOMapServiceTraits);
      v19 = v18;

      objc_initWeak((id *)buf, self);
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_100BA8E20;
      v29[3] = &unk_1011E7D18;
      objc_copyWeak(&v32, (id *)buf);
      v20 = v13;
      v30 = v20;
      v21 = v9;
      v31 = v21;
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_100BA8ED4;
      v25[3] = &unk_1011E7CC8;
      objc_copyWeak(&v28, (id *)buf);
      v26 = v6;
      v27 = v7;
      v22 = objc_msgSend(v20, "_maps_convertToNavigableRouteWithTraits:errorHandler:completionHandler:", v19, v29, v25);
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%llu"), objc_msgSend(v21, "tourMuid")));
      objc_msgSend(v23, "captureUserAction:onTarget:eventValue:", 480, 135, v24);

      objc_destroyWeak(&v28);
      objc_destroyWeak(&v32);
      objc_destroyWeak((id *)buf);

    }
  }

}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;
  void *v18;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "section") == (id)1)
  {
    v8 = 0;
  }
  else
  {
    objc_initWeak(&location, self);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("RowSwipe_Delete"), CFSTR("localized string not found"), 0));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100BA91A0;
    v14[3] = &unk_1011BBE58;
    objc_copyWeak(&v16, &location);
    v15 = v7;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIContextualAction contextualActionWithStyle:title:handler:](UIContextualAction, "contextualActionWithStyle:title:handler:", 1, v10, v14));
    v18 = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UISwipeActionsConfiguration configurationWithActions:](UISwipeActionsConfiguration, "configurationWithActions:", v12));

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return v8;
}

- (void)cell:(id)a3 didSelectDeleteRouteData:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  id v19;

  v6 = a3;
  v7 = a4;
  v8 = sub_1004320DC();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v17 = "-[MapsRouteListViewController cell:didSelectDeleteRouteData:]";
    v18 = 2112;
    v19 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%llu"), objc_msgSend(v7, "tourMuid")));
  objc_msgSend(v10, "captureUserAction:onTarget:eventValue:", 479, 135, v11);

  objc_initWeak((id *)buf, self);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100BA9760;
  v13[3] = &unk_1011AD1E8;
  objc_copyWeak(&v15, (id *)buf);
  v12 = v7;
  v14 = v12;
  -[MapsRouteListViewController _showDeleteConfirmationAlertForRouteDate:withCompletion:](self, "_showDeleteConfirmationAlertForRouteDate:withCompletion:", v12, v13);

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);

}

- (void)_showDeleteConfirmationAlertForRouteDate:(id)a3 withCompletion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[4];
  id v24;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userProvidedName"));
  if (objc_msgSend(v7, "length"))
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userProvidedName"));
  else
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "routeName"));
  v9 = (void *)v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  if (v9)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("[Route Library] Delete Alert Message"), CFSTR("localized string not found"), 0));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v9));

  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("[Route Library] Delete Alert Message No Name"), CFSTR("localized string not found"), 0));
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", 0, v12, 0));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "view"));
  objc_msgSend(v14, "setAccessibilityIdentifier:", CFSTR("DeleteAlert"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("[Route Library] Delete Option"), CFSTR("localized string not found"), 0));
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100BA9A5C;
  v23[3] = &unk_1011AD960;
  v24 = v5;
  v17 = v5;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v16, 2, v23));

  objc_msgSend(v18, "setAccessibilityIdentifier:", CFSTR("DeleteAction"));
  objc_msgSend(v13, "addAction:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("[Route Library] Cancel Option"), CFSTR("localized string not found"), 0));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v20, 1, 0));

  objc_msgSend(v21, "setAccessibilityIdentifier:", CFSTR("CancelAction"));
  objc_msgSend(v13, "addAction:", v21);
  -[MapsRouteListViewController _maps_topMostPresentViewController:animated:completion:](self, "_maps_topMostPresentViewController:animated:completion:", v13, 1, 0);

}

- (void)_deleteRouteData:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100BA9B70;
  v10[3] = &unk_1011BACE8;
  objc_copyWeak(&v13, &location);
  v8 = v6;
  v11 = v8;
  v9 = v7;
  v12 = v9;
  +[MapsSavedRoutesManager deleteRoute:completion:](MapsSavedRoutesManager, "deleteRoute:completion:", v8, v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

- (void)cell:(id)a3 didSelectViewMoreNotesForRouteData:(id)a4
{
  GEOComposedGeometryRoutePersistentData *v5;
  id v6;
  NSObject *v7;
  GEOComposedGeometryRoutePersistentData *selectedRouteData;
  int v9;
  const char *v10;
  __int16 v11;
  GEOComposedGeometryRoutePersistentData *v12;

  v5 = (GEOComposedGeometryRoutePersistentData *)a4;
  v6 = sub_1004320DC();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v9 = 136315394;
    v10 = "-[MapsRouteListViewController cell:didSelectViewMoreNotesForRouteData:]";
    v11 = 2112;
    v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v9, 0x16u);
  }

  selectedRouteData = self->_selectedRouteData;
  self->_selectedRouteData = v5;

  -[MapsRouteListViewController _pushSaveContaineeWithKeyboard:](self, "_pushSaveContaineeWithKeyboard:", 0);
}

- (void)cell:(id)a3 didSelectEditRouteData:(id)a4
{
  GEOComposedGeometryRoutePersistentData *v5;
  id v6;
  NSObject *v7;
  GEOComposedGeometryRoutePersistentData *selectedRouteData;
  int v9;
  const char *v10;
  __int16 v11;
  GEOComposedGeometryRoutePersistentData *v12;

  v5 = (GEOComposedGeometryRoutePersistentData *)a4;
  v6 = sub_1004320DC();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v9 = 136315394;
    v10 = "-[MapsRouteListViewController cell:didSelectEditRouteData:]";
    v11 = 2112;
    v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v9, 0x16u);
  }

  selectedRouteData = self->_selectedRouteData;
  self->_selectedRouteData = v5;

  -[MapsRouteListViewController _pushSaveContaineeWithKeyboard:](self, "_pushSaveContaineeWithKeyboard:", 1);
}

- (void)_pushSaveContaineeWithKeyboard:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  MapsSaveRouteContainee *v10;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController containeeDelegate](self, "containeeDelegate"));
  v6 = objc_opt_class(ActionCoordinator);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    v7 = v5;
  else
    v7 = 0;
  v8 = v7;

  v10 = -[MapsSaveRouteContainee initWithDelegate:isEditing:showInitialKeyboard:]([MapsSaveRouteContainee alloc], "initWithDelegate:isEditing:showInitialKeyboard:", self, 1, v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "containerViewController"));

  objc_msgSend(v9, "presentController:animated:", v10, 1);
}

- (void)cell:(id)a3 didSelectDirectionsRouteData:(id)a4
{
  id v6;
  char *v7;
  id v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  char *v15;
  MapsRouteListViewController *v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  char *v21;

  v6 = a3;
  v7 = (char *)a4;
  v8 = sub_1004320DC();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v19 = "-[MapsRouteListViewController cell:didSelectDirectionsRouteData:]";
    v20 = 2112;
    v21 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }

  if (self->_activeConversionRouteData)
  {
    v10 = sub_1004320DC();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v7;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Ignoring menu option as there's already an active route conversion: %@", buf, 0xCu);
    }

  }
  else
  {
    objc_storeStrong((id *)&self->_activeConversionRouteData, a4);
    objc_initWeak((id *)buf, self);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100BAA1A8;
    v14[3] = &unk_1011D8B20;
    objc_copyWeak(&v17, (id *)buf);
    v15 = v7;
    v16 = self;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "singleLocationUpdateWithHandler:", v14));

    objc_msgSend(v13, "start");
    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)buf);
  }

}

- (void)cell:(id)a3 didSelectDownloadRouteData:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  unsigned __int8 v29;
  void *v30;
  void *v31;
  id v32;
  _QWORD v33[5];
  id v34;
  unsigned __int8 v35;
  id location;
  _BYTE buf[24];
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;

  v6 = a3;
  v7 = a4;
  v8 = sub_1004320DC();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[MapsRouteListViewController cell:didSelectDownloadRouteData:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "boundingMapRegion"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[GEOMapRegion _maps_offlineDownloadRegionForRouteBounds:](GEOMapRegion, "_maps_offlineDownloadRegionForRouteBounds:", v10));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "boundingMapRegion"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[GEOMapRegion _maps_offlineCoverageRegionForRouteBounds:](GEOMapRegion, "_maps_offlineCoverageRegionForRouteBounds:", v12));

  if (v11 && v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController containeeDelegate](self, "containeeDelegate"));
    v15 = objc_opt_class(ActionCoordinator);
    if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
      v16 = v14;
    else
      v16 = 0;
    v17 = v16;

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "subscriptionInfoForRegion:", v13));

    if (v19)
    {
      objc_msgSend(v17, "viewControllerShowOfflineMaps:", self);
    }
    else
    {
      v32 = objc_msgSend(objc_alloc((Class)GEORouteBuilder_PersistentData), "initWithPersistentData:", v7);
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "buildRoute"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userProvidedName"));
      if (objc_msgSend(v20, "length"))
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userProvidedName"));
      else
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "routeName"));

      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v38 = sub_100BAAA7C;
      v39 = sub_100BAAA8C;
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRouteListViewController iosBasedChromeViewController](self, "iosBasedChromeViewController"));
      v40 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "acquireHikingMapToken"));

      v22 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRouteListViewController iosChromeViewController](self, "iosChromeViewController"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "mapView"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "_mapLayer"));
      v29 = objc_msgSend(v24, "applicationSubState");

      v25 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRouteListViewController iosChromeViewController](self, "iosChromeViewController"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "mapView"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "_mapLayer"));
      objc_msgSend(v27, "setApplicationSubState:", 1);

      objc_initWeak(&location, self);
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_100BAAA94;
      v33[3] = &unk_1011BC818;
      v33[4] = buf;
      objc_copyWeak(&v34, &location);
      v35 = v29;
      LOBYTE(v28) = 1;
      objc_msgSend(v17, "viewController:showOfflineMapRegionSelectorForRegion:name:route:shouldUseSessionlessAnalytics:shouldShowDataManagementAfterDownload:shouldShowDataManagementAfterDownloadIfRegionDiffers:dismissalBlock:", self, v11, v30, v31, 0, 0, v28, v33);
      objc_destroyWeak(&v34);
      objc_destroyWeak(&location);
      _Block_object_dispose(buf, 8);

    }
  }

}

- (double)heightForLayout:(unint64_t)a3
{
  void *v3;
  double v4;
  double v5;

  if (a3 - 3 > 2)
    return -1.0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v3, "availableHeight");
  v5 = v4;

  return v5;
}

- (id)routeData
{
  return self->_selectedRouteData;
}

- (void)popContainee
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController containeeDelegate](self, "containeeDelegate"));
  v3 = objc_opt_class(ActionCoordinator);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0)
    v4 = v2;
  else
    v4 = 0;
  v5 = v4;

  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "containerViewController"));
  objc_msgSend(v6, "popLastViewControllerAnimated:", 1);

}

- (void)valueChangedForGEOConfigKey:(id)a3
{
  if (a3.var0 == (_DWORD)MapsConfig_RouteCreationAvailable && a3.var1 == off_1014B55A8)
  {
    -[MapsRouteListViewController _updateCreationButtons](self, "_updateCreationButtons");
    -[MapsRouteListViewController _updateEmptyState](self, "_updateEmptyState");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_emptyState, 0);
  objc_storeStrong((id *)&self->_navBar, 0);
  objc_storeStrong((id *)&self->_navItem, 0);
  objc_storeStrong((id *)&self->_closeItem, 0);
  objc_storeStrong((id *)&self->_createItem, 0);
  objc_storeStrong((id *)&self->_unavailableRoutes, 0);
  objc_storeStrong((id *)&self->_routesData, 0);
  objc_storeStrong((id *)&self->_activeConversionRouteData, 0);
  objc_storeStrong((id *)&self->_selectedRouteData, 0);
}

@end
