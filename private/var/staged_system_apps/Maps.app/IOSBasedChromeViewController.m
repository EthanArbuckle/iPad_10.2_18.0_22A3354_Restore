@implementation IOSBasedChromeViewController

- (InterruptionManager)interruptionManager
{
  InterruptionManager *interruptionManager;
  InterruptionManager *v4;
  InterruptionManager *v5;

  interruptionManager = self->_interruptionManager;
  if (!interruptionManager)
  {
    v4 = objc_alloc_init(InterruptionManager);
    v5 = self->_interruptionManager;
    self->_interruptionManager = v4;

    -[InterruptionManager setChromeViewController:](self->_interruptionManager, "setChromeViewController:", self);
    interruptionManager = self->_interruptionManager;
  }
  return interruptionManager;
}

- (IOSBasedChromeViewController)init
{
  IOSBasedChromeViewController *v2;
  IOSBasedChromeViewController *v3;
  MapsTokenStorage *v4;
  MapsTokenStorage *modernMapTokens;
  EnvironmentObserver *v6;
  EnvironmentObserver *environmentObserver;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  id v17;
  id location;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)IOSBasedChromeViewController;
  v2 = -[ChromeViewController init](&v19, "init");
  v3 = v2;
  if (v2)
  {
    -[ChromeViewController setSearchContextDefaultsKeysPrefix:](v2, "setSearchContextDefaultsKeysPrefix:", CFSTR("Main"));
    v3->_displayedViewMode = -1;
    v4 = -[MapsTokenStorage initWithDelegate:tokenGroupName:callbackQueue:]([MapsTokenStorage alloc], "initWithDelegate:tokenGroupName:callbackQueue:", v3, CFSTR("IOSBasedChromeMetros"), &_dispatch_main_q);
    modernMapTokens = v3->_modernMapTokens;
    v3->_modernMapTokens = v4;

    v6 = objc_alloc_init(EnvironmentObserver);
    environmentObserver = v3->_environmentObserver;
    v3->_environmentObserver = v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager"));
    objc_msgSend(v8, "addTileGroupObserver:queue:", v3->_environmentObserver, &_dispatch_main_q);

    +[MKUserLocation _setAnnotationClass:](MKUserLocation, "_setAnnotationClass:", objc_opt_class(UserLocationSearchResult));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[BrowseManager sharedManager](BrowseManager, "sharedManager"));
    objc_msgSend(v9, "setUserInterfaceDelegate:", v3);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MapsUIImageCache sharedCache](MapsUIImageCache, "sharedCache"));
    objc_msgSend(v10, "setUserInterfaceDelegate:", v3);

    objc_initWeak(&location, v3);
    objc_copyWeak(&v17, &location);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[CollectionManager sharedManager](CollectionManager, "sharedManager", _NSConcreteStackBlock, 3221225472, sub_100A280E4, &unk_1011E00A0));
    objc_msgSend(v11, "setTraitsCreationBlock:", &v16);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v12, "addObserver:selector:name:object:", v3, "_sceneConnectionsDidChange", UISceneWillConnectNotification, 0);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v13, "addObserver:selector:name:object:", v3, "_sceneConnectionsDidChange", UISceneDidDisconnectNotification, 0);

    -[IOSBasedChromeViewController _sceneConnectionsDidChange](v3, "_sceneConnectionsDidChange");
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v14, "addObserver:selector:name:object:", v3, "offlineStateChanged:", GEOOfflineStateChangedNotification, 0);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  return v3;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  IOSBasedChromeViewController *v5;
  IOSBasedChromeViewController *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  objc_super v14;
  uint8_t buf[4];
  __CFString *v16;

  v3 = sub_10043196C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = self;
    v6 = v5;
    if (!v5)
    {
      v12 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v7 = (objc_class *)objc_opt_class(v5);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if ((objc_opt_respondsToSelector(v6, "accessibilityIdentifier") & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
      v11 = v10;
      if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
      {
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, v6, v11));

        goto LABEL_8;
      }

    }
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, v6));
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543362;
    v16 = v12;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}@] Deallocating", buf, 0xCu);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[VGVirtualGarageService sharedService](VGVirtualGarageService, "sharedService"));
  objc_msgSend(v13, "unregisterObserver:", self);

  v14.receiver = self;
  v14.super_class = (Class)IOSBasedChromeViewController;
  -[ChromeViewController dealloc](&v14, "dealloc");
}

- (id)currentCollectionShareItemSource
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  PersonalCollectionShareItemSource *v7;
  uint64_t v8;
  id v9;
  CuratedCollectionShareItemSource *v10;
  void *v11;
  CuratedCollectionShareItemSource *v12;
  uint64_t v13;
  id v14;
  CuratedCollectionShareItemSource *v15;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController appCoordinator](self, "appCoordinator"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "baseActionCoordinator"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentViewController"));

  v5 = objc_opt_class(CollectionViewController);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collection"));
    v7 = -[PersonalCollectionShareItemSource initWithCollectionHandlerInfo:]([PersonalCollectionShareItemSource alloc], "initWithCollectionHandlerInfo:", v6);
LABEL_7:
    v12 = (CuratedCollectionShareItemSource *)v7;
    goto LABEL_8;
  }
  v8 = objc_opt_class(CuratedCollectionViewController);
  if ((objc_opt_isKindOfClass(v4, v8) & 1) == 0)
  {
    v13 = objc_opt_class(PublisherViewController);
    if ((objc_opt_isKindOfClass(v4, v13) & 1) == 0)
    {
      v12 = 0;
      goto LABEL_9;
    }
    v14 = v4;
    v15 = [CuratedCollectionShareItemSource alloc];
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "publisher"));

    v7 = -[CuratedCollectionShareItemSource initWithPublisher:](v15, "initWithPublisher:", v6);
    goto LABEL_7;
  }
  v9 = v4;
  v10 = [CuratedCollectionShareItemSource alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "curatedCollection"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mapItems"));

  v12 = -[CuratedCollectionShareItemSource initWithPlaceCollection:refinedMapItems:](v10, "initWithPlaceCollection:refinedMapItems:", v6, v11);
LABEL_8:

LABEL_9:
  return v12;
}

- (id)currentShareItemSource
{
  void *v3;
  uint64_t v4;
  MapRegionShareItemSource *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  SearchResult *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  SearchResult *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  MapRegionShareItemSource *v23;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController topContext](self, "topContext"));
  v4 = objc_opt_class(LookAroundModeController);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) == 0)
  {
    v6 = objc_opt_class(BaseModeController);
    if ((objc_opt_isKindOfClass(v3, v6) & 1) != 0
      && (v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "quickActionMenuPresenter")),
          v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "resolvedMapItem")),
          v7,
          v8))
    {
      v9 = -[SearchResult initWithMapItem:]([SearchResult alloc], "initWithMapItem:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult unknownContact](v9, "unknownContact"));
      v5 = (MapRegionShareItemSource *)objc_claimAutoreleasedReturnValue(+[ShareItem shareItemWithSearchResult:contact:includePrintActivity:](ShareItem, "shareItemWithSearchResult:contact:includePrintActivity:", v9, v10, 1));

    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController currentCollectionShareItemSource](self, "currentCollectionShareItemSource"));
      v8 = v11;
      if (v11)
      {
        v5 = v11;
LABEL_16:

        goto LABEL_17;
      }
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController appCoordinator](self, "appCoordinator"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "baseActionCoordinator"));
      v9 = (SearchResult *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "currentMapItem"));

      if (v9)
      {
        v14 = -[SearchResult initWithMapItem:]([SearchResult alloc], "initWithMapItem:", v9);
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult unknownContact](v14, "unknownContact"));
        v5 = (MapRegionShareItemSource *)objc_claimAutoreleasedReturnValue(+[ShareItem shareItemWithSearchResult:contact:includePrintActivity:](ShareItem, "shareItemWithSearchResult:contact:includePrintActivity:", v14, v15, 1));
      }
      else
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController _maps_platformController](self, "_maps_platformController"));
        v14 = (SearchResult *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "currentSession"));

        v17 = objc_opt_class(RoutePlanningSession);
        if ((objc_opt_isKindOfClass(v14, v17) & 1) != 0)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult currentRouteCollection](v14, "currentRouteCollection"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "currentRoute"));
          v5 = (MapRegionShareItemSource *)objc_claimAutoreleasedReturnValue(+[ShareItem shareItemWithRoute:includeRoutingApps:](ShareItem, "shareItemWithRoute:includeRoutingApps:", v18, 0));
        }
        else
        {
          v23 = [MapRegionShareItemSource alloc];
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController view](self, "view"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "window"));
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "windowScene"));
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "title"));
          v5 = -[MapRegionShareItemSource initWithMapView:title:](v23, "initWithMapView:title:", v15, v21);

        }
      }

    }
    goto LABEL_16;
  }
  v5 = (MapRegionShareItemSource *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentShareItemSource"));
LABEL_17:

  return v5;
}

- (IOSBasedChromeContext)currentIOSBasedContext
{
  void *v3;

  if (-[ChromeViewController isSuppressed](self, "isSuppressed"))
    v3 = 0;
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController topContext](self, "topContext"));
  return (IOSBasedChromeContext *)v3;
}

+ (BOOL)mapInsetsShouldRespectSafeAreaInsetsByDefault
{
  return 0;
}

- (id)mapViewResponder
{
  MapViewResponder *mapViewResponder;
  MapViewResponder *v4;
  void *v5;
  MapViewResponder *v6;
  MapViewResponder *v7;

  mapViewResponder = self->_mapViewResponder;
  if (!mapViewResponder)
  {
    v4 = [MapViewResponder alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
    v6 = -[MapViewResponder initWithMapView:](v4, "initWithMapView:", v5);
    v7 = self->_mapViewResponder;
    self->_mapViewResponder = v6;

    mapViewResponder = self->_mapViewResponder;
  }
  return mapViewResponder;
}

- (OverlayManager)overlayManager
{
  OverlayManager *overlayManager;
  OverlayManager *v4;
  OverlayManager *v5;
  void *v6;

  overlayManager = self->_overlayManager;
  if (!overlayManager)
  {
    v4 = objc_alloc_init(OverlayManager);
    v5 = self->_overlayManager;
    self->_overlayManager = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
    -[OverlayManager setMapView:](self->_overlayManager, "setMapView:", v6);

    overlayManager = self->_overlayManager;
  }
  return overlayManager;
}

- (RidesharingAnnotationsManager)ridesharingAnnotationsManager
{
  RidesharingAnnotationsManager *ridesharingAnnotationsManager;
  RidesharingAnnotationsManager *v4;
  void *v5;
  RidesharingAnnotationsManager *v6;
  RidesharingAnnotationsManager *v7;

  ridesharingAnnotationsManager = self->_ridesharingAnnotationsManager;
  if (!ridesharingAnnotationsManager)
  {
    v4 = [RidesharingAnnotationsManager alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
    v6 = -[RidesharingAnnotationsManager initWithMapView:](v4, "initWithMapView:", v5);
    v7 = self->_ridesharingAnnotationsManager;
    self->_ridesharingAnnotationsManager = v6;

    -[RidesharingAnnotationsManager setChromeViewController:](self->_ridesharingAnnotationsManager, "setChromeViewController:", self);
    ridesharingAnnotationsManager = self->_ridesharingAnnotationsManager;
  }
  return ridesharingAnnotationsManager;
}

- (SharedTripsAnnotationsController)sharedTripsAnnotationsController
{
  SharedTripsAnnotationsController *sharedTripsAnnotationsController;
  SharedTripsAnnotationsController *v4;
  SharedTripsAnnotationsController *v5;

  sharedTripsAnnotationsController = self->_sharedTripsAnnotationsController;
  if (!sharedTripsAnnotationsController)
  {
    v4 = objc_alloc_init(SharedTripsAnnotationsController);
    v5 = self->_sharedTripsAnnotationsController;
    self->_sharedTripsAnnotationsController = v4;

    -[SharedTripsAnnotationsController setChromeViewController:](self->_sharedTripsAnnotationsController, "setChromeViewController:", self);
    sharedTripsAnnotationsController = self->_sharedTripsAnnotationsController;
  }
  return sharedTripsAnnotationsController;
}

- (void)_sceneConnectionsDidChange
{
  -[IOSBasedChromeViewController setConnectedToCarPlay:](self, "setConnectedToCarPlay:", +[UIApplication _maps_isAnySceneConnectedForRole:](UIApplication, "_maps_isAnySceneConnectedForRole:", _UIWindowSceneSessionRoleCarPlay));
}

- (void)setConnectedToCarPlay:(BOOL)a3
{
  id carPlayModernMapToken;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  uint8_t v11[16];
  uint8_t buf[16];

  if (self->_connectedToCarPlay != a3)
  {
    self->_connectedToCarPlay = a3;
    carPlayModernMapToken = self->_carPlayModernMapToken;
    if (!a3)
    {
      if (!carPlayModernMapToken)
        return;
      v8 = sub_10043196C();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Releasing CarPlay modern map token", v11, 2u);
      }

      v7 = 0;
      goto LABEL_12;
    }
    if (!carPlayModernMapToken && (GEOConfigGetBOOL(MapsConfig_StarkEnableMaps357, off_1014B4798) & 1) == 0)
    {
      v5 = sub_10043196C();
      v6 = objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Acquiring CarPlay modern map token", buf, 2u);
      }

      v7 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController acquireModernMapTokenForReason:](self, "acquireModernMapTokenForReason:", 2));
LABEL_12:
      v10 = self->_carPlayModernMapToken;
      self->_carPlayModernMapToken = v7;

    }
  }
}

- (void)_updateOfflineModernMapToken
{
  _BOOL4 v3;
  void *v4;
  unsigned int v5;
  void *v6;
  id usingOfflineDataModernMapToken;
  void *v8;
  id v9;

  v3 = self->_usingOfflineDataModernMapToken == 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[GEOOfflineService shared](GEOOfflineService, "shared"));
  v5 = objc_msgSend(v4, "isUsingOffline");

  if (((v3 ^ v5) & 1) == 0)
  {
    if (v5)
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController acquireModernMapTokenForReason:](self, "acquireModernMapTokenForReason:", 4));
    else
      v6 = 0;
    usingOfflineDataModernMapToken = self->_usingOfflineDataModernMapToken;
    self->_usingOfflineDataModernMapToken = v6;

    v9 = (id)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_mapLayer"));
    objc_msgSend(v8, "clearScene");

  }
}

- (id)personalizedItemSourcesForCurrentState
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)IOSBasedChromeViewController;
  v3 = -[ChromeViewController personalizedItemSourcesForCurrentState](&v10, "personalizedItemSourcesForCurrentState");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend(v4, "mutableCopy");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController sharedTripsAnnotationsController](self, "sharedTripsAnnotationsController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "itemSource"));
  objc_msgSend(v5, "addObject:", v7);

  v8 = objc_msgSend(v5, "copy");
  return v8;
}

- (id)allComponents
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;
  _QWORD v8[6];

  v7.receiver = self;
  v7.super_class = (Class)IOSBasedChromeViewController;
  v2 = -[ChromeViewController allComponents](&v7, "allComponents");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v8[0] = CFSTR("floatingControls");
  v8[1] = CFSTR("cards");
  v8[2] = CFSTR("lookAroundButton");
  v8[3] = CFSTR("statusBarStyle");
  v8[4] = CFSTR("statusBarSupplementaryView");
  v8[5] = CFSTR("weatherOverlay");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v8, 6));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v4));

  return v5;
}

- (void)updateComponentsIfNeeded
{
  objc_super v3;

  -[IOSBasedChromeViewController _createOverlaysIfNeeded:](self, "_createOverlaysIfNeeded:", 1);
  v3.receiver = self;
  v3.super_class = (Class)IOSBasedChromeViewController;
  -[ChromeViewController updateComponentsIfNeeded](&v3, "updateComponentsIfNeeded");
}

- (void)updateComponentsIfNeededWithTansitionCoordinator:(id)a3
{
  id v4;
  GroupAnimation *v5;
  IOSBasedChromeViewController *v6;
  IOSBasedChromeViewController *v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  id v16;
  GroupAnimation *v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[5];
  GroupAnimation *v21;

  v4 = a3;
  if (v4)
  {
    v5 = objc_alloc_init(GroupAnimation);
    -[GroupAnimation setAnimated:](v5, "setAnimated:", objc_msgSend(v4, "isAnimated"));
    v6 = self;
    v7 = v6;
    if (!v6)
    {
      v13 = CFSTR("<nil>");
      goto LABEL_11;
    }
    v8 = (objc_class *)objc_opt_class(v6);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    if ((objc_opt_respondsToSelector(v7, "accessibilityIdentifier") & 1) != 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController performSelector:](v7, "performSelector:", "accessibilityIdentifier"));
      v12 = v11;
      if (v11 && !objc_msgSend(v11, "isEqualToString:", v10))
      {
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v10, v7, v12));

        goto LABEL_8;
      }

    }
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v10, v7));
LABEL_8:

LABEL_11:
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: UIViewController transition coordinator animation"), v13));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[GroupAnimation addCompletionWaitBlockWithReason:](v5, "addCompletionWaitBlockWithReason:", v14));

    v19 = v15;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100A28F10;
    v20[3] = &unk_1011E00C8;
    v20[4] = v7;
    v21 = v5;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100A28F3C;
    v18[3] = &unk_1011C56F8;
    v16 = v15;
    v17 = v5;
    objc_msgSend(v4, "animateAlongsideTransition:completion:", v20, v18);

    goto LABEL_12;
  }
  -[IOSBasedChromeViewController updateComponentsIfNeeded](self, "updateComponentsIfNeeded");
LABEL_12:

}

- (void)updateComponent:(id)a3 forTiming:(unint64_t)a4 withAnimation:(id)a5
{
  __CFString *v8;
  id v9;
  void *v10;
  objc_super v11;
  _QWORD v12[5];
  _QWORD v13[5];

  v8 = (__CFString *)a3;
  v9 = a5;
  v10 = v9;
  if (v8 == CFSTR("floatingControls"))
  {
    -[IOSBasedChromeViewController _updateFloatingControlsForCurrentStateWithAnimation:](self, "_updateFloatingControlsForCurrentStateWithAnimation:", v9);
  }
  else if (v8 == CFSTR("cards"))
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100A29110;
    v13[3] = &unk_1011AC860;
    v13[4] = self;
    objc_msgSend(v9, "addPreparation:", v13);
    -[IOSBasedChromeViewController _updateCardsForCurrentStateWithAnimation:](self, "_updateCardsForCurrentStateWithAnimation:", v10);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100A29140;
    v12[3] = &unk_1011AE8F8;
    v12[4] = self;
    objc_msgSend(v10, "addCompletion:", v12);
  }
  else if (v8 == CFSTR("statusBarStyle"))
  {
    -[IOSBasedChromeViewController _updateStatusBarForCurrentStateWithAnimation:](self, "_updateStatusBarForCurrentStateWithAnimation:", v9);
  }
  else if (v8 == CFSTR("statusBarSupplementaryView"))
  {
    -[IOSBasedChromeViewController _updateStatusBarSupplementaryViewWithAnimation:](self, "_updateStatusBarSupplementaryViewWithAnimation:", v9);
  }
  else if (v8 == CFSTR("lookAroundButton"))
  {
    -[IOSBasedChromeViewController _updateLookAroundButtonWithAnimation:](self, "_updateLookAroundButtonWithAnimation:", v9);
  }
  else if (v8 == CFSTR("redoSearchButton"))
  {
    -[IOSBasedChromeViewController _updateRedoSearchButtonWithAnimation:](self, "_updateRedoSearchButtonWithAnimation:", v9);
  }
  else if (v8 == CFSTR("weatherOverlay"))
  {
    -[IOSBasedChromeViewController _updateWeatherWithAnimation:](self, "_updateWeatherWithAnimation:", v9);
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)IOSBasedChromeViewController;
    -[ChromeViewController updateComponent:forTiming:withAnimation:](&v11, "updateComponent:forTiming:withAnimation:", v8, a4, v9);
  }

}

- (void)_updateFloatingControlsForCurrentStateWithAnimation:(id)a3
{
  id v4;
  unsigned __int8 v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int64_t v13;
  id v14;
  NSObject *v15;
  void *v16;
  _QWORD v17[5];
  _QWORD v18[6];
  unsigned __int8 v19;
  _QWORD v20[6];
  uint8_t buf[4];
  const __CFString *v22;
  __int16 v23;
  void *v24;

  v4 = a3;
  v5 = objc_msgSend(v4, "isAnimated");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController _currentContainerViewController](self, "_currentContainerViewController"));
  objc_msgSend(v6, "edgePadding");
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController floatingControlsOverlay](self, "floatingControlsOverlay"));
  objc_msgSend(v9, "setMargin:", v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController _currentContainerViewController](self, "_currentContainerViewController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "blurGroupName"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController floatingControlsOverlay](self, "floatingControlsOverlay"));
  objc_msgSend(v12, "setBlurGroupName:", v11);

  v13 = -[IOSBasedChromeViewController _desiredFloatingControlsForCurrentState](self, "_desiredFloatingControlsForCurrentState");
  v14 = sub_10043196C();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController topContext](self, "topContext"));
    *(_DWORD *)buf = 138412546;
    v22 = CFSTR("floatingControls");
    v23 = 2112;
    v24 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Update component: %@ with top context: %@", buf, 0x16u);

  }
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100A29378;
  v20[3] = &unk_1011AD518;
  v20[4] = self;
  v20[5] = v13;
  v17[4] = self;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100A29678;
  v18[3] = &unk_1011AFB78;
  v18[4] = self;
  v18[5] = v13;
  v19 = v5;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100A296C4;
  v17[3] = &unk_1011AE8F8;
  objc_msgSend(v4, "addPreparation:animations:completion:", v20, v18, v17);

}

- (BOOL)_internal_topContextWantsCompassLayoutControl
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  unsigned __int8 v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController nextTopContext](self, "nextTopContext"));
  v4 = v3;
  if (v3)
    v5 = v3;
  else
    v5 = (id)objc_claimAutoreleasedReturnValue(-[ChromeViewController topContext](self, "topContext"));
  v6 = v5;

  if ((objc_opt_respondsToSelector(v6, "wantsCompassLayoutControl") & 1) != 0)
    v7 = objc_msgSend(v6, "wantsCompassLayoutControl");
  else
    v7 = 0;

  return v7;
}

- (int64_t)_desiredFloatingControlsForCurrentState
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController nextTopContext](self, "nextTopContext"));
  v4 = v3;
  if (v3)
    v5 = v3;
  else
    v5 = (id)objc_claimAutoreleasedReturnValue(-[ChromeViewController topContext](self, "topContext"));
  v6 = v5;

  if ((objc_opt_respondsToSelector(v6, "desiredFloatingControls") & 1) != 0)
    v7 = objc_msgSend(v6, "desiredFloatingControls");
  else
    v7 = 0;

  return (int64_t)v7;
}

- (void)_updateStatusBarForCurrentStateWithAnimation:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  int64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  id v15;
  NSObject *v16;
  id v17;
  void *v18;
  objc_class *v19;
  NSString *v20;
  void *v21;
  void *v22;
  void *v23;
  __CFString *v24;
  unsigned int v25;
  id v26;
  uint64_t v27;
  void *v28;
  id v29;
  id v30;
  NSObject *v31;
  id v32;
  NSObject *v33;
  int64_t statusBarStyle;
  id v35;
  _QWORD v36[5];
  _QWORD v37[5];
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  const __CFString *v44;
  _BYTE v45[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController _defaultStatusBarBackgroundViewStyle](self, "_defaultStatusBarBackgroundViewStyle"));
  v6 = -[IOSBasedChromeViewController _defaultPrefersStatusBarHidden](self, "_defaultPrefersStatusBarHidden");
  v7 = -[IOSBasedChromeViewController _defaultPreferredStatusBarStyle](self, "_defaultPreferredStatusBarStyle");
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController contexts](self, "contexts"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "reverseObjectEnumerator"));

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
  if (!v10)
    goto LABEL_31;
  v11 = v10;
  v35 = v4;
  v12 = *(_QWORD *)v40;
  while (2)
  {
    for (i = 0; i != v11; i = (char *)i + 1)
    {
      if (*(_QWORD *)v40 != v12)
        objc_enumerationMutation(v9);
      v14 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)i);
      if ((objc_opt_respondsToSelector(v14, "wantsStatusBarControl") & 1) != 0
        && objc_msgSend(v14, "wantsStatusBarControl"))
      {
        v15 = sub_10043196C();
        v16 = objc_claimAutoreleasedReturnValue(v15);
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
LABEL_21:

          if ((objc_opt_respondsToSelector(v14, "prefersStatusBarHidden") & 1) != 0)
            v25 = objc_msgSend(v14, "prefersStatusBarHidden");
          else
            v25 = -[IOSBasedChromeViewController _defaultPrefersStatusBarHidden](self, "_defaultPrefersStatusBarHidden");
          v6 = v25;
          v4 = v35;
          if ((objc_opt_respondsToSelector(v14, "preferredStatusBarStyle") & 1) != 0)
            v26 = objc_msgSend(v14, "preferredStatusBarStyle");
          else
            v26 = -[IOSBasedChromeViewController _defaultPreferredStatusBarStyle](self, "_defaultPreferredStatusBarStyle");
          v7 = (int64_t)v26;
          if ((objc_opt_respondsToSelector(v14, "statusBarBackgroundViewStyle") & 1) != 0)
            v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "statusBarBackgroundViewStyle"));
          else
            v27 = objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController _defaultStatusBarBackgroundViewStyle](self, "_defaultStatusBarBackgroundViewStyle"));
          v28 = (void *)v27;

          v5 = v28;
          goto LABEL_31;
        }
        v17 = v14;
        v18 = v17;
        if (!v17)
        {
          v24 = CFSTR("<nil>");
          goto LABEL_20;
        }
        v19 = (objc_class *)objc_opt_class(v17);
        v20 = NSStringFromClass(v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
        if ((objc_opt_respondsToSelector(v18, "accessibilityIdentifier") & 1) != 0)
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "performSelector:", "accessibilityIdentifier"));
          v23 = v22;
          if (v22 && !objc_msgSend(v22, "isEqualToString:", v21))
          {
            v24 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v21, v18, v23));

            goto LABEL_18;
          }

        }
        v24 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v21, v18));
LABEL_18:

LABEL_20:
        *(_DWORD *)buf = 138412290;
        v44 = v24;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "[Status Bar] %@ wants status bar control", buf, 0xCu);

        goto LABEL_21;
      }
    }
    v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
    if (v11)
      continue;
    break;
  }
  v4 = v35;
LABEL_31:

  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_100A29C9C;
  v37[3] = &unk_1011AC8B0;
  v37[4] = self;
  v38 = v5;
  v29 = v5;
  objc_msgSend(v4, "addAnimations:", v37);
  if (self->_statusBarHidden != v6)
  {
    v30 = sub_10043196C();
    v31 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v44 = CFSTR("YES");
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "[Status Bar] hidden will change to %@", buf, 0xCu);
    }

    self->_statusBarHidden = v6;
  }
  if (!v6 && v7 != self->_statusBarStyle)
  {
    v32 = sub_10043196C();
    v33 = objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      statusBarStyle = self->_statusBarStyle;
      *(_DWORD *)buf = 134217984;
      v44 = (const __CFString *)statusBarStyle;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "[Status Bar] visible status bar style will change to %ld", buf, 0xCu);
    }

    self->_statusBarStyle = v7;
  }
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_100A29CB0;
  v36[3] = &unk_1011AC860;
  v36[4] = self;
  objc_msgSend(v4, "addAnimations:", v36);

}

- (void)_updateWeatherWithAnimation:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  _QWORD v7[5];
  unsigned __int8 v8;
  _QWORD v9[6];
  _QWORD v10[3];
  char v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController weatherOverlay](self, "weatherOverlay"));

  if (v5)
  {
    v6 = objc_msgSend(v4, "isAnimated");
    v10[0] = 0;
    v10[1] = v10;
    v10[2] = 0x2020000000;
    v11 = 0;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100A29DC4;
    v9[3] = &unk_1011AD318;
    v9[4] = self;
    v9[5] = v10;
    objc_msgSend(v4, "addPreparation:", v9);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100A29E5C;
    v7[3] = &unk_1011ACE58;
    v7[4] = self;
    v8 = v6;
    objc_msgSend(v4, "addAnimations:", v7);
    _Block_object_dispose(v10, 8);
  }

}

- (void)setStatusBarAdditionalColor:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_statusBarAdditionalColor, a3);
  v5 = a3;
  -[StatusBarBackgroundView setAdditionalColor:](self->_statusBarBackgroundView, "setAdditionalColor:", v5);

}

- (BOOL)prefersStatusBarHidden
{
  return self->_statusBarHidden;
}

- (BOOL)_defaultPrefersStatusBarHidden
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  if (objc_msgSend(v3, "userInterfaceIdiom") == (id)1)
  {
    v4 = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    if (objc_msgSend(v5, "userInterfaceIdiom") == (id)5)
    {
      v4 = 0;
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController viewIfLoaded](self, "viewIfLoaded"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "traitCollection"));
      v4 = objc_msgSend(v7, "verticalSizeClass") == (id)1;

    }
  }

  return v4;
}

- (int64_t)preferredStatusBarStyle
{
  return self->_statusBarStyle;
}

- (int64_t)_defaultPreferredStatusBarStyle
{
  return 0;
}

- (id)_defaultStatusBarBackgroundViewStyle
{
  return +[StatusBarBackgroundViewStyle defaultBlurredStyleWithDefaultColorProvider:](StatusBarBackgroundViewStyle, "defaultBlurredStyleWithDefaultColorProvider:", &stru_1011BE7E0);
}

- (void)_updateStatusBarSupplementaryViewWithAnimation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  void *v15;
  objc_class *v16;
  NSString *v17;
  void *v18;
  void *v19;
  void *v20;
  __CFString *v21;
  StatusBarSupplementaryView *v22;
  StatusBarSupplementaryView *statusBarSupplementaryView;
  StatusBarSupplementaryView *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  id v29;
  _QWORD v30[5];
  StatusBarSupplementaryView *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  __CFString *v38;
  __int16 v39;
  StatusBarSupplementaryView *v40;
  _BYTE v41[128];

  v4 = a3;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController contexts](self, "contexts"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "reverseObjectEnumerator"));

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (!v7)
  {
LABEL_23:
    v22 = 0;
    goto LABEL_24;
  }
  v8 = v7;
  v9 = *(_QWORD *)v34;
LABEL_3:
  v10 = 0;
  while (1)
  {
    if (*(_QWORD *)v34 != v9)
      objc_enumerationMutation(v6);
    v11 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v10);
    if ((objc_opt_respondsToSelector(v11, "wantsStatusBarControl") & 1) != 0)
    {
      if (objc_msgSend(v11, "wantsStatusBarControl"))
        break;
    }
    if (v8 == (id)++v10)
    {
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
      if (v8)
        goto LABEL_3;
      goto LABEL_23;
    }
  }
  v12 = sub_10043196C();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = v11;
    v15 = v14;
    if (!v14)
    {
      v21 = CFSTR("<nil>");
      goto LABEL_20;
    }
    v16 = (objc_class *)objc_opt_class(v14);
    v17 = NSStringFromClass(v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    if ((objc_opt_respondsToSelector(v15, "accessibilityIdentifier") & 1) != 0)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "performSelector:", "accessibilityIdentifier"));
      v20 = v19;
      if (v19 && !objc_msgSend(v19, "isEqualToString:", v18))
      {
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v18, v15, v20));

        goto LABEL_18;
      }

    }
    v21 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v18, v15));
LABEL_18:

LABEL_20:
    *(_DWORD *)buf = 138412290;
    v38 = v21;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "[Status Bar Background View] %@ wants status bar control", buf, 0xCu);

  }
  if ((objc_opt_respondsToSelector(v11, "statusBarSupplementaryView") & 1) == 0)
    goto LABEL_23;
  v22 = (StatusBarSupplementaryView *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "statusBarSupplementaryView"));
LABEL_24:

  statusBarSupplementaryView = self->_statusBarSupplementaryView;
  if (v22 != statusBarSupplementaryView)
  {
    v24 = statusBarSupplementaryView;
    objc_storeStrong((id *)&self->_statusBarSupplementaryView, v22);
    v25 = sub_10043196C();
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v38 = (__CFString *)v24;
      v39 = 2112;
      v40 = v22;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "[Status Bar] supplementary view will change from %@ to %@", buf, 0x16u);
    }

    -[StatusBarSupplementaryView removeFromSuperview](v24, "removeFromSuperview");
    if (v22)
    {
      -[StatusBarSupplementaryView setTranslatesAutoresizingMaskIntoConstraints:](v22, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[StatusBarBackgroundView addSubview:](self->_statusBarBackgroundView, "addSubview:", v22);
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[StatusBarSupplementaryView initialConstraintsForAnimatingPositionInStatusBarBackgroundView:](v22, "initialConstraintsForAnimatingPositionInStatusBarBackgroundView:", self->_statusBarBackgroundView));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v27);
    }
    else
    {
      v27 = 0;
    }
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController view](self, "view"));
    objc_msgSend(v28, "layoutIfNeeded");

    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_100A2A3E8;
    v30[3] = &unk_1011AD238;
    v30[4] = self;
    v31 = v22;
    v32 = v27;
    v29 = v27;
    objc_msgSend(v4, "addAnimations:", v30);

  }
}

- (double)statusBarHeight
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double Height;
  CGRect v10;
  CGRect v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController view](self, "view"));
  objc_msgSend(v3, "safeAreaInsets");
  v5 = v4;
  -[StatusBarBackgroundView frame](self->_statusBarBackgroundView, "frame");
  if (v5 <= CGRectGetHeight(v10))
  {
    -[StatusBarBackgroundView frame](self->_statusBarBackgroundView, "frame");
    Height = CGRectGetHeight(v11);
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController view](self, "view"));
    objc_msgSend(v6, "safeAreaInsets");
    Height = v7;

  }
  return Height;
}

- (void)registerFramesInDebugFramesView:(id)a3
{
  id v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IOSBasedChromeViewController;
  v3 = a3;
  -[ChromeViewController registerFramesInDebugFramesView:](&v5, "registerFramesInDebugFramesView:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemPinkColor](UIColor, "systemPinkColor", v5.receiver, v5.super_class));
  objc_msgSend(v3, "registerName:color:weight:edges:", CFSTR("inner layout guide"), v4, 15, 1.0);

}

- (void)updateFramesInDebugFramesView:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IOSBasedChromeViewController;
  v4 = a3;
  -[ChromeViewController updateFramesInDebugFramesView:](&v6, "updateFramesInDebugFramesView:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController innerLayoutGuide](self, "innerLayoutGuide", v6.receiver, v6.super_class));
  objc_msgSend(v4, "setLayoutGuide:forName:", v5, CFSTR("inner layout guide"));

}

- (BOOL)_suppressOverlaysForActiveFullscreenContainer
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  char isKindOfClass;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController nextTopContext](self, "nextTopContext"));
  v4 = v3;
  if (v3)
    v5 = v3;
  else
    v5 = (id)objc_claimAutoreleasedReturnValue(-[ChromeViewController topContext](self, "topContext"));
  v6 = v5;

  if ((objc_opt_respondsToSelector(v6, "fullscreenViewController") & 1) != 0)
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fullscreenViewController"));
  else
    v7 = 0;
  v8 = objc_opt_class(ContainerViewController);
  isKindOfClass = objc_opt_isKindOfClass(v7, v8);

  return isKindOfClass & 1;
}

- (id)_currentContainerViewController
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController topIOSBasedContext](self, "topIOSBasedContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController _currentContainerViewControllerWithContext:](self, "_currentContainerViewControllerWithContext:", v3));

  return v4;
}

- (id)_currentContainerViewControllerWithContext:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;

  v4 = a3;
  if ((objc_opt_respondsToSelector(v4, "fullscreenViewController") & 1) != 0)
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fullscreenViewController"));
  else
    v5 = 0;
  v6 = objc_opt_class(ContainerViewController);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    v7 = v5;
  else
    v7 = (id)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController cardsOverlay](self, "cardsOverlay"));
  v8 = v7;

  return v8;
}

- (id)fullscreenViewControllerTransitionFromController:(id)a3 toController:(id)a4 isDismissTransition:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  ModeTransitionController *v10;
  id v11;
  ModeTransitionController *v12;
  objc_super v14;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  if (sub_1007F7BE8((uint64_t)v8, (Protocol *)&OBJC_PROTOCOL___ModeTransitionProtocol)
    && sub_1007F7BE8((uint64_t)v9, (Protocol *)&OBJC_PROTOCOL___ModeTransitionProtocol))
  {
    v10 = objc_alloc_init(ModeTransitionController);
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)IOSBasedChromeViewController;
    v11 = -[ChromeViewController fullscreenViewControllerTransitionFromController:toController:isDismissTransition:](&v14, "fullscreenViewControllerTransitionFromController:toController:isDismissTransition:", v8, v9, v5);
    v10 = (ModeTransitionController *)objc_claimAutoreleasedReturnValue(v11);
  }
  v12 = v10;

  return v12;
}

- (void)_updateLookAroundButtonWithAnimation:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  _QWORD v7[5];
  unsigned __int8 v8;
  _QWORD v9[5];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController lookAroundOverlay](self, "lookAroundOverlay"));

  if (v5)
  {
    v6 = objc_msgSend(v4, "isAnimated");
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100A2A9A4;
    v9[3] = &unk_1011AC860;
    v9[4] = self;
    objc_msgSend(v4, "addPreparation:", v9);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100A2AA18;
    v7[3] = &unk_1011ACE58;
    v7[4] = self;
    v8 = v6;
    objc_msgSend(v4, "addAnimations:", v7);
  }

}

- (void)_updateRedoSearchButtonWithAnimation:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  _QWORD v8[4];
  id v9;
  id location;
  _QWORD v11[3];
  unsigned __int8 v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController redoSearchOverlay](self, "redoSearchOverlay"));

  if (v5)
  {
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x2020000000;
    v12 = 0;
    v12 = objc_msgSend(v4, "isAnimated");
    objc_initWeak(&location, self);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100A2AC74;
    v8[3] = &unk_1011AD260;
    objc_copyWeak(&v9, &location);
    objc_msgSend(v4, "addPreparation:", v8);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100A2ACF4;
    v6[3] = &unk_1011BEF90;
    objc_copyWeak(&v7, &location);
    v6[4] = v11;
    objc_msgSend(v4, "addAnimations:", v6);
    objc_destroyWeak(&v7);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
    _Block_object_dispose(v11, 8);
  }

}

- (void)overlayControllerDidUpdateMapInsets:(id)a3 fromOverlay:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)IOSBasedChromeViewController;
  v6 = a4;
  -[ChromeViewController overlayControllerDidUpdateMapInsets:fromOverlay:](&v8, "overlayControllerDidUpdateMapInsets:fromOverlay:", a3, v6);
  v7 = (id)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController cardsOverlay](self, "cardsOverlay", v8.receiver, v8.super_class));

  if (v7 == v6)
    -[IOSBasedChromeViewController updateComponentsIfNeeded](self, "updateComponentsIfNeeded");
}

- (id)currentTraits
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  ClientTypeResolver *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapViewEnteredForegroundDate](self, "mapViewEnteredForegroundDate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController lastMapViewportChangedDate](self, "lastMapViewportChangedDate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapsDefaultTraitsForMapView:mapViewEnteredForegroundDate:mapViewportChangedDate:", v3, v5, v6));

    v8 = -[NSArray mutableCopy](self->_historicalLocations, "mutableCopy");
    objc_msgSend(v7, "setHistoricalLocations:", v8);

    v9 = objc_alloc_init(ClientTypeResolver);
    +[GEOMapServiceTraits addCommonKnownClientResolvedTypesIfAvailableWithClientTypeResolver:toTraits:](GEOMapServiceTraits, "addCommonKnownClientResolvedTypesIfAvailableWithClientTypeResolver:toTraits:", v9, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
    v11 = MKCurrencySymbolForLocale();
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    objc_msgSend(v7, "setCurrentLocaleCurrencySymbol:", v12);

    objc_msgSend(v7, "setWantsRouteCreationTip:", 1);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_handleLogTileState:(id)a3
{
  unsigned __int8 v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if (objc_msgSend(a3, "state") == (id)3)
  {
    v10 = 0;
    v11 = 0;
    v4 = +[MapsRadarAttachmentProviderTask getCurrentTileStateSnapshotWithDirectoryURL:debugTreeURLs:mapsActivityDataPath:error:](MapsRadarAttachmentProviderTask, "getCurrentTileStateSnapshotWithDirectoryURL:debugTreeURLs:mapsActivityDataPath:error:", &v11, 0, 0, &v10);
    v5 = v10;
    v6 = v11;
    v7 = v6;
    if ((v4 & 1) != 0)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "path"));
      NSLog(CFSTR("Logged tile state to %@"), v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Logged tile state to %@"), v8));
      -[IOSBasedChromeViewController _maps_presentSimpleAlertWithTitle:message:dismissalActionTitle:](self, "_maps_presentSimpleAlertWithTitle:message:dismissalActionTitle:", CFSTR("State Snapshot"), v9, CFSTR("OK"));

    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedDescription"));
      -[IOSBasedChromeViewController _maps_presentSimpleAlertWithTitle:message:dismissalActionTitle:](self, "_maps_presentSimpleAlertWithTitle:message:dismissalActionTitle:", CFSTR("State Snapshot Creation Failed"), v8, CFSTR("OK"));
    }

  }
}

- (void)prepareMapViewForFirstUse
{
  void *v3;
  MapViewResponder *v4;
  MapViewResponder *mapViewResponder;
  id v6;
  int64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unsigned int v11;
  UITapGestureRecognizer *v12;
  UITapGestureRecognizer *logTileStateRecognizer;
  void *v14;
  __int128 v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)IOSBasedChromeViewController;
  -[ChromeViewController prepareMapViewForFirstUse](&v16, "prepareMapViewForFirstUse");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
  objc_msgSend(v3, "_setUseBalloonCalloutsForLabels:", 1);
  objc_msgSend(v3, "setTintAdjustmentMode:", 1);
  -[IOSBasedChromeViewController _updateOfflineModernMapToken](self, "_updateOfflineModernMapToken");
  v15 = 0u;
  if (v3)
    objc_msgSend(v3, "_cartographicConfiguration", (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, 0);
  if (-[IOSBasedChromeViewController shouldUseModernMap](self, "shouldUseModernMap", v15))
    -[IOSBasedChromeViewController modernMapTerrainMode](self, "modernMapTerrainMode");
  if (-[IOSBasedChromeViewController shouldUseModernMap](self, "shouldUseModernMap"))
    -[IOSBasedChromeViewController modernMapProjectionType](self, "modernMapProjectionType");
  v4 = -[MapViewResponder initWithMapView:]([MapViewResponder alloc], "initWithMapView:", v3);
  mapViewResponder = self->_mapViewResponder;
  self->_mapViewResponder = v4;

  -[EnvironmentObserver setMapView:](self->_environmentObserver, "setMapView:", v3);
  v6 = objc_msgSend(v3, "mapType");
  switch((unint64_t)v6)
  {
    case 1uLL:
      v7 = 2;
      break;
    case 2uLL:
      v7 = 1;
      break;
    case 3uLL:
      v7 = 6;
      break;
    case 4uLL:
      v7 = 5;
      break;
    default:
      v8 = 3;
      if (v6 != (id)104)
        v8 = 0;
      if (v6 == (id)103)
        v7 = -1;
      else
        v7 = v8;
      break;
  }
  self->_displayedViewMode = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController userLocationView](self, "userLocationView"));
  objc_msgSend(v9, "setViewMode:", v7);

  if (self->_logTileStateRecognizer)
    goto LABEL_21;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform"));
  v11 = objc_msgSend(v10, "isInternalInstall");

  if (v11)
  {
    v12 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "_handleLogTileState:");
    logTileStateRecognizer = self->_logTileStateRecognizer;
    self->_logTileStateRecognizer = v12;

    -[UITapGestureRecognizer setNumberOfTouchesRequired:](self->_logTileStateRecognizer, "setNumberOfTouchesRequired:", 3);
    -[UITapGestureRecognizer setNumberOfTapsRequired:](self->_logTileStateRecognizer, "setNumberOfTapsRequired:", 3);
    -[UITapGestureRecognizer setCancelsTouchesInView:](self->_logTileStateRecognizer, "setCancelsTouchesInView:", 0);
    -[UITapGestureRecognizer setDelaysTouchesBegan:](self->_logTileStateRecognizer, "setDelaysTouchesBegan:", 0);
  }
  if (self->_logTileStateRecognizer)
  {
LABEL_21:
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
    objc_msgSend(v14, "addGestureRecognizer:", self->_logTileStateRecognizer);

  }
  objc_msgSend(v3, "_setDebugConsoleAdditionalInfoProvider:", &stru_1011E00E8);

}

- (id)mapView:(id)a3 viewForAnnotation:(id)a4
{
  id v6;
  id v7;
  id v8;
  MapsRippleAnnotationView *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)IOSBasedChromeViewController;
  v8 = -[ChromeViewController mapView:viewForAnnotation:](&v17, "mapView:viewForAnnotation:", v6, v7);
  v9 = (MapsRippleAnnotationView *)objc_claimAutoreleasedReturnValue(v8);
  if (!v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController ridesharingAnnotationsManager](self, "ridesharingAnnotationsManager"));
    v9 = (MapsRippleAnnotationView *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "mapView:viewForAnnotation:", v6, v7));

    if (!v9)
    {
      v12 = objc_opt_class(SearchResultDebugPolygon);
      if ((objc_opt_isKindOfClass(v7, v12) & 1) == 0
        || (v9 = (MapsRippleAnnotationView *)objc_claimAutoreleasedReturnValue(+[SearchResultsDebugOverlay viewForAnnotation:](SearchResultsDebugOverlay, "viewForAnnotation:", v7))) == 0)
      {
        v13 = objc_opt_class(TransitVehiclePositionAnnotation);
        if ((objc_opt_isKindOfClass(v7, v13) & 1) == 0
          || (v9 = -[TransitVehiclePositionAnnotationView initWithAnnotation:reuseIdentifier:]([TransitVehiclePositionAnnotationView alloc], "initWithAnnotation:reuseIdentifier:", v7, 0)) == 0)
        {
          v14 = objc_opt_class(SharedTripUserAnnotation);
          if ((objc_opt_isKindOfClass(v7, v14) & 1) == 0
            || (v15 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController sharedTripsAnnotationsController](self, "sharedTripsAnnotationsController")), v9 = (MapsRippleAnnotationView *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "mapView:viewForAnnotation:", v6, v7)), v15, !v9))
          {
            v16 = objc_opt_class(MapsRippleAnnotation);
            if ((objc_opt_isKindOfClass(v7, v16) & 1) != 0)
              v9 = -[MapsRippleAnnotationView initWithAnnotation:reuseIdentifier:]([MapsRippleAnnotationView alloc], "initWithAnnotation:reuseIdentifier:", v7, CFSTR("rippleView"));
            else
              v9 = 0;
          }
        }
      }
    }
  }

  return v9;
}

- (id)mapView:(id)a3 rendererForOverlay:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController overlayManager](self, "overlayManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mapView:rendererForOverlay:", v6, v7));

  if (v9)
  {
    v10 = v9;
  }
  else
  {
    v11 = objc_opt_class(SearchResultDebugPolygon);
    if ((objc_opt_isKindOfClass(v7, v11) & 1) != 0)
    {
      v10 = (id)objc_claimAutoreleasedReturnValue(+[SearchResultsDebugOverlay rendererWithPolygon:](SearchResultsDebugOverlay, "rendererWithPolygon:", v7));
    }
    else
    {
      v15.receiver = self;
      v15.super_class = (Class)IOSBasedChromeViewController;
      v12 = -[ChromeViewController mapView:rendererForOverlay:](&v15, "mapView:rendererForOverlay:", v6, v7);
      v10 = (id)objc_claimAutoreleasedReturnValue(v12);
    }
  }
  v13 = v10;

  return v13;
}

- (void)mapView:(id)a3 didDeselectLabelMarker:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_super v9;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController overlayManager](self, "overlayManager"));
  objc_msgSend(v8, "setSelectedLabelMarker:", 0);

  v9.receiver = self;
  v9.super_class = (Class)IOSBasedChromeViewController;
  -[ChromeViewController mapView:didDeselectLabelMarker:](&v9, "mapView:didDeselectLabelMarker:", v7, v6);

}

- (void)mapView:(id)a3 didSelectLabelMarker:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_super v9;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController overlayManager](self, "overlayManager"));
  objc_msgSend(v8, "setSelectedLabelMarker:", v6);

  v9.receiver = self;
  v9.super_class = (Class)IOSBasedChromeViewController;
  -[ChromeViewController mapView:didSelectLabelMarker:](&v9, "mapView:didSelectLabelMarker:", v7, v6);

}

- (BOOL)mapViewShouldHandleTapToDeselect:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  BOOL v9;
  objc_super v11;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapViewDelegateForSelector:](self, "mapViewDelegateForSelector:", a2));
  v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend(v6, "mapViewShouldHandleTapToDeselect:", v5);
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)IOSBasedChromeViewController;
    v8 = -[ChromeViewController mapViewShouldHandleTapToDeselect:](&v11, "mapViewShouldHandleTapToDeselect:", v5);
  }
  v9 = v8;

  return v9;
}

- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  objc_super v8;

  v4 = a4;
  v6 = a3;
  +[MapsAnalyticStateProvider updateMapViewInformation:](MapsAnalyticStateProvider, "updateMapViewInformation:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController weatherOverlay](self, "weatherOverlay"));
  objc_msgSend(v7, "mapView:regionDidChangeAnimated:", v6, v4);

  -[IOSBasedChromeViewController _updateFloatingControlsDidChangePitching:animated:](self, "_updateFloatingControlsDidChangePitching:animated:", 0, v4);
  v8.receiver = self;
  v8.super_class = (Class)IOSBasedChromeViewController;
  -[ChromeViewController mapView:regionDidChangeAnimated:](&v8, "mapView:regionDidChangeAnimated:", v6, v4);

}

- (void)mapView:(id)a3 calloutPrimaryActionTriggeredForLabelMarker:(id)a4
{
  id v7;
  id v8;
  id v9;

  v7 = a4;
  v8 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapViewDelegateForSelector:](self, "mapViewDelegateForSelector:", a2));
  objc_msgSend(v9, "mapView:calloutPrimaryActionTriggeredForLabelMarker:", v8, v7);

}

- (void)mapView:(id)a3 calloutPrimaryActionTriggeredForAnnotationView:(id)a4
{
  id v7;
  id v8;
  id v9;

  v7 = a4;
  v8 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapViewDelegateForSelector:](self, "mapViewDelegateForSelector:", a2));
  objc_msgSend(v9, "mapView:calloutPrimaryActionTriggeredForAnnotationView:", v8, v7);

}

- (void)mapView:(id)a3 didChangeFocusedVenue:(id)a4 focusedBuilding:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = (id)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapViewDelegateForSelector:](self, "mapViewDelegateForSelector:", a2));
  objc_msgSend(v12, "mapView:didChangeFocusedVenue:focusedBuilding:", v11, v10, v9);

}

- (void)mapView:(id)a3 didChangeDisplayedFloorOrdinal:(signed __int16)a4 forVenue:(id)a5
{
  uint64_t v5;
  id v9;
  id v10;
  id v11;

  v5 = a4;
  v9 = a5;
  v10 = a3;
  v11 = (id)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapViewDelegateForSelector:](self, "mapViewDelegateForSelector:", a2));
  objc_msgSend(v11, "mapView:didChangeDisplayedFloorOrdinal:forVenue:", v10, v5, v9);

}

- (void)mapView:(id)a3 didFailToLocateUserWithError:(id)a4
{
  id v6;
  id v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  _BOOL4 explicitlyRequestedUserLocation;
  objc_super v16;

  v6 = a4;
  v16.receiver = self;
  v16.super_class = (Class)IOSBasedChromeViewController;
  v7 = a3;
  -[IOSBasedChromeViewController mapView:didFailToLocateUserWithError:](&v16, "mapView:didFailToLocateUserWithError:", v7, v6);
  v8 = objc_msgSend(v7, "hasUserLocation", v16.receiver, v16.super_class);

  if ((v8 & 1) == 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController _maps_platformController](self, "_maps_platformController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "currentSession"));
    v11 = objc_opt_class(RoutePlanningSession);
    if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
      v12 = v10;
    else
      v12 = 0;
    v13 = v12;

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "domain"));
    if ((objc_msgSend(v14, "isEqualToString:", MKLocationErrorDomain) & 1) != 0
      || (objc_msgSend(v6, "_mapkit_isCLDenied") & 1) != 0
      || v13 && (objc_msgSend(v13, "isWaitingForAccurateLocationUpdate") & 1) != 0)
    {

    }
    else
    {
      explicitlyRequestedUserLocation = self->_explicitlyRequestedUserLocation;

      if (explicitlyRequestedUserLocation)
        -[IOSBasedChromeViewController reportCurrentLocationFailure](self, "reportCurrentLocationFailure");
    }
    -[IOSBasedChromeViewController _resetTracking:](self, "_resetTracking:", objc_msgSend(v6, "_mapkit_isCLLocationUnknown") ^ 1);

  }
  self->_explicitlyRequestedUserLocation = 0;

}

- (void)mapView:(id)a3 didChangeUserTrackingMode:(int64_t)a4 animated:(BOOL)a5 fromTrackingButton:(BOOL)a6
{
  _BOOL4 v6;
  uint64_t v9;
  void *v10;
  objc_super v11;

  v6 = a6;
  v11.receiver = self;
  v11.super_class = (Class)IOSBasedChromeViewController;
  -[IOSBasedChromeViewController mapView:didChangeUserTrackingMode:animated:fromTrackingButton:](&v11, "mapView:didChangeUserTrackingMode:animated:fromTrackingButton:", a3, a4, a5);
  if ((unint64_t)(a4 - 1) <= 1 && v6)
    self->_explicitlyRequestedUserLocation = 1;
  if ((unint64_t)a4 >= 3)
    v9 = 17064;
  else
    v9 = (a4 + 17064);
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", v9, 0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
  objc_msgSend(v10, "setTrackingMode:monitorBatteryState:", a4, 1);

}

- (void)mapView:(id)a3 willStartRespondingToGesture:(int64_t)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  id v13;

  v5 = a5;
  v13 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController floatingControlsOverlay](self, "floatingControlsOverlay"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mapViewDelegate"));
  v10 = objc_opt_respondsToSelector(v9, "mapView:willStartRespondingToGesture:animated:");

  if ((v10 & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController floatingControlsOverlay](self, "floatingControlsOverlay"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "mapViewDelegate"));
    objc_msgSend(v12, "mapView:willStartRespondingToGesture:animated:", v13, a4, v5);

  }
}

- (void)mapView:(id)a3 didStopRespondingToGesture:(int64_t)a4 zoomDirection:(int64_t)a5 zoomGestureType:(int64_t)a6 didDecelerate:(BOOL)a7 tiltDirection:(int64_t)a8
{
  _BOOL8 v9;
  id v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  id v28;
  uint64_t v29;
  unsigned int v30;
  SearchSessionAnalytics *v31;
  void *v32;
  objc_super v33;

  v9 = a7;
  v14 = a3;
  v33.receiver = self;
  v33.super_class = (Class)IOSBasedChromeViewController;
  -[IOSBasedChromeViewController mapView:didStopRespondingToGesture:zoomDirection:zoomGestureType:didDecelerate:tiltDirection:](&v33, "mapView:didStopRespondingToGesture:zoomDirection:zoomGestureType:didDecelerate:tiltDirection:", v14, a4, a5, a6, v9, a8);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController floatingControlsOverlay](self, "floatingControlsOverlay"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "mapViewDelegate"));
  v17 = objc_opt_respondsToSelector(v16, "mapView:didStopRespondingToGesture:zoomDirection:zoomGestureType:didDecelerate:tiltDirection:");

  if ((v17 & 1) != 0)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController floatingControlsOverlay](self, "floatingControlsOverlay"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "mapViewDelegate"));
    objc_msgSend(v19, "mapView:didStopRespondingToGesture:zoomDirection:zoomGestureType:didDecelerate:tiltDirection:", v14, a4, a5, a6, v9, a8);

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[MKSystemController sharedInstance](MKSystemController, "sharedInstance"));
  v21 = objc_msgSend(v20, "shouldCaptureMapViewGestureAnalytics");

  if ((unint64_t)a4 <= 3 && v21)
  {
    v22 = 1001;
    switch(a4)
    {
      case 0:
        goto LABEL_16;
      case 1:
        if (a5 == 1)
        {
          v22 = 1043;
          switch(a6)
          {
            case 0:
            case 3:
              goto LABEL_28;
            case 2:
              v22 = 1045;
              goto LABEL_16;
            case 4:
              v22 = 1047;
              goto LABEL_16;
            case 5:
              v22 = 1049;
              goto LABEL_16;
            case 6:
            case 7:
              v22 = 1002;
              goto LABEL_16;
            default:
              goto LABEL_16;
          }
        }
        else
        {
          v22 = 1044;
          switch(a6)
          {
            case 0:
            case 2:
              goto LABEL_28;
            case 3:
              v22 = 1046;
              goto LABEL_16;
            case 4:
              v22 = 1048;
              goto LABEL_16;
            case 5:
              v22 = 1050;
              goto LABEL_16;
            case 6:
            case 7:
              v22 = 1003;
              goto LABEL_16;
            default:
              goto LABEL_16;
          }
        }
        break;
      case 2:
        v22 = 1004;
        goto LABEL_16;
      case 3:
        if (a8 == 2)
        {
          v22 = 1041;
        }
        else
        {
          if (a8 != 1)
            break;
          v22 = 1042;
        }
LABEL_16:
        v23 = -[IOSBasedChromeViewController currentMapViewTargetForAnalytics](self, "currentMapViewTargetForAnalytics");
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "mapRegion"));
        objc_msgSend(v14, "_zoomLevel");
        v27 = v26;
        v28 = objc_msgSend(v14, "mapType");
        v29 = 1;
        switch((unint64_t)v28)
        {
          case 0uLL:
            break;
          case 1uLL:
          case 3uLL:
            v29 = 2;
            break;
          case 2uLL:
          case 4uLL:
            v29 = 3;
            break;
          default:
            if (v28 == (id)104)
              v30 = 4;
            else
              v30 = 0;
            if (v28 == (id)102)
              v29 = 1;
            else
              v29 = v30;
            break;
        }
        objc_msgSend(v24, "captureUserAction:onTarget:eventValue:mapRegion:zoomLevel:mapType:", v22, v23, 0, v25, v29, v27);

        if ((v23 - 502) <= 4 && ((1 << (v23 + 10)) & 0x13) != 0)
        {
          v31 = objc_alloc_init(SearchSessionAnalytics);
          -[SearchSessionAnalytics setTarget:](v31, "setTarget:", v23);
          -[SearchSessionAnalytics setAction:](v31, "setAction:", v22);
          v32 = (void *)objc_claimAutoreleasedReturnValue(+[SearchSessionAnalyticsAggregator sharedAggregator](SearchSessionAnalyticsAggregator, "sharedAggregator"));
          objc_msgSend(v32, "collectSearchSessionAnalytics:", v31);

        }
        break;
      default:
        break;
    }
  }
LABEL_28:

}

- (void)mapViewWillStartLoadingMap:(id)a3
{
  id v4;
  void *v5;
  LoadingIndicatorController *v6;
  LoadingIndicatorController *loadingMapNetworkActivity;
  objc_super v8;

  v4 = a3;
  if (!self->_loadingMapNetworkActivity)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[LoadingIndicatorController sharedController](LoadingIndicatorController, "sharedController"));
    v6 = (LoadingIndicatorController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "beginShowingLoadingIndicator"));
    loadingMapNetworkActivity = self->_loadingMapNetworkActivity;
    self->_loadingMapNetworkActivity = v6;

  }
  v8.receiver = self;
  v8.super_class = (Class)IOSBasedChromeViewController;
  -[IOSBasedChromeViewController mapViewWillStartLoadingMap:](&v8, "mapViewWillStartLoadingMap:", v4);

}

- (void)mapViewDidFinishLoadingMap:(id)a3
{
  LoadingIndicatorController *loadingMapNetworkActivity;
  id v5;
  objc_super v6;

  loadingMapNetworkActivity = self->_loadingMapNetworkActivity;
  self->_loadingMapNetworkActivity = 0;
  v5 = a3;

  v6.receiver = self;
  v6.super_class = (Class)IOSBasedChromeViewController;
  -[IOSBasedChromeViewController mapViewDidFinishLoadingMap:](&v6, "mapViewDidFinishLoadingMap:", v5);

}

- (void)mapViewDidFailLoadingMap:(id)a3 withError:(id)a4
{
  LoadingIndicatorController *loadingMapNetworkActivity;
  id v7;
  id v8;
  objc_super v9;

  loadingMapNetworkActivity = self->_loadingMapNetworkActivity;
  self->_loadingMapNetworkActivity = 0;
  v7 = a4;
  v8 = a3;

  v9.receiver = self;
  v9.super_class = (Class)IOSBasedChromeViewController;
  -[IOSBasedChromeViewController mapViewDidFailLoadingMap:withError:](&v9, "mapViewDidFailLoadingMap:withError:", v8, v7);

}

- (void)_resetTracking:(BOOL)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView", a3));
  objc_msgSend(v3, "setUserTrackingMode:", 0);

}

+ (Class)userLocationViewClass
{
  return (Class)objc_opt_class(MapsUserLocationView);
}

- (MapsUserLocationView)userLocationView
{
  UserLocationView *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)IOSBasedChromeViewController;
  v2 = -[ChromeViewController userLocationView](&v4, "userLocationView");
  return (MapsUserLocationView *)(id)objc_claimAutoreleasedReturnValue(v2);
}

- (void)mapView:(id)a3 didUpdateYaw:(double)a4
{
  id v7;
  id v8;

  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapViewDelegateForSelector:](self, "mapViewDelegateForSelector:", a2));
  objc_msgSend(v8, "mapView:didUpdateYaw:", v7, a4);

}

- (void)mapView:(id)a3 didBecomePitched:(BOOL)a4
{
  -[IOSBasedChromeViewController _updateFloatingControlsDidChangePitching:animated:](self, "_updateFloatingControlsDidChangePitching:animated:", 1, 1);
}

- (void)mapView:(id)a3 canEnter3DModeDidChange:(BOOL)a4
{
  -[IOSBasedChromeViewController _updateFloatingControlsDidChangePitching:animated:](self, "_updateFloatingControlsDidChangePitching:animated:", 0, 0);
}

- (void)mapView:(id)a3 didChangeLookAroundAvailability:(int64_t)a4
{
  -[IOSBasedChromeViewController _updateFloatingControlsDidChangePitching:animated:](self, "_updateFloatingControlsDidChangePitching:animated:", 0, 1);
}

- (void)createScreenshotService
{
  MapsScreenshotService *v3;
  void *v4;
  void *v5;
  MapsScreenshotService *v6;
  MapsScreenshotService *screenshotService;
  id v8;

  if (!self->_screenshotService)
  {
    v3 = [MapsScreenshotService alloc];
    v8 = (id)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController view](self, "view"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "window"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "windowScene"));
    v6 = -[MapsScreenshotService initWithDelegate:windowScene:](v3, "initWithDelegate:windowScene:", self, v5);
    screenshotService = self->_screenshotService;
    self->_screenshotService = v6;

  }
}

- (id)viewsToRenderMapsScreenshotService:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController topContext](self, "topContext"));
  v6 = sub_1007F7BE8((uint64_t)v5, (Protocol *)&OBJC_PROTOCOL___MapsScreenshotServiceDelegate);

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController topContext](self, "topContext"));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "viewsToRenderMapsScreenshotService:", v4));
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
    v11 = v7;
    v8 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));
  }
  v9 = (void *)v8;

  return v9;
}

- (void)_updateCardsForCurrentStateWithAnimation:(id)a3
{
  id v4;
  id v5;
  unsigned __int8 v6;
  id v7;
  NSObject *v8;
  IOSBasedChromeViewController *v9;
  objc_class *v10;
  NSString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id externalContainerAppearanceNotification;
  id v18;
  id externalContainerAppearanceWaitBlock;
  id v20;
  NSObject *v21;
  IOSBasedChromeViewController *v22;
  objc_class *v23;
  NSString *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  unsigned __int8 v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  IOSBasedChromeViewController *v36;
  id v37;
  NSObject *v38;
  IOSBasedChromeViewController *v39;
  objc_class *v40;
  NSString *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  IOSBasedChromeViewController *v49;
  objc_class *v50;
  NSString *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  IOSBasedChromeViewController *v58;
  objc_class *v59;
  NSString *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  id v68;
  void *v69;
  void *v70;
  id v71;
  void *v72;
  id v73;
  unsigned __int8 v74;
  id v75;
  _QWORD v76[5];
  _QWORD v77[5];
  id v78;
  _QWORD v79[5];
  id v80;
  id v81;
  unsigned __int8 v82;
  uint8_t buf[4];
  void *v84;
  __int16 v85;
  id v86;

  v4 = a3;
  v5 = objc_alloc_init((Class)NSMutableArray);
  v6 = objc_msgSend(v4, "isAnimated");
  if (self->_externalContainerAppearanceNotification)
  {
    v7 = sub_10043196C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      goto LABEL_9;
    v9 = self;
    v10 = (objc_class *)objc_opt_class(v9);
    v11 = NSStringFromClass(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    if ((objc_opt_respondsToSelector(v9, "accessibilityIdentifier") & 1) != 0)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController performSelector:](v9, "performSelector:", "accessibilityIdentifier"));
      v14 = v13;
      if (v13 && !objc_msgSend(v13, "isEqualToString:", v12))
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v12, v9, v14));

        goto LABEL_8;
      }

    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v12, v9));
LABEL_8:

    *(_DWORD *)buf = 138543362;
    v84 = v15;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}@] removing existing wait for external container to appear", buf, 0xCu);

LABEL_9:
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v16, "removeObserver:", self->_externalContainerAppearanceNotification);

    externalContainerAppearanceNotification = self->_externalContainerAppearanceNotification;
    self->_externalContainerAppearanceNotification = 0;

    v18 = objc_retainBlock(self->_externalContainerAppearanceWaitBlock);
    externalContainerAppearanceWaitBlock = self->_externalContainerAppearanceWaitBlock;
    self->_externalContainerAppearanceWaitBlock = 0;

    if (!v18)
    {
LABEL_18:

      goto LABEL_19;
    }
    v20 = sub_10043196C();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
LABEL_17:

      (*((void (**)(id, _QWORD))v18 + 2))(v18, 0);
      goto LABEL_18;
    }
    v22 = self;
    v23 = (objc_class *)objc_opt_class(v22);
    v24 = NSStringFromClass(v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    if ((objc_opt_respondsToSelector(v22, "accessibilityIdentifier") & 1) != 0)
    {
      v74 = v6;
      v26 = v5;
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController performSelector:](v22, "performSelector:", "accessibilityIdentifier"));
      v28 = v27;
      if (v27 && !objc_msgSend(v27, "isEqualToString:", v25))
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v25, v22, v28));

        v5 = v26;
        v6 = v74;
        goto LABEL_16;
      }

      v5 = v26;
      v6 = v74;
    }
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v25, v22));
LABEL_16:

    *(_DWORD *)buf = 138543362;
    v84 = v29;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "[%{public}@] calling existing container appearance wait block", buf, 0xCu);

    goto LABEL_17;
  }
LABEL_19:
  v30 = -[IOSBasedChromeViewController _suppressOverlaysForActiveFullscreenContainer](self, "_suppressOverlaysForActiveFullscreenContainer");
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController cardsOverlay](self, "cardsOverlay"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "view"));
  v33 = v32;
  if ((v30 & 1) != 0)
  {
    objc_msgSend(v32, "setUserInteractionEnabled:", 0);

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController cardsOverlay](self, "cardsOverlay"));
    -[ChromeViewController unregisterAdditionalMapViewDelegate:](self, "unregisterAdditionalMapViewDelegate:", v34);

    v35 = (id)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController _currentContainerViewController](self, "_currentContainerViewController"));
    v36 = (IOSBasedChromeViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "parentViewController"));

    if (v36 == self)
    {
LABEL_40:
      v76[0] = _NSConcreteStackBlock;
      v76[1] = 3221225472;
      v76[2] = sub_100A2CFC8;
      v76[3] = &unk_1011AE8F8;
      v76[4] = self;
      objc_msgSend(v4, "addCompletion:", v76);
      goto LABEL_41;
    }
    v37 = sub_10043196C();
    v38 = objc_claimAutoreleasedReturnValue(v37);
    v75 = v5;
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
LABEL_34:

      v58 = self;
      v59 = (objc_class *)objc_opt_class(v58);
      v60 = NSStringFromClass(v59);
      v61 = (void *)objc_claimAutoreleasedReturnValue(v60);
      if ((objc_opt_respondsToSelector(v58, "accessibilityIdentifier") & 1) != 0)
      {
        v62 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController performSelector:](v58, "performSelector:", "accessibilityIdentifier"));
        v63 = v62;
        if (v62 && !objc_msgSend(v62, "isEqualToString:", v61))
        {
          v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v61, v58, v63));

          goto LABEL_39;
        }

      }
      v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v61, v58));
LABEL_39:

      v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: waiting for external container to appear"), v64));
      v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "addCompletionWaitBlockWithReason:", v65));

      v67 = objc_msgSend(v66, "copy");
      v68 = v58->_externalContainerAppearanceWaitBlock;
      v58->_externalContainerAppearanceWaitBlock = v67;

      v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
      v77[0] = _NSConcreteStackBlock;
      v77[1] = 3221225472;
      v77[2] = sub_100A2CDB4;
      v77[3] = &unk_1011C6CD8;
      v77[4] = v58;
      v78 = v66;
      v71 = v66;
      v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "addObserverForName:object:queue:usingBlock:", CFSTR("ContainerDidUnlockNotification"), v35, v70, v77));
      v73 = self->_externalContainerAppearanceNotification;
      self->_externalContainerAppearanceNotification = v72;

      v5 = v75;
      goto LABEL_40;
    }
    v39 = self;
    v40 = (objc_class *)objc_opt_class(v39);
    v41 = NSStringFromClass(v40);
    v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
    if ((objc_opt_respondsToSelector(v39, "accessibilityIdentifier") & 1) != 0)
    {
      v43 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController performSelector:](v39, "performSelector:", "accessibilityIdentifier"));
      v44 = v43;
      if (v43 && !objc_msgSend(v43, "isEqualToString:", v42))
      {
        v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v42, v39, v44));

        goto LABEL_27;
      }

    }
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v42, v39));
LABEL_27:

    *(_DWORD *)buf = 138543618;
    v84 = v45;
    v85 = 2114;
    v86 = v35;
    _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "[%{public}@] blocking animation on appearance of external container %{public}@", buf, 0x16u);

    goto LABEL_34;
  }
  objc_msgSend(v32, "setUserInteractionEnabled:", 1);

  v46 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController topIOSBasedContext](self, "topIOSBasedContext"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController cardsOverlay](self, "cardsOverlay"));
  objc_msgSend(v47, "setChromeContext:", v46);

  v48 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController cardsOverlay](self, "cardsOverlay"));
  -[ChromeViewController registerAdditionalMapViewDelegate:](self, "registerAdditionalMapViewDelegate:", v48);

  v49 = self;
  v50 = (objc_class *)objc_opt_class(v49);
  v51 = NSStringFromClass(v50);
  v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
  if ((objc_opt_respondsToSelector(v49, "accessibilityIdentifier") & 1) != 0)
  {
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController performSelector:](v49, "performSelector:", "accessibilityIdentifier"));
    v54 = v53;
    if (v53 && !objc_msgSend(v53, "isEqualToString:", v52))
    {
      v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v52, v49, v54));

      goto LABEL_33;
    }

  }
  v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v52, v49));
LABEL_33:

  v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: updating controllers in chrome-owned card stack"), v55));
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "addCompletionWaitBlockWithReason:", v56));

  v79[0] = _NSConcreteStackBlock;
  v79[1] = 3221225472;
  v79[2] = sub_100A2CC60;
  v79[3] = &unk_1011BE4E8;
  v79[4] = v49;
  v82 = v6;
  v80 = v5;
  v81 = v57;
  v35 = v57;
  objc_msgSend(v4, "addPreparation:", v79);

LABEL_41:
}

- (void)_updateFloatingControlsDidChangePitching:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v7;
  void *v8;
  int64_t v9;
  id v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  unsigned int v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  char isKindOfClass;
  void *v20;
  void *v21;
  unsigned int v22;
  unsigned int v23;
  unsigned __int8 v24;
  unsigned int v25;
  unsigned __int8 v26;
  int64_t v27;
  double Double;
  double v29;
  unsigned __int8 v30;
  void *v31;
  unsigned int v32;
  unsigned int v33;
  int64_t v34;
  char v35;
  int64_t v36;
  unsigned int v37;
  unsigned int v38;
  unsigned __int8 v39;
  uint64_t v40;
  dispatch_time_t v41;
  _BOOL8 v42;
  void *v43;
  void *v44;
  _BOOL4 v45;
  void *v46;
  _QWORD block[6];

  v4 = a4;
  v5 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController floatingControlsOverlay](self, "floatingControlsOverlay"));

  if (!v7)
    return;
  v45 = v4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
  v9 = -[IOSBasedChromeViewController _desiredFloatingControlsForCurrentState](self, "_desiredFloatingControlsForCurrentState");
  v10 = objc_msgSend(v8, "_lookAroundAvailability");
  if (v10 == (id)2)
    v11 = v9;
  else
    v11 = v9 & 0xFFFFFFFFFFFFFE7FLL;
  v12 = (unint64_t)(v10 != (id)2) << 7;
  +[MapsAnalyticStateProvider updateButtonsInformationLookAround:](MapsAnalyticStateProvider, "updateButtonsInformationLookAround:", v10 == (id)2);
  v13 = v11 & 0xFFFFFFFFFFFFFEFFLL;
  if (-[PedestrianARSessionStateManager shouldShowPedestrianAR](self->_pedestrianARSessionStateManager, "shouldShowPedestrianAR")|| (v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults")), v15 = objc_msgSend(v14, "BOOLForKey:", CFSTR("PedestrianARForceShowAffordanceKey")), v14, v15))
  {
    v13 |= v9 & 0x100;
  }
  else
  {
    v12 |= 0x100uLL;
  }
  v16 = v13 & 0xFFFFFFFFFFFFFFCFLL;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController topContext](self, "topContext"));
  v18 = objc_opt_class(BaseModeController);
  isKindOfClass = objc_opt_isKindOfClass(v17, v18);

  if ((isKindOfClass & 1) != 0)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController topContext](self, "topContext"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "actionCoordinator"));

  }
  else
  {
    v21 = 0;
  }
  v22 = +[SettingsController deviceSupportsGlobe](SettingsController, "deviceSupportsGlobe");
  v23 = objc_msgSend(v8, "_isPitched");
  v46 = v21;
  if (v22)
  {
    v24 = objc_msgSend(v21, "isExiting3dMode");
    v25 = objc_msgSend(v8, "_canEnter3DMode");
    v26 = objc_msgSend(v8, "_isShowingCuratedElevatedGround");
    v27 = -[IOSBasedChromeViewController displayedViewMode](self, "displayedViewMode");
    Double = GEOConfigGetDouble(MapsConfig_FloatingControls3DButtonMinimumZoomLevel, off_1014B4288);
    objc_msgSend(v8, "_zoomLevel");
    if (!v23 || (v24 & 1) != 0)
    {
      if (v25 && (v29 >= Double ? (v30 = v26) : (v30 = 0), (v30 & 1) != 0 || ((v27 - 1) & 0xFFFFFFFFFFFFFFFALL) == 0))
        v16 |= v9 & 0x20;
      else
        v12 |= 0x20uLL;
      v42 = v45;
      v12 |= 0x10uLL;
      if (!v16)
        goto LABEL_40;
      goto LABEL_39;
    }
    goto LABEL_37;
  }
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_mapLayer"));
  v32 = objc_msgSend(v31, "isPitchable");

  v33 = objc_msgSend(v21, "isExiting3dMode");
  v34 = -[IOSBasedChromeViewController displayedViewMode](self, "displayedViewMode");
  v35 = (unint64_t)(v34 - 7) < 0xFFFFFFFFFFFFFFFELL || v5;
  if ((v23 ^ 1 | v33) != 1 || (v35 & 1) == 0)
  {
LABEL_37:
    v16 |= v9 & 0x10;
    v12 |= 0x20uLL;
    goto LABEL_38;
  }
  v36 = v34;
  v37 = objc_msgSend(v8, "_canEnter3DModeFlyover");
  v38 = v37;
  if ((unint64_t)(v36 - 1) < 2)
  {
    if (v37)
    {
      v12 |= 0x10uLL;
      v16 |= v9 & 0x20;
      goto LABEL_38;
    }
    goto LABEL_46;
  }
  if ((unint64_t)(v36 - 5) > 1)
  {
LABEL_46:
    v12 |= 0x30uLL;
    goto LABEL_38;
  }
  v39 = objc_msgSend(v46, "is3dModeSelected");
  if (v5 && (v39 & 1) == 0)
  {
    if (!(v38 | v32))
      v12 |= 0x30uLL;
    if (v36 == 5)
      v40 = 1;
    else
      v40 = 2;
    v41 = dispatch_time(0, 250000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100A2D3D4;
    block[3] = &unk_1011AD518;
    block[4] = self;
    block[5] = v40;
    dispatch_after(v41, (dispatch_queue_t)&_dispatch_main_q, block);
  }
LABEL_38:
  v42 = v45;
  if (v16)
  {
LABEL_39:
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController floatingControlsOverlay](self, "floatingControlsOverlay"));
    objc_msgSend(v43, "showControlsIfNeeded:animated:", v16, v42);

  }
LABEL_40:
  if (v12)
  {
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController floatingControlsOverlay](self, "floatingControlsOverlay"));
    objc_msgSend(v44, "hideControlsIfNeeded:animated:", v12, v42);

  }
}

- (void)floatingControlsOverlayDidTapOpenSettings:(id)a3
{
  SettingsViewController *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void **v11;
  uint64_t v12;
  id (*v13)(uint64_t);
  void *v14;
  id v15;
  IOSBasedChromeViewController *v16;

  v4 = objc_alloc_init(SettingsViewController);
  v11 = _NSConcreteStackBlock;
  v12 = 3221225472;
  v13 = sub_100A2D5E0;
  v14 = &unk_1011AC8B0;
  v15 = (id)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
  v16 = self;
  v5 = v15;
  -[SettingsViewController setDismissSettingsViewControllerHandler:](v4, "setDismissSettingsViewControllerHandler:", &v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController settingsController](self, "settingsController", v11, v12, v13, v14));
  -[SettingsViewController setSettingsController:](v4, "setSettingsController:", v6);

  -[SettingsViewController setModalPresentationStyle:](v4, "setModalPresentationStyle:", 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController cardsOverlay](self, "cardsOverlay"));
  -[SettingsViewController setTransitioningDelegate:](v4, "setTransitioningDelegate:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
  objc_msgSend(v8, "setCompassEnabled:", 0);

  -[IOSBasedChromeViewController _maps_topMostPresentViewController:animated:completion:](self, "_maps_topMostPresentViewController:animated:completion:", v4, 1, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController cardsOverlay](self, "cardsOverlay"));
  objc_msgSend(v9, "setUseBackdropFullScreen:", 1);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v10, "captureUserAction:onTarget:eventValue:", 5001, -[IOSBasedChromeViewController currentMapViewTargetForAnalytics](self, "currentMapViewTargetForAnalytics"), 0);

}

- (void)floatingControlsOverlayDidTapCloseSettingsTip:(id)a3
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController settingsController](self, "settingsController", a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "settingsTipController"));
  objc_msgSend(v3, "settingsTipClosed");

}

- (void)floatingControlsOverlay:(id)a3 didTapEnterPedestrianARFromButton:(id)a4
{
  void *v5;
  char v6;
  id v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController topIOSBasedContext](self, "topIOSBasedContext", a3, a4));
  v6 = objc_opt_respondsToSelector(v5, "enterPedestrianAR");

  if ((v6 & 1) != 0)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController topIOSBasedContext](self, "topIOSBasedContext"));
    objc_msgSend(v7, "enterPedestrianAR");

  }
}

- (void)floatingControlsOverlayDidTapEnter3DMode:(id)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  int64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
  v5 = objc_msgSend(v4, "_isPitched");

  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    objc_msgSend(v6, "captureUserAction:onTarget:eventValue:", 5009, -[IOSBasedChromeViewController currentUITargetForAnalytics](self, "currentUITargetForAnalytics"), 0);

    if (!+[SettingsController deviceSupportsGlobe](SettingsController, "deviceSupportsGlobe"))
    {
      v7 = -[IOSBasedChromeViewController displayedViewMode](self, "displayedViewMode");
      if (v7 == 1)
      {
        v8 = 5;
        goto LABEL_8;
      }
      if (v7 == 2)
      {
        v8 = 6;
LABEL_8:
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController settingsController](self, "settingsController"));
        objc_msgSend(v9, "setMapViewMode:animated:", v8, 0);

      }
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
    objc_msgSend(v10, "_enter3DMode");

    goto LABEL_10;
  }
  -[IOSBasedChromeViewController floatingControlsOverlayDidTapExit3DMode:](self, "floatingControlsOverlayDidTapExit3DMode:", v11);
LABEL_10:

}

- (void)floatingControlsOverlayDidTapExit3DMode:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  int64_t v8;
  uint64_t v9;
  char v10;
  id v11;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService", a3));
  objc_msgSend(v4, "captureUserAction:onTarget:eventValue:", 5010, -[IOSBasedChromeViewController currentUITargetForAnalytics](self, "currentUITargetForAnalytics"), 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
  objc_msgSend(v5, "_exit3DMode");

  if (+[SettingsController deviceSupportsGlobe](SettingsController, "deviceSupportsGlobe"))
    return;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController settingsController](self, "settingsController"));
  v7 = objc_msgSend(v6, "in3DMode");

  v8 = -[IOSBasedChromeViewController displayedViewMode](self, "displayedViewMode");
  if (v8 == 5 && !v7)
  {
    v9 = 1;
LABEL_11:
    v11 = (id)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController settingsController](self, "settingsController"));
    objc_msgSend(v11, "setMapViewMode:animated:", v9, 0);

    return;
  }
  if (v8 == 6)
    v10 = v7;
  else
    v10 = 1;
  if ((v10 & 1) == 0)
  {
    v9 = 2;
    goto LABEL_11;
  }
}

- (void)floatingControlsOverlayDidTapRefreshCurrentSearch:(id)a3
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController baseModeController](self, "baseModeController", a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "actionCoordinator"));
  objc_msgSend(v3, "refreshCurrentSearch");

}

- (void)floatingControlsOverlayDidTapTTRButton:(id)a3
{
  id v4;
  NSObject *v5;
  IOSBasedChromeViewController *v6;
  IOSBasedChromeViewController *v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  uint8_t buf[4];
  __CFString *v16;

  v4 = sub_10043196C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = self;
    v7 = v6;
    if (!v6)
    {
      v13 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v8 = (objc_class *)objc_opt_class(v6);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    if ((objc_opt_respondsToSelector(v7, "accessibilityIdentifier") & 1) != 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController performSelector:](v7, "performSelector:", "accessibilityIdentifier"));
      v12 = v11;
      if (v11 && !objc_msgSend(v11, "isEqualToString:", v10))
      {
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v10, v7, v12));

        goto LABEL_8;
      }

    }
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v10, v7));
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543362;
    v16 = v13;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Launching TTR from floating control", buf, 0xCu);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[MapsRadarController sharedInstance](MapsRadarController, "sharedInstance"));
  objc_msgSend(v14, "launchTTR");

}

- (id)venuesManagerForFloatingControlsOverlay:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController baseModeController](self, "baseModeController", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "actionCoordinator"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "venuesManager"));

  return v5;
}

- (BOOL)_shouldShowSearchFloatingControl
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController topContext](self, "topContext"));
  v4 = objc_opt_class(BaseModeController);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController baseModeController](self, "baseModeController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "actionCoordinator"));
    v7 = objc_msgSend(v6, "shouldShowSearchOverlay");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)showRedoSearchOverlay:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  -[ChromeViewController setNeedsUpdateComponent:animated:](self, "setNeedsUpdateComponent:animated:", CFSTR("redoSearchButton"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController redoSearchOverlay](self, "redoSearchOverlay"));
  v8 = v5;
  if (v3)
  {
    objc_msgSend(v5, "updateSearchOverlayWithState:", 0);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController redoSearchOverlay](self, "redoSearchOverlay"));
    objc_msgSend(v6, "shouldHideFloatingControl:animated:", 0, 1);

    v8 = (id)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController baseModeController](self, "baseModeController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "actionCoordinator"));
    objc_msgSend(v7, "refreshCurrentSearch");

  }
  else
  {
    objc_msgSend(v5, "updateSearchOverlayWithState:", 1);
  }

}

- (void)stateManager:(id)a3 didChangeState:(BOOL)a4
{
  -[IOSBasedChromeViewController _updateFloatingControlsDidChangePitching:animated:](self, "_updateFloatingControlsDidChangePitching:animated:", 0, 1);
}

- (void)viewDidLoad
{
  id v3;
  objc_class *v4;
  NSString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  objc_class *v12;
  NSString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  IOSCardsOverlay *v19;
  IOSCardsOverlay *cardsOverlay;
  void *v21;
  FloatingControlsOverlay *v22;
  void *v23;
  FloatingControlsOverlayDelegateProxy *v24;
  FloatingControlsOverlayDelegateProxy *floatingControlsOverlayDelegateProxy;
  FloatingControlsOverlayDelegateProxy *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  StatusBarBackgroundView *v31;
  void *v32;
  void *v33;
  void *v34;
  StatusBarBackgroundView *v35;
  StatusBarBackgroundView *statusBarBackgroundView;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  NSLayoutConstraint *v43;
  NSLayoutConstraint *viewportTopEqualToStatusBarBottomConstraint;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  NSLayoutConstraint *v50;
  NSLayoutConstraint *viewportTopEqualToSafeAreaBottomConstraint;
  void *v52;
  void *v53;
  void *v54;
  double v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  NSLayoutConstraint *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  objc_super v85;
  _QWORD v86[7];

  v85.receiver = self;
  v85.super_class = (Class)IOSBasedChromeViewController;
  -[ChromeViewController viewDidLoad](&v85, "viewDidLoad");
  v3 = objc_alloc_init((Class)UILayoutGuide);
  -[IOSBasedChromeViewController setInnerLayoutGuide:](self, "setInnerLayoutGuide:", v3);

  v4 = (objc_class *)objc_opt_class(IOSBasedChromeViewController);
  v5 = NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.innerLayoutGuide"), v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController innerLayoutGuide](self, "innerLayoutGuide"));
  objc_msgSend(v8, "setIdentifier:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController view](self, "view"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController innerLayoutGuide](self, "innerLayoutGuide"));
  objc_msgSend(v9, "addLayoutGuide:", v10);

  v11 = objc_alloc_init((Class)UILayoutGuide);
  -[IOSBasedChromeViewController setWeatherLayoutGuide:](self, "setWeatherLayoutGuide:", v11);

  v12 = (objc_class *)objc_opt_class(IOSBasedChromeViewController);
  v13 = NSStringFromClass(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.weatherLayoutGuide"), v14));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController weatherLayoutGuide](self, "weatherLayoutGuide"));
  objc_msgSend(v16, "setIdentifier:", v15);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController view](self, "view"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController weatherLayoutGuide](self, "weatherLayoutGuide"));
  objc_msgSend(v17, "addLayoutGuide:", v18);

  v19 = objc_alloc_init(IOSCardsOverlay);
  cardsOverlay = self->_cardsOverlay;
  self->_cardsOverlay = v19;

  -[ContainerViewController setAllowOnlyStandardStyle:](self->_cardsOverlay, "setAllowOnlyStandardStyle:", 0);
  -[ContainerViewController setChromeViewController:](self->_cardsOverlay, "setChromeViewController:", self);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController overlayController](self, "overlayController"));
  objc_msgSend(v21, "addOverlay:", self->_cardsOverlay);

  v22 = objc_alloc_init(FloatingControlsOverlay);
  -[IOSBasedChromeViewController setFloatingControlsOverlay:](self, "setFloatingControlsOverlay:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController floatingControlsOverlay](self, "floatingControlsOverlay"));
  objc_msgSend(v23, "setMapViewProvider:", self);

  v24 = -[FloatingControlsOverlayDelegateProxy initWithChromeViewController:]([FloatingControlsOverlayDelegateProxy alloc], "initWithChromeViewController:", self);
  floatingControlsOverlayDelegateProxy = self->_floatingControlsOverlayDelegateProxy;
  self->_floatingControlsOverlayDelegateProxy = v24;

  v26 = self->_floatingControlsOverlayDelegateProxy;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController floatingControlsOverlay](self, "floatingControlsOverlay"));
  objc_msgSend(v27, "setDelegate:", v26);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController overlayController](self, "overlayController"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController floatingControlsOverlay](self, "floatingControlsOverlay"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController innerLayoutGuide](self, "innerLayoutGuide"));
  objc_msgSend(v28, "addOverlay:inLayoutGuide:", v29, v30);

  self->_statusBarHidden = -[IOSBasedChromeViewController _defaultPrefersStatusBarHidden](self, "_defaultPrefersStatusBarHidden");
  self->_statusBarStyle = -[IOSBasedChromeViewController _defaultPreferredStatusBarStyle](self, "_defaultPreferredStatusBarStyle");
  v31 = [StatusBarBackgroundView alloc];
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController view](self, "view"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "safeAreaLayoutGuide"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "topAnchor"));
  v35 = -[StatusBarBackgroundView initWithSafeAreaTopLayoutAnchor:](v31, "initWithSafeAreaTopLayoutAnchor:", v34);
  statusBarBackgroundView = self->_statusBarBackgroundView;
  self->_statusBarBackgroundView = v35;

  -[StatusBarBackgroundView setTranslatesAutoresizingMaskIntoConstraints:](self->_statusBarBackgroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController _defaultStatusBarBackgroundViewStyle](self, "_defaultStatusBarBackgroundViewStyle"));
  -[StatusBarBackgroundView setStyle:](self->_statusBarBackgroundView, "setStyle:", v37);

  v38 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController view](self, "view"));
  objc_msgSend(v38, "addSubview:", self->_statusBarBackgroundView);

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController viewportLayoutGuide](self, "viewportLayoutGuide"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "topAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[StatusBarBackgroundView bottomAnchor](self->_statusBarBackgroundView, "bottomAnchor"));
  LODWORD(v42) = 1148829696;
  v43 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToAnchor:constant:priority:", v41, 0.0, v42));
  viewportTopEqualToStatusBarBottomConstraint = self->_viewportTopEqualToStatusBarBottomConstraint;
  self->_viewportTopEqualToStatusBarBottomConstraint = v43;

  v45 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController viewportLayoutGuide](self, "viewportLayoutGuide"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "topAnchor"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController view](self, "view"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "safeAreaLayoutGuide"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "topAnchor"));
  v50 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "constraintEqualToAnchor:", v49));
  viewportTopEqualToSafeAreaBottomConstraint = self->_viewportTopEqualToSafeAreaBottomConstraint;
  self->_viewportTopEqualToSafeAreaBottomConstraint = v50;

  v83 = (void *)objc_claimAutoreleasedReturnValue(-[StatusBarBackgroundView leadingAnchor](self->_statusBarBackgroundView, "leadingAnchor"));
  v84 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController view](self, "view"));
  v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "leadingAnchor"));
  v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "constraintEqualToAnchor:", v82));
  v86[0] = v81;
  v79 = (void *)objc_claimAutoreleasedReturnValue(-[StatusBarBackgroundView trailingAnchor](self->_statusBarBackgroundView, "trailingAnchor"));
  v80 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController view](self, "view"));
  v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "trailingAnchor"));
  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "constraintEqualToAnchor:", v78));
  v86[1] = v77;
  v75 = (void *)objc_claimAutoreleasedReturnValue(-[StatusBarBackgroundView topAnchor](self->_statusBarBackgroundView, "topAnchor"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController view](self, "view"));
  v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "topAnchor"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "constraintEqualToAnchor:", v74));
  v86[2] = v73;
  v71 = (void *)objc_claimAutoreleasedReturnValue(-[StatusBarBackgroundView bottomAnchor](self->_statusBarBackgroundView, "bottomAnchor"));
  v72 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController view](self, "view"));
  v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "safeAreaLayoutGuide"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "topAnchor"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "constraintGreaterThanOrEqualToAnchor:", v69));
  v86[3] = v68;
  v67 = (void *)objc_claimAutoreleasedReturnValue(-[StatusBarBackgroundView bottomAnchor](self->_statusBarBackgroundView, "bottomAnchor"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController view](self, "view"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "safeAreaLayoutGuide"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "topAnchor"));
  LODWORD(v55) = 1132068864;
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "constraintEqualToAnchor:constant:priority:", v54, 0.0, v55));
  v86[4] = v56;
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController viewportLayoutGuide](self, "viewportLayoutGuide"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "topAnchor"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[StatusBarBackgroundView bottomAnchor](self->_statusBarBackgroundView, "bottomAnchor"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "constraintGreaterThanOrEqualToAnchor:", v59));
  v61 = self->_viewportTopEqualToSafeAreaBottomConstraint;
  v86[5] = v60;
  v86[6] = v61;
  v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v86, 7));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v62);

  v63 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController theme](self, "theme"));
  objc_msgSend(v63, "applyAppearance");

  -[ChromeViewController loadMapViewIfNeeded](self, "loadMapViewIfNeeded");
  v64 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
  objc_msgSend(v64, "setCompassEnabled:", 0);

  -[EnvironmentObserver updateCurrentEnvironmentName](self->_environmentObserver, "updateCurrentEnvironmentName");
  -[IOSBasedChromeViewController _loadInternalDebugSetting](self, "_loadInternalDebugSetting");
  v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v65, "addObserver:selector:name:object:", self, "_windowUserInterfaceStyleDidChange", CFSTR("MapsWindowUserInterfaceStyleDidChangeNotification"), 0);

  v66 = (void *)objc_claimAutoreleasedReturnValue(+[VGVirtualGarageService sharedService](VGVirtualGarageService, "sharedService"));
  objc_msgSend(v66, "registerObserver:", self);

  -[IOSBasedChromeViewController _updateMapViewWithEVChargingConfig](self, "_updateMapViewWithEVChargingConfig");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)IOSBasedChromeViewController;
  -[IOSBasedChromeViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[IOSBasedChromeViewController createScreenshotService](self, "createScreenshotService");
  -[IOSBasedChromeViewController _createOverlaysIfNeeded:](self, "_createOverlaysIfNeeded:", 0);
  -[IOSBasedChromeViewController updateComponentsIfNeeded](self, "updateComponentsIfNeeded");
  -[ChromeViewController updateMapViewFrameRate](self, "updateMapViewFrameRate");
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double right;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MinX;
  double v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat left;
  CGFloat rect1;
  double v48;
  double v49;
  objc_super v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;

  v50.receiver = self;
  v50.super_class = (Class)IOSBasedChromeViewController;
  -[ChromeViewController viewDidLayoutSubviews](&v50, "viewDidLayoutSubviews");
  if (sub_1002A8AA0(self) != 5
    && !-[IOSBasedChromeViewController _internal_topContextWantsCompassLayoutControl](self, "_internal_topContextWantsCompassLayoutControl"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController innerLayoutGuide](self, "innerLayoutGuide"));
    objc_msgSend(v4, "layoutFrame");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController innerLayoutGuide](self, "innerLayoutGuide"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "owningView"));
    objc_msgSend(v3, "convertRect:fromView:", v14, v6, v8, v10, v12);
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v45 = v21;

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
    objc_msgSend(v22, "_edgeInsets");
    v48 = v24;
    v49 = v23;

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
    objc_msgSend(v25, "bounds");
    v43 = v27;
    v44 = v26;
    v42 = v28;
    rect1 = v29;
    left = UIEdgeInsetsZero.left;
    right = UIEdgeInsetsZero.right;
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v51.origin.x = v16;
    v51.origin.y = v18;
    v51.size.width = v20;
    v51.size.height = v45;
    v59.origin.x = CGRectZero.origin.x;
    v59.origin.y = y;
    v59.size.width = width;
    v59.size.height = height;
    if (CGRectEqualToRect(v51, v59))
    {
      MinX = left;
    }
    else
    {
      v52.origin.y = v43;
      v52.origin.x = v44;
      v52.size.width = v42;
      v52.size.height = rect1;
      v60.origin.x = CGRectZero.origin.x;
      v60.origin.y = y;
      v60.size.width = width;
      v60.size.height = height;
      MinX = left;
      if (!CGRectEqualToRect(v52, v60))
      {
        v53.origin.x = v16;
        v53.origin.y = v18;
        v53.size.width = v20;
        v53.size.height = v45;
        CGRectGetMinY(v53);
        v54.origin.x = v16;
        v54.origin.y = v18;
        v54.size.width = v20;
        v54.size.height = v45;
        MinX = CGRectGetMinX(v54);
        v55.origin.x = v44;
        v55.origin.y = v43;
        v55.size.width = v42;
        v55.size.height = rect1;
        CGRectGetHeight(v55);
        v56.origin.x = v16;
        v56.origin.y = v18;
        v56.size.width = v20;
        v56.size.height = v45;
        CGRectGetMaxY(v56);
        v57.origin.x = v44;
        v57.origin.y = v43;
        v57.size.width = v42;
        v57.size.height = rect1;
        v35 = CGRectGetWidth(v57);
        v58.origin.x = v16;
        v58.origin.y = v18;
        v58.size.width = v20;
        v58.size.height = v45;
        right = v35 - CGRectGetMaxX(v58);
      }
    }

    v36 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
    objc_msgSend(v36, "_compassInsets");
    v38 = v37;
    v40 = v39;

    v41 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
    objc_msgSend(v41, "_setCompassInsets:", v38, MinX - v49, v40, right - v48);

  }
}

- (void)_createOverlaysIfNeeded:(BOOL)a3
{
  WeatherOverlay *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  LookAroundChromeOverlay *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _TtC4Maps23RedoSearchChromeOverlay *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  PedestrianARSessionStateManager *v22;
  PedestrianARSessionStateManager *pedestrianARSessionStateManager;

  if (!self->_didAddOverlays && -[IOSBasedChromeViewController _appearState](self, "_appearState") == 2)
  {
    self->_didAddOverlays = 1;
    v5 = objc_alloc_init(WeatherOverlay);
    -[IOSBasedChromeViewController setWeatherOverlay:](self, "setWeatherOverlay:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController weatherOverlay](self, "weatherOverlay"));
    objc_msgSend(v6, "setMapViewProvider:", self);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController overlayController](self, "overlayController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController weatherOverlay](self, "weatherOverlay"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController innerLayoutGuide](self, "innerLayoutGuide"));
    objc_msgSend(v7, "addOverlay:inLayoutGuide:", v8, v9);

    if (sub_1002A8AA0(self) != 5)
    {
      v10 = objc_alloc_init(LookAroundChromeOverlay);
      -[IOSBasedChromeViewController setLookAroundOverlay:](self, "setLookAroundOverlay:", v10);

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController lookAroundOverlay](self, "lookAroundOverlay"));
      objc_msgSend(v11, "setDelegate:", self);

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController overlayController](self, "overlayController"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController lookAroundOverlay](self, "lookAroundOverlay"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController innerLayoutGuide](self, "innerLayoutGuide"));
      objc_msgSend(v12, "addOverlay:inLayoutGuide:", v13, v14);

    }
    v15 = objc_alloc_init(_TtC4Maps23RedoSearchChromeOverlay);
    -[IOSBasedChromeViewController setRedoSearchOverlay:](self, "setRedoSearchOverlay:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController redoSearchOverlay](self, "redoSearchOverlay"));
    objc_msgSend(v16, "setDelegate:", self);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController overlayController](self, "overlayController"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController redoSearchOverlay](self, "redoSearchOverlay"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController innerLayoutGuide](self, "innerLayoutGuide"));
    objc_msgSend(v17, "addOverlay:inLayoutGuide:", v18, v19);

    if (!+[PedestrianARSessionTask isPedestrianARModeSupported](PedestrianARSessionTask, "isPedestrianARModeSupported")|| self->_pedestrianARSessionStateManager)
    {
      if (a3)
        return;
LABEL_10:
      -[ChromeViewController setNeedsUpdateComponent:animated:](self, "setNeedsUpdateComponent:animated:", CFSTR("weatherOverlay"), 0);
      -[ChromeViewController setNeedsUpdateComponent:animated:](self, "setNeedsUpdateComponent:animated:", CFSTR("lookAroundButton"), 0);
      return;
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController appCoordinator](self, "appCoordinator"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "platformController"));
    v22 = (PedestrianARSessionStateManager *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "pedestrianARSessionStateManager"));
    pedestrianARSessionStateManager = self->_pedestrianARSessionStateManager;
    self->_pedestrianARSessionStateManager = v22;

    -[PedestrianARSessionStateManager addObserver:](self->_pedestrianARSessionStateManager, "addObserver:", self);
    if (!a3)
      goto LABEL_10;
  }
}

- (void)viewLayoutMarginsDidChange
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)IOSBasedChromeViewController;
  -[IOSBasedChromeViewController viewLayoutMarginsDidChange](&v7, "viewLayoutMarginsDidChange");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController _currentContainerViewController](self, "_currentContainerViewController"));
  objc_msgSend(v3, "edgePadding");
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController floatingControlsOverlay](self, "floatingControlsOverlay"));
  objc_msgSend(v6, "setMargin:", v5);

}

- (void)_loadInternalDebugSetting
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v7, "BOOLForKey:", CFSTR("DisableLocationPulse")) ^ 1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
  objc_msgSend(v4, "_setLocationPulseEnabled:", v3);

  v5 = objc_msgSend(v7, "BOOLForKey:", CFSTR("DebugConsoleEnabled"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
  objc_msgSend(v6, "setLocationConsoleEnabled:", v5);

}

- (unint64_t)supportedInterfaceOrientations
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController topContext](self, "topContext"));
  if ((objc_opt_respondsToSelector(v3, "fullscreenViewController") & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController topContext](self, "topContext"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fullscreenViewController"));

  }
  else
  {
    v5 = 0;
  }

  if ((objc_opt_respondsToSelector(v5, "supportedInterfaceOrientations") & 1) != 0)
  {
    v6 = (unint64_t)objc_msgSend(v5, "supportedInterfaceOrientations");
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController cardsOverlay](self, "cardsOverlay"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentViewController"));

    if ((objc_opt_respondsToSelector(v8, "supportedInterfaceOrientations") & 1) != 0)
      v6 = (unint64_t)objc_msgSend(v8, "supportedInterfaceOrientations");
    else
      v6 = 26;

  }
  return v6;
}

- (BOOL)prefersHomeIndicatorAutoHidden
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController topContext](self, "topContext"));
  if ((objc_opt_respondsToSelector(v2, "fullscreenViewController") & 1) != 0)
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "fullscreenViewController"));
  else
    v3 = 0;
  if ((objc_opt_respondsToSelector(v3, "prefersHomeIndicatorAutoHidden") & 1) != 0)
    v4 = objc_msgSend(v3, "prefersHomeIndicatorAutoHidden");
  else
    v4 = 0;

  return v4;
}

- (void)contextStackWillUpdateFrom:(id)a3 to:(id)a4 withAnimation:(id)a5
{
  id v8;
  _QWORD v9[5];
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)IOSBasedChromeViewController;
  v8 = a5;
  -[ChromeViewController contextStackWillUpdateFrom:to:withAnimation:](&v10, "contextStackWillUpdateFrom:to:withAnimation:", a3, a4, v8);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100A2EE4C;
  v9[3] = &unk_1011AC860;
  v9[4] = self;
  objc_msgSend(v8, "addPreparation:", v9);

}

- (void)contextStackDidUpdateFrom:(id)a3 to:(id)a4 withAnimation:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  objc_super v17;

  v8 = a5;
  v17.receiver = self;
  v17.super_class = (Class)IOSBasedChromeViewController;
  v9 = a4;
  -[ChromeViewController contextStackDidUpdateFrom:to:withAnimation:](&v17, "contextStackDidUpdateFrom:to:withAnimation:", a3, v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastObject"));

  if ((objc_opt_respondsToSelector(v10, "fullscreenViewController") & 1) != 0)
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "fullscreenViewController"));
  else
    v11 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100A2EF78;
  v14[3] = &unk_1011E0110;
  v14[4] = self;
  v15 = v11;
  v16 = v10;
  v12 = v10;
  v13 = v11;
  objc_msgSend(v8, "addCompletion:", v14);

}

- (void)_freezeInnerLayoutGuide
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat left;
  double right;
  CGFloat bottom;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v19;
  double MinX;
  double top;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSArray *v32;
  NSArray *innerLayoutGuideConstraints;
  void *v34;
  void *v35;
  CGFloat v36;
  void *v37;
  CGFloat rect;
  CGFloat v39;
  void *v40;
  CGFloat v41;
  void *v42;
  CGFloat v43;
  void *v44;
  CGFloat v45;
  void *v46;
  CGFloat v47;
  void *v48;
  CGFloat rect1;
  void *rect1a;
  id v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController innerLayoutGuide](self, "innerLayoutGuide"));
  objc_msgSend(v3, "layoutFrame");
  v45 = v5;
  v47 = v4;
  v43 = v6;
  rect1 = v7;

  if (self->_innerLayoutGuideConstraints)
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController innerLayoutGuide](self, "innerLayoutGuide"));
  v51 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "owningView"));

  objc_msgSend(v51, "bounds");
  v36 = v9;
  rect = v10;
  v39 = v12;
  v41 = v11;
  left = UIEdgeInsetsZero.left;
  bottom = UIEdgeInsetsZero.bottom;
  right = UIEdgeInsetsZero.right;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v52.origin.y = v45;
  v52.origin.x = v47;
  v52.size.width = v43;
  v52.size.height = rect1;
  v60.origin.x = CGRectZero.origin.x;
  v60.origin.y = y;
  v60.size.width = width;
  v60.size.height = height;
  if (CGRectEqualToRect(v52, v60))
  {
    v19 = bottom;
    MinX = left;
    top = UIEdgeInsetsZero.top;
  }
  else
  {
    v53.origin.x = v36;
    v53.size.height = rect;
    v53.size.width = v39;
    v53.origin.y = v41;
    v61.origin.x = CGRectZero.origin.x;
    v61.origin.y = y;
    v61.size.width = width;
    v61.size.height = height;
    v19 = bottom;
    MinX = left;
    top = UIEdgeInsetsZero.top;
    if (!CGRectEqualToRect(v53, v61))
    {
      v54.origin.x = v47;
      v54.origin.y = v45;
      v54.size.width = v43;
      v54.size.height = rect1;
      top = CGRectGetMinY(v54);
      v55.origin.x = v47;
      v55.origin.y = v45;
      v55.size.width = v43;
      v55.size.height = rect1;
      MinX = CGRectGetMinX(v55);
      v56.size.height = rect;
      v56.origin.x = v36;
      v56.size.width = v39;
      v56.origin.y = v41;
      v22 = CGRectGetHeight(v56);
      v57.origin.x = v47;
      v57.origin.y = v45;
      v57.size.width = v43;
      v57.size.height = rect1;
      v19 = v22 - CGRectGetMaxY(v57);
      v58.origin.x = v36;
      v58.size.width = v39;
      v58.origin.y = v41;
      v58.size.height = rect;
      v23 = CGRectGetWidth(v58);
      v59.origin.x = v47;
      v59.origin.y = v45;
      v59.size.width = v43;
      v59.size.height = rect1;
      right = v23 - CGRectGetMaxX(v59);
    }
  }
  rect1a = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController innerLayoutGuide](self, "innerLayoutGuide"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(rect1a, "topAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "topAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintEqualToAnchor:constant:", v46, top));
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController innerLayoutGuide](self, "innerLayoutGuide"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "leftAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "leftAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:constant:", v40, MinX));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "bottomAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController innerLayoutGuide](self, "innerLayoutGuide"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "bottomAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:constant:", v25, v19));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "rightAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController innerLayoutGuide](self, "innerLayoutGuide"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "rightAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:constant:", v29, right));
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[MapsEdgeConstraints edgeConstraintsWithTop:leading:bottom:trailing:](MapsEdgeConstraints, "edgeConstraintsWithTop:leading:bottom:trailing:", v35, v34, v26, v30));
  v32 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "allConstraints"));
  innerLayoutGuideConstraints = self->_innerLayoutGuideConstraints;
  self->_innerLayoutGuideConstraints = v32;

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", self->_innerLayoutGuideConstraints);
}

- (void)_updateInnerLayoutGuideWithTopViewController:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  double v14;
  void *v15;
  NSArray *v16;
  NSArray *innerLayoutGuideConstraints;
  id v18;

  v18 = a3;
  v4 = objc_opt_class(OverlayContainerViewController);
  if ((objc_opt_isKindOfClass(v18, v4) & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "view"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController view](self, "view"));
    v7 = objc_msgSend(v5, "isDescendantOfView:", v6);

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "innerLayoutGuide"));
      if (!v8)
        goto LABEL_10;
      goto LABEL_9;
    }
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController cardsOverlay](self, "cardsOverlay"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "currentViewController"));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController cardsOverlay](self, "cardsOverlay"));
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "innerLayoutGuide"));
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController overlayController](self, "overlayController"));
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "contentLayoutGuide"));
  }
  v8 = (void *)v12;

  if (v8)
  {
LABEL_9:
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", self->_innerLayoutGuideConstraints);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController innerLayoutGuide](self, "innerLayoutGuide"));
    LODWORD(v14) = 1148846080;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "_maps_constraintsEqualToEdgesOfLayoutGuide:priority:", v8, v14));
    v16 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "allConstraints"));
    innerLayoutGuideConstraints = self->_innerLayoutGuideConstraints;
    self->_innerLayoutGuideConstraints = v16;

    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", self->_innerLayoutGuideConstraints);
  }
LABEL_10:

}

- (BOOL)_canShowWeather
{
  int v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  if (sub_1002A8AA0(self) == 5 && -[ChromeViewController isTransitioning](self, "isTransitioning"))
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController contexts](self, "contexts", 0));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "reverseObjectEnumerator"));

    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v3 = 0;
      v8 = *(_QWORD *)v13;
LABEL_6:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector(v10, "permitsWeatherShowing") & 1) != 0
          && !objc_msgSend(v10, "permitsWeatherShowing"))
        {
          break;
        }
        if ((objc_opt_respondsToSelector(v10, "wantsWeatherShowing") & 1) != 0)
          v3 |= objc_msgSend(v10, "wantsWeatherShowing");
        if (v7 == (id)++v9)
        {
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
          if (v7)
            goto LABEL_6;
          goto LABEL_17;
        }
      }
    }
    LOBYTE(v3) = 0;
LABEL_17:

  }
  return v3 & 1;
}

- (void)_updateMapViewResponderTargetForObject:(id)a3
{
  unsigned int v4;
  void *v5;
  id v6;
  id v7;

  v7 = a3;
  v4 = sub_1007F7BE8((uint64_t)v7, (Protocol *)&OBJC_PROTOCOL___MapViewResponderHandling);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController mapViewResponder](self, "mapViewResponder"));
  if (v4)
    v6 = v7;
  else
    v6 = 0;
  objc_msgSend(v5, "setTarget:", v6);

}

- (BOOL)_internal_isChromeDisabled
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MKSystemController sharedInstance](MKSystemController, "sharedInstance"));
  if (objc_msgSend(v2, "isInternalInstall"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("__internal__DisableChrome"));

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)_isNavigationMode
{
  void *v2;
  uint64_t v3;
  char isKindOfClass;
  uint64_t v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController currentIOSBasedContext](self, "currentIOSBasedContext"));
  v3 = objc_opt_class(NavModeController);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0)
  {
    isKindOfClass = 1;
  }
  else
  {
    v5 = objc_opt_class(StepModeController);
    isKindOfClass = objc_opt_isKindOfClass(v2, v5);
  }

  return isKindOfClass & 1;
}

- (void)updateViewMode:(int64_t)a3 animated:(BOOL)a4 preserveMapSelection:(BOOL)a5
{
  _BOOL8 v5;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a4;
  if (a5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapSelectionManager](self, "mapSelectionManager"));
    v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "selectionStateIncludingCamera:includeNotCustomLabelMarkers:", 0, 1));

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapSelectionManager](self, "mapSelectionManager"));
    objc_msgSend(v9, "setIgnoreSelectionChanges:", 1);

    -[IOSBasedChromeViewController updateViewMode:animated:](self, "updateViewMode:animated:", a3, v5);
    if (v12)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapSelectionManager](self, "mapSelectionManager"));
      objc_msgSend(v10, "restoreSelectionState:animated:restoreRegion:notifyDelegate:", v12, 0, 0, 0);

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapSelectionManager](self, "mapSelectionManager"));
    objc_msgSend(v11, "setIgnoreSelectionChanges:", 0);

  }
  else
  {
    -[IOSBasedChromeViewController updateViewMode:animated:](self, "updateViewMode:animated:", a3, a4);
  }
}

- (void)updateViewMode:(int64_t)displayedViewMode animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  uint64_t v8;
  int64_t v9;
  int64_t v10;
  int64_t v11;
  uint64_t v12;
  int64x2_t v13;
  BOOL v15;
  void *v16;
  _BOOL8 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  _OWORD v33[3];
  uint64_t v34;
  int64x2_t v35;
  int64x2_t v36;
  __int128 v37;
  uint64_t v38;
  int64x2_t v39;
  int64x2_t v40;
  __int128 v41;
  uint64_t v42;

  v4 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
  if (objc_msgSend(v7, "isUsingOfflineMaps"))
  {

    if (((displayedViewMode - 1) & 0xFFFFFFFFFFFFFFFALL) == 0)
    {
      displayedViewMode = self->_displayedViewMode;
      if (((displayedViewMode - 1) & 0xFFFFFFFFFFFFFFFALL) == 0)
      {
        v42 = 0;
        v40 = 0u;
        v41 = 0u;
        v39 = 0u;
        _MKCartographicConfigurationDefault(&v39, v8);
        displayedViewMode = 0;
        v40 = vdupq_n_s64(1uLL);
        *(_QWORD *)&v41 = 0;
        goto LABEL_13;
      }
    }
  }
  else
  {

  }
  v42 = 0;
  v40 = 0u;
  v41 = 0u;
  v39 = 0u;
  _MKCartographicConfigurationDefault(&v39, v8);
  v40 = vdupq_n_s64(1uLL);
  *(_QWORD *)&v41 = 0;
  switch(displayedViewMode)
  {
    case 1:
      displayedViewMode = 1;
      v39 = vdupq_n_s64(1uLL);
      v40.i64[0] = 0;
      break;
    case 2:
      v40.i64[0] = 0;
      v39 = (int64x2_t)1uLL;
      displayedViewMode = 2;
      break;
    case 3:
      v39.i64[1] = 4;
      displayedViewMode = 3;
      break;
    case 5:
      v39 = vdupq_n_s64(1uLL);
      displayedViewMode = 5;
      break;
    case 6:
      v39 = (int64x2_t)xmmword_100E2D550;
      displayedViewMode = 6;
      break;
    case 7:
      v39.i64[1] = 2;
      displayedViewMode = 7;
      break;
    default:
      break;
  }
LABEL_13:
  if (-[IOSBasedChromeViewController shouldUseModernMap](self, "shouldUseModernMap"))
    v9 = -[IOSBasedChromeViewController modernMapProjectionType](self, "modernMapProjectionType");
  else
    v9 = v40.i64[0];
  v40.i64[0] = v9;
  if (-[IOSBasedChromeViewController shouldUseModernMap](self, "shouldUseModernMap"))
    v10 = -[IOSBasedChromeViewController modernMapTerrainMode](self, "modernMapTerrainMode");
  else
    v10 = v40.i64[1];
  v11 = self->_displayedViewMode;
  v40.i64[1] = v10;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0;
  _MKCartographicConfigurationDefault(&v35, v10);
  v36 = vdupq_n_s64(1uLL);
  *(_QWORD *)&v37 = 0;
  switch(v11)
  {
    case 1:
      v35 = vdupq_n_s64(1uLL);
      v36.i64[0] = 0;
      break;
    case 2:
      v36.i64[0] = 0;
      v35 = (int64x2_t)1uLL;
      break;
    case 3:
      v12 = 4;
      goto LABEL_27;
    case 5:
      v13 = vdupq_n_s64(1uLL);
      goto LABEL_25;
    case 6:
      v13 = (int64x2_t)xmmword_100E2D550;
LABEL_25:
      v35 = v13;
      break;
    case 7:
      v12 = 2;
LABEL_27:
      v35.i64[1] = v12;
      break;
    default:
      break;
  }
  v15 = v35.i64[0] == 1 && v39.i64[0] != 1;
  self->_transitioningFromImagery = v15;
  self->_displayedViewMode = displayedViewMode;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
  v33[0] = v39;
  v33[1] = v40;
  v33[2] = v41;
  v34 = v42;
  objc_msgSend(v16, "_setCartographicConfiguration:animated:", v33, v4);

  v17 = -[IOSBasedChromeViewController _shouldShowTrafficForViewMode:](self, "_shouldShowTrafficForViewMode:", displayedViewMode);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
  objc_msgSend(v18, "setShowsTraffic:", v17);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController userLocationView](self, "userLocationView"));
  objc_msgSend(v19, "setViewMode:", displayedViewMode);

  self->_interfaceStyleForMapType = 0;
  -[IOSBasedChromeViewController _updateMapViewWithEVChargingConfig](self, "_updateMapViewWithEVChargingConfig");
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController _maps_mapsSceneDelegate](self, "_maps_mapsSceneDelegate"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "window"));

  if (sub_1002A8AA0(self) == 5)
    goto LABEL_39;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
  if (!v22)
  {
    v32 = 0;
    v30 = 0u;
    v31 = 0u;
    v29 = 0u;
    goto LABEL_39;
  }
  v23 = v22;
  objc_msgSend(v22, "_cartographicConfiguration");

  if ((_QWORD)v29 != 1)
  {
LABEL_39:
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView", v29, v30, v31, v32));
    objc_msgSend(v25, "setOverrideUserInterfaceStyle:", 0);
    v24 = 0;
    goto LABEL_40;
  }
  v24 = 2;
  self->_interfaceStyleForMapType = 2;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
  objc_msgSend(v25, "setOverrideUserInterfaceStyle:", 1);
LABEL_40:

  objc_msgSend(v21, "setOverrideUserInterfaceStyle:", v24);
  -[IOSBasedChromeViewController updateThemeViewAndControllers](self, "updateThemeViewAndControllers");
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController viewModeDelegate](self, "viewModeDelegate"));
  objc_msgSend(v26, "chromeViewController:didUpdateViewMode:", self, displayedViewMode);

  -[IOSBasedChromeViewController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[MapsFavoritesManager sharedManager](_TtC4Maps20MapsFavoritesManager, "sharedManager"));
  objc_msgSend(v27, "setMapViewMode:", displayedViewMode);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
  +[MapsAnalyticStateProvider updateMapViewInformation:](MapsAnalyticStateProvider, "updateMapViewInformation:", v28);

  +[MapsAnalyticStateProvider updateMapViewViewMode:](MapsAnalyticStateProvider, "updateMapViewViewMode:", displayedViewMode);
}

- (void)didUpdateForcedExploreMapConfiguration:(BOOL)a3
{
  void *v4;
  void *v5;
  id v6;

  if (a3 && sub_1002A8AA0(self) != 5)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
    objc_msgSend(v4, "setOverrideUserInterfaceStyle:", 0);

    v6 = (id)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController _maps_mapsSceneDelegate](self, "_maps_mapsSceneDelegate"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "window"));
    objc_msgSend(v5, "setOverrideUserInterfaceStyle:", 0);

  }
}

- (void)_updateMapViewWithEVChargingConfig
{
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id location;

  if (MapsFeature_IsEnabled_RealTimeEVCharger(self, a2))
  {
    if (self->_displayedViewMode == 7)
    {
      objc_initWeak(&location, self);
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[VGVirtualGarageService sharedService](VGVirtualGarageService, "sharedService"));
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_100A2FF90;
      v5[3] = &unk_1011AD100;
      objc_copyWeak(&v6, &location);
      objc_msgSend(v3, "virtualGarageGetGarageWithReply:", v5);

      objc_destroyWeak(&v6);
      objc_destroyWeak(&location);
    }
    else
    {
      v4 = (id)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
      objc_msgSend(v4, "setShowsLiveEVData:", 0);

    }
  }
}

- (void)virtualGarageDidUpdate:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100A30444;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (BOOL)isNightMode
{
  void *v3;
  void *v4;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "_cartographicConfiguration");

    if ((_QWORD)v6 == 1)
      return 0;
  }
  else
  {
    v9 = 0;
    v7 = 0u;
    v8 = 0u;
    v6 = 0u;
  }
  return (id)-[IOSBasedChromeViewController preferredUserInterfaceStyle](self, "preferredUserInterfaceStyle", v6, v7, v8, v9) == (id)2;
}

- (void)_windowUserInterfaceStyleDidChange
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100A30520;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)updateThemeForVisualEffectStyle:(unint64_t)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController theme](self, "theme"));
  objc_msgSend(v4, "updateVisualEffectStyleIfNeeded:", a3);

}

- (void)updateThemeViewAndControllers
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "window"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController theme](self, "theme"));
  objc_msgSend(v4, "_accessibilitySetInterfaceStyleIntent:", objc_msgSend(v5, "interfaceStyleIntent"));

  v6 = !self->_transitioningFromImagery;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MapsLightLevelController sharedController](MapsLightLevelController, "sharedController"));
  -[IOSBasedChromeViewController updateLightLevelAnimated:lightLevel:](self, "updateLightLevelAnimated:lightLevel:", v6, objc_msgSend(v7, "currentLightLevel"));

  self->_transitioningFromImagery = 0;
  -[IOSBasedChromeViewController setNeedsUserInterfaceAppearanceUpdate](self, "setNeedsUserInterfaceAppearanceUpdate");
  -[IOSBasedChromeViewController setNeedsUpdateOfHomeIndicatorAutoHidden](self, "setNeedsUpdateOfHomeIndicatorAutoHidden");
}

- (void)setNeedsUserInterfaceAppearanceUpdate
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IOSBasedChromeViewController;
  -[IOSBasedChromeViewController setNeedsUserInterfaceAppearanceUpdate](&v6, "setNeedsUserInterfaceAppearanceUpdate");
  v3 = objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController presentedViewController](self, "presentedViewController"));
  if (v3)
  {
    v4 = (void *)v3;
    do
    {
      objc_msgSend(v4, "setNeedsUserInterfaceAppearanceUpdate");
      v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "presentedViewController"));

      v4 = (void *)v5;
    }
    while (v5);
  }
}

- (int64_t)preferredUserInterfaceStyle
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  int64_t interfaceStyleForMapType;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController viewIfLoaded](self, "viewIfLoaded"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "window"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "traitCollection"));
  v6 = objc_msgSend(v5, "copy");

  v7 = objc_msgSend(v6, "userInterfaceStyle");
  if (-[IOSBasedChromeViewController _isNavigationMode](self, "_isNavigationMode"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MapsLightLevelController sharedController](MapsLightLevelController, "sharedController"));
    v9 = objc_msgSend(v8, "currentLightLevel");

    if (v9 == (id)2)
      interfaceStyleForMapType = 2;
    else
      interfaceStyleForMapType = 1;
  }
  else
  {
    interfaceStyleForMapType = self->_interfaceStyleForMapType;
    if (!interfaceStyleForMapType)
    {
      if (self->_interfaceStyleForLight)
        interfaceStyleForMapType = self->_interfaceStyleForLight;
      else
        interfaceStyleForMapType = (int64_t)v7;
    }
  }

  return interfaceStyleForMapType;
}

- (void)updateLightLevelAnimated:(BOOL)a3 lightLevel:(int64_t)a4
{
  uint64_t v5;
  id v7;
  NSObject *v8;
  IOSBasedChromeViewController *v9;
  IOSBasedChromeViewController *v10;
  objc_class *v11;
  NSString *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  NSObject *v24;
  IOSBasedChromeViewController *v25;
  objc_class *v26;
  NSString *v27;
  void *v28;
  void *v29;
  void *v30;
  __CFString *v31;
  void *v32;
  _QWORD v33[5];
  BOOL v34;
  uint8_t buf[4];
  __CFString *v36;
  __int16 v37;
  __CFString *v38;

  LODWORD(v5) = a3;
  if (sub_1002A8AA0(self) != 5)
  {
    if (a4)
      v5 = v5;
    else
      v5 = 0;
    v7 = sub_100432D1C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      goto LABEL_18;
    v9 = self;
    v10 = v9;
    if (!v9)
    {
      v16 = CFSTR("<nil>");
      goto LABEL_14;
    }
    v11 = (objc_class *)objc_opt_class(v9);
    v12 = NSStringFromClass(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    if ((objc_opt_respondsToSelector(v10, "accessibilityIdentifier") & 1) != 0)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController performSelector:](v10, "performSelector:", "accessibilityIdentifier"));
      v15 = v14;
      if (v14 && !objc_msgSend(v14, "isEqualToString:", v13))
      {
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v13, v10, v15));

        goto LABEL_12;
      }

    }
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v13, v10));
LABEL_12:

LABEL_14:
    v17 = v16;
    if ((unint64_t)a4 >= 3)
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Unknown: %ld>"), a4));
    else
      v18 = off_1011E0178[a4];
    *(_DWORD *)buf = 138543618;
    v36 = v17;
    v37 = 2112;
    v38 = v18;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}@] updateLightLevelAnimated with lightLevel: %@", buf, 0x16u);

LABEL_18:
    if (!-[IOSBasedChromeViewController _isNavigationMode](self, "_isNavigationMode"))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController viewIfLoaded](self, "viewIfLoaded"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "window"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "traitCollection"));
      v22 = objc_msgSend(v21, "copy");

      a4 = (int64_t)objc_msgSend(v22, "userInterfaceStyle");
    }
    self->_interfaceStyleForLight = 2 * (a4 == 2);
    v23 = sub_100432D1C();
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      goto LABEL_27;
    v25 = self;
    v26 = (objc_class *)objc_opt_class(v25);
    v27 = NSStringFromClass(v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    if ((objc_opt_respondsToSelector(v25, "accessibilityIdentifier") & 1) != 0)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController performSelector:](v25, "performSelector:", "accessibilityIdentifier"));
      v30 = v29;
      if (v29 && !objc_msgSend(v29, "isEqualToString:", v28))
      {
        v31 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v28, v25, v30));

        goto LABEL_26;
      }

    }
    v31 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v28, v25));
LABEL_26:

    *(_DWORD *)buf = 138543618;
    v36 = v31;
    v37 = 1024;
    LODWORD(v38) = a4 == 2;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "[%{public}@] Updating map view to show night mode: %d", buf, 0x12u);

LABEL_27:
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[GroupAnimation animationForAnimatedFlag:](GroupAnimation, "animationForAnimatedFlag:", v5));
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_100A30BA8;
    v33[3] = &unk_1011ACE58;
    v33[4] = self;
    v34 = a4 == 2;
    objc_msgSend(v32, "addAnimations:completion:", v33, 0);
    objc_msgSend(v32, "runWithDuration:delay:options:", 196608, 2.0, 0.0);

  }
}

- (void)updateMapViewDisplayOptions
{
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  _QWORD block[4];
  char v8;
  char v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController settingsController](self, "settingsController"));
  if (objc_msgSend(v3, "shouldChangeViewModeForLabels"))
    -[IOSBasedChromeViewController _updateViewModeForLabelsDisplayIfNeeded](self, "_updateViewModeForLabelsDisplayIfNeeded");
  if (objc_msgSend(v3, "shouldChangeViewModeForTraffic"))
    -[IOSBasedChromeViewController _updateViewModeForTrafficDisplayIfNeeded](self, "_updateViewModeForTrafficDisplayIfNeeded");
  v4 = -[IOSBasedChromeViewController _shouldShowTrafficForViewMode:](self, "_shouldShowTrafficForViewMode:", -[IOSBasedChromeViewController displayedViewMode](self, "displayedViewMode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
  objc_msgSend(v5, "setShowsTraffic:", v4);

  LOBYTE(v5) = objc_msgSend(v3, "userDesiresLabels");
  LOBYTE(v4) = objc_msgSend(v3, "userDesiresTraffic");
  v6 = objc_claimAutoreleasedReturnValue(+[MapsAnalyticStateProvider serialQueue](MapsAnalyticStateProvider, "serialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100A30CE8;
  block[3] = &unk_1011E0130;
  v8 = (char)v5;
  v9 = v4;
  dispatch_async(v6, block);

}

- (void)_updateViewModeForLabelsDisplayIfNeeded
{
  int64_t v3;
  void *v4;
  unsigned int v5;
  int64_t v6;

  v3 = -[IOSBasedChromeViewController displayedViewMode](self, "displayedViewMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController settingsController](self, "settingsController"));
  v5 = objc_msgSend(v4, "shouldChangeViewModeForLabels");

  if (v5)
  {
    v6 = v3 - 1;
    if ((unint64_t)(v3 - 1) <= 5 && ((0x33u >> v6) & 1) != 0)
      -[IOSBasedChromeViewController setViewMode:animated:](self, "setViewMode:animated:", qword_100E3CFB8[v6], 1);
  }
}

- (void)_updateViewModeForTrafficDisplayIfNeeded
{
  int64_t v3;
  void *v4;
  unsigned int v5;
  uint64_t v6;

  v3 = -[IOSBasedChromeViewController displayedViewMode](self, "displayedViewMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController settingsController](self, "settingsController"));
  v5 = objc_msgSend(v4, "shouldChangeViewModeForTraffic");

  if (v5)
  {
    switch(v3)
    {
      case 2:
        v6 = 1;
        goto LABEL_9;
      case 3:
        v6 = 0;
        goto LABEL_9;
      case 6:
        v6 = 5;
LABEL_9:
        -[IOSBasedChromeViewController setViewMode:animated:](self, "setViewMode:animated:", v6, 1);
        break;
    }
  }
}

- (BOOL)_shouldShowTrafficForViewMode:(int64_t)a3
{
  BOOL v3;
  void *v5;
  unsigned int v6;
  unsigned int v7;
  char v8;

  if (a3 == 7)
    return 1;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController settingsController](self, "settingsController"));
  v6 = objc_msgSend(v5, "userDesiresTraffic");
  v7 = (0x57u >> (a3 + 1)) & 1;
  if ((unint64_t)(a3 + 1) > 6)
    LOBYTE(v7) = 0;
  if (((a3 - 1) & 0xFFFFFFFFFFFFFFFALL) != 0)
    v8 = 0;
  else
    v8 = v7;
  if (v6)
    v3 = v8;
  else
    v3 = 0;

  return v3;
}

- (void)updateHistoricalLocations
{
  void *v3;
  _QWORD v4[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[DeviceRecentLocations sharedInstance](DeviceRecentLocations, "sharedInstance"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100A30F1C;
  v4[3] = &unk_1011B7B30;
  v4[4] = self;
  objc_msgSend(v3, "updateLocationsWithCompletionHandler:", v4);

}

- (BOOL)removesMapViewWhenInactive
{
  return 0;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)willMoveToOrFromSecureLockScreenUI:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;
  id v8;
  char v9;
  uint64_t v10;
  void *i;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = a3;
  self->_isTransitioningToLockScreen = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController contexts](self, "contexts", 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "reverseObjectEnumerator"));

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        if (sub_1007F7BE8((uint64_t)v12, (Protocol *)&OBJC_PROTOCOL___LockScreenProtocol))
        {
          if (v3)
            objc_msgSend(v12, "willBeginDisplayingInSecureLockScreen");
          else
            objc_msgSend(v12, "didEndDisplayingInLockScreen");
          v9 = 1;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);

    if ((v9 & 1) != 0)
    {
      -[IOSBasedChromeViewController handleMoveToOrFromSecureLockscreenUI:](self, "handleMoveToOrFromSecureLockscreenUI:", v3);
      return 1;
    }
  }
  else
  {

  }
  self->_isTransitioningToLockScreen = 0;
  return !v3;
}

- (void)didMoveToOrFromSecureLockScreenUI:(BOOL)a3
{
  self->_isTransitioningToLockScreen = 0;
}

- (void)setNeedsUserActivityUpdate
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController _maps_mapsSceneDelegate](self, "_maps_mapsSceneDelegate"));
  objc_msgSend(v2, "setNeedsUserActivityUpdate");

}

- (void)setSuggestedApplicationState:(int)a3
{
  uint64_t v3;
  void *v5;
  unsigned int v6;
  id v7;

  LODWORD(v3) = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController appCoordinator](self, "appCoordinator"));
  v6 = objc_msgSend(v5, "isRoutePlanningPresented");

  if (v6)
    v3 = 1;
  else
    v3 = v3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
  objc_msgSend(v7, "_setApplicationState:", v3);

}

- (void)presentMapsDebugControllerIfEnabled
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController _maps_mapsSceneDelegate](self, "_maps_mapsSceneDelegate"));
  objc_msgSend(v2, "presentMapsDebugControllerIfEnabled");

}

- (void)debugControllerDidFinish:(id)a3
{
  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (id)allVisibleMapViewsForDebugController:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allVisibleMapViews"));

  return v4;
}

- (id)allVisibleMapViewsButNotCarPlayForDebugController:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allVisibleMapViewsButNotCarPlay"));

  return v4;
}

- (void)debugController:(id)a3 choseTraceAtPath:(id)a4 startNav:(BOOL)a5
{
  id v8;
  id v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  IOSBasedChromeViewController *v15;
  BOOL v16;

  v8 = a3;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100A312FC;
  v13[3] = &unk_1011AC838;
  v16 = a5;
  v14 = a4;
  v15 = self;
  v9 = v14;
  v10 = objc_retainBlock(v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "presentingViewController"));

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "presentingViewController"));
    objc_msgSend(v12, "dismissViewControllerAnimated:completion:", 1, v10);

  }
  else
  {
    ((void (*)(_QWORD *))v10[2])(v10);
  }

}

- (BOOL)locationPulseEnabled
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
  v3 = objc_msgSend(v2, "_isLocationPulseEnabled");

  return v3;
}

- (void)setLocationPulseEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
  objc_msgSend(v4, "_setLocationPulseEnabled:", v3);

}

- (void)select3dMode
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController coordinator](self, "coordinator"));
  objc_msgSend(v2, "select3dMode");

}

- (void)enterLookAroundPIP
{
  -[IOSBasedChromeViewController enterLookAroundPIP:](self, "enterLookAroundPIP:", 0);
}

- (void)enterLookAroundPIP:(id)a3
{
  void *v4;
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
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;

  v33 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController coordinator](self, "coordinator"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "containerViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));

  if (v33)
  {
    objc_msgSend(v33, "bounds");
    objc_msgSend(v6, "convertRect:fromView:", v33);
  }
  else
  {
    objc_msgSend(v6, "frame");
  }
  v11 = v7;
  v12 = v8;
  v13 = v9;
  v14 = v10;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController appCoordinator](self, "appCoordinator"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "baseActionCoordinator"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "currentMapItem"));

  if ((objc_msgSend(v17, "_hasLookAroundStorefront") & 1) == 0)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
    v19 = objc_alloc((Class)MKPlacemark);
    objc_msgSend(v18, "centerCoordinate");
    v20 = objc_msgSend(v19, "initWithCoordinate:");
    v21 = objc_msgSend(objc_alloc((Class)MKMapItem), "initWithPlacemark:", v20);

    v17 = v21;
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController coordinator](self, "coordinator"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "currentLookAroundView"));

  if (v23)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "window"));
    objc_msgSend(v23, "bounds");
    objc_msgSend(v24, "convertRect:fromView:", v23);
    v11 = v25;
    v12 = v26;
    v13 = v27;
    v14 = v28;

  }
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[MKLookAroundEntryPoint entryPointWithMapItem:triggerAction:](MKLookAroundEntryPoint, "entryPointWithMapItem:triggerAction:", v17, 6061));
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 6061, -[IOSBasedChromeViewController currentUITargetForAnalytics](self, "currentUITargetForAnalytics"), 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController coordinator](self, "coordinator"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "containerViewController"));
  objc_msgSend(v31, "setContaineesHidden:", 1);

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController appCoordinator](self, "appCoordinator"));
  objc_msgSend(v32, "enterLookAroundWithEntryPoint:lookAroundView:showsFullScreen:originFrame:", v29, v23, 0, v11, v12, v13, v14);

}

- (void)enterLookAroundForMapItem:(id)a3 lookAroundView:(id)a4
{
  id v6;
  id v7;
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
  id v18;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "window"));
  objc_msgSend(v6, "bounds");
  objc_msgSend(v8, "convertRect:fromView:", v6);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v18 = (id)objc_claimAutoreleasedReturnValue(+[MKLookAroundEntryPoint entryPointWithMapItem:wantsCloseUpView:triggerAction:](MKLookAroundEntryPoint, "entryPointWithMapItem:wantsCloseUpView:triggerAction:", v7, 1, 6060));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController appCoordinator](self, "appCoordinator"));
  objc_msgSend(v17, "enterLookAroundWithEntryPoint:lookAroundView:showsFullScreen:originFrame:", v18, v6, 1, v10, v12, v14, v16);

}

- (void)exitLookAround
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController appCoordinator](self, "appCoordinator"));
  objc_msgSend(v2, "exitLookAround");

}

- (void)selectLookAroundMode
{
  void *v3;
  uint64_t v4;
  char isKindOfClass;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController topContext](self, "topContext"));
  v4 = objc_opt_class(BaseModeController);
  isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  if ((isKindOfClass & 1) != 0)
  {
    -[IOSBasedChromeViewController enterLookAroundPIP](self, "enterLookAroundPIP");
  }
  else
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController lookAroundCoordinator](self, "lookAroundCoordinator"));
    objc_msgSend(v6, "exitLookAround");

  }
}

- (void)openUserProfile
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController appCoordinator](self, "appCoordinator"));
  objc_msgSend(v2, "openUserProfile");

}

- (void)shouldStartRedoSearch
{
  void *v3;
  id v4;

  if (MapsFeature_IsEnabled_SearchAndDiscovery(self))
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController baseModeController](self, "baseModeController"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "actionCoordinator"));
    objc_msgSend(v3, "refreshCurrentSearch");

  }
}

- (id)coordinator
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController topContext](self, "topContext"));
  v3 = objc_opt_class(BaseModeController);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0)
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "actionCoordinator"));
  else
    v4 = 0;

  return v4;
}

- (id)lookAroundCoordinator
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController topContext](self, "topContext"));
  v3 = objc_opt_class(LookAroundModeController);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0)
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "actionCoordinator"));
  else
    v4 = 0;

  return v4;
}

- (id)navActionCoordinator
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController topContext](self, "topContext"));
  v3 = objc_opt_class(NavModeController);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0)
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "actionCoordinator"));
  else
    v4 = 0;

  return v4;
}

- (void)resetForEditingShortcut:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController coordinator](self, "coordinator"));
  -[IOSBasedChromeViewController _teardownViewHierarchyWithActionCoordinator:shouldAnimate:](self, "_teardownViewHierarchyWithActionCoordinator:shouldAnimate:", v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ShortcutEditSession editSessionWithShortcut:](ShortcutEditSession, "editSessionWithShortcut:", v4));

  objc_msgSend(v6, "viewController:editShortcut:", self, v5);
}

- (void)resetForLaunchURLWithOptions:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100A31C10;
  v7[3] = &unk_1011AC8B0;
  v7[4] = self;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController coordinator](self, "coordinator"));
  v8 = v6;
  +[UIViewController _performWithoutDeferringTransitions:](UIViewController, "_performWithoutDeferringTransitions:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", _MKLaunchOptionsPreserveSearchResultsKey));

  LOBYTE(v4) = objc_msgSend(v5, "BOOLValue");
  if ((v4 & 1) == 0)
    objc_msgSend(v6, "endSearch");

}

- (void)resetForTestingAction
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  dispatch_time_t v11;
  dispatch_time_t v12;
  dispatch_time_t v13;
  void *v14;
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD block[5];
  uint8_t buf[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_mapLayer"));

  if (objc_msgSend(v4, "mapType") - 3 <= 1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
    objc_msgSend(v5, "_stopFlyoverAnimation");

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
    objc_msgSend(v6, "_exitARMode");

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
    objc_msgSend(v7, "setMapsIsShowingTour:", 0);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController appCoordinator](self, "appCoordinator"));
    objc_msgSend(v8, "exitFlyover");

    v9 = sub_100431A4C();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "resetForTestingAction exited Flyover", buf, 2u);
    }

  }
  if (-[IOSBasedChromeViewController canExitLookAroundMode](self, "canExitLookAroundMode"))
    -[IOSBasedChromeViewController exitLookAround](self, "exitLookAround");
  v11 = dispatch_time(0, 2000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100A31E3C;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_after(v11, (dispatch_queue_t)&_dispatch_main_q, block);
  v12 = dispatch_time(0, 3000000000);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100A31EE0;
  v16[3] = &unk_1011AC860;
  v16[4] = self;
  dispatch_after(v12, (dispatch_queue_t)&_dispatch_main_q, v16);

  v13 = dispatch_time(0, 4000000000);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100A31F20;
  v15[3] = &unk_1011AC860;
  v15[4] = self;
  dispatch_after(v13, (dispatch_queue_t)&_dispatch_main_q, v15);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v14, "postNotificationName:object:", CFSTR("ResetForTestingActionNotification"), 0);

}

- (void)_teardownViewHierarchyForTesting
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  _QWORD v10[5];
  uint8_t buf[16];

  v3 = sub_100431A4C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "_teardownViewHierarchyForTesting started", buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
  v6 = objc_msgSend(v5, "currentInterruptionKind");

  if (v6 != (id)5)
    -[IOSBasedChromeViewController dismissAllModalViewsIfPresentAnimated:completion:](self, "dismissAllModalViewsIfPresentAnimated:completion:", 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIPrintInteractionController sharedPrintController](UIPrintInteractionController, "sharedPrintController"));
  objc_msgSend(v7, "dismissAnimated:", 0);

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100A32144;
  v10[3] = &unk_1011AC860;
  v10[4] = self;
  -[ChromeViewController popToRootContextAnimated:completion:](self, "popToRootContextAnimated:completion:", 0, v10);
  -[IOSBasedChromeViewController updateThemeViewAndControllers](self, "updateThemeViewAndControllers");
  v8 = sub_100431A4C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "_teardownViewHierarchyForTesting completed", buf, 2u);
  }

}

- (void)_teardownViewHierarchyWithActionCoordinator:(id)a3 shouldAnimate:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
  v8 = objc_msgSend(v7, "currentInterruptionKind");

  if (v8 != (id)5)
    -[IOSBasedChromeViewController dismissAllModalViewsIfPresentAnimated:completion:](self, "dismissAllModalViewsIfPresentAnimated:completion:", v4, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIPrintInteractionController sharedPrintController](UIPrintInteractionController, "sharedPrintController"));
  objc_msgSend(v9, "dismissAnimated:", v4);

  -[ChromeViewController popToRootContextAnimated:completion:](self, "popToRootContextAnimated:completion:", v4, 0);
  objc_msgSend(v6, "viewControllerPresentSearchEndEditingAnimated:", v4);
  objc_msgSend(v6, "viewControllerClosed:animated:", 0, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "searchPinsManager"));

  objc_msgSend(v10, "clearLinkedPlacesAndPolygon");
  -[IOSBasedChromeViewController updateThemeViewAndControllers](self, "updateThemeViewAndControllers");
}

- (void)cleanUIandHideSearch
{
  id v3;

  -[IOSBasedChromeViewController resetForLaunchURLWithOptions:](self, "resetForLaunchURLWithOptions:", 0);
  v3 = (id)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController coordinator](self, "coordinator"));
  objc_msgSend(v3, "viewControllerClosed:animated:", 0, 0);

}

- (BOOL)displayNavigationAlertAndShouldContinue
{
  void *v3;
  unsigned __int8 v4;
  id v5;
  void *v6;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  v8 = 0;
  v4 = objc_msgSend(v3, "isLocationServicesPossiblyAvailable:", &v8);
  v5 = v8;

  if ((v4 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
    objc_msgSend(v6, "setShowsUserLocation:", 1);
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
    objc_msgSend(v6, "showLocationServicesAlertWithError:", v5);
  }

  return v4;
}

- (void)searchForSearchItem:(id)a3 traits:(id)a4 source:(int)a5
{
  uint64_t v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;

  v5 = *(_QWORD *)&a5;
  v8 = a3;
  v9 = a4;
  v17 = CFSTR("GEOMapServiceTraits_Source");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v5));
  v18 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));

  if (v9)
  {
    v12 = objc_msgSend(v11, "mutableCopy");
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v9, CFSTR("GEOMapServiceTraits"));

    v11 = v12;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController coordinator](self, "coordinator"));

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController coordinator](self, "coordinator"));
LABEL_7:
    v16 = v14;
    objc_msgSend(v14, "viewController:doSearchItem:withUserInfo:", self, v8, v11);

    goto LABEL_8;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController navActionCoordinator](self, "navActionCoordinator"));

  if (v15)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController navActionCoordinator](self, "navActionCoordinator"));
    goto LABEL_7;
  }
LABEL_8:

}

- (void)searchForAddress:(id)a3 source:(int)a4
{
  uint64_t v4;
  id v6;
  SearchFieldItem *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v7 = objc_alloc_init(SearchFieldItem);
  -[SearchFieldItem setAddress:](v7, "setAddress:", v6);

  v11 = CFSTR("GEOMapServiceTraits_Source");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v4));
  v12 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController coordinator](self, "coordinator"));
  objc_msgSend(v10, "viewController:doSearchItem:withUserInfo:", self, v7, v9);

}

- (void)searchForAddressString:(id)a3 source:(int)a4
{
  uint64_t v4;
  id v6;
  SearchFieldItem *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v7 = objc_alloc_init(SearchFieldItem);
  -[SearchFieldItem setAddressString:](v7, "setAddressString:", v6);

  v11 = CFSTR("GEOMapServiceTraits_Source");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v4));
  v12 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController coordinator](self, "coordinator"));
  objc_msgSend(v10, "viewController:doSearchItem:withUserInfo:", self, v7, v9);

}

- (void)searchForRouteFromAddress:(id)a3 toAddress:(id)a4 directionsMode:(unint64_t)a5 userInfo:(id)a6
{
  id v10;
  id v11;
  id v12;
  SearchFieldItem *v13;
  void *v14;
  SearchFieldItem *v15;
  uint64_t v16;
  DirectionItem *v17;
  void *v18;
  DirectionItem *v19;
  void *v20;
  _QWORD v21[2];

  v10 = a3;
  v11 = a6;
  v12 = a4;
  v13 = objc_alloc_init(SearchFieldItem);
  if (objc_msgSend(v10, "length"))
  {
    -[SearchFieldItem setSearchString:](v13, "setSearchString:", v10);
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[SearchResult currentLocationSearchResult](SearchResult, "currentLocationSearchResult"));
    -[SearchFieldItem setSearchResult:](v13, "setSearchResult:", v14);

  }
  v15 = objc_alloc_init(SearchFieldItem);
  -[SearchFieldItem setSearchString:](v15, "setSearchString:", v12);

  if (a5 - 1 > 7)
    v16 = 0;
  else
    v16 = qword_100E3CFE8[a5 - 1];
  v17 = [DirectionItem alloc];
  v21[0] = v13;
  v21[1] = v15;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v21, 2));
  v19 = -[DirectionItem initWithItems:transportType:](v17, "initWithItems:transportType:", v18, v16);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController coordinator](self, "coordinator"));
  objc_msgSend(v20, "viewController:doDirectionItem:withUserInfo:", self, v19, v11);

}

- (void)searchForExternalURLQuery:(id)a3 coordinate:(CLLocationCoordinate2D)a4 muid:(unint64_t)a5 resultProviderId:(int)a6 contentProvider:(id)a7
{
  uint64_t v7;
  double longitude;
  double latitude;
  id v13;
  id v14;
  ExternalURLQuery *v15;
  void *v16;
  SearchFieldItem *v17;

  v7 = *(_QWORD *)&a6;
  longitude = a4.longitude;
  latitude = a4.latitude;
  v13 = a7;
  v14 = a3;
  v17 = objc_alloc_init(SearchFieldItem);
  v15 = -[ExternalURLQuery initWithQuery:coordinate:muid:resultProviderId:contentProvider:]([ExternalURLQuery alloc], "initWithQuery:coordinate:muid:resultProviderId:contentProvider:", v14, a5, v7, v13, latitude, longitude);

  -[SearchFieldItem setExternalURLQuery:](v17, "setExternalURLQuery:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController coordinator](self, "coordinator"));
  objc_msgSend(v16, "viewController:doSearchItem:withUserInfo:", self, v17, &off_101274930);

}

- (void)searchForString:(id)a3 traits:(id)a4 scrollToResults:(BOOL)a5 source:(int)a6
{
  uint64_t v6;
  id v9;
  id v10;
  SearchFieldItem *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];
  _QWORD v16[2];

  v6 = *(_QWORD *)&a6;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(SearchFieldItem);
  -[SearchFieldItem setSearchString:](v11, "setSearchString:", v10);

  if (!v9)
    v9 = (id)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController currentTraits](self, "currentTraits"));
  v15[0] = CFSTR("GEOMapServiceTraits_Source");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v6));
  v15[1] = CFSTR("GEOMapServiceTraits");
  v16[0] = v12;
  v16[1] = v9;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v16, v15, 2));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController coordinator](self, "coordinator"));
  objc_msgSend(v14, "viewController:doSearchItem:withUserInfo:", self, v11, v13);

}

- (void)searchWithSearchInfo:(id)a3 source:(int)a4
{
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "isSearchAlongRoute"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController navActionCoordinator](self, "navActionCoordinator"));
    objc_msgSend(v5, "setCurrentSearchInfo:", v6);

  }
}

- (void)routeFromSearchResult:(id)a3 toSearchResult:(id)a4 directionsType:(unint64_t)a5 drivePreferences:(id)a6 routeHandle:(id)a7 timePoint:(id)a8 withFeedback:(id)a9 origin:(int64_t)a10 options:(id)a11
{
  id v15;
  id v16;
  id v17;
  SearchFieldItem *v18;
  SearchFieldItem *v19;
  DirectionItem *v20;
  void *v21;
  DirectionItem *v22;
  void *v23;
  _QWORD v24[2];

  v15 = a11;
  v16 = a4;
  v17 = a3;
  v18 = objc_alloc_init(SearchFieldItem);
  -[SearchFieldItem setSearchResult:](v18, "setSearchResult:", v17);

  v19 = objc_alloc_init(SearchFieldItem);
  -[SearchFieldItem setSearchResult:](v19, "setSearchResult:", v16);

  v20 = [DirectionItem alloc];
  v24[0] = v18;
  v24[1] = v19;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v24, 2));
  switch(a5)
  {
    case 1uLL:
      break;
    case 2uLL:
      a5 = 2;
      break;
    case 4uLL:
      a5 = 3;
      break;
    case 8uLL:
      a5 = 5;
      break;
    default:
      a5 = 0;
      break;
  }
  v22 = -[DirectionItem initWithItems:transportType:](v20, "initWithItems:transportType:", v21, a5);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController coordinator](self, "coordinator"));
  objc_msgSend(v23, "viewController:doDirectionItem:withUserInfo:", self, v22, v15);

}

- (void)directionsTypeForMapItem:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double latitude;
  double v12;
  double longitude;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  _QWORD v21[4];
  id v22;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
    if ((objc_msgSend(v8, "hasLocation") & 1) != 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastLocation"));
      objc_msgSend(v9, "coordinate");
      latitude = v10;
      longitude = v12;

    }
    else
    {
      latitude = kCLLocationCoordinate2DInvalid.latitude;
      longitude = kCLLocationCoordinate2DInvalid.longitude;
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "placemark"));
    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "placemark"));
      objc_msgSend(v15, "coordinate");
      v17 = v16;
      v19 = v18;

    }
    else
    {
      v17 = kCLLocationCoordinate2DInvalid.latitude;
      v19 = kCLLocationCoordinate2DInvalid.longitude;
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController defaultTransportTypeFinder](self, "defaultTransportTypeFinder"));
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100A32E3C;
    v21[3] = &unk_1011BB4D8;
    v22 = v7;
    objc_msgSend(v20, "mkDirectionsTypeForOrigin:destination:ignoreMapType:completion:", 1, v21, latitude, longitude, v17, v19);

  }
}

- (id)baseModeController
{
  void *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController contexts](self, "contexts", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        v7 = objc_opt_class(BaseModeController);
        if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
        {
          v3 = v6;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)createCustomSearchResultForDroppedPinAtPoint:(CLLocationCoordinate2D)a3 floorOrdinal:(int)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v6;
  double longitude;
  double latitude;
  id v9;

  v5 = a5;
  v6 = *(_QWORD *)&a4;
  longitude = a3.longitude;
  latitude = a3.latitude;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController baseModeController](self, "baseModeController"));
  objc_msgSend(v9, "createCustomSearchResultForDroppedPinAtPoint:floorOrdinal:animated:", v6, v5, latitude, longitude);

}

- (void)createCustomSearchResultForDroppedPinAtCenterPoint
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController baseModeController](self, "baseModeController"));
  objc_msgSend(v2, "createCustomSearchResultForDroppedPinAtCenterPoint");

}

- (BOOL)canDropPin
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController baseModeController](self, "baseModeController"));
  v3 = objc_msgSend(v2, "canDropPin");

  return v3;
}

- (void)displayNearbySearch
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController coordinator](self, "coordinator"));
  objc_msgSend(v3, "viewControllerOpenNearby:animated:", self, 0);

}

- (void)displayNavShareETA
{
  void *v3;
  uint64_t v4;
  char isKindOfClass;
  uint64_t v6;
  void *v7;
  unsigned int v8;
  void *v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController currentIOSBasedContext](self, "currentIOSBasedContext"));
  v4 = objc_opt_class(NavModeController);
  isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  if ((isKindOfClass & 1) != 0)
  {
    v10 = (id)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController currentIOSBasedContext](self, "currentIOSBasedContext"));
    if (MSPSharedTripSharingAvailable(v10, v6))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "route"));
      v8 = objc_msgSend(v7, "transportType");

      if (!v8)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "navActionCoordinator"));
        objc_msgSend(v9, "senderShareNavigation:", self);

      }
    }

  }
}

- (SettingsController)settingsController
{
  SettingsController *settingsController;
  SettingsController *v4;
  SettingsController *v5;

  settingsController = self->_settingsController;
  if (!settingsController)
  {
    v4 = objc_alloc_init(SettingsController);
    v5 = self->_settingsController;
    self->_settingsController = v4;

    -[SettingsController setChrome:](self->_settingsController, "setChrome:", self);
    settingsController = self->_settingsController;
  }
  return settingsController;
}

- (void)selectParkedCarAndPerformAction:(int64_t)a3
{
  void *v5;
  _QWORD v6[6];

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ParkedCarManager sharedManager](ParkedCarManager, "sharedManager"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100A331F8;
  v6[3] = &unk_1011E0158;
  v6[4] = self;
  v6[5] = a3;
  objc_msgSend(v5, "fetchParkedCar:", v6);

}

- (void)showTransitLine:(unint64_t)a3 withName:(id)a4
{
  id v6;
  id v7;
  IncompleteTransitLineItem *v8;
  void *v9;
  id v10;

  v10 = a4;
  v6 = objc_alloc((Class)MKMapItemIdentifier);
  v7 = objc_msgSend(v6, "initWithMUID:resultProviderID:coordinate:", a3, 0, MKCoordinateInvalid[0], MKCoordinateInvalid[1]);
  if (v7)
  {
    v8 = -[IncompleteTransitLineItem initWithIdentifier:name:]([IncompleteTransitLineItem alloc], "initWithIdentifier:name:", v7, v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController coordinator](self, "coordinator"));
    objc_msgSend(v9, "viewController:selectTransitLineItem:zoomToMapRegion:", self, v8, 1);

  }
}

- (void)showFavoritesType:(int64_t)a3
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController coordinator](self, "coordinator"));
  objc_msgSend(v5, "viewController:showFavoritesType:", self, a3);

}

- (void)showAnnouncementForFlyover:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController coordinator](self, "coordinator"));
  objc_msgSend(v5, "showAnnouncementForFlyover:", v4);

}

- (void)reportCurrentLocationFailure
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController interruptionManager](self, "interruptionManager"));
  objc_msgSend(v2, "reportCurrentLocationFailure");

}

- (int)currentUITargetForAnalytics
{
  void *v3;
  void *v4;
  id v5;
  int v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController topContext](self, "topContext"));
  if ((objc_opt_respondsToSelector(v3, "fullscreenViewController") & 1) != 0)
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fullscreenViewController"));
  else
    v4 = 0;
  if (sub_1007F7BE8((uint64_t)v4, (Protocol *)&OBJC_PROTOCOL___GEOLogContextDelegate))
  {
    v5 = v4;
    if ((objc_opt_respondsToSelector(v5, "currentUITargetForAnalytics") & 1) != 0)
    {
      v6 = objc_msgSend(v5, "currentUITargetForAnalytics");
      goto LABEL_14;
    }

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController cardsOverlay](self, "cardsOverlay"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentViewController"));

  if (sub_1007F7BE8((uint64_t)v5, (Protocol *)&OBJC_PROTOCOL___GEOLogContextDelegate))
  {
    v5 = v5;
    if ((objc_opt_respondsToSelector(v5, "currentUITargetForAnalytics") & 1) != 0)
      v6 = objc_msgSend(v5, "currentUITargetForAnalytics");
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }
LABEL_14:

  return v6;
}

- (int)currentMapViewTargetForAnalytics
{
  void *v3;
  void *v4;
  id v5;
  int v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController topContext](self, "topContext"));
  if ((objc_opt_respondsToSelector(v3, "fullscreenViewController") & 1) != 0)
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fullscreenViewController"));
  else
    v4 = 0;
  if (sub_1007F7BE8((uint64_t)v4, (Protocol *)&OBJC_PROTOCOL___GEOLogContextDelegate))
  {
    v5 = v4;
    if ((objc_opt_respondsToSelector(v5, "currentMapViewTargetForAnalytics") & 1) != 0)
    {
      v6 = objc_msgSend(v5, "currentMapViewTargetForAnalytics");
      goto LABEL_14;
    }

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController cardsOverlay](self, "cardsOverlay"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentViewController"));

  if (sub_1007F7BE8((uint64_t)v5, (Protocol *)&OBJC_PROTOCOL___GEOLogContextDelegate))
  {
    v5 = v5;
    if ((objc_opt_respondsToSelector(v5, "currentMapViewTargetForAnalytics") & 1) != 0)
      v6 = objc_msgSend(v5, "currentMapViewTargetForAnalytics");
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }
LABEL_14:

  return v6;
}

- (DefaultTransportTypeFinder)defaultTransportTypeFinder
{
  DefaultTransportTypeFinder *defaultTransportTypeFinder;
  DefaultTransportTypeFinder *v4;
  DefaultTransportTypeFinder *v5;

  defaultTransportTypeFinder = self->_defaultTransportTypeFinder;
  if (!defaultTransportTypeFinder)
  {
    v4 = -[DefaultTransportTypeFinder initWithMapTypeSource:]([DefaultTransportTypeFinder alloc], "initWithMapTypeSource:", self);
    v5 = self->_defaultTransportTypeFinder;
    self->_defaultTransportTypeFinder = v4;

    defaultTransportTypeFinder = self->_defaultTransportTypeFinder;
  }
  return defaultTransportTypeFinder;
}

- (int)displayedMapType
{
  unint64_t v2;

  v2 = self->_displayedViewMode + 1;
  if (v2 > 7)
    return 1;
  else
    return dword_100E3D028[v2];
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  void *v11;
  uint64_t v12;
  unsigned __int8 isKindOfClass;
  char v14;
  unsigned __int8 v15;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  objc_super v22;

  v6 = a4;
  if ("find:" == a3 || "defaultZoom" == a3 || "zoomIn" == a3 || "zoomOut" == a3 || "centerMapToUserLocation" == a3)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController topContext](self, "topContext"));
    v12 = objc_opt_class(BaseModeController);
    isKindOfClass = objc_opt_isKindOfClass(v11, v12);
  }
  else
  {
    if ("snapToNorth" == a3)
    {
      v15 = -[IOSBasedChromeViewController canSnapToNorth](self, "canSnapToNorth");
      goto LABEL_29;
    }
    if ("createCustomSearchResultForDroppedPinAtCenterPoint" == a3)
    {
      v15 = -[IOSBasedChromeViewController canDropPin](self, "canDropPin");
      goto LABEL_29;
    }
    if ("select3dMode" == a3)
    {
      v15 = -[IOSBasedChromeViewController canEnter3dMode](self, "canEnter3dMode");
      goto LABEL_29;
    }
    if ("selectLookAroundMode" == a3)
    {
      if (-[IOSBasedChromeViewController canEnterLookAroundMode](self, "canEnterLookAroundMode")
        || -[IOSBasedChromeViewController canExitLookAroundMode](self, "canExitLookAroundMode"))
      {
        v14 = 1;
        goto LABEL_30;
      }
      v15 = -[IOSBasedChromeViewController _canShowLookAroundButton](self, "_canShowLookAroundButton");
      goto LABEL_29;
    }
    if ("toggleLabels" == a3)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController settingsController](self, "settingsController"));
      isKindOfClass = objc_msgSend(v11, "canToggleLabels");
    }
    else
    {
      if ("openUserProfile" == a3)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController appCoordinator](self, "appCoordinator"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "baseActionCoordinator"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "currentViewController"));

        if (sub_1002A8AA0(self) == 5
          || (v19 = objc_opt_class(SearchViewController), (objc_opt_isKindOfClass(v11, v19) & 1) == 0))
        {
          if (sub_1002A8AA0(self) == 5)
          {
            v20 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController topContext](self, "topContext"));
            v21 = objc_opt_class(BaseModeController);
            v14 = objc_opt_isKindOfClass(v20, v21);

          }
          else
          {
            v14 = 0;
          }
        }
        else
        {
          v14 = 1;
        }
        goto LABEL_17;
      }
      if ("toggleTraffic" != a3)
      {
        v22.receiver = self;
        v22.super_class = (Class)IOSBasedChromeViewController;
        v15 = -[IOSBasedChromeViewController canPerformAction:withSender:](&v22, "canPerformAction:withSender:", a3, v6);
LABEL_29:
        v14 = v15;
        goto LABEL_30;
      }
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController settingsController](self, "settingsController"));
      isKindOfClass = objc_msgSend(v11, "canToggleTraffic");
    }
  }
  v14 = isKindOfClass;
LABEL_17:

LABEL_30:
  return v14 & 1;
}

- (void)validateCommand:(id)a3
{
  BOOL v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;

  v15 = a3;
  if (objc_msgSend(v15, "action") == "snapToNorth")
  {
    objc_msgSend(v15, "setState:", -[IOSBasedChromeViewController isSnappedToNorth](self, "isSnappedToNorth"));
LABEL_21:
    v5 = v15;
    goto LABEL_22;
  }
  if (objc_msgSend(v15, "action") == "switchMapMode:")
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "propertyList"));
    v11 = objc_msgSend(v10, "integerValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController settingsController](self, "settingsController"));
    objc_msgSend(v15, "setState:", objc_msgSend(v12, "selectedViewMode") == v11);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController topContext](self, "topContext"));
    v14 = objc_opt_class(BaseModeController);
    LOBYTE(v11) = objc_opt_isKindOfClass(v13, v14);

    if ((v11 & 1) == 0)
      objc_msgSend(v15, "setAttributes:", 1);

    goto LABEL_21;
  }
  if (objc_msgSend(v15, "action") == "removeDroppedPin"
    && !-[IOSBasedChromeViewController canRemovePin](self, "canRemovePin"))
  {
    objc_msgSend(v15, "setAttributes:", 4);
    goto LABEL_21;
  }
  if (objc_msgSend(v15, "action") == "select3dMode")
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController coordinator](self, "coordinator"));
    v9 = objc_msgSend(v8, "is3dModeSelected");
    goto LABEL_20;
  }
  if (objc_msgSend(v15, "action") == "selectLookAroundMode")
  {
    objc_msgSend(v15, "_maps_setUseDisableFeatureTitle:", -[IOSBasedChromeViewController canExitLookAroundMode](self, "canExitLookAroundMode"));
    goto LABEL_21;
  }
  if (objc_msgSend(v15, "action") == "toggleLabels")
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController settingsController](self, "settingsController"));
    v9 = objc_msgSend(v8, "showsLabels");
    goto LABEL_20;
  }
  v4 = objc_msgSend(v15, "action") == "toggleTraffic";
  v5 = v15;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController settingsController](self, "settingsController"));
    v7 = objc_msgSend(v6, "showsTraffic");

    v5 = v15;
    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController settingsController](self, "settingsController"));
      v9 = objc_msgSend(v8, "showsTraffic");
LABEL_20:
      objc_msgSend(v15, "_maps_setUseDisableFeatureTitle:", v9);

      goto LABEL_21;
    }
  }
LABEL_22:

}

- (BOOL)canEnter3dMode
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  uint64_t v9;
  char isKindOfClass;
  uint64_t v11;
  unsigned __int8 v12;
  char v13;
  char v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_mapLayer"));

  v5 = objc_msgSend(v4, "mapType");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
  v7 = objc_msgSend(v6, "_canEnter3DMode");

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController topContext](self, "topContext"));
  v9 = objc_opt_class(BaseModeController);
  isKindOfClass = objc_opt_isKindOfClass(v8, v9);

  if (v5 == 1)
  {
    v11 = 3;
    goto LABEL_5;
  }
  if (v5 == 2)
  {
    v11 = 4;
LABEL_5:
    v12 = objc_msgSend(v4, "supportsMapType:", v11);
    goto LABEL_7;
  }
  v12 = 0;
LABEL_7:
  if (v5 - 3 < 2)
    v13 = 1;
  else
    v13 = v12;
  if (v7 & 1 | ((isKindOfClass & 1) == 0))
    v14 = isKindOfClass;
  else
    v14 = v13;

  return v14 & 1;
}

- (BOOL)canEnterLookAroundMode
{
  void *v3;
  uint64_t v4;
  void *v5;
  BOOL v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController topContext](self, "topContext"));
  v4 = objc_opt_class(BaseModeController);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
    v6 = objc_msgSend(v5, "_lookAroundAvailability") == (id)2;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)canExitLookAroundMode
{
  void *v2;
  uint64_t v3;
  char isKindOfClass;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController topContext](self, "topContext"));
  v3 = objc_opt_class(LookAroundModeController);
  isKindOfClass = objc_opt_isKindOfClass(v2, v3);

  return isKindOfClass & 1;
}

- (BOOL)_canShowLookAroundButton
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager"));
  v4 = objc_msgSend(v3, "isMuninEnabled");

  if (v4)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController contexts](self, "contexts", 0));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "reverseObjectEnumerator"));

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v15;
LABEL_4:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v11);
        if ((objc_opt_respondsToSelector(v12, "permitsLookAroundShowing") & 1) != 0
          && !objc_msgSend(v12, "permitsLookAroundShowing"))
        {
          break;
        }
        if ((objc_opt_respondsToSelector(v12, "wantsLookAroundShowing") & 1) != 0)
          v9 |= objc_msgSend(v12, "wantsLookAroundShowing");
        if (v8 == (id)++v11)
        {
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
          if (v8)
            goto LABEL_4;
          goto LABEL_16;
        }
      }
    }
    LOBYTE(v9) = 0;
LABEL_16:

  }
  else
  {
    LOBYTE(v9) = 0;
  }
  return v9 & 1;
}

- (BOOL)_shouldCollapseLookoaroundPreview
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  BOOL v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController coordinator](self, "coordinator"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "containerViewController"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cardPresentationController"));

  v6 = (unint64_t)objc_msgSend(v5, "containerStyle");
  v7 = (v6 >= 8 || ((0xE3u >> v6) & 1) == 0) && objc_msgSend(v5, "containeeLayout") == (id)1;

  return v7;
}

- (id)_lookAroundButtonMapItem
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController topContext](self, "topContext"));
  if (-[IOSBasedChromeViewController _shouldCollapseLookoaroundPreview](self, "_shouldCollapseLookoaroundPreview")
    || (objc_opt_respondsToSelector(v3, "mapItemForLookAroundButton") & 1) == 0)
  {
    v4 = 0;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mapItemForLookAroundButton"));
  }

  return v4;
}

- (void)toggleLabels
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController settingsController](self, "settingsController"));
  objc_msgSend(v2, "toggleLabels");

}

- (void)toggleTraffic
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController settingsController](self, "settingsController"));
  objc_msgSend(v2, "toggleTraffic");

}

- (void)switchMapMode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "propertyList"));
  v4 = objc_msgSend(v7, "integerValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController coordinator](self, "coordinator"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "settingsController"));
  objc_msgSend(v6, "setSelectedViewMode:animated:", v4, 1);

}

- (BOOL)canSnapToNorth
{
  void *v3;
  uint64_t v4;
  char isKindOfClass;
  void *v6;
  uint64_t v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController topContext](self, "topContext"));
  v4 = objc_opt_class(BaseModeController);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    isKindOfClass = 1;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController topContext](self, "topContext"));
    v7 = objc_opt_class(LookAroundModeController);
    isKindOfClass = objc_opt_isKindOfClass(v6, v7);

  }
  return isKindOfClass & 1;
}

- (BOOL)isSnappedToNorth
{
  void *v3;
  uint64_t v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController topContext](self, "topContext"));
  v4 = objc_opt_class(LookAroundModeController);
  isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  if ((isKindOfClass & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController lookAroundCoordinator](self, "lookAroundCoordinator"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dataCoordinator"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lookAroundView"));
    objc_msgSend(v8, "presentationYaw");
    v10 = v9;

  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
    objc_msgSend(v6, "presentationYaw");
    v10 = v11;
  }

  return fabs(v10) < 0.0001;
}

- (void)snapToNorth
{
  void *v3;
  uint64_t v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController topContext](self, "topContext"));
  v4 = objc_opt_class(LookAroundModeController);
  isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  if ((isKindOfClass & 1) != 0)
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController lookAroundCoordinator](self, "lookAroundCoordinator"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dataCoordinator"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lookAroundView"));
    objc_msgSend(v7, "snapToNorth:", self);

  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
    objc_msgSend(v8, "_stopFlyoverAnimation");

    v9 = (id)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
    objc_msgSend(v9, "snapToNorth:", self);
  }

}

- (void)defaultZoom
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController coordinator](self, "coordinator"));
  objc_msgSend(v2, "defaultZoom");

}

- (void)zoomIn
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController coordinator](self, "coordinator"));
  objc_msgSend(v2, "zoomIn");

}

- (void)zoomOut
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController coordinator](self, "coordinator"));
  objc_msgSend(v2, "zoomOut");

}

- (void)centerMapToUserLocation
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
  objc_msgSend(v3, "_stopFlyoverAnimation");

  v4 = (id)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
  objc_msgSend(v4, "setUserTrackingMode:animated:", 1, 1);

}

- (BOOL)canRemovePin
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController baseModeController](self, "baseModeController"));
  v3 = objc_msgSend(v2, "hasDroppedPin");

  return v3;
}

- (void)removeDroppedPin
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController baseModeController](self, "baseModeController"));
  objc_msgSend(v2, "removeDroppedPin");

}

- (void)find:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController coordinator](self, "coordinator", a3));
  objc_msgSend(v3, "viewControllerPresentSearchEditing");

}

- (void)printCurrentState
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController _maps_platformController](self, "_maps_platformController"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentSession"));

  v4 = objc_opt_class(RoutePlanningSession);
  if ((objc_opt_isKindOfClass(v9, v4) & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "currentRouteCollection"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentRoute"));
    -[IOSBasedChromeViewController printRoute:](self, "printRoute:", v6);

  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController appCoordinator](self, "appCoordinator"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "baseActionCoordinator"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentSearchSession"));

    -[IOSBasedChromeViewController printSearchResultFromSession:](self, "printSearchResultFromSession:", v5);
  }

}

- (void)_initializePrintingController
{
  PrintController *v3;
  PrintController *v4;
  PrintController *printController;
  id v6;

  if (!self->_printController)
  {
    v3 = [PrintController alloc];
    v6 = (id)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
    v4 = -[PrintController initWithMapView:delegate:](v3, "initWithMapView:delegate:", v6, self);
    printController = self->_printController;
    self->_printController = v4;

  }
}

- (void)printRoute:(id)a3
{
  id v4;
  PrintController *printController;
  void *v6;
  id v7;

  v4 = a3;
  -[IOSBasedChromeViewController _initializePrintingController](self, "_initializePrintingController");
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 17052, 0, 0);
  printController = self->_printController;
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "destination"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
  -[PrintController printRoute:searchString:](printController, "printRoute:searchString:", v4, v6);

}

- (void)printSearchResultFromSession:(id)a3
{
  id v4;
  PrintController *printController;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[IOSBasedChromeViewController _initializePrintingController](self, "_initializePrintingController");
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 17052, 0, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "searchFieldItem"));
  printController = self->_printController;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "searchString"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentResults"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "printedPageTitle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "printedPageSubtitle"));

  -[PrintController printSearchString:searchResults:title:subTitle:](printController, "printSearchString:searchResults:title:subTitle:", v6, v7, v8, v9);
}

- (CGRect)popoverPresentationRectForPrintController:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = 0.0;
  v4 = 0.0;
  v5 = 1.0;
  v6 = 1.0;
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)chromeNavigationDisplayDidRenderRoute:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IOSBasedChromeViewController;
  -[ChromeViewController chromeNavigationDisplayDidRenderRoute:](&v5, "chromeNavigationDisplayDidRenderRoute:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v4, "captureUserAction:onTarget:eventValue:", 3072, -[IOSBasedChromeViewController currentUITargetForAnalytics](self, "currentUITargetForAnalytics"), 0);

}

- (void)incrementForToken:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  objc_super v14;
  uint8_t buf[4];
  id v16;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)IOSBasedChromeViewController;
  -[ChromeViewController incrementForToken:](&v14, "incrementForToken:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tokenGroupName"));
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("IOSBasedChromeMetros"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("reason")));

    v9 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v8, v9) & 1) == 0)
    {
      v10 = sub_10043196C();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v16 = v4;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Invalid modern map token: %@", buf, 0xCu);
      }

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v12, "postNotificationName:object:", CFSTR("ChromeViewControllerDidUpdateShouldUseModernMap"), self);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
    if (v13)
      -[IOSBasedChromeViewController _updateModernMapCartographicConfiguration](self, "_updateModernMapCartographicConfiguration");

  }
}

- (void)decrementForToken:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  objc_super v11;
  uint8_t buf[4];
  id v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tokenGroupName"));
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("IOSBasedChromeMetros"));

  if (v6)
  {
    v7 = sub_10043196C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Releasing modern map token: %@", buf, 0xCu);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v9, "postNotificationName:object:", CFSTR("ChromeViewControllerDidUpdateShouldUseModernMap"), self);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
    if (v10)
      -[IOSBasedChromeViewController _updateModernMapCartographicConfiguration](self, "_updateModernMapCartographicConfiguration");
  }
  v11.receiver = self;
  v11.super_class = (Class)IOSBasedChromeViewController;
  -[ChromeViewController decrementForToken:](&v11, "decrementForToken:", v4);

}

- (BOOL)shouldUseModernMap
{
  return -[MapsTokenStorage count](self->_modernMapTokens, "count") != 0;
}

- (int64_t)modernMapTerrainMode
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  unsigned int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MapsTokenStorage tokens](self->_modernMapTokens, "tokens", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v14;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v2);
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v6), "userInfo"));
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("reason")));

        v9 = objc_msgSend(v8, "unsignedIntegerValue");
        if (v9)
        {

          return 0;
        }
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v4)
        continue;
      break;
    }
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v11 = objc_msgSend(v10, "BOOLForKey:", CFSTR("__internal_MapsDebugEnableTerrainMetros"));

  if (v11)
    return 1;
  else
    return 2;
}

- (int64_t)modernMapProjectionType
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  int64_t v6;
  void *i;
  void *v8;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MapsTokenStorage tokens](self->_modernMapTokens, "tokens", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    v6 = 1;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i), "userInfo"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("reason")));

        v10 = objc_msgSend(v9, "unsignedIntegerValue");
        if (v10)
        {
          v6 = 0;
          goto LABEL_12;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v4)
        continue;
      break;
    }
  }
  else
  {
    v6 = 1;
  }
LABEL_12:

  return v6;
}

- (void)_updateModernMapCartographicConfiguration
{
  unsigned __int8 v3;
  void *v4;
  void *v5;
  int64_t v6;
  id v7;
  NSObject *v8;
  void *v9;
  _OWORD v10[3];
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  uint64_t v23;

  v3 = -[IOSBasedChromeViewController shouldUseModernMap](self, "shouldUseModernMap");
  v19 = 0;
  v17 = 0u;
  v18 = 0u;
  v16 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "_cartographicConfiguration");
  }
  else
  {
    v19 = 0;
    v17 = 0u;
    v18 = 0u;
    v16 = 0u;
  }

  if ((v3 & 1) != 0)
  {
    *((_QWORD *)&v17 + 1) = -[IOSBasedChromeViewController modernMapTerrainMode](self, "modernMapTerrainMode");
    v6 = -[IOSBasedChromeViewController modernMapProjectionType](self, "modernMapProjectionType");
  }
  else
  {
    v6 = 1;
    *((_QWORD *)&v17 + 1) = 1;
  }
  *(_QWORD *)&v17 = v6;
  v7 = sub_10043196C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v21 = *((_QWORD *)&v17 + 1);
    v22 = 2048;
    v23 = v17;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "_updateModernMapCartographicConfiguration with terrainMode: %ld projectionType: %ld", buf, 0x16u);
  }

  v12 = v16;
  v13 = v17;
  v14 = v18;
  v15 = v19;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
  v10[0] = v12;
  v10[1] = v13;
  v10[2] = v14;
  v11 = v15;
  objc_msgSend(v9, "_setCartographicConfiguration:", v10);

}

- (id)acquireModernMapTokenForReason:(unint64_t)a3
{
  MapsTokenStorage *modernMapTokens;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  void *v9;

  modernMapTokens = self->_modernMapTokens;
  v8 = CFSTR("reason");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  v9 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsTokenStorage tokenWithUserInfo:](modernMapTokens, "tokenWithUserInfo:", v5));

  return v6;
}

- (void)dismissAllModalViewsIfPresentAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  void (**v6)(_QWORD);
  id v7;
  NSObject *v8;
  __CFString *v9;
  __CFString *v10;
  uint64_t v11;
  __CFString *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  int v17;
  IOSBasedChromeViewController *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  __CFString *v22;

  v4 = a3;
  v6 = (void (**)(_QWORD))a4;
  v7 = sub_10043196C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = CFSTR("NO");
    if (v4)
      v9 = CFSTR("YES");
    v10 = v9;
    v17 = 138412802;
    v18 = self;
    v19 = 2080;
    v20 = "-[IOSBasedChromeViewController dismissAllModalViewsIfPresentAnimated:completion:]";
    v21 = 2112;
    v22 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@ %s, %@", (uint8_t *)&v17, 0x20u);

  }
  v11 = objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController presentedViewController](self, "presentedViewController"));
  if (v11)
  {
    v12 = (__CFString *)v11;
    while (1)
    {
      v13 = objc_opt_class(ContaineeViewController);
      if ((objc_opt_isKindOfClass(v12, v13) & 1) == 0)
        break;
      v14 = objc_claimAutoreleasedReturnValue(-[__CFString presentedViewController](v12, "presentedViewController"));

      v12 = (__CFString *)v14;
      if (!v14)
        goto LABEL_9;
    }
    v15 = sub_10043196C();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138412802;
      v18 = self;
      v19 = 2080;
      v20 = "-[IOSBasedChromeViewController dismissAllModalViewsIfPresentAnimated:completion:]";
      v21 = 2112;
      v22 = v12;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%@ %s, dismissing Modal! %@", (uint8_t *)&v17, 0x20u);
    }

    -[__CFString dismissViewControllerAnimated:completion:](v12, "dismissViewControllerAnimated:completion:", v4, v6);
  }
  else
  {
LABEL_9:
    if (v6)
      v6[2](v6);
  }

}

- (void)copy:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  char **v10;
  uint64_t v11;
  char **v12;
  char *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  void *v25;
  _BYTE v26[128];

  v4 = objc_msgSend(objc_alloc((Class)UIActivityViewController), "initWithActivityItems:applicationActivities:", &__NSArray0__struct, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IOSBasedChromeViewController currentShareItemSource](self, "currentShareItemSource"));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "activityProviders"));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (!v7)
  {
    v15 = v6;
    goto LABEL_15;
  }
  v8 = v7;
  v20 = v5;
  v9 = *(_QWORD *)v22;
  v10 = &selRef_accessoryViewObject;
LABEL_3:
  v11 = 0;
  v12 = v10;
  v13 = v10[142];
  while (1)
  {
    if (*(_QWORD *)v22 != v9)
      objc_enumerationMutation(v6);
    v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v11);
    if ((objc_opt_respondsToSelector(v14, v13) & 1) == 0)
      goto LABEL_9;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "activityViewController:itemForActivityType:", v4, UIActivityTypeCopyToPasteboard));
    v16 = objc_opt_class(NSURL);
    if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0)
      break;

LABEL_9:
    if (v8 == (id)++v11)
    {
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      v10 = v12;
      if (v8)
        goto LABEL_3;
      v15 = v6;
      v5 = v20;
      goto LABEL_15;
    }
  }

  v5 = v20;
  if (!v15)
    goto LABEL_16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIPasteboard generalPasteboard](UIPasteboard, "generalPasteboard"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "absoluteString"));
  v25 = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v25, 1));
  objc_msgSend(v17, "setObjects:", v19);

LABEL_15:
LABEL_16:

}

- ($6E15C01CA1BE37A4936191A84F7075E2)thermalRateLimitsConfigKey
{
  uint64_t v2;
  void *v3;
  $6E15C01CA1BE37A4936191A84F7075E2 result;

  v2 = MapsConfig_ThermalPressureiOSNavigationRateLimits;
  v3 = off_1014B4718;
  result.var0.var1 = v3;
  *(_QWORD *)&result.var0.var0 = v2;
  return result;
}

- ($6E15C01CA1BE37A4936191A84F7075E2)batteryLevelRateLimitEnabledConfigKey
{
  uint64_t v2;
  void *v3;
  $6E15C01CA1BE37A4936191A84F7075E2 result;

  v2 = MapsConfig_BatteryLevelNavigationRateLimitEnablediOS;
  v3 = off_1014B47F8;
  result.var0.var1 = v3;
  *(_QWORD *)&result.var0.var0 = v2;
  return result;
}

- ($6E15C01CA1BE37A4936191A84F7075E2)lowPowerModeRateLimitEnabledConfigKey
{
  uint64_t v2;
  void *v3;
  $6E15C01CA1BE37A4936191A84F7075E2 result;

  v2 = MapsConfig_LowPowerNavigationRateLimitEnablediOS;
  v3 = off_1014B4838;
  result.var0.var1 = v3;
  *(_QWORD *)&result.var0.var0 = v2;
  return result;
}

- (int64_t)displayedViewMode
{
  return self->_displayedViewMode;
}

- (AppCoordinator)appCoordinator
{
  return (AppCoordinator *)objc_loadWeakRetained((id *)&self->_appCoordinator);
}

- (void)setAppCoordinator:(id)a3
{
  objc_storeWeak((id *)&self->_appCoordinator, a3);
}

- (void)setInterruptionManager:(id)a3
{
  objc_storeStrong((id *)&self->_interruptionManager, a3);
}

- (ViewModeDelegate)viewModeDelegate
{
  return (ViewModeDelegate *)objc_loadWeakRetained((id *)&self->_viewModeDelegate);
}

- (void)setViewModeDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_viewModeDelegate, a3);
}

- (ParkedCarManager)parkedCarManager
{
  return self->_parkedCarManager;
}

- (void)setRidesharingAnnotationsManager:(id)a3
{
  objc_storeStrong((id *)&self->_ridesharingAnnotationsManager, a3);
}

- (MapsActionController)mapsActionController
{
  return self->_mapsActionController;
}

- (void)setMapsActionController:(id)a3
{
  objc_storeStrong((id *)&self->_mapsActionController, a3);
}

- (void)setSharedTripsAnnotationsController:(id)a3
{
  objc_storeStrong((id *)&self->_sharedTripsAnnotationsController, a3);
}

- (LookAroundChromeOverlay)lookAroundOverlay
{
  return self->_lookAroundOverlay;
}

- (void)setLookAroundOverlay:(id)a3
{
  objc_storeStrong((id *)&self->_lookAroundOverlay, a3);
}

- (_TtC4Maps23RedoSearchChromeOverlay)redoSearchOverlay
{
  return self->_redoSearchOverlay;
}

- (void)setRedoSearchOverlay:(id)a3
{
  objc_storeStrong((id *)&self->_redoSearchOverlay, a3);
}

- (WeatherOverlay)weatherOverlay
{
  return self->_weatherOverlay;
}

- (void)setWeatherOverlay:(id)a3
{
  objc_storeStrong((id *)&self->_weatherOverlay, a3);
}

- (FloatingControlsOverlay)floatingControlsOverlay
{
  return self->_floatingControlsOverlay;
}

- (void)setFloatingControlsOverlay:(id)a3
{
  objc_storeStrong((id *)&self->_floatingControlsOverlay, a3);
}

- (UIColor)statusBarAdditionalColor
{
  return self->_statusBarAdditionalColor;
}

- (NSString)errorString
{
  return self->_errorString;
}

- (void)setErrorString:(id)a3
{
  objc_storeStrong((id *)&self->_errorString, a3);
}

- (BOOL)isTransitioningToLockScreen
{
  return self->_isTransitioningToLockScreen;
}

- (RouteAnnotationsController)routeAnnotationsControllerIfExisted
{
  return self->_routeAnnotationsControllerIfExisted;
}

- (IOSCardsOverlay)cardsOverlay
{
  return self->_cardsOverlay;
}

- (PrintController)printController
{
  return self->_printController;
}

- (UILayoutGuide)innerLayoutGuide
{
  return self->_innerLayoutGuide;
}

- (void)setInnerLayoutGuide:(id)a3
{
  objc_storeStrong((id *)&self->_innerLayoutGuide, a3);
}

- (UILayoutGuide)weatherLayoutGuide
{
  return self->_weatherLayoutGuide;
}

- (void)setWeatherLayoutGuide:(id)a3
{
  objc_storeStrong((id *)&self->_weatherLayoutGuide, a3);
}

- (BOOL)isWeatherBelowCards
{
  return self->_isWeatherBelowCards;
}

- (void)setIsWeatherBelowCards:(BOOL)a3
{
  self->_isWeatherBelowCards = a3;
}

- (BOOL)isConnectedToCarPlay
{
  return self->_connectedToCarPlay;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weatherLayoutGuide, 0);
  objc_storeStrong((id *)&self->_innerLayoutGuide, 0);
  objc_storeStrong((id *)&self->_printController, 0);
  objc_storeStrong((id *)&self->_cardsOverlay, 0);
  objc_storeStrong((id *)&self->_routeAnnotationsControllerIfExisted, 0);
  objc_storeStrong((id *)&self->_errorString, 0);
  objc_storeStrong((id *)&self->_statusBarAdditionalColor, 0);
  objc_storeStrong((id *)&self->_floatingControlsOverlay, 0);
  objc_storeStrong((id *)&self->_weatherOverlay, 0);
  objc_storeStrong((id *)&self->_redoSearchOverlay, 0);
  objc_storeStrong((id *)&self->_lookAroundOverlay, 0);
  objc_storeStrong((id *)&self->_sharedTripsAnnotationsController, 0);
  objc_storeStrong((id *)&self->_mapsActionController, 0);
  objc_storeStrong((id *)&self->_ridesharingAnnotationsManager, 0);
  objc_storeStrong((id *)&self->_parkedCarManager, 0);
  objc_destroyWeak((id *)&self->_viewModeDelegate);
  objc_storeStrong((id *)&self->_interruptionManager, 0);
  objc_destroyWeak((id *)&self->_appCoordinator);
  objc_storeStrong((id *)&self->_settingsController, 0);
  objc_storeStrong((id *)&self->_defaultTransportTypeFinder, 0);
  objc_storeStrong(&self->_externalContainerAppearanceWaitBlock, 0);
  objc_storeStrong(&self->_externalContainerAppearanceNotification, 0);
  objc_storeStrong((id *)&self->_floatingControlsOverlayDelegateProxy, 0);
  objc_storeStrong((id *)&self->_pedestrianARSessionStateManager, 0);
  objc_storeStrong((id *)&self->_viewControllersForPresentingInNewWindow, 0);
  objc_storeStrong((id *)&self->_weatherLayoutGuideConstraints, 0);
  objc_storeStrong((id *)&self->_innerLayoutGuideConstraints, 0);
  objc_storeStrong((id *)&self->_viewportTopEqualToSafeAreaBottomConstraint, 0);
  objc_storeStrong((id *)&self->_viewportTopEqualToStatusBarBottomConstraint, 0);
  objc_storeStrong((id *)&self->_statusBarSupplementaryView, 0);
  objc_storeStrong((id *)&self->_statusBarBackgroundView, 0);
  objc_storeStrong((id *)&self->_screenshotService, 0);
  objc_storeStrong(&self->_usingOfflineDataModernMapToken, 0);
  objc_storeStrong((id *)&self->_modernMapTokens, 0);
  objc_storeStrong(&self->_carPlayModernMapToken, 0);
  objc_storeStrong((id *)&self->_loadingMapNetworkActivity, 0);
  objc_storeStrong((id *)&self->_logTileStateRecognizer, 0);
  objc_storeStrong((id *)&self->_overlayManager, 0);
  objc_storeStrong((id *)&self->_historicalLocations, 0);
  objc_storeStrong((id *)&self->_mapViewResponder, 0);
  objc_storeStrong((id *)&self->_environmentObserver, 0);
}

@end
