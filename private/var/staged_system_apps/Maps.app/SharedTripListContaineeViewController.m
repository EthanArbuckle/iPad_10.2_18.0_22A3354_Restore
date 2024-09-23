@implementation SharedTripListContaineeViewController

- (SharedTripListContaineeViewController)init
{
  SharedTripListContaineeViewController *v2;
  id v3;
  NSObject *v4;
  objc_super v6;
  uint8_t buf[4];
  SharedTripListContaineeViewController *v8;

  v6.receiver = self;
  v6.super_class = (Class)SharedTripListContaineeViewController;
  v2 = -[SharedTripListContaineeViewController init](&v6, "init");
  if (v2)
  {
    v3 = sub_100392BE0();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v8 = v2;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Initializing", buf, 0xCu);
    }

  }
  return v2;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  SharedTripListContaineeViewController *v7;

  v3 = sub_100392BE0();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Deallocating", buf, 0xCu);
  }

  v5.receiver = self;
  v5.super_class = (Class)SharedTripListContaineeViewController;
  -[SharedTripListContaineeViewController dealloc](&v5, "dealloc");
}

- (void)viewDidLoad
{
  ContainerHeaderView *v3;
  ContainerHeaderView *headerView;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  UITableView *v10;
  UITableView *tableView;
  void *v12;
  UITableView *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  SharedTripsTableDataSource *v17;
  UITableView *v18;
  SharedTripsTableDataSource *v19;
  SharedTripsTableDataSource *sharedTripsDataSource;
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
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  _QWORD v49[4];
  id v50;
  _QWORD v51[4];
  id v52;
  id location;
  objc_super v54;

  v54.receiver = self;
  v54.super_class = (Class)SharedTripListContaineeViewController;
  -[ContaineeViewController viewDidLoad](&v54, "viewDidLoad");
  v3 = -[ContainerHeaderView initWithFrame:]([ContainerHeaderView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  headerView = self->_headerView;
  self->_headerView = v3;

  -[ContainerHeaderView setTranslatesAutoresizingMaskIntoConstraints:](self->_headerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[ContainerHeaderView setDelegate:](self->_headerView, "setDelegate:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Shared Trips [Tray, Header]"), CFSTR("localized string not found"), 0));
  -[ContainerHeaderView setTitle:](self->_headerView, "setTitle:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripListContaineeViewController view](self, "view"));
  objc_msgSend(v7, "addSubview:", self->_headerView);

  v8 = objc_alloc((Class)UITableView);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripListContaineeViewController view](self, "view"));
  objc_msgSend(v9, "bounds");
  v10 = (UITableView *)objc_msgSend(v8, "initWithFrame:style:", 0);
  tableView = self->_tableView;
  self->_tableView = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[UITableView setBackgroundColor:](self->_tableView, "setBackgroundColor:", v12);

  -[UITableView setTranslatesAutoresizingMaskIntoConstraints:](self->_tableView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  +[TwoLinesTableViewCell estimatedCellHeight](TwoLinesTableViewCell, "estimatedCellHeight");
  -[UITableView setEstimatedRowHeight:](self->_tableView, "setEstimatedRowHeight:");
  +[TwoLinesTableViewCell cellHeight](TwoLinesTableViewCell, "cellHeight");
  -[UITableView setRowHeight:](self->_tableView, "setRowHeight:");
  -[UITableView setDelegate:](self->_tableView, "setDelegate:", self);
  v13 = self->_tableView;
  v14 = objc_opt_class(TwoLinesTableViewCell);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[TwoLinesTableViewCell identifier](TwoLinesTableViewCell, "identifier"));
  -[UITableView registerClass:forCellReuseIdentifier:](v13, "registerClass:forCellReuseIdentifier:", v14, v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripListContaineeViewController view](self, "view"));
  objc_msgSend(v16, "addSubview:", self->_tableView);

  objc_initWeak(&location, self);
  v17 = [SharedTripsTableDataSource alloc];
  v18 = self->_tableView;
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472;
  v51[2] = sub_100393288;
  v51[3] = &unk_1011B3778;
  objc_copyWeak(&v52, &location);
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_1003933F0;
  v49[3] = &unk_1011B37A0;
  objc_copyWeak(&v50, &location);
  v19 = -[SharedTripsTableDataSource initWithTableView:cellProvider:tableViewReloadEvent:](v17, "initWithTableView:cellProvider:tableViewReloadEvent:", v18, v51, v49);
  sharedTripsDataSource = self->_sharedTripsDataSource;
  self->_sharedTripsDataSource = v19;

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView topAnchor](self->_headerView, "topAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripListContaineeViewController view](self, "view"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "topAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v24));
  objc_msgSend(v21, "addObject:", v25);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView leadingAnchor](self->_headerView, "leadingAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripListContaineeViewController view](self, "view"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "leadingAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v28));
  objc_msgSend(v21, "addObject:", v29);

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripListContaineeViewController view](self, "view"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "trailingAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView trailingAnchor](self->_headerView, "trailingAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:", v32));
  objc_msgSend(v21, "addObject:", v33);

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView topAnchor](self->_tableView, "topAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView bottomAnchor](self->_headerView, "bottomAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", v35));
  objc_msgSend(v21, "addObject:", v36);

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView leadingAnchor](self->_tableView, "leadingAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripListContaineeViewController view](self, "view"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "leadingAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:", v39));
  objc_msgSend(v21, "addObject:", v40);

  v41 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView trailingAnchor](self->_tableView, "trailingAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripListContaineeViewController view](self, "view"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "trailingAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:", v43));
  objc_msgSend(v21, "addObject:", v44);

  v45 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView bottomAnchor](self->_tableView, "bottomAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripListContaineeViewController view](self, "view"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "bottomAnchor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "constraintEqualToAnchor:", v47));
  objc_msgSend(v21, "addObject:", v48);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v21);
  objc_destroyWeak(&v50);
  objc_destroyWeak(&v52);
  objc_destroyWeak(&location);
}

- (void)headerViewTapped:(id)a3
{
  void *v4;
  char *v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController", a3));
  v5 = (char *)objc_msgSend(v4, "containeeLayout");

  if ((unint64_t)(v5 - 2) >= 2)
  {
    if (v5 != (char *)1)
      return;
    v6 = (id)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v6, "wantsExpandLayout");
  }
  else
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v6, "wantsMinimizeLayout");
  }

}

- (void)headerViewButtonTapped:(id)a3 buttonType:(unint64_t)a4
{
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripService sharedInstance](MSPSharedTripService, "sharedInstance", a3, a4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "receivedTrips"));
  v7 = sub_10039DCD4(v6, &stru_1011B37E0);
  v11 = (id)objc_claimAutoreleasedReturnValue(v7);

  v8 = -[SharedTripListContaineeViewController currentUITargetForAnalytics](self, "currentUITargetForAnalytics");
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "componentsJoinedByString:", CFSTR(",")));
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 4, v8, v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripListContaineeViewController delegate](self, "delegate"));
  objc_msgSend(v10, "closeSharedTrips");

}

- (int)currentUITargetForAnalytics
{
  return 267;
}

- (GEOSharedNavState)selectedTrip
{
  GEOSharedNavState **p_selectedTrip;
  id WeakRetained;
  void *v5;

  p_selectedTrip = &self->_selectedTrip;
  WeakRetained = objc_loadWeakRetained((id *)&self->_selectedTrip);

  if (!WeakRetained)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripsTableDataSource selectedTrip](self->_sharedTripsDataSource, "selectedTrip"));
    objc_storeWeak((id *)p_selectedTrip, v5);

  }
  return (GEOSharedNavState *)objc_loadWeakRetained((id *)p_selectedTrip);
}

- (void)setSelectedTrip:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;
  NSObject *v7;
  void *v8;
  id subscriptionToken;
  int v10;
  SharedTripListContaineeViewController *v11;
  __int16 v12;
  void *v13;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_selectedTrip);

  if (WeakRetained != v4)
  {
    v6 = sub_100392BE0();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "groupIdentifier"));
      v10 = 134349314;
      v11 = self;
      v12 = 2112;
      v13 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}p] Selecting trip: %@", (uint8_t *)&v10, 0x16u);

    }
    subscriptionToken = self->_subscriptionToken;
    self->_subscriptionToken = 0;

    objc_storeWeak((id *)&self->_selectedTrip, v4);
    -[SharedTripsTableDataSource setSelectedTrip:](self->_sharedTripsDataSource, "setSelectedTrip:", v4);
  }

}

- (id)headerView
{
  return self->_headerView;
}

- (id)contentView
{
  return self->_tableView;
}

- (void)applyAlphaToContent:(double)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SharedTripListContaineeViewController;
  -[ContaineeViewController applyAlphaToContent:](&v5, "applyAlphaToContent:");
  -[ContainerHeaderView setHairLineAlpha:](self->_headerView, "setHairLineAlpha:", a3);
}

- (double)heightForLayout:(unint64_t)a3
{
  void *v5;
  double v6;
  double v7;
  unint64_t v8;
  double v9;
  double v10;
  double v11;
  void *v13;
  double v14;
  double v15;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v5, "bottomSafeOffset");
  v7 = v6;

  if (a3 == 1)
  {
LABEL_7:
    -[ContaineeViewController headerHeight](self, "headerHeight");
    return v7 + v11;
  }
  if (a3 == 2)
  {
    v8 = -[SharedTripsTableDataSource numberOfSharedTrips](self->_sharedTripsDataSource, "numberOfSharedTrips");
    if (v8 <= 3)
      v9 = (double)v8;
    else
      v9 = 3.5;
    +[TwoLinesTableViewCell estimatedCellHeight](TwoLinesTableViewCell, "estimatedCellHeight");
    v7 = v7 + v10 * v9;
    goto LABEL_7;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v13, "availableHeight");
  v15 = v14;

  return v15;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v5;
  __CFString *v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(-[SharedTripsTableDataSource sharedTripAtIndexPath:](self->_sharedTripsDataSource, "sharedTripAtIndexPath:", a5, a4));
  if (objc_msgSend(v7, "hasTransportType"))
  {
    v5 = objc_msgSend(v7, "transportType");
    if (v5 >= 7)
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v5));
    else
      v6 = off_1011B3820[(int)v5];
  }
  else
  {
    v6 = CFSTR("UNKNOWN_TRANSPORT_TYPE");
  }
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 9002, 267, v6);

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  id v8;
  __CFString *v9;
  void *v10;
  id v11;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "cellForRowAtIndexPath:", v6));
  objc_msgSend(v7, "setSelected:", 0);

  v11 = (id)objc_claimAutoreleasedReturnValue(-[SharedTripsTableDataSource sharedTripAtIndexPath:](self->_sharedTripsDataSource, "sharedTripAtIndexPath:", v6));
  -[SharedTripListContaineeViewController setSelectedTrip:](self, "setSelectedTrip:", v11);
  if (objc_msgSend(v11, "hasTransportType"))
  {
    v8 = objc_msgSend(v11, "transportType");
    if (v8 >= 7)
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v8));
    else
      v9 = off_1011B3820[(int)v8];
  }
  else
  {
    v9 = CFSTR("UNKNOWN_TRANSPORT_TYPE");
  }
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 9003, 267, v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripListContaineeViewController delegate](self, "delegate"));
  objc_msgSend(v10, "didSelectSharedTrip:", v11);

}

- (SharedTripsActionCoordination)delegate
{
  return (SharedTripsActionCoordination *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_selectedTrip);
  objc_storeStrong(&self->_subscriptionToken, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_sharedTripsDataSource, 0);
}

@end
