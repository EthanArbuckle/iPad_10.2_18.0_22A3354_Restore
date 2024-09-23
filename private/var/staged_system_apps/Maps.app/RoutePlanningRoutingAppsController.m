@implementation RoutePlanningRoutingAppsController

- (RoutePlanningRoutingAppsController)initWithDataCoordination:(id)a3
{
  id v4;
  RoutePlanningRoutingAppsController *v5;
  RoutePlanningRoutingAppsController *v6;
  void *v7;
  RoutingAppSelectionController *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)RoutePlanningRoutingAppsController;
  v5 = -[RoutePlanningWrapperViewController initWithDataCoordination:](&v12, "initWithDataCoordination:", v4);
  v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWrapperViewController dataCoordinator](v5, "dataCoordinator"));
    objc_msgSend(v7, "addObserver:", v6);

    v8 = -[RoutingAppSelectionController initWithTransportType:]([RoutingAppSelectionController alloc], "initWithTransportType:", objc_msgSend(v4, "transportType"));
    -[RoutePlanningWrapperViewController setWrappedViewController:](v6, "setWrappedViewController:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "resolvedWaypointSet"));
    -[RoutePlanningRoutingAppsController _updateWaypointSet:](v6, "_updateWaypointSet:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWrapperViewController wrappedViewController](v6, "wrappedViewController"));
    objc_msgSend(v10, "setDelegate:", v6);

  }
  return v6;
}

- (void)_updateWaypointSet:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (v9)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWrapperViewController wrappedViewController](self, "wrappedViewController"));
    objc_msgSend(v4, "updateForWaypointSet:", v9);

  }
  if (-[RoutePlanningRoutingAppsController isViewLoaded](self, "isViewLoaded"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWrapperViewController wrappedViewController](self, "wrappedViewController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "navigationItem"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "title"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWrapperViewController titleHeaderView](self, "titleHeaderView"));
    objc_msgSend(v8, "setTitle:", v7);

  }
}

- (int64_t)observedRoutePlanningData
{
  return 4;
}

- (void)routePlanningDataCoordinator:(id)a3 didUpdateResolvedWaypointSet:(id)a4
{
  -[RoutePlanningRoutingAppsController _updateWaypointSet:](self, "_updateWaypointSet:", a4);
}

- (void)headerViewButtonTapped:(id)a3 buttonType:(unint64_t)a4
{
  id v6;
  void *v7;
  objc_super v8;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWrapperViewController wrappedViewController](self, "wrappedViewController"));
  objc_msgSend(v7, "reset");

  v8.receiver = self;
  v8.super_class = (Class)RoutePlanningRoutingAppsController;
  -[RoutePlanningWrapperViewController headerViewButtonTapped:buttonType:](&v8, "headerViewButtonTapped:buttonType:", v6, a4);

}

- (void)routingAppSelectionControllerDidCancel:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  char *v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;

  v4 = sub_1004318FC();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v11 = 136315650;
    v12 = "-[RoutePlanningRoutingAppsController routingAppSelectionControllerDidCancel:]";
    v13 = 2080;
    v14 = "RoutePlanningRoutingAppsController.m";
    v15 = 1024;
    v16 = 71;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v11, 0x1Cu);
  }

  if (sub_100A70734())
  {
    v6 = sub_1004318FC();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
      v11 = 138412290;
      v12 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v11, 0xCu);

    }
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWrapperViewController wrappedViewController](self, "wrappedViewController"));
  objc_msgSend(v9, "reset");

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController containeeDelegate](self, "containeeDelegate"));
  objc_msgSend(v10, "containeeViewControllerGoToPreviousState:withSender:", self, 0);

}

@end
