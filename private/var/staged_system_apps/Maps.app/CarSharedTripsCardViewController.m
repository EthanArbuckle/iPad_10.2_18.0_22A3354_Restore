@implementation CarSharedTripsCardViewController

- (CarSharedTripsCardViewController)initWithSelectionHandler:(id)a3
{
  id v4;
  CarSharedTripsCardViewController *v5;
  id v6;
  id selectionHandler;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CarSharedTripsCardViewController;
  v5 = -[CarSharedTripsCardViewController init](&v9, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    selectionHandler = v5->_selectionHandler;
    v5->_selectionHandler = v6;

  }
  return v5;
}

- (void)viewDidLoad
{
  void *v3;
  CarTableView *v4;
  void *v5;
  CarTableView *v6;
  CarTableView *tableView;
  void *v8;
  CarTableView *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  SharedTripsTableDataSource *v13;
  CarTableView *v14;
  SharedTripsTableDataSource *v15;
  SharedTripsTableDataSource *sharedTripsDataSource;
  _QWORD v17[4];
  id v18;
  id location;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)CarSharedTripsCardViewController;
  -[CarSharedTripsCardViewController viewDidLoad](&v20, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarSharedTripsCardViewController view](self, "view"));
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("CarSharedTripsListCard"));

  v4 = [CarTableView alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarSharedTripsCardViewController view](self, "view"));
  objc_msgSend(v5, "bounds");
  v6 = -[CarTableView initWithFrame:style:](v4, "initWithFrame:style:", 0);
  tableView = self->_tableView;
  self->_tableView = v6;

  -[CarTableView setAccessibilityIdentifier:](self->_tableView, "setAccessibilityIdentifier:", CFSTR("CarSharedTripsListCardTableView"));
  -[CarTableView setAutoresizingMask:](self->_tableView, "setAutoresizingMask:", 18);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[CarTableView setBackgroundColor:](self->_tableView, "setBackgroundColor:", v8);

  -[CarTableView setTranslatesAutoresizingMaskIntoConstraints:](self->_tableView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CarTableView setDelegate:](self->_tableView, "setDelegate:", self);
  -[CarTableView setRowHeight:](self->_tableView, "setRowHeight:", UITableViewAutomaticDimension);
  v9 = self->_tableView;
  v10 = objc_opt_class(CarShareTripContactCell);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[CarShareTripContactCell reuseIdentifier](CarShareTripContactCell, "reuseIdentifier"));
  -[CarTableView registerClass:forCellReuseIdentifier:](v9, "registerClass:forCellReuseIdentifier:", v10, v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarSharedTripsCardViewController view](self, "view"));
  objc_msgSend(v12, "addSubview:", self->_tableView);

  objc_initWeak(&location, self);
  v13 = [SharedTripsTableDataSource alloc];
  v14 = self->_tableView;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100AF28B8;
  v17[3] = &unk_1011B3778;
  objc_copyWeak(&v18, &location);
  v15 = -[SharedTripsTableDataSource initWithTableView:cellProvider:tableViewReloadEvent:](v13, "initWithTableView:cellProvider:tableViewReloadEvent:", v14, v17, 0);
  sharedTripsDataSource = self->_sharedTripsDataSource;
  self->_sharedTripsDataSource = v15;

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (void)clearSelection
{
  -[SharedTripsTableDataSource setSelectedTrip:](self->_sharedTripsDataSource, "setSelectedTrip:", 0);
}

- (void)_showDetailForSharedTrip:(id)a3
{
  void (**selectionHandler)(id, id);
  id v5;

  v5 = a3;
  -[SharedTripsTableDataSource setSelectedTrip:](self->_sharedTripsDataSource, "setSelectedTrip:");
  selectionHandler = (void (**)(id, id))self->_selectionHandler;
  if (selectionHandler)
    selectionHandler[2](selectionHandler, v5);

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
      v6 = *(&off_1011E2328 + (int)v5);
  }
  else
  {
    v6 = CFSTR("UNKNOWN_TRANSPORT_TYPE");
  }
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 9002, 267, v6);

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;
  __CFString *v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(-[SharedTripsTableDataSource sharedTripAtIndexPath:](self->_sharedTripsDataSource, "sharedTripAtIndexPath:", a4));
  -[SharedTripsTableDataSource setSelectedTrip:](self->_sharedTripsDataSource, "setSelectedTrip:", v7);
  if (objc_msgSend(v7, "hasTransportType"))
  {
    v5 = objc_msgSend(v7, "transportType");
    if (v5 >= 7)
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v5));
    else
      v6 = *(&off_1011E2328 + (int)v5);
  }
  else
  {
    v6 = CFSTR("UNKNOWN_TRANSPORT_TYPE");
  }
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 9003, 268, v6);

  -[CarSharedTripsCardViewController _showDetailForSharedTrip:](self, "_showDetailForSharedTrip:", v7);
}

- (NSArray)focusOrderSubItems
{
  void *v3;

  if (-[CarSharedTripsCardViewController isViewLoaded](self, "isViewLoaded"))
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarTableView _car_visibleCells](self->_tableView, "_car_visibleCells"));
  else
    v3 = &__NSArray0__struct;
  return (NSArray *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_selectionHandler, 0);
  objc_storeStrong((id *)&self->_sharedTripsDataSource, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
}

@end
