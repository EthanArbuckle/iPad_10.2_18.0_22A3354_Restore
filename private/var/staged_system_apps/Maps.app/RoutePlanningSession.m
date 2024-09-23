@implementation RoutePlanningSession

- (void)selectRoute:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  RoutePlanningSession *v10;
  RoutePlanningSession *v11;
  objc_class *v12;
  NSString *v13;
  void *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  uint8_t buf[4];
  __CFString *v19;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession currentRouteCollection](self, "currentRouteCollection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "routes"));
  v7 = objc_msgSend(v6, "indexOfObject:", v4);

  if (v7 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    -[RoutePlanningSession setSelectedRouteIndex:forTransportType:](self, "setSelectedRouteIndex:forTransportType:", v7, 1);
    return;
  }
  v8 = sub_10043364C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v10 = self;
    v11 = v10;
    if (!v10)
    {
      v17 = CFSTR("<nil>");
      goto LABEL_12;
    }
    v12 = (objc_class *)objc_opt_class(v10);
    v13 = NSStringFromClass(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    if ((objc_opt_respondsToSelector(v11, "accessibilityIdentifier") & 1) != 0)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession performSelector:](v11, "performSelector:", "accessibilityIdentifier"));
      v16 = v15;
      if (v15 && !objc_msgSend(v15, "isEqualToString:", v14))
      {
        v17 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v14, v11, v16));

        goto LABEL_9;
      }

    }
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v14, v11));
LABEL_9:

LABEL_12:
    *(_DWORD *)buf = 138543362;
    v19 = v17;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "[%{public}@] CarRouteSelection: Tried to select a route in routePlanning that wasn't in currentRouteCollection.", buf, 0xCu);

  }
}

- (DrivePreferences)drivePreferences
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void **p_vtable;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  char *v16;
  int v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const char *v24;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession configuration](self, "configuration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "routeLoadingTaskFactory"));

  v4 = objc_opt_class(NavdRouteLoadingTaskFactory);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "transportTypeInformation"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "requestInfoProviderForTransportType:", 1));

    p_vtable = MapsAppTestResizingProactive.vtable;
    if (v6)
    {
      v8 = objc_opt_class(DrivingRequestInfoProvider);
      if ((objc_opt_isKindOfClass(v6, v8) & 1) == 0)
      {
        v12 = sub_1004318FC();
        v13 = objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          v17 = 136315906;
          v18 = "-[RoutePlanningSession(RouteRequestPreferences) drivePreferences]";
          v19 = 2080;
          v20 = "RoutePlanningSession+RouteRequestPreferences.m";
          v21 = 1024;
          v22 = 33;
          v23 = 2080;
          v24 = "drivingInfoProvider == nil || [drivingInfoProvider isKindOfClass:DrivingRequestInfoProvider.class]";
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v17, 0x26u);
        }

        if (sub_100A70734())
        {
          v14 = sub_1004318FC();
          v15 = objc_claimAutoreleasedReturnValue(v14);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            v16 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
            v17 = 138412290;
            v18 = v16;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v17, 0xCu);

          }
          p_vtable = (void **)(MapsAppTestResizingProactive + 24);
        }
      }
    }
    v9 = objc_opt_class(p_vtable + 332);
    if ((objc_opt_isKindOfClass(v6, v9) & 1) != 0)
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "drivePreferences"));
    else
      v10 = 0;

  }
  else
  {
    v10 = 0;
  }

  return (DrivePreferences *)v10;
}

- (WalkPreferences)walkPreferences
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void **p_vtable;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  char *v16;
  int v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const char *v24;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession configuration](self, "configuration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "routeLoadingTaskFactory"));

  v4 = objc_opt_class(NavdRouteLoadingTaskFactory);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "transportTypeInformation"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "requestInfoProviderForTransportType:", 2));

    p_vtable = &OBJC_METACLASS___CarSearchResultsModeController.vtable;
    if (v6)
    {
      v8 = objc_opt_class(WalkingRequestInfoProvider);
      if ((objc_opt_isKindOfClass(v6, v8) & 1) == 0)
      {
        v12 = sub_1004318FC();
        v13 = objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          v17 = 136315906;
          v18 = "-[RoutePlanningSession(RouteRequestPreferences) walkPreferences]";
          v19 = 2080;
          v20 = "RoutePlanningSession+RouteRequestPreferences.m";
          v21 = 1024;
          v22 = 49;
          v23 = 2080;
          v24 = "walkingInfoProvider == nil || [walkingInfoProvider isKindOfClass:WalkingRequestInfoProvider.class]";
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v17, 0x26u);
        }

        if (sub_100A70734())
        {
          v14 = sub_1004318FC();
          v15 = objc_claimAutoreleasedReturnValue(v14);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            v16 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
            v17 = 138412290;
            v18 = v16;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v17, 0xCu);

          }
          p_vtable = (void **)(&OBJC_METACLASS___CarSearchResultsModeController + 24);
        }
      }
    }
    v9 = objc_opt_class(p_vtable + 92);
    if ((objc_opt_isKindOfClass(v6, v9) & 1) != 0)
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "walkPreferences"));
    else
      v10 = 0;

  }
  else
  {
    v10 = 0;
  }

  return (WalkPreferences *)v10;
}

- (TransitPreferences)transitPreferences
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  __objc2_class **p_superclass;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  char *v16;
  int v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const char *v24;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession configuration](self, "configuration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "routeLoadingTaskFactory"));

  v4 = objc_opt_class(NavdRouteLoadingTaskFactory);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "transportTypeInformation"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "requestInfoProviderForTransportType:", 3));

    p_superclass = &OBJC_METACLASS___CarSearchCategoryCell.superclass;
    if (v6)
    {
      v8 = objc_opt_class(TransitRequestInfoProvider);
      if ((objc_opt_isKindOfClass(v6, v8) & 1) == 0)
      {
        v12 = sub_1004318FC();
        v13 = objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          v17 = 136315906;
          v18 = "-[RoutePlanningSession(RouteRequestPreferences) transitPreferences]";
          v19 = 2080;
          v20 = "RoutePlanningSession+RouteRequestPreferences.m";
          v21 = 1024;
          v22 = 65;
          v23 = 2080;
          v24 = "transitInfoProvider == nil || [transitInfoProvider isKindOfClass:TransitRequestInfoProvider.class]";
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v17, 0x26u);
        }

        if (sub_100A70734())
        {
          v14 = sub_1004318FC();
          v15 = objc_claimAutoreleasedReturnValue(v14);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            v16 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
            v17 = 138412290;
            v18 = v16;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v17, 0xCu);

          }
          p_superclass = (__objc2_class **)(&OBJC_METACLASS___CarSearchCategoryCell + 8);
        }
      }
    }
    v9 = objc_opt_class(p_superclass + 374);
    if ((objc_opt_isKindOfClass(v6, v9) & 1) != 0)
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "transitPreferences"));
    else
      v10 = 0;

  }
  else
  {
    v10 = 0;
  }

  return (TransitPreferences *)v10;
}

- (CyclePreferences)cyclePreferences
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void **p_vtable;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  char *v16;
  int v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const char *v24;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession configuration](self, "configuration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "routeLoadingTaskFactory"));

  v4 = objc_opt_class(NavdRouteLoadingTaskFactory);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "transportTypeInformation"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "requestInfoProviderForTransportType:", 5));

    p_vtable = &OBJC_METACLASS___CarSearchResultsModeController.vtable;
    if (v6)
    {
      v8 = objc_opt_class(CyclingRequestInfoProvider);
      if ((objc_opt_isKindOfClass(v6, v8) & 1) == 0)
      {
        v12 = sub_1004318FC();
        v13 = objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          v17 = 136315906;
          v18 = "-[RoutePlanningSession(RouteRequestPreferences) cyclePreferences]";
          v19 = 2080;
          v20 = "RoutePlanningSession+RouteRequestPreferences.m";
          v21 = 1024;
          v22 = 82;
          v23 = 2080;
          v24 = "cyclingInfoProvider == nil || [cyclingInfoProvider isKindOfClass:CyclingRequestInfoProvider.class]";
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v17, 0x26u);
        }

        if (sub_100A70734())
        {
          v14 = sub_1004318FC();
          v15 = objc_claimAutoreleasedReturnValue(v14);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            v16 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
            v17 = 138412290;
            v18 = v16;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v17, 0xCu);

          }
          p_vtable = (void **)(&OBJC_METACLASS___CarSearchResultsModeController + 24);
        }
      }
    }
    v9 = objc_opt_class(p_vtable + 152);
    if ((objc_opt_isKindOfClass(v6, v9) & 1) != 0)
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cyclePreferences"));
    else
      v10 = 0;

  }
  else
  {
    v10 = 0;
  }

  return (CyclePreferences *)v10;
}

- (RoutePlanningTiming)timing
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession configuration](self, "configuration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "routeLoadingTaskFactory"));

  v4 = objc_opt_class(NavdRouteLoadingTaskFactory);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "transportTypeInformation"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "transportTypeInfoProviders"));

    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectEnumerator", 0));
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "timing"));

          if (v12)
          {
            v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "timing"));
            goto LABEL_13;
          }
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_13:

  }
  else
  {
    v8 = 0;
  }

  return (RoutePlanningTiming *)v8;
}

- (int64_t)requestState
{
  void *v3;
  void *v4;
  int64_t v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession routeCollectionResultForTransportType:](self, "routeCollectionResultForTransportType:", -[RoutePlanningSession currentTransportType](self, "currentTransportType")));
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "isSuccess"))
      v5 = 2;
    else
      v5 = 3;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession resolvedWaypointsResult](self, "resolvedWaypointsResult"));
    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession resolvedWaypointsResult](self, "resolvedWaypointsResult"));
      if (objc_msgSend(v7, "isSuccess"))
        v5 = 1;
      else
        v5 = 3;

    }
    else
    {
      v5 = 1;
    }

  }
  return v5;
}

- (SearchResult)originDisplayableMarker
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession configuration](self, "configuration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "originWaypointRequest"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession resolvedWaypoints](self, "resolvedWaypoints"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "origin"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession _searchResultFromWaypointRequest:resolvedWaypoint:](self, "_searchResultFromWaypointRequest:resolvedWaypoint:", v4, v6));

  return (SearchResult *)v7;
}

- (SearchResult)destinationDisplayableMarker
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession configuration](self, "configuration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "destinationWaypointRequest"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession resolvedWaypoints](self, "resolvedWaypoints"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "destination"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession _searchResultFromWaypointRequest:resolvedWaypoint:](self, "_searchResultFromWaypointRequest:resolvedWaypoint:", v4, v6));

  return (SearchResult *)v7;
}

- (NSArray)waypointDisplayableMarkers
{
  id v3;
  id v4;
  void **v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t);
  void *v9;
  id v10;
  RoutePlanningSession *v11;

  v6 = _NSConcreteStackBlock;
  v7 = 3221225472;
  v8 = sub_100AD5AB4;
  v9 = &unk_1011E1F38;
  v10 = objc_alloc_init((Class)NSMutableArray);
  v11 = self;
  v3 = v10;
  -[RoutePlanningSession enumerateRequestsOrWaypointsUsingBlock:](self, "enumerateRequestsOrWaypointsUsingBlock:", &v6);
  v4 = objc_msgSend(v3, "copy", v6, v7, v8, v9);

  return (NSArray *)v4;
}

- (id)_searchResultFromWaypointRequest:(id)a3 resolvedWaypoint:(id)a4
{
  id v5;
  id v6;
  SearchResult *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  SearchResult *v13;
  void *v14;
  void *v15;
  double v17;
  double v18;
  double v19;
  id v20;
  id v21;

  v5 = a3;
  v6 = a4;
  if (v6)
  {
    v7 = -[SearchResult initWithComposedWaypoint:]([SearchResult alloc], "initWithComposedWaypoint:", v6);
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "waypointPlaceholder"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "displayableMarker"));

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "waypointPlaceholder"));
      v7 = (SearchResult *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "displayableMarker"));
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "waypointRequest"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "mapItemForLocationComparison"));

      if (v12)
      {
        v13 = [SearchResult alloc];
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "waypointRequest"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "mapItemForLocationComparison"));
        v7 = -[SearchResult initWithMapItem:](v13, "initWithMapItem:", v15);

        goto LABEL_8;
      }
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "waypointRequest"));
      objc_msgSend(v10, "coordinate");
      v18 = v17;
      objc_msgSend(v10, "coordinate");
      if (fabs(v18 + 180.0) >= 0.00000000999999994 || fabs(v19 + 180.0) >= 0.00000000999999994)
      {
        v20 = objc_msgSend(objc_alloc((Class)GEOLocation), "initWithGEOCoordinate:isUserLocation:", objc_msgSend(v10, "isCurrentLocation"), v18, v19);
        v21 = objc_msgSend(objc_alloc((Class)GEOComposedWaypoint), "initWithLocation:isCurrentLocation:", v20, objc_msgSend(v10, "isCurrentLocation"));
        v7 = -[SearchResult initWithComposedWaypoint:]([SearchResult alloc], "initWithComposedWaypoint:", v21);

      }
      else
      {
        v7 = 0;
      }
    }

  }
LABEL_8:

  return v7;
}

- (RoutePlanningSession)initWithInitiator:(unint64_t)a3 configuration:(id)a4
{
  id v7;
  id v8;
  os_activity_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  objc_class *v13;
  NSString *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  NSString *v23;
  void *v24;
  id v25;
  const char *v26;
  dispatch_queue_attr_t v27;
  NSObject *v28;
  dispatch_queue_t v29;
  void *v30;
  id v31;
  void *v32;
  NSMutableArray *v33;
  void *v34;
  id v35;
  uint64_t v36;
  void *i;
  void *v38;
  WaypointControllerConfiguration *v39;
  void *v40;
  WaypointControllerConfiguration *v41;
  void *v42;
  WaypointController *v43;
  void *v44;
  RAPGraphDirectionsRecorder *v45;
  void *v46;
  unint64_t v47;
  void *v48;
  id v49;
  id v51;
  NSObject *v52;
  id v53;
  NSObject *v54;
  char *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  os_activity_scope_state_s state;
  objc_super v61;
  uint8_t v62[128];
  uint8_t buf[4];
  const char *v64;
  __int16 v65;
  const char *v66;
  __int16 v67;
  _BYTE v68[18];

  v7 = a4;
  if (!v7)
  {
    v51 = sub_1004318FC();
    v52 = objc_claimAutoreleasedReturnValue(v51);
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v64 = "-[RoutePlanningSession initWithInitiator:configuration:]";
      v65 = 2080;
      v66 = "RoutePlanningSession.m";
      v67 = 1024;
      *(_DWORD *)v68 = 94;
      *(_WORD *)&v68[4] = 2080;
      *(_QWORD *)&v68[6] = "configuration != nil";
      _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v53 = sub_1004318FC();
      v54 = objc_claimAutoreleasedReturnValue(v53);
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      {
        v55 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v64 = v55;
        _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  v61.receiver = self;
  v61.super_class = (Class)RoutePlanningSession;
  v8 = -[RoutePlanningSession init](&v61, "init");
  if (v8)
  {
    v9 = _os_activity_create((void *)&_mh_execute_header, "Route Planning Session", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    v10 = (void *)*((_QWORD *)v8 + 18);
    *((_QWORD *)v8 + 18) = v9;

    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(*((os_activity_t *)v8 + 18), &state);
    v11 = sub_10043214C();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (objc_class *)objc_opt_class(v8);
      v14 = NSStringFromClass(v13);
      v15 = objc_claimAutoreleasedReturnValue(v14);
      v16 = (void *)v15;
      if (a3 - 1 > 7)
        v17 = CFSTR("Unknown");
      else
        v17 = off_1011E8600[a3 - 1];
      *(_DWORD *)buf = 134349826;
      v64 = (const char *)v8;
      v65 = 2112;
      v66 = (const char *)v15;
      v67 = 2112;
      *(_QWORD *)v68 = v17;
      *(_WORD *)&v68[8] = 2112;
      *(_QWORD *)&v68[10] = v7;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[%{public}p] %@ is being initialized: initiator=%@ configuration=%@", buf, 0x2Au);

    }
    *((_QWORD *)v8 + 4) = a3;
    objc_storeStrong((id *)v8 + 7, a4);
    *((_BYTE *)v8 + 26) = objc_msgSend(v7, "ignoreMapType");
    if (v7)
      v18 = objc_msgSend(v7, "initialTransportType");
    else
      v18 = 0;
    *((_QWORD *)v8 + 11) = v18;
    v19 = objc_msgSend(objc_alloc((Class)GEOObserverHashTable), "initWithProtocol:queue:", &OBJC_PROTOCOL___RoutePlanningSessionObserver, 0);
    v20 = (void *)*((_QWORD *)v8 + 13);
    *((_QWORD *)v8 + 13) = v19;

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "bundleIdentifier"));
    v23 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@.isolationQueue.%p"), v22, objc_opt_class(v8), v8);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);

    v25 = objc_retainAutorelease(v24);
    v26 = (const char *)objc_msgSend(v25, "UTF8String");
    v27 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v28 = objc_claimAutoreleasedReturnValue(v27);
    v29 = dispatch_queue_create(v26, v28);
    v30 = (void *)*((_QWORD *)v8 + 16);
    *((_QWORD *)v8 + 16) = v29;

    v31 = objc_alloc_init((Class)NSMutableDictionary);
    v32 = (void *)*((_QWORD *)v8 + 17);
    *((_QWORD *)v8 + 17) = v31;

    v33 = objc_opt_new(NSMutableArray);
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "waypointRequests"));
    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
    if (v35)
    {
      v36 = *(_QWORD *)v57;
      do
      {
        for (i = 0; i != v35; i = (char *)i + 1)
        {
          if (*(_QWORD *)v57 != v36)
            objc_enumerationMutation(v34);
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * (_QWORD)i), "waypointRequest"));
          -[NSMutableArray addObject:](v33, "addObject:", v38);

        }
        v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
      }
      while (v35);
    }

    v39 = [WaypointControllerConfiguration alloc];
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "traits"));
    v41 = -[WaypointControllerConfiguration initWithRequests:traits:](v39, "initWithRequests:traits:", v33, v40);
    v42 = (void *)*((_QWORD *)v8 + 6);
    *((_QWORD *)v8 + 6) = v41;

    v43 = -[WaypointController initWithConfiguration:]([WaypointController alloc], "initWithConfiguration:", *((_QWORD *)v8 + 6));
    v44 = (void *)*((_QWORD *)v8 + 14);
    *((_QWORD *)v8 + 14) = v43;

    objc_msgSend(*((id *)v8 + 14), "setDelegate:", v8);
    v45 = objc_alloc_init(RAPGraphDirectionsRecorder);
    v46 = (void *)*((_QWORD *)v8 + 8);
    *((_QWORD *)v8 + 8) = v45;

    v47 = *((_QWORD *)v8 + 11);
    if (v47 > 4 || ((1 << v47) & 0x19) == 0)
      objc_msgSend(*((id *)v8 + 8), "startRecording");
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "shortcutIdentifier"));
    objc_msgSend(v8, "setShortcutIdentifier:", v48);

    v49 = &_dispatch_main_q;
    _GEOConfigAddDelegateListenerForKey(MapsConfig_RouteCreationAvailable, off_1014B55A8, &_dispatch_main_q, v8);

    os_activity_scope_leave(&state);
  }

  return (RoutePlanningSession *)v8;
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  id v5;
  NSObject *v6;
  objc_super v7;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  RoutePlanningSession *v10;

  -[GCDTimer invalidate](self->_deferredShortcutsRefreshTimer, "invalidate");
  if (+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[MapsFavoritesManager sharedManager](_TtC4Maps20MapsFavoritesManager, "sharedManager"));
    objc_msgSend(v3, "unregisterObserver:", self);
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[ShortcutManager sharedManager](ShortcutManager, "sharedManager"));
    objc_msgSend(v3, "removeObserver:", self);
  }

  GEOConfigRemoveDelegateListenerForAllKeys(self, v4);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_activity, &state);
  v5 = sub_10043214C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134349056;
    v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[%{public}p] Deallocating", buf, 0xCu);
  }

  os_activity_scope_leave(&state);
  v7.receiver = self;
  v7.super_class = (Class)RoutePlanningSession;
  -[RoutePlanningSession dealloc](&v7, "dealloc");
}

- (GEOAdvisoriesInfo)advisoriesInfo
{
  GEOAdvisoriesInfo *v3;

  if ((id)-[RoutePlanningSession currentTransportType](self, "currentTransportType") == (id)1)
    v3 = self->_advisoryInfo;
  else
    v3 = 0;
  return v3;
}

- (NSString)description
{
  NSString *v3;
  void *v4;
  unint64_t v5;
  const __CFString *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)RoutePlanningSession;
  v3 = -[RoutePlanningSession description](&v9, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = -[RoutePlanningSession sessionInitiator](self, "sessionInitiator");
  if (v5 - 1 > 7)
    v6 = CFSTR("Unknown");
  else
    v6 = off_1011E8600[v5 - 1];
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: initiator: %@"), v4, v6));

  return (NSString *)v7;
}

- (NSString)originName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession configuration](self, "configuration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "originWaypointRequest"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession resolvedWaypoints](self, "resolvedWaypoints"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "origin"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "nameWithResolvedWaypoint:allowCurrentLocation:", v6, 1));

  return (NSString *)v7;
}

- (NSString)destinationName
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t IsEnabled_Maps420;
  uint64_t v7;
  uint64_t IsEnabled_DrivingMultiWaypointRoutes;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession configuration](self, "configuration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "waypointRequests"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession resolvedWaypoints](self, "resolvedWaypoints"));
  IsEnabled_Maps420 = -[RoutePlanningSession currentTransportType](self, "currentTransportType");
  switch(IsEnabled_Maps420)
  {
    case 0:
      IsEnabled_DrivingMultiWaypointRoutes = MapsFeature_IsEnabled_DrivingMultiWaypointRoutes(IsEnabled_Maps420, v7);
      if ((IsEnabled_DrivingMultiWaypointRoutes & 1) != 0)
        goto LABEL_10;
      IsEnabled_Maps420 = MapsFeature_IsEnabled_Maps420(IsEnabled_DrivingMultiWaypointRoutes);
      if ((IsEnabled_Maps420 & 1) != 0)
        goto LABEL_10;
      goto LABEL_4;
    case 1:
      if ((MapsFeature_IsEnabled_DrivingMultiWaypointRoutes(IsEnabled_Maps420, v7) & 1) != 0)
        goto LABEL_10;
      goto LABEL_9;
    case 2:
LABEL_4:
      if ((MapsFeature_IsEnabled_Maps182(IsEnabled_Maps420) & 1) != 0)
        goto LABEL_10;
      goto LABEL_9;
    case 5:
      if ((MapsFeature_IsEnabled_Maps420(IsEnabled_Maps420) & 1) == 0)
        goto LABEL_9;
      goto LABEL_10;
    default:
LABEL_9:
      if ((unint64_t)objc_msgSend(v4, "count") > 2)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", 1));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "waypointAtIndex:", 1));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "nameWithResolvedWaypoint:allowCurrentLocation:", v10, 0));
      }
      else
      {
LABEL_10:
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession configuration](self, "configuration"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "destinationWaypointRequest"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "destination"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "nameWithResolvedWaypoint:allowCurrentLocation:", v11, 0));

      }
      return (NSString *)v12;
  }
}

- (void)setNavigationStateMonitoringTask:(id)a3
{
  objc_storeStrong((id *)&self->_navigationStateMonitoringTask, a3);
}

- (id)routeCollectionResultForTransportType:(int64_t)a3
{
  void *v5;
  unsigned int v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  _QWORD v11[7];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession configuration](self, "configuration"));
  v6 = objc_msgSend(v5, "hasTransportType:", a3);

  if (!v6)
    return 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_100BD8B44;
  v16 = sub_100BD8B54;
  v17 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession resolvedWaypointsResult](self, "resolvedWaypointsResult"));
  v10[4] = &v12;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100BD8B5C;
  v11[3] = &unk_1011E8468;
  v11[4] = self;
  v11[5] = &v12;
  v11[6] = a3;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100BD8C50;
  v10[3] = &unk_1011B17D0;
  objc_msgSend(v7, "withValue:orError:", v11, v10);

  v8 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v8;
}

- (id)routeCollectionForTransportType:(int64_t)a3
{
  void *v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_100BD8B44;
  v11 = sub_100BD8B54;
  v12 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession routeCollectionResultForTransportType:](self, "routeCollectionResultForTransportType:", a3));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100BD8D6C;
  v6[3] = &unk_1011B58C0;
  v6[4] = &v7;
  objc_msgSend(v3, "withValue:orError:", v6, &stru_1011E8488);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)purgeRouteCollectionForTransportType:(int64_t)a3
{
  NSObject *v5;
  const char *label;
  const char *v7;
  int v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  char *v13;
  NSObject *v14;
  _QWORD v15[6];
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;

  v5 = objc_claimAutoreleasedReturnValue(-[RoutePlanningSession isolationQueue](self, "isolationQueue"));
  label = dispatch_queue_get_label(v5);
  v7 = dispatch_queue_get_label(0);
  if (label == v7)
  {

LABEL_7:
    v9 = sub_1004318FC();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = objc_claimAutoreleasedReturnValue(-[RoutePlanningSession isolationQueue](self, "isolationQueue"));
      *(_DWORD *)buf = 136316162;
      v17 = "-[RoutePlanningSession purgeRouteCollectionForTransportType:]";
      v18 = 2080;
      v19 = "RoutePlanningSession.m";
      v20 = 1024;
      v21 = 215;
      v22 = 2080;
      v23 = "self.isolationQueue";
      v24 = 2080;
      v25 = dispatch_queue_get_label(v11);
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion not on queue failed: %s/%s", buf, 0x30u);

    }
    if (sub_100A70734())
    {
      v12 = sub_1004318FC();
      v5 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v13 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v17 = v13;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  if (!label || !v7)
  {
LABEL_12:

    goto LABEL_13;
  }
  v8 = strcmp(label, v7);

  if (!v8)
    goto LABEL_7;
LABEL_13:
  v14 = objc_claimAutoreleasedReturnValue(-[RoutePlanningSession isolationQueue](self, "isolationQueue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100BD8F90;
  v15[3] = &unk_1011AD518;
  v15[4] = self;
  v15[5] = a3;
  dispatch_sync(v14, v15);

}

- (NSDictionary)waypointRequestResults
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession waypointController](self, "waypointController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "waypointRequestResults"));

  return (NSDictionary *)v3;
}

- (Result)resolvedWaypointsResult
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession waypointController](self, "waypointController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "resolvedWaypointSetResult"));

  return (Result *)v3;
}

- (WaypointSet)resolvedWaypoints
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_100BD8B44;
  v10 = sub_100BD8B54;
  v11 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession resolvedWaypointsResult](self, "resolvedWaypointsResult"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100BD913C;
  v5[3] = &unk_1011B7630;
  v5[4] = &v6;
  objc_msgSend(v2, "withValue:orError:", v5, &stru_1011E84A8);

  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (WaypointSet *)v3;
}

- (Result)currentRouteCollectionResult
{
  return (Result *)-[RoutePlanningSession routeCollectionResultForTransportType:](self, "routeCollectionResultForTransportType:", -[RoutePlanningSession currentTransportType](self, "currentTransportType"));
}

- (RouteCollection)currentRouteCollection
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_100BD8B44;
  v10 = sub_100BD8B54;
  v11 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession currentRouteCollectionResult](self, "currentRouteCollectionResult"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100BD9254;
  v5[3] = &unk_1011B58C0;
  v5[4] = &v6;
  objc_msgSend(v2, "withValue:orError:", v5, &stru_1011E84C8);

  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (RouteCollection *)v3;
}

- (int64_t)navigationTypeForCurrentRoute
{
  void *v2;
  void *v3;
  id v4;
  int64_t v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession currentRouteCollection](self, "currentRouteCollection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentRoute"));
  v4 = objc_msgSend(v3, "suggestedNavigationModeForLocation:context:", 0, 0);

  v5 = 4;
  if (v4 == (id)2)
    v5 = 2;
  if (v4 == (id)1)
    return 3;
  else
    return v5;
}

- (void)updateRouteCollectionResult:(id)a3 forTransportType:(int64_t)a4
{
  char *v6;
  unint64_t v7;
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  const __CFString *v11;
  const __CFString *v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  NSObject *v16;
  char *v17;
  id v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  _QWORD block[5];
  char *v25;
  int64_t v26;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  RoutePlanningSession *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  _QWORD v33[2];

  v6 = (char *)a3;
  if (!v6)
  {
    v18 = sub_1004318FC();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v29 = (RoutePlanningSession *)"-[RoutePlanningSession updateRouteCollectionResult:forTransportType:]";
      v30 = 2080;
      v31 = "RoutePlanningSession.m";
      v32 = 1024;
      LODWORD(v33[0]) = 274;
      WORD2(v33[0]) = 2080;
      *(_QWORD *)((char *)v33 + 6) = "routeCollectionResult != nil";
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v20 = sub_1004318FC();
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v29 = (RoutePlanningSession *)v22;
        v23 = (void *)v22;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_activity, &state);
  v7 = -[RoutePlanningSession sessionInitiator](self, "sessionInitiator");
  v8 = sub_10043214C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v7 == 6)
  {
    if (v10)
    {
      if ((unint64_t)(a4 - 1) > 4)
        v11 = CFSTR("Undefined");
      else
        v11 = off_1011E8640[a4 - 1];
      *(_DWORD *)buf = 134349314;
      v29 = self;
      v30 = 2112;
      v31 = (const char *)v11;
      v13 = "[%{public}p] Updating route collection for transport type:(%@)";
      v14 = v9;
      v15 = 22;
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v13, buf, v15);
    }
  }
  else if (v10)
  {
    if ((unint64_t)(a4 - 1) > 4)
      v12 = CFSTR("Undefined");
    else
      v12 = off_1011E8640[a4 - 1];
    *(_DWORD *)buf = 134349571;
    v29 = self;
    v30 = 2113;
    v31 = v6;
    v32 = 2112;
    v33[0] = v12;
    v13 = "[%{public}p] Updating route collection result:(%{private}@) for transport type:(%@)";
    v14 = v9;
    v15 = 32;
    goto LABEL_13;
  }

  v16 = objc_claimAutoreleasedReturnValue(-[RoutePlanningSession isolationQueue](self, "isolationQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100BD95F0;
  block[3] = &unk_1011B15B0;
  v25 = v6;
  v26 = a4;
  block[4] = self;
  v17 = v6;
  dispatch_async(v16, block);

  os_activity_scope_leave(&state);
}

- (void)_notifyObserversDidUpdateRouteCollectionResult:(id)a3 forTransportType:(int64_t)a4
{
  id v5;
  _QWORD block[5];
  id v7;
  int64_t v8;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100BD9708;
  block[3] = &unk_1011B15B0;
  block[4] = self;
  v7 = a3;
  v8 = a4;
  v5 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)safelySetCurrentTransportType:(int64_t)a3
{
  const char *label;
  const char *v6;
  BOOL v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  const char *v11;
  id v12;
  NSObject *v13;
  char *v14;
  _QWORD v15[6];
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;

  label = dispatch_queue_get_label((dispatch_queue_t)self->_isolationQueue);
  v6 = dispatch_queue_get_label(0);
  if (label == v6 || (label ? (v7 = v6 == 0) : (v7 = 1), !v7 && !strcmp(label, v6)))
  {
    v9 = sub_1004318FC();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = dispatch_queue_get_label((dispatch_queue_t)self->_isolationQueue);
      *(_DWORD *)buf = 136316162;
      v17 = "-[RoutePlanningSession safelySetCurrentTransportType:]";
      v18 = 2080;
      v19 = "RoutePlanningSession.m";
      v20 = 1024;
      v21 = 304;
      v22 = 2080;
      v23 = "_isolationQueue";
      v24 = 2080;
      v25 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion not on queue failed: %s/%s", buf, 0x30u);
    }

    if (sub_100A70734())
    {
      v12 = sub_1004318FC();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v17 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  v8 = objc_claimAutoreleasedReturnValue(-[RoutePlanningSession isolationQueue](self, "isolationQueue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100BD9964;
  v15[3] = &unk_1011AD518;
  v15[4] = self;
  v15[5] = a3;
  dispatch_sync(v8, v15);

}

- (void)setCurrentTransportType:(int64_t)a3
{
  -[RoutePlanningSession setCurrentTransportType:userInitiated:](self, "setCurrentTransportType:userInitiated:", a3, 1);
}

- (void)setCurrentTransportType:(int64_t)a3 userInitiated:(BOOL)a4
{
  _BOOL4 v4;
  const char *label;
  const char *v8;
  BOOL v9;
  id v10;
  NSObject *v11;
  unint64_t v12;
  const __CFString *v13;
  const __CFString *v14;
  void *v15;
  unsigned __int8 v16;
  unint64_t currentTransportType;
  id v18;
  NSObject *v19;
  RAPGraphDirectionsRecorder *v20;
  RAPGraphDirectionsRecorder *v21;
  RAPGraphDirectionsRecorder *v22;
  RAPGraphDirectionsRecorder *reportAProblemRecorder;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  _BOOL4 v36;
  void *v37;
  BOOL v38;
  void *v39;
  void *v40;
  unsigned __int8 v41;
  id v42;
  id v43;
  NSObject *v44;
  id v45;
  NSObject *v46;
  const char *v47;
  const char *v48;
  id v49;
  NSObject *v50;
  uint64_t v51;
  void *v52;
  id v53;
  NSObject *v54;
  id v55;
  NSObject *v56;
  uint64_t v57;
  void *v58;
  _QWORD v59[5];
  BOOL v60;
  _QWORD block[4];
  RAPGraphDirectionsRecorder *v62;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  RoutePlanningSession *v65;
  __int16 v66;
  const char *v67;
  __int16 v68;
  _BYTE v69[14];
  __int16 v70;
  const char *v71;
  __int16 v72;
  const char *v73;

  v4 = a4;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_activity, &state);
  label = dispatch_queue_get_label((dispatch_queue_t)self->_isolationQueue);
  v8 = dispatch_queue_get_label(0);
  if (label != v8)
  {
    v9 = !label || v8 == 0;
    if (v9 || strcmp(label, v8))
    {
      v45 = sub_1004318FC();
      v46 = objc_claimAutoreleasedReturnValue(v45);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        v47 = dispatch_queue_get_label((dispatch_queue_t)self->_isolationQueue);
        v48 = dispatch_queue_get_label(0);
        *(_DWORD *)buf = 136316418;
        v65 = (RoutePlanningSession *)"-[RoutePlanningSession setCurrentTransportType:userInitiated:]";
        v66 = 2080;
        v67 = "RoutePlanningSession.m";
        v68 = 1024;
        *(_DWORD *)v69 = 318;
        *(_WORD *)&v69[4] = 2080;
        *(_QWORD *)&v69[6] = "_isolationQueue";
        v70 = 2080;
        v71 = v47;
        v72 = 2080;
        v73 = v48;
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          buf,
          0x3Au);
      }

      if (sub_100A70734())
      {
        v49 = sub_1004318FC();
        v50 = objc_claimAutoreleasedReturnValue(v49);
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          v51 = objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          *(_DWORD *)buf = 138412290;
          v65 = (RoutePlanningSession *)v51;
          v52 = (void *)v51;
          _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

        }
      }
    }
  }
  v10 = sub_10043214C();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = self->_currentTransportType - 1;
    if (v12 > 4)
      v13 = CFSTR("Undefined");
    else
      v13 = off_1011E8640[v12];
    if ((unint64_t)(a3 - 1) > 4)
      v14 = CFSTR("Undefined");
    else
      v14 = off_1011E8640[a3 - 1];
    *(_DWORD *)buf = 134349826;
    v65 = self;
    v66 = 2112;
    v67 = (const char *)v13;
    v68 = 2112;
    *(_QWORD *)v69 = v14;
    *(_WORD *)&v69[8] = 1024;
    *(_DWORD *)&v69[10] = v4;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[%{public}p] changing transport type from %@ to %@, userInitiated:%d", buf, 0x26u);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession configuration](self, "configuration"));
  v16 = objc_msgSend(v15, "hasTransportType:", a3);

  if ((v16 & 1) == 0)
  {
    v53 = sub_1004318FC();
    v54 = objc_claimAutoreleasedReturnValue(v53);
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v65 = (RoutePlanningSession *)"-[RoutePlanningSession setCurrentTransportType:userInitiated:]";
      v66 = 2080;
      v67 = "RoutePlanningSession.m";
      v68 = 1024;
      *(_DWORD *)v69 = 321;
      *(_WORD *)&v69[4] = 2080;
      *(_QWORD *)&v69[6] = "[self.configuration hasTransportType:newTransportType]";
      _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v55 = sub_1004318FC();
      v56 = objc_claimAutoreleasedReturnValue(v55);
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      {
        v57 = objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v65 = (RoutePlanningSession *)v57;
        v58 = (void *)v57;
        _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  currentTransportType = self->_currentTransportType;
  if (currentTransportType != a3)
  {
    if (currentTransportType > 4 || ((1 << currentTransportType) & 0x19) == 0)
    {
      v20 = self->_reportAProblemRecorder;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100BDA188;
      block[3] = &unk_1011AC860;
      v62 = v20;
      v21 = v20;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    }
    v22 = objc_alloc_init(RAPGraphDirectionsRecorder);
    reportAProblemRecorder = self->_reportAProblemRecorder;
    self->_reportAProblemRecorder = v22;

    if ((unint64_t)a3 > 4 || ((1 << a3) & 0x19) == 0)
      -[RAPGraphDirectionsRecorder startRecording](self->_reportAProblemRecorder, "startRecording");
    if (v4)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[GEOCompanionRouteContext context](GEOCompanionRouteContext, "context"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession configuration](self, "configuration"));
      objc_msgSend(v25, "setCompanionContext:", v24);

    }
    self->_currentTransportType = a3;
    v59[0] = _NSConcreteStackBlock;
    v59[1] = 3221225472;
    v59[2] = sub_100BDA190;
    v59[3] = &unk_1011ACE58;
    v59[4] = self;
    v60 = v4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v59);
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession transportTypeToRouteCollectionResultsMap](self, "transportTypeToRouteCollectionResultsMap"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", self->_currentTransportType));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", v27));

    if (v28)
    {
      if ((objc_msgSend(v28, "isSuccess") & 1) != 0)
      {
LABEL_40:
        -[RoutePlanningSession _updateLoadingControllerForRealtimeUpdates](self, "_updateLoadingControllerForRealtimeUpdates");

        goto LABEL_41;
      }
      v29 = sub_10043214C();
      v30 = objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134349056;
        v65 = self;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "[%{public}p] Previous attempt to fetch routes for this transport type failed; trying again",
          buf,
          0xCu);
      }

      v31 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession transportTypeToRouteCollectionResultsMap](self, "transportTypeToRouteCollectionResultsMap"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", self->_currentTransportType));
      objc_msgSend(v31, "removeObjectForKey:", v32);

      v33 = objc_claimAutoreleasedReturnValue(-[RoutePlanningSession routeLoadingController](self, "routeLoadingController"));
      -[NSObject refreshRoutesForTransportType:](v33, "refreshRoutesForTransportType:", -[RoutePlanningSession currentTransportType](self, "currentTransportType"));
LABEL_39:

      goto LABEL_40;
    }
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession configuration](self, "configuration"));
    if ((objc_msgSend(v34, "areInitialRoutesBeingFetchedExternally") & 1) != 0)
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession resolvedWaypointsResult](self, "resolvedWaypointsResult"));
      v36 = v35 == 0;

      if (v36)
      {
        v33 = objc_claimAutoreleasedReturnValue(-[RoutePlanningSession configuration](self, "configuration"));
        -[NSObject setInitialRoutesBeingFetchedExternally:](v33, "setInitialRoutesBeingFetchedExternally:", 0);
        goto LABEL_39;
      }
    }
    else
    {

    }
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession resolvedWaypoints](self, "resolvedWaypoints"));
    v38 = v37 == 0;

    if (v38)
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession resolvedWaypointsResult](self, "resolvedWaypointsResult"));
      if (v39
        && (v40 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession resolvedWaypointsResult](self, "resolvedWaypointsResult")),
            v41 = objc_msgSend(v40, "isSuccess"),
            v40,
            v39,
            (v41 & 1) == 0))
      {
        v43 = sub_10043214C();
        v44 = objc_claimAutoreleasedReturnValue(v43);
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134349056;
          v65 = self;
          _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "[%{public}p] Previous attempt to fetch waypoints failed; trying again",
            buf,
            0xCu);
        }

        v33 = objc_claimAutoreleasedReturnValue(-[RoutePlanningSession waypointController](self, "waypointController"));
        -[NSObject refresh](v33, "refresh");
      }
      else
      {
        v42 = sub_10043214C();
        v33 = objc_claimAutoreleasedReturnValue(v42);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134349056;
          v65 = self;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "[%{public}p] Previous attempt to fetch waypoints is still in progress; waiting for it to finish",
            buf,
            0xCu);
        }
      }
    }
    else
    {
      v33 = objc_claimAutoreleasedReturnValue(-[RoutePlanningSession routeLoadingController](self, "routeLoadingController"));
      -[NSObject refreshRoutesForTransportType:](v33, "refreshRoutesForTransportType:", -[RoutePlanningSession currentTransportType](self, "currentTransportType"));
    }
    goto LABEL_39;
  }
  v18 = sub_10043214C();
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349056;
    v65 = self;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "[%{public}p] No difference detected in transport type; ignoring request",
      buf,
      0xCu);
  }

LABEL_41:
  os_activity_scope_leave(&state);
}

- (void)setSelectedRouteIndex:(unint64_t)a3 forTransportType:(int64_t)a4
{
  id v7;
  NSObject *v8;
  os_signpost_id_t v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD *v26;
  const char *label;
  const char *v28;
  void *v29;
  id v30;
  NSObject *v31;
  id v32;
  NSObject *v33;
  char *v34;
  id v35;
  NSObject *v36;
  id v37;
  NSObject *v38;
  char *v39;
  _QWORD v40[2];
  void (*v41)(uint64_t);
  void *v42;
  RoutePlanningSession *v43;
  id v44;
  id v45;
  int64_t v46;
  os_signpost_id_t v47;
  _QWORD block[5];
  id v49;
  int64_t v50;
  _QWORD v51[5];
  os_activity_scope_state_s state;
  uint8_t v53[4];
  const char *v54;
  __int16 v55;
  const char *v56;
  __int16 v57;
  int v58;
  __int16 v59;
  const char *v60;
  _BYTE buf[24];
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;

  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_activity, &state);
  v7 = sub_10043214C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = os_signpost_id_generate(v8);

  v10 = sub_10043214C();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = v11;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_BEGIN, v9, "SetSelectedRoute", ", buf, 2u);
  }

  v13 = sub_10043214C();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)(a4 - 1) > 4)
      v15 = CFSTR("Undefined");
    else
      v15 = off_1011E8640[a4 - 1];
    *(_DWORD *)buf = 134349570;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = a3;
    *(_WORD *)&buf[22] = 2112;
    v62 = (uint64_t (*)(uint64_t, uint64_t))v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[%{public}p] set selected routeIndex=%ld for transport type=%@", buf, 0x20u);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession routeCollectionResultForTransportType:](self, "routeCollectionResultForTransportType:", a4));
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v62 = sub_100BD8B44;
  v63 = sub_100BD8B54;
  v64 = 0;
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472;
  v51[2] = sub_100BDA814;
  v51[3] = &unk_1011B58C0;
  v51[4] = buf;
  objc_msgSend(v16, "withValue:orError:", v51, &stru_1011E84E8);
  if (!*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
  {
    v30 = sub_1004318FC();
    v31 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v53 = 136315906;
      v54 = "-[RoutePlanningSession setSelectedRouteIndex:forTransportType:]";
      v55 = 2080;
      v56 = "RoutePlanningSession.m";
      v57 = 1024;
      v58 = 393;
      v59 = 2080;
      v60 = "routeCollection != nil";
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", v53, 0x26u);
    }

    if (sub_100A70734())
    {
      v32 = sub_1004318FC();
      v33 = objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        v34 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)v53 = 138412290;
        v54 = v34;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%@", v53, 0xCu);

      }
    }
  }
  if ((unint64_t)objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "count") <= a3)
  {
    v35 = sub_1004318FC();
    v36 = objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v53 = 136315906;
      v54 = "-[RoutePlanningSession setSelectedRouteIndex:forTransportType:]";
      v55 = 2080;
      v56 = "RoutePlanningSession.m";
      v57 = 1024;
      v58 = 394;
      v59 = 2080;
      v60 = "newIndex < routeCollection.count";
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", v53, 0x26u);
    }

    if (sub_100A70734())
    {
      v37 = sub_1004318FC();
      v38 = objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        v39 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)v53 = 138412290;
        v54 = v39;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "%@", v53, 0xCu);

      }
    }
  }
  v17 = *(void **)(*(_QWORD *)&buf[8] + 40);
  if (v17
    && (unint64_t)objc_msgSend(v17, "count") > a3
    && objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "currentRouteIndex") != (id)a3)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "routeCollectionByChangingCurrentRouteIndex:", a3));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[Result resultWithValue:](Result, "resultWithValue:", v18));
    v20 = objc_claimAutoreleasedReturnValue(-[RoutePlanningSession isolationQueue](self, "isolationQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100BDA828;
    block[3] = &unk_1011B15B0;
    block[4] = self;
    v50 = a4;
    v21 = v19;
    v49 = v21;
    dispatch_sync(v20, block);

    v22 = &_dispatch_main_q;
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v41 = sub_100BDA88C;
    v42 = &unk_1011C7368;
    v43 = self;
    v23 = v18;
    v44 = v23;
    v24 = v21;
    v45 = v24;
    v46 = a4;
    v47 = v9;
    v25 = &_dispatch_main_q;
    v26 = v40;
    label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
    v28 = dispatch_queue_get_label(0);
    if (label == v28 || label && v28 && !strcmp(label, v28))
    {
      v29 = objc_autoreleasePoolPush();
      v41((uint64_t)v26);
      objc_autoreleasePoolPop(v29);
    }
    else
    {
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v26);
    }

  }
  _Block_object_dispose(buf, 8);

  os_activity_scope_leave(&state);
}

- (void)requestUpdatedRouteWithRefreshedOrigin:(BOOL)a3
{
  void *v4;
  const char *label;
  const char *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  char *v14;
  id v15;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  const char *v28;

  if (a3)
  {
    v15 = (id)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession waypointController](self, "waypointController"));
    objc_msgSend(v15, "refreshDynamicOrigin");

  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession resolvedWaypoints](self, "resolvedWaypoints"));

    if (v4)
    {
      label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
      v6 = dispatch_queue_get_label(0);
      if (label != v6 && (!label || !v6 || strcmp(label, v6)))
      {
        v10 = sub_1004318FC();
        v11 = objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316418;
          v18 = "-[RoutePlanningSession requestUpdatedRouteWithRefreshedOrigin:]";
          v19 = 2080;
          v20 = "RoutePlanningSession.m";
          v21 = 1024;
          v22 = 422;
          v23 = 2080;
          v24 = "dispatch_get_main_queue()";
          v25 = 2080;
          v26 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
          v27 = 2080;
          v28 = dispatch_queue_get_label(0);
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
            buf,
            0x3Au);

        }
        if (sub_100A70734())
        {
          v12 = sub_1004318FC();
          v13 = objc_claimAutoreleasedReturnValue(v12);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            v14 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
            *(_DWORD *)buf = 138412290;
            v18 = v14;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

          }
        }
      }
      v7 = objc_claimAutoreleasedReturnValue(-[RoutePlanningSession isolationQueue](self, "isolationQueue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100BDABFC;
      block[3] = &unk_1011AC860;
      block[4] = self;
      dispatch_sync(v7, block);

      -[RoutePlanningSession _updateIsInACustomRouteRegionForRouteCollection:](self, "_updateIsInACustomRouteRegionForRouteCollection:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession observers](self, "observers"));
      objc_msgSend(v8, "routePlanningSession:didUpdateRouteCollectionResult:forTransportType:", self, 0, -[RoutePlanningSession currentTransportType](self, "currentTransportType"));

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession waypointController](self, "waypointController"));
      objc_msgSend(v9, "rebroadcastWaypoints");

    }
  }
}

- (void)_updateLoadingControllerForRealtimeUpdates
{
  int64_t v3;
  void *v4;
  int64_t v5;
  id v6;

  if ((id)-[RoutePlanningSession sessionState](self, "sessionState") == (id)1)
  {
    v3 = -[RoutePlanningSession currentTransportType](self, "currentTransportType");
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession routeLoadingController](self, "routeLoadingController"));
    v6 = v4;
    v5 = v3;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession routeLoadingController](self, "routeLoadingController"));
    v6 = v4;
    v5 = 0;
  }
  objc_msgSend(v4, "setTransportTypeForRealtimeUpdates:", v5);

}

- (void)_updateIsInACustomRouteRegionForRouteCollection:(id)a3
{
  id v3;
  uint64_t BOOL;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  id v14;
  void *v16;
  _QWORD block[4];
  id v18;
  _QWORD *v19;
  id v20;
  id location;
  _QWORD v22[4];
  NSObject *v23;
  _QWORD *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[3];
  char v30;
  _BYTE v31[128];

  v3 = a3;
  BOOL = GEOConfigGetBOOL(MapsConfig_RouteCreationAvailable, off_1014B55A8);
  v16 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentRoute"));
  if (v5)
    v6 = BOOL;
  else
    v6 = 0;
  if (v6 == 1)
  {
    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x2020000000;
    v30 = 1;
    v7 = dispatch_group_create();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "waypoints"));
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v26 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
          dispatch_group_enter(v7);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "location"));
          v14 = &_dispatch_main_q;
          v22[0] = _NSConcreteStackBlock;
          v22[1] = 3221225472;
          v22[2] = sub_100BDAF6C;
          v22[3] = &unk_1011E8510;
          v24 = v29;
          v23 = v7;
          +[GEODirectionsService customRouteCreationSupportedForLocation:queue:handler:](GEODirectionsService, "customRouteCreationSupportedForLocation:queue:handler:", v13, &_dispatch_main_q, v22);

        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
      }
      while (v9);
    }

    objc_initWeak(&location, self);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100BDAF84;
    block[3] = &unk_1011E8538;
    objc_copyWeak(&v20, &location);
    v18 = v16;
    v19 = v29;
    dispatch_group_notify(v7, (dispatch_queue_t)&_dispatch_main_q, block);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);

    _Block_object_dispose(v29, 8);
  }
  else
  {
    -[RoutePlanningSession _setIsInACustomRouteRegion:](self, "_setIsInACustomRouteRegion:", BOOL);
  }

}

- (void)_setIsInACustomRouteRegion:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  NSObject *v6;
  _BOOL4 inACustomRouteRegion;
  void *v8;
  int v9;
  RoutePlanningSession *v10;
  __int16 v11;
  _BOOL4 v12;
  __int16 v13;
  _BOOL4 v14;

  if (self->_inACustomRouteRegion != a3)
  {
    v3 = a3;
    v5 = sub_10043214C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      inACustomRouteRegion = self->_inACustomRouteRegion;
      v9 = 134349568;
      v10 = self;
      v11 = 1024;
      v12 = inACustomRouteRegion;
      v13 = 1024;
      v14 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] changing isInACustomRouteRegion from %d to %d", (uint8_t *)&v9, 0x18u);
    }

    self->_inACustomRouteRegion = v3;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession observers](self, "observers"));
    objc_msgSend(v8, "routePlanningSession:didChangeRouteCreationRegion:", self, v3);

  }
}

- (void)addObserver:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  os_activity_scope_state_s v8;
  uint8_t buf[4];
  RoutePlanningSession *v10;
  __int16 v11;
  id v12;

  v4 = a3;
  v8.opaque[0] = 0;
  v8.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_activity, &v8);
  v5 = sub_10043214C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349314;
    v10 = self;
    v11 = 2112;
    v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[%{public}p] adding observer %@", buf, 0x16u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession observers](self, "observers"));
  objc_msgSend(v7, "registerObserver:", v4);

  os_activity_scope_leave(&v8);
}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  os_activity_scope_state_s v8;
  uint8_t buf[4];
  RoutePlanningSession *v10;
  __int16 v11;
  id v12;

  v4 = a3;
  v8.opaque[0] = 0;
  v8.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_activity, &v8);
  v5 = sub_10043214C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349314;
    v10 = self;
    v11 = 2112;
    v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[%{public}p] remove observer %@", buf, 0x16u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession observers](self, "observers"));
  objc_msgSend(v7, "unregisterObserver:", v4);

  os_activity_scope_leave(&v8);
}

- (void)resume
{
  id v3;
  NSObject *v4;
  unint64_t v5;
  const __CFString *v6;
  const char *label;
  const char *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  unsigned int v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  _BOOL4 v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  const char *v30;
  const char *v31;
  id v32;
  NSObject *v33;
  RoutePlanningSession *v34;
  _QWORD v35[4];
  id v36;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  RoutePlanningSession *v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  int v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  const char *v47;
  __int16 v48;
  const char *v49;

  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_activity, &state);
  v3 = sub_10043214C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = -[RoutePlanningSession sessionState](self, "sessionState");
    v6 = CFSTR("NotStarted");
    if (v5 == 1)
      v6 = CFSTR("Running");
    if (v5 == 2)
      v6 = CFSTR("Suspended");
    *(_DWORD *)buf = 134349314;
    v39 = self;
    v40 = 2112;
    v41 = (const char *)v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[%{public}p] resume requested state=%@", buf, 0x16u);
  }

  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v8 = dispatch_queue_get_label(0);
  if (label != v8 && (!label || !v8 || strcmp(label, v8)))
  {
    v28 = sub_1004318FC();
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v30 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
      v31 = dispatch_queue_get_label(0);
      *(_DWORD *)buf = 136316418;
      v39 = (RoutePlanningSession *)"-[RoutePlanningSession resume]";
      v40 = 2080;
      v41 = "RoutePlanningSession.m";
      v42 = 1024;
      v43 = 506;
      v44 = 2080;
      v45 = "dispatch_get_main_queue()";
      v46 = 2080;
      v47 = v30;
      v48 = 2080;
      v49 = v31;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
        buf,
        0x3Au);

    }
    if (sub_100A70734())
    {
      v32 = sub_1004318FC();
      v33 = objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        v34 = (RoutePlanningSession *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v39 = v34;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  if ((id)-[RoutePlanningSession sessionState](self, "sessionState") != (id)1)
  {
    v9 = -[RoutePlanningSession sessionState](self, "sessionState");
    -[RoutePlanningSession setSessionState:](self, "setSessionState:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    -[RoutePlanningSession setStartDate:](self, "setStartDate:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession observers](self, "observers"));
    objc_msgSend(v11, "mapsSession:didChangeState:", self, -[RoutePlanningSession sessionState](self, "sessionState"));

    -[RoutePlanningSession _updateLoadingControllerForRealtimeUpdates](self, "_updateLoadingControllerForRealtimeUpdates");
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession configuration](self, "configuration"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "locationManager"));
    if ((objc_msgSend(v13, "isLocationServicesDenied") & 1) != 0)
    {
      v14 = 0;
    }
    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession configuration](self, "configuration"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "locationManager"));
      v17 = objc_msgSend(v16, "isLocationServicesRestricted");

      v14 = v17 ^ 1;
    }

    if (!v9)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession configuration](self, "configuration"));
      v19 = objc_msgSend(v18, "isNavigationTracePlayback");

      v20 = sub_10043214C();
      v21 = objc_claimAutoreleasedReturnValue(v20);
      v22 = v21;
      if (v19)
      {
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134349056;
          v39 = self;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "[%{public}p] Playing navtrace; not waiting for accurate location",
            buf,
            0xCu);
        }
LABEL_29:

        v27 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession waypointController](self, "waypointController"));
        objc_msgSend(v27, "start");

        goto LABEL_30;
      }
      v23 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
      if (!v14)
      {
        if (v23)
        {
          *(_DWORD *)buf = 134349056;
          v39 = self;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "[%{public}p] Location access isn't available; continuing with waypoint resolution",
            buf,
            0xCu);
        }
        goto LABEL_29;
      }
      if (v23)
      {
        *(_DWORD *)buf = 134349056;
        v39 = self;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "[%{public}p] Waiting for accurate location before resolving waypoints", buf, 0xCu);
      }

      self->_waitingForAccurateLocationUpdate = 1;
      if (self->_sessionInitiator == 4)
        v24 = 5.0;
      else
        v24 = 10.0;
      objc_initWeak((id *)buf, self);
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession configuration](self, "configuration"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "locationManager"));
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = sub_100BDB898;
      v35[3] = &unk_1011AD260;
      objc_copyWeak(&v36, (id *)buf);
      objc_msgSend(v26, "waitForAccurateLocationWithTimeout:handler:", v35, v24);

      objc_destroyWeak(&v36);
      objc_destroyWeak((id *)buf);
    }
  }
LABEL_30:
  os_activity_scope_leave(&state);
}

- (void)suspend
{
  id v3;
  NSObject *v4;
  unint64_t v5;
  const __CFString *v6;
  const char *label;
  const char *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  const char *v14;
  const char *v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  id v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  id v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  os_activity_scope_state_s v28;
  uint8_t buf[4];
  RoutePlanningSession *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  const char *v40;

  v28.opaque[0] = 0;
  v28.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_activity, &v28);
  v3 = sub_10043214C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = -[RoutePlanningSession sessionState](self, "sessionState");
    v6 = CFSTR("NotStarted");
    if (v5 == 1)
      v6 = CFSTR("Running");
    if (v5 == 2)
      v6 = CFSTR("Suspended");
    *(_DWORD *)buf = 134349314;
    v30 = self;
    v31 = 2112;
    v32 = (const char *)v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[%{public}p] suspend requested state=%@", buf, 0x16u);
  }

  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v8 = dispatch_queue_get_label(0);
  if (label != v8 && (!label || !v8 || strcmp(label, v8)))
  {
    v12 = sub_1004318FC();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
      v15 = dispatch_queue_get_label(0);
      *(_DWORD *)buf = 136316418;
      v30 = (RoutePlanningSession *)"-[RoutePlanningSession suspend]";
      v31 = 2080;
      v32 = "RoutePlanningSession.m";
      v33 = 1024;
      v34 = 556;
      v35 = 2080;
      v36 = "dispatch_get_main_queue()";
      v37 = 2080;
      v38 = (uint64_t)v14;
      v39 = 2080;
      v40 = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
        buf,
        0x3Au);

    }
    if (sub_100A70734())
    {
      v16 = sub_1004318FC();
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v30 = (RoutePlanningSession *)v18;
        v19 = (void *)v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  if ((id)-[RoutePlanningSession sessionState](self, "sessionState") != (id)1)
  {
    v20 = sub_1004318FC();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Session state must be running before calling -suspend")));
      *(_DWORD *)buf = 136316162;
      v30 = (RoutePlanningSession *)"-[RoutePlanningSession suspend]";
      v31 = 2080;
      v32 = "RoutePlanningSession.m";
      v33 = 1024;
      v34 = 557;
      v35 = 2080;
      v36 = "self.sessionState == MapsSessionStateRunning";
      v37 = 2112;
      v38 = v22;
      v23 = (void *)v22;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s) '%@'", buf, 0x30u);

    }
    if (sub_100A70734())
    {
      v24 = sub_1004318FC();
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v26 = objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v30 = (RoutePlanningSession *)v26;
        v27 = (void *)v26;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  if ((id)-[RoutePlanningSession sessionState](self, "sessionState") == (id)1)
  {
    -[RoutePlanningSession setSessionState:](self, "setSessionState:", 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession waypointController](self, "waypointController"));
    objc_msgSend(v9, "stop");

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession routeLoadingController](self, "routeLoadingController"));
    objc_msgSend(v10, "cancelLoading");

    -[RoutePlanningSession _updateLoadingControllerForRealtimeUpdates](self, "_updateLoadingControllerForRealtimeUpdates");
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession observers](self, "observers"));
    objc_msgSend(v11, "mapsSession:didChangeState:", self, -[RoutePlanningSession sessionState](self, "sessionState"));

  }
  os_activity_scope_leave(&v28);
}

- (void)prepareToReplayCurrentState
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession observers](self, "observers"));
  objc_msgSend(v2, "snapshotCurrentObservers");

}

- (void)replayCurrentState
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession observers](self, "observers"));
  objc_msgSend(v3, "removeSnapshottedObservers");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession observers](self, "observers"));
  objc_msgSend(v4, "mapsSession:didChangeState:", self, -[RoutePlanningSession sessionState](self, "sessionState"));

  v5 = (id)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession observers](self, "observers"));
  objc_msgSend(v5, "restoreOriginalObservers");

}

- (void)cleanupStateReplay
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession observers](self, "observers"));
  objc_msgSend(v2, "clearSnapshottedObservers");

}

- (NSString)shortcutIdentifier
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession configuration](self, "configuration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "shortcutIdentifier"));

  return (NSString *)v3;
}

- (void)setShortcutIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  int v14;
  id v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession configuration](self, "configuration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "shortcutIdentifier"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession configuration](self, "configuration"));
  objc_msgSend(v7, "setShortcutIdentifier:", v4);

  if (v4)
  {
    v8 = sub_10043237C();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v14 = 138412290;
      v15 = v4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "RoutePlanningSession will use shortcut for autosharing: %@", (uint8_t *)&v14, 0xCu);
    }

    if (+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled"))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[MapsFavoritesManager sharedManager](_TtC4Maps20MapsFavoritesManager, "sharedManager"));
      objc_msgSend(v10, "registerObserver:", self);
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[ShortcutManager sharedManager](ShortcutManager, "sharedManager"));
      objc_msgSend(v10, "addObserver:", self);
    }

    -[RoutePlanningSession _refreshAutomaticSharingContactsFromShortcut](self, "_refreshAutomaticSharingContactsFromShortcut");
  }
  else if (v6)
  {
    v11 = sub_10043237C();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v14 = 138412290;
      v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "RoutePlanningSession will drop shortcut for autosharing: %@", (uint8_t *)&v14, 0xCu);
    }

    if (+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled"))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[MapsFavoritesManager sharedManager](_TtC4Maps20MapsFavoritesManager, "sharedManager"));
      objc_msgSend(v13, "unregisterObserver:", self);
    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[ShortcutManager sharedManager](ShortcutManager, "sharedManager"));
      objc_msgSend(v13, "removeObserver:", self);
    }

    -[RoutePlanningSession _setAutomaticSharingContacts:](self, "_setAutomaticSharingContacts:", 0);
  }

}

- (id)_favoriteWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  id v14;
  NSObject *v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  id v23;
  _BYTE v24[128];

  v3 = a3;
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MapsFavoritesManager sharedManager](_TtC4Maps20MapsFavoritesManager, "sharedManager"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "shortcuts"));

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v6 = v5;
    v7 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v19;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier", (_QWORD)v18));
          v13 = objc_msgSend(v12, "isEqualToString:", v3);

          if ((v13 & 1) != 0)
          {
            v16 = v11;
            v15 = v6;
            goto LABEL_14;
          }
        }
        v8 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
        if (v8)
          continue;
        break;
      }
    }

    v14 = sub_10043237C();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v3;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "RoutePlanningSession could not find favorite item for identifier: %@", buf, 0xCu);
    }
    v16 = 0;
LABEL_14:

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)_shortcutWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  uint64_t v13;
  void *v14;
  unsigned __int8 v15;
  id v16;
  NSObject *v17;
  id v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  id v25;
  _BYTE v26[128];

  v3 = a3;
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[ShortcutManager sharedManager](ShortcutManager, "sharedManager"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "meCard"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "shortcutsForAll"));

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v7 = v6;
    v8 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v21;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v21 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
          v13 = MapsSuggestionsShortcutUniqueIdentifier(v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
          v15 = objc_msgSend(v14, "isEqualToString:", v3, (_QWORD)v20);

          if ((v15 & 1) != 0)
          {
            v18 = v12;
            v17 = v7;
            goto LABEL_14;
          }
        }
        v9 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
        if (v9)
          continue;
        break;
      }
    }

    v16 = sub_10043237C();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v3;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "RoutePlanningSession could not find shortcut for identifier: %@", buf, 0xCu);
    }
    v18 = 0;
LABEL_14:

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (void)homeDataProvidingObjectDidUpdate:(id)a3
{
  id v4;
  NSObject *v5;
  GCDTimer *deferredShortcutsRefreshTimer;
  uint8_t v7[16];

  v4 = sub_10043237C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Me Card did change", v7, 2u);
  }

  -[GCDTimer invalidate](self->_deferredShortcutsRefreshTimer, "invalidate");
  deferredShortcutsRefreshTimer = self->_deferredShortcutsRefreshTimer;
  self->_deferredShortcutsRefreshTimer = 0;

  -[RoutePlanningSession _scheduleRefreshUserShortcuts](self, "_scheduleRefreshUserShortcuts");
}

- (void)shortcutManagerMeCardDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  GCDTimer *deferredShortcutsRefreshTimer;
  uint8_t v7[16];

  v4 = sub_10043237C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Me Card did change", v7, 2u);
  }

  -[GCDTimer invalidate](self->_deferredShortcutsRefreshTimer, "invalidate");
  deferredShortcutsRefreshTimer = self->_deferredShortcutsRefreshTimer;
  self->_deferredShortcutsRefreshTimer = 0;

  -[RoutePlanningSession _scheduleRefreshUserShortcuts](self, "_scheduleRefreshUserShortcuts");
}

- (void)_scheduleRefreshUserShortcuts
{
  GCDTimer *deferredShortcutsRefreshTimer;
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  GCDTimer *v8;
  GCDTimer *v9;
  _QWORD v10[4];
  id v11;
  id buf[2];

  deferredShortcutsRefreshTimer = self->_deferredShortcutsRefreshTimer;
  v4 = sub_10043237C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if (deferredShortcutsRefreshTimer)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "RoutePlanningSession already scheduled deferred shortcuts fetch", (uint8_t *)buf, 2u);
    }

  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "RoutePlanningSession scheduling deferred shortcuts fetch", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    v7 = &_dispatch_main_q;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100BDC7A4;
    v10[3] = &unk_1011AE190;
    objc_copyWeak(&v11, buf);
    v8 = (GCDTimer *)objc_claimAutoreleasedReturnValue(+[GCDTimer scheduledTimerWithTimeInterval:queue:block:](GCDTimer, "scheduledTimerWithTimeInterval:queue:block:", &_dispatch_main_q, v10, 0.0));
    v9 = self->_deferredShortcutsRefreshTimer;
    self->_deferredShortcutsRefreshTimer = v8;

    objc_destroyWeak(&v11);
    objc_destroyWeak(buf);
  }
}

- (void)_refreshAutomaticSharingContactsFromShortcut
{
  id v3;
  NSObject *v4;
  void *v5;
  BOOL v6;
  void *v7;
  id v8;
  NSObject *v9;
  dispatch_queue_global_t global_queue;
  NSObject *v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id location;
  uint8_t buf[4];
  void *v18;

  v3 = sub_10043237C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "RoutePlanningSession asked to refresh autoshare from shortcut but no shortcutIdentifier set, exiting early", buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession shortcutIdentifier](self, "shortcutIdentifier"));
  v6 = v5 == 0;

  if (!v6)
  {
    objc_initWeak(&location, self);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession shortcutIdentifier](self, "shortcutIdentifier"));
    v8 = sub_10043237C();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138477827;
      v18 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "RoutePlanningSession will refresh autoshare from shortcut %{private}@...", buf, 0xCu);
    }

    global_queue = dispatch_get_global_queue(25, 0);
    v11 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100BDC9A0;
    block[3] = &unk_1011AD1E8;
    objc_copyWeak(&v15, &location);
    v14 = v7;
    v12 = v7;
    dispatch_async(v11, block);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

- (NSArray)automaticSharingContacts
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession configuration](self, "configuration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "automaticSharingContacts"));

  return (NSArray *)v3;
}

- (void)setAutomaticSharingContacts:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint8_t v11[16];
  uint8_t buf[16];

  v4 = a3;
  v5 = sub_10043214C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Explicitly setting automatic sharing contacts...", buf, 2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession shortcutIdentifier](self, "shortcutIdentifier"));
  if (v7)
  {
    v8 = sub_10043237C();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "RoutePlanningSession implicitly clearing shortcutIdentifier", v11, 2u);
    }

    -[RoutePlanningSession _cancelFetchingCapabilitiesSharingContacts](self, "_cancelFetchingCapabilitiesSharingContacts");
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession configuration](self, "configuration"));
    objc_msgSend(v10, "setShortcutIdentifier:", 0);

  }
  -[RoutePlanningSession _setAutomaticSharingContacts:](self, "_setAutomaticSharingContacts:", v4);

}

- (void)_setAutomaticSharingContacts:(id)a3
{
  -[RoutePlanningSession _setAutomaticSharingContacts:forShortcutIdentifier:](self, "_setAutomaticSharingContacts:forShortcutIdentifier:", a3, 0);
}

- (void)_setAutomaticSharingContacts:(id)a3 forShortcutIdentifier:(id)a4
{
  id v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  unsigned __int8 v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  id v23;
  __int16 v24;
  id v25;

  v6 = a3;
  v7 = (unint64_t)a4;
  v8 = objc_claimAutoreleasedReturnValue(-[RoutePlanningSession shortcutIdentifier](self, "shortcutIdentifier"));
  v9 = (void *)v8;
  if (v7 | v8)
    v10 = objc_msgSend((id)v8, "isEqual:", v7);
  else
    v10 = 1;

  v13 = MSPSharedTripSharingAvailable(v11, v12);
  v14 = sub_10043214C();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  v16 = v15;
  if (!v13)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v22 = 134217984;
      v23 = objc_msgSend(v6, "count");
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Not setting automatic sharing contacts because sharing is not available (would have had %lu autosharing contacts)", (uint8_t *)&v22, 0xCu);
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession configuration](self, "configuration"));
    objc_msgSend(v18, "setAutomaticSharingContacts:", 0);
    goto LABEL_12;
  }
  if ((v10 & 1) != 0)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v22 = 134218242;
      v23 = objc_msgSend(v6, "count");
      v24 = 2112;
      v25 = v6;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Setting %lu automatic sharing contacts: %@", (uint8_t *)&v22, 0x16u);
    }

    -[RoutePlanningSession _cancelFetchingCapabilitiesSharingContacts](self, "_cancelFetchingCapabilitiesSharingContacts");
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession configuration](self, "configuration"));
    objc_msgSend(v17, "setAutomaticSharingContacts:", v6);

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripCapabilityLevelFetcher sharedFetcher](MSPSharedTripCapabilityLevelFetcher, "sharedFetcher"));
    objc_msgSend(v18, "requestCapabilityLevelsForContacts:", v6);
LABEL_12:

    v16 = objc_claimAutoreleasedReturnValue(-[RoutePlanningSession observers](self, "observers"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession configuration](self, "configuration"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "automaticSharingContacts"));
    -[NSObject routePlanningSession:didUpdateAutomaticSharingContacts:](v16, "routePlanningSession:didUpdateAutomaticSharingContacts:", self, v20);

    goto LABEL_13;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession shortcutIdentifier](self, "shortcutIdentifier"));
    v22 = 138478083;
    v23 = (id)v7;
    v24 = 2113;
    v25 = v21;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Not setting automatic sharing contacts, passed in shortcutIdentifier %{private}@ doesn't match current %{private}@", (uint8_t *)&v22, 0x16u);

  }
LABEL_13:

}

- (void)_cancelFetchingCapabilitiesSharingContacts
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession configuration](self, "configuration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "automaticSharingContacts"));

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripCapabilityLevelFetcher sharedFetcher](MSPSharedTripCapabilityLevelFetcher, "sharedFetcher", (_QWORD)v11));
        objc_msgSend(v10, "cancelCapabilityLevelRequestForContact:", v9);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (void)_handleReceivedWaypointSetResult
{
  id v3;
  id v4;
  _QWORD *v5;
  const char *label;
  const char *v7;
  BOOL v8;
  void *v9;
  _QWORD v10[2];
  void (*v11)(uint64_t);
  void *v12;
  RoutePlanningSession *v13;

  v3 = &_dispatch_main_q;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v11 = sub_100BDD21C;
  v12 = &unk_1011AC860;
  v13 = self;
  v4 = &_dispatch_main_q;
  v5 = v10;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v7 = dispatch_queue_get_label(0);
  if (label == v7 || (label ? (v8 = v7 == 0) : (v8 = 1), !v8 && !strcmp(label, v7)))
  {
    v9 = objc_autoreleasePoolPush();
    v11((uint64_t)v5);
    objc_autoreleasePoolPop(v9);
  }
  else
  {
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
  }

}

- (void)waypointController:(id)a3 didResolveWaypointSet:(id)a4
{
  id v6;
  id v7;
  const char *label;
  const char *v9;
  unint64_t v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  int64_t v14;
  const __CFString *v15;
  _QWORD *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  void *v32;
  double v33;
  CLLocationDegrees v34;
  CLLocationDegrees v35;
  CLLocationCoordinate2D v36;
  double v37;
  CLLocationDegrees v38;
  CLLocationDegrees v39;
  CLLocationCoordinate2D v40;
  _BOOL8 v41;
  id v42;
  NSObject *v43;
  id v44;
  NSObject *v45;
  RoutePlanningSession *v46;
  id v47;
  NSObject *v48;
  void *v49;
  char *v50;
  id v51;
  NSObject *v52;
  const char *v53;
  id v54;
  NSObject *v55;
  RoutePlanningSession *v56;
  _QWORD v57[4];
  _QWORD *v58;
  id v59;
  _QWORD v60[4];
  id v61;
  id v62;
  id location;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  RoutePlanningSession *v66;
  __int16 v67;
  const char *v68;
  __int16 v69;
  int v70;
  __int16 v71;
  const char *v72;
  __int16 v73;
  const char *v74;

  v6 = a3;
  v7 = a4;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_activity, &state);
  label = dispatch_queue_get_label((dispatch_queue_t)self->_isolationQueue);
  v9 = dispatch_queue_get_label(0);
  if (label == v9 || label && v9 && !strcmp(label, v9))
  {
    v51 = sub_1004318FC();
    v52 = objc_claimAutoreleasedReturnValue(v51);
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      v53 = dispatch_queue_get_label((dispatch_queue_t)self->_isolationQueue);
      *(_DWORD *)buf = 136316162;
      v66 = (RoutePlanningSession *)"-[RoutePlanningSession waypointController:didResolveWaypointSet:]";
      v67 = 2080;
      v68 = "RoutePlanningSession.m";
      v69 = 1024;
      v70 = 812;
      v71 = 2080;
      v72 = "_isolationQueue";
      v73 = 2080;
      v74 = v53;
      _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion not on queue failed: %s/%s", buf, 0x30u);
    }

    if (sub_100A70734())
    {
      v54 = sub_1004318FC();
      v55 = objc_claimAutoreleasedReturnValue(v54);
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      {
        v56 = (RoutePlanningSession *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v66 = v56;
        _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  v10 = -[RoutePlanningSession sessionState](self, "sessionState");
  v11 = sub_10043214C();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v13 = v12;
  if (v10 == 2)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v66 = self;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "[%{public}p] Ignoring waypoint update due to being paused", buf, 0xCu);
    }

  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v14 = -[RoutePlanningSession currentTransportType](self, "currentTransportType");
      if ((unint64_t)(v14 - 1) > 4)
        v15 = CFSTR("Undefined");
      else
        v15 = off_1011E8640[v14 - 1];
      *(_DWORD *)buf = 134349314;
      v66 = self;
      v67 = 2112;
      v68 = (const char *)v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[%{public}p] Received waypoints with initial transport type: %@", buf, 0x16u);
    }

    objc_initWeak(&location, self);
    v60[0] = _NSConcreteStackBlock;
    v60[1] = 3221225472;
    v60[2] = sub_100BDDDE0;
    v60[3] = &unk_1011E8560;
    objc_copyWeak(&v62, &location);
    v61 = v7;
    v16 = objc_retainBlock(v60);
    if (-[RoutePlanningSession currentTransportType](self, "currentTransportType"))
    {
      v17 = sub_10043214C();
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134349056;
        v66 = self;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[%{public}p] RoutePlanningSession was initialized with a valid transport type", buf, 0xCu);
      }

      ((void (*)(_QWORD *, int64_t))v16[2])(v16, -[RoutePlanningSession currentTransportType](self, "currentTransportType"));
    }
    else
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession platformController](self, "platformController"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "chromeViewController"));

      v21 = objc_opt_class(IOSBasedChromeViewController);
      if ((objc_opt_isKindOfClass(v20, v21) & 1) != 0)
        v22 = v20;
      else
        v22 = 0;
      v23 = v22;

      if (v23)
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession resolvedWaypoints](self, "resolvedWaypoints"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "origin"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "latLng"));

        v27 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession resolvedWaypoints](self, "resolvedWaypoints"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "destination"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "latLng"));

        v30 = sub_10043214C();
        v31 = objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134349056;
          v66 = self;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "[%{public}p] RoutePlanningSession was not initialized with a valid transport type; determining a default one now",
            buf,
            0xCu);
        }

        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "defaultTransportTypeFinder"));
        objc_msgSend(v26, "lat");
        v34 = v33;
        objc_msgSend(v26, "lng");
        v36 = CLLocationCoordinate2DMake(v34, v35);
        objc_msgSend(v29, "lat");
        v38 = v37;
        objc_msgSend(v29, "lng");
        v40 = CLLocationCoordinate2DMake(v38, v39);
        v41 = -[RoutePlanningSession ignoreMapType](self, "ignoreMapType");
        v57[0] = _NSConcreteStackBlock;
        v57[1] = 3221225472;
        v57[2] = sub_100BDE624;
        v57[3] = &unk_1011BFF60;
        objc_copyWeak(&v59, &location);
        v58 = v16;
        objc_msgSend(v32, "transportTypeForOrigin:destination:ignoreMapType:completion:", v41, v57, v36.latitude, v36.longitude, v40.latitude, v40.longitude);

        objc_destroyWeak(&v59);
      }
      else
      {
        v42 = sub_1004318FC();
        v43 = objc_claimAutoreleasedReturnValue(v42);
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v66 = (RoutePlanningSession *)"-[RoutePlanningSession waypointController:didResolveWaypointSet:]";
          v67 = 2080;
          v68 = "RoutePlanningSession.m";
          v69 = 1024;
          v70 = 877;
          _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
        }

        if (sub_100A70734())
        {
          v44 = sub_1004318FC();
          v45 = objc_claimAutoreleasedReturnValue(v44);
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          {
            v46 = (RoutePlanningSession *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
            *(_DWORD *)buf = 138412290;
            v66 = v46;
            _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

          }
        }
        v47 = sub_10043214C();
        v48 = objc_claimAutoreleasedReturnValue(v47);
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        {
          v49 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession platformController](self, "platformController"));
          v50 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "chromeViewController"));
          *(_DWORD *)buf = 134349314;
          v66 = self;
          v67 = 2112;
          v68 = v50;
          _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "[%{public}p] chrome view controller was not an iOS based one: %@; cannot determine default transport type",
            buf,
            0x16u);

        }
        ((void (*)(_QWORD *, int64_t))v16[2])(v16, -[RoutePlanningSession currentTransportType](self, "currentTransportType"));
      }

    }
    objc_destroyWeak(&v62);
    objc_destroyWeak(&location);
  }
  os_activity_scope_leave(&state);

}

- (void)routeLoadingController:(id)a3 didReceiveRoutesResult:(id)a4 forTransportType:(int64_t)a5 advisoryInfo:(id)a6
{
  id v10;
  id v11;
  RoutePlanningSession *v12;
  id v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  _BOOL4 v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  const __CFString *v21;
  void *v22;
  id v23;
  NSObject *v24;
  _QWORD v25[5];
  os_activity_scope_state_s state;
  uint8_t v27[4];
  RoutePlanningSession *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  const __CFString *v34;
  __int128 buf;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;

  v10 = a3;
  v11 = a4;
  v12 = (RoutePlanningSession *)a6;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_activity, &state);
  if ((id)-[RoutePlanningSession sessionState](self, "sessionState") == (id)2)
  {
    v13 = sub_10043214C();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 134349056;
      *(_QWORD *)((char *)&buf + 4) = self;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "[%{public}p] Ignoring routes update due to being paused", (uint8_t *)&buf, 0xCu);
    }

  }
  else
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v36 = 0x3032000000;
    v37 = sub_100BD8B44;
    v38 = sub_100BD8B54;
    v39 = 0;
    v15 = sub_10043214C();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);

    if (v17)
    {
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_100BDEA8C;
      v25[3] = &unk_1011B57F0;
      v25[4] = &buf;
      objc_msgSend(v11, "withValue:orError:", v25, &stru_1011E85A0);
      v18 = sub_10043214C();
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
        if ((unint64_t)(a5 - 1) > 4)
          v21 = CFSTR("Undefined");
        else
          v21 = off_1011E8640[a5 - 1];
        *(_DWORD *)v27 = 134349826;
        v28 = self;
        v29 = 2112;
        v30 = v10;
        v31 = 2112;
        v32 = v20;
        v33 = 2112;
        v34 = v21;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "[%{public}p] %@ received routes %@ (transport type=%@)", v27, 0x2Au);
      }

    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "map:", &stru_1011E85E0));
    if ((id)-[RoutePlanningSession currentTransportType](self, "currentTransportType") == (id)1)
      objc_storeStrong((id *)&self->_advisoryInfo, a6);
    v23 = sub_10043214C();
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v27 = 138412290;
      v28 = v12;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Advisory info receieved : %@", v27, 0xCu);
    }

    -[RoutePlanningSession updateRouteCollectionResult:forTransportType:](self, "updateRouteCollectionResult:forTransportType:", v22, a5);
    _Block_object_dispose(&buf, 8);

  }
  os_activity_scope_leave(&state);

}

- (void)routeLoadingController:(id)a3 didReceiveUpdates:(id)a4 forRoutesResult:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD block[5];
  id v17;
  id v18;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  RoutePlanningSession *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_activity, &state);
  v11 = sub_10043214C();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allKeys"));
    *(_DWORD *)buf = 134349570;
    v21 = self;
    v22 = 2112;
    v23 = v8;
    v24 = 2112;
    v25 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[%{public}p] %@ received updates for routes %@", buf, 0x20u);

  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100BDECC8;
  block[3] = &unk_1011AD238;
  block[4] = self;
  v17 = v9;
  v18 = v10;
  v14 = v10;
  v15 = v9;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  os_activity_scope_leave(&state);
}

- (void)valueChangedForGEOConfigKey:(id)a3
{
  void *v5;
  id v6;

  if (a3.var0 == (_DWORD)MapsConfig_RouteCreationAvailable && a3.var1 == off_1014B55A8)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession currentRouteCollectionResult](self, "currentRouteCollectionResult"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "value"));
    -[RoutePlanningSession _updateIsInACustomRouteRegionForRouteCollection:](self, "_updateIsInACustomRouteRegionForRouteCollection:", v5);

  }
}

- (unint64_t)sessionInitiator
{
  return self->_sessionInitiator;
}

- (PlatformController)platformController
{
  return (PlatformController *)objc_loadWeakRetained((id *)&self->_platformController);
}

- (void)setPlatformController:(id)a3
{
  objc_storeWeak((id *)&self->_platformController, a3);
}

- (WaypointControllerConfiguration)waypointConfiguration
{
  return self->_waypointConfiguration;
}

- (RoutePlanningSessionConfiguration)configuration
{
  return self->_configuration;
}

- (RAPGraphDirectionsRecorder)reportAProblemRecorder
{
  return self->_reportAProblemRecorder;
}

- (BOOL)inACustomRouteRegion
{
  return self->_inACustomRouteRegion;
}

- (NavigationStateMonitoringTask)navigationStateMonitoringTask
{
  return self->_navigationStateMonitoringTask;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (int64_t)currentTransportType
{
  return self->_currentTransportType;
}

- (BOOL)isWaitingForAccurateLocationUpdate
{
  return self->_waitingForAccurateLocationUpdate;
}

- (unint64_t)sessionState
{
  return self->_sessionState;
}

- (void)setSessionState:(unint64_t)a3
{
  self->_sessionState = a3;
}

- (GEOObserverHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (WaypointController)waypointController
{
  return self->_waypointController;
}

- (void)setWaypointController:(id)a3
{
  objc_storeStrong((id *)&self->_waypointController, a3);
}

- (RouteLoadingController)routeLoadingController
{
  return self->_routeLoadingController;
}

- (void)setRouteLoadingController:(id)a3
{
  objc_storeStrong((id *)&self->_routeLoadingController, a3);
}

- (OS_dispatch_queue)isolationQueue
{
  return self->_isolationQueue;
}

- (void)setIsolationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_isolationQueue, a3);
}

- (NSMutableDictionary)transportTypeToRouteCollectionResultsMap
{
  return self->_transportTypeToRouteCollectionResultsMap;
}

- (void)setTransportTypeToRouteCollectionResultsMap:(id)a3
{
  objc_storeStrong((id *)&self->_transportTypeToRouteCollectionResultsMap, a3);
}

- (OS_os_activity)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
  objc_storeStrong((id *)&self->_activity, a3);
}

- (BOOL)ignoreMapType
{
  return self->_ignoreMapType;
}

- (void)setIgnoreMapType:(BOOL)a3
{
  self->_ignoreMapType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_transportTypeToRouteCollectionResultsMap, 0);
  objc_storeStrong((id *)&self->_isolationQueue, 0);
  objc_storeStrong((id *)&self->_routeLoadingController, 0);
  objc_storeStrong((id *)&self->_waypointController, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_navigationStateMonitoringTask, 0);
  objc_storeStrong((id *)&self->_reportAProblemRecorder, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_waypointConfiguration, 0);
  objc_destroyWeak((id *)&self->_platformController);
  objc_storeStrong((id *)&self->_advisoryInfo, 0);
  objc_storeStrong((id *)&self->_deferredShortcutsRefreshTimer, 0);
}

- (void)enumerateRequestsOrWaypointsUsingBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  _BYTE *v31;
  _BYTE buf[24];
  _QWORD v33[2];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession currentRouteCollection](self, "currentRouteCollection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentRoute"));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentRoute"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "waypoints"));

  }
  else
  {
    v8 = 0;
  }

  if (objc_msgSend(v8, "count"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession configuration](self, "configuration"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "waypointRequests"));

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v33[0] = 0;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100C2FA04;
    v28[3] = &unk_1011E9718;
    v31 = buf;
    v11 = v10;
    v29 = v11;
    v30 = v4;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v28);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession resolvedWaypoints](self, "resolvedWaypoints"));
    v13 = v12;
    if (v12)
    {
      v14 = objc_msgSend(v12, "count");
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession configuration](self, "configuration"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "waypointRequests"));
      v17 = objc_msgSend(v16, "count");

      if (v14 != v17)
      {
        v18 = sub_1004318FC();
        v19 = objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315906;
          *(_QWORD *)&buf[4] = "-[RoutePlanningSession(WaypointsOrRequests) enumerateRequestsOrWaypointsUsingBlock:]";
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "RoutePlanningSession+WaypointsOrRequests.m";
          *(_WORD *)&buf[22] = 1024;
          LODWORD(v33[0]) = 51;
          WORD2(v33[0]) = 2080;
          *(_QWORD *)((char *)v33 + 6) = "!resolvedWaypoints || resolvedWaypoints.count == self.configuration.waypointRequests.count";
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
        }

        if (sub_100A70734())
        {
          v20 = sub_1004318FC();
          v21 = objc_claimAutoreleasedReturnValue(v20);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v22;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

          }
        }
      }
    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession configuration](self, "configuration"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "waypointRequests"));
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100C2FBE0;
    v25[3] = &unk_1011E9740;
    v26 = v13;
    v27 = v4;
    v11 = v13;
    objc_msgSend(v24, "enumerateObjectsUsingBlock:", v25);

  }
}

+ (id)mostAppropriateNameForWaypointWithRequest:(id)a3 composedWaypoint:(id)a4
{
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  SearchResult *v9;
  id v10;
  void *v11;
  uint64_t v12;
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

  v5 = (unint64_t)a3;
  v6 = (unint64_t)a4;
  if (v5 | v6)
  {
    if (v5 && objc_msgSend((id)v5, "preferredNameSource") != (id)1)
      goto LABEL_8;
  }
  else
  {
    v14 = sub_1004318FC();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v19 = 136315906;
      v20 = "+[RoutePlanningSession(WaypointsOrRequests) mostAppropriateNameForWaypointWithRequest:composedWaypoint:]";
      v21 = 2080;
      v22 = "RoutePlanningSession+WaypointsOrRequests.m";
      v23 = 1024;
      v24 = 60;
      v25 = 2080;
      v26 = "waypointRequest || composedWaypoint";
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
  v7 = objc_opt_class(GEOComposedWaypointEVStop);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
  {
    if (v6)
    {
      v9 = -[SearchResult initWithComposedWaypoint:]([SearchResult alloc], "initWithComposedWaypoint:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult name](v9, "name"));

      goto LABEL_9;
    }
LABEL_8:
    v8 = 0;
    goto LABEL_9;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v6, "name"));
LABEL_9:
  v10 = objc_msgSend(v8, "length");
  if (v5 && !v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v5, "waypointPlaceholder"));
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));

    v8 = (void *)v12;
  }

  return v8;
}

@end
