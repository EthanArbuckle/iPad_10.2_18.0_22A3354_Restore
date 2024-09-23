@implementation CarRoutePlanningModeController

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController routePlanningSession](self, "routePlanningSession"));
  objc_msgSend(v4, "removeObserver:", self);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "platformController"));
  objc_msgSend(v6, "removeObserver:", self);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController personalizedItemManager](self, "personalizedItemManager"));
  objc_msgSend(v7, "removeObserver:", self);

  v8.receiver = self;
  v8.super_class = (Class)CarRoutePlanningModeController;
  -[CarRoutePlanningModeController dealloc](&v8, "dealloc");
}

- (CarRoutePlanningModeController)initWithDestination:(id)a3 userInfo:(id)a4
{
  id v7;
  id v8;
  id v9;
  __objc2_prot *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  unsigned int v16;
  id v17;
  void *v18;
  CarRoutePlanningModeController *v19;
  MapsSuggestionsEntry *v20;
  uint64_t v21;
  CarRoutePlanningModeController *v22;
  MapsSuggestionsEntry *originalEntry;
  uint64_t v24;
  MapsSuggestionsEntry *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  CarRoutePlanningModeController *v29;
  uint64_t v30;

  v7 = a3;
  v8 = a4;
  v9 = v7;
  v10 = &OBJC_PROTOCOL___MSPHistoryEntryRoute;
  v11 = objc_opt_class(HistoryEntryRecentsItem);
  v12 = v9;
  if ((objc_opt_isKindOfClass(v12, v11) & 1) != 0)
    v13 = v12;
  else
    v13 = 0;
  v14 = v13;

  if (v14
    && (v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "historyEntry")),
        v16 = objc_msgSend(v15, "conformsToProtocol:", v10),
        v15,
        v16))
  {
    v17 = v12;
  }
  else
  {
    v17 = 0;
  }

  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "historyEntry"));
    v19 = -[CarRoutePlanningModeController initWithHistoryRoute:](self, "initWithHistoryRoute:", v18);
    self = v19;
    v20 = (MapsSuggestionsEntry *)v12;
LABEL_28:
    v22 = v19;
    goto LABEL_29;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[SearchResult carSearchResultFromDestination:](SearchResult, "carSearchResultFromDestination:", v12));
  v21 = objc_opt_class(MapsSuggestionsEntry);
  if ((objc_opt_isKindOfClass(v12, v21) & 1) == 0)
  {
LABEL_14:
    v24 = objc_opt_class(_TtC4Maps16MapsFavoriteItem);
    if ((objc_opt_isKindOfClass(v12, v24) & 1) != 0)
      objc_storeStrong((id *)&self->_originalItem, a3);
    if (v18)
    {
      v25 = v18;
    }
    else
    {
      v26 = objc_opt_class(0x101464000);
      if ((objc_opt_isKindOfClass(v12, v26) & 1) != 0)
      {
        v25 = (MapsSuggestionsEntry *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "homeAddress"));
      }
      else
      {
        v27 = objc_opt_class(DirectionsWorkHistoryItem);
        v20 = (MapsSuggestionsEntry *)v12;
        if ((objc_opt_isKindOfClass(v12, v27) & 1) == 0)
        {
LABEL_23:
          v28 = objc_opt_class(AddressBookAddress);
          if ((objc_opt_isKindOfClass(v20, v28) & 1) != 0)
          {
            v29 = -[CarRoutePlanningModeController initWithAddressBookAddress:](self, "initWithAddressBookAddress:", v20);
          }
          else
          {
            v30 = objc_opt_class(SearchResult);
            if ((objc_opt_isKindOfClass(v20, v30) & 1) == 0)
            {
              v22 = 0;
              goto LABEL_29;
            }
            v29 = -[CarRoutePlanningModeController initWithSearchResult:userInfo:](self, "initWithSearchResult:userInfo:", v20, v8);
          }
          v19 = v29;
          self = v19;
          goto LABEL_28;
        }
        v25 = (MapsSuggestionsEntry *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "workAddress"));
      }
    }
    v20 = v25;

    goto LABEL_23;
  }
  v20 = (MapsSuggestionsEntry *)v12;
  if (-[MapsSuggestionsEntry type](v20, "type") != (id)11)
  {
    originalEntry = self->_originalEntry;
    self->_originalEntry = v20;

    goto LABEL_14;
  }
  self = (CarRoutePlanningModeController *)-[CarRoutePlanningModeController initForResumeRoute:](self, "initForResumeRoute:", v20);

  v22 = self;
LABEL_29:

  return v22;
}

- (CarRoutePlanningModeController)initWithSearchSession:(id)a3
{
  id v4;
  CarRoutePlanningModeController *v5;
  void *v6;

  v4 = a3;
  v5 = -[CarRoutePlanningModeController init](self, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentResults"));
    -[CarRoutePlanningModeController setFullSearchResults:](v5, "setFullSearchResults:", v6);

    -[CarRoutePlanningModeController setSearchSession:](v5, "setSearchSession:", v4);
    -[CarRoutePlanningModeController _commonInit](v5, "_commonInit");
  }

  return v5;
}

- (CarRoutePlanningModeController)initWithExistingSearchSession
{
  void *v3;
  void *v4;
  CarRoutePlanningModeController *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "searchSession"));

  if (v4)
  {
    self = -[CarRoutePlanningModeController initWithSearchSession:](self, "initWithSearchSession:", v4);
    v5 = self;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (CarRoutePlanningModeController)initWithSearchResults:(id)a3 selectedIndex:(unint64_t)a4 userInfo:(id)a5
{
  id v8;
  id v9;
  CarRoutePlanningModeController *v10;
  CarRoutePlanningModeController *v11;

  v8 = a3;
  v9 = a5;
  v10 = -[CarRoutePlanningModeController init](self, "init");
  v11 = v10;
  if (v10)
  {
    -[CarRoutePlanningModeController setFullSearchResults:](v10, "setFullSearchResults:", v8);
    -[CarRoutePlanningModeController setUserInfo:](v11, "setUserInfo:", v9);
    -[CarRoutePlanningModeController setSearchResults:selectedIndex:](v11, "setSearchResults:selectedIndex:", v8, a4);
    -[CarRoutePlanningModeController _commonInit](v11, "_commonInit");
  }

  return v11;
}

- (CarRoutePlanningModeController)initWithSearchResult:(id)a3 userInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  CarRoutePlanningModeController *v9;
  id v11;

  v11 = a3;
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));

  v9 = -[CarRoutePlanningModeController initWithSearchResults:selectedIndex:userInfo:](self, "initWithSearchResults:selectedIndex:userInfo:", v8, 0, v6, v11);
  return v9;
}

- (CarRoutePlanningModeController)initWithExistingRouteLoading
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  CarRoutePlanningModeController *v9;
  CarRoutePlanningModeController *v10;
  CarExistingWaypointsController *v11;
  CarWaypointsController *waypointsController;
  CarRoutePlanningModeController *v13;
  id v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  char *v18;
  int v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "platformController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentSession"));

  v6 = objc_opt_class(RoutePlanningSession);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    v7 = v5;
  else
    v7 = 0;
  v8 = v7;

  if (v8)
  {
    v9 = -[CarRoutePlanningModeController init](self, "init");
    v10 = v9;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_routePlanningSession, v7);
      -[RoutePlanningSession addObserver:](v10->_routePlanningSession, "addObserver:", v10);
      v11 = -[CarExistingWaypointsController initWithRoutePlanningSession:]([CarExistingWaypointsController alloc], "initWithRoutePlanningSession:", v10->_routePlanningSession);
      waypointsController = v10->_waypointsController;
      v10->_waypointsController = &v11->super;

      -[CarRoutePlanningModeController _commonInit](v10, "_commonInit");
      -[CarRoutePlanningModeController _updateElements](v10, "_updateElements");
    }
    self = v10;
    v13 = self;
  }
  else
  {
    v14 = sub_1004318FC();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v20 = 136315650;
      v21 = "-[CarRoutePlanningModeController initWithExistingRouteLoading]";
      v22 = 2080;
      v23 = "CarRoutePlanningModeController.m";
      v24 = 1024;
      v25 = 319;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v20, 0x1Cu);
    }

    if (sub_100A70734())
    {
      v16 = sub_1004318FC();
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v20 = 138412290;
        v21 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v20, 0xCu);

      }
    }
    v13 = 0;
  }

  return v13;
}

- (CarRoutePlanningModeController)initWithHistoryRoute:(id)a3
{
  id v4;
  CarRoutePlanningModeController *v5;
  CarHistoryRouteWaypointsController *v6;
  CarWaypointsController *waypointsController;

  v4 = a3;
  v5 = -[CarRoutePlanningModeController init](self, "init");
  if (v5)
  {
    v6 = -[CarHistoryRouteWaypointsController initWithHistoryItem:]([CarHistoryRouteWaypointsController alloc], "initWithHistoryItem:", v4);
    waypointsController = v5->_waypointsController;
    v5->_waypointsController = &v6->super;

    -[CarRoutePlanningModeController _commonInit](v5, "_commonInit");
  }

  return v5;
}

- (id)initForResumeRoute:(id)a3
{
  id v4;
  CarRoutePlanningModeController *v5;
  CarResumeRouteWaypointsController *v6;
  CarWaypointsController *waypointsController;

  v4 = a3;
  v5 = -[CarRoutePlanningModeController init](self, "init");
  if (v5)
  {
    v6 = -[CarResumeRouteWaypointsController initWithEntry:]([CarResumeRouteWaypointsController alloc], "initWithEntry:", v4);
    waypointsController = v5->_waypointsController;
    v5->_waypointsController = &v6->super;

    -[CarRoutePlanningModeController _commonInit](v5, "_commonInit");
  }

  return v5;
}

- (CarRoutePlanningModeController)initWithAddressBookAddress:(id)a3
{
  return -[CarRoutePlanningModeController initWithAddressBookAddress:overridingTitle:](self, "initWithAddressBookAddress:overridingTitle:", a3, 0);
}

- (CarRoutePlanningModeController)initWithAddressBookAddress:(id)a3 overridingTitle:(id)a4
{
  id v6;
  id v7;
  CarRoutePlanningModeController *v8;
  CarAddressWaypointsController *v9;
  CarWaypointsController *waypointsController;

  v6 = a3;
  v7 = a4;
  v8 = -[CarRoutePlanningModeController init](self, "init");
  if (v8)
  {
    v9 = -[CarAddressWaypointsController initWithAddress:overridingTitle:]([CarAddressWaypointsController alloc], "initWithAddress:overridingTitle:", v6, v7);
    waypointsController = v8->_waypointsController;
    v8->_waypointsController = &v9->super;

    -[CarRoutePlanningModeController _commonInit](v8, "_commonInit");
  }

  return v8;
}

- (void)_commonInit
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CarAdvisoryDetailCardViewController *v10;
  CarAdvisoryDetailCardViewController *carAdvisoryDetailCardViewController;
  CarAdvisoryListCardViewController *v12;
  void *v13;
  CarAdvisoryListCardViewController *v14;
  CarAdvisoryListCardViewController *carAdvisoryListCardViewController;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id location;
  void *v23;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "_locationManagerApprovalDidChange:", MKLocationManagerApprovalDidChangeNotification, 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MapsExternalDevice sharedInstance](MapsExternalDevice, "sharedInstance"));
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "_updatedExternalDevice:", CFSTR("MapsExternalDeviceUpdated"), v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController fullSearchResults](self, "fullSearchResults"));
  if (v6)
  {

  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarWaypointsController destinationSearchResultIfAvailable](self->_waypointsController, "destinationSearchResultIfAvailable"));

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarWaypointsController destinationSearchResultIfAvailable](self->_waypointsController, "destinationSearchResultIfAvailable"));
      v23 = v8;
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v23, 1));
      -[CarRoutePlanningModeController setFullSearchResults:](self, "setFullSearchResults:", v9);

    }
  }
  v10 = objc_alloc_init(CarAdvisoryDetailCardViewController);
  carAdvisoryDetailCardViewController = self->_carAdvisoryDetailCardViewController;
  self->_carAdvisoryDetailCardViewController = v10;

  v12 = [CarAdvisoryListCardViewController alloc];
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController currentRoute](self, "currentRoute"));
  v14 = -[CarAdvisoryListCardViewController initWithRoute:delegate:](v12, "initWithRoute:delegate:", v13, self);
  carAdvisoryListCardViewController = self->_carAdvisoryListCardViewController;
  self->_carAdvisoryListCardViewController = v14;

  self->_state = 0;
  v16 = -[CarRoutePlanningModeController _updateLoading](self, "_updateLoading");
  if (MapsFeature_IsEnabled_EVRouting(v16, v17))
  {
    if (IsEVRoutingSupported())
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[VGVirtualGarageService sharedService](VGVirtualGarageService, "sharedService"));
      objc_msgSend(v18, "registerObserver:", self);

      objc_initWeak(&location, self);
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[VGVirtualGarageService sharedService](VGVirtualGarageService, "sharedService"));
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_10043FE4C;
      v20[3] = &unk_1011AD9D0;
      objc_copyWeak(&v21, &location);
      objc_msgSend(v19, "virtualGarageGetListOfUnpairedVehiclesWithReply:", v20);

      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);
    }
  }
}

- (BOOL)isLoading
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController routePlanningSession](self, "routePlanningSession"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController routePlanningSession](self, "routePlanningSession"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "routeCollectionResultForTransportType:", 1));
    v6 = v5 == 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)setFullSearchResults:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (!-[NSArray isEqualToArray:](self->_fullSearchResults, "isEqualToArray:"))
  {
    objc_storeStrong((id *)&self->_fullSearchResults, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray firstObject](self->_fullSearchResults, "firstObject"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController placeCard](self, "placeCard"));
    objc_msgSend(v6, "setSearchResult:", v5);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController chromeViewController](self, "chromeViewController"));
    objc_msgSend(v7, "updateCardsForContext:animated:", self, 0);

  }
}

- (BOOL)showsNavigationBar
{
  return 0;
}

- (int64_t)autohideBehavior
{
  return 1;
}

- (BOOL)showsMapView
{
  return 1;
}

- (BOOL)shouldTimeoutAfterDisconnect
{
  return 0;
}

- (BOOL)supportsAlternateRouteSelection
{
  return 1;
}

- (BOOL)wantsNavigationDisplay
{
  return 0;
}

- (id)visuallySelectedItem
{
  CarWaypointsController *waypointsController;
  uint64_t v4;
  void *v5;

  waypointsController = self->_waypointsController;
  v4 = objc_opt_class(CarSearchWaypointsController);
  if ((objc_opt_isKindOfClass(waypointsController, v4) & 1) != 0)
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarWaypointsController visuallySelectedItem](self->_waypointsController, "visuallySelectedItem"));
  else
    v5 = 0;
  return v5;
}

- (void)configureFocusContainerGuideController:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;

  v3 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[MapsExternalDevice sharedInstance](MapsExternalDevice, "sharedInstance"));
  if (objc_msgSend(v5, "rightHandDrive"))
    v4 = 3;
  else
    v4 = 9;
  objc_msgSend(v3, "setActiveEdges:", v4);

}

- (void)modeWillPop
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController routePlanningSession](self, "routePlanningSession"));

  if (v3)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "platformController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController routePlanningSession](self, "routePlanningSession"));
    objc_msgSend(v4, "clearIfCurrentSession:", v5);

  }
}

- (void)layoutForUnobscuredBoundsChange
{
  -[CarRoutePlanningModeController _centerOnRouteOrPinsAnimated:](self, "_centerOnRouteOrPinsAnimated:", +[UIView _maps_shouldAdoptImplicitAnimationParameters](UIView, "_maps_shouldAdoptImplicitAnimationParameters"));
}

- (id)personalizedItemSources
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController chromeViewController](self, "chromeViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "searchPinsManager"));

  if (!v4)
    return &__NSArray0__struct;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController chromeViewController](self, "chromeViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "searchPinsManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "routeStartEndItemSource"));
  v10 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));

  return v8;
}

- (id)desiredCards
{
  const __CFString *v3;

  v3 = CFSTR("primary");
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v3, 1));
}

- (void)configureCard:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *carAdvisoryListCardViewController;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  void *v30;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _OWORD v45[2];
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  int v49;
  uint64_t v50;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  char v54;
  _BYTE v55[7];
  uint64_t v56;
  char v57;
  _OWORD v58[2];
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  int v62;
  uint64_t v63;
  uint64_t v64;
  __int128 v65;
  __int128 v66;
  char v67;
  _BYTE v68[7];
  uint64_t v69;
  char v70;
  _OWORD v71[2];
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  int v75;
  uint64_t v76;
  uint64_t v77;
  __int128 v78;
  __int128 v79;
  char v80;
  _BYTE v81[7];
  uint64_t v82;
  char v83;

  v6 = a3;
  v7 = a4;
  switch(-[CarRoutePlanningModeController state](self, "state"))
  {
    case 0:
      if (objc_msgSend(v7, "isEqualToString:", CFSTR("primary")))
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController fullSearchResults](self, "fullSearchResults"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "name"));
        objc_msgSend(v6, "setTitle:", v10);

        v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController placeCard](self, "placeCard"));
        objc_msgSend(v6, "setTitleNumberOfLines:", objc_msgSend(v11, "titleNumberOfLines"));

        objc_msgSend(v6, "setAccessory:", 1);
        memset(v81, 0, sizeof(v81));
        v71[0] = xmmword_100E34B90;
        v71[1] = xmmword_100E2D550;
        v72 = 3;
        v73 = 1148846080;
        v74 = 2;
        v75 = 1148846080;
        v76 = 0;
        v77 = 0;
        __asm { FMOV            V0.2D, #8.0 }
        v78 = _Q0;
        v79 = _Q0;
        v80 = 1;
        v82 = 8;
        v83 = 0;
        if (v6)
          objc_msgSend(v6, "setLayout:", v71);
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController placeCard](self, "placeCard"));
        objc_msgSend(v6, "setContent:", v17);

        -[CarRoutePlanningModeController _updateRouteAdvisories](self, "_updateRouteAdvisories");
      }
      break;
    case 1:
      v18 = -[CarAdvisoryListCardViewController numberOfItems](self->_carAdvisoryListCardViewController, "numberOfItems");
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v20 = v19;
      if (v18 >= 2)
        v21 = CFSTR("RoutePlanning_advisories");
      else
        v21 = CFSTR("RoutePlanning_advisory");
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", v21, CFSTR("localized string not found"), 0));
      objc_msgSend(v6, "setTitle:", v22);

      objc_msgSend(v6, "setAccessory:", 1);
      memset(v68, 0, sizeof(v68));
      v58[0] = xmmword_100E34B90;
      v58[1] = xmmword_100E2D550;
      v59 = 3;
      v60 = 1148846080;
      v61 = 2;
      v62 = 1148846080;
      v63 = 0;
      v64 = 0;
      __asm { FMOV            V0.2D, #8.0 }
      v65 = _Q0;
      v66 = _Q0;
      v67 = 1;
      v69 = 8;
      v70 = 0;
      if (v6)
        objc_msgSend(v6, "setLayout:", v58);
      carAdvisoryListCardViewController = self->_carAdvisoryListCardViewController;
      goto LABEL_18;
    case 2:
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[CarAdvisoryDetailCardViewController advisoryItem](self->_carAdvisoryDetailCardViewController, "advisoryItem"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "titleString"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "stringWithDefaultOptions"));
      objc_msgSend(v6, "setTitle:", v27);

      objc_msgSend(v6, "setAccessory:", 1);
      memset(v55, 0, sizeof(v55));
      v45[0] = xmmword_100E34B90;
      v45[1] = xmmword_100E2D550;
      v46 = 3;
      v47 = 1148846080;
      v48 = 2;
      v49 = 1148846080;
      v50 = 0;
      v51 = 0;
      __asm { FMOV            V0.2D, #8.0 }
      v52 = _Q0;
      v53 = _Q0;
      v54 = 1;
      v56 = 8;
      v57 = 0;
      if (v6)
        objc_msgSend(v6, "setLayout:", v45);
      carAdvisoryListCardViewController = self->_carAdvisoryDetailCardViewController;
      goto LABEL_18;
    case 3:
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("Available Now [Carplay EV Charging Availability header]"), CFSTR("localized string not found"), 0));
      objc_msgSend(v6, "setTitle:", v30);

      objc_msgSend(v6, "setAccessory:", 1);
      HIDWORD(v42) = 0;
      *(_DWORD *)((char *)&v42 + 1) = 0;
      v32 = xmmword_100E34B90;
      v33 = xmmword_100E2D550;
      v34 = 3;
      v35 = 1148846080;
      v36 = 2;
      LODWORD(v37) = 1148846080;
      v38 = 0;
      v39 = 0;
      __asm { FMOV            V0.2D, #8.0 }
      v40 = _Q0;
      v41 = _Q0;
      LOBYTE(v42) = 1;
      v43 = 8;
      LOBYTE(v44) = 0;
      if (v6)
        objc_msgSend(v6, "setLayout:", &v32);
      carAdvisoryListCardViewController = self->_evChargingAvailabilityVC;
LABEL_18:
      objc_msgSend(v6, "setContent:", carAdvisoryListCardViewController, v32, v33, v34, v35, v36, v37, v38, v39, v40, v41, v42, v43, v44);
      -[CarRoutePlanningModeController _hideAdvisories](self, "_hideAdvisories");
      break;
    default:
      break;
  }

}

- (BOOL)zoomInButtonPressed
{
  -[CarRoutePlanningModeController _zoomIn](self, "_zoomIn");
  return 1;
}

- (BOOL)zoomOutButtonPressed
{
  -[CarRoutePlanningModeController _zoomOut](self, "_zoomOut");
  return 1;
}

- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  CarPlaceCardCardViewController *v16;
  void *v17;
  CarPlaceCardCardViewController *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  NSObject *v25;
  id v26;
  NSObject *v27;
  char *v28;
  _QWORD v29[5];
  id v30;
  _QWORD v31[5];
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  const char *v39;

  v6 = a3;
  v7 = a4;
  if (!self->_waypointsController)
  {
    v24 = sub_1004318FC();
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v33 = "-[CarRoutePlanningModeController becomeTopContextInChromeViewController:withAnimation:]";
      v34 = 2080;
      v35 = "CarRoutePlanningModeController.m";
      v36 = 1024;
      v37 = 540;
      v38 = 2080;
      v39 = "_waypointsController != nil";
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v26 = sub_1004318FC();
      v27 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v28 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v33 = v28;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "platformController"));
  objc_msgSend(v9, "addObserver:", self);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "platformController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "currentSession"));

  v13 = objc_opt_class(RoutePlanningSession);
  if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
    v14 = v12;
  else
    v14 = 0;
  v15 = v14;

  -[CarRoutePlanningModeController setRoutePlanningSession:](self, "setRoutePlanningSession:", v15);
  v16 = [CarPlaceCardCardViewController alloc];
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray firstObject](self->_fullSearchResults, "firstObject"));
  v18 = -[CarPlaceCardCardViewController initWithSearchResult:style:dataSource:delegate:](v16, "initWithSearchResult:style:dataSource:delegate:", v17, 0, self, self);
  -[CarRoutePlanningModeController setPlaceCard:](self, "setPlaceCard:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[MapsExternalDevice sharedInstance](MapsExternalDevice, "sharedInstance"));
  -[CarRoutePlanningModeController setNavigationAidedDrivingEnabled:](self, "setNavigationAidedDrivingEnabled:", objc_msgSend(v19, "isNavigationAidedDrivingEnabled"));

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v20, "addObserver:selector:name:object:", self, "_vehicleOnboardingFinished", CFSTR("EVOnboardingFinishedNotification"), 0);

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v21, "addObserver:selector:name:object:", self, "_chromeViewControllerDidUpdateMapInsets:", CFSTR("ChromeViewControllerDidUpdateMapInsetsNotification"), v6);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController personalizedItemManager](self, "personalizedItemManager"));
  objc_msgSend(v22, "addObserver:", self);

  v30 = v6;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100440AF4;
  v31[3] = &unk_1011AC860;
  v31[4] = self;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100440C20;
  v29[3] = &unk_1011ACCB8;
  v29[4] = self;
  v23 = v6;
  objc_msgSend(v7, "addPreparation:animations:completion:", v31, &stru_1011B6DA0, v29);

}

- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  CarFocusableImageButton *zoomButton;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;

  v5 = a3;
  -[CarRoutePlanningModeController _hideAdvisories](self, "_hideAdvisories");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
  objc_msgSend(v6, "dismissCurrentInterruptionOfKind:", 9);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
  objc_msgSend(v7, "dismissCurrentInterruptionOfKind:", 11);

  -[CarFocusableImageButton removeFromSuperview](self->_zoomButton, "removeFromSuperview");
  zoomButton = self->_zoomButton;
  self->_zoomButton = 0;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController chromeViewController](self, "chromeViewController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "searchPinsManager"));
  objc_msgSend(v10, "removePOIShapeLoadingObserver:", self);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController chromeViewController](self, "chromeViewController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "mapView"));
  objc_msgSend(v12, "setScrollEnabled:", self->_scrollWasEnabled);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v13, "removeObserver:name:object:", self, CFSTR("EVOnboardingFinishedNotification"), 0);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v14, "removeObserver:name:object:", self, CFSTR("ChromeViewControllerDidUpdateMapInsetsNotification"), v5);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController personalizedItemManager](self, "personalizedItemManager"));
  objc_msgSend(v15, "removeObserver:", self);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "platformController"));
  objc_msgSend(v17, "removeObserver:", self);

  -[CarRoutePlanningModeController _dismissPlaceCardAlertControllerIfNeeded](self, "_dismissPlaceCardAlertControllerIfNeeded");
  v21 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "nextTopContext"));

  v18 = objc_opt_class(CarNavigationModeController);
  if ((objc_opt_isKindOfClass(v21, v18) & 1) == 0)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController searchPinsManager](self, "searchPinsManager"));
    objc_msgSend(v19, "clearDirectionsPins");

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController searchPinsManager](self, "searchPinsManager"));
    objc_msgSend(v20, "clearDroppedPin");

  }
}

- (void)chromeDidStartConfiguringCards:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController desiredCards](self, "desiredCards"));
  v6 = objc_msgSend(v4, "isEqualToArray:", v5);

  if (v6)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController placeCard](self, "placeCard"));
    objc_msgSend(v7, "setHasCardFinishedTransitioning:", 0);

  }
}

- (void)chromeDidEndConfiguringCards:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController desiredCards](self, "desiredCards"));
  v6 = objc_msgSend(v4, "isEqualToArray:", v5);

  if (v6)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController placeCard](self, "placeCard"));
    objc_msgSend(v7, "setHasCardFinishedTransitioning:", 1);

  }
}

- (void)setState:(int64_t)a3
{
  id v5;
  NSObject *v6;
  const __CFString *v7;
  void *v8;
  int v9;
  const __CFString *v10;

  if (self->_state != a3)
  {
    self->_state = a3;
    v5 = sub_10043364C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      if ((unint64_t)(a3 - 1) > 2)
        v7 = CFSTR("CarRoutePlanningViewControllerStatePlaceCard");
      else
        v7 = *(&off_1011B6F78 + a3 - 1);
      v9 = 138412290;
      v10 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "CarRoutePlanningModeController: setState: %@, -> updating cardsOverlay.", (uint8_t *)&v9, 0xCu);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController chromeViewController](self, "chromeViewController"));
    objc_msgSend(v8, "updateCardsForContext:animated:", self, 1);

  }
}

- (BOOL)_isAuthorizedForPreciseLocation
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  v3 = objc_msgSend(v2, "isAuthorizedForPreciseLocation");

  return v3;
}

- (void)_updatedExternalDevice:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  -[CarRoutePlanningModeController setNavigationAidedDrivingEnabled:](self, "setNavigationAidedDrivingEnabled:", objc_msgSend(v4, "isNavigationAidedDrivingEnabled"));

}

- (void)setNavigationAidedDrivingEnabled:(BOOL)a3
{
  id v4;

  if (self->_navigationAidedDrivingEnabled != a3)
  {
    self->_navigationAidedDrivingEnabled = a3;
    v4 = (id)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController chromeViewController](self, "chromeViewController"));
    -[CarRoutePlanningModeController _showPinsAnimated:](self, "_showPinsAnimated:", objc_msgSend(v4, "isCurrentContext:", self));

  }
}

- (void)virtualGarage:(id)a3 didUpdateUnpairedVehicles:(id)a4
{
  id v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v5 = a4;
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100441288;
  block[3] = &unk_1011AD1E8;
  objc_copyWeak(&v9, &location);
  v8 = v5;
  v6 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_virtualGarageDidUpdateUnpairedVehicles:(id)a3
{
  id v4;
  id v5;
  void *v6;
  VGVehicle *v7;
  VGVehicle *unpairedVehicle;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id location;

  v4 = a3;
  v5 = sub_10039E080(v4, &stru_1011B6DE0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (VGVehicle *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
  unpairedVehicle = self->_unpairedVehicle;
  self->_unpairedVehicle = v7;

  if (objc_msgSend(v6, "count"))
  {
    if (!self->_evOnboardingHintState
      && -[CarRoutePlanningModeController _shouldShowOnboardingHintForVehicle:](self, "_shouldShowOnboardingHintForVehicle:", self->_unpairedVehicle))
    {
      self->_evOnboardingHintState = 1;
      objc_initWeak(&location, self);
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController carChromeViewController](self, "carChromeViewController"));
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_100441498;
      v11[3] = &unk_1011AD4F0;
      objc_copyWeak(&v12, &location);
      objc_msgSend(v9, "whenContextNextBecomesCurrent:performAction:withBlock:", self, CFSTR("CarRoutePlanningPresentEVOnboardingHintKey"), v11);

      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    self->_evOnboardingHintState = 0;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController chromeViewController](self, "chromeViewController"));
    objc_msgSend(v10, "dismissCurrentInterruptionOfKind:", 18);

  }
}

- (BOOL)_shouldShowOnboardingHintForVehicle:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  id v20;
  BOOL v21;
  id v23;
  NSObject *v24;
  id v25;
  NSObject *v26;
  char *v27;
  int v28;
  const char *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  const char *v35;

  v3 = a3;
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "iapIdentifier"));
    v6 = (void *)v5;
    if (v5)
      v7 = (const __CFString *)v5;
    else
      v7 = &stru_1011EB268;
    objc_msgSend(v4, "appendString:", v7);

    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "displayName"));
    v9 = (void *)v8;
    if (v8)
      v10 = (const __CFString *)v8;
    else
      v10 = &stru_1011EB268;
    objc_msgSend(v4, "appendString:", v10);

    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "year"));
    v12 = (void *)v11;
    if (v11)
      v13 = (const __CFString *)v11;
    else
      v13 = &stru_1011EB268;
    objc_msgSend(v4, "appendString:", v13);

    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "model"));
    v15 = (void *)v14;
    if (v14)
      v16 = (const __CFString *)v14;
    else
      v16 = &stru_1011EB268;
    objc_msgSend(v4, "appendString:", v16);

    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "manufacturer"));
    v18 = (void *)v17;
    if (v17)
      v19 = (const __CFString *)v17;
    else
      v19 = &stru_1011EB268;
    objc_msgSend(v4, "appendString:", v19);

    v20 = objc_msgSend(v4, "copy");
  }
  else
  {
    v23 = sub_1004318FC();
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v28 = 136315906;
      v29 = "NSString *_DictionaryKeyForUnpairedVehicle(VGVehicle *__strong)";
      v30 = 2080;
      v31 = "CarRoutePlanningModeController.m";
      v32 = 1024;
      v33 = 707;
      v34 = 2080;
      v35 = "vehicle != nil";
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", (uint8_t *)&v28, 0x26u);
    }

    if (sub_100A70734())
    {
      v25 = sub_1004318FC();
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v27 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v28 = 138412290;
        v29 = v27;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v28, 0xCu);

      }
    }
    v20 = 0;
  }
  v21 = sub_100BA0DCC(v20);

  return v21;
}

- (void)_presentEVOnboardingHintForVehicle:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  uint64_t v21;
  void *v22;
  const __CFString *v23;
  uint64_t v24;
  void *v25;
  const __CFString *v26;
  __CFString *v27;
  const __CFString *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  NSObject *v39;
  id v40;
  NSObject *v41;
  id v42;
  NSObject *v43;
  char *v44;
  id v45;
  NSObject *v46;
  id v47;
  NSObject *v48;
  char *v49;
  id v50;
  int64_t evOnboardingHintState;
  const char *v52;
  NSObject *v53;
  uint32_t v54;
  id v55;
  NSObject *v56;
  id v57;
  NSObject *v58;
  char *v59;
  id v60;
  void *v61;
  uint64_t v62;
  _QWORD v63[5];
  id v64;
  id v65;
  _QWORD v66[4];
  id v67;
  id v68;
  void *v69;
  _QWORD v70[3];
  _QWORD v71[3];
  uint8_t buf[4];
  const char *v73;
  __int16 v74;
  const char *v75;
  __int16 v76;
  int v77;
  __int16 v78;
  const char *v79;

  v4 = a3;
  if (v4)
  {
    if (self->_evOnboardingHintState == 1)
      goto LABEL_3;
    v45 = sub_1004318FC();
    v46 = objc_claimAutoreleasedReturnValue(v45);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v73 = "-[CarRoutePlanningModeController _presentEVOnboardingHintForVehicle:]";
      v74 = 2080;
      v75 = "CarRoutePlanningModeController.m";
      v76 = 1024;
      v77 = 735;
      v78 = 2080;
      v79 = "_evOnboardingHintState == CarRoutePlanningEVOnboardingHintStateReadyToPresent";
      _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v47 = sub_1004318FC();
      v48 = objc_claimAutoreleasedReturnValue(v47);
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        v49 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v73 = v49;
        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
    if (self->_evOnboardingHintState == 1)
    {
LABEL_3:
      if (-[CarRoutePlanningModeController _shouldShowOnboardingHintForVehicle:](self, "_shouldShowOnboardingHintForVehicle:", v4))
      {
        v5 = sub_10043173C();
        v6 = objc_claimAutoreleasedReturnValue(v5);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Will display CarPlay alert to forward the user to onboard on phone.", buf, 2u);
        }

        v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v62 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("EV Onboarding title [CarPlay]"), CFSTR("localized string not found"), 0));

        v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "manufacturer"));
        v9 = (void *)v8;
        if (v8)
        {
          v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v62, v8));
        }
        else
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "displayName"));
          v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v62, v10));

        }
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("EV Onboarding message [CarPlay]"), CFSTR("localized string not found"), 0));

        v13 = v4;
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
        v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "iapIdentifier"));
        v16 = (void *)v15;
        if (v15)
          v17 = (const __CFString *)v15;
        else
          v17 = &stru_1011EB268;
        objc_msgSend(v14, "appendString:", v17);

        v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "displayName"));
        v19 = (void *)v18;
        if (v18)
          v20 = (const __CFString *)v18;
        else
          v20 = &stru_1011EB268;
        objc_msgSend(v14, "appendString:", v20);

        v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "year"));
        v22 = (void *)v21;
        if (v21)
          v23 = (const __CFString *)v21;
        else
          v23 = &stru_1011EB268;
        objc_msgSend(v14, "appendString:", v23);

        v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "model"));
        v25 = (void *)v24;
        if (v24)
          v26 = (const __CFString *)v24;
        else
          v26 = &stru_1011EB268;
        objc_msgSend(v14, "appendString:", v26);

        v27 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "manufacturer"));
        if (v27)
          v28 = v27;
        else
          v28 = &stru_1011EB268;
        objc_msgSend(v14, "appendString:", v28);

        v29 = objc_msgSend(v14, "copy");
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("OK [CarPlay EV Onboarding]"), CFSTR("localized string not found"), 0));
        v66[0] = _NSConcreteStackBlock;
        v66[1] = 3221225472;
        v66[2] = sub_100441F78;
        v66[3] = &unk_1011AC8B0;
        v67 = v13;
        v32 = v29;
        v68 = v32;
        v33 = (void *)objc_claimAutoreleasedReturnValue(+[MapsInterruptionAction actionWithTitle:cancels:handler:](MapsInterruptionAction, "actionWithTitle:cancels:handler:", v31, 0, v66));

        objc_initWeak((id *)buf, self);
        v34 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
        v70[0] = CFSTR("kMapsInterruptionTitle");
        v70[1] = CFSTR("kMapsInterruptionMessage");
        v71[0] = v61;
        v71[1] = v12;
        v70[2] = CFSTR("kMapsInterruptionActions");
        v69 = v33;
        v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v69, 1));
        v71[2] = v35;
        v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v71, v70, 3));
        v63[0] = _NSConcreteStackBlock;
        v63[1] = 3221225472;
        v63[2] = sub_100442078;
        v63[3] = &unk_1011B6E08;
        objc_copyWeak(&v65, (id *)buf);
        v63[4] = self;
        v37 = v32;
        v64 = v37;
        v38 = objc_msgSend(v34, "presentInterruptionOfKind:userInfo:completionHandler:", 18, v36, v63);

        objc_destroyWeak(&v65);
        objc_destroyWeak((id *)buf);

        v39 = v62;
        goto LABEL_25;
      }
      v55 = sub_1004318FC();
      v56 = objc_claimAutoreleasedReturnValue(v55);
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        v73 = "-[CarRoutePlanningModeController _presentEVOnboardingHintForVehicle:]";
        v74 = 2080;
        v75 = "CarRoutePlanningModeController.m";
        v76 = 1024;
        v77 = 742;
        v78 = 2080;
        v79 = "shouldPresentOnboardingHint";
        _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
      }

      if (sub_100A70734())
      {
        v57 = sub_1004318FC();
        v58 = objc_claimAutoreleasedReturnValue(v57);
        if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
        {
          v59 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          *(_DWORD *)buf = 138412290;
          v73 = v59;
          _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

        }
      }
      v60 = sub_10043173C();
      v39 = objc_claimAutoreleasedReturnValue(v60);
      if (!os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
        goto LABEL_25;
      *(_WORD *)buf = 0;
      v52 = "Won't display CarPlay alert, as shouldPresentOnboardingHint is false.";
      v53 = v39;
      v54 = 2;
    }
    else
    {
      v50 = sub_10043173C();
      v39 = objc_claimAutoreleasedReturnValue(v50);
      if (!os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
LABEL_25:

        goto LABEL_26;
      }
      evOnboardingHintState = self->_evOnboardingHintState;
      *(_DWORD *)buf = 134217984;
      v73 = (const char *)evOnboardingHintState;
      v52 = "Won't display CarPlay alert, because the state is %ld.";
      v53 = v39;
      v54 = 12;
    }
    _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_INFO, v52, buf, v54);
    goto LABEL_25;
  }
  v40 = sub_1004318FC();
  v41 = objc_claimAutoreleasedReturnValue(v40);
  if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315906;
    v73 = "-[CarRoutePlanningModeController _presentEVOnboardingHintForVehicle:]";
    v74 = 2080;
    v75 = "CarRoutePlanningModeController.m";
    v76 = 1024;
    v77 = 730;
    v78 = 2080;
    v79 = "vehicle != nil";
    _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
  }

  if (sub_100A70734())
  {
    v42 = sub_1004318FC();
    v39 = objc_claimAutoreleasedReturnValue(v42);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      v43 = v39;
      v44 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
      *(_DWORD *)buf = 138412290;
      v73 = v44;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      v39 = v43;
    }
    goto LABEL_25;
  }
LABEL_26:

}

- (void)_vehicleOnboardingFinished
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = sub_10043173C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "EV Onboarding finished while CP route planning was displayed. Let's offer disambiguation if needed.", v5, 2u);
  }

  -[CarRoutePlanningModeController _offerVehicleDisambiguationIfNeeded](self, "_offerVehicleDisambiguationIfNeeded");
}

- (void)_offerVehicleDisambiguationIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (MapsFeature_IsEnabled_EVRouting(self, a2))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "platformController"));
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "auxiliaryTasksManager"));

    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "vehicleDisambiguationTask"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController carChromeViewController](self, "carChromeViewController"));
    objc_msgSend(v5, "displayDisambiguationPromptIfNeededFromChromeViewController:", v6);

  }
}

- (void)setSearchSession:(id)a3
{
  SearchSession *v5;
  SearchSession *searchSession;
  void *v7;
  id v8;
  void *v9;
  SearchSession *v10;

  v5 = (SearchSession *)a3;
  searchSession = self->_searchSession;
  v10 = v5;
  if (searchSession != v5)
  {
    -[SearchSession removeObserver:](searchSession, "removeObserver:", self);
    -[SearchSession invalidate](self->_searchSession, "invalidate");
    objc_storeStrong((id *)&self->_searchSession, a3);
    -[SearchSession addObserver:](self->_searchSession, "addObserver:", self);
    v5 = self->_searchSession;
  }
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSession currentResults](v5, "currentResults"));
    v8 = objc_msgSend(v7, "count");

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSession currentResults](self->_searchSession, "currentResults"));
      -[CarRoutePlanningModeController setSearchResults:selectedIndex:](self, "setSearchResults:selectedIndex:", v9, -[SearchSession selectedResultIndex](self->_searchSession, "selectedResultIndex"));

    }
  }

}

- (void)setSearchResults:(id)a3 selectedIndex:(unint64_t)a4
{
  id v6;
  CarWaypointsController *waypointsController;
  uint64_t v8;
  CarWaypointsController *v9;
  id v10;
  void *v11;
  CarSearchWaypointsController *v12;
  CarWaypointsController *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  CarWaypointsController *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  SearchSession *searchSession;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  id v27;
  NSObject *v28;
  char *v29;
  int v30;
  const char *v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  const char *v37;

  v6 = a3;
  if (!objc_msgSend(v6, "count"))
  {
    v25 = sub_1004318FC();
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v30 = 136315906;
      v31 = "-[CarRoutePlanningModeController setSearchResults:selectedIndex:]";
      v32 = 2080;
      v33 = "CarRoutePlanningModeController.m";
      v34 = 1024;
      v35 = 824;
      v36 = 2080;
      v37 = "searchResults.count > 0";
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v30, 0x26u);
    }

    if (sub_100A70734())
    {
      v27 = sub_1004318FC();
      v28 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        v29 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v30 = 138412290;
        v31 = v29;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v30, 0xCu);

      }
    }
  }
  if (objc_msgSend(v6, "count"))
  {
    waypointsController = self->_waypointsController;
    v8 = objc_opt_class(CarSearchWaypointsController);
    if ((objc_opt_isKindOfClass(waypointsController, v8) & 1) != 0)
    {
      v9 = self->_waypointsController;
      v10 = -[CarWaypointsController indexOfCurrentDestination](v9, "indexOfCurrentDestination");
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarWaypointsController searchResults](v9, "searchResults"));

      if (v10 == (id)a4 && (objc_msgSend(v11, "isEqualToArray:", v6) & 1) != 0)
        goto LABEL_13;

    }
    v12 = -[CarSearchWaypointsController initWithSearchResults:selectedIndex:]([CarSearchWaypointsController alloc], "initWithSearchResults:selectedIndex:", v6, a4);
    v13 = self->_waypointsController;
    self->_waypointsController = &v12->super;

    -[CarWaypointsController setAllowLooping:](self->_waypointsController, "setAllowLooping:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController userInfo](self, "userInfo"));
    -[CarWaypointsController setUserInfo:](self->_waypointsController, "setUserInfo:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController chromeViewController](self, "chromeViewController"));
    v16 = objc_msgSend(v15, "isCurrentContext:", self);

    if (v16)
    {
      v17 = self->_waypointsController;
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController chromeViewController](self, "chromeViewController"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "currentTraits"));
      -[CarWaypointsController startLoadWithTraits:](v17, "startLoadWithTraits:", v19);

      v20 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController placeCard](self, "placeCard"));
      objc_msgSend(v20, "reloadData");

      v21 = -[CarWaypointsController indexOfCurrentDestination](self->_waypointsController, "indexOfCurrentDestination");
      searchSession = self->_searchSession;
      if (searchSession)
      {
        if ((void *)-[SearchSession selectedResultIndex](searchSession, "selectedResultIndex") != v21)
          -[SearchSession setSelectedResultIndex:](self->_searchSession, "setSelectedResultIndex:", v21);
      }
    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController delegate](self, "delegate"));

    if (v23)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController delegate](self, "delegate"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", a4, 0));
      objc_msgSend(v11, "routePlanningMode:didSelectRouteAtIndex:", self, v24);

LABEL_13:
    }
  }

}

- (void)searchSessionDidInvalidate:(id)a3 reason:(unint64_t)a4
{
  SearchSession *v5;
  SearchSession *v6;

  v5 = (SearchSession *)a3;
  if (self->_searchSession == v5)
  {
    self->_searchSession = 0;
    v6 = v5;

    v5 = v6;
  }

}

- (void)searchSessionDidChangeSearchResults:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "origin") == (id)1)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentResults"));
    -[CarRoutePlanningModeController setSearchResults:selectedIndex:](self, "setSearchResults:selectedIndex:", v4, objc_msgSend(v5, "selectedResultIndex"));

  }
}

- (void)_updateLoading
{
  _BOOL8 v3;
  void *v4;
  _BOOL8 v5;
  void *v6;
  _BOOL8 v7;
  id v8;

  v3 = -[CarRoutePlanningModeController isLoading](self, "isLoading");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController placeCard](self, "placeCard"));
  objc_msgSend(v4, "setLoading:", v3);

  v5 = -[CarRoutePlanningModeController _goButtonShouldBeEnabled](self, "_goButtonShouldBeEnabled");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController placeCard](self, "placeCard"));
  objc_msgSend(v6, "setGoButtonEnabled:", v5);

  v7 = -[CarRoutePlanningModeController _goButtonShouldBeHidden](self, "_goButtonShouldBeHidden");
  v8 = (id)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController placeCard](self, "placeCard"));
  objc_msgSend(v8, "setGoButtonHidden:", v7);

}

- (void)handleHardwareBackButtonPressed
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  char *v11;
  int v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController placeCard](self, "placeCard"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "presentedViewController"));

  if (!v4)
  {
    v7 = sub_1004318FC();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v12 = 136315906;
      v13 = "-[CarRoutePlanningModeController handleHardwareBackButtonPressed]";
      v14 = 2080;
      v15 = "CarRoutePlanningModeController.m";
      v16 = 1024;
      v17 = 894;
      v18 = 2080;
      v19 = "self.placeCard.presentedViewController";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v12, 0x26u);
    }

    if (sub_100A70734())
    {
      v9 = sub_1004318FC();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v12 = 138412290;
        v13 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v12, 0xCu);

      }
    }
  }
  v5 = sub_10043364C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    LOWORD(v12) = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "routePlanning handleHardwareBackButtonPressed", (uint8_t *)&v12, 2u);
  }

  -[CarRoutePlanningModeController _dismissPlaceCardAlertControllerIfNeeded](self, "_dismissPlaceCardAlertControllerIfNeeded");
}

- (void)carCardViewCloseButtonTapped:(id)a3
{
  id v4;
  NSObject *v5;
  int64_t v6;
  const __CFString *v7;
  CarRoutePlanningModeController *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  const __CFString *v14;

  v4 = sub_10043364C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = -[CarRoutePlanningModeController state](self, "state");
    if ((unint64_t)(v6 - 1) > 2)
      v7 = CFSTR("CarRoutePlanningViewControllerStatePlaceCard");
    else
      v7 = *(&off_1011B6F78 + v6 - 1);
    v13 = 138412290;
    v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "CarRoutePlanningModeController: closeButtonTapped, currentState: %@", (uint8_t *)&v13, 0xCu);
  }

  switch(-[CarRoutePlanningModeController state](self, "state"))
  {
    case 0:
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[CarChromeModeCoordinator sharedInstance](CarChromeModeCoordinator, "sharedInstance"));
      objc_msgSend(v10, "popFromContext:", self);

      v11 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "platformController"));
      objc_msgSend(v12, "popSession");

      break;
    case 1:
    case 3:
      goto LABEL_7;
    case 2:
      if (-[CarAdvisoryListCardViewController numberOfItems](self->_carAdvisoryListCardViewController, "numberOfItems") < 2)
      {
LABEL_7:
        v8 = self;
        v9 = 0;
      }
      else
      {
        v8 = self;
        v9 = 1;
      }
      -[CarRoutePlanningModeController setState:](v8, "setState:", v9);
      break;
    default:
      return;
  }
}

- (void)_start
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[16];

  v3 = sub_10043364C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "routePlanning _start: presenting nav prompt.", buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController drivingRouteCollection](self, "drivingRouteCollection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentRoute"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100442C18;
  v8[3] = &unk_1011B6E30;
  v9 = v5;
  v7 = v5;
  +[NavigationSimulationPromptController promptIfNeededForSimulationForRoute:navigationTracePlayback:continueWithOptions:](NavigationSimulationPromptController, "promptIfNeededForSimulationForRoute:navigationTracePlayback:continueWithOptions:", v6, 0, v8);

}

- (void)_dismissPlaceCardAlertControllerIfNeeded
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id buf[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController placeCard](self, "placeCard"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "presentedViewController"));

  if (v4)
  {
    v5 = sub_10043364C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Dismissing place card's current modal VC.", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController placeCard](self, "placeCard"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100442ED0;
    v8[3] = &unk_1011AD260;
    objc_copyWeak(&v9, buf);
    objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, v8);

    objc_destroyWeak(&v9);
    objc_destroyWeak(buf);
  }
}

- (void)_presentInterruptionForError:(id)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;

  v15 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController chromeViewController](self, "chromeViewController"));
  v5 = objc_msgSend(v4, "isCurrentContext:", self);

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarWaypointsController destinationSearchResultIfAvailable](self->_waypointsController, "destinationSearchResultIfAvailable"));
    v7 = CarDisplayRegionForSearchResult(v6);
    v11 = CarInterruptionUserInfoForRoutingFailure(v15, v7, v8, v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
      v14 = objc_msgSend(v13, "presentInterruptionOfKind:userInfo:completionHandler:", 3, v12, 0);

    }
  }

}

- (id)etaForCurrentRoute
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController currentRoute](self, "currentRoute"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "guidanceETA"));

  return v3;
}

- (id)automaticSharingContacts
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession configuration](self->_routePlanningSession, "configuration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "automaticSharingContacts"));

  return v3;
}

- (id)routeMainDescriptionText
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController currentRoute](self, "currentRoute"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "planningDescriptionString"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringWithDefaultOptions"));

  if (objc_msgSend(v4, "length"))
    v5 = v4;
  else
    v5 = 0;

  return v5;
}

- (void)placeCardDidSelectGo:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController routePlanningSession](self, "routePlanningSession", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "navigationStateMonitoringTask"));
  objc_msgSend(v5, "cancelNavigationAutoLaunchIfNeccessary");

  -[CarRoutePlanningModeController _start](self, "_start");
}

- (void)placeCardDidSelectHandoff:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;
  uint8_t buf[4];
  void *v18;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController routePlanningSession](self, "routePlanningSession"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "navigationStateMonitoringTask"));
  objc_msgSend(v6, "cancelNavigationAutoLaunchIfNeccessary");

  objc_initWeak(&location, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarWaypointsController destinationSearchResultIfAvailable](self->_waypointsController, "destinationSearchResultIfAvailable"));
  v8 = sub_10043364C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
    *(_DWORD *)buf = 138477827;
    v18 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "routePlanning handing off to destination: %{private}@", buf, 0xCu);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MapsExternalDevice sharedInstance](MapsExternalDevice, "sharedInstance"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1004432EC;
  v13[3] = &unk_1011B6E58;
  objc_copyWeak(&v15, &location);
  v12 = v7;
  v14 = v12;
  objc_msgSend(v11, "handoffDestination:completion:", v12, v13);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

- (void)placeCardDidSelectCall:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  v4 = sub_10043364C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "routePlanning didSelectCall", v8, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController routePlanningSession](self, "routePlanningSession"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "navigationStateMonitoringTask"));
  objc_msgSend(v7, "cancelNavigationAutoLaunchIfNeccessary");

}

- (void)placeCard:(id)a3 didPresentAlert:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;

  v5 = a4;
  v6 = sub_10043364C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "title"));
    v12 = 138412290;
    v13 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "routePlanning didPresentAlert with title: %@", (uint8_t *)&v12, 0xCu);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController routePlanningSession](self, "routePlanningSession"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "navigationStateMonitoringTask"));
  objc_msgSend(v10, "cancelNavigationAutoLaunchIfNeccessary");

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController carChromeViewController](self, "carChromeViewController"));
  objc_msgSend(v11, "setHardwareBackButtonBehavior:forContext:", 1, self);

}

- (void)placeCardDidDismissAlert:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v4 = sub_10043364C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "routePlanning didDismissAlert", v7, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController carChromeViewController](self, "carChromeViewController"));
  objc_msgSend(v6, "setHardwareBackButtonBehavior:forContext:", 0, self);

}

- (void)placeCard:(id)a3 wantsToPresentEVAvailability:(id)a4
{
  -[CarRoutePlanningModeController setEvChargingAvailabilityVC:](self, "setEvChargingAvailabilityVC:", a4);
  -[CarRoutePlanningModeController setState:](self, "setState:", 3);
}

- (BOOL)_goButtonShouldBeEnabled
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController currentRoute](self, "currentRoute"));
  if (v3
    && (-[CarRoutePlanningModeController navigationAidedDrivingEnabled](self, "navigationAidedDrivingEnabled")
     || !-[CarRoutePlanningModeController isLoading](self, "isLoading")))
  {
    v4 = -[CarRoutePlanningModeController _isAuthorizedForPreciseLocation](self, "_isAuthorizedForPreciseLocation");
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)_goButtonShouldBeHidden
{
  void *v3;
  unsigned int v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController currentRoute](self, "currentRoute"));
  if (v3)
    v4 = !-[CarRoutePlanningModeController _isTurnByTurnSupportedForCurrentRoute](self, "_isTurnByTurnSupportedForCurrentRoute");
  else
    LOBYTE(v4) = 0;

  return v4;
}

- (void)_updateSelectedRouteIndex:(unint64_t)a3
{
  void *v5;
  unsigned int v6;
  id v7;

  if (a3 != 0x7FFFFFFFFFFFFFFFLL
    && -[CarRoutePlanningModeController selectedRouteIndex](self, "selectedRouteIndex") != a3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController chromeViewController](self, "chromeViewController"));
    v6 = objc_msgSend(v5, "isCurrentContext:", self);

    if (v6)
    {
      v7 = (id)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController routePlanningSession](self, "routePlanningSession"));
      objc_msgSend(v7, "setSelectedRouteIndex:forTransportType:", a3, 1);

    }
  }
}

- (void)_centerOnRouteOrPinsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  _BOOL4 zoomToDestination;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController currentRoute](self, "currentRoute"));
  if (v5 && (zoomToDestination = self->_zoomToDestination, v5, !zoomToDestination))
    -[CarRoutePlanningModeController _recenterOnRouteAnimated:](self, "_recenterOnRouteAnimated:", v3);
  else
    -[CarRoutePlanningModeController _showPinsAnimated:](self, "_showPinsAnimated:", v3);
}

- (void)_toggleZoom:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController routePlanningSession](self, "routePlanningSession", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "navigationStateMonitoringTask"));
  objc_msgSend(v5, "cancelNavigationAutoLaunchIfNeccessary");

  if (self->_zoomToDestination)
    -[CarRoutePlanningModeController _zoomOut](self, "_zoomOut");
  else
    -[CarRoutePlanningModeController _zoomIn](self, "_zoomIn");
}

- (void)_zoomIn
{
  void *v3;

  if (!self->_zoomToDestination)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController chromeViewController](self, "chromeViewController"));
    objc_msgSend(v3, "captureUserAction:", 1049);

    self->_zoomToDestination = 1;
    -[CarRoutePlanningModeController _centerOnRouteOrPinsAnimated:](self, "_centerOnRouteOrPinsAnimated:", 1);
  }
}

- (void)_zoomOut
{
  void *v3;

  if (self->_zoomToDestination)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController chromeViewController](self, "chromeViewController"));
    objc_msgSend(v3, "captureUserAction:", 1050);

    self->_zoomToDestination = 0;
    -[CarRoutePlanningModeController _centerOnRouteOrPinsAnimated:](self, "_centerOnRouteOrPinsAnimated:", 1);
  }
}

- (void)_updateZoomButtonContent
{
  const __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  CarFocusableImageButton *v7;
  CarFocusableImageButton *zoomButton;
  const __CFString *v9;
  void *v10;
  _BOOL4 zoomToDestination;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
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
  _QWORD v34[4];
  _QWORD v35[2];
  _QWORD v36[2];

  if (self->_zoomToDestination)
    v3 = CFSTR("minus");
  else
    v3 = CFSTR("plus");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _mapsCar_systemImageNamed:textStyle:](UIImage, "_mapsCar_systemImageNamed:textStyle:", v3, UIFontTextStyleSubheadline));
  if (!self->_zoomButton)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController chromeViewController](self, "chromeViewController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "viewport"));

    if (v6)
    {
      v7 = -[CarFocusableImageButton initWithImage:]([CarFocusableImageButton alloc], "initWithImage:", v4);
      zoomButton = self->_zoomButton;
      self->_zoomButton = v7;

      if (self->_zoomToDestination)
        v9 = CFSTR("Out");
      else
        v9 = CFSTR("In");
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("ZoomButton."), "stringByAppendingString:", v9));
      -[CarFocusableImageButton setAccessibilityIdentifier:](self->_zoomButton, "setAccessibilityIdentifier:", v10);

      -[CarFocusableImageButton setTranslatesAutoresizingMaskIntoConstraints:](self->_zoomButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[CarFocusableImageButton addTarget:action:forControlEvents:](self->_zoomButton, "addTarget:action:forControlEvents:", self, "_toggleZoom:", 64);
      -[CarFocusableBlurControl setRoundedCornerRadius:](self->_zoomButton, "setRoundedCornerRadius:", 14.0);
      zoomToDestination = self->_zoomToDestination;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v13 = v12;
      if (zoomToDestination)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("CarPlay_ZoomOut"), CFSTR("localized string not found"), 0));
        v36[0] = v14;
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("CarPlay_Minus"), CFSTR("localized string not found"), 0));
        v36[1] = v16;
        v17 = v36;
      }
      else
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("CarPlay_ZoomIn"), CFSTR("localized string not found"), 0));
        v35[0] = v14;
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("CarPlay_Plus"), CFSTR("localized string not found"), 0));
        v35[1] = v16;
        v17 = v35;
      }
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v17, 2));
      -[CarFocusableImageButton setAccessibilityUserInputLabels:](self->_zoomButton, "setAccessibilityUserInputLabels:", v18);

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController chromeViewController](self, "chromeViewController"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "viewport"));

      objc_msgSend(v20, "addSubview:", self->_zoomButton);
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusableImageButton _maps_rightRHDAnchor](self->_zoomButton, "_maps_rightRHDAnchor"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "_maps_rightRHDAnchor"));
      LODWORD(v21) = 1148846080;
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "_maps_constraintWithRHDAnchor:relation:constant:priority:", v32, 0, -10.0, v21));
      v34[0] = v31;
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusableImageButton bottomAnchor](self->_zoomButton, "bottomAnchor"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "bottomAnchor"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:constant:", v29, -10.0));
      v34[1] = v22;
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusableImageButton widthAnchor](self->_zoomButton, "widthAnchor"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToConstant:", 28.0));
      v34[2] = v24;
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusableImageButton widthAnchor](self->_zoomButton, "widthAnchor"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusableImageButton heightAnchor](self->_zoomButton, "heightAnchor"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:", v26));
      v34[3] = v27;
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v34, 4));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v28);

    }
  }
  -[CarFocusableImageButton setImage:](self->_zoomButton, "setImage:", v4);

}

- (void)_updateZoomButtonContentAndVisibilityWithMapRect:(id)a3
{
  double var1;
  double var0;
  void *v6;
  BOOL v7;
  _BOOL8 v8;
  double v9;
  double v10;
  id v11;
  CLLocationCoordinate2D v12;
  MKCoordinateRegion v13;

  var1 = a3.var1.var1;
  var0 = a3.var1.var0;
  -[CarRoutePlanningModeController _updateZoomButtonContent](self, "_updateZoomButtonContent", a3.var0.var0, a3.var0.var1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarWaypointsController destinationSearchResultIfAvailable](self->_waypointsController, "destinationSearchResultIfAvailable"));
  v7 = self->_zoomToDestination || v6 == 0;
  v11 = v6;
  if (v7)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v6, "coordinate");
    v13 = MKCoordinateRegionMakeWithDistance(v12, 350.0, 350.0);
    MKMapRectForCoordinateRegion((__n128)v13.center, *(__n128 *)&v13.center.longitude, (__n128)v13.span, *(__n128 *)&v13.span.longitudeDelta);
    v8 = v10 > var1 && v9 > var0;
  }
  -[CarFocusableImageButton setHidden:](self->_zoomButton, "setHidden:", v8);

}

- (void)_showPinsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  unsigned int v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  void *v14;
  id v15;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController chromeViewController](self, "chromeViewController"));
  v6 = objc_msgSend(v5, "isCurrentContext:", self);

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController currentRoute](self, "currentRoute"));
    v8 = v7 != 0;

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController searchPinsManager](self, "searchPinsManager"));
    objc_msgSend(v9, "setDisableStartPin:", v8);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController searchPinsManager](self, "searchPinsManager"));
    objc_msgSend(v10, "setDisableEndPins:", v8);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
    v12 = objc_msgSend(v11, "hasLocation");

    v15 = (id)objc_claimAutoreleasedReturnValue(-[CarWaypointsController originSearchResult](self->_waypointsController, "originSearchResult"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarWaypointsController destinationSearchResultIfAvailable](self->_waypointsController, "destinationSearchResultIfAvailable"));
    if (v13 && ((v12 & 1) != 0 || (objc_msgSend(v15, "isDynamicCurrentLocation") & 1) == 0))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController searchPinsManager](self, "searchPinsManager"));
      objc_msgSend(v14, "setStartPin:endPin:", v15, v13);
    }
    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController searchPinsManager](self, "searchPinsManager"));
      objc_msgSend(v14, "clearDirectionsPins");
    }

    -[CarRoutePlanningModeController _recenterOnRouteAnimated:](self, "_recenterOnRouteAnimated:", v3);
  }
}

- (void)poiShapeLoader:(id)a3 didLoadStartPOIShape:(id)a4 endPOIShapes:(id)a5
{
  -[CarRoutePlanningModeController _recenterOnRouteAnimated:](self, "_recenterOnRouteAnimated:", 1, a4, a5);
}

- (BOOL)_isTurnByTurnSupportedForCurrentRoute
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController routePlanningSession](self, "routePlanningSession"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentRouteCollection"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentRoute"));

  if (!v5)
    return 1;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController routePlanningSession](self, "routePlanningSession"));
  v7 = objc_msgSend(v6, "navigationTypeForCurrentRoute") == (id)3;

  return v7;
}

- (int64_t)_interruptionKindForCurrentRoute
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  id v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController routePlanningSession](self, "routePlanningSession"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentRouteCollection"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentRoute"));

  if (!v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController routePlanningSession](self, "routePlanningSession"));
    v8 = objc_msgSend(v7, "currentTransportType") != (id)1;

    v6 = 8 * v8;
    goto LABEL_12;
  }
  if (objc_msgSend(v5, "transportType"))
  {
    v6 = 8;
    goto LABEL_12;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "routeAttributes"));
  if (objc_msgSend(v9, "hasTimepoint"))
  {

LABEL_11:
    v6 = 9;
    goto LABEL_12;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "origin"));
  v11 = objc_msgSend(v10, "isCurrentLocation");

  if (!v11)
    goto LABEL_11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController routePlanningSession](self, "routePlanningSession"));
  v13 = objc_msgSend(v12, "navigationTypeForCurrentRoute");

  if (v13 == (id)3)
    v6 = 0;
  else
    v6 = 11;
LABEL_12:

  return v6;
}

- (id)_preciseLocationOffAdvisory
{
  id v3;

  if (-[CarRoutePlanningModeController _isAuthorizedForPreciseLocation](self, "_isAuthorizedForPreciseLocation"))
    return 0;
  v3 = CarDisplayPreciseLocationOffAdvisory();
  return (id)objc_claimAutoreleasedReturnValue(v3);
}

- (id)_turnByTurnNotAvailableAdvisory
{
  id v2;
  void *v3;

  if (-[CarRoutePlanningModeController _goButtonShouldBeHidden](self, "_goButtonShouldBeHidden"))
  {
    v2 = CarDisplayTurnByTurnNotAvailableAdvisory();
    v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)_clickableAdvisoryDescriptionForRoute:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "clickableAdvisory"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "titleString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringWithDefaultOptions"));

  return v5;
}

- (void)_updateRouteAdvisories
{
  void *v3;
  _QWORD v4[5];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController chromeViewController](self, "chromeViewController"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100444448;
  v4[3] = &unk_1011AC888;
  objc_copyWeak(&v5, &location);
  v4[4] = self;
  objc_msgSend(v3, "whenContextNextBecomesCurrent:performAction:withBlock:", self, CFSTR("CarRoutePlanningUpdateRouteAdvisory"), v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_hideAdvisories
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController advisoryLabel](self, "advisoryLabel"));
  objc_msgSend(v3, "removeFromSuperview");

  -[CarRoutePlanningModeController setAdvisoryLabel:](self, "setAdvisoryLabel:", 0);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController chromeViewController](self, "chromeViewController"));
  objc_msgSend(v4, "setNeedsUpdateMapInsets");

}

- (void)advisoryListCardDidSelectAdvisoryItem:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v5, "captureUserAction:onTarget:forAdvisoryItem:", 250, 1007, v4);

  -[CarAdvisoryDetailCardViewController setAdvisoryItem:](self->_carAdvisoryDetailCardViewController, "setAdvisoryItem:", v4);
  -[CarRoutePlanningModeController setState:](self, "setState:", 2);
}

- (void)clickabilityChanged
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController chromeViewController](self, "chromeViewController"));
  objc_msgSend(v2, "setNeedsFocusUpdate");

}

- (void)displayAdvisories
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (-[CarAdvisoryListCardViewController numberOfItems](self->_carAdvisoryListCardViewController, "numberOfItems") < 2)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController currentRoute](self, "currentRoute"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "clickableAdvisory"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "advisoryItems"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
    -[CarRoutePlanningModeController advisoryListCardDidSelectAdvisoryItem:](self, "advisoryListCardDidSelectAdvisoryItem:", v5);

  }
  else
  {
    -[CarRoutePlanningModeController setState:](self, "setState:", 1);
  }
}

- (BOOL)updateRouteAnnotationsConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  unsigned int v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController routePlanningSession](self, "routePlanningSession"));
  if (objc_msgSend(v5, "currentTransportType") != (id)1
    || -[CarRoutePlanningModeController navigationAidedDrivingEnabled](self, "navigationAidedDrivingEnabled")
    || -[CarRoutePlanningModeController _goButtonShouldBeHidden](self, "_goButtonShouldBeHidden"))
  {

LABEL_5:
    v6 = 0;
    goto LABEL_6;
  }
  v19 = -[CarRoutePlanningModeController _isAuthorizedForPreciseLocation](self, "_isAuthorizedForPreciseLocation");

  if (!v19)
    goto LABEL_5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController drivingRoutes](self, "drivingRoutes"));
LABEL_6:
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController searchPinsManager](self, "searchPinsManager", (_QWORD)v20));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "routeStartEndItemSource"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController personalizedItemManager](self, "personalizedItemManager"));
        objc_msgSend(v12, "updateWaypointStyleAttributesWithItemSource:personalizedItemManager:", v14, v15);

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }

  if (v7)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController chromeViewController](self, "chromeViewController"));
    objc_msgSend(v16, "captureUserAction:", 3072);

    objc_msgSend(v4, "setRoutes:", v7);
    v17 = -[CarRoutePlanningModeController selectedRouteIndex](self, "selectedRouteIndex");
  }
  else
  {
    objc_msgSend(v4, "setRoutes:", 0);
    v17 = 0x7FFFFFFFFFFFFFFFLL;
  }
  objc_msgSend(v4, "setSelectedRouteIndex:", v17, (_QWORD)v20);
  objc_msgSend(v4, "setAlternateRoutesEnabled:", 1);
  objc_msgSend(v4, "setStyle:", 1);

  return 1;
}

- (void)_updateAnnotationsForLoadedRoute
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController chromeViewController](self, "chromeViewController"));
  objc_msgSend(v3, "cancelDeferredAction:forContext:", CFSTR("CarRoutePlanningUpdateSelectedRoute"), self);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController chromeViewController](self, "chromeViewController"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100444F44;
  v5[3] = &unk_1011AD4F0;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v4, "whenContextNextBecomesCurrent:performAction:withBlock:", self, CFSTR("CarRoutePlanningUpdateAnnotations"), v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)_recenterOnRouteAnimated:(BOOL)a3
{
  void *v4;
  unsigned __int8 v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  unsigned __int8 v9;
  id location;

  if (a3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController chromeViewController](self, "chromeViewController"));
    v5 = objc_msgSend(v4, "isCurrentContext:", self);

  }
  else
  {
    v5 = 0;
  }
  objc_initWeak(&location, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController chromeViewController](self, "chromeViewController"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1004450CC;
  v7[3] = &unk_1011AFEE8;
  objc_copyWeak(&v8, &location);
  v7[4] = self;
  v9 = v5;
  objc_msgSend(v6, "whenContextNextBecomesCurrent:performAction:withBlock:", self, CFSTR("CarRoutePlanningRecenter"), v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_chromeViewControllerDidUpdateMapInsets:(id)a3
{
  -[CarRoutePlanningModeController _recenterOnRouteAnimated:](self, "_recenterOnRouteAnimated:", 1);
}

- (id)routeAnnotationsController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController chromeViewController](self, "chromeViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "routeAnnotationsController"));

  return v3;
}

- (id)searchPinsManager
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController chromeViewController](self, "chromeViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "searchPinsManager"));

  return v3;
}

- (id)personalizedItemManager
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController chromeViewController](self, "chromeViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "personalizedItemManager"));

  return v3;
}

- (void)setRoutePlanningSession:(id)a3
{
  RoutePlanningSession *v5;
  RoutePlanningSession *routePlanningSession;
  RoutePlanningSession **p_routePlanningSession;
  MapsSuggestionsEntry *originalEntry;
  void *v9;
  _TtC4Maps16MapsFavoriteItem *originalItem;
  void *v11;
  RoutePlanningSession *v12;

  v5 = (RoutePlanningSession *)a3;
  p_routePlanningSession = &self->_routePlanningSession;
  routePlanningSession = self->_routePlanningSession;
  if (routePlanningSession != v5)
  {
    v12 = v5;
    -[RoutePlanningSession removeObserver:](routePlanningSession, "removeObserver:", self);
    objc_storeStrong((id *)&self->_routePlanningSession, a3);
    -[RoutePlanningSession addObserver:](self->_routePlanningSession, "addObserver:", self);
    originalEntry = self->_originalEntry;
    if (originalEntry)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsEntry shortcutIdentifier](originalEntry, "shortcutIdentifier"));
      -[RoutePlanningSession setShortcutIdentifier:](*p_routePlanningSession, "setShortcutIdentifier:", v9);

    }
    originalItem = self->_originalItem;
    if (originalItem)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFavoriteItem identifier](originalItem, "identifier"));
      -[RoutePlanningSession setShortcutIdentifier:](*p_routePlanningSession, "setShortcutIdentifier:", v11);

    }
    -[CarRoutePlanningModeController _updateLoading](self, "_updateLoading");
    v5 = v12;
  }

}

- (RouteCollection)drivingRouteCollection
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController routePlanningSession](self, "routePlanningSession"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "routeCollectionForTransportType:", 1));

  return (RouteCollection *)v3;
}

- (GEOComposedRoute)currentRoute
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController drivingRouteCollection](self, "drivingRouteCollection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentRoute"));

  return (GEOComposedRoute *)v3;
}

- (unint64_t)selectedRouteIndex
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController drivingRouteCollection](self, "drivingRouteCollection"));

  if (!v3)
    return 0x7FFFFFFFFFFFFFFFLL;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController drivingRouteCollection](self, "drivingRouteCollection"));
  v5 = objc_msgSend(v4, "currentRouteIndex");

  return (unint64_t)v5;
}

- (NSArray)drivingRoutes
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController drivingRouteCollection](self, "drivingRouteCollection"));
  v3 = sub_10039DCD4(v2, &stru_1011B6EC8);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return (NSArray *)v4;
}

- (void)platformController:(id)a3 willChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5
{
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v10 = a5;
  v6 = objc_opt_class(RoutePlanningSession);
  if ((objc_opt_isKindOfClass(v10, v6) & 1) != 0)
    v7 = v10;
  else
    v7 = 0;
  v8 = v7;
  -[CarRoutePlanningModeController setRoutePlanningSession:](self, "setRoutePlanningSession:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController routePlanningSession](self, "routePlanningSession"));
  if (v9)
    -[CarRoutePlanningModeController _updateElements](self, "_updateElements");

}

- (void)routePlanningSession:(id)a3 didFinishResolvingWaypointSet:(id)a4
{
  CarWaypointsController *waypointsController;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  void *v11;

  waypointsController = self->_waypointsController;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarWaypointsController destinationSearchResultIfAvailable](waypointsController, "destinationSearchResultIfAvailable"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarWaypointsController destinationSearchResultIfAvailable](self->_waypointsController, "destinationSearchResultIfAvailable"));
    v11 = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));
    -[CarRoutePlanningModeController setFullSearchResults:](self, "setFullSearchResults:", v9);

  }
  -[CarRoutePlanningModeController _updateElements](self, "_updateElements");
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1004459EC;
  v10[3] = &unk_1011B1BE0;
  v10[4] = self;
  objc_msgSend(v6, "withValue:orError:", &stru_1011B6F08, v10);

}

- (void)routePlanningSession:(id)a3 didUpdateRouteCollectionResult:(id)a4 forTransportType:(int64_t)a5
{
  id v8;
  _QWORD v9[5];
  _QWORD v10[5];

  v8 = a4;
  if (objc_msgSend(a3, "currentTransportType") == (id)a5)
  {
    -[CarRoutePlanningModeController _updateElements](self, "_updateElements");
    -[CarRoutePlanningModeController _updateTurnByTurnSupport](self, "_updateTurnByTurnSupport");
    v9[4] = self;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100445AB4;
    v10[3] = &unk_1011B6F30;
    v10[4] = self;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100445AE8;
    v9[3] = &unk_1011B1BE0;
    objc_msgSend(v8, "withValue:orError:", v10, v9);
  }

}

- (void)routePlanningSession:(id)a3 didChangeCurrentTransportType:(int64_t)a4 userInitiated:(BOOL)a5
{
  -[CarRoutePlanningModeController _updateTurnByTurnSupport](self, "_updateTurnByTurnSupport", a3, a4, a5);
  -[CarRoutePlanningModeController _updateElements](self, "_updateElements");
}

- (void)_clearSteppingRouteParameters
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  id v25;
  int v26;
  NSObject *v27;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController routePlanningSession](self, "routePlanningSession"));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "platformController"));
  if (v4)
  {
    v5 = v4;

LABEL_4:
    v7 = objc_claimAutoreleasedReturnValue(-[NSObject chromeViewController](v5, "chromeViewController"));
    v8 = objc_opt_class(IOSChromeViewController);
    if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
      v9 = v7;
    else
      v9 = 0;
    v10 = v9;
    v11 = v10;
    if (v10)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject appCoordinator](v10, "appCoordinator"));
      v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "baseActionCoordinator"));

      v14 = objc_opt_class(ActionCoordinator);
      if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
        v15 = v13;
      else
        v15 = 0;
      v16 = v15;

      if (v16)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject routePlanningDataCoordinator](v16, "routePlanningDataCoordinator"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[RoutePlanningTiming leaveNowTiming](RoutePlanningTiming, "leaveNowTiming"));
        objc_msgSend(v17, "updateTiming:", v18);

        v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject routePlanningOverviewViewController](v16, "routePlanningOverviewViewController"));
        objc_msgSend(v19, "replaceOriginWithCurrentLocation");

        v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject routePlanningDataCoordinator](v16, "routePlanningDataCoordinator"));
        objc_msgSend(v20, "updateTransportType:", 1);

      }
      else
      {
        v22 = sub_10043364C();
        v23 = objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          v24 = objc_claimAutoreleasedReturnValue(-[NSObject appCoordinator](v11, "appCoordinator"));
          v26 = 138543362;
          v27 = v24;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Couldn't get the action coordinator from app coordinator %{public}@", (uint8_t *)&v26, 0xCu);

        }
        v13 = 0;
      }
    }
    else
    {
      v21 = sub_10043364C();
      v13 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v26 = 138543362;
        v27 = v5;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Couldn't get the iOS Chrome from platform: %{public}@", (uint8_t *)&v26, 0xCu);
      }
    }

    goto LABEL_19;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "platformController"));

  if (v5)
    goto LABEL_4;
  v25 = sub_10043364C();
  v5 = objc_claimAutoreleasedReturnValue(v25);
  if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    goto LABEL_20;
  v7 = objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController routePlanningSession](self, "routePlanningSession"));
  v26 = 138543362;
  v27 = v7;
  _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Couldn't get the platform controller from RPS: %{public}@", (uint8_t *)&v26, 0xCu);
LABEL_19:

LABEL_20:
}

- (void)_updateElements
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController placeCard](self, "placeCard"));
  objc_msgSend(v3, "reloadData");

  -[CarRoutePlanningModeController _updateRouteAdvisories](self, "_updateRouteAdvisories");
  -[CarRoutePlanningModeController _showPinsAnimated:](self, "_showPinsAnimated:", 1);
  -[CarRoutePlanningModeController _updateAnnotationsForLoadedRoute](self, "_updateAnnotationsForLoadedRoute");
  -[CarRoutePlanningModeController _updateLoading](self, "_updateLoading");
}

- (void)_updateTurnByTurnSupport
{
  void *v3;
  _QWORD v4[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController chromeViewController](self, "chromeViewController"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100445EC0;
  v4[3] = &unk_1011AE8F8;
  v4[4] = self;
  objc_msgSend(v3, "whenContextNextBecomesCurrent:performAction:withBlock:", self, CFSTR("CarRoutePlanningUpdateRouteAdvisory"), v4);

}

- (NSArray)preferredCarFocusEnvironments
{
  void *v2;
  void *v4;
  void *v5;
  void **v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  switch(-[CarRoutePlanningModeController state](self, "state"))
  {
    case 0:
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController placeCard](self, "placeCard"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[CarFocusOrderEnvironment environmentWithFocusEnvironment:](CarFocusOrderEnvironment, "environmentWithFocusEnvironment:", v4));
      v11 = v5;
      v6 = &v11;
      goto LABEL_6;
    case 1:
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController carAdvisoryListCardViewController](self, "carAdvisoryListCardViewController"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[CarFocusOrderEnvironment environmentWithFocusEnvironment:](CarFocusOrderEnvironment, "environmentWithFocusEnvironment:", v4));
      v10 = v5;
      v6 = &v10;
      goto LABEL_6;
    case 2:
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController carAdvisoryDetailCardViewController](self, "carAdvisoryDetailCardViewController"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[CarFocusOrderEnvironment environmentWithFocusEnvironment:](CarFocusOrderEnvironment, "environmentWithFocusEnvironment:", v4));
      v9 = v5;
      v6 = &v9;
      goto LABEL_6;
    case 3:
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController evChargingAvailabilityVC](self, "evChargingAvailabilityVC"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[CarFocusOrderEnvironment environmentWithFocusEnvironment:](CarFocusOrderEnvironment, "environmentWithFocusEnvironment:", v4));
      v8 = v5;
      v6 = &v8;
LABEL_6:
      v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v6, 1));

      break;
    default:
      return (NSArray *)v2;
  }
  return (NSArray *)v2;
}

- (NSArray)carFocusOrderSequences
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id WeakRetained;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  _QWORD v22[2];
  _QWORD v23[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController chromeViewController](self, "chromeViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "itemRepresentingStatusBanner"));
  v23[0] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController chromeViewController](self, "chromeViewController"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "itemRepresentingOverlays"));
  v23[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v23, 2));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v7));

  WeakRetained = objc_loadWeakRetained((id *)&self->_advisoryLabel);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "viewButton"));
  LOBYTE(v6) = objc_msgSend(v10, "isHidden");

  if ((v6 & 1) == 0)
  {
    v11 = objc_loadWeakRetained((id *)&self->_advisoryLabel);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "viewButton"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[CarFocusOrderItem itemWithFocusItem:](CarFocusOrderItem, "itemWithFocusItem:", v12));
    objc_msgSend(v8, "addObject:", v13);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController chromeViewController](self, "chromeViewController"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "itemRepresentingAlternateRoutes"));
  v22[0] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[CarFocusOrderItem itemWithFocusItem:](CarFocusOrderItem, "itemWithFocusItem:", self->_zoomButton));
  v22[1] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v22, 2));
  objc_msgSend(v8, "addObjectsFromArray:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[CarFocusOrderSequence sequenceWithItems:options:](CarFocusOrderSequence, "sequenceWithItems:options:", v8, 5));
  v21 = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1));

  return (NSArray *)v19;
}

- (BOOL)shouldAllowKnobFocusMovement
{
  return 1;
}

- (int)backButtonUsageActionToMode:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  char isKindOfClass;

  v3 = a3;
  v5 = objc_opt_class(CarDestinationsModeController, v4);
  isKindOfClass = objc_opt_isKindOfClass(v3, v5);

  if ((isKindOfClass & 1) != 0)
    return 2006;
  else
    return 25;
}

- (int)currentUsageTarget
{
  return 1007;
}

- (void)pptTestStartNavigation
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningModeController placeCard](self, "placeCard"));
  objc_msgSend(v2, "startNavigation");

}

- (void)pptTestEndNavigation
{
  id v2;
  NSObject *v3;
  id v4;
  NSObject *v5;
  char *v6;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;

  v2 = sub_1004318FC();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v7 = 136315650;
    v8 = "-[CarRoutePlanningModeController pptTestEndNavigation]";
    v9 = 2080;
    v10 = "CarRoutePlanningModeController.m";
    v11 = 1024;
    v12 = 1704;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v7, 0x1Cu);
  }

  if (sub_100A70734())
  {
    v4 = sub_1004318FC();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
      v7 = 138412290;
      v8 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v7, 0xCu);

    }
  }
}

- (void)pptTestTransitionBetweenFullAndLightGuidance
{
  id v2;
  NSObject *v3;
  id v4;
  NSObject *v5;
  char *v6;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;

  v2 = sub_1004318FC();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v7 = 136315650;
    v8 = "-[CarRoutePlanningModeController pptTestTransitionBetweenFullAndLightGuidance]";
    v9 = 2080;
    v10 = "CarRoutePlanningModeController.m";
    v11 = 1024;
    v12 = 1709;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v7, 0x1Cu);
  }

  if (sub_100A70734())
  {
    v4 = sub_1004318FC();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
      v7 = 138412290;
      v8 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v7, 0xCu);

    }
  }
}

- (void)personalizedItemManager:(id)a3 didChangeItems:(id)a4 itemGroups:(id)a5
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1004468E0;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (ChromeViewController)chromeViewController
{
  return (ChromeViewController *)objc_loadWeakRetained((id *)&self->_chromeViewController);
}

- (void)setChromeViewController:(id)a3
{
  objc_storeWeak((id *)&self->_chromeViewController, a3);
}

- (CarRoutePlanningModeDelegate)delegate
{
  return (CarRoutePlanningModeDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isOriginalDestination
{
  return self->_isOriginalDestination;
}

- (void)setIsOriginalDestination:(BOOL)a3
{
  self->_isOriginalDestination = a3;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_userInfo, a3);
}

- (RoutePlanningSession)routePlanningSession
{
  return self->_routePlanningSession;
}

- (NSArray)fullSearchResults
{
  return self->_fullSearchResults;
}

- (CarRoutePlanningAdvisoryLabel)advisoryLabel
{
  return (CarRoutePlanningAdvisoryLabel *)objc_loadWeakRetained((id *)&self->_advisoryLabel);
}

- (void)setAdvisoryLabel:(id)a3
{
  objc_storeWeak((id *)&self->_advisoryLabel, a3);
}

- (BOOL)zoomToDestination
{
  return self->_zoomToDestination;
}

- (void)setZoomToDestination:(BOOL)a3
{
  self->_zoomToDestination = a3;
}

- (CarPlaceCardCardViewController)placeCard
{
  return self->_placeCard;
}

- (void)setPlaceCard:(id)a3
{
  objc_storeStrong((id *)&self->_placeCard, a3);
}

- (BOOL)navigationAidedDrivingEnabled
{
  return self->_navigationAidedDrivingEnabled;
}

- (int64_t)state
{
  return self->_state;
}

- (CarAdvisoryDetailCardViewController)carAdvisoryDetailCardViewController
{
  return self->_carAdvisoryDetailCardViewController;
}

- (void)setCarAdvisoryDetailCardViewController:(id)a3
{
  objc_storeStrong((id *)&self->_carAdvisoryDetailCardViewController, a3);
}

- (CarAdvisoryListCardViewController)carAdvisoryListCardViewController
{
  return self->_carAdvisoryListCardViewController;
}

- (void)setCarAdvisoryListCardViewController:(id)a3
{
  objc_storeStrong((id *)&self->_carAdvisoryListCardViewController, a3);
}

- (_TtC4Maps39CarEVChargingAvailabilityViewController)evChargingAvailabilityVC
{
  return self->_evChargingAvailabilityVC;
}

- (void)setEvChargingAvailabilityVC:(id)a3
{
  objc_storeStrong((id *)&self->_evChargingAvailabilityVC, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_evChargingAvailabilityVC, 0);
  objc_storeStrong((id *)&self->_carAdvisoryListCardViewController, 0);
  objc_storeStrong((id *)&self->_carAdvisoryDetailCardViewController, 0);
  objc_storeStrong((id *)&self->_placeCard, 0);
  objc_destroyWeak((id *)&self->_advisoryLabel);
  objc_storeStrong((id *)&self->_fullSearchResults, 0);
  objc_storeStrong((id *)&self->_routePlanningSession, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_chromeViewController);
  objc_storeStrong((id *)&self->_unpairedVehicle, 0);
  objc_storeStrong((id *)&self->_originalItem, 0);
  objc_storeStrong((id *)&self->_originalEntry, 0);
  objc_storeStrong((id *)&self->_searchSession, 0);
  objc_storeStrong((id *)&self->_zoomButton, 0);
  objc_storeStrong((id *)&self->_waypointsController, 0);
}

@end
