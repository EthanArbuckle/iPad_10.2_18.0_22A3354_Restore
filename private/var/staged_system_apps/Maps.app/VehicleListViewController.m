@implementation VehicleListViewController

- (VehicleListViewController)init
{
  VehicleListViewController *v2;
  VehicleListViewController *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id location;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)VehicleListViewController;
  v2 = -[VehicleListViewController initWithNibName:bundle:](&v15, "initWithNibName:bundle:", 0, 0);
  v3 = v2;
  if (v2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v2, "cardPresentationController"));
    objc_msgSend(v4, "setPresentedModally:", 1);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v3, "cardPresentationController"));
    objc_msgSend(v5, "setTakesAvailableHeight:", 1);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[VGVirtualGarageService sharedService](VGVirtualGarageService, "sharedService"));
    objc_msgSend(v6, "registerObserver:", v3);

    objc_initWeak(&location, v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[VGVirtualGarageService sharedService](VGVirtualGarageService, "sharedService"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1007703E0;
    v12[3] = &unk_1011AD100;
    objc_copyWeak(&v13, &location);
    objc_msgSend(v7, "virtualGarageGetGarageWithReply:", v12);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[VGVirtualGarageService sharedService](VGVirtualGarageService, "sharedService"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1007704D0;
    v10[3] = &unk_1011AD9D0;
    objc_copyWeak(&v11, &location);
    objc_msgSend(v8, "virtualGarageGetListOfUnpairedVehiclesWithReply:", v10);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[VGVirtualGarageService sharedService](VGVirtualGarageService, "sharedService"));
  objc_msgSend(v3, "unregisterObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)VehicleListViewController;
  -[VehicleListViewController dealloc](&v4, "dealloc");
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  ContainerHeaderView *v8;
  double y;
  double width;
  double height;
  ContainerHeaderView *v12;
  void *v13;
  void *v14;
  void *v15;
  ContainerHeaderView *titleHeaderView;
  ContainerHeaderView *v17;
  UITableView *v18;
  UITableView *tableView;
  double v20;
  double v21;
  id v22;
  void *v23;
  UITableView *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)VehicleListViewController;
  -[ContaineeViewController viewDidLoad](&v28, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleListViewController view](self, "view"));
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("VehicleListView"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleListViewController view](self, "view"));
  objc_msgSend(v5, "setBackgroundColor:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v7 = sub_1002A8AA0(self) != 5;
  v8 = [ContainerHeaderView alloc];
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v12 = -[ContainerHeaderView initWithFrame:](v8, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[ContainerHeaderView setTranslatesAutoresizingMaskIntoConstraints:](v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[ContainerHeaderView setDelegate:](v12, "setDelegate:", self);
  -[ContainerHeaderView setHeaderSize:](v12, "setHeaderSize:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("[VirtualGarage] Vehicles"), CFSTR("localized string not found"), 0));
  -[ContainerHeaderView setTitle:](v12, "setTitle:", v14);

  -[ContainerHeaderView setHairLineAlpha:](v12, "setHairLineAlpha:", 0.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[ContainerHeaderView setBackgroundColor:](v12, "setBackgroundColor:", v15);

  objc_msgSend(v6, "addSubview:", v12);
  titleHeaderView = self->_titleHeaderView;
  self->_titleHeaderView = v12;
  v17 = v12;

  v18 = (UITableView *)objc_msgSend(objc_alloc((Class)UITableView), "initWithFrame:style:", 2, CGRectZero.origin.x, y, width, height);
  tableView = self->_tableView;
  self->_tableView = v18;

  -[UITableView setTranslatesAutoresizingMaskIntoConstraints:](self->_tableView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UITableView setAccessibilityIdentifier:](self->_tableView, "setAccessibilityIdentifier:", CFSTR("VehicleListTableView"));
  LODWORD(v20) = 1148846080;
  -[UITableView setContentCompressionResistancePriority:forAxis:](self->_tableView, "setContentCompressionResistancePriority:forAxis:", 0, v20);
  LODWORD(v21) = 1148846080;
  -[UITableView setContentCompressionResistancePriority:forAxis:](self->_tableView, "setContentCompressionResistancePriority:forAxis:", 1, v21);
  v22 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, 0.0, 2.22507386e-308);
  -[UITableView setTableHeaderView:](self->_tableView, "setTableHeaderView:", v22);

  -[UITableView setDataSource:](self->_tableView, "setDataSource:", self);
  -[UITableView setDelegate:](self->_tableView, "setDelegate:", self);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[UITableView setBackgroundColor:](self->_tableView, "setBackgroundColor:", v23);

  v24 = self->_tableView;
  v25 = objc_opt_class(VehicleCell);
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[VehicleCell reuseIdentifier](VehicleCell, "reuseIdentifier"));
  -[UITableView registerClass:forCellReuseIdentifier:](v24, "registerClass:forCellReuseIdentifier:", v25, v26);

  -[UITableView registerClass:forCellReuseIdentifier:](self->_tableView, "registerClass:forCellReuseIdentifier:", objc_opt_class(UITableViewCell), CFSTR("kAddNewCarCellIdentifier"));
  -[UITableView registerClass:forCellReuseIdentifier:](self->_tableView, "registerClass:forCellReuseIdentifier:", objc_opt_class(UITableViewCell), CFSTR("kOnboardingCellIdentifier"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  objc_msgSend(v27, "addSubview:", self->_tableView);

  -[VehicleListViewController _setupConstraints](self, "_setupConstraints");
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  objc_super v9;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VehicleListViewController;
  -[ContaineeViewController viewWillAppear:](&v9, "viewWillAppear:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleListViewController traitCollection](self, "traitCollection"));
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
    objc_msgSend(v7, "setLockedOrientations:", 2);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    objc_msgSend(v8, "setOrientation:animated:", 1, v3);

  }
  -[VehicleListViewController _refreshSavedVehiclesStates](self, "_refreshSavedVehiclesStates");
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  id v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VehicleListViewController;
  -[ContaineeViewController viewWillDisappear:](&v7, "viewWillDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleListViewController traitCollection](self, "traitCollection"));
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
    objc_msgSend(v6, "setLockedOrientations:", 0);

  }
}

- (void)_setupConstraints
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
  _QWORD v36[8];

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView topAnchor](self->_titleHeaderView, "topAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "topAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", v33));
  v36[0] = v32;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView leadingAnchor](self->_titleHeaderView, "leadingAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "leadingAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:", v29));
  v36[1] = v28;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView trailingAnchor](self->_titleHeaderView, "trailingAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "trailingAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v25));
  v36[2] = v24;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView bottomAnchor](self->_titleHeaderView, "bottomAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "bottomAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v21));
  v36[3] = v20;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView topAnchor](self->_tableView, "topAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "topAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v17));
  v36[4] = v16;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView leadingAnchor](self->_tableView, "leadingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "leadingAnchor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v13));
  v36[5] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView trailingAnchor](self->_tableView, "trailingAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "trailingAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:", v6));
  v36[6] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView bottomAnchor](self->_tableView, "bottomAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v10));
  v36[7] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v36, 8));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v12);

}

- (void)setSavedVehicles:(id)a3
{
  id v5;
  NSArray **p_savedVehicles;
  id v7;
  unint64_t v8;
  unsigned __int8 v9;
  id v10;
  NSObject *v11;
  NSUInteger v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  __CFString *v17;
  uint8_t buf[4];
  NSUInteger v19;
  __int16 v20;
  id v21;
  __int16 v22;
  __CFString *v23;

  v5 = a3;
  p_savedVehicles = &self->_savedVehicles;
  v7 = *p_savedVehicles;
  v8 = (unint64_t)v5;
  if (v8 | (unint64_t)v7)
  {
    v9 = objc_msgSend(v7, "isEqual:", v8);

    if ((v9 & 1) == 0)
    {
      v10 = sub_1004326FC();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = -[NSArray count](*p_savedVehicles, "count");
        v13 = objc_msgSend((id)v8, "count");
        v14 = (id)v8;
        v15 = v14;
        if (v8)
        {
          if (objc_msgSend(v14, "count"))
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "componentsJoinedByString:", CFSTR(", ")));
            v17 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> [%@]"), v15, v16));

          }
          else
          {
            v17 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> (empty)"), v15));
          }
        }
        else
        {
          v17 = CFSTR("<nil>");
        }

        *(_DWORD *)buf = 134218498;
        v19 = v12;
        v20 = 2048;
        v21 = v13;
        v22 = 2112;
        v23 = v17;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "VehicleListVC - vehicles updated. count from: %lu to: %lu, detail: %@", buf, 0x20u);

      }
      objc_storeStrong((id *)p_savedVehicles, a3);
    }
  }

}

- (void)setUnpairedVehicles:(id)a3
{
  id v5;
  NSArray **p_unpairedVehicles;
  id v7;
  unint64_t v8;
  unsigned __int8 v9;
  id v10;
  NSObject *v11;
  NSUInteger v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  __CFString *v17;
  uint8_t buf[4];
  NSUInteger v19;
  __int16 v20;
  id v21;
  __int16 v22;
  __CFString *v23;

  v5 = a3;
  p_unpairedVehicles = &self->_unpairedVehicles;
  v7 = *p_unpairedVehicles;
  v8 = (unint64_t)v5;
  if (v8 | (unint64_t)v7)
  {
    v9 = objc_msgSend(v7, "isEqual:", v8);

    if ((v9 & 1) == 0)
    {
      v10 = sub_1004326FC();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = -[NSArray count](*p_unpairedVehicles, "count");
        v13 = objc_msgSend((id)v8, "count");
        v14 = (id)v8;
        v15 = v14;
        if (v8)
        {
          if (objc_msgSend(v14, "count"))
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "componentsJoinedByString:", CFSTR(", ")));
            v17 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> [%@]"), v15, v16));

          }
          else
          {
            v17 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> (empty)"), v15));
          }
        }
        else
        {
          v17 = CFSTR("<nil>");
        }

        *(_DWORD *)buf = 134218498;
        v19 = v12;
        v20 = 2048;
        v21 = v13;
        v22 = 2112;
        v23 = v17;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "VehicleListVC - unpaired vehicles updated. count from: %lu to: %lu, detail: %@", buf, 0x20u);

      }
      objc_storeStrong((id *)p_unpairedVehicles, a3);
    }
  }

}

- (id)actionCoordinator
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleListViewController _maps_mapsSceneDelegate](self, "_maps_mapsSceneDelegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "appCoordinator"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "baseActionCoordinator"));

  return v4;
}

- (void)_consumeUpdatedVirtualGarage:(id)a3
{
  id v3;
  _QWORD v4[5];
  id v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100771308;
  v4[3] = &unk_1011AC8B0;
  v4[4] = self;
  v5 = a3;
  v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);

}

- (void)_consumeUpdatedUnpairedVehicles:(id)a3
{
  id v3;
  _QWORD v4[5];
  id v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1007715F0;
  v4[3] = &unk_1011AC8B0;
  v4[4] = self;
  v5 = a3;
  v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);

}

- (BOOL)_isIndexPathOfAddNewCarCell:(id)a3
{
  id v4;
  BOOL v5;
  id v6;

  v4 = a3;
  if (objc_msgSend(v4, "section"))
  {
    v5 = 0;
  }
  else
  {
    v6 = objc_msgSend(v4, "row");
    v5 = v6 == (id)-[NSArray count](self->_savedVehicles, "count");
  }

  return v5;
}

- (void)_refreshSavedVehiclesStates
{
  NSArray *savedVehicles;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  savedVehicles = self->_savedVehicles;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100771854;
  v4[3] = &unk_1011C5FA0;
  objc_copyWeak(&v5, &location);
  -[NSArray enumerateObjectsUsingBlock:](savedVehicles, "enumerateObjectsUsingBlock:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_updateVehicle:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  UITableView *tableView;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t buf[4];
  unint64_t v20;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleListViewController savedVehicles](self, "savedVehicles"));
  v8 = objc_msgSend(v7, "count");

  if ((unint64_t)v8 <= a4)
  {
    v14 = sub_1004326FC();
    v9 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v20 = a4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Tried to update a vehicle at index out of bounds: %ld", buf, 0xCu);
    }
  }
  else if (v6)
  {
    v9 = -[NSArray mutableCopy](self->_savedVehicles, "mutableCopy");
    -[NSObject replaceObjectAtIndex:withObject:](v9, "replaceObjectAtIndex:withObject:", a4, v6);
    v10 = -[NSObject copy](v9, "copy");
    -[VehicleListViewController setSavedVehicles:](self, "setSavedVehicles:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", a4, 0));
    tableView = self->_tableView;
    v18 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));
    -[UITableView reloadRowsAtIndexPaths:withRowAnimation:](tableView, "reloadRowsAtIndexPaths:withRowAnimation:", v13, 100);

  }
  else
  {
    v15 = sub_1004326FC();
    v9 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleListViewController savedVehicles](self, "savedVehicles"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectAtIndexedSubscript:", a4));
      *(_DWORD *)buf = 138412290;
      v20 = (unint64_t)v17;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Tried to update a vehicle with a nil vehicle.: %@", buf, 0xCu);

    }
  }

}

- (BOOL)_shouldShowUnpairedVehicles
{
  if (MapsFeature_IsEnabled_EVRouting(self, a2) && -[NSArray count](self->_unpairedVehicles, "count"))
    return IsEVRoutingSupported();
  else
    return 0;
}

- (BOOL)_shouldShowManualAddCell
{
  int IsEnabled_Alberta;

  IsEnabled_Alberta = MapsFeature_IsEnabled_Alberta(self);
  if (IsEnabled_Alberta)
    LOBYTE(IsEnabled_Alberta) = sub_1002A8AA0(self) != 5;
  return IsEnabled_Alberta;
}

- (void)headerViewButtonTapped:(id)a3 buttonType:(unint64_t)a4
{
  void *v5;
  id v6;

  v6 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v5, "captureUserAction:onTarget:eventValue:", 34, 660, 0);

  -[ContaineeViewController handleDismissAction:](self, "handleDismissAction:", v6);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return UITableViewAutomaticDimension;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  NSUInteger v7;
  int64_t v8;
  id v9;
  NSObject *v10;
  uint8_t v12[16];

  v6 = a3;
  if (a4 == 1)
  {
    v8 = -[VehicleListViewController _shouldShowUnpairedVehicles](self, "_shouldShowUnpairedVehicles");
  }
  else if (a4)
  {
    v9 = sub_1004326FC();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "Invalid section count in VehicleListVC", v12, 2u);
    }

    v8 = 0;
  }
  else
  {
    v7 = -[NSArray count](self->_savedVehicles, "count");
    v8 = v7 + -[VehicleListViewController _shouldShowManualAddCell](self, "_shouldShowManualAddCell");
  }

  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  UITableViewCell *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSArray *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "section");
  if (v8 == (id)1)
  {
    v9 = (UITableViewCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("kOnboardingCellIdentifier"), v7));
    -[UITableViewCell setAccessibilityIdentifier:](v9, "setAccessibilityIdentifier:", CFSTR("OnboardVehicleCell"));
    v15 = self->_unpairedVehicles;
    if (-[NSArray count](v15, "count"))
    {
      if ((id)-[NSArray count](v15, "count") == (id)1 || sub_100BA0B0C(v15))
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("Onboard vehicles from VG [Title, VG, Onboarding, Single]"), CFSTR("localized string not found"), 0));

        v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray firstObject](v15, "firstObject"));
        v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "manufacturer"));
        v20 = (void *)v19;
        if (v19)
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v17, v19));
        }
        else
        {
          v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray firstObject](v15, "firstObject"));
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "displayName"));
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v17, v26));

        }
      }
      else
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("Onboard vehicles from VG [Title, VG, Onboarding, Multiple]"), CFSTR("localized string not found"), 0));
      }

    }
    else
    {
      v21 = 0;
    }

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewCell textLabel](v9, "textLabel"));
    objc_msgSend(v27, "setText:", v21);

    v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewCell textLabel](v9, "textLabel"));
    objc_msgSend(v29, "setTextColor:", v28);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewCell textLabel](v9, "textLabel"));
    objc_msgSend(v13, "setAccessibilityIdentifier:", CFSTR("OnboardVehicleCellTitle"));
    goto LABEL_21;
  }
  if (!v8)
  {
    if (-[VehicleListViewController _isIndexPathOfAddNewCarCell:](self, "_isIndexPathOfAddNewCarCell:", v7)
      && -[VehicleListViewController _shouldShowManualAddCell](self, "_shouldShowManualAddCell"))
    {
      v9 = (UITableViewCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("kAddNewCarCellIdentifier"), v7));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("[LPR] Add License Plate car"), CFSTR("localized string not found"), 0));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewCell textLabel](v9, "textLabel"));
      objc_msgSend(v12, "setText:", v11);

      -[UITableViewCell setAccessibilityIdentifier:](v9, "setAccessibilityIdentifier:", CFSTR("AddLicensePlateCell"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewCell textLabel](v9, "textLabel"));
      objc_msgSend(v14, "setTextColor:", v13);

    }
    else
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[VehicleCell reuseIdentifier](VehicleCell, "reuseIdentifier"));
      v9 = (UITableViewCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", v24, v7));

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_savedVehicles, "objectAtIndexedSubscript:", objc_msgSend(v7, "row")));
      -[UITableViewCell setupWithVehicle:cellStyle:isSelected:](v9, "setupWithVehicle:cellStyle:isSelected:", v13, 1, 0);
    }
LABEL_21:

    goto LABEL_22;
  }
  v22 = sub_1004326FC();
  v23 = objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_FAULT, "Invalid section count in VehicleListVC", buf, 2u);
  }

  v9 = objc_opt_new(UITableViewCell);
LABEL_22:

  return v9;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint8_t v12[16];

  v6 = a3;
  if (!a4)
    goto LABEL_8;
  if (a4 != 1)
  {
    v9 = sub_1004326FC();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "Invalid section count in VehicleListVC", v12, 2u);
    }

    goto LABEL_8;
  }
  if (!-[VehicleListViewController _shouldShowUnpairedVehicles](self, "_shouldShowUnpairedVehicles"))
  {
LABEL_8:
    v8 = 0;
    goto LABEL_9;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("[EV Onboarding] Welcome screen privacy text"), CFSTR("localized string not found"), 0));

LABEL_9:
  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  VehicleDetailViewController *v11;
  id v12;
  NSUInteger v13;
  id v14;
  NSObject *v15;
  NSArray *v16;
  NSArray *v17;
  void *v18;
  __CFString *v19;
  id v20;
  NSObject *v21;
  void *v22;
  uint8_t buf[4];
  __CFString *v24;

  v6 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v6, 1);
  v7 = objc_msgSend(v6, "section");
  if (v7 == (id)1)
  {
    v13 = -[NSArray count](self->_unpairedVehicles, "count");
    v14 = sub_1004326FC();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    v9 = v15;
    if (v13)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v16 = self->_unpairedVehicles;
        v17 = v16;
        if (v16)
        {
          if (-[NSArray count](v16, "count"))
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray componentsJoinedByString:](v17, "componentsJoinedByString:", CFSTR(", ")));
            v19 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> [%@]"), v17, v18));

          }
          else
          {
            v19 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> (empty)"), v17));
          }
        }
        else
        {
          v19 = CFSTR("<nil>");
        }

        *(_DWORD *)buf = 138412290;
        v24 = v19;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "User selected vehicle onboarding from VG with vehicles: %@", buf, 0xCu);

      }
      v9 = objc_claimAutoreleasedReturnValue(-[VehicleListViewController actionCoordinator](self, "actionCoordinator"));
      -[NSObject presentVehicleOnboardingWithVehicles:completion:](v9, "presentVehicleOnboardingWithVehicles:completion:", self->_unpairedVehicles, 0);
    }
    else if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "Tried to present onboarding from VG with empty vehicles.", buf, 2u);
    }
    goto LABEL_22;
  }
  if (v7)
  {
    v20 = sub_1004326FC();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_FAULT, "Invalid section count in VehicleListVC", buf, 2u);
    }

  }
  else
  {
    if (!-[VehicleListViewController _isIndexPathOfAddNewCarCell:](self, "_isIndexPathOfAddNewCarCell:", v6))
    {
      v8 = objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_savedVehicles, "objectAtIndexedSubscript:", objc_msgSend(v6, "row")));
      if (v8)
      {
        v9 = v8;
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
        objc_msgSend(v10, "captureUserAction:onTarget:eventValue:", 2126, 660, 0);

        v11 = -[VehicleDetailViewController initWithVehicle:delegate:]([VehicleDetailViewController alloc], "initWithVehicle:delegate:", v9, self);
        -[VehicleDetailViewController setVehicleCount:](v11, "setVehicleCount:", -[NSArray count](self->_savedVehicles, "count"));
        v12 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v11);
        -[VehicleListViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v12, 1, 0);

LABEL_22:
        goto LABEL_23;
      }
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    objc_msgSend(v22, "captureUserAction:onTarget:eventValue:", 2115, 660, 0);

    if (-[VehicleListViewController _shouldShowManualAddCell](self, "_shouldShowManualAddCell"))
    {
      v9 = objc_claimAutoreleasedReturnValue(-[VehicleListViewController actionCoordinator](self, "actionCoordinator"));
      -[NSObject presentLPRWithVehicle:scenario:presenter:completionBlock:](v9, "presentLPRWithVehicle:scenario:presenter:completionBlock:", 0, 0, self, 0);
      goto LABEL_22;
    }
  }
LABEL_23:

}

- (void)virtualGarage:(id)a3 didUpdateUnpairedVehicles:(id)a4
{
  -[VehicleListViewController _consumeUpdatedUnpairedVehicles:](self, "_consumeUpdatedUnpairedVehicles:", a4);
}

- (void)vehicleDetailViewController:(id)a3 saveVehicleEdit:(id)a4
{
  id v4;
  id v5;

  v4 = a4;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[VGVirtualGarageService sharedService](VGVirtualGarageService, "sharedService"));
  objc_msgSend(v5, "virtualGarageSaveVehicle:", v4);

}

- (void)vehicleDetailViewController:(id)a3 deleteVehicle:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[VGVirtualGarageService sharedService](VGVirtualGarageService, "sharedService"));
  objc_msgSend(v6, "virtualGarageRemoveVehicle:", v5);

  v8 = (id)objc_claimAutoreleasedReturnValue(-[VehicleListViewController navigationController](self, "navigationController"));
  v7 = objc_msgSend(v8, "popToViewController:animated:", self, 1);

}

- (NSArray)savedVehicles
{
  return self->_savedVehicles;
}

- (NSArray)unpairedVehicles
{
  return self->_unpairedVehicles;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unpairedVehicles, 0);
  objc_storeStrong((id *)&self->_savedVehicles, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_titleHeaderView, 0);
}

@end
