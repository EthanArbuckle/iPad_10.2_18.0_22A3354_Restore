@implementation SettingsTableViewController

- (SettingsTableViewController)init
{
  SettingsTableViewController *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t IsEnabled_Alberta;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id location;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)SettingsTableViewController;
  v2 = -[SettingsTableViewController init](&v17, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, "_contentSizeCategoryDidChange", UIContentSizeCategoryDidChangeNotification, 0);

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, "reloadData", CFSTR("SettingsControllerDidChange"), 0);

    IsEnabled_Alberta = MapsFeature_IsEnabled_Alberta(v5);
    if ((_DWORD)IsEnabled_Alberta)
    {
      v2->_shouldShowMyVehicles = 1;
    }
    else if (MapsFeature_IsEnabled_EVRouting(IsEnabled_Alberta, v7))
    {
      objc_initWeak(&location, v2);
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[VGVirtualGarageService sharedService](VGVirtualGarageService, "sharedService"));
      objc_msgSend(v8, "registerObserver:", v2);

      v9 = (void *)objc_claimAutoreleasedReturnValue(+[VGVirtualGarageService sharedService](VGVirtualGarageService, "sharedService"));
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_1007A012C;
      v14[3] = &unk_1011AD100;
      objc_copyWeak(&v15, &location);
      objc_msgSend(v9, "virtualGarageGetGarageWithReply:", v14);

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[VGVirtualGarageService sharedService](VGVirtualGarageService, "sharedService"));
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_1007A021C;
      v12[3] = &unk_1011AD9D0;
      objc_copyWeak(&v13, &location);
      objc_msgSend(v10, "virtualGarageGetListOfUnpairedVehiclesWithReply:", v12);

      objc_destroyWeak(&v13);
      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  notify_cancel(self->_notifyToken);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, UIContentSizeCategoryDidChangeNotification, 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[VGVirtualGarageService sharedService](VGVirtualGarageService, "sharedService"));
  objc_msgSend(v4, "unregisterObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)SettingsTableViewController;
  -[SettingsTableViewController dealloc](&v5, "dealloc");
}

- (void)setupConstraints
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
  _QWORD v24[4];

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsTableViewController tableView](self, "tableView"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "leadingAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsTableViewController view](self, "view"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "leadingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v20));
  v24[0] = v19;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsTableViewController tableView](self, "tableView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "trailingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsTableViewController view](self, "view"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "trailingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v15));
  v24[1] = v14;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsTableViewController tableView](self, "tableView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bottomAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsTableViewController view](self, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bottomAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "constraintEqualToAnchor:", v5));
  v24[2] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsTableViewController tableView](self, "tableView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsTableViewController view](self, "view"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "topAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v10));
  v24[3] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v24, 4));

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v12);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  UIView *v5;
  double v6;
  const char *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id location;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SettingsTableViewController;
  -[SettingsTableViewController viewDidLoad](&v12, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsTableViewController tableView](self, "tableView"));
  objc_msgSend(v3, "setOpaque:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layer"));
  objc_msgSend(v4, "setAllowsGroupOpacity:", 0);

  objc_msgSend(v3, "_setHeaderAndFooterViewsFloat:", 0);
  v5 = objc_opt_new(UIView);
  objc_msgSend(v3, "setTableFooterView:", v5);

  objc_msgSend(v3, "setSeparatorStyle:", 0);
  objc_msgSend(v3, "setScrollEnabled:", 0);
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[SettingsTableViewController setupConstraints](self, "setupConstraints");
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(SettingsTableViewCell), CFSTR("SettingsTableViewCell_SegementedControl"));
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(SettingsTableViewCell), CFSTR("SettingsTableViewCell_ViewModeMenuItem"));
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(SettingsTableViewCell), CFSTR("SettingsTableViewCell_MenuItem"));
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(SettingsTableViewCell), CFSTR("SettingsTableViewCell_Attribution"));
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(SettingsTableViewCell), CFSTR("SettingsTableViewCell_Spacer"));
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(SettingsTableViewCell), CFSTR("SettingsTableViewCell_Environment"));
  -[SettingsTableViewController reloadData](self, "reloadData");
  -[SettingsTableViewController desiredHeight](self, "desiredHeight");
  -[SettingsTableViewController setPreferredContentSize:](self, "setPreferredContentSize:", 320.0, v6);
  objc_initWeak(&location, self);
  v7 = (const char *)GEOActiveTileGroupChangedNotification;
  v8 = &_dispatch_main_q;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1007A087C;
  v9[3] = &unk_1011BCB28;
  objc_copyWeak(&v10, &location);
  notify_register_dispatch(v7, &self->_notifyToken, (dispatch_queue_t)&_dispatch_main_q, v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SettingsTableViewController;
  -[SettingsTableViewController viewWillAppear:](&v6, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsTableViewController tableView](self, "tableView"));
  objc_msgSend(v5, "setBackgroundColor:", v4);

}

- (void)willMoveToParentViewController:(id)a3
{
  double v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SettingsTableViewController;
  -[SettingsTableViewController willMoveToParentViewController:](&v6, "willMoveToParentViewController:");
  if (a3)
  {
    -[SettingsTableViewController desiredHeight](self, "desiredHeight");
    -[SettingsTableViewController setPreferredContentSize:](self, "setPreferredContentSize:", 320.0, v5);
    -[SettingsTableViewController reloadData](self, "reloadData");
  }
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SettingsTableViewController;
  -[SettingsTableViewController viewDidLayoutSubviews](&v14, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsTableViewController tableView](self, "tableView"));
  objc_msgSend(v3, "frame");
  v5 = v4;

  if (v5 > 0.0)
  {
    -[SettingsTableViewController desiredHeight](self, "desiredHeight");
    -[SettingsTableViewController setPreferredContentSize:](self, "setPreferredContentSize:", 320.0, v6);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsTableViewController tableView](self, "tableView"));
  objc_msgSend(v7, "frame");
  v9 = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsTableViewController tableView](self, "tableView"));
  objc_msgSend(v10, "contentSize");
  v12 = v11;

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsTableViewController tableView](self, "tableView"));
  objc_msgSend(v13, "setScrollEnabled:", v12 > v9);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  double v8;
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  -[SettingsTableViewController desiredHeight](self, "desiredHeight");
  -[SettingsTableViewController setPreferredContentSize:](self, "setPreferredContentSize:", 320.0, v8);
  -[SettingsTableViewController reloadData](self, "reloadData");
  v9.receiver = self;
  v9.super_class = (Class)SettingsTableViewController;
  -[SettingsTableViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SettingsTableViewController;
  -[SettingsTableViewController viewDidAppear:](&v5, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("SettingsTableViewControllerDidAppearNotification"), self);

  -[SettingsTableViewController _reloadMyVehiclesVisibility](self, "_reloadMyVehiclesVisibility");
  -[SettingsTableViewController reloadData](self, "reloadData");
}

- (void)setUseCompactVerticalLayout:(BOOL)a3
{
  self->_useCompactVerticalLayout = a3;
  -[NSLayoutConstraint setActive:](self->_compactHeightConstraint, "setActive:");
}

- (void)virtualGarage:(id)a3 didUpdateUnpairedVehicles:(id)a4
{
  -[SettingsTableViewController _consumeUpdatedUnpairedVehicles:](self, "_consumeUpdatedUnpairedVehicles:", a4);
}

- (void)_consumeUpdatedVirtualGarage:(id)a3
{
  id v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1007A0C48;
  block[3] = &unk_1011AD1E8;
  objc_copyWeak(&v8, &location);
  v7 = v4;
  v5 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_consumeUpdatedUnpairedVehicles:(id)a3
{
  id v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1007A0D4C;
  block[3] = &unk_1011AD1E8;
  objc_copyWeak(&v8, &location);
  v7 = v4;
  v5 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_reloadMyVehiclesVisibility
{
  int shouldShowMyVehicles;
  int v4;
  void *v5;
  BOOL v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  _DWORD v10[2];

  shouldShowMyVehicles = self->_shouldShowMyVehicles;
  if ((MapsFeature_IsEnabled_Alberta(self) & 1) != 0)
  {
    v4 = 1;
    self->_shouldShowMyVehicles = 1;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[VGVirtualGarage vehicles](self->_virtualGarage, "vehicles"));
    if (objc_msgSend(v5, "count"))
      v6 = 1;
    else
      v6 = -[NSArray count](self->_unpairedVehicles, "count") != 0;
    self->_shouldShowMyVehicles = v6;

    v4 = self->_shouldShowMyVehicles;
  }
  if (shouldShowMyVehicles != v4 && -[SettingsTableViewController isViewLoaded](self, "isViewLoaded"))
  {
    v7 = sub_1004326FC();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = self->_shouldShowMyVehicles;
      v10[0] = 67109120;
      v10[1] = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Settings TableVC, shouldShowMyVehicles: %d, will update UI.", (uint8_t *)v10, 8u);
    }

    -[SettingsTableViewController reloadData](self, "reloadData");
  }
}

- (void)_environmnentNotification
{
  void *v3;
  unsigned int v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("EnableEnvironmentSelectionInSettings"));

  if (v4)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[SettingsTableViewController tableView](self, "tableView"));
    objc_msgSend(v5, "reloadData");

  }
}

- (void)reloadData
{
  NSArray *v3;
  NSArray *displaySections;
  NSDictionary *v5;
  NSDictionary *menuItemsPerSections;
  NSArray *v7;
  NSArray *lastDisplaySections;
  NSDictionary *v9;
  NSDictionary *lastMenuItemsPerSections;
  void *v11;

  if (-[SettingsTableViewController isViewLoaded](self, "isViewLoaded"))
  {
    if (!self->_isReloadingData)
    {
      self->_isReloadingData = 1;
      v3 = (NSArray *)objc_claimAutoreleasedReturnValue(-[SettingsTableViewController _displayableSectionsInTableView](self, "_displayableSectionsInTableView"));
      displaySections = self->_displaySections;
      self->_displaySections = v3;

      v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue(-[SettingsTableViewController _menuItemsPerSections:](self, "_menuItemsPerSections:", self->_displaySections));
      menuItemsPerSections = self->_menuItemsPerSections;
      self->_menuItemsPerSections = v5;

      -[SettingsTableViewController _updateTableViewCells](self, "_updateTableViewCells");
      v7 = (NSArray *)-[NSArray copy](self->_displaySections, "copy");
      lastDisplaySections = self->_lastDisplaySections;
      self->_lastDisplaySections = v7;

      v9 = (NSDictionary *)-[NSDictionary copy](self->_menuItemsPerSections, "copy");
      lastMenuItemsPerSections = self->_lastMenuItemsPerSections;
      self->_lastMenuItemsPerSections = v9;

      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v11, "postNotificationName:object:", CFSTR("SettingsTableViewControllerDidReloadDataNotification"), self);

      self->_isReloadingData = 0;
    }
  }
}

- (void)_updateTableViewCells
{
  void *i;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *j;
  uint64_t v13;
  void *v14;
  void *v15;
  NSUInteger v16;
  NSUInteger v17;
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
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id obj;
  uint64_t v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];

  if (!self->_lastDisplaySections || !self->_lastMenuItemsPerSections)
    return;
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableIndexSet indexSet](NSMutableIndexSet, "indexSet"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableIndexSet indexSet](NSMutableIndexSet, "indexSet"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableIndexSet indexSet](NSMutableIndexSet, "indexSet"));
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  obj = (id)qword_1014D32E8;
  v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
  if (!v35)
    goto LABEL_34;
  v34 = *(_QWORD *)v45;
  do
  {
    for (i = 0; i != v35; i = (char *)i + 1)
    {
      if (*(_QWORD *)v45 != v34)
        objc_enumerationMutation(obj);
      v4 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)i);
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1014D32F0, "objectForKeyedSubscript:", v4));
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_menuItemsPerSections, "objectForKeyedSubscript:", v4));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_lastMenuItemsPerSections, "objectForKeyedSubscript:", v4));
      if (!objc_msgSend(v6, "count") && objc_msgSend(v7, "count"))
      {
        v17 = -[NSArray indexOfObject:](self->_lastDisplaySections, "indexOfObject:", v4);
        v18 = v32;
        goto LABEL_31;
      }
      if (objc_msgSend(v6, "count") && !objc_msgSend(v7, "count"))
      {
        v17 = -[NSArray indexOfObject:](self->_displaySections, "indexOfObject:", v4);
        v18 = v31;
        goto LABEL_31;
      }
      v36 = v5;
      v37 = i;
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v8 = v5;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v41;
        do
        {
          for (j = 0; j != v10; j = (char *)j + 1)
          {
            if (*(_QWORD *)v41 != v11)
              objc_enumerationMutation(v8);
            v13 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)j);
            if ((objc_msgSend(v6, "containsObject:", v13) & 1) == 0
              && objc_msgSend(v7, "containsObject:", v13))
            {
              v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", objc_msgSend(v7, "indexOfObject:", v13), -[NSArray indexOfObject:](self->_lastDisplaySections, "indexOfObject:", v4)));
              v15 = v39;
LABEL_22:
              objc_msgSend(v15, "addObject:", v14);

              continue;
            }
            if (objc_msgSend(v6, "containsObject:", v13)
              && (objc_msgSend(v7, "containsObject:", v13) & 1) == 0)
            {
              v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", objc_msgSend(v6, "indexOfObject:", v13), -[NSArray indexOfObject:](self->_displaySections, "indexOfObject:", v4)));
              v15 = v38;
              goto LABEL_22;
            }
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
        }
        while (v10);
      }

      v5 = v36;
      i = v37;
      if (objc_msgSend(v4, "isEqual:", &off_10126ED88))
      {
        v16 = -[NSArray indexOfObject:](self->_lastDisplaySections, "indexOfObject:", v4);
        if (v16 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v17 = v16;
          v18 = v30;
LABEL_31:
          objc_msgSend(v18, "addIndex:", v17);
        }
      }

    }
    v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
  }
  while (v35);
LABEL_34:

  if (objc_msgSend(v39, "count")
    || objc_msgSend(v38, "count")
    || objc_msgSend(v29, "count")
    || objc_msgSend(v31, "count")
    || objc_msgSend(v32, "count"))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsTableViewController tableView](self, "tableView"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "superview"));

    if (v20)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsTableViewController tableView](self, "tableView"));
      objc_msgSend(v21, "beginUpdates");

      if (objc_msgSend(v39, "count"))
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsTableViewController tableView](self, "tableView"));
        objc_msgSend(v22, "deleteRowsAtIndexPaths:withRowAnimation:", v39, 0);

      }
      if (objc_msgSend(v38, "count"))
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsTableViewController tableView](self, "tableView"));
        objc_msgSend(v23, "insertRowsAtIndexPaths:withRowAnimation:", v38, 0);

      }
      if (objc_msgSend(v29, "count"))
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsTableViewController tableView](self, "tableView"));
        objc_msgSend(v24, "reloadRowsAtIndexPaths:withRowAnimation:", v29, 100);

      }
      if (objc_msgSend(v31, "count"))
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsTableViewController tableView](self, "tableView"));
        objc_msgSend(v25, "insertSections:withRowAnimation:", v31, 0);

      }
      if (objc_msgSend(v32, "count"))
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsTableViewController tableView](self, "tableView"));
        objc_msgSend(v26, "deleteSections:withRowAnimation:", v32, 0);

      }
      if (objc_msgSend(v30, "count"))
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsTableViewController tableView](self, "tableView"));
        objc_msgSend(v27, "reloadSections:withRowAnimation:", v30, 100);

      }
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsTableViewController tableView](self, "tableView"));
      objc_msgSend(v28, "endUpdates");

    }
  }

}

- (BOOL)_usesCompactMetrics
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsTableViewController traitCollection](self, "traitCollection"));
  v3 = objc_msgSend(v2, "horizontalSizeClass") == (id)1 && objc_msgSend(v2, "verticalSizeClass") == (id)1;

  return v3;
}

- (double)desiredHeight
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsTableViewController tableView](self, "tableView"));
  objc_msgSend(v2, "contentSize");
  v4 = v3;

  return v4;
}

- (id)_displayableSectionsInTableView
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  unsigned __int8 v7;
  id v8;

  v3 = objc_msgSend((id)qword_1014D32E8, "mutableCopy");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsTableViewController _menuItemsInSection:](self, "_menuItemsInSection:", 0));
  v5 = objc_msgSend(v4, "count");

  if (!v5)
    objc_msgSend(v3, "removeObject:", &off_10126ED58);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsTableViewController settingsController](self, "settingsController"));
  v7 = objc_msgSend(v6, "showsEnvironments");

  if ((v7 & 1) == 0)
    objc_msgSend(v3, "removeObject:", &off_10126ED70);
  v8 = objc_msgSend(v3, "copy");

  return v8;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return -[NSArray count](self->_displaySections, "count", a3);
}

- (int64_t)_sectionAtIndex:(int64_t)a3
{
  void *v5;
  id v6;

  if (a3 < 0 || -[NSArray count](self->_displaySections, "count") <= a3)
    return -1;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_displaySections, "objectAtIndexedSubscript:", a3));
  v6 = objc_msgSend(v5, "integerValue");

  return (int64_t)v6;
}

- (id)_menuItemsInSection:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v4 = (void *)qword_1014D32F0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v5));
  v7 = objc_msgSend(v6, "mutableCopy");

  if ((unint64_t)a3 > 2)
    v8 = 0;
  else
    v8 = objc_msgSend(v7, "copy");

  return v8;
}

- (id)_menuItemsPerSections:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsTableViewController _menuItemsInSection:](self, "_menuItemsInSection:", objc_msgSend(v11, "integerValue", (_QWORD)v15)));
        if (objc_msgSend(v12, "count"))
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  v13 = objc_msgSend(v5, "copy");
  return v13;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int64_t v5;
  NSDictionary *menuItemsPerSections;
  void *v7;
  void *v8;
  id v9;

  v5 = -[SettingsTableViewController _sectionAtIndex:](self, "_sectionAtIndex:", a4);
  if (v5 == -1)
    return 0;
  menuItemsPerSections = self->_menuItemsPerSections;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v5));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](menuItemsPerSections, "objectForKeyedSubscript:", v7));
  v9 = objc_msgSend(v8, "count");

  return (int64_t)v9;
}

- (id)_viewModeSelectionCellWithText:(id)a3
{
  return -[SettingsTableViewController _menuCellWithText:identifier:](self, "_menuCellWithText:identifier:", a3, CFSTR("SettingsTableViewCell_ViewModeMenuItem"));
}

- (id)_menuCellWithText:(id)a3
{
  return -[SettingsTableViewController _menuCellWithText:identifier:](self, "_menuCellWithText:identifier:", a3, CFSTR("SettingsTableViewCell_MenuItem"));
}

- (id)_menuCellWithText:(id)a3 identifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsTableViewController _cellWithIdentifier:setupBlock:](self, "_cellWithIdentifier:setupBlock:", a4, 0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "textLabel"));
  objc_msgSend(v8, "setText:", v6);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "textLabel"));
  objc_msgSend(v9, "setNumberOfLines:", 0);

  objc_msgSend(v7, "setAccessoryType:", 0);
  objc_msgSend(v7, "setUserInteractionEnabled:", 1);
  return v7;
}

- (id)_attributionCell
{
  void *v2;
  _QWORD v4[5];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1007A1B6C;
  v4[3] = &unk_1011C69D0;
  v4[4] = self;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsTableViewController _cellWithIdentifier:setupBlock:](self, "_cellWithIdentifier:setupBlock:", CFSTR("SettingsTableViewCell_Attribution"), v4));
  objc_msgSend(v2, "setAccessibilityIdentifier:", CFSTR("SettingsAttributionCell"));
  return v2;
}

- (id)_cellWithIdentifier:(id)a3 setupBlock:(id)a4
{
  id v6;
  void (**v7)(id, SettingsTableViewCell *);
  void *v8;
  SettingsTableViewCell *v9;

  v6 = a3;
  v7 = (void (**)(id, SettingsTableViewCell *))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsTableViewController tableView](self, "tableView"));
  v9 = (SettingsTableViewCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dequeueReusableCellWithIdentifier:", v6));

  if (!v9)
  {
    v9 = -[SettingsTableViewCell initWithReuseIdentifier:]([SettingsTableViewCell alloc], "initWithReuseIdentifier:", v6);
    if (!v7)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (v7)
LABEL_3:
    v7[2](v7, v9);
LABEL_4:

  return v9;
}

- (id)_cellForMapModeSelector
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsTableViewController _mapModeSelector](self, "_mapModeSelector"));
  objc_msgSend(v3, "refresh");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsTableViewController _cellWithIdentifier:setupBlock:](self, "_cellWithIdentifier:setupBlock:", CFSTR("SettingsTableViewCell_SegementedControl"), 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "superview"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentView"));

  if (v5 != v6)
  {
    objc_msgSend(v4, "setSelectionStyle:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentView"));
    objc_msgSend(v7, "addSubview:", v3);

    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentView"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "topAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v23));
    v26[0] = v22;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bottomAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentView"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "bottomAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v19));
    v26[1] = v18;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leadingAnchor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentView"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "leadingAnchor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v9));
    v26[2] = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "trailingAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentView"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "trailingAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:", v13));
    v26[3] = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v26, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v15);

  }
  return v4;
}

- (id)_environmentInfoCell
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  unsigned __int8 v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("EnableEnvironmentSelectionInSettings"));

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1007A23EC;
  v13[3] = &unk_1011C69F0;
  v14 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsTableViewController _cellWithIdentifier:setupBlock:](self, "_cellWithIdentifier:setupBlock:", CFSTR("SettingsTableViewCell_Environment"), v13));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "activeTileGroup"));
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "releaseInfo"));

  v9 = CFSTR("Unknown");
  if (v8)
    v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Environment: %@"), v9));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "textLabel"));
  objc_msgSend(v11, "setText:", v10);

  return v5;
}

- (id)_cellForMenuItem:(int64_t)a3
{
  void *v3;

  if (a3 == 3)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsTableViewController _environmentInfoCell](self, "_environmentInfoCell"));
  }
  else if (a3 == 2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsTableViewController _attributionCell](self, "_attributionCell"));
  }
  else if (a3)
  {
    v3 = 0;
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsTableViewController _cellForMapModeSelector](self, "_cellForMapModeSelector"));
  }
  return v3;
}

- (id)indexPathForMenuItem:(int64_t)a3
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsTableViewController tableView](self, "tableView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "visibleCells"));

  obj = v4;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "textLabel"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "text"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsTableViewController _cellForMenuItem:](self, "_cellForMenuItem:", a3));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "textLabel"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "text"));
        v15 = objc_msgSend(v11, "isEqual:", v14);

        if (v15)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsTableViewController tableView](self, "tableView"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "indexPathForCell:", v9));

          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v6)
        continue;
      break;
    }
  }
  v16 = 0;
LABEL_11:

  return v16;
}

- (id)mapAttributionButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MapsThemeButton buttonWithType:](MapsThemeButton, "buttonWithType:", 0));
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "titleLabel"));
  objc_msgSend(v4, "setNumberOfLines:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "titleLabel"));
  objc_msgSend(v5, "setTextAlignment:", 4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsTableViewController settingsController](self, "settingsController"));
  objc_msgSend(v3, "addTarget:action:forControlEvents:", v6, "presentAttributions", 64);

  return v3;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v5;
  id v6;

  v6 = a4;
  v5 = objc_opt_class(SettingsTableViewCell);
  if ((objc_opt_isKindOfClass(v6, v5) & 1) != 0)
    objc_msgSend(v6, "updateBeforeDisplayWithTextAlignment:", 4);

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  int64_t v6;
  NSDictionary *menuItemsPerSections;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;

  v5 = a4;
  v6 = -[SettingsTableViewController _sectionAtIndex:](self, "_sectionAtIndex:", objc_msgSend(v5, "section"));
  if (v6 == -1)
  {
    v13 = 0;
  }
  else
  {
    menuItemsPerSections = self->_menuItemsPerSections;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v6));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](menuItemsPerSections, "objectForKeyedSubscript:", v8));

    v10 = objc_msgSend(v5, "row");
    if (v10 >= objc_msgSend(v9, "count"))
    {
      v13 = 0;
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v5, "row")));
      v12 = objc_msgSend(v11, "integerValue");

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsTableViewController _cellForMenuItem:](self, "_cellForMenuItem:", v12));
    }

  }
  return v13;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return 0.0;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  return 0.0;
}

- (void)updateTheme
{
  void *v3;
  void *v4;
  NSArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsTableViewController tableView](self, "tableView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "visibleCells"));

  if (objc_msgSend(v4, "count"))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = self->_displaySections;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = 0;
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v5);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v10), "unsignedIntegerValue", (_QWORD)v13) == (id)2)
          {
            v11 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsTableViewController tableView](self, "tableView"));
            v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", (char *)v10 + v8));
            objc_msgSend(v11, "reloadSections:withRowAnimation:", v12, 5);

          }
          v10 = (char *)v10 + 1;
        }
        while (v7 != v10);
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        v8 += (uint64_t)v10;
      }
      while (v7);
    }

  }
}

- (id)_mapModeSelector
{
  MapViewModeGridSelector *mapModeSelector;
  MapViewModeGridSelector *v4;
  MapViewModeGridSelector *v5;
  void *v6;
  void *v7;
  NSLayoutConstraint *v8;
  NSLayoutConstraint *compactHeightConstraint;

  mapModeSelector = self->_mapModeSelector;
  if (!mapModeSelector)
  {
    v4 = objc_alloc_init(MapViewModeGridSelector);
    v5 = self->_mapModeSelector;
    self->_mapModeSelector = v4;

    -[MapViewModeGridSelector setDelegate:](self->_mapModeSelector, "setDelegate:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsTableViewController settingsController](self, "settingsController"));
    -[MapViewModeGridSelector setSettingsController:](self->_mapModeSelector, "setSettingsController:", v6);

    -[MapViewModeGridSelector setTranslatesAutoresizingMaskIntoConstraints:](self->_mapModeSelector, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapViewModeGridSelector heightAnchor](self->_mapModeSelector, "heightAnchor"));
    v8 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToConstant:", 260.0));
    compactHeightConstraint = self->_compactHeightConstraint;
    self->_compactHeightConstraint = v8;

    -[NSLayoutConstraint setActive:](self->_compactHeightConstraint, "setActive:", self->_useCompactVerticalLayout);
    mapModeSelector = self->_mapModeSelector;
  }
  return mapModeSelector;
}

- (void)mapViewModeGridSelector:(id)a3 selectedMapMode:(int64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsTableViewController settingsController](self, "settingsController", a3));
  v7 = objc_msgSend(v6, "selectedViewMode");

  if (v7 != (id)a4)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsTableViewController settingsController](self, "settingsController"));
    objc_msgSend(v8, "setSelectedViewMode:animated:", a4, 1);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsTableViewController settingsController](self, "settingsController"));
    v10 = (unint64_t)objc_msgSend(v9, "mapViewMode");

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    v12 = v11;
    if (v10 > 7)
      v13 = 0;
    else
      v13 = qword_100E3A548[v10];
    if (((v13 - 1) & 0xFFFFFFFFFFFFFFFALL) == 0)
      v13 = 2;
    if (v13 > 7)
      v14 = 0;
    else
      v14 = dword_100E3A588[v13];
    if (v10 + 1 > 7)
      v15 = 1;
    else
      v15 = dword_100E3A5A8[v10 + 1];
    objc_msgSend(v11, "captureUserAction:onTarget:eventValue:mapRegion:zoomLevel:mapType:", v14, 601, 0, 0, v15, 0.0);

    -[SettingsTableViewController reloadData](self, "reloadData");
  }
}

- (void)_handleSelectedMenuItem:(int64_t)a3
{
  id v3;
  id v4;

  if (a3 == 3)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[SettingsTableViewController settingsController](self, "settingsController"));
    objc_msgSend(v4, "proceedToEnvironmentsSelector");

  }
  else if (a3 == 2)
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(-[SettingsTableViewController settingsController](self, "settingsController"));
    objc_msgSend(v3, "presentAttributions");

  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  int64_t v7;
  NSDictionary *menuItemsPerSections;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;

  v14 = a3;
  v6 = a4;
  v7 = -[SettingsTableViewController _sectionAtIndex:](self, "_sectionAtIndex:", objc_msgSend(v6, "section"));
  if (v7 != -1)
  {
    menuItemsPerSections = self->_menuItemsPerSections;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v7));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](menuItemsPerSections, "objectForKeyedSubscript:", v9));

    v11 = objc_msgSend(v6, "row");
    if (v11 < objc_msgSend(v10, "count"))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v6, "row")));
      v13 = objc_msgSend(v12, "integerValue");

      -[SettingsTableViewController _handleSelectedMenuItem:](self, "_handleSelectedMenuItem:", v13);
    }

  }
  objc_msgSend(v14, "deselectRowAtIndexPath:animated:", v6, 1);

}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return (id)-[SettingsTableViewController _sectionAtIndex:](self, "_sectionAtIndex:", objc_msgSend(a4, "section", a3)) == (id)1;
}

- (BOOL)useCompactVerticalLayout
{
  return self->_useCompactVerticalLayout;
}

- (SettingsController)settingsController
{
  return (SettingsController *)objc_loadWeakRetained((id *)&self->_settingsController);
}

- (void)setSettingsController:(id)a3
{
  objc_storeWeak((id *)&self->_settingsController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_settingsController);
  objc_storeStrong((id *)&self->_compactHeightConstraint, 0);
  objc_storeStrong((id *)&self->_unpairedVehicles, 0);
  objc_storeStrong((id *)&self->_virtualGarage, 0);
  objc_storeStrong((id *)&self->_mapModeSelector, 0);
  objc_storeStrong((id *)&self->_lastMenuItemsPerSections, 0);
  objc_storeStrong((id *)&self->_lastDisplaySections, 0);
  objc_storeStrong((id *)&self->_menuItemsPerSections, 0);
  objc_storeStrong((id *)&self->_displaySections, 0);
}

@end
