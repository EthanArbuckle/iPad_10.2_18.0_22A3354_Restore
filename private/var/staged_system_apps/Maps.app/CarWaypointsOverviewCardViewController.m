@implementation CarWaypointsOverviewCardViewController

- (CarWaypointsOverviewCardViewController)initWithDelegate:(id)a3
{
  id v4;
  CarWaypointsOverviewCardViewController *v5;
  CarWaypointsOverviewCardViewController *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CarWaypointsOverviewCardViewController;
  v5 = -[CarWaypointsOverviewCardViewController init](&v9, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    objc_msgSend(v7, "registerObserver:", v6);

  }
  return v6;
}

- (void)viewDidLoad
{
  CarTableView *v3;
  CarTableView *tableView;
  double v5;
  double v6;
  void *v7;
  CarTableView *v8;
  uint64_t v9;
  objc_class *v10;
  NSString *v11;
  void *v12;
  CarTableView *v13;
  uint64_t v14;
  objc_class *v15;
  NSString *v16;
  void *v17;
  void *v18;
  CarTableView *v19;
  void *v20;
  void *v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)CarWaypointsOverviewCardViewController;
  -[CarWaypointsOverviewCardViewController viewDidLoad](&v22, "viewDidLoad");
  v3 = objc_alloc_init(CarTableView);
  tableView = self->_tableView;
  self->_tableView = v3;

  -[CarTableView setTranslatesAutoresizingMaskIntoConstraints:](self->_tableView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v5) = 1148846080;
  -[CarTableView setContentCompressionResistancePriority:forAxis:](self->_tableView, "setContentCompressionResistancePriority:forAxis:", 0, v5);
  LODWORD(v6) = 1148846080;
  -[CarTableView setContentCompressionResistancePriority:forAxis:](self->_tableView, "setContentCompressionResistancePriority:forAxis:", 1, v6);
  -[CarTableView setDataSource:](self->_tableView, "setDataSource:", self);
  -[CarTableView setDelegate:](self->_tableView, "setDelegate:", self);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[CarTableView setBackgroundColor:](self->_tableView, "setBackgroundColor:", v7);

  v8 = self->_tableView;
  v9 = objc_opt_class(CarAddStopCell);
  v10 = (objc_class *)objc_opt_class(CarAddStopCell);
  v11 = NSStringFromClass(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  -[CarTableView registerClass:forCellReuseIdentifier:](v8, "registerClass:forCellReuseIdentifier:", v9, v12);

  v13 = self->_tableView;
  v14 = objc_opt_class(CarWaypointCell);
  v15 = (objc_class *)objc_opt_class(CarWaypointCell);
  v16 = NSStringFromClass(v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  -[CarTableView registerClass:forCellReuseIdentifier:](v13, "registerClass:forCellReuseIdentifier:", v14, v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CarWaypointsOverviewCardViewController view](self, "view"));
  objc_msgSend(v18, "addSubview:", self->_tableView);

  v19 = self->_tableView;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CarWaypointsOverviewCardViewController view](self, "view"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CarTableView _maps_constraintsForCenteringInView:](v19, "_maps_constraintsForCenteringInView:", v20));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v21);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CarWaypointsOverviewCardViewController;
  -[CarWaypointsOverviewCardViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[CarTableView reloadData](self->_tableView, "reloadData");
}

- (void)setWaypoints:(id)a3
{
  id v5;
  NSArray **p_waypoints;
  id v7;
  NSObject *v8;
  CarWaypointsOverviewCardViewController *v9;
  objc_class *v10;
  NSString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSUInteger v16;
  void *v17;
  NSArray *v18;
  NSArray *waypointRows;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  NSUInteger v23;
  __int16 v24;
  id v25;

  v5 = a3;
  p_waypoints = &self->_waypoints;
  if ((objc_msgSend(v5, "isEqualToArray:", self->_waypoints) & 1) == 0)
  {
    v7 = sub_10043364C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
LABEL_9:

      objc_storeStrong((id *)&self->_waypoints, a3);
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
      v18 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NavTrayWaypointRow waypointRowsFromNavigationService:withWaypoints:](NavTrayWaypointRow, "waypointRowsFromNavigationService:withWaypoints:", v17, *p_waypoints));
      waypointRows = self->_waypointRows;
      self->_waypointRows = v18;

      -[CarTableView reloadData](self->_tableView, "reloadData");
      goto LABEL_10;
    }
    v9 = self;
    v10 = (objc_class *)objc_opt_class(v9);
    v11 = NSStringFromClass(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    if ((objc_opt_respondsToSelector(v9, "accessibilityIdentifier") & 1) != 0)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarWaypointsOverviewCardViewController performSelector:](v9, "performSelector:", "accessibilityIdentifier"));
      v14 = v13;
      if (v13 && !objc_msgSend(v13, "isEqualToString:", v12))
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v12, v9, v14));

        goto LABEL_8;
      }

    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v12, v9));
LABEL_8:

    v16 = -[NSArray count](*p_waypoints, "count");
    *(_DWORD *)buf = 138543874;
    v21 = v15;
    v22 = 2048;
    v23 = v16;
    v24 = 2048;
    v25 = objc_msgSend(v5, "count");
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}@] didUpdate waypoints, previously: %ld, now: %ld", buf, 0x20u);

    goto LABEL_9;
  }
LABEL_10:

}

- (BOOL)_canAddWaypoints
{
  uint64_t UInteger;
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  UInteger = GEOConfigGetUInteger(MapsConfig_MPRWaypointLimit, off_1014B4858);
  v4 = sub_10039E080(self->_waypoints, &stru_1011AF5C0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if (UInteger)
    v7 = (unint64_t)objc_msgSend(v5, "count") < UInteger - 1;
  else
    v7 = 1;

  return v7;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return 56.0;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  int64_t v7;

  v6 = a3;
  if (a4 == 1)
  {
    v7 = -[NSArray count](self->_waypointRows, "count");
  }
  else if (a4)
  {
    v7 = 0;
  }
  else
  {
    v7 = -[CarWaypointsOverviewCardViewController _canAddWaypoints](self, "_canAddWaypoints");
  }

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  UITableViewCell *v12;
  objc_class *v13;
  NSString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  CarWaypointsOverviewCardViewController *v22;
  CarWaypointsOverviewCardViewController *v23;
  objc_class *v24;
  NSString *v25;
  void *v26;
  void *v27;
  void *v28;
  __CFString *v29;
  uint8_t buf[4];
  __CFString *v32;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "section");
  if (v8 == (id)1)
  {
    v13 = (objc_class *)objc_opt_class(CarWaypointCell);
    v14 = NSStringFromClass(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v12 = (UITableViewCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", v15, v7));

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_waypointRows, "objectAtIndexedSubscript:", objc_msgSend(v7, "row")));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "waypoint"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "etaInfo"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "waypoint"));
    -[UITableViewCell setupWithWaypoint:etaInfo:isRemovable:](v12, "setupWithWaypoint:etaInfo:isRemovable:", v17, v18, -[CarWaypointsOverviewCardViewController _isWaypointRemovable:](self, "_isWaypointRemovable:", v19));

    goto LABEL_16;
  }
  if (v8)
  {
    v20 = sub_10043364C();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
LABEL_15:

      v12 = objc_opt_new(UITableViewCell);
      goto LABEL_16;
    }
    v22 = self;
    v23 = v22;
    if (!v22)
    {
      v29 = CFSTR("<nil>");
      goto LABEL_14;
    }
    v24 = (objc_class *)objc_opt_class(v22);
    v25 = NSStringFromClass(v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    if ((objc_opt_respondsToSelector(v23, "accessibilityIdentifier") & 1) != 0)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[CarWaypointsOverviewCardViewController performSelector:](v23, "performSelector:", "accessibilityIdentifier"));
      v28 = v27;
      if (v27 && !objc_msgSend(v27, "isEqualToString:", v26))
      {
        v29 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v26, v23, v28));

        goto LABEL_12;
      }

    }
    v29 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v26, v23));
LABEL_12:

LABEL_14:
    *(_DWORD *)buf = 138543362;
    v32 = v29;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "[%{public}@] tried to dequeue a cell for invalid section.", buf, 0xCu);

    goto LABEL_15;
  }
  v9 = (objc_class *)objc_opt_class(CarAddStopCell);
  v10 = NSStringFromClass(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (UITableViewCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", v11, v7));

LABEL_16:
  return v12;
}

- (BOOL)_isWaypointRemovable:(id)a3
{
  BOOL v4;
  id v5;
  void *v6;

  if ((objc_msgSend(a3, "isServerProvidedWaypoint") & 1) != 0)
    return 0;
  v5 = sub_10039E080(self->_waypoints, &stru_1011AF5E0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v4 = (unint64_t)objc_msgSend(v6, "count") > 1;

  return v4;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a4;
  if (objc_msgSend(v5, "section") == (id)1)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_waypointRows, "objectAtIndexedSubscript:", objc_msgSend(v5, "row")));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "waypoint"));

    if (-[CarWaypointsOverviewCardViewController _isWaypointRemovable:](self, "_isWaypointRemovable:", v8))
      v9 = v5;
    else
      v9 = 0;
    v6 = v9;

  }
  else
  {
    v6 = v5;
  }

  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v10, 1);
  v6 = objc_msgSend(v10, "section");
  if (v6 == (id)1)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_waypointRows, "objectAtIndexedSubscript:", objc_msgSend(v10, "row")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "waypoint"));
    objc_msgSend(WeakRetained, "waypointsOverviewController:didSelectWaypoint:atIndex:", self, v9, objc_msgSend(v10, "row"));

    goto LABEL_5;
  }
  if (!v6)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "waypointsOverviewControllerDidSelectAddWaypoint:", self);
LABEL_5:

  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  uint64_t v5;
  id v6;

  if (a4.y <= 0.0)
    v5 = 7;
  else
    v5 = 8;
  v6 = (id)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService", a3, a5, a4.x));
  objc_msgSend(v6, "captureUserAction:onTarget:eventValue:", v5, 1025, 0);

}

- (void)navigationService:(id)a3 didUpdateDisplayETA:(id)a4 remainingDistance:(id)a5 batteryChargeInfo:(id)a6
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  uint64_t v16;
  NSArray *waypointRows;
  id obj;
  _QWORD v19[5];
  id v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarTableView _car_indexPathsForVisibleRows](self->_tableView, "_car_indexPathsForVisibleRows"));
  v9 = objc_alloc((Class)NSMutableArray);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "legInfos"));
  v11 = objc_msgSend(v9, "initWithCapacity:", objc_msgSend(v10, "count"));

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "legInfos"));
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v14)
          objc_enumerationMutation(obj);
        v16 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        waypointRows = self->_waypointRows;
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v19[2] = sub_1002A24C0;
        v19[3] = &unk_1011AF608;
        v19[4] = v16;
        v20 = v8;
        v21 = v11;
        -[NSArray enumerateObjectsUsingBlock:](waypointRows, "enumerateObjectsUsingBlock:", v19);

      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v13);
  }

  if (objc_msgSend(v11, "count"))
    -[CarTableView reloadRowsAtIndexPaths:withRowAnimation:](self->_tableView, "reloadRowsAtIndexPaths:withRowAnimation:", v11, 5);

}

- (NSArray)focusOrderSubItems
{
  void *v3;

  if (-[CarWaypointsOverviewCardViewController isViewLoaded](self, "isViewLoaded"))
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarTableView _car_visibleCells](self->_tableView, "_car_visibleCells"));
  else
    v3 = &__NSArray0__struct;
  return (NSArray *)v3;
}

- (NSArray)waypoints
{
  return self->_waypoints;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waypoints, 0);
  objc_storeStrong((id *)&self->_waypointRows, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
