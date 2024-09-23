@implementation RAPRouteListViewController

- (RAPRouteListViewController)initWithReport:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  RAPRouteListViewController *v9;
  RAPRouteListViewController *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  NSArray *requests;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)RAPRouteListViewController;
  v9 = -[RAPRouteListViewController init](&v17, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_delegate, v8);
    objc_storeStrong((id *)&v10->_report, a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReport _context](v10->_report, "_context"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "directionsHistory"));
    v13 = sub_10039E080(v12, &stru_1011BB2F8);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    requests = v10->_requests;
    v10->_requests = (NSArray *)v14;

  }
  return v10;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RAPRouteListViewController;
  -[RAPRouteListViewController viewDidLoad](&v3, "viewDidLoad");
  -[RAPRouteListViewController _setupViews](self, "_setupViews");
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
  v9.super_class = (Class)RAPRouteListViewController;
  -[RAPRouteListViewController viewWillAppear:](&v9, "viewWillAppear:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPRouteListViewController traitCollection](self, "traitCollection"));
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
    objc_msgSend(v7, "setLockedOrientations:", 2);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    objc_msgSend(v8, "setOrientation:animated:", 1, v3);

  }
  if (!-[NSArray count](self->_requests, "count"))
    -[RAPRouteListViewController _displayEmptyState](self, "_displayEmptyState");
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  id v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RAPRouteListViewController;
  -[RAPRouteListViewController viewWillDisappear:](&v7, "viewWillDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPRouteListViewController traitCollection](self, "traitCollection"));
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
    objc_msgSend(v6, "setLockedOrientations:", 0);

  }
}

- (void)_setupViews
{
  UITableView *v3;
  UITableView *tableView;
  void *v5;
  double v6;
  double v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  UITableView *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = (id)objc_claimAutoreleasedReturnValue(+[MapsTheme visualEffectViewAllowingBlur:](MapsTheme, "visualEffectViewAllowingBlur:", 1));
  v3 = (UITableView *)objc_msgSend(objc_alloc((Class)UITableView), "initWithFrame:style:", 2, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  tableView = self->_tableView;
  self->_tableView = v3;

  -[UITableView setTranslatesAutoresizingMaskIntoConstraints:](self->_tableView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[UITableView setBackgroundColor:](self->_tableView, "setBackgroundColor:", v5);

  -[UITableView setBackgroundView:](self->_tableView, "setBackgroundView:", v17);
  LODWORD(v6) = 1148846080;
  -[UITableView setContentCompressionResistancePriority:forAxis:](self->_tableView, "setContentCompressionResistancePriority:forAxis:", 0, v6);
  LODWORD(v7) = 1148846080;
  -[UITableView setContentCompressionResistancePriority:forAxis:](self->_tableView, "setContentCompressionResistancePriority:forAxis:", 1, v7);
  -[UITableView setDataSource:](self->_tableView, "setDataSource:", self);
  -[UITableView setDelegate:](self->_tableView, "setDelegate:", self);
  -[UITableView registerClass:forCellReuseIdentifier:](self->_tableView, "registerClass:forCellReuseIdentifier:", objc_opt_class(RAPRouteCell), CFSTR("kRAPRouteCellReuseIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RAPRouteListViewController view](self, "view"));
  objc_msgSend(v8, "addSubview:", self->_tableView);

  v9 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 1, self, "_onCancelPressed:");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RAPRouteListViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v10, "setLeftBarButtonItem:", v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("[RAP Web UI] Report an Issue"), CFSTR("localized string not found"), 0));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RAPRouteListViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v13, "setTitle:", v12);

  v14 = self->_tableView;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[RAPRouteListViewController view](self, "view"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView _maps_constraintsForCenteringInView:](v14, "_maps_constraintsForCenteringInView:", v15));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v16);

}

- (void)_displayEmptyState
{
  ErrorModeView *v3;
  ErrorModeView *errorModeView;
  ErrorModeView *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  ErrorModeView *v11;
  void *v12;
  id v13;

  v3 = objc_alloc_init(ErrorModeView);
  errorModeView = self->_errorModeView;
  self->_errorModeView = v3;

  -[ErrorModeView setTranslatesAutoresizingMaskIntoConstraints:](self->_errorModeView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v5 = self->_errorModeView;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("[RAP Web UI] No Recent Routes"), CFSTR("localized string not found"), 0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("[RAP Web UI] No Recent Routes Description"), CFSTR("localized string not found"), 0));
  -[ErrorModeView setTitle:andMessage:](v5, "setTitle:andMessage:", v7, v9);

  -[ErrorModeView setTitleLabelFontProvider:](self->_errorModeView, "setTitleLabelFontProvider:", &stru_1011E7B98);
  -[ErrorModeView setMessageLabelFontProvider:](self->_errorModeView, "setMessageLabelFontProvider:", &stru_1011E7C58);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RAPRouteListViewController view](self, "view"));
  objc_msgSend(v10, "insertSubview:aboveSubview:", self->_errorModeView, self->_tableView);

  v11 = self->_errorModeView;
  v13 = (id)objc_claimAutoreleasedReturnValue(-[RAPRouteListViewController view](self, "view"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ErrorModeView _maps_constraintsForCenteringInView:](v11, "_maps_constraintsForCenteringInView:", v13));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v12);

}

- (void)_dismiss
{
  void *v3;
  id WeakRetained;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v3, "captureUserAction:onTarget:eventValue:", 10109, 69, 0);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "rapRouteListViewControllerDidDismiss:", self);

}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[NSArray count](self->_requests, "count", a3, a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  NSArray *requests;
  id v9;
  void *v10;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("kRAPRouteCellReuseIdentifier"), v6));
  requests = self->_requests;
  v9 = objc_msgSend(v6, "row");

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](requests, "objectAtIndexedSubscript:", v9));
  objc_msgSend(v7, "configureWithRequest:", v10);

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  UITableView *tableView;
  id v6;
  NSArray *requests;
  id v8;
  id WeakRetained;
  id v10;

  tableView = self->_tableView;
  v6 = a4;
  -[UITableView deselectRowAtIndexPath:animated:](tableView, "deselectRowAtIndexPath:animated:", v6, 1);
  requests = self->_requests;
  v8 = objc_msgSend(v6, "row");

  v10 = (id)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](requests, "objectAtIndexedSubscript:", v8));
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "rapRouteListViewController:didSelectRequest:", self, v10);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorModeView, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_requests, 0);
  objc_storeStrong((id *)&self->_report, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
