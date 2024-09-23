@implementation MapsAppTestRoute

- (BOOL)runTest
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unsigned int v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  SearchFieldItem *v15;
  void *v16;
  dispatch_time_t v17;
  void *v18;
  NSExceptionName v20;
  const __CFString *v21;
  id v22;
  _QWORD v23[5];
  SearchFieldItem *v24;
  _QWORD v25[6];
  _QWORD v26[5];
  _QWORD v27[5];
  _QWORD v28[6];
  _QWORD v29[6];
  _QWORD v30[5];
  id v31;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest options](self, "options"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_mapstest_waypointStrings"));
  if (-[MapsAppTest isRunningOnCarPlay](self, "isRunningOnCarPlay"))
  {
    -[MapsAppTest startedTest](self, "startedTest");
    -[MapsAppTest startedSubTest:](self, "startedSubTest:", CFSTR("loadPlaceCard"));
    v5 = 1;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testCoordinator](self, "testCoordinator"));
    objc_msgSend(v6, "pptTestResetForLaunchURL");

    -[MapsAppTest switchToMapType:](self, "switchToMapType:", objc_msgSend(v3, "_mapstest_mapType"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest options](self, "options"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("mapType")));

    if (objc_msgSend(v8, "isEqualToString:", CFSTR("transit")))
      v5 = 3;
    else
      v5 = 1;

  }
  -[MapsAppTestRoute setTransportType:](self, "setTransportType:", v5);
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_mapstest_originString"));
  v10 = -[MapsAppTest isRunningOnCarPlay](self, "isRunningOnCarPlay");
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_mapstest_destinationString"));
  v12 = (uint64_t)v11;
  if (v10)
  {
    if (v11)
      v13 = v11;
    else
      v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("endAddr")));
    v14 = (uint64_t)v13;

    v12 = v14;
  }
  if (v9 | v12)
  {
LABEL_15:
    if (v4)
      goto LABEL_18;
    goto LABEL_16;
  }
  if (objc_msgSend(v4, "count") == (id)2)
  {
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", 0));
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", 1));
    goto LABEL_15;
  }
  v9 = 0;
  v12 = 0;
  if (v4)
    goto LABEL_18;
LABEL_16:
  if (!v9 && !v12)
  {
    v20 = NSInvalidArgumentException;
    v21 = CFSTR("No waypoints provided for route test");
    goto LABEL_36;
  }
LABEL_18:
  if (v4 && (unint64_t)objc_msgSend(v4, "count") <= 1)
  {
    v20 = NSInvalidArgumentException;
    v21 = CFSTR("Not enough waypoints provided for route test");
LABEL_36:
    v22 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", v20, v21, 0));
    objc_exception_throw(v22);
  }
  if (((objc_msgSend((id)v9, "_mapstest_isCurrentLocationString") & 1) != 0
     || -[MapsAppTest isRunningOnCarPlay](self, "isRunningOnCarPlay"))
    && (unint64_t)objc_msgSend(v4, "count") <= 2)
  {
    v30[0] = 0;
    v30[1] = v30;
    v30[2] = 0x3032000000;
    v30[3] = sub_10022D3F4;
    v30[4] = sub_10022D404;
    v31 = 0;
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10022D40C;
    v29[3] = &unk_1011AD170;
    v29[4] = self;
    v29[5] = v30;
    +[PPTNotificationCenter addOnceObserverForName:object:usingBlock:](PPTNotificationCenter, "addOnceObserverForName:object:usingBlock:", CFSTR("SearchSessionDidChangeSearchResultsNotification"), 0, v29);
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10022D4A4;
    v28[3] = &unk_1011AD198;
    v28[4] = self;
    v28[5] = v30;
    +[PPTNotificationCenter addOnceObserverForName:object:usingBlock:](PPTNotificationCenter, "addOnceObserverForName:object:usingBlock:", CFSTR("MapsPinsDroppedForSearchResultsNotification"), 0, v28);
    if (-[MapsAppTest isRunningOnCarPlay](self, "isRunningOnCarPlay"))
    {
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_10022D560;
      v27[3] = &unk_1011AD1C0;
      v27[4] = self;
      +[PPTNotificationCenter addOnceObserverForName:object:usingBlock:](PPTNotificationCenter, "addOnceObserverForName:object:usingBlock:", CFSTR("CarPlaceCardCardViewControllerDidAppearNotification"), 0, v27);
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_10022D598;
      v26[3] = &unk_1011AD1C0;
      v26[4] = self;
      +[PPTNotificationCenter addOnceObserverForName:object:usingBlock:](PPTNotificationCenter, "addOnceObserverForName:object:usingBlock:", CFSTR("CarPlaceCardCardViewControllerDidLoadRouteNotification"), 0, v26);
    }
    else
    {
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_10022D5C8;
      v25[3] = &unk_1011AD198;
      v25[4] = self;
      v25[5] = v30;
      +[PPTNotificationCenter addOnceObserverForName:object:usingBlock:](PPTNotificationCenter, "addOnceObserverForName:object:usingBlock:", MKPlaceViewControllerDidShowNotification, 0, v25);
    }
    v15 = objc_alloc_init(SearchFieldItem);
    -[SearchFieldItem setSearchString:](v15, "setSearchString:", v12);
    if (-[MapsAppTest isRunningOnCarPlay](self, "isRunningOnCarPlay"))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testCoordinator](self, "testCoordinator"));
      objc_msgSend(v16, "pptTestEnterSearchMode");

      v17 = dispatch_time(0, 2000000000);
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_10022D7D8;
      v23[3] = &unk_1011AC8B0;
      v23[4] = self;
      v24 = v15;
      dispatch_after(v17, (dispatch_queue_t)&_dispatch_main_q, v23);

    }
    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testCoordinator](self, "testCoordinator"));
      objc_msgSend(v18, "pptTestSearchForFieldItem:", v15);

    }
    _Block_object_dispose(v30, 8);

  }
  else
  {
    -[MapsAppTestRoute _requestRouteWithResolvedDestination:](self, "_requestRouteWithResolvedDestination:", 0);
  }

  return 1;
}

- (void)_requestRouteWithResolvedDestination:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  dispatch_time_t v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  MapsAppTestRoute *v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest options](self, "options"));
  -[MapsAppTestRoute registerGEOSubtestsForRouting](self, "registerGEOSubtestsForRouting");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "addObserver:selector:name:object:", self, "willResolveWaypointsForRouting:", CFSTR("MapsWaypointResolutionDidBeginNotification"), 0);

  v7 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10022D9C4;
  block[3] = &unk_1011AD238;
  v11 = v5;
  v12 = v4;
  v13 = self;
  v8 = v4;
  v9 = v5;
  dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)registerGEOSubtestsForRouting
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
  id v35;

  -[MapsAppTest registerGEOManifestSubtests](self, "registerGEOManifestSubtests");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "willBeginMapsPPTTest_Route_SetDirectionsPlan:", CFSTR("MapsPPTTest_Route_SetDirectionsPlanBEGIN"), 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "didEndMapsPPTTest_Route_SetDirectionsPlan:", CFSTR("MapsPPTTest_Route_SetDirectionsPlanEND"), 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[GEONotificationPreferenceManager sharedManager](GEONotificationPreferenceManager, "sharedManager"));
  objc_msgSend(v5, "setEnabled:forSubTestWithName:", 1, CFSTR("MapsPPTTest_Route_SetDirectionsPlan"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "addObserver:selector:name:object:", self, "willBeginMapsPPTTest_Route_SetDirectionsPlan_DirectionsStarted:", CFSTR("MapsPPTTest_Route_SetDirectionsPlan_DirectionsStartedBEGIN"), 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v7, "addObserver:selector:name:object:", self, "didEndMapsPPTTest_Route_SetDirectionsPlan_DirectionsStarted:", CFSTR("MapsPPTTest_Route_SetDirectionsPlan_DirectionsStartedEND"), 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[GEONotificationPreferenceManager sharedManager](GEONotificationPreferenceManager, "sharedManager"));
  objc_msgSend(v8, "setEnabled:forSubTestWithName:", 1, CFSTR("MapsPPTTest_Route_SetDirectionsPlan_DirectionsStarted"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v9, "addObserver:selector:name:object:", self, "willBeginMapsPPTTest_Route_SetDirectionsPlan_RoutePicking:", CFSTR("MapsPPTTest_Route_SetDirectionsPlan_RoutePickingBEGIN"), 0);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v10, "addObserver:selector:name:object:", self, "didEndMapsPPTTest_Route_SetDirectionsPlan_RoutePicking:", CFSTR("MapsPPTTest_Route_SetDirectionsPlan_RoutePickingEND"), 0);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[GEONotificationPreferenceManager sharedManager](GEONotificationPreferenceManager, "sharedManager"));
  objc_msgSend(v11, "setEnabled:forSubTestWithName:", 1, CFSTR("MapsPPTTest_Route_SetDirectionsPlan_RoutePicking"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v12, "addObserver:selector:name:object:", self, "willBeginMapsPPTTest_Route_SetDirectionsPlan_RoutePicking_LoadingFromWaypoints:", CFSTR("MapsPPTTest_Route_SetDirectionsPlan_RoutePicking_LoadingFromWaypointsBEGIN"), 0);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v13, "addObserver:selector:name:object:", self, "didEndMapsPPTTest_Route_SetDirectionsPlan_RoutePicking_LoadingFromWaypoints:", CFSTR("MapsPPTTest_Route_SetDirectionsPlan_RoutePicking_LoadingFromWaypointsEND"), 0);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[GEONotificationPreferenceManager sharedManager](GEONotificationPreferenceManager, "sharedManager"));
  objc_msgSend(v14, "setEnabled:forSubTestWithName:", 1, CFSTR("MapsPPTTest_Route_SetDirectionsPlan_RoutePicking_LoadingFromWaypoints"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v15, "addObserver:selector:name:object:", self, "willBeginMapsPPTTest_Route_SetDirectionsPlan_DirectionsSearch:", CFSTR("MapsPPTTest_Route_SetDirectionsPlan_DirectionsSearchBEGIN"), 0);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v16, "addObserver:selector:name:object:", self, "didEndMapsPPTTest_Route_SetDirectionsPlan_DirectionsSearch:", CFSTR("MapsPPTTest_Route_SetDirectionsPlan_DirectionsSearchEND"), 0);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[GEONotificationPreferenceManager sharedManager](GEONotificationPreferenceManager, "sharedManager"));
  objc_msgSend(v17, "setEnabled:forSubTestWithName:", 1, CFSTR("MapsPPTTest_Route_SetDirectionsPlan_DirectionsSearch"));

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v18, "addObserver:selector:name:object:", self, "willBeginMapsPPTTest_ComposeWaypoint:", CFSTR("MapsPPTTest_ComposeWaypointBEGIN"), 0);

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v19, "addObserver:selector:name:object:", self, "didEndMapsPPTTest_ComposeWaypoint:", CFSTR("MapsPPTTest_ComposeWaypointEND"), 0);

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[GEONotificationPreferenceManager sharedManager](GEONotificationPreferenceManager, "sharedManager"));
  objc_msgSend(v20, "setEnabled:forSubTestWithName:", 1, CFSTR("MapsPPTTest_ComposeWaypoint"));

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v21, "addObserver:selector:name:object:", self, "willBeginGEOPPTTest_PlaceRequest:", CFSTR("GEOPPTTest_PlaceRequestBEGIN"), 0);

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v22, "addObserver:selector:name:object:", self, "didEndGEOPPTTest_PlaceRequest:", CFSTR("GEOPPTTest_PlaceRequestEND"), 0);

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[GEONotificationPreferenceManager sharedManager](GEONotificationPreferenceManager, "sharedManager"));
  objc_msgSend(v23, "setEnabled:forSubTestWithName:", 1, CFSTR("GEOPPTTest_PlaceRequest"));

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v24, "addObserver:selector:name:object:", self, "willBeginGEOPPTTest_PlaceRequest_RequestPreparing:", CFSTR("GEOPPTTest_PlaceRequest_RequestPreparingBEGIN"), 0);

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v25, "addObserver:selector:name:object:", self, "didEndGEOPPTTest_PlaceRequest_RequestPreparing:", CFSTR("GEOPPTTest_PlaceRequest_RequestPreparingEND"), 0);

  v26 = (void *)objc_claimAutoreleasedReturnValue(+[GEONotificationPreferenceManager sharedManager](GEONotificationPreferenceManager, "sharedManager"));
  objc_msgSend(v26, "setEnabled:forSubTestWithName:", 1, CFSTR("GEOPPTTest_PlaceRequest_RequestPreparing"));

  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v27, "addObserver:selector:name:object:", self, "willBeginGEOPPTTest_PlaceRequest_ResponseHandling:", CFSTR("GEOPPTTest_PlaceRequest_ResponseHandlingBEGIN"), 0);

  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v28, "addObserver:selector:name:object:", self, "didEndGEOPPTTest_PlaceRequest_ResponseHandling:", CFSTR("GEOPPTTest_PlaceRequest_ResponseHandlingEND"), 0);

  v29 = (void *)objc_claimAutoreleasedReturnValue(+[GEONotificationPreferenceManager sharedManager](GEONotificationPreferenceManager, "sharedManager"));
  objc_msgSend(v29, "setEnabled:forSubTestWithName:", 1, CFSTR("GEOPPTTest_PlaceRequest_ResponseHandling"));

  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v30, "addObserver:selector:name:object:", self, "willBeginGEOPPTTest_PlaceDataRequest_GEOD:", CFSTR("GEOPPTTest_PlaceDataRequest_GEODBEGIN"), 0);

  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v31, "addObserver:selector:name:object:", self, "didEndGEOPPTTest_PlaceDataRequest_GEOD:", CFSTR("GEOPPTTest_PlaceDataRequest_GEODEND"), 0);

  v32 = (void *)objc_claimAutoreleasedReturnValue(+[GEONotificationPreferenceManager sharedManager](GEONotificationPreferenceManager, "sharedManager"));
  objc_msgSend(v32, "setEnabled:forSubTestWithName:", 1, CFSTR("GEOPPTTest_PlaceDataRequest_GEOD"));

  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v33, "addObserver:selector:name:object:", self, "willBeginGEOPPTTest_RouteManager_DirectionsRequest:", CFSTR("GEOPPTTest_RouteManager_DirectionsRequestBEGIN"), 0);

  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v34, "addObserver:selector:name:object:", self, "didEndGEOPPTTest_RouteManager_DirectionsRequest:", CFSTR("GEOPPTTest_RouteManager_DirectionsRequestEND"), 0);

  v35 = (id)objc_claimAutoreleasedReturnValue(+[GEONotificationPreferenceManager sharedManager](GEONotificationPreferenceManager, "sharedManager"));
  objc_msgSend(v35, "setEnabled:forSubTestWithName:", 1, CFSTR("GEOPPTTest_RouteManager_DirectionsRequest"));

}

- (void)tapOnSearchBar
{
  -[MapsAppTestRoute _showDirectionSearchView:](self, "_showDirectionSearchView:", 0);
}

- (void)_showDirectionSearchView:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  SearchFieldItem *v13;
  void *v14;
  void *v15;
  SearchFieldItem *v16;
  DirectionItem *v17;
  void *v18;
  DirectionItem *v19;
  void *v20;
  _QWORD v21[2];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest options](self, "options"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("transportType")));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest options](self, "options"));
  v8 = v7;
  if (v6)
  {
    switch(objc_msgSend(v7, "_mapstest_transportType"))
    {
      case 1u:
      case 5u:
        v9 = 3;
        break;
      case 2u:
        v9 = 2;
        break;
      case 3u:
        v9 = 5;
        break;
      case 4u:
        v9 = 0;
        break;
      case 6u:
        v9 = 4;
        break;
      default:
        v9 = 1;
        break;
    }
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("mapType")));

    if (objc_msgSend(v10, "isEqualToString:", CFSTR("transit")))
      v9 = 3;
    else
      v9 = 1;
    v8 = v10;
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest options](self, "options"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("startAddr")));

  v13 = objc_alloc_init(SearchFieldItem);
  -[SearchFieldItem setSearchString:](v13, "setSearchString:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest options](self, "options"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("endAddr")));

  v16 = objc_alloc_init(SearchFieldItem);
  -[SearchFieldItem setSearchString:](v16, "setSearchString:", v15);
  v17 = [DirectionItem alloc];
  v21[0] = v13;
  v21[1] = v16;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v21, 2));
  v19 = -[DirectionItem initWithItems:transportType:](v17, "initWithItems:transportType:", v18, v9);

  objc_msgSend(v4, "addObserver:selector:name:object:", self, "willResolveWaypointsForRouting:", CFSTR("MapsWaypointResolutionDidBeginNotification"), 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testCoordinator](self, "testCoordinator"));
  objc_msgSend(v20, "pptTestDoDirectionItem:", v19);

}

- (void)willResolveWaypointsForRouting:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  self->_numWaypointsLoaded = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter", a3));
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("MapsWaypointResolutionDidBeginNotification"), 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "addObserver:selector:name:object:", self, "didResolveWaypointsForRouting:", CFSTR("MapsWaypointResolutionDidLoadOriginNotification"), 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "addObserver:selector:name:object:", self, "didResolveWaypointsForRouting:", CFSTR("MapsWaypointResolutionDidLoadDestinationNotification"), 0);

  -[MapsAppTest finishedSubTest:](self, "finishedSubTest:", CFSTR("directionsSetup"));
  -[MapsAppTest startedSubTest:](self, "startedSubTest:", CFSTR("waypointResolution1"));
  -[MapsAppTest startedSubTest:](self, "startedSubTest:", CFSTR("waypointResolution2"));
}

- (void)didResolveWaypointsForRouting:(id)a3
{
  unint64_t numWaypointsLoaded;
  void *v5;
  void *v6;

  numWaypointsLoaded = self->_numWaypointsLoaded;
  self->_numWaypointsLoaded = numWaypointsLoaded + 1;
  if (numWaypointsLoaded)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter", a3));
    objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("MapsWaypointResolutionDidLoadOriginNotification"), 0);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v6, "removeObserver:name:object:", self, CFSTR("MapsWaypointResolutionDidLoadDestinationNotification"), 0);

    -[MapsAppTest finishedSubTest:](self, "finishedSubTest:", CFSTR("waypointResolution2"));
    -[MapsAppTest startedSubTest:](self, "startedSubTest:", CFSTR("routeRequestPrep"));
  }
  else
  {
    -[MapsAppTest finishedSubTest:](self, "finishedSubTest:", CFSTR("waypointResolution1"));
  }
}

- (void)willBeginGEOPPTTest_PlaceRequest:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10022E4A0;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)didEndGEOPPTTest_PlaceRequest:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10022E510;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)willBeginGEOPPTTest_PlaceRequest_RequestPreparing:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10022E578;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)didEndGEOPPTTest_PlaceRequest_RequestPreparing:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10022E5E8;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)willBeginGEOPPTTest_PlaceRequest_ResponseHandling:(id)a3
{
  id v3;
  _QWORD v4[5];
  id v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10022E674;
  v4[3] = &unk_1011AC8B0;
  v4[4] = self;
  v5 = a3;
  v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);

}

- (void)didEndGEOPPTTest_PlaceRequest_ResponseHandling:(id)a3
{
  id v3;
  _QWORD v4[5];
  id v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10022E774;
  v4[3] = &unk_1011AC8B0;
  v4[4] = self;
  v5 = a3;
  v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);

}

- (void)willBeginGEOPPTTest_PlaceDataRequest_GEOD:(id)a3
{
  id v3;
  _QWORD v4[5];
  id v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10022E86C;
  v4[3] = &unk_1011AC8B0;
  v4[4] = self;
  v5 = a3;
  v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);

}

- (void)didEndGEOPPTTest_PlaceDataRequest_GEOD:(id)a3
{
  id v3;
  _QWORD v4[5];
  id v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10022E96C;
  v4[3] = &unk_1011AC8B0;
  v4[4] = self;
  v5 = a3;
  v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);

}

- (void)willBeginMapsPPTTest_Route_SetDirectionsPlan:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10022EA40;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)didEndMapsPPTTest_Route_SetDirectionsPlan:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10022EAB0;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)willBeginMapsPPTTest_Route_SetDirectionsPlan_DirectionsStarted:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10022EB18;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)didEndMapsPPTTest_Route_SetDirectionsPlan_DirectionsStarted:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10022EB88;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)willBeginMapsPPTTest_Route_SetDirectionsPlan_RoutePicking:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10022EBF0;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)didEndMapsPPTTest_Route_SetDirectionsPlan_RoutePicking:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10022EC60;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)willBeginMapsPPTTest_Route_SetDirectionsPlan_RoutePicking_LoadingFromWaypoints:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10022ECC8;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)didEndMapsPPTTest_Route_SetDirectionsPlan_RoutePicking_LoadingFromWaypoints:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10022ED38;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)willBeginMapsPPTTest_Route_SetDirectionsPlan_DirectionsSearch:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10022EDA0;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)didEndMapsPPTTest_Route_SetDirectionsPlan_DirectionsSearch:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10022EE10;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)willBeginMapsPPTTest_ComposeWaypoint:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10022EE78;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)didEndMapsPPTTest_ComposeWaypoint:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10022EEE8;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)willBeginGEOPPTTest_RouteManager_DirectionsRequest:(id)a3
{
  id v4;

  -[MapsAppTest finishedSubTest:](self, "finishedSubTest:", CFSTR("routeRequestPrep"));
  -[MapsAppTest startedSubTest:](self, "startedSubTest:", CFSTR("routeRequestWaiting"));
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "didDisplayRoutes:", CFSTR("MapsRoutePlanningShowingRoutesNotification"), 0);

}

- (void)didEndGEOPPTTest_RouteManager_DirectionsRequest:(id)a3
{
  void *v4;
  uint64_t v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  uint64_t v11;
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
  id v24;

  v24 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "object"));
  v5 = objc_opt_class(NSArray);
  isKindOfClass = objc_opt_isKindOfClass(v4, v5);

  v7 = v24;
  if ((isKindOfClass & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "object"));
    if (objc_msgSend(v8, "count"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
      v10 = objc_msgSend(v9, "transportType") - 1;
      if (v10 > 5)
        v11 = 1;
      else
        v11 = qword_100E34738[v10];
      if (v11 == -[MapsAppTestRoute transportType](self, "transportType"))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_maps_traceRecordingData"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "initialDirectionsRequest"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "initialDirectionsResponse"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "data"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v15, "length")));
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest results](self, "results"));
        objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, CFSTR("extras:routeRequestSize:bytes"));

        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "data"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v18, "length")));
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest results](self, "results"));
        objc_msgSend(v20, "setObject:forKeyedSubscript:", v19, CFSTR("extras:routeResponseSize:bytes"));

        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "suggestedRoutes"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v21, "count")));
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest results](self, "results"));
        objc_msgSend(v23, "setObject:forKeyedSubscript:", v22, CFSTR("extras:routeResponseSuggestedNumRoutes:count"));

        -[MapsAppTest finishedSubTest:](self, "finishedSubTest:", CFSTR("routeRequestWaiting"));
        -[MapsAppTest startedSubTest:](self, "startedSubTest:", CFSTR("displayRoutes"));

      }
    }

    v7 = v24;
  }

}

- (void)didDisplayRoutes:(id)a3
{
  void *v4;
  dispatch_time_t v5;
  _QWORD block[5];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter", a3));
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("MapsRoutePlanningShowingRoutesNotification"), 0);

  v5 = dispatch_time(0, 2650000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10022F25C;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (unint64_t)numWaypointsLoaded
{
  return self->_numWaypointsLoaded;
}

- (int64_t)transportType
{
  return self->_transportType;
}

- (void)setTransportType:(int64_t)a3
{
  self->_transportType = a3;
}

@end
