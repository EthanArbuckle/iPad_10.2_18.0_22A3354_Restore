@implementation StepActionCoordinator

- (StepActionCoordinator)initWithContainerViewController:(id)a3
{
  id v4;
  StepActionCoordinator *v5;
  StepActionCoordinator *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)StepActionCoordinator;
  v5 = -[StepActionCoordinator init](&v8, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_containerViewController, v4);

  return v6;
}

- (void)setAppCoordinator:(id)a3
{
  AppCoordinator **p_appCoordinator;
  id WeakRetained;
  void *v6;
  id obj;

  obj = a3;
  p_appCoordinator = &self->_appCoordinator;
  WeakRetained = objc_loadWeakRetained((id *)p_appCoordinator);

  v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)p_appCoordinator, obj);
    v6 = obj;
  }

}

- (BOOL)isAuthorizedForPreciseLocation
{
  void *v2;
  unsigned __int8 v3;
  char v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[StepActionCoordinator locationManager](self, "locationManager"));
  v3 = objc_msgSend(v2, "isLocationServicesApproved");
  v4 = v3 & objc_msgSend(v2, "isAuthorizedForPreciseLocation");

  return v4;
}

- (MKLocationManager)locationManager
{
  MKLocationManager *locationManager;
  MKLocationManager *v4;
  MKLocationManager *v5;

  locationManager = self->_locationManager;
  if (!locationManager)
  {
    v4 = (MKLocationManager *)objc_alloc_init((Class)MKLocationManager);
    v5 = self->_locationManager;
    self->_locationManager = v4;

    locationManager = self->_locationManager;
  }
  return locationManager;
}

- (void)pressedEndWithSender:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[StepActionCoordinator appCoordinator](self, "appCoordinator", a3));
  objc_msgSend(v3, "endNavigationAndReturnToRoutePlanning:", 0);

}

- (void)viewControllerPresentTray:(id)a3
{
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[StepActionCoordinator trayContaineeViewController](self, "trayContaineeViewController"));
  objc_msgSend(WeakRetained, "presentController:animated:", v4, 0);

}

- (void)viewController:(id)a3 presentIncidents:(id)a4
{
  -[StepActionCoordinator _presentIncidents:](self, "_presentIncidents:", a4);
}

- (void)pressedShowDirectionsListWithSender:(id)a3
{
  -[StepActionCoordinator _presentRouteDetailsVC](self, "_presentRouteDetailsVC", a3);
}

- (void)pressedShowOverviewWithSender:(id)a3
{
  -[StepActionCoordinator viewController:showOverview:zoomToMapRegion:](self, "viewController:showOverview:zoomToMapRegion:", a3, 1, 1);
}

- (void)pressedZoomToManeuverWithSender:(id)a3
{
  -[StepActionCoordinator viewController:showOverview:zoomToMapRegion:](self, "viewController:showOverview:zoomToMapRegion:", a3, 0, 1);
}

- (void)viewController:(id)a3 showOverview:(BOOL)a4 zoomToMapRegion:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v5 = a5;
  v6 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[StepActionCoordinator containerViewController](self, "containerViewController", a3));
  objc_msgSend(v8, "showOverview:andZoomToMapRegion:", v6, v5);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[StepActionCoordinator containerViewController](self, "containerViewController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "currentViewController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[StepActionCoordinator trayContaineeViewController](self, "trayContaineeViewController"));

  if (v10 == v11)
  {
    v13 = (id)objc_claimAutoreleasedReturnValue(-[StepActionCoordinator trayContaineeViewController](self, "trayContaineeViewController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "cardPresentationController"));
    objc_msgSend(v12, "wantsLayout:", 1);

  }
}

- (void)showVLF
{
  void *v3;
  void *v4;
  uint64_t v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  VLFContaineeViewController *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[StepActionCoordinator containerViewController](self, "containerViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentViewController"));
  v5 = objc_opt_class(VLFContaineeViewController);
  isKindOfClass = objc_opt_isKindOfClass(v4, v5);

  if ((isKindOfClass & 1) != 0)
  {
    v18 = (id)objc_claimAutoreleasedReturnValue(-[StepActionCoordinator containerViewController](self, "containerViewController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "currentViewController"));
    objc_msgSend(v7, "handleVLFPuckTapped");

  }
  else
  {
    objc_initWeak(&location, self);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[StepActionCoordinator containerViewController](self, "containerViewController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[StepActionCoordinator appCoordinator](self, "appCoordinator"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "baseActionCoordinator"));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100502660;
    v19[3] = &unk_1011AD4F0;
    objc_copyWeak(&v20, &location);
    v11 = objc_msgSend(v8, "showVLFCrowdsourcingPermissionCardWithContaineeDelegate:delegate:completion:", self, v10, v19);

    if ((v11 & 1) == 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[StepActionCoordinator containerViewController](self, "containerViewController"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "chromeViewController"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "userLocationView"));

      if ((objc_msgSend(v14, "isVLFBannerVisible") & 1) != 0)
        v15 = 2;
      else
        v15 = objc_msgSend(v14, "isVLFPuckVisible");
      v16 = -[VLFContaineeViewController initWithEntryPoint:]([VLFContaineeViewController alloc], "initWithEntryPoint:", v15);
      -[ContaineeViewController setContaineeDelegate:](v16, "setContaineeDelegate:", self);
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[StepActionCoordinator containerViewController](self, "containerViewController"));
      objc_msgSend(v17, "presentController:", v16);

    }
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
}

- (unint64_t)originalLayoutForViewController:(id)a3
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  id v12;

  v3 = a3;
  v4 = objc_opt_class(NavTrayViewController);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) == 0)
  {
    v6 = objc_opt_class(ModalContaineeViewController);
    if ((objc_opt_isKindOfClass(v3, v6) & 1) != 0)
    {
LABEL_4:
      v5 = 3;
      goto LABEL_12;
    }
    v7 = objc_opt_class(PlaceCardViewController);
    if ((objc_opt_isKindOfClass(v3, v7) & 1) != 0)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "cardPresentationController"));
      v9 = objc_msgSend(v8, "presentedModally");

      if ((v9 & 1) != 0)
      {
        v5 = 5;
        goto LABEL_12;
      }
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
      if (objc_msgSend(v10, "userInterfaceIdiom") == (id)1)
      {

        goto LABEL_4;
      }
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
      v12 = objc_msgSend(v11, "userInterfaceIdiom");

      if (v12 == (id)5)
        goto LABEL_4;
    }
    v5 = 2;
    goto LABEL_12;
  }
  v5 = 1;
LABEL_12:

  return v5;
}

- (void)selectVKLabelMarker:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)MKMapItem), "_initWithLabelMarker:", v4);

  -[StepActionCoordinator _presentPlaceCardViewControllerForMapItem:modally:](self, "_presentPlaceCardViewControllerForMapItem:modally:", v5, 0);
}

- (BOOL)canSelectVKLabelMarker:(id)a3
{
  id v3;
  char v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a3;
  if ((objc_msgSend(v3, "isTransitLine") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "waypointInfo"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "waypoint"));

    v7 = objc_opt_class(GEOComposedWaypointToRoute);
    v4 = objc_opt_isKindOfClass(v6, v7) ^ 1;

  }
  return v4 & 1;
}

- (void)deselectVKLabelMarker:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[StepActionCoordinator containerViewController](self, "containerViewController", a3));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentViewController"));

  v5 = objc_opt_class(PlaceCardViewController);
  if ((objc_opt_isKindOfClass(v7, v5) & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[StepActionCoordinator containerViewController](self, "containerViewController"));
    objc_msgSend(v6, "popLastViewControllerAnimated:", 1);

  }
}

- (void)containeeViewControllerGoToPreviousState:(id)a3 withSender:(id)a4
{
  id v5;
  uint64_t v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a3;
  v6 = objc_opt_class(PlaceCardViewController);
  isKindOfClass = objc_opt_isKindOfClass(v5, v6);

  if ((isKindOfClass & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[StepActionCoordinator containerViewController](self, "containerViewController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "chromeViewController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mapView"));
    objc_msgSend(v10, "_deselectLabelMarkerAnimated:", 1);

  }
  v11 = (id)objc_claimAutoreleasedReturnValue(-[StepActionCoordinator containerViewController](self, "containerViewController"));
  objc_msgSend(v11, "popLastViewControllerAnimated:", 1);

}

- (void)directionsStepsList:(id)a3 didTapRowForRouteStep:(id)a4
{
  StepContainerViewController **p_containerViewController;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;

  p_containerViewController = &self->_containerViewController;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_containerViewController);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[StepActionCoordinator trayContaineeViewController](self, "trayContaineeViewController"));
  objc_msgSend(WeakRetained, "presentController:", v8);

  v9 = objc_loadWeakRetained((id *)p_containerViewController);
  objc_msgSend(v9, "updateWithDisplayedStep:", v6);

}

- (void)directionsStepsListDidTapShareButton:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "route"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[StepActionCoordinator directionsStepsViewController](self, "directionsStepsViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
  -[StepActionCoordinator _shareRoute:sourceView:](self, "_shareRoute:sourceView:", v4, v6);

}

- (void)directionsStepsListDidTapRAPButton:(id)a3
{
  StepContainerViewController **p_containerViewController;
  id WeakRetained;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  p_containerViewController = &self->_containerViewController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "route"));
  v6 = objc_msgSend(v5, "transportType") - 1;
  if (v6 > 5)
    v7 = 608;
  else
    v7 = dword_100E37760[v6];

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v8, "captureUserAction:onTarget:eventValue:", 5013, v7, 0);

  v11 = objc_loadWeakRetained((id *)p_containerViewController);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "_maps_mapsSceneDelegate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "rapPresenter"));
  objc_msgSend(v10, "presentReportAProblemForRouteFromEntryPoint:", v7);

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
    v9 = (id)objc_claimAutoreleasedReturnValue(-[StepActionCoordinator appCoordinator](self, "appCoordinator"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[ShareItem shareItemWithRoute:includeRoutingApps:](ShareItem, "shareItemWithRoute:includeRoutingApps:", v7, 0));

    objc_msgSend(v9, "shareItem:sourceView:completion:", v8, v6, 0);
  }
}

- (GEOMapServiceTraits)newTraits
{
  void *v2;
  void *v3;
  GEOMapServiceTraits *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[StepActionCoordinator containerViewController](self, "containerViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "chromeViewController"));
  v4 = (GEOMapServiceTraits *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentTraits"));

  return v4;
}

- (int64_t)displayedViewMode
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[StepActionCoordinator containerViewController](self, "containerViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "chromeViewController"));
  v4 = objc_msgSend(v3, "displayedViewMode");

  return (int64_t)v4;
}

- (void)placeCardViewController:(id)a3 showTransitIncidents:(id)a4
{
  -[StepActionCoordinator viewController:presentIncidents:](self, "viewController:presentIncidents:", a3, a4);
}

- (BOOL)placeCardViewController:(id)a3 shouldShowTransitScheduleForMapItem:(id)a4 departureSequence:(id)a5
{
  return 0;
}

- (NavTrayViewController)trayContaineeViewController
{
  NavTrayViewController *trayContaineeViewController;
  NavTrayViewController *v4;
  void *v5;
  void *v6;
  NavTrayViewController *v7;
  NavTrayViewController *v8;
  void *v9;

  trayContaineeViewController = self->_trayContaineeViewController;
  if (!trayContaineeViewController)
  {
    v4 = [NavTrayViewController alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[StepActionCoordinator appCoordinator](self, "appCoordinator"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "platformController"));
    v7 = -[NavTrayViewController initForSteppingWithDelegate:platformController:](v4, "initForSteppingWithDelegate:platformController:", self, v6);
    v8 = self->_trayContaineeViewController;
    self->_trayContaineeViewController = v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayViewController view](self->_trayContaineeViewController, "view"));
    objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    trayContaineeViewController = self->_trayContaineeViewController;
  }
  return trayContaineeViewController;
}

- (RouteStepListViewController)directionsStepsViewController
{
  RouteStepListViewController *directionsStepsViewController;
  RouteStepListViewController *v4;
  void *v5;
  RouteStepListViewController *v6;
  RouteStepListViewController *v7;
  id WeakRetained;
  void *v9;

  directionsStepsViewController = self->_directionsStepsViewController;
  if (!directionsStepsViewController)
  {
    v4 = [RouteStepListViewController alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[RouteStepListMetrics routePlanningMetrics](RouteStepListMetrics, "routePlanningMetrics"));
    v6 = -[RouteStepListViewController initWithOptions:metrics:](v4, "initWithOptions:metrics:", 247, v5);
    v7 = self->_directionsStepsViewController;
    self->_directionsStepsViewController = v6;

    -[RouteStepListViewController setDelegate:](self->_directionsStepsViewController, "setDelegate:", self);
    WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "route"));
    -[RouteStepListViewController setRoute:](self->_directionsStepsViewController, "setRoute:", v9);

    directionsStepsViewController = self->_directionsStepsViewController;
  }
  return directionsStepsViewController;
}

- (PlaceCardViewController)placeCardViewController
{
  PlaceCardViewController *placeCardViewController;
  PlaceCardViewController *v4;
  PlaceCardViewController *v5;

  placeCardViewController = self->_placeCardViewController;
  if (!placeCardViewController)
  {
    v4 = -[PlaceCardViewController initWithVisualEffectDisabled:]([PlaceCardViewController alloc], "initWithVisualEffectDisabled:", 1);
    v5 = self->_placeCardViewController;
    self->_placeCardViewController = v4;

    -[PlaceCardViewController setExcludedContent:](self->_placeCardViewController, "setExcludedContent:", 14671);
    -[PlaceCardViewController setPlaceCardDelegate:](self->_placeCardViewController, "setPlaceCardDelegate:", self);
    -[InfoCardViewController setContaineeDelegate:](self->_placeCardViewController, "setContaineeDelegate:", self);
    placeCardViewController = self->_placeCardViewController;
  }
  return placeCardViewController;
}

- (void)_presentRouteDetailsVC
{
  StepContainerViewController **p_containerViewController;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  ModalContaineeViewController *v9;
  void *v10;
  id v11;
  id v12;

  v12 = (id)objc_claimAutoreleasedReturnValue(-[StepActionCoordinator directionsStepsViewController](self, "directionsStepsViewController"));
  p_containerViewController = &self->_containerViewController;
  WeakRetained = objc_loadWeakRetained((id *)p_containerViewController);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "route"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "destination"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "navDisplayName"));

  if (!v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Directions_stepping"), CFSTR("localized string not found"), 0));

  }
  v9 = -[ModalContaineeViewController initWithChildViewController:visualEffectDisabled:]([ModalContaineeViewController alloc], "initWithChildViewController:visualEffectDisabled:", v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ModalContaineeViewController headerView](v9, "headerView"));
  objc_msgSend(v10, "setTitle:", v7);

  v11 = objc_loadWeakRetained((id *)p_containerViewController);
  objc_msgSend(v11, "presentController:", v9);

}

- (void)_presentIncidents:(id)a3
{
  id v4;
  ModalContaineeViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  id WeakRetained;
  MapsIncidentsViewController *v10;

  v4 = a3;
  v10 = -[MapsIncidentsViewController initWithTransitIncidents:]([MapsIncidentsViewController alloc], "initWithTransitIncidents:", v4);

  v5 = -[ModalContaineeViewController initWithChildViewController:]([ModalContaineeViewController alloc], "initWithChildViewController:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsIncidentsViewController navigationItem](v10, "navigationItem"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "title"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ModalContaineeViewController headerView](v5, "headerView"));
  objc_msgSend(v8, "setTitle:", v7);

  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  objc_msgSend(WeakRetained, "presentController:", v5);

}

- (void)_presentAdvisory:(id)a3
{
  id v4;
  ModalContaineeViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  id WeakRetained;
  MapsIncidentsViewController *v10;

  v4 = a3;
  v10 = objc_alloc_init(MapsIncidentsViewController);
  v5 = -[ModalContaineeViewController initWithChildViewController:]([ModalContaineeViewController alloc], "initWithChildViewController:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsIncidentsViewController navigationItem](v10, "navigationItem"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "title"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ModalContaineeViewController headerView](v5, "headerView"));
  objc_msgSend(v8, "setTitle:", v7);

  -[MapsIncidentsViewController setAdvisory:](v10, "setAdvisory:", v4);
  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  objc_msgSend(WeakRetained, "presentController:", v5);

}

- (void)_presentPlaceCardViewControllerForMapItem:(id)a3 modally:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  char isKindOfClass;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  void *v15;
  void *v16;
  id WeakRetained;
  PlaceCardItem *v18;

  v4 = a4;
  v6 = a3;
  v18 = -[PlaceCardItem initWithMapItem:]([PlaceCardItem alloc], "initWithMapItem:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[StepActionCoordinator containerViewController](self, "containerViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentViewController"));
  v9 = objc_opt_class(PlaceCardViewController);
  isKindOfClass = objc_opt_isKindOfClass(v8, v9);

  if ((isKindOfClass & 1) == 0
    || (v11 = (void *)objc_claimAutoreleasedReturnValue(-[StepActionCoordinator containerViewController](self, "containerViewController")),
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "currentViewController")),
        v11,
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "placeCardItem")),
        v14 = -[PlaceCardItem isEqual:](v18, "isEqual:", v13),
        v13,
        v12,
        (v14 & 1) == 0))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[StepActionCoordinator placeCardViewController](self, "placeCardViewController"));
    objc_msgSend(v15, "resetState");
    objc_msgSend(v15, "setPlaceCardItem:withHistory:", v18, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "cardPresentationController"));
    objc_msgSend(v16, "setPresentedModally:", v4);

    WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
    objc_msgSend(WeakRetained, "presentController:", v15);

  }
}

- (void)placeCardViewController:(id)a3 openURL:(id)a4
{
  id v4;
  id v5;

  v4 = a4;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[MKSystemController sharedInstance](MKSystemController, "sharedInstance"));
  objc_msgSend(v5, "openURL:completionHandler:", v4, 0);

}

- (int)currentUITargetForAnalytics
{
  id WeakRetained;
  void *v3;
  unsigned int v4;
  int v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "route"));
  v4 = objc_msgSend(v3, "transportType") - 1;
  if (v4 > 5)
    v5 = 608;
  else
    v5 = dword_100E37778[v4];

  return v5;
}

- (int)currentMapViewTargetForAnalytics
{
  return 505;
}

- (void)pptTestEndNavigation
{
  -[StepActionCoordinator pressedEndWithSender:](self, "pressedEndWithSender:", 0);
}

- (BOOL)pptTestCanUpdateTrayLayout
{
  StepContainerViewController **p_containerViewController;
  id WeakRetained;
  BOOL v4;
  id v5;

  p_containerViewController = &self->_containerViewController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  if (objc_msgSend(WeakRetained, "containeeLayout") == (id)5)
  {
    v4 = 0;
  }
  else
  {
    v5 = objc_loadWeakRetained((id *)p_containerViewController);
    v4 = objc_msgSend(v5, "containeeLayout") != (id)4;

  }
  return v4;
}

- (void)pptTestUpdateTrayLayout:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  unint64_t v6;
  StepContainerViewController **p_containerViewController;
  id WeakRetained;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[2];
  _QWORD v16[2];

  v4 = a4;
  if (a3 < 3)
    v6 = a3 + 1;
  else
    v6 = 0;
  p_containerViewController = &self->_containerViewController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  v9 = objc_msgSend(WeakRetained, "containeeLayout");

  if (v9 == (id)v6)
  {
    v15[0] = CFSTR("ContainerLayout");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v6));
    v15[1] = CFSTR("ContainerContainee");
    v16[0] = v10;
    v11 = objc_loadWeakRetained((id *)p_containerViewController);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "currentViewController"));
    v16[1] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v16, v15, 2));
    +[PPTNotificationCenter postNotificationIfNeededWithName:object:userInfo:](PPTNotificationCenter, "postNotificationIfNeededWithName:object:userInfo:", CFSTR("PPTTestTrayLayoutDidUpdateNotification"), self, v13);

  }
  else
  {
    v14 = objc_loadWeakRetained((id *)p_containerViewController);
    objc_msgSend(v14, "setLayoutIfSupported:animated:", v6, v4);

  }
}

- (BOOL)pptTestIsTrayType:(int64_t)a3
{
  return a3 == 0;
}

- (void)pptTestDismissTrayAnimated:(BOOL)a3 assertTrayType:(int64_t)a4
{
  _BOOL8 v4;
  id WeakRetained;

  if ((unint64_t)(a4 - 1) >= 3)
  {
    v4 = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
    objc_msgSend(WeakRetained, "popLastViewControllerAnimated:", v4);

  }
}

- (UIScrollView)pptTestScrollView
{
  return 0;
}

- (BOOL)pptTestSupportStepping
{
  return 1;
}

- (int64_t)pptTestCurrentStepIndex
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[StepActionCoordinator containerViewController](self, "containerViewController"));
  if (objc_msgSend(v2, "conformsToProtocol:", &OBJC_PROTOCOL___PPTTestGuidanceStepProtocol))
    v3 = objc_msgSend(v2, "pptTestCurrentStepIndex");
  else
    v3 = 0;

  return (int64_t)v3;
}

- (BOOL)pptTestHasNextStep
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[StepActionCoordinator containerViewController](self, "containerViewController"));
  if (objc_msgSend(v2, "conformsToProtocol:", &OBJC_PROTOCOL___PPTTestGuidanceStepProtocol))
    v3 = objc_msgSend(v2, "pptTestHasNextStep");
  else
    v3 = 0;

  return v3;
}

- (void)pptTestMoveToNextStep
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[StepActionCoordinator containerViewController](self, "containerViewController"));
  if (objc_msgSend(v2, "conformsToProtocol:", &OBJC_PROTOCOL___PPTTestGuidanceStepProtocol))
    objc_msgSend(v2, "pptTestMoveToNextStep");

}

- (BOOL)pptTestMoveToBoardStep
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[StepActionCoordinator containerViewController](self, "containerViewController"));
  if (objc_msgSend(v2, "conformsToProtocol:", &OBJC_PROTOCOL___PPTTestGuidanceStepProtocol))
    v3 = objc_msgSend(v2, "pptTestMoveToBoardStep");
  else
    v3 = 0;

  return v3;
}

- (AppCoordinator)appCoordinator
{
  return (AppCoordinator *)objc_loadWeakRetained((id *)&self->_appCoordinator);
}

- (StepContainerViewController)containerViewController
{
  return (StepContainerViewController *)objc_loadWeakRetained((id *)&self->_containerViewController);
}

- (void)setContainerViewController:(id)a3
{
  objc_storeWeak((id *)&self->_containerViewController, a3);
}

- (void)setDirectionsStepsViewController:(id)a3
{
  objc_storeStrong((id *)&self->_directionsStepsViewController, a3);
}

- (void)setPlaceCardViewController:(id)a3
{
  objc_storeStrong((id *)&self->_placeCardViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeCardViewController, 0);
  objc_storeStrong((id *)&self->_directionsStepsViewController, 0);
  objc_destroyWeak((id *)&self->_containerViewController);
  objc_storeStrong((id *)&self->_trayContaineeViewController, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_destroyWeak((id *)&self->_appCoordinator);
}

@end
