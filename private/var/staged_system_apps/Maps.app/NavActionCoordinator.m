@implementation NavActionCoordinator

- (GEOMapServiceTraits)newTraits
{
  void *v2;
  void *v3;
  GEOMapServiceTraits *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "chromeViewController"));
  v4 = (GEOMapServiceTraits *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentTraits"));

  return v4;
}

- (int64_t)displayedViewMode
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "chromeViewController"));
  v4 = objc_msgSend(v3, "displayedViewMode");

  return (int64_t)v4;
}

- (void)placeCardViewController:(id)a3 doDirectionItem:(id)a4 userInfo:(id)a5
{
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "endMapItem", a3));
  -[NavActionCoordinator detourToMapItem:](self, "detourToMapItem:", v6);

}

- (BOOL)placeCardViewController:(id)a3 shouldShowTransitScheduleForMapItem:(id)a4 departureSequence:(id)a5
{
  return 0;
}

- (void)placeCardViewController:(id)a3 openURL:(id)a4
{
  id v4;
  id v5;

  v4 = a4;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[MKSystemController sharedInstance](MKSystemController, "sharedInstance"));
  objc_msgSend(v5, "openURL:completionHandler:", v4, 0);

}

- (BOOL)chromeDidSelectCustomPOIAnnotation:(id)a3
{
  void *v4;
  PlaceCardItem *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  char isKindOfClass;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  uint64_t IsEnabled_Maps420;
  uint64_t v16;
  uint64_t v17;
  uint64_t IsEnabled_DrivingMultiWaypointRoutes;
  uint64_t IsEnabled_Maps182;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "mapItem"));
  if (v4)
  {
    +[SARAnalytics captureMapSelectMapItem:](SARAnalytics, "captureMapSelectMapItem:", v4);
    v5 = -[PlaceCardItem initWithMapItem:]([PlaceCardItem alloc], "initWithMapItem:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentViewController"));
    v8 = objc_opt_class(PlaceCardViewController);
    isKindOfClass = objc_opt_isKindOfClass(v7, v8);

    if ((isKindOfClass & 1) == 0
      || (v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController")),
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "currentViewController")),
          v10,
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "placeCardItem")),
          v13 = -[PlaceCardItem isEqual:](v5, "isEqual:", v12),
          v12,
          v11,
          (v13 & 1) == 0))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator placecardViewController](self, "placecardViewController"));
      objc_msgSend(v14, "resetState");
      IsEnabled_Maps420 = -[NavActionCoordinator navigationTransportType](self, "navigationTransportType");
      v17 = 0;
      switch(IsEnabled_Maps420)
      {
        case 0:
          IsEnabled_DrivingMultiWaypointRoutes = MapsFeature_IsEnabled_DrivingMultiWaypointRoutes(IsEnabled_Maps420, v16);
          if ((IsEnabled_DrivingMultiWaypointRoutes & 1) == 0)
          {
            IsEnabled_Maps420 = MapsFeature_IsEnabled_Maps420(IsEnabled_DrivingMultiWaypointRoutes);
            if ((IsEnabled_Maps420 & 1) == 0)
              goto LABEL_8;
          }
          v17 = 1;
          break;
        case 1:
          IsEnabled_Maps182 = MapsFeature_IsEnabled_DrivingMultiWaypointRoutes(IsEnabled_Maps420, v16);
          goto LABEL_11;
        case 2:
LABEL_8:
          IsEnabled_Maps182 = MapsFeature_IsEnabled_Maps182(IsEnabled_Maps420);
          goto LABEL_11;
        case 5:
          IsEnabled_Maps182 = MapsFeature_IsEnabled_Maps420(IsEnabled_Maps420);
LABEL_11:
          v17 = IsEnabled_Maps182;
          break;
        default:
          break;
      }
      objc_msgSend(v14, "setIsAdditionalStop:", v17);
      objc_msgSend(v14, "setExcludedContent:", -[NavActionCoordinator excludedContentForMapItem:](self, "excludedContentForMapItem:", v4));
      objc_msgSend(v14, "setPlaceCardItem:withHistory:", v5, 0);
      -[NavActionCoordinator presentPlacecardViewController](self, "presentPlacecardViewController");

    }
  }

  return v4 != 0;
}

- (BOOL)chromeShouldAllowSelectingLabelMarker:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = a3;
  if (objc_msgSend(v3, "isRouteEta"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "routeInfo"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "route"));
    v6 = ((unint64_t)objc_msgSend(v5, "source") & 0xFFFFFFFFFFFFFFFELL) != 2;

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (BOOL)chromeDidSelectETAMarkerForRoute:(id)a3
{
  -[NavActionCoordinator viewController:switchNavigationToRoute:](self, "viewController:switchNavigationToRoute:", 0, a3);
  return 1;
}

- (BOOL)chromeDidSelectTransitLineMarker:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator navTrafficIncidentCoordinator](self, "navTrafficIncidentCoordinator"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "presentedAlert"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator navTrafficIncidentCoordinator](self, "navTrafficIncidentCoordinator"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "alertViewController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "cardPresentationController"));
    objc_msgSend(v9, "wantsLayout:", 2);

  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    objc_msgSend(v10, "captureUserAction:onTarget:eventValue:", 1031, 505, 0);

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "incident"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator trafficIncidentViewController](self, "trafficIncidentViewController"));
    objc_msgSend(v12, "setIncident:", v11);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator trafficIncidentViewController](self, "trafficIncidentViewController"));
    objc_msgSend(v7, "presentController:animated:useDefaultContaineeLayout:", v8, 1, 1);
  }

  return 1;
}

- (BOOL)chromeDidSelectRouteAnnotations:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  int64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  unsigned int v19;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator routeAnnotationViewController](self, "routeAnnotationViewController"));
    objc_msgSend(v6, "setRouteAnnotation:", v5);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator routeAnnotationViewController](self, "routeAnnotationViewController"));
    objc_msgSend(v7, "presentController:", v8);

    v9 = -[NavActionCoordinator navigationTransportType](self, "navigationTransportType");
    v10 = v9;
    if (v9 == 5 || v9 == 2)
    {
      v19 = 0;
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "styleAttributes"));
      v13 = FeatureStyleAttributesFind(v12, 90, &v19);

      if (v13)
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v19));
      else
        v14 = 0;
      if (v10 == 2)
        v15 = 312;
      else
        v15 = 67;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringValue"));
      objc_msgSend(v16, "captureUserAction:onTarget:eventValue:", v15, 505, v17);

    }
  }

  return 1;
}

- (BOOL)chromeDidSelectClusteredFeatureAnnotationsMarker:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator simpleResultsViewController](self, "simpleResultsViewController"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cluster"));

  if (v6 != v4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator simpleResultsViewController](self, "simpleResultsViewController"));
    objc_msgSend(v7, "clearCluster");

  }
  -[NavActionCoordinator presentSimpleResultsViewController](self, "presentSimpleResultsViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator simpleResultsViewController](self, "simpleResultsViewController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator currentSearchInfo](self, "currentSearchInfo"));
  objc_msgSend(v8, "setCluster:sortAlphabetically:originalSearchInfo:", v4, 0, v9);

  return 1;
}

- (BOOL)chromeDidSelectTrafficIncident:(id)a3 latitude:(id)a4 longitude:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator navTrafficIncidentCoordinator](self, "navTrafficIncidentCoordinator"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "presentedAlert"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator navTrafficIncidentCoordinator](self, "navTrafficIncidentCoordinator"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "alertViewController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "cardPresentationController"));
    objc_msgSend(v11, "wantsLayout:", 2);

  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    objc_msgSend(v12, "captureUserAction:onTarget:eventValue:", 1031, 505, 0);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator trafficIncidentViewController](self, "trafficIncidentViewController"));
    objc_msgSend(v13, "setIncident:", v6);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator trafficIncidentViewController](self, "trafficIncidentViewController"));
    objc_msgSend(v9, "presentController:animated:useDefaultContaineeLayout:", v10, 1, 1);
  }

  return 1;
}

- (BOOL)chromeDidSelectMarkerForMapItem:(id)a3
{
  return 1;
}

- (BOOL)chromeDidSelectLabelMarker:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  double v8;
  double v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  NavActionCoordinator *v20;
  id v21;

  v4 = a3;
  if (objc_msgSend(v4, "featureID") || objc_msgSend(v4, "hasBusinessID"))
  {
    if (objc_msgSend(v4, "featureID"))
      v5 = objc_msgSend(v4, "featureID");
    else
      v5 = objc_msgSend(v4, "businessID");
    v6 = v5;
    v7 = objc_alloc((Class)MKMapItemIdentifier);
    objc_msgSend(v4, "coordinate");
    v9 = v8;
    objc_msgSend(v4, "coordinate");
    v10 = objc_msgSend(v7, "initWithMUID:resultProviderID:coordinate:", v6, 0, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    v21 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "chromeViewController"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "currentTraits"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "ticketForIdentifiers:traits:", v12, v15));

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100AF7BA8;
    v18[3] = &unk_1011AE6F0;
    v19 = v4;
    v20 = self;
    objc_msgSend(v16, "submitWithHandler:networkActivity:", v18, 0);

  }
  return 1;
}

- (BOOL)chromeDidClearMapSelection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _QWORD v22[3];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentViewController"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator trafficIncidentAlertCoordinator](self, "trafficIncidentAlertCoordinator"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "alertViewController"));

  if (v4 == v6)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator navTrafficIncidentCoordinator](self, "navTrafficIncidentCoordinator"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "alertViewController"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "cardPresentationController"));
    objc_msgSend(v15, "wantsLayout:", 1);

  }
  else
  {
    v22[0] = objc_opt_class(PlaceCardViewController);
    v22[1] = objc_opt_class(SimpleResultsViewController);
    v22[2] = objc_opt_class(NavTrafficIncidentContaineeViewController);
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v7 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v22, 3));
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v7);
          if ((objc_opt_isKindOfClass(v4, *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i)) & 1) != 0)
          {
            v12 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController", (_QWORD)v17));
            objc_msgSend(v12, "popLastViewControllerAnimated:", 1);

            goto LABEL_12;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v9)
          continue;
        break;
      }
    }
LABEL_12:

  }
  return 1;
}

- (void)simpleResultsViewContoller:(id)a3 selectSearchResult:(id)a4
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "mapItem", a3));
  -[NavActionCoordinator selectMapItem:shouldRemoveResults:](self, "selectMapItem:shouldRemoveResults:", v5, 0);

}

- (void)simpleResultsViewContoller:(id)a3 selectClusteredLabelMarker:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator mapSelectionManager](self, "mapSelectionManager"));
  objc_msgSend(v6, "selectLabelMarker:animated:", v5, 1);

}

- (NavActionCoordinator)initWithMapItemDisplayer:(id)a3 navigationDisplay:(id)a4 guidanceObserver:(id)a5 navigationCameraModeController:(id)a6 rapNavigationTracker:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  NavActionCoordinator *v18;
  NavActionCoordinator *v19;
  NavActionCoordinator *v20;
  objc_super v22;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v22.receiver = self;
  v22.super_class = (Class)NavActionCoordinator;
  v18 = -[NavActionCoordinator init](&v22, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_mapItemDisplayer, a3);
    objc_storeStrong((id *)&v19->_navigationDisplay, a4);
    objc_storeStrong((id *)&v19->_guidanceObserver, a5);
    objc_storeWeak((id *)&v19->_navigationCameraModeController, v16);
    v19->_defaultMapViewZoom = 0;
    objc_storeStrong((id *)&v19->_rapNavigationTracker, a7);
    v20 = v19;
  }

  return v19;
}

- (void)presentWithContainerViewController:(id)a3
{
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
  id v15;
  NSObject *v16;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v19;

  -[NavActionCoordinator setContainerViewController:](self, "setContainerViewController:", a3);
  if (self->_searchHomeViewController)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "chromeViewController"));

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "appCoordinator"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "baseActionCoordinator"));
    -[ControlContaineeViewController setDelegate:](self->_searchHomeViewController, "setDelegate:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "personalizedItemManager"));
    -[SearchViewController setPersonalizedItemManager:](self->_searchHomeViewController, "setPersonalizedItemManager:", v8);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator navigationTrayContaineeViewController](self, "navigationTrayContaineeViewController"));
  if ((objc_msgSend(v9, "controllerIsInStack:", v10) & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "currentViewController"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "view"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "window"));

    if (v14)
      return;
  }
  else
  {

  }
  v15 = sub_100431C0C();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v19 = "-[NavActionCoordinator presentWithContainerViewController:]";
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s Inserting nav tray into the containee stack", buf, 0xCu);
  }

  -[NavActionCoordinator presentTray](self, "presentTray");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100C21D04;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (unint64_t)activeSharingCount
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripService sharedInstance](MSPSharedTripService, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "receivers"));
  v4 = objc_msgSend(v3, "count");

  return (unint64_t)v4;
}

- (void)viewControllerOpenContactsSearch:(id)a3
{
  id WeakRetained;
  NavContactSearchViewController *v5;

  v5 = objc_alloc_init(NavContactSearchViewController);
  -[ContaineeViewController setContaineeDelegate:](v5, "setContaineeDelegate:", self);
  -[NavContactSearchViewController setNavActionCoordinator:](v5, "setNavActionCoordinator:", self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  objc_msgSend(WeakRetained, "presentController:", v5);

}

- (void)senderShareNavigation:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  id location;
  char v8;

  v4 = a3;
  v8 = 0;
  if (SBSGetScreenLockStatus(&v8) && v8)
  {
    objc_initWeak(&location, self);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100C21EE0;
    v5[3] = &unk_1011E0558;
    objc_copyWeak(&v6, &location);
    +[UIApplication _maps_unlockApplicationWithCompletion:](UIApplication, "_maps_unlockApplicationWithCompletion:", v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
  else
  {
    -[NavActionCoordinator openShareETAController](self, "openShareETAController");
  }

}

- (void)openShareETAController
{
  NavContainerViewController **p_containerViewController;
  id WeakRetained;
  void *v5;
  unsigned __int8 v6;
  id v7;
  NavShareETAViewController *v8;

  p_containerViewController = &self->_containerViewController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "currentViewController"));
  v6 = objc_msgSend(v5, "isMemberOfClass:", objc_opt_class(NavShareETAViewController));

  if ((v6 & 1) == 0)
  {
    v8 = objc_alloc_init(NavShareETAViewController);
    -[ContaineeViewController setContaineeDelegate:](v8, "setContaineeDelegate:", self);
    -[NavShareETAViewController setNavActionCoordinator:](v8, "setNavActionCoordinator:", self);
    v7 = objc_loadWeakRetained((id *)p_containerViewController);
    objc_msgSend(v7, "presentController:", v8);

  }
}

- (void)viewController:(id)a3 shareContactValue:(id)a4
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripService sharedInstance](MSPSharedTripService, "sharedInstance"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100C220EC;
  v7[3] = &unk_1011C9910;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "startSharingWithContact:completion:", v6, v7);

}

- (void)displayIncidentReporting
{
  id WeakRetained;
  NavTrafficIncidentReportingContaineeViewController *v4;

  if (!-[NavActionCoordinator isDisplayingIncidentReporting](self, "isDisplayingIncidentReporting"))
  {
    v4 = -[NavTrafficIncidentReportingContaineeViewController initWithDelegate:]([NavTrafficIncidentReportingContaineeViewController alloc], "initWithDelegate:", self);
    WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
    objc_msgSend(WeakRetained, "presentController:", v4);

  }
}

- (void)displayIncidentReportSubmissionWithItem:(id)a3 report:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  NavTrafficIncidentReportSubmissionContaineeViewController *v9;

  v6 = a4;
  v7 = a3;
  v9 = -[NavTrafficIncidentReportSubmissionContaineeViewController initWithItem:report:]([NavTrafficIncidentReportSubmissionContaineeViewController alloc], "initWithItem:report:", v7, v6);

  -[ContaineeViewController setContaineeDelegate:](v9, "setContaineeDelegate:", self);
  -[NavTrafficIncidentReportSubmissionContaineeViewController setReportingDelegate:](v9, "setReportingDelegate:", self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  objc_msgSend(WeakRetained, "presentController:animated:useDefaultContaineeLayout:", v9, 1, 1);

}

- (BOOL)isDisplayingIncidentReporting
{
  NavContainerViewController **p_containerViewController;
  id WeakRetained;
  void *v4;
  uint64_t v5;
  char isKindOfClass;
  id v7;
  void *v8;
  uint64_t v9;

  p_containerViewController = &self->_containerViewController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "currentViewController"));
  v5 = objc_opt_class(NavTrafficIncidentReportingContaineeViewController);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    isKindOfClass = 1;
  }
  else
  {
    v7 = objc_loadWeakRetained((id *)p_containerViewController);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentViewController"));
    v9 = objc_opt_class(NavTrafficIncidentReportSubmissionContaineeViewController);
    isKindOfClass = objc_opt_isKindOfClass(v8, v9);

  }
  return isKindOfClass & 1;
}

- (void)incidentReportSubmissionContaineeDidFinish:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  char isKindOfClass;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentViewController"));
  v6 = objc_opt_class(NavTrafficIncidentReportSubmissionContaineeViewController);
  isKindOfClass = objc_opt_isKindOfClass(v5, v6);

  if ((isKindOfClass & 1) != 0)
    -[NavActionCoordinator _presentTrayWithDefaultLayout:animated:](self, "_presentTrayWithDefaultLayout:animated:", 1, 1);
}

- (void)displayVoiceVolumeControl
{
  id WeakRetained;
  NavVoiceVolumeViewController *v4;

  if (!-[NavActionCoordinator isControllingVoiceVolume](self, "isControllingVoiceVolume"))
  {
    v4 = -[NavVoiceVolumeViewController initWithDelegate:]([NavVoiceVolumeViewController alloc], "initWithDelegate:", self);
    -[ContaineeViewController setContaineeDelegate:](v4, "setContaineeDelegate:", self);
    WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
    objc_msgSend(WeakRetained, "presentController:", v4);

  }
}

- (BOOL)isControllingVoiceVolume
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  char isKindOfClass;

  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "currentViewController"));
  v4 = objc_opt_class(NavVoiceVolumeViewController);
  isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  return isKindOfClass & 1;
}

- (void)setContainerViewController:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_containerViewController, obj);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "chromeViewController"));
    -[MapViewZoomController setChromeViewController:](self->_mapViewZoomController, "setChromeViewController:", v5);

  }
}

- (void)setAppCoordinator:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_appCoordinator);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_appCoordinator, obj);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "platformController"));
    -[NavTrayViewController setPlatformController:](self->_navigationTrayContaineeViewController, "setPlatformController:", v5);

  }
}

- (NavTrayViewController)navigationTrayContaineeViewController
{
  NavTrayViewController *navigationTrayContaineeViewController;
  NavTrayViewController *v4;
  void *v5;
  void *v6;
  void *v7;
  NavTrayViewController *v8;
  NavTrayViewController *v9;

  navigationTrayContaineeViewController = self->_navigationTrayContaineeViewController;
  if (!navigationTrayContaineeViewController)
  {
    v4 = [NavTrayViewController alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator guidanceObserver](self, "guidanceObserver"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator appCoordinator](self, "appCoordinator"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "platformController"));
    v8 = -[NavTrayViewController initForNavigationWithDelegate:guidanceObserver:platformController:](v4, "initForNavigationWithDelegate:guidanceObserver:platformController:", self, v5, v7);
    v9 = self->_navigationTrayContaineeViewController;
    self->_navigationTrayContaineeViewController = v8;

    navigationTrayContaineeViewController = self->_navigationTrayContaineeViewController;
  }
  return navigationTrayContaineeViewController;
}

- (NavTrafficIncidentCoordinator)navTrafficIncidentCoordinator
{
  NavTrafficIncidentCoordinator *navTrafficIncidentCoordinator;
  NavTrafficIncidentCoordinator *v4;
  NavTrafficIncidentCoordinator *v5;

  navTrafficIncidentCoordinator = self->_navTrafficIncidentCoordinator;
  if (!navTrafficIncidentCoordinator)
  {
    v4 = objc_alloc_init(NavTrafficIncidentCoordinator);
    v5 = self->_navTrafficIncidentCoordinator;
    self->_navTrafficIncidentCoordinator = v4;

    -[NavTrafficIncidentCoordinator setPresentationDelegate:](self->_navTrafficIncidentCoordinator, "setPresentationDelegate:", self);
    navTrafficIncidentCoordinator = self->_navTrafficIncidentCoordinator;
  }
  return navTrafficIncidentCoordinator;
}

- (MapViewZoomController)mapViewZoomController
{
  MapViewZoomController *mapViewZoomController;
  MapViewZoomController *v4;
  void *v5;
  MapViewZoomController *v6;
  MapViewZoomController *v7;
  void *v8;
  void *v9;

  mapViewZoomController = self->_mapViewZoomController;
  if (!mapViewZoomController)
  {
    v4 = [MapViewZoomController alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator navigationDisplay](self, "navigationDisplay"));
    v6 = -[MapViewZoomController initWithNavigationDisplay:](v4, "initWithNavigationDisplay:", v5);
    v7 = self->_mapViewZoomController;
    self->_mapViewZoomController = v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "chromeViewController"));
    -[MapViewZoomController setChromeViewController:](self->_mapViewZoomController, "setChromeViewController:", v9);

    -[MapViewZoomController setDelegate:](self->_mapViewZoomController, "setDelegate:", self);
    mapViewZoomController = self->_mapViewZoomController;
  }
  return mapViewZoomController;
}

- (unint64_t)currentMapViewZoom
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator mapViewZoomController](self, "mapViewZoomController"));
  v3 = objc_msgSend(v2, "zoom");

  return (unint64_t)v3;
}

- (MapSelectionManager)mapSelectionManager
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "chromeViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mapSelectionManager"));

  return (MapSelectionManager *)v4;
}

- (void)setCurrentSearchInfo:(id)a3
{
  -[NavActionCoordinator setCurrentSearchInfo:error:](self, "setCurrentSearchInfo:error:", a3, 0);
}

- (void)setCurrentSearchInfo:(id)a3 error:(id)a4
{
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  char IsEnabled_Maps182;
  char v12;
  GuidanceSearchResultsSearchInfoDataProvider *v13;
  GuidanceSearchResultsViewModel *v14;
  void *v15;
  void *v16;
  GuidanceSearchResultsViewModel *v17;
  void *v18;
  int IsEnabled_DrivingMultiWaypointRoutes;
  unsigned int v20;
  GuidanceSearchResultsViewModel *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v25 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v9 = objc_msgSend(v8, "navigationTransportType");
  switch((int)v9)
  {
    case 1:
    case 6:

      goto LABEL_8;
    case 2:
      IsEnabled_Maps182 = MapsFeature_IsEnabled_Maps182(v9);
      goto LABEL_5;
    case 3:
      IsEnabled_Maps182 = MapsFeature_IsEnabled_Maps420(v9);
LABEL_5:
      v12 = IsEnabled_Maps182;

      if ((v12 & 1) != 0)
        goto LABEL_6;
      goto LABEL_8;
    default:
      IsEnabled_DrivingMultiWaypointRoutes = MapsFeature_IsEnabled_DrivingMultiWaypointRoutes(v9, v10);

      if (IsEnabled_DrivingMultiWaypointRoutes)
      {
LABEL_6:
        objc_storeStrong((id *)&self->_currentSearchInfo, a3);
        -[NavActionCoordinator presentSearchAlongTheRouteResults](self, "presentSearchAlongTheRouteResults");
        v13 = -[GuidanceSearchResultsSearchInfoDataProvider initWithSearchInfo:error:]([GuidanceSearchResultsSearchInfoDataProvider alloc], "initWithSearchInfo:error:", v25, v7);
        v14 = [GuidanceSearchResultsViewModel alloc];
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator routeInfoProvider](self, "routeInfoProvider"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator mapItemDisplayer](self, "mapItemDisplayer"));
        v17 = -[GuidanceSearchResultsViewModel initWithDataProvider:navActionCoordinator:routeInfoProvider:mapItemDisplayer:](v14, "initWithDataProvider:navActionCoordinator:routeInfoProvider:mapItemDisplayer:", v13, self, v15, v16);

        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "placeSummaryMetadata"));
        -[GuidanceSearchResultsViewModel setPlaceSummaryMetadata:](v17, "setPlaceSummaryMetadata:", v18);

        -[GuidanceSearchResultsViewController configureWithViewModel:](self->_resultsViewController, "configureWithViewModel:", v17);
      }
      else
      {
LABEL_8:
        v13 = (GuidanceSearchResultsSearchInfoDataProvider *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "results"));
        if (!-[GuidanceSearchResultsSearchInfoDataProvider count](v13, "count"))
          goto LABEL_14;
        v20 = objc_msgSend(v25, "isSearchAlongRoute");

        if (!v20)
          goto LABEL_15;
        v13 = -[GuidanceSearchResultsSearchInfoDataProvider initWithSearchInfo:error:]([GuidanceSearchResultsSearchInfoDataProvider alloc], "initWithSearchInfo:error:", v25, v7);
        v21 = [GuidanceSearchResultsViewModel alloc];
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator routeInfoProvider](self, "routeInfoProvider"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator mapItemDisplayer](self, "mapItemDisplayer"));
        v17 = -[GuidanceSearchResultsViewModel initWithDataProvider:navActionCoordinator:routeInfoProvider:mapItemDisplayer:](v21, "initWithDataProvider:navActionCoordinator:routeInfoProvider:mapItemDisplayer:", v13, self, v22, v23);

        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "placeSummaryMetadata"));
        -[GuidanceSearchResultsViewModel setPlaceSummaryMetadata:](v17, "setPlaceSummaryMetadata:", v24);

        if (objc_msgSend(v25, "selectedIndex") == (id)0x7FFFFFFFFFFFFFFFLL)
          -[NavActionCoordinator presentSearchAlongTheRouteWithViewModel:](self, "presentSearchAlongTheRouteWithViewModel:", v17);
        else
          -[GuidanceSearchResultsViewModel navigateToItemAtIndex:](v17, "navigateToItemAtIndex:", objc_msgSend(v25, "selectedIndex"));
      }

LABEL_14:
LABEL_15:

      return;
  }
}

- (void)handleSearchActionUsingSearchFieldItem:(id)a3 withUserInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  SearchSessionManager *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator searchSessionManager](self, "searchSessionManager"));

  if (!v8)
  {
    v9 = objc_alloc_init(SearchSessionManager);
    -[NavActionCoordinator setSearchSessionManager:](self, "setSearchSessionManager:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "chromeViewController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "appCoordinator"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "baseActionCoordinator"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator searchSessionManager](self, "searchSessionManager"));
    objc_msgSend(v14, "setCoordinator:", v13);

  }
  -[NavActionCoordinator setSearchingAlongTheRoute:](self, "setSearchingAlongTheRoute:", 1);
  v16 = (id)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator searchSessionManager](self, "searchSessionManager"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SearchViewController recentAutocompleteSessionData](self->_searchHomeViewController, "recentAutocompleteSessionData"));
  objc_msgSend(v16, "performSearchForSearchItem:withUserInfo:recentAutocompleteSessionData:", v7, v6, v15);

}

- (void)setDefaultContaineeViewControllerType:(unint64_t)a3
{
  id v3;
  id v4;

  if (self->_defaultContaineeViewControllerType != a3)
  {
    self->_defaultContaineeViewControllerType = a3;
    if (a3)
    {
      if (a3 == 1)
      {
        v3 = (id)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator guidanceObserver](self, "guidanceObserver"));
        objc_msgSend(v3, "pauseUpdates");

      }
    }
    else
    {
      v4 = (id)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator guidanceObserver](self, "guidanceObserver"));
      objc_msgSend(v4, "resumeUpdates");

    }
  }
}

- (NavigationRouteHistoryInfoProviding)routeInfoProvider
{
  NavigationRouteHistoryInfoProviding *routeInfoProvider;
  NavigationRouteHistoryInfoProvider *v4;
  void *v5;
  NavigationRouteHistoryInfoProviding *v6;
  NavigationRouteHistoryInfoProviding *v7;

  routeInfoProvider = self->_routeInfoProvider;
  if (!routeInfoProvider)
  {
    v4 = [NavigationRouteHistoryInfoProvider alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    v6 = -[NavigationRouteHistoryInfoProvider initWithNavigationService:](v4, "initWithNavigationService:", v5);
    v7 = self->_routeInfoProvider;
    self->_routeInfoProvider = v6;

    routeInfoProvider = self->_routeInfoProvider;
  }
  return routeInfoProvider;
}

- (NavigationRouteDetouring)routeDetourer
{
  NavigationRouteDetouring *routeDetourer;
  NavigationRouteInterrupter *v4;
  id v5;
  void *v6;
  NavigationRouteInterrupter *v7;
  NavigationRouteDetourer *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NavigationRouteDetouring *v13;
  NavigationRouteDetouring *v14;

  routeDetourer = self->_routeDetourer;
  if (!routeDetourer)
  {
    v4 = [NavigationRouteInterrupter alloc];
    v5 = sub_100B3A5D4();
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = -[NavigationRouteInterrupter initWithSuggestionsEngine:delegate:](v4, "initWithSuggestionsEngine:delegate:", v6, 0);

    v8 = [NavigationRouteDetourer alloc];
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator appCoordinator](self, "appCoordinator"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "platformController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator routeInfoProvider](self, "routeInfoProvider"));
    v13 = -[NavigationRouteDetourer initWithNavigationService:platformController:routeInfoProvider:routeInterrupter:](v8, "initWithNavigationService:platformController:routeInfoProvider:routeInterrupter:", v9, v11, v12, v7);
    v14 = self->_routeDetourer;
    self->_routeDetourer = v13;

    routeDetourer = self->_routeDetourer;
  }
  return routeDetourer;
}

- (unint64_t)navigationCameraHeadingOverride
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator navigationDisplay](self, "navigationDisplay"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "cameraController"));
  v4 = objc_msgSend(v3, "navigationCameraHeadingOverride");

  return (unint64_t)v4;
}

- (double)mapViewYaw
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator navigationDisplay](self, "navigationDisplay"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "mapView"));
  objc_msgSend(v3, "presentationYaw");
  v5 = v4;

  return v5;
}

- (int64_t)excludedContentForMapItem:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "_geoMapItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "detourInfo"));

  if (v4)
    return 14699;
  else
    return 14714;
}

- (PlaceCardViewController)placecardViewController
{
  PlaceCardViewController *placecardViewController;
  PlaceCardViewController *v4;
  PlaceCardViewController *v5;

  placecardViewController = self->_placecardViewController;
  if (!placecardViewController)
  {
    v4 = -[PlaceCardViewController initWithVisualEffectDisabled:]([PlaceCardViewController alloc], "initWithVisualEffectDisabled:", 1);
    v5 = self->_placecardViewController;
    self->_placecardViewController = v4;

    -[PlaceCardViewController setPlaceCardDelegate:](self->_placecardViewController, "setPlaceCardDelegate:", self);
    -[InfoCardViewController setContaineeDelegate:](self->_placecardViewController, "setContaineeDelegate:", self);
    -[PlaceCardViewController setIsPresentedInSearchAlongTheRoute:](self->_placecardViewController, "setIsPresentedInSearchAlongTheRoute:", 1);
    placecardViewController = self->_placecardViewController;
  }
  return placecardViewController;
}

- (SimpleResultsViewController)simpleResultsViewController
{
  SimpleResultsViewController *simpleResultsViewController;
  SimpleResultsViewController *v4;
  void *v5;
  SimpleResultsViewController *v6;
  SimpleResultsViewController *v7;

  simpleResultsViewController = self->_simpleResultsViewController;
  if (!simpleResultsViewController)
  {
    v4 = [SimpleResultsViewController alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator appCoordinator](self, "appCoordinator"));
    v6 = -[SimpleResultsViewController initWithShareDelegate:visualEffectDisabled:](v4, "initWithShareDelegate:visualEffectDisabled:", v5, 1);
    v7 = self->_simpleResultsViewController;
    self->_simpleResultsViewController = v6;

    -[SimpleResultsViewController setResultsDelegate:](self->_simpleResultsViewController, "setResultsDelegate:", self);
    -[ContaineeViewController setContaineeDelegate:](self->_simpleResultsViewController, "setContaineeDelegate:", self);
    -[SimpleResultsViewController setIsPresentingSearchAlongTheRouteResults:](self->_simpleResultsViewController, "setIsPresentingSearchAlongTheRouteResults:", 1);
    -[SimpleResultsViewController setSearchAlongTheRouteCellDelegate:](self->_simpleResultsViewController, "setSearchAlongTheRouteCellDelegate:", self);
    simpleResultsViewController = self->_simpleResultsViewController;
  }
  return simpleResultsViewController;
}

- (NavTrafficIncidentContaineeViewController)trafficIncidentViewController
{
  NavTrafficIncidentContaineeViewController *trafficIncidentViewController;
  NavTrafficIncidentContaineeViewController *v4;
  NavTrafficIncidentContaineeViewController *v5;
  _QWORD v7[4];
  id v8;
  id location;

  trafficIncidentViewController = self->_trafficIncidentViewController;
  if (!trafficIncidentViewController)
  {
    v4 = objc_alloc_init(NavTrafficIncidentContaineeViewController);
    v5 = self->_trafficIncidentViewController;
    self->_trafficIncidentViewController = v4;

    -[ContaineeViewController setContaineeDelegate:](self->_trafficIncidentViewController, "setContaineeDelegate:", self);
    objc_initWeak(&location, self);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100C22F90;
    v7[3] = &unk_1011AD260;
    objc_copyWeak(&v8, &location);
    -[NavTrafficIncidentContaineeViewController setDismissHandler:](self->_trafficIncidentViewController, "setDismissHandler:", v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
    trafficIncidentViewController = self->_trafficIncidentViewController;
  }
  return trafficIncidentViewController;
}

- (RouteAnnotationContaineeViewController)routeAnnotationViewController
{
  RouteAnnotationContaineeViewController *routeAnnotationViewController;
  RouteAnnotationContaineeViewController *v4;
  RouteAnnotationContaineeViewController *v5;
  _QWORD v7[4];
  id v8;
  id location;

  routeAnnotationViewController = self->_routeAnnotationViewController;
  if (!routeAnnotationViewController)
  {
    v4 = objc_alloc_init(RouteAnnotationContaineeViewController);
    v5 = self->_routeAnnotationViewController;
    self->_routeAnnotationViewController = v4;

    -[ContaineeViewController setContaineeDelegate:](self->_routeAnnotationViewController, "setContaineeDelegate:", self);
    objc_initWeak(&location, self);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100C230C0;
    v7[3] = &unk_1011AD260;
    objc_copyWeak(&v8, &location);
    -[RouteAnnotationContaineeViewController setDismissHandler:](self->_routeAnnotationViewController, "setDismissHandler:", v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
    routeAnnotationViewController = self->_routeAnnotationViewController;
  }
  return routeAnnotationViewController;
}

- (void)presentTray
{
  -[NavActionCoordinator _presentTrayWithDefaultLayout:animated:](self, "_presentTrayWithDefaultLayout:animated:", 0, -[ContainerViewController delaysFirstCardPresentation]_0());
}

- (void)_presentTrayWithDefaultLayout:(BOOL)a3 animated:(BOOL)a4
{
  NavActionCoordinator *v6;
  _QWORD *v7;
  void *v8;
  _QWORD v9[5];
  BOOL v10;
  BOOL v11;

  v6 = self;
  -[NavActionCoordinator setSearchingAlongTheRoute:](self, "setSearchingAlongTheRoute:", 0);
  -[NavActionCoordinator setDisplayingTrafficIncident:](v6, "setDisplayingTrafficIncident:", 0);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100C23218;
  v9[3] = &unk_1011BF3D8;
  v9[4] = v6;
  v10 = a4;
  v11 = a3;
  v7 = objc_retainBlock(v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  LODWORD(v6) = objc_msgSend(v8, "screenIsLocked");

  if ((_DWORD)v6)
    +[UIViewController _performWithoutDeferringTransitions:](UIViewController, "_performWithoutDeferringTransitions:", v7);
  else
    ((void (*)(_QWORD *))v7[2])(v7);

}

- (SearchViewController)searchHomeViewController
{
  SearchViewController *searchHomeViewController;
  SearchViewController *v4;
  SearchViewController *v5;
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
  id v16;
  uint64_t v18;
  void *v19;

  searchHomeViewController = self->_searchHomeViewController;
  if (!searchHomeViewController)
  {
    v4 = -[SearchViewController initWithSearchAlongRoute:]([SearchViewController alloc], "initWithSearchAlongRoute:", 1);
    v5 = self->_searchHomeViewController;
    self->_searchHomeViewController = v4;

    -[SearchViewController setNavContaineeDelegate:](self->_searchHomeViewController, "setNavContaineeDelegate:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "chromeViewController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "appCoordinator"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "baseActionCoordinator"));
    -[ControlContaineeViewController setDelegate:](self->_searchHomeViewController, "setDelegate:", v9);

    -[SearchViewController setSearchingAlongTheRoute:](self->_searchHomeViewController, "setSearchingAlongTheRoute:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "chromeViewController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "personalizedItemManager"));
    -[SearchViewController setPersonalizedItemManager:](self->_searchHomeViewController, "setPersonalizedItemManager:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "chromeViewController"));

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "traitCollection"));
    v16 = objc_msgSend(v15, "horizontalSizeClass");

    if (sub_1002A8AA0(v14) == 1 && v16 == (id)2)
      v18 = 3;
    else
      v18 = 0;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self->_searchHomeViewController, "cardPresentationController"));
    objc_msgSend(v19, "setDefaultContaineeLayout:", v18);

    searchHomeViewController = self->_searchHomeViewController;
  }
  return searchHomeViewController;
}

- (void)dismissAddStop
{
  -[NavActionCoordinator dismissAddStopAnimated:](self, "dismissAddStopAnimated:", 0);
}

- (void)dismissAddStopAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  char isKindOfClass;
  void *v11;
  uint8_t v12[16];

  v3 = a3;
  v5 = sub_100431C0C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Dismiss SAR category list", v12, 2u);
  }

  -[NavActionCoordinator setSearchingAlongTheRoute:](self, "setSearchingAlongTheRoute:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentViewController"));
  v9 = objc_opt_class(NavCategoryListViewController);
  isKindOfClass = objc_opt_isKindOfClass(v8, v9);

  if ((isKindOfClass & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
    objc_msgSend(v11, "popLastViewControllerAnimated:", v3);

  }
}

- (void)dismissReportAnIncident
{
  -[NavActionCoordinator dismissReportAnIncidentAnimated:](self, "dismissReportAnIncidentAnimated:", 0);
}

- (void)dismissReportAnIncidentAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  char isKindOfClass;
  void *v11;
  uint8_t v12[16];

  v3 = a3;
  v5 = sub_100431C0C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Dismiss Report an Incident", v12, 2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentViewController"));
  v9 = objc_opt_class(NavTrafficIncidentReportingContaineeViewController);
  isKindOfClass = objc_opt_isKindOfClass(v8, v9);

  if ((isKindOfClass & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
    objc_msgSend(v11, "popLastViewControllerAnimated:", v3);

  }
}

- (void)presentPlacecardViewController
{
  void *v3;
  void *v4;
  void *v5;
  id WeakRetained;
  void *v7;
  uint64_t v8;
  char isKindOfClass;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  _QWORD v22[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator placecardViewController](self, "placecardViewController"));

  if (v4 == v5)
  {
    v21 = (id)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator placecardViewController](self, "placecardViewController"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "cardPresentationController"));
    objc_msgSend(v18, "wantsLayout:", 2);

  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "currentViewController"));
    v8 = objc_opt_class(SimpleResultsViewController);
    isKindOfClass = objc_opt_isKindOfClass(v7, v8);

    v10 = objc_loadWeakRetained((id *)&self->_containerViewController);
    v11 = v10;
    if ((isKindOfClass & 1) != 0)
    {
      v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "currentViewController"));

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator placecardViewController](self, "placecardViewController"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "placeCardItem"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "mapItem"));
      v15 = objc_msgSend(v20, "containsMapItem:", v14);

      v16 = objc_loadWeakRetained((id *)&self->_containerViewController);
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator placecardViewController](self, "placecardViewController"));
      if (v15)
      {
        objc_msgSend(v16, "presentController:", v17);
      }
      else
      {
        objc_msgSend(v16, "replaceCurrentWithController:", v17);

        v16 = (id)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator placecardViewController](self, "placecardViewController"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "cardPresentationController"));
        objc_msgSend(v17, "wantsLayout:", 2);
      }

    }
    else
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator placecardViewController](self, "placecardViewController"));
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_100C237E4;
      v22[3] = &unk_1011AE8F8;
      v22[4] = self;
      objc_msgSend(v11, "presentController:animated:completion:", v19, 1, v22);

    }
  }
}

- (void)presentSimpleResultsViewController
{
  void *v3;
  void *v4;
  void *v5;
  id WeakRetained;
  void *v7;
  uint64_t v8;
  char isKindOfClass;
  void *v10;
  id v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator simpleResultsViewController](self, "simpleResultsViewController"));

  if (v4 != v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "currentViewController"));
    v8 = objc_opt_class(PlaceCardViewController);
    isKindOfClass = objc_opt_isKindOfClass(v7, v8);

    v11 = objc_loadWeakRetained((id *)&self->_containerViewController);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator simpleResultsViewController](self, "simpleResultsViewController"));
    if ((isKindOfClass & 1) == 0)
    {
      objc_msgSend(v11, "presentController:", v10);
      goto LABEL_6;
    }
    objc_msgSend(v11, "replaceCurrentWithController:", v10);

  }
  v11 = (id)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator simpleResultsViewController](self, "simpleResultsViewController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "cardPresentationController"));
  objc_msgSend(v10, "wantsLayout:", 2);
LABEL_6:

}

- (void)sendOtherEVStationsRequest:(unint64_t)a3
{
  void *v5;
  void *v6;
  SearchFieldItem *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id WeakRetained;
  id v13;
  id v14;
  uint8_t v15[8];
  _QWORD v16[3];
  _QWORD v17[3];

  -[NavActionCoordinator setSearchingAlongTheRoute:](self, "setSearchingAlongTheRoute:", 1);
  v17[0] = &__kCFBooleanTrue;
  v16[0] = CFSTR("SearchAlongRoute");
  v16[1] = CFSTR("SARImplicitRequestMUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  v16[2] = CFSTR("SAROtherEVStationRequest");
  v17[1] = v5;
  v17[2] = &__kCFBooleanTrue;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v17, v16, 3));

  v7 = objc_alloc_init(SearchFieldItem);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator appCoordinator](self, "appCoordinator"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "baseActionCoordinator"));

  if (v9)
  {
    v10 = objc_claimAutoreleasedReturnValue(-[NavActionCoordinator appCoordinator](self, "appCoordinator"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject baseActionCoordinator](v10, "baseActionCoordinator"));
    WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
    v13 = objc_msgSend(v6, "copy");
    objc_msgSend(v11, "viewController:doSearchItem:withUserInfo:", WeakRetained, v7, v13);

  }
  else
  {
    v14 = sub_100431C0C();
    v10 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "The action coordinator is nil.", v15, 2u);
    }
  }

}

- (void)presentAddStopUsingCategories:(id)a3
{
  id v3;
  _QWORD *v4;
  _QWORD v5[4];
  _QWORD *v6;
  char v7;
  _QWORD v8[5];
  id v9;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100C23BF8;
  v8[3] = &unk_1011AC8B0;
  v8[4] = self;
  v3 = a3;
  v9 = v3;
  v4 = objc_retainBlock(v8);
  v7 = 0;
  if (SBSGetScreenLockStatus(&v7) && v7)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100C23E2C;
    v5[3] = &unk_1011AE218;
    v6 = v4;
    +[UIApplication _maps_unlockApplicationWithCompletion:](UIApplication, "_maps_unlockApplicationWithCompletion:", v5);

  }
  else
  {
    ((void (*)(_QWORD *))v4[2])(v4);
  }

}

- (void)presentSearchAlongTheRouteWithViewModel:(id)a3
{
  GuidanceSearchResultsViewController *resultsViewController;
  GuidanceSearchResultsViewController *v5;
  GuidanceSearchResultsViewController *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[NavActionCoordinator setSearchingAlongTheRoute:](self, "setSearchingAlongTheRoute:", 1);
  resultsViewController = self->_resultsViewController;
  if (resultsViewController)
  {
    -[GuidanceSearchResultsViewController configureWithViewModel:](resultsViewController, "configureWithViewModel:", v8);
  }
  else
  {
    v5 = -[GuidanceSearchResultsViewController initWithViewModel:]([GuidanceSearchResultsViewController alloc], "initWithViewModel:", v8);
    v6 = self->_resultsViewController;
    self->_resultsViewController = v5;

    -[GuidanceSearchResultsViewController setNavContaineeDelegate:](self->_resultsViewController, "setNavContaineeDelegate:", self);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
  objc_msgSend(v7, "presentController:", self->_resultsViewController);

}

- (void)presentSearchAlongTheRouteResults
{
  void *v3;
  void *v4;
  uint64_t v5;
  char isKindOfClass;
  id v7;
  NSObject *v8;
  GuidanceSearchResultsViewController *v9;
  GuidanceSearchResultsViewController *resultsViewController;
  id v11;
  uint8_t buf[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentViewController"));
  v5 = objc_opt_class(GuidanceSearchResultsViewController);
  isKindOfClass = objc_opt_isKindOfClass(v4, v5);

  if ((isKindOfClass & 1) == 0)
  {
    if (+[UIApplication _maps_isAnyCarPlayApplicationSceneForeground](UIApplication, "_maps_isAnyCarPlayApplicationSceneForeground"))
    {
      v7 = sub_100431C0C();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Cannot show SAR results when carplay scene is foregrounded.", buf, 2u);
      }

    }
    else
    {
      -[NavActionCoordinator setSearchingAlongTheRoute:](self, "setSearchingAlongTheRoute:", 1);
      v9 = objc_alloc_init(GuidanceSearchResultsViewController);
      resultsViewController = self->_resultsViewController;
      self->_resultsViewController = v9;

      -[GuidanceSearchResultsViewController setNavContaineeDelegate:](self->_resultsViewController, "setNavContaineeDelegate:", self);
      v11 = (id)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
      objc_msgSend(v11, "presentController:", self->_resultsViewController);

    }
  }
}

- (void)resetMapViewZoomToDefaultAndStartCameraTracking:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator mapViewZoomController](self, "mapViewZoomController"));
  objc_msgSend(v5, "setZoomTo:startCameraTracking:", -[NavActionCoordinator defaultMapViewZoom](self, "defaultMapViewZoom"), v3);

}

- (BOOL)isPedestrianARActive
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  char isKindOfClass;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator appCoordinator](self, "appCoordinator"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "chromeViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topContext"));
  v5 = objc_opt_class(PedestrianARContext);
  isKindOfClass = objc_opt_isKindOfClass(v4, v5);

  return isKindOfClass & 1;
}

- (BOOL)isPedestrianARShowingFailureView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  unsigned __int8 v10;

  if (!-[NavActionCoordinator isPedestrianARActive](self, "isPedestrianARActive"))
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator appCoordinator](self, "appCoordinator"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "chromeViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topContext"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fullscreenViewController"));

  v7 = objc_opt_class(PedestrianARViewController);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    v8 = v6;
  else
    v8 = 0;
  v9 = v8;

  if (v9)
    v10 = objc_msgSend(v9, "isShowingFailureView");
  else
    v10 = 0;

  return v10;
}

- (BOOL)canEnterPedestrianAR
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  BOOL v8;
  id v9;
  const char *v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  int v16;
  void *v17;

  if (!+[PedestrianARSessionTask isPedestrianARModeSupported](PedestrianARSessionTask, "isPedestrianARModeSupported"))
  {
    v9 = sub_100431C0C();
    v7 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LOWORD(v16) = 0;
      v10 = "Cannot enter pedestrian AR because it's not supported on the current device";
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, v10, (uint8_t *)&v16, 2u);
    }
LABEL_13:
    v8 = 0;
    goto LABEL_14;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "route"));

  if (!v4)
  {
    v11 = sub_100431C0C();
    v7 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LOWORD(v16) = 0;
      v10 = "Cannot enter pedestrian AR without a route";
      goto LABEL_9;
    }
    goto LABEL_13;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator appCoordinator](self, "appCoordinator"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "platformController"));
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pedestrianARSessionStateManager"));

  if ((-[NSObject shouldShowPedestrianAR](v7, "shouldShowPedestrianAR") & 1) == 0)
  {
    v12 = sub_100431C0C();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject debugDescription](v7, "debugDescription"));
      v16 = 138412290;
      v17 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Cannot enter pedestrian AR for state manager: %@", (uint8_t *)&v16, 0xCu);

    }
    goto LABEL_13;
  }
  v8 = 1;
LABEL_14:

  return v8;
}

- (void)enterPedestrianAR
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  NSObject *v22;
  NavActionCoordinator *v23;
  NavActionCoordinator *v24;
  objc_class *v25;
  NSString *v26;
  void *v27;
  void *v28;
  void *v29;
  __CFString *v30;
  id v31;
  NSObject *v32;
  NavActionCoordinator *v33;
  NavActionCoordinator *v34;
  objc_class *v35;
  NSString *v36;
  void *v37;
  void *v38;
  void *v39;
  __CFString *v40;
  id v41;
  NavActionCoordinator *v42;
  NavActionCoordinator *v43;
  objc_class *v44;
  NSString *v45;
  void *v46;
  void *v47;
  void *v48;
  __CFString *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  _QWORD v54[4];
  id v55;
  id location;
  uint8_t buf[4];
  __CFString *v58;

  v3 = sub_100431C0C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Will enter pedestrian AR from navigation", buf, 2u);
  }

  if (!-[NavActionCoordinator canEnterPedestrianAR](self, "canEnterPedestrianAR"))
  {
    v31 = sub_100431C0C();
    v32 = objc_claimAutoreleasedReturnValue(v31);
    if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
LABEL_30:

      return;
    }
    v33 = self;
    v34 = v33;
    if (!v33)
    {
      v40 = CFSTR("<nil>");
      goto LABEL_29;
    }
    v35 = (objc_class *)objc_opt_class(v33);
    v36 = NSStringFromClass(v35);
    v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
    if ((objc_opt_respondsToSelector(v34, "accessibilityIdentifier") & 1) != 0)
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator performSelector:](v34, "performSelector:", "accessibilityIdentifier"));
      v39 = v38;
      if (v38 && !objc_msgSend(v38, "isEqualToString:", v37))
      {
        v40 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v37, v34, v39));

        goto LABEL_27;
      }

    }
    v40 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v37, v34));
LABEL_27:

LABEL_29:
    *(_DWORD *)buf = 138543362;
    v58 = v40;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "[%{public}@] Cannot enter pedestrian AR at the moment", buf, 0xCu);

    goto LABEL_30;
  }
  objc_initWeak(&location, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "chromeViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "appCoordinator"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "baseActionCoordinator"));
  v54[0] = _NSConcreteStackBlock;
  v54[1] = 3221225472;
  v54[2] = sub_100C249E0;
  v54[3] = &unk_1011AD4F0;
  objc_copyWeak(&v55, &location);
  v10 = objc_msgSend(v5, "showVLFCrowdsourcingPermissionCardWithContaineeDelegate:delegate:completion:", self, v9, v54);

  if ((v10 & 1) == 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "currentViewController"));

    v13 = objc_opt_class(PedestrianARFeatureIntroTeachableMomentContaineeViewController);
    if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
      v14 = v12;
    else
      v14 = 0;
    v15 = v14;

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "currentViewController"));

    v18 = objc_opt_class(PedestrianARRaiseToEnterTeachableMomentContaineeViewController);
    if ((objc_opt_isKindOfClass(v17, v18) & 1) != 0)
      v19 = v17;
    else
      v19 = 0;
    v20 = v19;

    if (v15)
    {
      v21 = sub_100431C0C();
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
LABEL_46:

        -[NavActionCoordinator containeeViewControllerGoToPreviousState:withSender:](self, "containeeViewControllerGoToPreviousState:withSender:", v12, 0);
        goto LABEL_47;
      }
      v23 = self;
      v24 = v23;
      if (!v23)
      {
        v30 = CFSTR("<nil>");
        goto LABEL_41;
      }
      v25 = (objc_class *)objc_opt_class(v23);
      v26 = NSStringFromClass(v25);
      v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
      if ((objc_opt_respondsToSelector(v24, "accessibilityIdentifier") & 1) != 0)
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator performSelector:](v24, "performSelector:", "accessibilityIdentifier"));
        v29 = v28;
        if (v28 && (objc_msgSend(v28, "isEqualToString:", v27) & 1) == 0)
        {
          v30 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v27, v24, v29));

          goto LABEL_19;
        }

      }
      v30 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v27, v24));
LABEL_19:

LABEL_41:
      *(_DWORD *)buf = 138543362;
      v58 = v30;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "[%{public}@] Feature intro teachable moment card is active; dismissing it before entering AR",
        buf,
        0xCu);

      goto LABEL_46;
    }
    if (!v20)
    {
LABEL_47:
      v50 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator appCoordinator](self, "appCoordinator"));
      v51 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
      v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "route"));
      v53 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator guidanceObserver](self, "guidanceObserver"));
      objc_msgSend(v50, "enterPedestrianARWithRoute:guidanceObserver:", v52, v53);

      goto LABEL_48;
    }
    v41 = sub_100431C0C();
    v22 = objc_claimAutoreleasedReturnValue(v41);
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
LABEL_45:
      v12 = v17;
      goto LABEL_46;
    }
    v42 = self;
    v43 = v42;
    if (!v42)
    {
      v49 = CFSTR("<nil>");
      goto LABEL_44;
    }
    v44 = (objc_class *)objc_opt_class(v42);
    v45 = NSStringFromClass(v44);
    v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
    if ((objc_opt_respondsToSelector(v43, "accessibilityIdentifier") & 1) != 0)
    {
      v47 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator performSelector:](v43, "performSelector:", "accessibilityIdentifier"));
      v48 = v47;
      if (v47 && (objc_msgSend(v47, "isEqualToString:", v46) & 1) == 0)
      {
        v49 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v46, v43, v48));

        goto LABEL_39;
      }

    }
    v49 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v46, v43));
LABEL_39:

LABEL_44:
    *(_DWORD *)buf = 138543362;
    v58 = v49;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "[%{public}@] Raise to enter teachable moment card is active; dismissing it before entering AR",
      buf,
      0xCu);

    goto LABEL_45;
  }
LABEL_48:
  objc_destroyWeak(&v55);
  objc_destroyWeak(&location);
}

- (void)exitPedestrianAR
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator appCoordinator](self, "appCoordinator"));
  objc_msgSend(v2, "exitPedestrianAR");

}

- (BOOL)isTeachableMomentCardActive
{
  void *v2;
  void *v3;
  uint64_t v4;
  char isKindOfClass;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentViewController"));
  v4 = objc_opt_class(PedestrianARFeatureIntroTeachableMomentContaineeViewController);
  isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  return isKindOfClass & 1;
}

- (BOOL)isWeatherPopoverActive
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  char isKindOfClass;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_maps_mapsSceneDelegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topMostPresentedViewController"));
  v5 = objc_opt_class(WUWeatherPlatterViewController);
  isKindOfClass = objc_opt_isKindOfClass(v4, v5);

  return isKindOfClass & 1;
}

- (void)showPedestrianARFeatureIntroTeachableMomentCard
{
  void *v3;
  void *v4;
  uint64_t v5;
  char isKindOfClass;
  id v7;
  NSObject *v8;
  void *v9;
  PedestrianARFeatureIntroTeachableMomentContaineeViewController *v10;
  uint8_t buf[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentViewController"));
  v5 = objc_opt_class(PedestrianARFeatureIntroTeachableMomentContaineeViewController);
  isKindOfClass = objc_opt_isKindOfClass(v4, v5);

  if ((isKindOfClass & 1) != 0)
  {
    v7 = sub_100431C0C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "The Pedestrian AR feature intro teachable moment card is already visible; can't show twice",
        buf,
        2u);
    }

  }
  else
  {
    v10 = -[PedestrianARFeatureIntroTeachableMomentContaineeViewController initWithCoordinator:]([PedestrianARFeatureIntroTeachableMomentContaineeViewController alloc], "initWithCoordinator:", self);
    -[ContaineeViewController setContaineeDelegate:](v10, "setContaineeDelegate:", self);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
    objc_msgSend(v9, "presentController:animated:", v10, 1);

  }
}

- (void)showPedestrianARRaiseToEnterTeachableMomentCard
{
  void *v3;
  void *v4;
  uint64_t v5;
  char isKindOfClass;
  id v7;
  NSObject *v8;
  void *v9;
  PedestrianARRaiseToEnterTeachableMomentContaineeViewController *v10;
  uint8_t buf[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentViewController"));
  v5 = objc_opt_class(PedestrianARRaiseToEnterTeachableMomentContaineeViewController);
  isKindOfClass = objc_opt_isKindOfClass(v4, v5);

  if ((isKindOfClass & 1) != 0)
  {
    v7 = sub_100431C0C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "The Pedestrian AR raise to enter teachable moment card is already visible; can't show twice",
        buf,
        2u);
    }

  }
  else
  {
    v10 = objc_alloc_init(PedestrianARRaiseToEnterTeachableMomentContaineeViewController);
    -[ContaineeViewController setContaineeDelegate:](v10, "setContaineeDelegate:", self);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
    objc_msgSend(v9, "presentController:animated:", v10, 1);

  }
}

- (void)dismissPedestrianARTeachableMomentCardIfNecessary
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  char isKindOfClass;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentViewController"));
  v5 = objc_opt_class(PedestrianARFeatureIntroTeachableMomentContaineeViewController);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {

  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentViewController"));
    v8 = objc_opt_class(PedestrianARRaiseToEnterTeachableMomentContaineeViewController);
    isKindOfClass = objc_opt_isKindOfClass(v7, v8);

    if ((isKindOfClass & 1) == 0)
      return;
  }
  v10 = sub_100431C0C();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "currentViewController"));
    v17 = 138412290;
    v18 = v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Dismissing Pedestrian AR teachable moment card: %@", (uint8_t *)&v17, 0xCu);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "currentViewController"));
  objc_msgSend(v14, "removeControllerFromStack:", v16);

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
  void *v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  VLFContaineeViewController *v18;
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentViewController"));
  v5 = objc_opt_class(VLFContaineeViewController);
  isKindOfClass = objc_opt_isKindOfClass(v4, v5);

  if ((isKindOfClass & 1) != 0)
  {
    v20 = (id)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "currentViewController"));
    objc_msgSend(v7, "handleVLFPuckTapped");

  }
  else
  {
    objc_initWeak(&location, self);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "chromeViewController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "appCoordinator"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "baseActionCoordinator"));
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100C2548C;
    v21[3] = &unk_1011AD4F0;
    objc_copyWeak(&v22, &location);
    v13 = objc_msgSend(v8, "showVLFCrowdsourcingPermissionCardWithContaineeDelegate:delegate:completion:", self, v12, v21);

    if ((v13 & 1) == 0)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "chromeViewController"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "userLocationView"));

      if ((objc_msgSend(v16, "isVLFBannerVisible") & 1) != 0)
        v17 = 2;
      else
        v17 = objc_msgSend(v16, "isVLFPuckVisible");
      v18 = -[VLFContaineeViewController initWithEntryPoint:]([VLFContaineeViewController alloc], "initWithEntryPoint:", v17);
      -[ContaineeViewController setContaineeDelegate:](v18, "setContaineeDelegate:", self);
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
      objc_msgSend(v19, "presentController:", v18);

    }
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
}

- (void)directionsStepsList:(id)a3 didTapRowForRouteStep:(id)a4
{
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  char isKindOfClass;
  void *v12;
  id v13;

  v13 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
  v6 = objc_msgSend(v5, "isForWalkingNav");

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
    objc_msgSend(v7, "showSignForStep:", v13);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentViewController"));
    v10 = objc_opt_class(ModalContaineeViewController);
    isKindOfClass = objc_opt_isKindOfClass(v9, v10);

    if ((isKindOfClass & 1) != 0)
    {
      -[NavActionCoordinator dismissModalContainee](self, "dismissModalContainee");
      -[NavActionCoordinator dismissTray](self, "dismissTray");
    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
      objc_msgSend(v12, "setLayoutIfSupported:animated:", 1, 1);

    }
  }

}

- (void)pressedShowDirectionsListWithSender:(id)a3
{
  -[NavActionCoordinator senderOpenListStep:fullscreen:](self, "senderOpenListStep:fullscreen:", a3, 0);
}

- (void)senderOpenListStep:(id)a3 fullscreen:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  unsigned int v8;
  BOOL v9;
  uint64_t v10;
  void *v11;
  _BOOL8 v12;
  RouteStepListViewController *v13;
  ModalContaineeViewController *v14;
  void *v15;
  _BOOL8 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id *v23;
  id WeakRetained;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  id location;
  _QWORD v30[4];
  BOOL v31;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v8 = objc_msgSend(v7, "navigationTransportType");

  v9 = v8 == 2;
  if (v8 == 2)
    v10 = objc_claimAutoreleasedReturnValue(+[RouteStepListMetrics routePlanningMetrics](RouteStepListMetrics, "routePlanningMetrics"));
  else
    v10 = objc_claimAutoreleasedReturnValue(+[RouteStepListMetrics navigationMetrics](RouteStepListMetrics, "navigationMetrics"));
  v11 = (void *)v10;
  v12 = v8 == 2;
  v13 = -[RouteStepListViewController initWithOptions:metrics:]([RouteStepListViewController alloc], "initWithOptions:metrics:", 23, v10);
  -[RouteStepListViewController setDelegate:](v13, "setDelegate:", self);
  -[RouteStepListViewController setDisplayRouteFromNavigationService:](v13, "setDisplayRouteFromNavigationService:", 1);
  -[RouteStepListViewController setAllowsSelection:](v13, "setAllowsSelection:", v12);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100C25C38;
  v30[3] = &unk_1011E9680;
  v31 = v9;
  v14 = -[ModalContaineeViewController initWithChildViewController:visualEffectDisabled:fullScreen:headerViewConfigurationProvider:]([ModalContaineeViewController alloc], "initWithChildViewController:visualEffectDisabled:fullScreen:headerViewConfigurationProvider:", v13, 1, 1, v30);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ModalContaineeViewController headerView](v14, "headerView"));
  v16 = -[RouteStepListViewController showsHairline](v13, "showsHairline");
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "bottomHairline"));
  objc_msgSend(v17, "setHidden:", v16);

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("Directions_Navigation"), CFSTR("localized string not found"), 0));
  objc_msgSend(v15, "setTitle:", v19);

  objc_initWeak(&location, self);
  if (v4)
  {
    -[ContaineeViewController setKeepOriginalSafeInsets:](v14, "setKeepOriginalSafeInsets:", 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "trailingButton"));
    v21 = sub_1009A9980();
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    objc_msgSend(v20, "setTitle:forState:", v22, 0);

    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100C25C94;
    v27[3] = &unk_1011AD260;
    v23 = &v28;
    objc_copyWeak(&v28, &location);
    -[ModalContaineeViewController setBlockAlongDismissContainee:](v14, "setBlockAlongDismissContainee:", v27);
  }
  else
  {
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100C25CD4;
    v25[3] = &unk_1011AD260;
    v23 = &v26;
    objc_copyWeak(&v26, &location);
    -[ModalContaineeViewController setBlockAlongDismissContainee:](v14, "setBlockAlongDismissContainee:", v25);
  }
  objc_destroyWeak(v23);
  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  objc_msgSend(WeakRetained, "presentController:", v14);

  objc_destroyWeak(&location);
}

- (void)pressedEndWithSender:(id)a3
{
  -[NavActionCoordinator pressedEndWithSender:feedback:](self, "pressedEndWithSender:feedback:", a3, 0);
}

- (void)pressedEndWithSender:(id)a3 feedback:(unint64_t)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id WeakRetained;
  _QWORD v11[4];
  id v12;
  id buf[2];

  v6 = a3;
  v7 = sub_100431C0C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "User pressed end", (uint8_t *)buf, 2u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
  objc_msgSend(v9, "willDismissNavigationAnimated:", 1);

  -[NavActionCoordinator _willDismissNavMode](self, "_willDismissNavMode");
  if (a4 >= 2)
  {
    if (a4 == 2)
    {
      objc_initWeak(buf, self);
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_100C25E88;
      v11[3] = &unk_1011E0558;
      objc_copyWeak(&v12, buf);
      +[UIApplication _maps_unlockApplicationWithCompletion:](UIApplication, "_maps_unlockApplicationWithCompletion:", v11);
      objc_destroyWeak(&v12);
      objc_destroyWeak(buf);
    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_appCoordinator);
    objc_msgSend(WeakRetained, "endNavigationAndReturnToRoutePlanning:", 0);

  }
}

- (BOOL)canPresentRapFeedbackView
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator rapNavigationTracker](self, "rapNavigationTracker"));
  v3 = objc_msgSend(v2, "canPresentRapFeedbackView");

  return v3;
}

- (void)_willDismissNavMode
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator mapViewZoomController](self, "mapViewZoomController"));
  objc_msgSend(v3, "setZoomTo:", -[NavActionCoordinator defaultMapViewZoom](self, "defaultMapViewZoom"));

  v4 = (id)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator mapViewZoomController](self, "mapViewZoomController"));
  objc_msgSend(v4, "updateCameraForTraits:containerStyle:", 0, 0);

}

- (void)pauseNavigation
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  v3 = sub_100431C0C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "User pressed pause", v7, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  objc_msgSend(v5, "stopNavigationWithReason:", 3);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
  objc_msgSend(v6, "willDismissNavigationAnimated:", 1);

}

- (void)resumeNavigation
{
  id v2;
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  v2 = sub_100431C0C();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "User pressed resume", v5, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  objc_msgSend(v4, "advanceToNextLeg");

}

- (void)viewController:(id)a3 doSearchItem:(id)a4 withUserInfo:(id)a5
{
  id v6;
  GuidanceSearchResultsCategoryDataProvider *v7;
  void *v8;
  void *v9;
  void *v10;
  GuidanceSearchResultsViewModel *v11;
  void *v12;
  void *v13;
  GuidanceSearchResultsViewModel *v14;
  GuidanceSearchResultsCategoryDataProvider *v15;

  v6 = a4;
  v7 = [GuidanceSearchResultsCategoryDataProvider alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "chromeViewController"));
  v15 = -[GuidanceSearchResultsCategoryDataProvider initWithSearchItem:mapService:chromeViewController:](v7, "initWithSearchItem:mapService:chromeViewController:", v6, v8, v10);

  v11 = [GuidanceSearchResultsViewModel alloc];
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator routeInfoProvider](self, "routeInfoProvider"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator mapItemDisplayer](self, "mapItemDisplayer"));
  v14 = -[GuidanceSearchResultsViewModel initWithDataProvider:navActionCoordinator:routeInfoProvider:mapItemDisplayer:](v11, "initWithDataProvider:navActionCoordinator:routeInfoProvider:mapItemDisplayer:", v15, self, v12, v13);

  -[NavActionCoordinator presentSearchAlongTheRouteWithViewModel:](self, "presentSearchAlongTheRouteWithViewModel:", v14);
}

- (void)pressedShowOverviewWithSender:(id)a3
{
  -[NavActionCoordinator viewController:switchToMapViewZoom:](self, "viewController:switchToMapViewZoom:", a3, 1);
}

- (void)pressedZoomToManeuverWithSender:(id)a3
{
  -[NavActionCoordinator viewController:switchToMapViewZoom:](self, "viewController:switchToMapViewZoom:", a3, 0);
}

- (void)viewController:(id)a3 switchToMapViewZoom:(unint64_t)a4
{
  void *v6;
  void *v7;
  id v8;

  if (a4 != 2)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator mapViewZoomController](self, "mapViewZoomController", a3));
    objc_msgSend(v6, "setZoomTo:", a4);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator navigationTrayContaineeViewController](self, "navigationTrayContaineeViewController"));
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cardPresentationController"));

    if (objc_msgSend(v8, "containeeLayout") != (id)1)
      objc_msgSend(v8, "wantsLayout:", 1);

  }
}

- (void)sender:(id)a3 switchToNavigationCameraMode:(unint64_t)a4
{
  void *v6;
  id v7;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator navigationCameraModeController](self, "navigationCameraModeController", a3));
  objc_msgSend(v6, "setNavigationCameraMode:", a4);

  v7 = (id)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
  objc_msgSend(v7, "updateLayoutAnimated:", 1);

}

- (unint64_t)navigationCameraMode
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator navigationCameraModeController](self, "navigationCameraModeController"));
  v3 = objc_msgSend(v2, "navigationCameraMode");

  return (unint64_t)v3;
}

- (int64_t)navigationTransportType
{
  void *v2;
  unsigned int v3;
  int64_t v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  if (objc_msgSend(v2, "isInNavigatingState"))
    v3 = objc_msgSend(v2, "navigationTransportType");
  else
    v3 = objc_msgSend(v2, "desiredTransportType");
  if (v3 - 1 > 5)
    v4 = 1;
  else
    v4 = qword_100E3F370[v3 - 1];

  return v4;
}

- (void)viewController:(id)a3 switchNavigationToRoute:(id)a4
{
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "route"));
  v7 = objc_msgSend(v6, "isEqual:", v16);

  if ((v7 & 1) == 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator trafficIncidentAlertCoordinator](self, "trafficIncidentAlertCoordinator"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "presentedAlert"));

    if (objc_msgSend(v9, "alertType") != (id)1
      || (v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "originalRoute")),
          v11 = objc_msgSend(v10, "isEqual:", v16),
          v10,
          (v11 & 1) == 0))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
      v13 = objc_msgSend(v12, "alternateRouteIndexForRoute:", v16);

      v14 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
      objc_msgSend(v14, "switchToRoute:", v16);

      v15 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
      objc_msgSend(v15, "captureUserAction:onTarget:eventValue:routeIndex:", 3015, 505, 0, v13);

    }
  }

}

- (void)selectMapItem:(id)a3 shouldRemoveResults:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  PlaceCardItem *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  char isKindOfClass;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t IsEnabled_Maps420;
  uint64_t v23;
  uint64_t v24;
  uint64_t IsEnabled_DrivingMultiWaypointRoutes;
  uint64_t IsEnabled_Maps182;
  id v27;
  NSObject *v28;
  void *v29;
  GuidanceSearchResultsViewController *resultsViewController;
  void *v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id location;
  uint8_t buf[4];
  void *v37;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "chromeViewController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mapView"));
  objc_initWeak(&location, v9);

  if (v6)
  {
    v10 = sub_100431C0C();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
      *(_DWORD *)buf = 138412290;
      v37 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "SAR: Opening placecard for: %@", buf, 0xCu);

    }
    v13 = -[PlaceCardItem initWithMapItem:]([PlaceCardItem alloc], "initWithMapItem:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "currentViewController"));
    v16 = objc_opt_class(PlaceCardViewController);
    isKindOfClass = objc_opt_isKindOfClass(v15, v16);

    if ((isKindOfClass & 1) == 0
      || (v18 = objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController")),
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v18, "currentViewController")),
          (id)v18,
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "placeCardItem")),
          LOBYTE(v18) = -[PlaceCardItem isEqual:](v13, "isEqual:", v20),
          v20,
          v19,
          (v18 & 1) == 0))
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator placecardViewController](self, "placecardViewController"));
      objc_msgSend(v21, "resetState");
      IsEnabled_Maps420 = -[NavActionCoordinator navigationTransportType](self, "navigationTransportType");
      v24 = 0;
      switch(IsEnabled_Maps420)
      {
        case 0:
          IsEnabled_DrivingMultiWaypointRoutes = MapsFeature_IsEnabled_DrivingMultiWaypointRoutes(IsEnabled_Maps420, v23);
          if ((IsEnabled_DrivingMultiWaypointRoutes & 1) == 0)
          {
            IsEnabled_Maps420 = MapsFeature_IsEnabled_Maps420(IsEnabled_DrivingMultiWaypointRoutes);
            if ((IsEnabled_Maps420 & 1) == 0)
              goto LABEL_11;
          }
          v24 = 1;
          break;
        case 1:
          IsEnabled_Maps182 = MapsFeature_IsEnabled_DrivingMultiWaypointRoutes(IsEnabled_Maps420, v23);
          goto LABEL_14;
        case 2:
LABEL_11:
          IsEnabled_Maps182 = MapsFeature_IsEnabled_Maps182(IsEnabled_Maps420);
          goto LABEL_14;
        case 5:
          IsEnabled_Maps182 = MapsFeature_IsEnabled_Maps420(IsEnabled_Maps420);
LABEL_14:
          v24 = IsEnabled_Maps182;
          break;
        default:
          break;
      }
      objc_msgSend(v21, "setIsAdditionalStop:", v24);
      objc_msgSend(v21, "setExcludedContent:", -[NavActionCoordinator excludedContentForMapItem:](self, "excludedContentForMapItem:", v6));
      objc_msgSend(v21, "setPlaceCardItem:withHistory:", v13, 0);
      -[NavActionCoordinator presentPlacecardViewController](self, "presentPlacecardViewController");
      if (v4)
      {
        v27 = sub_100431C0C();
        v28 = objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "SAR: Removing resultsViewController from the stack.", buf, 2u);
        }

        v29 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
        objc_msgSend(v29, "removeControllerFromStack:", self->_resultsViewController);

        resultsViewController = self->_resultsViewController;
        self->_resultsViewController = 0;

      }
      v13 = -[PersonalizedMapItemKey initWithMapItem:]([PersonalizedMapItemKey alloc], "initWithMapItem:", v6);
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator customPOIsController](self, "customPOIsController"));
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_100C26C8C;
      v32[3] = &unk_1011B5128;
      objc_copyWeak(&v34, &location);
      v33 = v6;
      objc_msgSend(v31, "customFeatureForKey:completion:", v13, v32);

      objc_destroyWeak(&v34);
    }
  }
  else
  {
    v13 = (PlaceCardItem *)objc_loadWeakRetained(&location);
    -[PlaceCardItem _deselectLabelMarkerAnimated:](v13, "_deselectLabelMarkerAnimated:", 1);
  }

  objc_destroyWeak(&location);
}

- (void)personalizedItemSourceDidChangeItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  char isKindOfClass;
  GuidanceSearchResultsViewController *resultsViewController;
  void *v10;
  id v11;
  NSObject *v12;
  uint8_t v13[16];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentViewController"));
  v7 = objc_opt_class(GuidanceSearchResultsViewController);
  isKindOfClass = objc_opt_isKindOfClass(v6, v7);

  if ((isKindOfClass & 1) != 0)
  {
    resultsViewController = self->_resultsViewController;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allItems"));
    -[GuidanceSearchResultsViewController didChangePersonalItems:](resultsViewController, "didChangePersonalItems:", v10);

  }
  else
  {
    v11 = sub_100431C0C();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Ignoring personalized items change as SAR isn't active", v13, 2u);
    }

  }
}

- (void)detourToMapItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator mapSelectionManager](self, "mapSelectionManager"));
  objc_msgSend(v5, "clearSelection");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator routeDetourer](self, "routeDetourer"));
  objc_msgSend(v6, "detourRouteToMapItem:", v4);

  -[NavActionCoordinator _presentTrayWithDefaultLayout:animated:](self, "_presentTrayWithDefaultLayout:animated:", 1, 1);
  -[NavActionCoordinator dismissSearchAlongRoute](self, "dismissSearchAlongRoute");
}

- (void)detourToWaypoint:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator mapSelectionManager](self, "mapSelectionManager"));
  objc_msgSend(v5, "clearSelection");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator routeDetourer](self, "routeDetourer"));
  objc_msgSend(v6, "detourRouteToWaypoint:", v4);

  -[NavActionCoordinator _presentTrayWithDefaultLayout:animated:](self, "_presentTrayWithDefaultLayout:animated:", 1, 1);
  -[NavActionCoordinator dismissSearchAlongRoute](self, "dismissSearchAlongRoute");
}

- (void)viewController:(id)a3 updateMapRect:(id)a4
{
  double var1;
  double var0;
  double v6;
  double v7;
  id v8;

  var1 = a4.var1.var1;
  var0 = a4.var1.var0;
  v6 = a4.var0.var1;
  v7 = a4.var0.var0;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator mapViewZoomController](self, "mapViewZoomController", a3));
  objc_msgSend(v8, "setZoomToTargetWithRect:", v7, v6, var0, var1);

}

- (void)recenterNavigation
{
  void *v3;
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  void *v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator mapViewZoomController](self, "mapViewZoomController"));
  v4 = objc_msgSend(v3, "zoom");
  v5 = -[NavActionCoordinator defaultMapViewZoom](self, "defaultMapViewZoom");

  if (v4 == (id)v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "chromeViewController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mapView"));

    v9 = sub_10043157C();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v13 = "-[NavActionCoordinator recenterNavigation]";
      v14 = 2114;
      v15 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s, navigationCameraReturnToPuck! on mapView: %{public}@", buf, 0x16u);
    }

    objc_msgSend(v8, "navigationCameraReturnToPuck");
  }
  else
  {
    v11 = (id)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator mapViewZoomController](self, "mapViewZoomController"));
    objc_msgSend(v11, "setZoomTo:", -[NavActionCoordinator defaultMapViewZoom](self, "defaultMapViewZoom"));

  }
}

- (void)updateCameraForTraits:(id)a3 containerStyle:(unint64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator mapViewZoomController](self, "mapViewZoomController"));
  objc_msgSend(v7, "updateCameraForTraits:containerStyle:", v6, a4);

}

- (void)repeatGuidanceInstruction
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  objc_msgSend(v2, "repeatCurrentGuidance:", 0);

}

- (void)toggleTemporaryStatusBar
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
  objc_msgSend(v2, "toggleTemporaryStatusBar");

}

- (BOOL)shouldShowNavRecenterButton
{
  void *v3;
  void *v4;
  id v5;
  BOOL v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator navigationDisplay](self, "navigationDisplay"));
  if (objc_msgSend(v3, "isTracking"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator mapViewZoomController](self, "mapViewZoomController"));
    v5 = objc_msgSend(v4, "zoom");
    if (v5 == (id)-[NavActionCoordinator defaultMapViewZoom](self, "defaultMapViewZoom")
      && !-[NavActionCoordinator isNavCameraPanned](self, "isNavCameraPanned"))
    {
      v6 = -[NavActionCoordinator isNavCameraZoomed](self, "isNavCameraZoomed");
    }
    else
    {
      v6 = 1;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)dismissPlacecard
{
  void *v3;
  void *v4;
  uint64_t v5;
  char isKindOfClass;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t IsEnabled_DrivingMultiWaypointRoutes;
  uint64_t IsEnabled_Maps420;
  void *v12;
  unsigned __int8 v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentViewController"));
  v5 = objc_opt_class(PlaceCardViewController);
  isKindOfClass = objc_opt_isKindOfClass(v4, v5);

  if ((isKindOfClass & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
    objc_msgSend(v7, "popLastViewControllerAnimated:", 0);

    IsEnabled_DrivingMultiWaypointRoutes = MapsFeature_IsEnabled_DrivingMultiWaypointRoutes(v8, v9);
    if ((IsEnabled_DrivingMultiWaypointRoutes & 1) != 0
      || (IsEnabled_Maps420 = MapsFeature_IsEnabled_Maps420(IsEnabled_DrivingMultiWaypointRoutes),
          (IsEnabled_Maps420 & 1) != 0)
      || MapsFeature_IsEnabled_Maps182(IsEnabled_Maps420))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
      v13 = objc_msgSend(v12, "controllerIsInStack:", self->_resultsViewController);

      if ((v13 & 1) == 0)
      {
        -[NavActionCoordinator recenterNavigation](self, "recenterNavigation");
        -[NavActionCoordinator _presentTrayWithDefaultLayout:animated:](self, "_presentTrayWithDefaultLayout:animated:", 1, 1);
      }
    }
  }
}

- (void)dismissSearchAlongRoute
{
  void *v3;
  void *v4;
  uint64_t v5;
  char isKindOfClass;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentViewController"));
  v5 = objc_opt_class(GuidanceSearchResultsViewController);
  isKindOfClass = objc_opt_isKindOfClass(v4, v5);

  if ((isKindOfClass & 1) != 0)
    -[NavActionCoordinator _presentTrayWithDefaultLayout:animated:](self, "_presentTrayWithDefaultLayout:animated:", 1, 1);
  -[NavActionCoordinator clearSearch](self, "clearSearch");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator mapItemDisplayer](self, "mapItemDisplayer"));
  objc_msgSend(v7, "removeMapItems");

  -[NavActionCoordinator recenterNavigation](self, "recenterNavigation");
}

- (void)clearSearch
{
  GuidanceSearchResultsViewController *resultsViewController;
  SearchViewController *searchHomeViewController;

  resultsViewController = self->_resultsViewController;
  self->_resultsViewController = 0;

  searchHomeViewController = self->_searchHomeViewController;
  if (searchHomeViewController)
    -[SearchViewController cleanSearch](searchHomeViewController, "cleanSearch");
}

- (void)dismissModalContainee
{
  void *v3;
  void *v4;
  uint64_t v5;
  char isKindOfClass;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentViewController"));
  v5 = objc_opt_class(ModalContaineeViewController);
  isKindOfClass = objc_opt_isKindOfClass(v4, v5);

  if ((isKindOfClass & 1) != 0)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
    objc_msgSend(v7, "popLastViewControllerAnimated:", 0);

  }
}

- (void)dismissShareETA
{
  void *v3;
  void *v4;
  uint64_t v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  char v11;
  id v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentViewController"));
  v5 = objc_opt_class(NavContactSearchViewController);
  isKindOfClass = objc_opt_isKindOfClass(v4, v5);

  if ((isKindOfClass & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
    objc_msgSend(v7, "popLastViewControllerAnimated:", 0);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentViewController"));
  v10 = objc_opt_class(NavShareETAViewController);
  v11 = objc_opt_isKindOfClass(v9, v10);

  if ((v11 & 1) != 0)
  {
    v12 = (id)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
    objc_msgSend(v12, "popLastViewControllerAnimated:", 0);

  }
}

- (void)dismissVoiceVolumeControl
{
  -[NavActionCoordinator dismissVoiceVolumeControlAnimated:](self, "dismissVoiceVolumeControlAnimated:", 0);
}

- (void)dismissVoiceVolumeControlAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  char isKindOfClass;
  void *v11;
  uint8_t v12[16];

  v3 = a3;
  v5 = sub_100431C0C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Dismiss Voice Volume Control", v12, 2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentViewController"));
  v9 = objc_opt_class(NavVoiceVolumeViewController);
  isKindOfClass = objc_opt_isKindOfClass(v8, v9);

  if ((isKindOfClass & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
    objc_msgSend(v11, "popLastViewControllerAnimated:", v3);

  }
}

- (void)dismissTray
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator navigationTrayContaineeViewController](self, "navigationTrayContaineeViewController"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "cardPresentationController"));
  objc_msgSend(v2, "wantsLayout:", 1);

}

- (void)toggleLowGuidanceNavigationCameraHeading
{
  -[NavActionCoordinator _toggleCameraHeadingIfNeeded](self, "_toggleCameraHeadingIfNeeded");
}

- (void)_toggleCameraHeadingIfNeeded
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if ((id)-[NavActionCoordinator navigationCameraMode](self, "navigationCameraMode") == (id)1)
  {
    v3 = (id)-[NavActionCoordinator navigationCameraHeadingOverride](self, "navigationCameraHeadingOverride") != (id)1;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator navigationDisplay](self, "navigationDisplay"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cameraController"));
    objc_msgSend(v5, "setNavigationCameraHeadingOverride:", v3);

    v7 = (id)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator navigationDisplay](self, "navigationDisplay"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cameraController"));
    -[NavActionCoordinator setLowGuidanceUserPreferredHeadingOverride:](self, "setLowGuidanceUserPreferredHeadingOverride:", objc_msgSend(v6, "navigationCameraHeadingOverride"));

  }
}

- (void)showJunctionViewIfNeeded
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
  objc_msgSend(v2, "showJunctionViewIfNeeded");

}

- (void)hideJunctionViewIfNeeded
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
  objc_msgSend(v2, "hideJunctionViewIfNeeded");

}

- (void)suppressTransitionsOfContainee:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
  objc_msgSend(v5, "suppressTransitionsOfContainee:", v4);

}

- (void)containeeViewControllerGoToPreviousState:(id)a3 withSender:(id)a4
{
  uint64_t IsEnabled_DrivingMultiWaypointRoutes;
  uint64_t IsEnabled_Maps420;
  void *v7;
  unsigned __int8 v8;
  id v9;

  IsEnabled_DrivingMultiWaypointRoutes = MapsFeature_IsEnabled_DrivingMultiWaypointRoutes(self, a2);
  if ((IsEnabled_DrivingMultiWaypointRoutes & 1) != 0
    || (IsEnabled_Maps420 = MapsFeature_IsEnabled_Maps420(IsEnabled_DrivingMultiWaypointRoutes),
        (IsEnabled_Maps420 & 1) != 0)
    || MapsFeature_IsEnabled_Maps182(IsEnabled_Maps420))
  {
    -[NavActionCoordinator selectMapItem:shouldRemoveResults:](self, "selectMapItem:shouldRemoveResults:", 0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
    v8 = objc_msgSend(v7, "controllerIsInStack:", self->_resultsViewController);

    if ((v8 & 1) == 0)
    {
      -[NavActionCoordinator recenterNavigation](self, "recenterNavigation");
      -[NavActionCoordinator _presentTrayWithDefaultLayout:animated:](self, "_presentTrayWithDefaultLayout:animated:", 1, 1);
    }
  }
  v9 = (id)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
  objc_msgSend(v9, "popLastViewControllerAnimated:useDefaultContaineeLayout:", 1, 1);

}

- (BOOL)mapView:(id)a3 shouldSelectLabelMarker:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  void *v17;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator navTrafficIncidentCoordinator](self, "navTrafficIncidentCoordinator"));
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "presentedAlert"));
  if (v7)
  {
    v8 = (void *)v7;
    v9 = objc_msgSend(v5, "isRouteEta");

    if ((v9 & 1) == 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator navTrafficIncidentCoordinator](self, "navTrafficIncidentCoordinator"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "presentedAlert"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "incident"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "incidentId"));

      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "incident"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "uniqueString"));

      v16 = objc_msgSend(v13, "isEqualToString:", v15);
      goto LABEL_16;
    }
  }
  else
  {

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "featureAnnotation"));
  if (objc_msgSend(v13, "conformsToProtocol:", &OBJC_PROTOCOL___CustomPOIAnnotation))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "mapItem"));
    v16 = v17 != 0;

  }
  else
  {
    v16 = (!objc_msgSend(v5, "isCluster") || objc_msgSend(v5, "clusterFeatureCount"))
       && ((GEOConfigGetBOOL(MapsConfig_AllowPOISelectionDuringNavigation, off_1014B50F8) & 1) != 0
        || (objc_msgSend(v5, "isTrafficIncident") & 1) != 0
        || (objc_msgSend(v5, "isRouteEta") & 1) != 0
        || (objc_msgSend(v5, "isRouteAnnotation") & 1) != 0
        || (unint64_t)objc_msgSend(v5, "clusterFeatureCount") > 1);
  }
LABEL_16:

  return v16;
}

- (void)mapView:(id)a3 didSelectLabelMarker:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  v7 = a4;
  if (!v7)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator navigationDisplay](self, "navigationDisplay"));
    objc_msgSend(v5, "startMotion:", 1);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator mapSelectionManager](self, "mapSelectionManager"));
  objc_msgSend(v6, "mapDidSelectLabelMarker:", v7);

}

- (void)mapView:(id)a3 didDeselectLabelMarker:(id)a4
{
  -[NavActionCoordinator mapView:didSelectLabelMarker:](self, "mapView:didSelectLabelMarker:", a3, 0);
}

- (void)mapViewNavigationCameraHasStartedPanning:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  self->_navCameraPanned = 1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
  v5 = objc_opt_respondsToSelector(v4, "mapViewNavigationCameraHasStartedPanning:");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
    objc_msgSend(v6, "mapViewNavigationCameraHasStartedPanning:", v7);

  }
}

- (void)mapViewNavigationCameraHasStoppedPanning:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  self->_navCameraPanned = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
  v5 = objc_opt_respondsToSelector(v4, "mapViewNavigationCameraHasStoppedPanning:");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
    objc_msgSend(v6, "mapViewNavigationCameraHasStoppedPanning:", v7);

  }
}

- (void)mapViewNavigationCameraDidLeaveDefaultZoom:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  self->_navCameraZoomed = 1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
  v5 = objc_opt_respondsToSelector(v4, "mapViewNavigationCameraDidLeaveDefaultZoom:");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
    objc_msgSend(v6, "mapViewNavigationCameraDidLeaveDefaultZoom:", v7);

  }
}

- (void)mapViewNavigationCameraDidReturnToDefaultZoom:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  self->_navCameraZoomed = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
  v5 = objc_opt_respondsToSelector(v4, "mapViewNavigationCameraDidReturnToDefaultZoom:");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
    objc_msgSend(v6, "mapViewNavigationCameraDidReturnToDefaultZoom:", v7);

  }
}

- (void)mapView:(id)a3 didUpdateYaw:(double)a4
{
  void *v6;
  char v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
  v7 = objc_opt_respondsToSelector(v6, "mapView:didUpdateYaw:");

  if ((v7 & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
    objc_msgSend(v8, "mapView:didUpdateYaw:", v9, a4);

  }
}

- (void)didTapMapView:(id)a3 atPoint:(CGPoint)a4
{
  void *v5;
  unsigned int v6;
  void *v7;
  id v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator mapSelectionManager](self, "mapSelectionManager", a3, a4.x, a4.y));
  v6 = objc_msgSend(v5, "hasSelection");

  if (v6)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator mapSelectionManager](self, "mapSelectionManager"));
    objc_msgSend(v8, "clearSelection");
  }
  else
  {
    if (-[NavActionCoordinator isSearchingAlongTheRoute](self, "isSearchingAlongTheRoute"))
      +[SARAnalytics captureMapTapToHideTray](SARAnalytics, "captureMapTapToHideTray");
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator navigationTrayContaineeViewController](self, "navigationTrayContaineeViewController"));
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cardPresentationController"));

    if (objc_msgSend(v8, "containeeLayout") != (id)1)
      objc_msgSend(v8, "wantsLayout:", 1);
  }

}

- (void)presentTrafficIncidentViewController:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[NavActionCoordinator setDisplayingTrafficIncident:](self, "setDisplayingTrafficIncident:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
  objc_msgSend(v8, "presentController:animated:completion:", v7, 1, v6);

  v9 = (id)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
  objc_msgSend(v9, "hideJunctionViewIfNeeded");

}

- (void)dismissTrafficIncidentViewController:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentViewController"));

  if (v6 == v4)
  {
    -[NavActionCoordinator presentTray](self, "presentTray");
    v7 = (id)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
    objc_msgSend(v7, "showJunctionViewIfNeeded");

  }
}

- (void)searchResultTableViewCellDidTapActionButton:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_tableView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "indexPathForCell:", v9));

  if (v5)
    v6 = (uint64_t)objc_msgSend(v5, "row");
  else
    v6 = -1;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mapItem"));
  +[SARAnalytics captureListStartDetourToMapItem:index:](SARAnalytics, "captureListStartDetourToMapItem:index:", v7, v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mapItem"));
  -[NavActionCoordinator detourToMapItem:](self, "detourToMapItem:", v8);

}

- (void)dismissCategoryList:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentViewController"));

  if (v6 == v4)
    -[NavActionCoordinator dismissAddStopAnimated:](self, "dismissAddStopAnimated:", 1);
}

- (void)categoryList:(id)a3 selectedSearchCategory:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  SearchFieldItem *v8;
  GuidanceSearchResultsCategoryDataProvider *v9;
  void *v10;
  void *v11;
  void *v12;
  GuidanceSearchResultsCategoryDataProvider *v13;
  GuidanceSearchResultsViewModel *v14;
  void *v15;
  void *v16;
  GuidanceSearchResultsViewModel *v17;
  int v18;
  id v19;

  v5 = a4;
  v6 = sub_100431C0C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v18 = 138412290;
    v19 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Selected SAR category: %@", (uint8_t *)&v18, 0xCu);
  }

  v8 = objc_opt_new(SearchFieldItem);
  -[SearchFieldItem setSearchCategory:](v8, "setSearchCategory:", v5);
  v9 = [GuidanceSearchResultsCategoryDataProvider alloc];
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "chromeViewController"));
  v13 = -[GuidanceSearchResultsCategoryDataProvider initWithSearchItem:mapService:chromeViewController:](v9, "initWithSearchItem:mapService:chromeViewController:", v8, v10, v12);

  v14 = [GuidanceSearchResultsViewModel alloc];
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator routeInfoProvider](self, "routeInfoProvider"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator mapItemDisplayer](self, "mapItemDisplayer"));
  v17 = -[GuidanceSearchResultsViewModel initWithDataProvider:navActionCoordinator:routeInfoProvider:mapItemDisplayer:](v14, "initWithDataProvider:navActionCoordinator:routeInfoProvider:mapItemDisplayer:", v13, self, v15, v16);

  -[NavActionCoordinator presentSearchAlongTheRouteWithViewModel:](self, "presentSearchAlongTheRouteWithViewModel:", v17);
}

- (void)dismissIncidentReportingViewController:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentViewController"));

  if (v6 == v4)
    -[NavActionCoordinator dismissReportAnIncidentAnimated:](self, "dismissReportAnIncidentAnimated:", 1);
}

- (void)incidentReportingViewController:(id)a3 selectedTrafficIncidentItem:(id)a4 atLocation:(id)a5
{
  id v7;
  id v8;
  TrafficIncidentReport *v9;

  v7 = a5;
  v8 = a4;
  v9 = -[TrafficIncidentReport initWithUserLocation:type:userPath:]([TrafficIncidentReport alloc], "initWithUserLocation:type:userPath:", v7, objc_msgSend(v8, "incidentType"), 2);

  -[NavActionCoordinator displayIncidentReportSubmissionWithItem:report:](self, "displayIncidentReportSubmissionWithItem:report:", v8, v9);
}

- (void)dismissVoiceVolumeControlViewController:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentViewController"));

  if (v6 == v4)
    -[NavActionCoordinator dismissVoiceVolumeControlAnimated:](self, "dismissVoiceVolumeControlAnimated:", 1);
}

- (void)voiceVolumeViewController:(id)a3 selectedVoiceVolumeOption:(int64_t)a4
{
  unsigned int v5;
  uint64_t v6;
  id v7;

  if (a4)
    v5 = 3054;
  else
    v5 = 3053;
  if (a4 == 2)
    v6 = 3055;
  else
    v6 = v5;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService", a3));
  objc_msgSend(v7, "captureUserAction:onTarget:eventValue:", v6, -[NavActionCoordinator currentUITargetForAnalytics](self, "currentUITargetForAnalytics"), 0);

}

- (void)mapViewZoomController:(id)a3 didChangeMapViewZoom:(unint64_t)a4
{
  id v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a3;
  v7 = -[NavActionCoordinator navigationCameraMode](self, "navigationCameraMode");
  v8 = 0;
  if (a4 == 1 && v7 == 1)
    v8 = -[NavActionCoordinator lowGuidanceUserPreferredHeadingOverride](self, "lowGuidanceUserPreferredHeadingOverride");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator navigationDisplay](self, "navigationDisplay"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "cameraController"));
  objc_msgSend(v10, "setNavigationCameraHeadingOverride:", v8);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator containerViewController](self, "containerViewController"));
  objc_msgSend(v11, "mapViewZoomController:didChangeMapViewZoom:", v6, a4);

  v12 = (id)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator mapViewZoomDelegate](self, "mapViewZoomDelegate"));
  objc_msgSend(v12, "navActionCoordinator:didChangeMapViewZoom:", self, a4);

}

- (void)pptTestEndNavigation
{
  -[NavActionCoordinator pressedEndWithSender:](self, "pressedEndWithSender:", self);
}

- (void)pptTestTransitionBetweenFullAndLightGuidance
{
  unint64_t v3;
  uint64_t v4;

  v3 = -[NavActionCoordinator navigationCameraMode](self, "navigationCameraMode");
  if (v3)
  {
    if (v3 != 1)
      return;
    v4 = 0;
  }
  else
  {
    v4 = 1;
  }
  -[NavActionCoordinator sender:switchToNavigationCameraMode:](self, "sender:switchToNavigationCameraMode:", self, v4);
}

- (int)currentUITargetForAnalytics
{
  uint64_t v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  int v8;

  v3 = objc_claimAutoreleasedReturnValue(-[NavActionCoordinator navigationTrayContaineeViewController](self, "navigationTrayContaineeViewController"));
  if (!v3)
    return 401;
  v4 = (void *)v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator navigationTrayContaineeViewController](self, "navigationTrayContaineeViewController"));
  v6 = objc_msgSend(v5, "conformsToProtocol:", &OBJC_PROTOCOL___GEOLogContextDelegate);

  if (!v6)
    return 401;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavActionCoordinator navigationTrayContaineeViewController](self, "navigationTrayContaineeViewController"));
  v8 = objc_msgSend(v7, "currentUITargetForAnalytics");

  return v8;
}

- (int)currentMapViewTargetForAnalytics
{
  return 505;
}

- (unint64_t)lowGuidanceUserPreferredHeadingOverride
{
  return GEOConfigGetUInteger(MapsConfig_NavigationLowGuidanceCameraHeadingOverride, off_1014B3098);
}

- (void)setLowGuidanceUserPreferredHeadingOverride:(unint64_t)a3
{
  GEOConfigSetUInteger(MapsConfig_NavigationLowGuidanceCameraHeadingOverride, off_1014B3098, a3);
}

- (BOOL)pptTestCanUpdateTrayLayout
{
  NavContainerViewController **p_containerViewController;
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
  NavContainerViewController **p_containerViewController;
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

- (AppCoordinator)appCoordinator
{
  return (AppCoordinator *)objc_loadWeakRetained((id *)&self->_appCoordinator);
}

- (SearchInfo)currentSearchInfo
{
  return self->_currentSearchInfo;
}

- (BOOL)isNavCameraPanned
{
  return self->_navCameraPanned;
}

- (BOOL)isNavCameraZoomed
{
  return self->_navCameraZoomed;
}

- (unint64_t)defaultContaineeViewControllerType
{
  return self->_defaultContaineeViewControllerType;
}

- (RAPNavigationTracker)rapNavigationTracker
{
  return self->_rapNavigationTracker;
}

- (BOOL)isShowingFullScreenDirectionsList
{
  return self->_showFullScreenDirectionsList;
}

- (void)setShowFullScreenDirectionsList:(BOOL)a3
{
  self->_showFullScreenDirectionsList = a3;
}

- (void)setSearchHomeViewController:(id)a3
{
  objc_storeStrong((id *)&self->_searchHomeViewController, a3);
}

- (NavContainerViewController)containerViewController
{
  return (NavContainerViewController *)objc_loadWeakRetained((id *)&self->_containerViewController);
}

- (CustomPOIsController)customPOIsController
{
  return (CustomPOIsController *)objc_loadWeakRetained((id *)&self->_customPOIsController);
}

- (void)setCustomPOIsController:(id)a3
{
  objc_storeWeak((id *)&self->_customPOIsController, a3);
}

- (MapViewZoomDelegate)mapViewZoomDelegate
{
  return (MapViewZoomDelegate *)objc_loadWeakRetained((id *)&self->_mapViewZoomDelegate);
}

- (void)setMapViewZoomDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_mapViewZoomDelegate, a3);
}

- (void)setNavTrafficIncidentCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_navTrafficIncidentCoordinator, a3);
}

- (unint64_t)defaultMapViewZoom
{
  return self->_defaultMapViewZoom;
}

- (void)setDefaultMapViewZoom:(unint64_t)a3
{
  self->_defaultMapViewZoom = a3;
}

- (NavigationMapItemDisplaying)mapItemDisplayer
{
  return self->_mapItemDisplayer;
}

- (void)setMapItemDisplayer:(id)a3
{
  objc_storeStrong((id *)&self->_mapItemDisplayer, a3);
}

- (NavigationDisplay)navigationDisplay
{
  return self->_navigationDisplay;
}

- (GuidanceObserver)guidanceObserver
{
  return self->_guidanceObserver;
}

- (SearchSessionManager)searchSessionManager
{
  return self->_searchSessionManager;
}

- (void)setSearchSessionManager:(id)a3
{
  objc_storeStrong((id *)&self->_searchSessionManager, a3);
}

- (NavigationCameraModeControlling)navigationCameraModeController
{
  return (NavigationCameraModeControlling *)objc_loadWeakRetained((id *)&self->_navigationCameraModeController);
}

- (void)setNavigationTrayContaineeViewController:(id)a3
{
  objc_storeStrong((id *)&self->_navigationTrayContaineeViewController, a3);
}

- (void)setMapViewZoomController:(id)a3
{
  objc_storeStrong((id *)&self->_mapViewZoomController, a3);
}

- (BOOL)isSearchingAlongTheRoute
{
  return self->_searchingAlongTheRoute;
}

- (void)setSearchingAlongTheRoute:(BOOL)a3
{
  self->_searchingAlongTheRoute = a3;
}

- (BOOL)isDisplayingTrafficIncident
{
  return self->_displayingTrafficIncident;
}

- (void)setDisplayingTrafficIncident:(BOOL)a3
{
  self->_displayingTrafficIncident = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapViewZoomController, 0);
  objc_storeStrong((id *)&self->_navigationTrayContaineeViewController, 0);
  objc_destroyWeak((id *)&self->_navigationCameraModeController);
  objc_storeStrong((id *)&self->_searchSessionManager, 0);
  objc_storeStrong((id *)&self->_guidanceObserver, 0);
  objc_storeStrong((id *)&self->_navigationDisplay, 0);
  objc_storeStrong((id *)&self->_mapItemDisplayer, 0);
  objc_storeStrong((id *)&self->_navTrafficIncidentCoordinator, 0);
  objc_destroyWeak((id *)&self->_mapViewZoomDelegate);
  objc_destroyWeak((id *)&self->_customPOIsController);
  objc_destroyWeak((id *)&self->_containerViewController);
  objc_storeStrong((id *)&self->_searchHomeViewController, 0);
  objc_storeStrong((id *)&self->_routeDetourer, 0);
  objc_storeStrong((id *)&self->_routeInfoProvider, 0);
  objc_storeStrong((id *)&self->_routeAnnotationViewController, 0);
  objc_storeStrong((id *)&self->_rapNavigationTracker, 0);
  objc_storeStrong((id *)&self->_trafficIncidentViewController, 0);
  objc_storeStrong((id *)&self->_placecardViewController, 0);
  objc_storeStrong((id *)&self->_simpleResultsViewController, 0);
  objc_storeStrong((id *)&self->_currentSearchInfo, 0);
  objc_destroyWeak((id *)&self->_appCoordinator);
  objc_storeStrong((id *)&self->_addStopViewController, 0);
  objc_storeStrong((id *)&self->_resultsViewController, 0);
}

@end
