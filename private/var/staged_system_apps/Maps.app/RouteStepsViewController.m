@implementation RouteStepsViewController

- (void)dealloc
{
  objc_super v3;

  -[RouteStepsViewController _observeHeaderFlagForController:](self, "_observeHeaderFlagForController:", 0);
  v3.receiver = self;
  v3.super_class = (Class)RouteStepsViewController;
  -[RouteStepsViewController dealloc](&v3, "dealloc");
}

- (RouteStepsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  RouteStepsViewController *v4;
  RouteStepsViewController *v5;
  RouteStepsViewController *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RouteStepsViewController;
  v4 = -[RouteStepsViewController initWithNibName:bundle:](&v8, "initWithNibName:bundle:", a3, a4);
  v5 = v4;
  if (v4)
  {
    -[RouteStepsViewController _customInit](v4, "_customInit");
    v6 = v5;
  }

  return v5;
}

- (RouteStepsViewController)initWithCoder:(id)a3
{
  RouteStepsViewController *v3;
  RouteStepsViewController *v4;
  RouteStepsViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RouteStepsViewController;
  v3 = -[RouteStepsViewController initWithCoder:](&v7, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
  {
    -[RouteStepsViewController _customInit](v3, "_customInit");
    v5 = v4;
  }

  return v4;
}

- (void)_customInit
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v3, "setPresentedModally:", 1);

  v4 = (id)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v4, "setTakesAvailableHeight:", 1);

}

+ (BOOL)wantsDefaultHeaderContentViews
{
  return 1;
}

- (void)viewDidLoad
{
  void *v3;
  ContainerHeaderView *v4;
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
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)RouteStepsViewController;
  -[ContaineeViewController viewDidLoad](&v15, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepsViewController view](self, "view"));
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("RouteStepsView"));

  v4 = -[ContainerHeaderView initWithFrame:]([ContainerHeaderView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[RouteStepsViewController setModalHeaderView:](self, "setModalHeaderView:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepsViewController modalHeaderView](self, "modalHeaderView"));
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepsViewController modalHeaderView](self, "modalHeaderView"));
  objc_msgSend(v6, "setDelegate:", self);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepsViewController modalHeaderView](self, "modalHeaderView"));
  objc_msgSend(v7, "setHeaderSize:", 1);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepsViewController modalHeaderView](self, "modalHeaderView"));
  objc_msgSend(v8, "setHairLineAlpha:", 0.0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepsViewController modalHeaderView](self, "modalHeaderView"));
  objc_msgSend(v10, "setBackgroundColor:", v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepsViewController modalHeaderView](self, "modalHeaderView"));
  objc_msgSend(v11, "addSubview:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepsViewController dataCoordinator](self, "dataCoordinator"));
  objc_msgSend(v13, "addObserver:", self);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepsViewController dataCoordinator](self, "dataCoordinator"));
  objc_msgSend(v14, "setupDataForObserver:", self);

  -[RouteStepsViewController _setupConstraints](self, "_setupConstraints");
}

- (void)headerViewButtonTapped:(id)a3 buttonType:(unint64_t)a4
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "buttonView"));
  -[RouteStepsViewController _didTapDoneButton:](self, "_didTapDoneButton:", v5);

}

- (void)willChangeContainerStyle:(unint64_t)a3
{
  unsigned int v5;
  TransitDirectionsListViewController *transitDirectionsListViewController;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)RouteStepsViewController;
  -[ContaineeViewController willChangeContainerStyle:](&v11, "willChangeContainerStyle:");
  v5 = (a3 > 7) | (0x5Cu >> a3);
  transitDirectionsListViewController = self->_transitDirectionsListViewController;
  if (transitDirectionsListViewController)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListViewController dataSource](transitDirectionsListViewController, "dataSource"));
    objc_msgSend(v7, "setAllowStepSelection:", v5 & 1);

    if ((v5 & 1) == 0)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListViewController dataSource](self->_transitDirectionsListViewController, "dataSource"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "listView"));
      objc_msgSend(v9, "clearActiveTransitListItem");

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepsViewController dataCoordinator](self, "dataCoordinator"));
      objc_msgSend(v10, "updateCurrentRouteDisplayedMapRect:", MKMapRectNull.origin.x, MKMapRectNull.origin.y, MKMapRectNull.size.width, MKMapRectNull.size.height);

    }
  }
  -[RouteStepListViewController setAllowsSelection:](self->_driveOrWalkDirectionsListViewController, "setAllowsSelection:", v5 & 1);
}

- (void)willBecomeCurrent:(BOOL)a3
{
  TransitDirectionsListViewController *transitDirectionsListViewController;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RouteStepsViewController;
  -[ContaineeViewController willBecomeCurrent:](&v5, "willBecomeCurrent:", a3);
  transitDirectionsListViewController = self->_transitDirectionsListViewController;
  if (transitDirectionsListViewController)
    -[TransitDirectionsListViewController _willBecomeCurrent](transitDirectionsListViewController, "_willBecomeCurrent");
}

- (void)didBecomeCurrent
{
  void *v3;
  unint64_t v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RouteStepsViewController;
  -[ContaineeViewController didBecomeCurrent](&v5, "didBecomeCurrent");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  v4 = (unint64_t)objc_msgSend(v3, "containerStyle");
  -[RouteStepListViewController setAllowsSelection:](self->_driveOrWalkDirectionsListViewController, "setAllowsSelection:", (v4 > 7) | (0x5Cu >> v4) & 1);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  void *v7;
  id v8;
  objc_super v9;

  if (a6 == &unk_1014D2FD8)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a5, "objectForKeyedSubscript:", NSKeyValueChangeNewKey, a4));
    v8 = objc_msgSend(v7, "BOOLValue");

    -[RouteStepsViewController _updateHairlineVisibility:](self, "_updateHairlineVisibility:", v8);
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)RouteStepsViewController;
    -[RouteStepsViewController observeValueForKeyPath:ofObject:change:context:](&v9, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }
}

- (void)_observeHeaderFlagForController:(id)a3
{
  id WeakRetained;
  id v5;
  id v6;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_observingHeaderOfController);

  if (WeakRetained != obj)
  {
    v5 = objc_loadWeakRetained((id *)&self->_observingHeaderOfController);
    objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("showsHairline"), &unk_1014D2FD8);

    v6 = objc_storeWeak((id *)&self->_observingHeaderOfController, obj);
    objc_msgSend(obj, "addObserver:forKeyPath:options:context:", self, CFSTR("showsHairline"), 1, &unk_1014D2FD8);

  }
}

- (void)_updateHairlineVisibility:(BOOL)a3
{
  double v3;
  id v4;

  if (a3)
    v3 = 1.0;
  else
    v3 = 0.0;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[RouteStepsViewController modalHeaderView](self, "modalHeaderView"));
  objc_msgSend(v4, "setHairLineAlpha:", v3);

}

- (int64_t)observedRoutePlanningData
{
  return 72;
}

- (void)routePlanningDataCoordinator:(id)a3 didUpdateOriginName:(id)a4 destinationName:(id)a5
{
  void *v6;
  void *v7;
  id v8;

  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle", a3, a4, a5));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("[Route Steps] Details"), CFSTR("localized string not found"), 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepsViewController modalHeaderView](self, "modalHeaderView"));
  objc_msgSend(v7, "setTitle:", v6);

}

- (void)routePlanningDataCoordinator:(id)a3 didUpdateRouteCollection:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "currentRoute", a3));
  v8 = v5;
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepsViewController directionsListViewControllerForDirectionsType:](self, "directionsListViewControllerForDirectionsType:", objc_msgSend(v5, "transportType")));
    objc_msgSend(v6, "setRoute:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tableView"));
    objc_msgSend(v7, "reloadData");

    -[RouteStepsViewController _setupChildViewControllerIfNeeded:](self, "_setupChildViewControllerIfNeeded:", v6);
    -[RouteStepsViewController _updateVisibleViewsForDirectionsType:](self, "_updateVisibleViewsForDirectionsType:", objc_msgSend(v8, "transportType"));
    -[RouteStepsViewController _updateHairlineVisibility:](self, "_updateHairlineVisibility:", objc_msgSend(v6, "showsHairline"));

  }
  else
  {
    -[RouteStepsViewController _clearControllerIfNeeded:](self, "_clearControllerIfNeeded:", self->_driveOrWalkDirectionsListViewController);
    -[RouteStepsViewController _clearControllerIfNeeded:](self, "_clearControllerIfNeeded:", self->_transitDirectionsListViewController);
  }

}

- (void)_didTapDoneButton:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v5, "captureUserAction:onTarget:eventValue:", 4, -[RouteStepsViewController currentUITargetForAnalytics](self, "currentUITargetForAnalytics"), 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepsViewController dataCoordinator](self, "dataCoordinator"));
  objc_msgSend(v6, "updateCurrentRouteDisplayedMapRect:", MKMapRectNull.origin.x, MKMapRectNull.origin.y, MKMapRectNull.size.width, MKMapRectNull.size.height);

  v7 = (id)objc_claimAutoreleasedReturnValue(-[ContaineeViewController containeeDelegate](self, "containeeDelegate"));
  objc_msgSend(v7, "containeeViewControllerGoToPreviousState:withSender:", self, v4);

}

- (void)directionsStepsListDidTapShareButton:(id)a3
{
  id v4;
  uint64_t v5;
  char isKindOfClass;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  char *v20;
  int v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  const char *v28;

  v4 = a3;
  v5 = objc_opt_class(TransitDirectionsStepsListDataSource);
  isKindOfClass = objc_opt_isKindOfClass(v4, v5);

  v7 = 1;
  if ((isKindOfClass & 1) != 0)
    v7 = 0;
  v8 = objc_retain(*(id *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR___RouteStepsViewController__transitDirectionsListViewController[v7]));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "route"));

  if (!v9)
  {
    v16 = sub_1004318FC();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v21 = 136315906;
      v22 = "-[RouteStepsViewController directionsStepsListDidTapShareButton:]";
      v23 = 2080;
      v24 = "RouteStepsViewController.m";
      v25 = 1024;
      v26 = 236;
      v27 = 2080;
      v28 = "viewController.route != nil";
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v21, 0x26u);
    }

    if (sub_100A70734())
    {
      v18 = sub_1004318FC();
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v20 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v21 = 138412290;
        v22 = v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v21, 0xCu);

      }
    }
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "route"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));
  -[RouteStepsViewController _shareRoute:sourceView:](self, "_shareRoute:sourceView:", v10, v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "route"));
  v14 = objc_msgSend(v13, "transportType") - 1;
  if (v14 > 5)
    v15 = 604;
  else
    v15 = dword_100E3A2BC[v14];
  objc_msgSend(v12, "captureUserAction:onTarget:eventValue:", 6013, v15, 0);

}

- (void)directionsStepsListDidTapRAPButton:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  char *v18;
  int v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  const char *v26;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepsViewController _maps_platformController](self, "_maps_platformController", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentSession"));
  v6 = objc_opt_class(RoutePlanningSession);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    v7 = v5;
  else
    v7 = 0;
  v8 = v7;

  if (!v8)
  {
    v14 = sub_1004318FC();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v19 = 136315906;
      v20 = "-[RouteStepsViewController directionsStepsListDidTapRAPButton:]";
      v21 = 2080;
      v22 = "RouteStepsViewController.m";
      v23 = 1024;
      v24 = 248;
      v25 = 2080;
      v26 = "routePlanningSession != nil";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v19, 0x26u);
    }

    if (sub_100A70734())
    {
      v16 = sub_1004318FC();
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v19 = 138412290;
        v20 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v19, 0xCu);

      }
    }
  }
  v9 = (unint64_t)objc_msgSend(v8, "currentTransportType");
  if (v9 > 5)
    v10 = 608;
  else
    v10 = dword_100E3A2D4[v9];
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v11, "captureUserAction:onTarget:eventValue:", 5013, v10, 0);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepsViewController _maps_mapsSceneDelegate](self, "_maps_mapsSceneDelegate"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "rapPresenter"));
  objc_msgSend(v13, "presentReportAProblemForRouteFromEntryPoint:", v10);

}

- (void)_shareRoute:(id)a3 sourceView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  if (a3)
  {
    v6 = a4;
    v7 = a3;
    v9 = (id)objc_claimAutoreleasedReturnValue(-[RouteStepsViewController delegate](self, "delegate"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[ShareItem shareItemWithRoute:includeRoutingApps:](ShareItem, "shareItemWithRoute:includeRoutingApps:", v7, 1));

    objc_msgSend(v9, "routeStepsViewController:wantsToShareItem:fromView:", self, v8, v6);
  }
}

- (void)directionsStepsList:(id)a3 didTapRowForRouteStep:(id)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;

  v5 = sub_1007787B0(a4);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = (id)objc_claimAutoreleasedReturnValue(-[RouteStepsViewController dataCoordinator](self, "dataCoordinator"));
  objc_msgSend(v12, "updateCurrentRouteDisplayedMapRect:", v5, v7, v9, v11);

}

- (void)transitDirectionsStepsListDataSource:(id)a3 didSelectTrip:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  v9 = -[RouteStepsViewController currentUITargetForAnalytics](self, "currentUITargetForAnalytics");
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "displayedItemIndexForAnalytics"));

  objc_msgSend(v8, "captureUserAction:onTarget:eventValue:transitStep:", 9040, v9, 0, v10);
  v12 = (id)objc_claimAutoreleasedReturnValue(-[RouteStepsViewController delegate](self, "delegate"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "matchingRouteStep"));

  objc_msgSend(v12, "routeStepsViewController:wantsToDisplayScheduleForTransitStep:", self, v11);
}

- (void)transitDirectionsStepsListDataSource:(id)a3 didTapRowForItem:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double x;
  double y;
  double width;
  double height;
  id v14;

  v14 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "listView"));
  v7 = v6;
  if (!v6)
    goto LABEL_5;
  if (!objc_msgSend(v6, "isActiveTransitDirectionsListItem:", v14))
  {
    objc_msgSend(v7, "setActiveTransitDirectionsListItem:", v14);
LABEL_5:
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepsViewController dataCoordinator](self, "dataCoordinator"));
    objc_msgSend(v14, "displayedMapRect");
    v8 = v9;
    goto LABEL_6;
  }
  objc_msgSend(v7, "clearActiveTransitListItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepsViewController dataCoordinator](self, "dataCoordinator"));
  v9 = v8;
  x = MKMapRectNull.origin.x;
  y = MKMapRectNull.origin.y;
  width = MKMapRectNull.size.width;
  height = MKMapRectNull.size.height;
LABEL_6:
  objc_msgSend(v8, "updateCurrentRouteDisplayedMapRect:", x, y, width, height);

}

- (void)transitDirectionsStepsListDataSource:(id)a3 didTapClusteredVehiclesCell:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;

  v26 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "clusteredVehicleItem"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "clusteredSegment"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController clusteredVehiclesSelectionAlertControllerForClusteredSegment:completion:](UIAlertController, "clusteredVehiclesSelectionAlertControllerForClusteredSegment:completion:", v6, 0));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepsViewController view](self, "view"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "popoverPresentationController"));
    objc_msgSend(v9, "setSourceView:", v8);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepsViewController view](self, "view"));
    objc_msgSend(v26, "bounds");
    objc_msgSend(v10, "convertRect:fromView:", v26);
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "popoverPresentationController"));
    objc_msgSend(v19, "setSourceRect:", v12, v14, v16, v18);

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "popoverPresentationController"));
    objc_msgSend(v20, "setPermittedArrowDirections:", 12);

    -[RouteStepsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "clusteredVehicleItem"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "clusteredSegment"));
    v24 = MapsAnalyticsEventValueForClusteredSegment(v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    objc_msgSend(v21, "captureUserAction:onTarget:eventValue:", 3037, 606, v25);

  }
}

- (void)transitDirectionsStepsListDataSource:(id)a3 didTapIncidentsCell:(id)a4 withAdvisory:(id)a5
{
  id v6;
  id v7;

  v6 = a5;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[RouteStepsViewController delegate](self, "delegate"));
  objc_msgSend(v7, "routeStepsViewController:wantsToDisplayAdvisory:", self, v6);

}

- (void)transitDirectionsStepsListDataSource:(id)a3 didTapGetTicketsForSegments:(id)a4
{
  TransitDirectionsListViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  id v19;

  v5 = self->_transitDirectionsListViewController;
  v19 = (id)objc_claimAutoreleasedReturnValue(+[UIAlertController _maps_alertControllerForTicketedSegments:](UIAlertController, "_maps_alertControllerForTicketedSegments:", a4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListViewController view](v5, "view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "popoverPresentationController"));
  objc_msgSend(v7, "setSourceView:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListViewController view](v5, "view"));
  objc_msgSend(v8, "bounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "popoverPresentationController"));
  objc_msgSend(v17, "setSourceRect:", v10, v12, v14, v16);

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "popoverPresentationController"));
  objc_msgSend(v18, "setPermittedArrowDirections:", 12);

  -[TransitDirectionsListViewController presentViewController:animated:completion:](v5, "presentViewController:animated:completion:", v19, 1, 0);
}

- (id)directionsListViewControllerForDirectionsType:(int)a3
{
  void *v3;

  if (a3 == 1)
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepsViewController _transitDirectionsListViewController](self, "_transitDirectionsListViewController"));
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepsViewController _driveOrWalkDirectionsListViewController](self, "_driveOrWalkDirectionsListViewController"));
  return v3;
}

- (UIScrollView)scrollViewForDirectionsDetailsOfCurrentRoute
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepsViewController dataCoordinator](self, "dataCoordinator"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "routeCollection"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentRoute"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepsViewController directionsListViewControllerForDirectionsType:](self, "directionsListViewControllerForDirectionsType:", objc_msgSend(v5, "transportType")));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "scrollView"));

  }
  else
  {
    v7 = 0;
  }

  return (UIScrollView *)v7;
}

- (id)_driveOrWalkDirectionsListViewController
{
  RouteStepListViewController *driveOrWalkDirectionsListViewController;
  RouteStepListViewController *v4;
  void *v5;
  RouteStepListViewController *v6;
  RouteStepListViewController *v7;
  void *v8;
  unint64_t v9;

  driveOrWalkDirectionsListViewController = self->_driveOrWalkDirectionsListViewController;
  if (!driveOrWalkDirectionsListViewController)
  {
    v4 = [RouteStepListViewController alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[RouteStepListMetrics routePlanningMetrics](RouteStepListMetrics, "routePlanningMetrics"));
    v6 = -[RouteStepListViewController initWithOptions:metrics:](v4, "initWithOptions:metrics:", 247, v5);
    v7 = self->_driveOrWalkDirectionsListViewController;
    self->_driveOrWalkDirectionsListViewController = v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    v9 = (unint64_t)objc_msgSend(v8, "containerStyle");
    -[RouteStepListViewController setAllowsSelection:](self->_driveOrWalkDirectionsListViewController, "setAllowsSelection:", (v9 > 7) | (0x5Cu >> v9) & 1);

    -[RouteStepListViewController setDelegate:](self->_driveOrWalkDirectionsListViewController, "setDelegate:", self);
    driveOrWalkDirectionsListViewController = self->_driveOrWalkDirectionsListViewController;
  }
  return driveOrWalkDirectionsListViewController;
}

- (id)_transitDirectionsListViewController
{
  TransitDirectionsListViewController *transitDirectionsListViewController;
  TransitDirectionsListViewController *v4;
  TransitDirectionsListViewController *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  unsigned int v9;
  void *v10;
  void *v11;

  transitDirectionsListViewController = self->_transitDirectionsListViewController;
  if (!transitDirectionsListViewController)
  {
    v4 = objc_alloc_init(TransitDirectionsListViewController);
    v5 = self->_transitDirectionsListViewController;
    self->_transitDirectionsListViewController = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListViewController dataSource](self->_transitDirectionsListViewController, "dataSource"));
    objc_msgSend(v6, "setDelegate:", self);

    -[TransitDirectionsListViewController setScrollViewDelegate:](self->_transitDirectionsListViewController, "setScrollViewDelegate:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    v8 = (unint64_t)objc_msgSend(v7, "containerStyle");
    v9 = (v8 > 7) | (0x5Cu >> v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListViewController dataSource](self->_transitDirectionsListViewController, "dataSource"));
    objc_msgSend(v10, "setAllowStepSelection:", v9 & 1);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListViewController dataSource](self->_transitDirectionsListViewController, "dataSource"));
    objc_msgSend(v11, "setOptions:", 8);

    transitDirectionsListViewController = self->_transitDirectionsListViewController;
  }
  return transitDirectionsListViewController;
}

- (void)_updateVisibleViewsForDirectionsType:(int)a3
{
  _BOOL4 v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = a3 == 1;
  v5 = OBJC_IVAR___RouteStepsViewController__transitDirectionsListViewController[a3 != 1];
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                    + v5), "view"));
  objc_msgSend(v6, "setHidden:", 0);

  -[RouteStepsViewController _observeHeaderFlagForController:](self, "_observeHeaderFlagForController:", *(Class *)((char *)&self->super.super.super.super.super.isa + v5));
  v7 = OBJC_IVAR___RouteStepsViewController__transitDirectionsListViewController[v4];
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                    + v7), "view"));
  objc_msgSend(v8, "setHidden:", 1);

  -[RouteStepsViewController _clearControllerIfNeeded:](self, "_clearControllerIfNeeded:", *(Class *)((char *)&self->super.super.super.super.super.isa + v7));
}

- (void)_clearControllerIfNeeded:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "route"));

  if (v3)
  {
    objc_msgSend(v6, "setRoute:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "collectionView"));
    objc_msgSend(v4, "reloadData");

    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tableView"));
    objc_msgSend(v5, "reloadData");

  }
}

- (void)_setupChildViewControllerIfNeeded:(id)a3
{
  RouteStepsViewController *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a3;
  if (-[RouteStepsViewController isViewLoaded](self, "isViewLoaded"))
  {
    v4 = (RouteStepsViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "parentViewController"));

    if (v4 != self)
    {
      -[RouteStepsViewController addChildViewController:](self, "addChildViewController:", v23);
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "view"));
      objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
      objc_msgSend(v6, "bounds");
      v8 = v7;
      v10 = v9;
      v12 = v11;
      v14 = v13;
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "view"));
      objc_msgSend(v15, "setFrame:", v8, v10, v12, v14);

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "view"));
      objc_msgSend(v16, "addSubview:", v17);

      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "view"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
      LODWORD(v20) = 1148846080;
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "_maps_constraintsEqualToEdgesOfView:priority:", v19, v20));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "allConstraints"));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v22);

      objc_msgSend(v23, "didMoveToParentViewController:", self);
    }
  }

}

- (void)_setupConstraints
{
  void *v3;
  double v4;
  void *v5;
  void *v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(-[RouteStepsViewController modalHeaderView](self, "modalHeaderView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  LODWORD(v4) = 1148846080;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_maps_constraintsEqualToEdgesOfView:priority:", v3, v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allConstraints"));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v6);

}

- (int)currentUITargetForAnalytics
{
  void *v2;
  char *v3;
  int v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepsViewController dataCoordinator](self, "dataCoordinator"));
  v3 = (char *)objc_msgSend(v2, "transportType");
  if ((unint64_t)(v3 - 1) > 4)
    v4 = 0;
  else
    v4 = dword_100E3A2EC[(_QWORD)(v3 - 1)];

  return v4;
}

- (int)currentMapViewTargetForAnalytics
{
  return 504;
}

- (RoutePlanningDataCoordination)dataCoordinator
{
  return (RoutePlanningDataCoordination *)objc_loadWeakRetained((id *)&self->_dataCoordinator);
}

- (void)setDataCoordinator:(id)a3
{
  objc_storeWeak((id *)&self->_dataCoordinator, a3);
}

- (RouteStepsViewControllerDelegate)delegate
{
  return (RouteStepsViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (ContainerHeaderView)modalHeaderView
{
  return self->_modalHeaderView;
}

- (void)setModalHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_modalHeaderView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modalHeaderView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataCoordinator);
  objc_storeStrong((id *)&self->_transitDirectionsListViewController, 0);
  objc_storeStrong((id *)&self->_driveOrWalkDirectionsListViewController, 0);
  objc_destroyWeak((id *)&self->_observingHeaderOfController);
}

@end
