@implementation CarNavigationModeController

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v4;
  void *v5;
  objc_super v6;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.maps.compressionTest"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v4, "removeObserver:forKeyPath:", self, CFSTR("NavigationVoiceGuidanceLevelDriving"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v5, "removeObserver:forKeyPath:", self, CFSTR("NavigationCarPlayPersistedGuidanceSignStyle"));

  -[CarChromeNavigationCameraStyleManager unregisterObserver:](self->_cameraStyleManager, "unregisterObserver:", self);
  v6.receiver = self;
  v6.super_class = (Class)CarNavigationModeController;
  -[CarNavigationModeController dealloc](&v6, "dealloc");
}

- (CarNavigationModeController)init
{
  CarNavigationModeController *v2;
  NSMutableSet *v3;
  NSMutableSet *invalidatedAlertIds;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CarNavigationModeController;
  v2 = -[CarNavigationModeController init](&v14, "init");
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    invalidatedAlertIds = v2->_invalidatedAlertIds;
    v2->_invalidatedAlertIds = v3;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)sub_10027B1D4, CFSTR("com.apple.maps.compressionTest"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v6, "addObserver:forKeyPath:options:context:", v2, CFSTR("NavigationVoiceGuidanceLevelDriving"), 0, &off_1011AE8B8);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v7, "addObserver:forKeyPath:options:context:", v2, CFSTR("NavigationCarPlayPersistedGuidanceSignStyle"), 0, &off_1011AE8C0);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v8, "addObserver:selector:name:object:", v2, "carShareETAInfoViewDidChangeShareETASuggestionVisibilityNotification:", CarShareETAInfoViewDidChangeShareETASuggestionVisibilityNotification, 0);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v9, "addObserver:selector:name:object:", v2, "carShareETAInfoViewDidInteractWithShareETASuggestionNotification:", CarShareETAInfoViewDidInteractWithShareETASuggestionNotification, 0);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CarChromeNavigationCameraStyleManager sharedInstance](CarChromeNavigationCameraStyleManager, "sharedInstance"));
    -[CarNavigationModeController setCameraStyleManager:](v2, "setCameraStyleManager:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController cameraStyleManager](v2, "cameraStyleManager"));
    objc_msgSend(v11, "registerObserver:", v2);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v2->_navigationGuidanceSignStyle = (int64_t)objc_msgSend(v12, "integerForKey:", CFSTR("NavigationCarPlayPersistedGuidanceSignStyle"));

  }
  return v2;
}

- (id)mapView
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController chromeViewController](self, "chromeViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "mapView"));

  return v3;
}

- (GuidanceObserver)guidanceObserver
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "guidanceObserver"));

  return (GuidanceObserver *)v3;
}

- (_TtC4Maps28NavigationWaypointController)waypointController
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint8_t v9[16];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "platformController"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentNavigationSession"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "waypointController"));

  if (!v5)
  {
    v6 = sub_10043364C();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Couldn't find a navigation waypoint controller within car nav context.", v9, 2u);
    }

  }
  return (_TtC4Maps28NavigationWaypointController *)v5;
}

- (BOOL)showsMapView
{
  return 1;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)mapControlsConfiguration
{
  void *v5;
  unsigned int v6;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A *result;
  void *v8;
  void *v9;
  unsigned int v10;
  unint64_t v11;

  if ((char *)-[CarNavigationModeController navigationModeState](self, "navigationModeState") - 3 <= (char *)3
    && (v5 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService")),
        v6 = objc_msgSend(v5, "navigationState"),
        v5,
        v6 == 6))
  {
    retstr->var0 = 0;
    retstr->var1 = 0;
    retstr->var2 = 0;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController carChromeViewController](self, "carChromeViewController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "navigationDisplay"));
    v10 = objc_msgSend(v9, "isCameraPanning");

    v11 = 6;
    if (!v10)
      v11 = 0;
    retstr->var0 = 2;
    retstr->var1 = v11;
    retstr->var2 = 5;
  }
  return result;
}

- (BOOL)showsHeadingIndicator
{
  return 1;
}

- (BOOL)allowKnobNudgeMapPanning
{
  return 1;
}

- (BOOL)showsSpeedLimit
{
  return 1;
}

- (BOOL)allowMapZoomAndRecentering
{
  return (id)-[CarNavigationModeController cameraStyle](self, "cameraStyle") == (id)2;
}

- (BOOL)showsNavigationBar
{
  return 0;
}

- (BOOL)wantsNavigationDisplay
{
  return 1;
}

- (BOOL)shouldAccessoriesModifyMapInsets
{
  return (id)-[CarNavigationModeController cameraStyle](self, "cameraStyle") == (id)2;
}

- (BOOL)shouldMapControlsModifyMapInsets
{
  return (id)-[CarNavigationModeController cameraStyle](self, "cameraStyle") == (id)2;
}

- (int64_t)autohideBehavior
{
  return 2
       * ((unint64_t)-[CarNavigationModeController navigationModeState](self, "navigationModeState") + 1 < 4);
}

- (int64_t)accessoriesHidingBehavior
{
  return 1;
}

- (BOOL)shouldSuppressAutohideRecognizerForTouch:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD *v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;

  v4 = a3;
  if ((id)-[CarNavigationModeController cameraStyle](self, "cameraStyle") == (id)2)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController mapView](self, "mapView"));
    objc_msgSend(v4, "locationInView:", v5);
    v7 = v6;
    v9 = v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController chromeViewController](self, "chromeViewController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "routeAnnotationsController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "configuration"));

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController mapView](self, "mapView"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "routes"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "selectedRoute"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    v17 = sub_100479B6C(v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[RouteAnnotationsResponder routeAtPoint:inMapView:withRoutes:selectedRoute:overlappingRouteSelectorBlock:](RouteAnnotationsResponder, "routeAtPoint:inMapView:withRoutes:selectedRoute:overlappingRouteSelectorBlock:", v13, v14, v15, v18, v7, v9));

    if (v19)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController currentRoute](self, "currentRoute"));
      v21 = v19 != v20;

    }
    else
    {
      v21 = 0;
    }

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (BOOL)supportsAlternateRouteSelection
{
  return 1;
}

- (void)setTrafficAlertCardController:(id)a3
{
  CarTrafficAlertCardViewController *v5;
  CarTrafficAlertCardViewController *v6;

  v5 = (CarTrafficAlertCardViewController *)a3;
  if (self->_trafficAlertCardController != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_trafficAlertCardController, a3);
    -[CarNavigationModeController setNavigationModeState:](self, "setNavigationModeState:", 2 * (self->_trafficAlertCardController != 0));
    v5 = v6;
  }

}

- (CarGuidanceCardViewController)guidanceCardController
{
  CarGuidanceCardViewController *guidanceCardController;
  CarGuidanceCardViewController *v4;
  CarGuidanceCardViewController *v5;

  guidanceCardController = self->_guidanceCardController;
  if (!guidanceCardController)
  {
    v4 = -[CarGuidanceCardViewController initWithDestination:guidanceCardSizeProvider:interactionDelegate:]([CarGuidanceCardViewController alloc], "initWithDestination:guidanceCardSizeProvider:interactionDelegate:", 0, 0, self);
    v5 = self->_guidanceCardController;
    self->_guidanceCardController = v4;

    guidanceCardController = self->_guidanceCardController;
  }
  return guidanceCardController;
}

- (CarETACardViewController)etaCardController
{
  CarETACardViewController *etaCardController;
  CarETACardViewController *v4;
  void *v5;
  CarETACardViewController *v6;
  CarETACardViewController *v7;

  etaCardController = self->_etaCardController;
  if (!etaCardController)
  {
    v4 = [CarETACardViewController alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController carChromeViewController](self, "carChromeViewController"));
    v6 = -[CarETACardViewController initWithDataSource:delegate:interruptPresenter:canExpand:](v4, "initWithDataSource:delegate:interruptPresenter:canExpand:", self, self, v5, 1);
    v7 = self->_etaCardController;
    self->_etaCardController = v6;

    -[CarNavigationModeController _updateShareButtonContentAndVisibility:](self, "_updateShareButtonContentAndVisibility:", 0);
    etaCardController = self->_etaCardController;
  }
  return etaCardController;
}

- (CarWaypointsOverviewCardViewController)waypointsOverviewCardController
{
  CarWaypointsOverviewCardViewController *waypointsOverviewCardController;
  CarWaypointsOverviewCardViewController *v4;
  CarWaypointsOverviewCardViewController *v5;

  waypointsOverviewCardController = self->_waypointsOverviewCardController;
  if (!waypointsOverviewCardController)
  {
    v4 = -[CarWaypointsOverviewCardViewController initWithDelegate:]([CarWaypointsOverviewCardViewController alloc], "initWithDelegate:", self);
    v5 = self->_waypointsOverviewCardController;
    self->_waypointsOverviewCardController = v4;

    waypointsOverviewCardController = self->_waypointsOverviewCardController;
  }
  return waypointsOverviewCardController;
}

- (void)setNavigationModeState:(int64_t)a3
{
  id v5;
  NSObject *v6;
  const __CFString *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  int64_t navigationModeState;
  void *v13;
  int v14;
  const __CFString *v15;

  if (self->_navigationModeState != a3)
  {
    self->_navigationModeState = a3;
    v5 = sub_10043364C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      if ((unint64_t)(a3 + 1) > 7)
        v7 = CFSTR("Default");
      else
        v7 = off_1011AEA20[a3 + 1];
      v14 = 138412290;
      v15 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "NavMode: setNavigationModeState: %@, -> updating chrome.", (uint8_t *)&v14, 0xCu);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController etaCardController](self, "etaCardController"));
    v9 = objc_msgSend(v8, "isViewLoaded");

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController carChromeViewController](self, "carChromeViewController"));
    objc_msgSend(v10, "updateCardsForContext:animated:", self, v9);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController carChromeViewController](self, "carChromeViewController"));
    objc_msgSend(v11, "setNeedsUpdateComponent:animated:", CFSTR("mapcontrols"), v9);

    navigationModeState = self->_navigationModeState;
    if ((unint64_t)(navigationModeState - 3) < 4 || !navigationModeState)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController etaCardController](self, "etaCardController"));
      objc_msgSend(v13, "updateContent");

    }
  }
}

- (void)setCurrentRoute:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if ((objc_msgSend(v10, "isEqual:", self->_currentRoute) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_currentRoute, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController carChromeViewController](self, "carChromeViewController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "navigationDisplay"));
    objc_msgSend(v6, "updateWithRoute:", self->_currentRoute);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController etaCardController](self, "etaCardController"));
    objc_msgSend(v7, "updateContent");

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController carChromeViewController](self, "carChromeViewController"));
    objc_msgSend(v8, "updateCardsForContext:animated:", self, 0);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController carChromeViewController](self, "carChromeViewController"));
    objc_msgSend(v9, "updateComponentsIfNeeded");

  }
}

- (void)setShowingJunctionView:(BOOL)a3
{
  void *v4;
  id v5;

  if (self->_showingJunctionView != a3)
  {
    self->_showingJunctionView = a3;
    v5 = (id)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController chromeViewController](self, "chromeViewController"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController etaCardController](self, "etaCardController"));
    objc_msgSend(v5, "updateCardsForContext:animated:", self, objc_msgSend(v4, "isViewLoaded"));

  }
}

- (void)configureFocusContainerGuideController:(id)a3
{
  objc_msgSend(a3, "setActiveEdges:", 15);
}

- (id)desiredCards
{
  void *v3;
  void *v4;
  const __CFString **v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unsigned int v9;
  id v10;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 2));
  v4 = v3;
  switch(self->_navigationModeState)
  {
    case 0xFFFFFFFFFFFFFFFFLL:
      v12 = CFSTR("Guidance");
      v13 = CFSTR("Compression Test");
      v5 = &v12;
      goto LABEL_7;
    case 0:
      v17 = CFSTR("Guidance");
      v18 = CFSTR("ETA");
      v5 = &v17;
      goto LABEL_7;
    case 1:
      objc_msgSend(v3, "addObject:", CFSTR("Stops"));
      break;
    case 2:
      v14 = CFSTR("Guidance");
      v15 = CFSTR("Traffic Alert");
      v5 = &v14;
LABEL_7:
      v6 = 2;
      goto LABEL_8;
    case 3:
    case 4:
    case 5:
    case 6:
      v16 = CFSTR("ETA");
      v5 = &v16;
      v6 = 1;
LABEL_8:
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v5, v6, v12, v13, v14, v15, v16, v17, v18));
      objc_msgSend(v4, "addObjectsFromArray:", v7);

      break;
    default:
      break;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v9 = objc_msgSend(v8, "BOOLForKey:", CFSTR("CarNavigationHideGuidanceCard"));

  if (v9)
    objc_msgSend(v4, "removeObject:", CFSTR("Guidance"));
  v10 = objc_msgSend(v4, "copy");

  return v10;
}

- (void)configureCard:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  unsigned int v12;
  unsigned int v13;
  void *v14;
  uint64_t v15;
  id *v21;
  _QWORD *v22;
  void *v23;
  void *v25;
  __int128 *v27;
  void *v28;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _OWORD v49[2];
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  int v53;
  uint64_t v54;
  uint64_t v55;
  __int128 v56;
  __int128 v57;
  char v58;
  _BYTE v59[7];
  uint64_t v60;
  char v61;
  __int128 v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  int v68;
  uint64_t v69;
  uint64_t v70;
  __int128 v71;
  __int128 v72;
  char v73;
  _BYTE v74[7];
  uint64_t v75;
  char v76;
  __int128 v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  int v83;
  uint64_t v84;
  uint64_t v85;
  __int128 v86;
  __int128 v87;
  char v88;
  _BYTE v89[7];
  uint64_t v90;
  char v91;
  _QWORD v92[4];
  id v93;
  id location;
  __int128 v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  int v101;
  uint64_t v102;
  uint64_t v103;
  __int128 v104;
  __int128 v105;
  char v106;
  _BYTE v107[7];
  uint64_t v108;
  char v109;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController etaCardController](self, "etaCardController"));
  objc_msgSend(v8, "updateContent");

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController etaCardController](self, "etaCardController"));
  v10 = objc_msgSend(v9, "isExpanded");

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController etaCardController](self, "etaCardController"));
  v12 = objc_msgSend(v11, "isShowingShareETASuggestion");

  v13 = v10 ^ -[CarNavigationModeController isTogglingETACard](self, "isTogglingETACard");
  if (!objc_msgSend(v7, "isEqualToString:", CFSTR("Guidance")))
  {
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("ETA")))
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController etaCardController](self, "etaCardController"));
      objc_msgSend(v6, "setContent:", v23);

      memset(v89, 0, sizeof(v89));
      v77 = xmmword_100E34B90;
      v78 = 1;
      v79 = 0;
      v80 = 0;
      v81 = 1065353216;
      v82 = 2;
      v83 = 1148846080;
      v84 = 0;
      v85 = 0;
      __asm { FMOV            V0.2D, #8.0 }
      v86 = _Q0;
      v87 = _Q0;
      v88 = 1;
      v90 = 8;
      v91 = 0;
      if (v6)
        objc_msgSend(v6, "setLayout:", &v77);
      objc_msgSend(v6, "setStaysOnTop:", v13 | v12);
      goto LABEL_24;
    }
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("Traffic Alert")))
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController trafficAlertCardController](self, "trafficAlertCardController"));
      objc_msgSend(v6, "setContent:", v25);

      memset(v74, 0, sizeof(v74));
      v62 = xmmword_100E34B90;
      v63 = 1;
      v64 = 0;
      v65 = 0;
      v66 = 1144750080;
      v67 = 2;
      v68 = 1148846080;
      v69 = 0;
      v70 = 0;
      __asm { FMOV            V0.2D, #8.0 }
      v71 = _Q0;
      v72 = _Q0;
      v73 = 1;
      v75 = 8;
      v76 = 0;
      if (v6)
      {
        v27 = &v62;
LABEL_23:
        objc_msgSend(v6, "setLayout:", v27);
      }
    }
    else
    {
      if (!objc_msgSend(v7, "isEqualToString:", CFSTR("Compression Test")))
      {
        if (!objc_msgSend(v7, "isEqualToString:", CFSTR("Stops")))
          goto LABEL_26;
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("CarPlay_EditStops"), CFSTR("localized string not found"), 0));
        objc_msgSend(v6, "setTitle:", v33);

        v34 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController waypointsOverviewCardController](self, "waypointsOverviewCardController"));
        objc_msgSend(v6, "setContent:", v34);

        HIDWORD(v46) = 0;
        *(_DWORD *)((char *)&v46 + 1) = 0;
        v36 = xmmword_100E34B90;
        v37 = xmmword_100E2D550;
        v38 = 3;
        v39 = 1148846080;
        v40 = 2;
        LODWORD(v41) = 1148846080;
        v42 = 0;
        v43 = 0;
        __asm { FMOV            V0.2D, #8.0 }
        v44 = _Q0;
        v45 = _Q0;
        LOBYTE(v46) = 1;
        v47 = 8;
        LOBYTE(v48) = 0;
        if (v6)
          objc_msgSend(v6, "setLayout:", &v36);
        v30 = v6;
        v31 = 1;
        goto LABEL_25;
      }
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController compressionTestCardController](self, "compressionTestCardController"));
      objc_msgSend(v6, "setContent:", v28);

      memset(v59, 0, sizeof(v59));
      v49[0] = xmmword_100E34B90;
      v49[1] = xmmword_100E34BA0;
      v50 = 0;
      v51 = 1065353216;
      v52 = 2;
      v53 = 1148846080;
      v54 = 0;
      v55 = 0;
      __asm { FMOV            V0.2D, #8.0 }
      v56 = _Q0;
      v57 = _Q0;
      v58 = 1;
      v60 = 8;
      v61 = 0;
      if (v6)
      {
        v27 = v49;
        goto LABEL_23;
      }
    }
LABEL_24:
    v30 = v6;
    v31 = 0;
LABEL_25:
    objc_msgSend(v30, "setAccessory:", v31, v36, v37, v38, v39, v40, v41, v42, v43, v44, v45, v46, v47, v48);
    goto LABEL_26;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController guidanceCardController](self, "guidanceCardController"));
  objc_msgSend(v6, "setContent:", v14);

  if (self->_navigationGuidanceSignStyle == 1)
    v15 = 1;
  else
    v15 = 2;
  memset(v107, 0, sizeof(v107));
  v95 = xmmword_100E2F4D0;
  v96 = 1;
  v97 = 0;
  v98 = 0;
  v99 = 1148846080;
  v100 = v15;
  v101 = 1148846080;
  v102 = 0;
  v103 = 0;
  __asm { FMOV            V0.2D, #8.0 }
  v104 = _Q0;
  v105 = _Q0;
  v106 = 1;
  v108 = 8;
  v109 = 0;
  if (v6)
    objc_msgSend(v6, "setLayout:", &v95);
  objc_msgSend(v6, "setAccessory:", 0);
  v21 = (id *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController guidanceCardController](self, "guidanceCardController"));
  objc_initWeak(&location, v21);

  if ((v13 & 1) != 0)
  {
    v22 = 0;
  }
  else
  {
    v92[0] = _NSConcreteStackBlock;
    v92[1] = 3221225472;
    v92[2] = sub_10027C0DC;
    v92[3] = &unk_1011AE8D0;
    v22 = v92;
    v21 = &v93;
    objc_copyWeak(&v93, &location);
  }
  objc_msgSend(v6, "setSelectionHandler:", v22);
  if ((v13 & 1) == 0)
    objc_destroyWeak(v21);
  objc_destroyWeak(&location);
LABEL_26:

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

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController chromeViewController](self, "chromeViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "searchPinsManager"));

  if (!v4)
    return &__NSArray0__struct;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController chromeViewController](self, "chromeViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "searchPinsManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "routeStartEndItemSource"));
  v10 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));

  return v8;
}

- (AudioPreferences)audioPreferences
{
  AudioPreferences *audioPreferences;
  AudioPreferences *v4;
  void *v5;
  AudioPreferences *v6;
  AudioPreferences *v7;

  audioPreferences = self->_audioPreferences;
  if (!audioPreferences)
  {
    v4 = [AudioPreferences alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v6 = -[AudioPreferences initWithDefaults:](v4, "initWithDefaults:", v5);
    v7 = self->_audioPreferences;
    self->_audioPreferences = v6;

    audioPreferences = self->_audioPreferences;
  }
  return audioPreferences;
}

- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v5;
  _QWORD v6[5];
  _QWORD v7[5];
  unsigned __int8 v8;
  _QWORD v9[5];

  v5 = a4;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10027C3BC;
  v9[3] = &unk_1011AC860;
  v9[4] = self;
  v6[4] = self;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10027C574;
  v7[3] = &unk_1011ACE58;
  v7[4] = self;
  v8 = objc_msgSend(v5, "isAnimated");
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10027C708;
  v6[3] = &unk_1011AE8F8;
  objc_msgSend(v5, "addPreparation:animations:completion:", v9, v7, v6);

}

- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v5;
  _QWORD v6[5];
  _QWORD v7[5];

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10027C83C;
  v7[3] = &unk_1011AC860;
  v7[4] = self;
  v5 = a4;
  objc_msgSend(v5, "addPreparation:", v7);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10027C970;
  v6[3] = &unk_1011AE8F8;
  v6[4] = self;
  objc_msgSend(v5, "addCompletion:", v6);

}

- (void)carCardViewCloseButtonTapped:(id)a3
{
  void *v4;
  id v5;
  NSObject *v6;
  int64_t v7;
  const __CFString *v8;
  int v9;
  const __CFString *v10;

  if ((id)-[CarNavigationModeController navigationModeState](self, "navigationModeState", a3) == (id)1)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController chromeViewController](self, "chromeViewController"));
    objc_msgSend(v4, "captureUserAction:onTarget:", 4, 1025);

    -[CarNavigationModeController setNavigationModeState:](self, "setNavigationModeState:", 0);
  }
  else
  {
    v5 = sub_10043364C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      v7 = -[CarNavigationModeController navigationModeState](self, "navigationModeState");
      if ((unint64_t)(v7 + 1) > 7)
        v8 = CFSTR("Default");
      else
        v8 = off_1011AEA20[v7 + 1];
      v9 = 138412290;
      v10 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "carCardViewCloseButtonTapped in nav mode in an unexpected state: %@", (uint8_t *)&v9, 0xCu);
    }

  }
}

- (void)configureNavigationDisplay:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setCameraStyle:", -[CarNavigationModeController cameraStyle](self, "cameraStyle"));
  objc_msgSend(v4, "setCameraPaused:", 0);
  objc_msgSend(v4, "setRouteGeniusEntry:", 0);

}

- (void)hideAutohidingContentWithAnimation:(id)a3
{
  void *v4;
  unsigned int v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController etaCardController](self, "etaCardController"));
  v5 = objc_msgSend(v4, "isExpanded");

  if (v5)
    -[CarNavigationModeController _toggleETACardAnimated:](self, "_toggleETACardAnimated:", objc_msgSend(v6, "isAnimated"));

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  char *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  NSObject *v21;
  const __CFString *v22;
  id v23;
  NSObject *v24;
  id v25;
  NSObject *v26;
  char *v27;
  void *v28;
  objc_super v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  int v35;

  v10 = a3;
  v11 = a4;
  v12 = (char *)a5;
  if (v10 && a6 == &off_1011AE8B8)
  {
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("NavigationVoiceGuidanceLevelDriving")))
    {
      v13 = sub_10043364C();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v31 = v12;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "NavigationVoiceGuidanceLevelDriving changed to %@", buf, 0xCu);
      }

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController audioPreferences](self, "audioPreferences"));
      objc_msgSend(v15, "loadValuesFromDefaults");

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController carChromeViewController](self, "carChromeViewController"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController etaCardController](self, "etaCardController"));
      objc_msgSend(v16, "setNeedsUpdateComponent:animated:", CFSTR("mapcontrols"), objc_msgSend(v17, "isViewLoaded"));

      goto LABEL_15;
    }
LABEL_14:
    v29.receiver = self;
    v29.super_class = (Class)CarNavigationModeController;
    -[CarNavigationModeController observeValueForKeyPath:ofObject:change:context:](&v29, "observeValueForKeyPath:ofObject:change:context:", v10, v11, v12, a6);
    goto LABEL_15;
  }
  if (!v10
    || a6 != &off_1011AE8C0
    || !objc_msgSend(v10, "isEqualToString:", CFSTR("NavigationCarPlayPersistedGuidanceSignStyle")))
  {
    goto LABEL_14;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v19 = objc_msgSend(v18, "integerForKey:", CFSTR("NavigationCarPlayPersistedGuidanceSignStyle"));

  v20 = sub_10043364C();
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    if (v19)
    {
      if (v19 == (id)1)
      {
        v22 = CFSTR(".Mini");
      }
      else
      {
        v23 = sub_1004318FC();
        v24 = objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v31 = "NSString * _Nonnull NSStringFromCarNavigationGuidanceSignStyle(CarNavigationGuidanceSignStyle)";
          v32 = 2080;
          v33 = "CarNavigationGuidanceSign.h";
          v34 = 1024;
          v35 = 36;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
        }

        if (sub_100A70734())
        {
          v25 = sub_1004318FC();
          v26 = objc_claimAutoreleasedReturnValue(v25);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            v27 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
            *(_DWORD *)buf = 138412290;
            v31 = v27;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

          }
        }
        v22 = CFSTR(".Unknown");
      }
    }
    else
    {
      v22 = CFSTR(".Default");
    }
    *(_DWORD *)buf = 138412290;
    v31 = (const char *)v22;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "NavigationCarPlayPersistedGuidanceSignStyle changed to %@ -> will update guidanceCardVC", buf, 0xCu);
  }

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController guidanceCardController](self, "guidanceCardController"));
  objc_msgSend(v28, "setNavigationGuidanceSignStyle:", v19);

LABEL_15:
}

- (unint64_t)audioSettingsCurrentState
{
  void *v2;
  id v3;
  unint64_t v4;
  id v5;
  NSObject *v6;
  __CFString *v7;
  uint8_t buf[4];
  unint64_t v10;
  __int16 v11;
  __CFString *v12;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController audioPreferences](self, "audioPreferences"));
  v3 = objc_msgSend(v2, "guidanceLevelForTransportType:", 0);

  v4 = +[NavAudioControlView navAudioTypeForGuidanceLevel:](NavAudioControlView, "navAudioTypeForGuidanceLevel:", v3);
  v5 = sub_10043364C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    if ((unint64_t)v3 + 1 >= 4)
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("UNKNOWN: %lu"), v3));
    else
      v7 = off_1011AEA78[(_QWORD)v3 + 1];
    *(_DWORD *)buf = 134218242;
    v10 = v4;
    v11 = 2112;
    v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "audioSettingsCurrentState will return audioType: %ld for guidanceLevel: %@", buf, 0x16u);

  }
  return v4;
}

- (void)audioControlView:(id)a3 didSelectAudioType:(unint64_t)a4
{
  uint64_t v5;
  BOOL v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  __CFString *v10;
  NSNumber *previousGuidanceCardSignAudioSetting;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  __CFString *v16;

  v5 = 2;
  if (a4 == 1)
    v5 = 1;
  v6 = a4 == 2 || a4 == 1;
  if (a4 == 2)
    v7 = 0;
  else
    v7 = v5;
  v8 = sub_10043364C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = off_1011AEA60[v7];
    v15 = 138412290;
    v16 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "audioControlView:didSelectAudioType: user manually changed audio settings to: %@", (uint8_t *)&v15, 0xCu);

  }
  previousGuidanceCardSignAudioSetting = self->_previousGuidanceCardSignAudioSetting;
  self->_previousGuidanceCardSignAudioSetting = 0;

  self->_hasUserManuallyReducedAudio = v6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController audioPreferences](self, "audioPreferences"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController currentRoute](self, "currentRoute"));
  objc_msgSend(v12, "setGuidanceLevel:forTransportType:", v7, objc_msgSend(v13, "transportType"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController audioPreferences](self, "audioPreferences"));
  objc_msgSend(v14, "synchronize");

}

- (unint64_t)_upcomingGuidanceLevelForGuidanceSignStyle:(int64_t)a3 currentGuidanceLevel:(unint64_t)a4
{
  NSNumber *previousGuidanceCardSignAudioSetting;
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  if (!a3)
    goto LABEL_7;
  if (a3 != 1 || a4 < 2)
    return a4;
  if (a4 == -1)
  {
    v6 = sub_10043364C();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "Invalid guidance level \"NoOverride\" in CarNavigationModeController.", v8, 2u);
    }

    return 0;
  }
  if (a4 == 2)
    return 1;
LABEL_7:
  previousGuidanceCardSignAudioSetting = self->_previousGuidanceCardSignAudioSetting;
  if (previousGuidanceCardSignAudioSetting)
    return -[NSNumber unsignedIntegerValue](previousGuidanceCardSignAudioSetting, "unsignedIntegerValue");
  return a4;
}

- (void)guidanceCardController:(id)a3 didChangeGuidanceSignStyle:(int64_t)a4 userInitiated:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  NSObject *v9;
  const __CFString *v10;
  id v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  char *v15;
  __CFString *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  const char *v23;
  id v24;
  void *v25;
  id v26;
  unint64_t v27;
  NSNumber *v28;
  NSNumber *previousGuidanceCardSignAudioSetting;
  id v30;
  _BOOL4 v31;
  int64_t navigationGuidanceSignStyle;
  const __CFString *v33;
  int64_t v34;
  const __CFString *v35;
  id v36;
  NSObject *v37;
  id v38;
  NSObject *v39;
  char *v40;
  __CFString *v41;
  id v42;
  NSObject *v43;
  id v44;
  NSObject *v45;
  char *v46;
  __CFString *v47;
  __CFString *v48;
  __CFString *v49;
  void *v50;
  void *v51;
  void *v52;
  uint8_t buf[4];
  const char *v54;
  __int16 v55;
  const char *v56;
  __int16 v57;
  __CFString *v58;

  v5 = a5;
  v8 = sub_10043364C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    if (a4)
    {
      if (a4 == 1)
      {
        v10 = CFSTR(".Mini");
      }
      else
      {
        v11 = sub_1004318FC();
        v12 = objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v54 = "NSString * _Nonnull NSStringFromCarNavigationGuidanceSignStyle(CarNavigationGuidanceSignStyle)";
          v55 = 2080;
          v56 = "CarNavigationGuidanceSign.h";
          v57 = 1024;
          LODWORD(v58) = 36;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
        }

        if (sub_100A70734())
        {
          v13 = sub_1004318FC();
          v14 = objc_claimAutoreleasedReturnValue(v13);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            v15 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
            *(_DWORD *)buf = 138412290;
            v54 = v15;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

          }
        }
        v10 = CFSTR(".Unknown");
      }
    }
    else
    {
      v10 = CFSTR(".Default");
    }
    v16 = CFSTR("NO");
    if (v5)
      v16 = CFSTR("YES");
    v17 = v16;
    *(_DWORD *)buf = 138412546;
    v54 = (const char *)v10;
    v55 = 2112;
    v56 = (const char *)v17;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "guidanceCardController:didChangeNavigationSignStyle: %@ userInitiated: %@", buf, 0x16u);

  }
  self->_navigationGuidanceSignStyle = a4;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v18, "setInteger:forKey:", self->_navigationGuidanceSignStyle, CFSTR("NavigationCarPlayPersistedGuidanceSignStyle"));

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController carChromeViewController](self, "carChromeViewController"));
  objc_msgSend(v19, "setNeedsUpdateComponent:animated:", CFSTR("cards"), 0);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController carChromeViewController](self, "carChromeViewController"));
  objc_msgSend(v20, "updateComponentsIfNeeded");

  if (v5)
  {
    if (self->_hasUserManuallyReducedAudio)
    {
      v21 = sub_10043364C();
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v23 = "guidanceCardController:didChangeNavigationSignStyle: was user initiated but the user has manually reduced "
              "audio this session so we will not change the audio settings.";
LABEL_22:
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, v23, buf, 2u);
      }
    }
    else
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController audioPreferences](self, "audioPreferences"));
      v26 = objc_msgSend(v25, "guidanceLevelForTransportType:", 0);

      v27 = -[CarNavigationModeController _upcomingGuidanceLevelForGuidanceSignStyle:currentGuidanceLevel:](self, "_upcomingGuidanceLevelForGuidanceSignStyle:currentGuidanceLevel:", self->_navigationGuidanceSignStyle, v26);
      v28 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v26));
      previousGuidanceCardSignAudioSetting = self->_previousGuidanceCardSignAudioSetting;
      self->_previousGuidanceCardSignAudioSetting = v28;

      v30 = sub_10043364C();
      v22 = objc_claimAutoreleasedReturnValue(v30);
      v31 = os_log_type_enabled(v22, OS_LOG_TYPE_INFO);
      if (v26 == (id)v27)
      {
        if (v31)
        {
          navigationGuidanceSignStyle = self->_navigationGuidanceSignStyle;
          if (navigationGuidanceSignStyle)
          {
            if (navigationGuidanceSignStyle == 1)
            {
              v33 = CFSTR(".Mini");
            }
            else
            {
              v36 = sub_1004318FC();
              v37 = objc_claimAutoreleasedReturnValue(v36);
              if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315650;
                v54 = "NSString * _Nonnull NSStringFromCarNavigationGuidanceSignStyle(CarNavigationGuidanceSignStyle)";
                v55 = 2080;
                v56 = "CarNavigationGuidanceSign.h";
                v57 = 1024;
                LODWORD(v58) = 36;
                _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
              }

              if (sub_100A70734())
              {
                v38 = sub_1004318FC();
                v39 = objc_claimAutoreleasedReturnValue(v38);
                if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
                {
                  v40 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
                  *(_DWORD *)buf = 138412290;
                  v54 = v40;
                  _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

                }
              }
              v33 = CFSTR(".Unknown");
            }
          }
          else
          {
            v33 = CFSTR(".Default");
          }
          if ((unint64_t)v26 + 1 >= 4)
            v41 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("UNKNOWN: %lu"), v26));
          else
            v41 = off_1011AEA78[(_QWORD)v26 + 1];
          *(_DWORD *)buf = 138412546;
          v54 = (const char *)v33;
          v55 = 2112;
          v56 = (const char *)v41;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "guidanceCardController:didChangeCardState currentSignStyle: %@, currentGuidanceLevel: %@ -> No need to change upcoming guidance level.", buf, 0x16u);

        }
      }
      else
      {
        if (v31)
        {
          v34 = self->_navigationGuidanceSignStyle;
          if (v34)
          {
            if (v34 == 1)
            {
              v35 = CFSTR(".Mini");
            }
            else
            {
              v42 = sub_1004318FC();
              v43 = objc_claimAutoreleasedReturnValue(v42);
              if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315650;
                v54 = "NSString * _Nonnull NSStringFromCarNavigationGuidanceSignStyle(CarNavigationGuidanceSignStyle)";
                v55 = 2080;
                v56 = "CarNavigationGuidanceSign.h";
                v57 = 1024;
                LODWORD(v58) = 36;
                _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
              }

              if (sub_100A70734())
              {
                v44 = sub_1004318FC();
                v45 = objc_claimAutoreleasedReturnValue(v44);
                if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
                {
                  v46 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
                  *(_DWORD *)buf = 138412290;
                  v54 = v46;
                  _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

                }
              }
              v35 = CFSTR(".Unknown");
            }
          }
          else
          {
            v35 = CFSTR(".Default");
          }
          if ((unint64_t)v26 + 1 >= 4)
            v47 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("UNKNOWN: %lu"), v26));
          else
            v47 = off_1011AEA78[(_QWORD)v26 + 1];
          v48 = v47;
          if (v27 + 1 >= 4)
            v49 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("UNKNOWN: %lu"), v27));
          else
            v49 = off_1011AEA78[v27 + 1];
          *(_DWORD *)buf = 138412802;
          v54 = (const char *)v35;
          v55 = 2112;
          v56 = (const char *)v48;
          v57 = 2112;
          v58 = v49;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "guidanceCardController:didChangeCardState currentSignStyle: %@, currentGuidanceLevel: %@ -> Will change guidance level to: %@.", buf, 0x20u);

        }
        v50 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController carChromeViewController](self, "carChromeViewController"));
        objc_msgSend(v50, "interruptAutohideForIncidentalInteraction");

        v51 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController audioPreferences](self, "audioPreferences"));
        objc_msgSend(v51, "setGuidanceLevel:forTransportType:", v27, 0);

        v52 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController audioPreferences](self, "audioPreferences"));
        objc_msgSend(v52, "synchronize");

        v22 = objc_claimAutoreleasedReturnValue(-[CarNavigationModeController carChromeViewController](self, "carChromeViewController"));
        -[NSObject setNeedsUpdateComponent:animated:](v22, "setNeedsUpdateComponent:animated:", CFSTR("mapcontrols"), 1);
      }
    }
  }
  else
  {
    v24 = sub_10043364C();
    v22 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v23 = "guidanceCardController:didChangeNavigationSignStyle: was not user initiated so we will not update audio level";
      goto LABEL_22;
    }
  }

}

- (void)navigationWaypointController:(id)a3 didUpdateDisplayedWaypoints:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;

  v5 = a4;
  v6 = sub_10043364C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = sub_1006289DC(v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v11 = 138412290;
    v12 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "navigationWaypointController:didUpdateDisplayedWaypoints: %@", (uint8_t *)&v11, 0xCu);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController waypointsOverviewCardController](self, "waypointsOverviewCardController"));
  objc_msgSend(v10, "setWaypoints:", v5);

}

- (void)setCameraStyle:(int64_t)a3
{
  -[CarNavigationModeController setCameraStyle:animated:](self, "setCameraStyle:animated:", a3, 0);
}

- (void)setCameraStyle:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;

  if (self->_cameraStyle != a3)
  {
    v4 = a4;
    self->_cameraStyle = a3;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController etaCardController](self, "etaCardController"));
    objc_msgSend(v6, "updateContent");

    -[CarNavigationModeController refreshCameraTypeAnimated:](self, "refreshCameraTypeAnimated:", v4);
  }
}

- (void)setTrayExpanded:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  unsigned int v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id location;

  v4 = a4;
  v5 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController etaCardController](self, "etaCardController"));
  v8 = objc_msgSend(v7, "isExpanded");

  if (v8 == v5)
  {
    -[CarNavigationModeController _ppt_notityETATrayUpdateCompleted](self, "_ppt_notityETATrayUpdateCompleted");
  }
  else
  {
    objc_initWeak(&location, self);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController etaCardController](self, "etaCardController"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10027DC10;
    v10[3] = &unk_1011AD4F0;
    objc_copyWeak(&v11, &location);
    objc_msgSend(v9, "setExpanded:animated:completion:", v5, v4, v10);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

- (void)_ppt_notityETATrayUpdateCompleted
{
  +[PPTNotificationCenter postNotificationIfNeededWithName:object:userInfo:](PPTNotificationCenter, "postNotificationIfNeededWithName:object:userInfo:", CFSTR("PPTTestTrayLayoutDidUpdateNotification"), self, 0);
}

- (void)endNavigation
{
  -[CarNavigationModeController etaCardSign:didSelectAction:](self, "etaCardSign:didSelectAction:", 0, 1);
}

- (void)refreshCameraTypeAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController chromeViewController](self, "chromeViewController"));
  objc_msgSend(v5, "setNeedsUpdateMapInsets");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController carChromeViewController](self, "carChromeViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "navigationDisplay"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10027DD20;
  v9[3] = &unk_1011AD430;
  v9[4] = self;
  objc_msgSend(v7, "configureDisplay:animated:", v9, v3);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController etaCardController](self, "etaCardController"));
  objc_msgSend(v8, "updateContent");

}

- (void)_toggleCameraStyle
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController cameraStyleManager](self, "cameraStyleManager"));
  objc_msgSend(v3, "toggleCameraStyle");

  -[CarNavigationModeController _captureUserToggledCameraStyle](self, "_captureUserToggledCameraStyle");
}

- (void)_captureCurrentNavigationModeState
{
  void *v3;
  unint64_t v4;
  uint64_t v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "arrivalInfo"));

  v4 = (unint64_t)objc_msgSend(v6, "arrivalState") - 1;
  if (v4 > 5)
    v5 = 0;
  else
    v5 = qword_100E34B58[v4];
  -[CarNavigationModeController setNavigationModeState:](self, "setNavigationModeState:", v5);

}

- (void)_captureUserToggledCameraStyle
{
  int64_t v3;
  unsigned int v4;
  uint64_t v5;
  id v6;

  v3 = -[CarNavigationModeController cameraStyle](self, "cameraStyle");
  if (v3 == 1)
    v4 = 3051;
  else
    v4 = 0;
  if (v3 == 2)
    v5 = 3050;
  else
    v5 = v4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController chromeViewController](self, "chromeViewController"));
  objc_msgSend(v6, "captureUserAction:", v5);

}

- (BOOL)isSharingTrip
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripService sharedInstance](MSPSharedTripService, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "receivers"));
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (id)upcomingWaypoints
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController waypointController](self, "waypointController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "displayedWaypoints"));

  return v3;
}

- (id)sharingButtonTitle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripService sharedInstance](MSPSharedTripService, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "receivers"));

  if (!objc_msgSend(v3, "count"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("[NavTray] Share ETA"), CFSTR("localized string not found"), 0));
    goto LABEL_8;
  }
  if (objc_msgSend(v3, "count") != (id)1)
  {
LABEL_7:
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("CarPlay_ShareTripButton"), CFSTR("localized string not found"), 0));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v9, objc_msgSend(v3, "count")));

    goto LABEL_8;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "displayName"));
  if (!objc_msgSend(v5, "length"))
  {

    goto LABEL_7;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("CarPlay_ShareTripButton_OneContact"), CFSTR("localized string not found"), 0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v5));

LABEL_8:
  return v8;
}

- (id)contactSharingSuggestion
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController currentRoute](self, "currentRoute"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "shareETAWaypointContacts"));

  if (objc_msgSend(v3, "count") == (id)1)
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastObject"));
  else
    v4 = 0;

  return v4;
}

- (void)etaCardSign:(id)a3 didSelectAction:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  int v36;
  unint64_t v37;

  v6 = sub_10043364C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v36 = 134217984;
    v37 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "etaCardSign:didSelectAction: %ld", (uint8_t *)&v36, 0xCu);
  }

  switch(a4)
  {
    case 0uLL:
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController etaCardController](self, "etaCardController"));
      if (objc_msgSend(v8, "isExpanded"))
        v9 = 1038;
      else
        v9 = 1039;

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController chromeViewController](self, "chromeViewController"));
      objc_msgSend(v10, "captureUserAction:onTarget:", v9, 1021);

      -[CarNavigationModeController _toggleETACardAnimated:](self, "_toggleETACardAnimated:", 1);
      return;
    case 1uLL:
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController chromeViewController](self, "chromeViewController"));
      objc_msgSend(v28, "captureUserAction:onTarget:", 3002, 1021);

      v12 = objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject platformController](v12, "platformController"));
      objc_msgSend(v29, "clearIfCurrentSessionIsKindOfClass:", objc_opt_class(NavigationSession));

      goto LABEL_30;
    case 2uLL:
      if (-[GEOComposedRoute isEVRoute](self->_currentRoute, "isEVRoute"))
        v13 = 1021;
      else
        v13 = 1001;
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController chromeViewController](self, "chromeViewController"));
      objc_msgSend(v14, "captureUserAction:onTarget:", 6096, v13);

      v12 = objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
      -[NSObject stopNavigationWithReason:](v12, "stopNavigationWithReason:", 3);
      goto LABEL_30;
    case 3uLL:
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "nextWaypoint"));
      v17 = objc_msgSend(v16, "shouldOfferAlternateChargersAtArrival");

      if (v17)
      {
        -[CarNavigationModeController _sendOtherEVStationsRequest](self, "_sendOtherEVStationsRequest");
        return;
      }
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController chromeViewController](self, "chromeViewController"));
      objc_msgSend(v32, "captureUserAction:onTarget:", 292, 1001);

      v12 = objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
      -[NSObject advanceToNextLeg](v12, "advanceToNextLeg");
      goto LABEL_30;
    case 4uLL:
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController upcomingWaypoints](self, "upcomingWaypoints"));
      v19 = objc_msgSend(v18, "count");

      v20 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController upcomingWaypoints](self, "upcomingWaypoints"));
      v21 = sub_10039E080(v20, &stru_1011AE938);
      v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      v23 = objc_msgSend(v22, "count");

      if ((unint64_t)v19 <= 1)
      {
        if ((MapsFeature_IsEnabled_DrivingMultiWaypointRoutes(v24, v25) & 1) != 0
          || (MapsFeature_IsEnabled_Maps420() & 1) != 0
          || MapsFeature_IsEnabled_Maps182())
        {
          v33 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController chromeViewController](self, "chromeViewController"));
          v34 = v33;
          v35 = 6097;
        }
        else
        {
          v33 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController chromeViewController](self, "chromeViewController"));
          v34 = v33;
          v35 = 9006;
        }
        objc_msgSend(v33, "captureUserAction:onTarget:", v35, 1021);

        v12 = objc_claimAutoreleasedReturnValue(+[CarChromeModeCoordinator sharedInstance](CarChromeModeCoordinator, "sharedInstance"));
        -[NSObject displayNavigationSearch](v12, "displayNavigationSearch");
LABEL_30:

      }
      else
      {
        if ((unint64_t)v23 <= 1)
          v26 = 6097;
        else
          v26 = 6108;
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController chromeViewController](self, "chromeViewController"));
        objc_msgSend(v27, "captureUserAction:onTarget:", v26, 1021);

        -[CarNavigationModeController setNavigationModeState:](self, "setNavigationModeState:", 1);
      }
      return;
    case 5uLL:
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController chromeViewController](self, "chromeViewController"));
      objc_msgSend(v30, "captureUserAction:onTarget:", 115, 1021);

      v12 = objc_claimAutoreleasedReturnValue(+[CarChromeModeCoordinator sharedInstance](CarChromeModeCoordinator, "sharedInstance"));
      -[NSObject displayIncidentReporting](v12, "displayIncidentReporting");
      goto LABEL_30;
    case 6uLL:
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController chromeViewController](self, "chromeViewController"));
      objc_msgSend(v31, "captureUserAction:onTarget:", 9022, 1021);

      v12 = objc_claimAutoreleasedReturnValue(+[CarChromeModeCoordinator sharedInstance](CarChromeModeCoordinator, "sharedInstance"));
      -[NSObject displayTripSharing](v12, "displayTripSharing");
      goto LABEL_30;
    default:
      v11 = sub_10043364C();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v36 = 134217984;
        v37 = a4;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "etaCardContent delegate didn't handle action: %ld", (uint8_t *)&v36, 0xCu);
      }
      goto LABEL_30;
  }
}

- (void)_sendOtherEVStationsRequest
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  SearchFieldItem *v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  _QWORD v15[3];
  _QWORD v16[3];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "arrivalInfo"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "destination"));
  v16[0] = &__kCFBooleanTrue;
  v15[0] = CFSTR("SearchAlongRoute");
  v15[1] = CFSTR("SARImplicitRequestMUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v4, "muid")));
  v15[2] = CFSTR("SAROtherEVStationRequest");
  v16[1] = v5;
  v16[2] = &__kCFBooleanTrue;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v16, v15, 3));

  v7 = objc_alloc_init(SearchFieldItem);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v9 = objc_msgSend(v8, "processSearchFieldItem:searchInfo:userInfo:", v7, 0, v6);

  v10 = sub_10043364C();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("SAROtherEVStationRequest")));
    v13 = 138412290;
    v14 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Tapped on other ev stations upon arriving at ev charging stations and muid: %@ is being sent in request.", (uint8_t *)&v13, 0xCu);

  }
}

- (NSString)arrivalTitle
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  double v15;
  uint64_t v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "arrivalChargingStationInfo"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v6 = objc_msgSend(v5, "isArrivedAtEVCharger");

  if (!v6)
  {
    switch(-[CarNavigationModeController navigationModeState](self, "navigationModeState"))
    {
      case 3:
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v8 = v12;
        v13 = CFSTR("Parking [Nav Tray Header]");
        goto LABEL_15;
      case 4:
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v8 = v12;
        v13 = CFSTR("Parked [Nav Tray Header]");
        goto LABEL_15;
      case 5:
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v8 = v12;
        v13 = CFSTR("Arriving [Nav Tray Header]");
        goto LABEL_15;
      case 6:
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v8 = v12;
        v13 = CFSTR("Arrived [Nav Tray Header]");
LABEL_15:
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", v13, CFSTR("localized string not found"), 0));
        goto LABEL_16;
      default:
        v11 = 0;
        goto LABEL_17;
    }
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "activeNavTrayGuidanceEvent"));

  objc_msgSend(v4, "chargingTime");
  if (v9 <= 0.0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Charged [Nav Tray Header Title]"), CFSTR("localized string not found"), 0));
LABEL_9:
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v14, v17));

    goto LABEL_10;
  }
  if (!v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Charging [Nav Tray Header Title]"), CFSTR("localized string not found"), 0));
    objc_msgSend(v4, "batteryPercentageAfterCharging");
    v17 = (uint64_t)v15;
    goto LABEL_9;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "title"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringWithDefaultOptions"));
LABEL_10:

LABEL_16:
LABEL_17:

  return (NSString *)v11;
}

- (NSString)arrivalSubtitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  int64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "arrivalInfo"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "destination"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "arrivalChargingStationInfo"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v9 = objc_msgSend(v8, "isArrivedAtEVCharger");

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "activeNavTrayGuidanceEvent"));

    objc_msgSend(v7, "chargingTime");
    if (v12 <= 0.0)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Charged [Nav Tray Header Subtitle]"), CFSTR("localized string not found"), 0));
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "stopAfterCharging"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "navDisplayName"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v16, v19));

    }
    else
    {
      if (v11)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "detail"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringWithDefaultOptions"));
LABEL_12:

        goto LABEL_13;
      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Charging [Nav Tray Header Subtitle]"), CFSTR("localized string not found"), 0));
      objc_msgSend(v7, "chargingTime");
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString _navigation_stringWithSeconds:abbreviated:](NSString, "_navigation_stringWithSeconds:abbreviated:", v22, 1));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v16, v17));
    }

    goto LABEL_12;
  }
  v15 = -[CarNavigationModeController navigationModeState](self, "navigationModeState");
  if ((unint64_t)(v15 - 5) < 2)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "route"));

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "arrivalInstructionStringForLegIndex:", objc_msgSend(v4, "legIndex")));
  }
  else if ((unint64_t)(v15 - 3) > 1)
  {
    v14 = 0;
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "parkingDisplayName"));
  }
LABEL_13:

  return (NSString *)v14;
}

- (void)waypointsOverviewControllerDidSelectAddWaypoint:(id)a3
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
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "waypointsOverviewControllerDidSelectAddWaypoint: user tapped search within waypoints overview", v8, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController chromeViewController](self, "chromeViewController"));
  objc_msgSend(v6, "captureUserAction:onTarget:", 6097, 1025);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CarChromeModeCoordinator sharedInstance](CarChromeModeCoordinator, "sharedInstance"));
  objc_msgSend(v7, "displayNavigationSearch");

}

- (void)waypointsOverviewController:(id)a3 didSelectWaypoint:(id)a4 atIndex:(unint64_t)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  unint64_t v15;

  v7 = a4;
  v8 = sub_10043364C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v12 = 138412546;
    v13 = v7;
    v14 = 2048;
    v15 = a5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "waypointsOverviewController:didSelectWaypoint:atIndex, will remove waypoint: %@, index: %ld", (uint8_t *)&v12, 0x16u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController waypointController](self, "waypointController"));
  objc_msgSend(v10, "removeWaypointAt:", a5);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController chromeViewController](self, "chromeViewController"));
  objc_msgSend(v11, "captureUserAction:onTarget:", 280, 1025);

}

- (void)_updateShareButtonContentAndVisibility:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[CarETACardViewController updateContent](self->_etaCardController, "updateContent");
  -[CarETACardViewController setSharingButtonHidden:animated:](self->_etaCardController, "setSharingButtonHidden:animated:", -[CarNavigationModeController _shouldShowShareButton](self, "_shouldShowShareButton") ^ 1, v3);
}

- (void)_updateShareETADisclosureAutoDismissTimer
{
  double Double;
  id v4;
  void *v5;
  void **v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  id location;

  Double = GEOConfigGetDouble(MapsConfig_ShareETANavigationBannerDismissInterval, off_1014B3E08);
  objc_initWeak(&location, self);
  v4 = &_dispatch_main_q;
  v6 = _NSConcreteStackBlock;
  v7 = 3221225472;
  v8 = sub_10027EEBC;
  v9 = &unk_1011AE190;
  objc_copyWeak(&v10, &location);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[GCDTimer scheduledTimerWithTimeInterval:queue:block:](GCDTimer, "scheduledTimerWithTimeInterval:queue:block:", &_dispatch_main_q, &v6, Double));
  -[CarNavigationModeController setShareEtaDisclosureAutoDismissTimer:](self, "setShareEtaDisclosureAutoDismissTimer:", v5, v6, v7, v8, v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (BOOL)_shouldShowShareButton
{
  BOOL v3;
  void *v5;
  void *v6;
  void *v7;

  if (!MSPSharedTripSharingAvailable(self, a2) || self->_forceShareButtonHidden)
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripService sharedInstance](MSPSharedTripService, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "receivers"));
  if (objc_msgSend(v6, "count"))
  {
    v3 = 1;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController shareEtaDisclosureAutoDismissTimer](self, "shareEtaDisclosureAutoDismissTimer"));
    v3 = v7 != 0;

  }
  return v3;
}

- (void)_setupGuidanceDisplays:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = (id)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController guidanceObserver](self, "guidanceObserver", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController guidanceCardController](self, "guidanceCardController"));
  objc_msgSend(v13, "addOutlet:forOwner:", v4, self);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController etaCardController](self, "etaCardController"));
  objc_msgSend(v13, "addOutlet:forOwner:", v5, self);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController guidanceCardController](self, "guidanceCardController"));
  v7 = objc_msgSend(v6, "isViewLoaded");

  if ((v7 & 1) == 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController guidanceCardController](self, "guidanceCardController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController chromeViewController](self, "chromeViewController"));
    objc_msgSend(v10, "updateCardsForContext:animated:", self, 0);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController guidanceCardController](self, "guidanceCardController"));
  objc_msgSend(v13, "repeatAllUpdatesForOutlet:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController etaCardController](self, "etaCardController"));
  objc_msgSend(v13, "repeatAllUpdatesForOutlet:", v12);

}

- (void)_toggleETACardAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  NSObject *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  unsigned int v10;
  uint64_t v11;
  _QWORD *v12;
  void *v13;
  unsigned __int8 v14;
  id v15;
  NSObject *v16;
  _BOOL4 v17;
  __CFString *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  _QWORD *v22;
  id *v23;
  id *v24;
  __CFString *v25;
  __CFString *v26;
  _QWORD v27[5];
  id v28;
  _QWORD v29[4];
  _QWORD *v30;
  id v31;
  BOOL v32;
  _QWORD v33[5];
  id v34;
  _QWORD v35[4];
  id v36;
  char v37;
  id location;
  uint8_t buf[4];
  __CFString *v40;

  v3 = a3;
  if (!-[CarNavigationModeController isTogglingETACard](self, "isTogglingETACard"))
  {
    -[CarNavigationModeController setIsTogglingETACard:](self, "setIsTogglingETACard:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController etaCardController](self, "etaCardController"));
    v10 = objc_msgSend(v9, "isExpanded");

    objc_initWeak(&location, self);
    v11 = v10 ^ 1;
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_10027F540;
    v35[3] = &unk_1011AE960;
    v37 = v10 ^ 1;
    objc_copyWeak(&v36, &location);
    v12 = objc_retainBlock(v35);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController desiredCards](self, "desiredCards"));
    v14 = objc_msgSend(v13, "containsObject:", CFSTR("ETA"));

    if ((v14 & 1) != 0)
    {
      v15 = sub_10043364C();
      v16 = objc_claimAutoreleasedReturnValue(v15);
      v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG);
      if ((v10 & 1) == 0)
      {
        if (v17)
        {
          v25 = CFSTR("NO");
          if (v3)
            v25 = CFSTR("YES");
          v26 = v25;
          *(_DWORD *)buf = 138412290;
          v40 = v26;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "_toggleETACardAnimated:%@, Will configure card then expand tray", buf, 0xCu);

        }
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController chromeViewController](self, "chromeViewController"));
        v29[0] = _NSConcreteStackBlock;
        v29[1] = 3221225472;
        v29[2] = sub_10027F5F0;
        v29[3] = &unk_1011AE9D8;
        v23 = &v31;
        objc_copyWeak(&v31, &location);
        v32 = v3;
        v30 = v12;
        objc_msgSend(v21, "updateCardsForContext:animated:completion:", self, 0, v29);
        v24 = (id *)&v30;
        goto LABEL_21;
      }
      if (v17)
      {
        v18 = CFSTR("NO");
        if (v3)
          v18 = CFSTR("YES");
        v19 = v18;
        *(_DWORD *)buf = 138412290;
        v40 = v19;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "_toggleETACardAnimated:%@, Will collapse tray then configure card", buf, 0xCu);

      }
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController guidanceCardController](self, "guidanceCardController"));
      objc_msgSend(v20, "temporarilyHideJunctionViewForSeconds:animated:", 0, 12.0);

      v21 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController etaCardController](self, "etaCardController"));
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_10027F7B4;
      v27[3] = &unk_1011AE988;
      v22 = v27;
      v23 = &v28;
      objc_copyWeak(&v28, &location);
      v27[4] = v12;
      objc_msgSend(v21, "setExpanded:animated:completion:", 0, v3, v27);
    }
    else
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController etaCardController](self, "etaCardController"));
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_10027F5A4;
      v33[3] = &unk_1011AE988;
      v22 = v33;
      v23 = &v34;
      objc_copyWeak(&v34, &location);
      v33[4] = v12;
      objc_msgSend(v21, "setExpanded:animated:completion:", v11, v3, v33);
    }
    v24 = (id *)(v22 + 4);
LABEL_21:

    objc_destroyWeak(v23);
    objc_destroyWeak(&v36);
    objc_destroyWeak(&location);
    return;
  }
  v5 = sub_10043364C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = CFSTR("NO");
    if (v3)
      v7 = CFSTR("YES");
    v8 = v7;
    *(_DWORD *)buf = 138412290;
    v40 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "_toggleETACardAnimated:%@, currently in the middle of expanding tray animation", buf, 0xCu);

  }
}

- (void)navigationService:(id)a3 didReroute:(id)a4 rerouteReason:(unint64_t)a5
{
  id v6;

  -[CarNavigationModeController setCurrentRoute:](self, "setCurrentRoute:", a4);
  -[CarNavigationModeController _captureCurrentNavigationModeState](self, "_captureCurrentNavigationModeState");
  v6 = (id)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController etaCardController](self, "etaCardController"));
  objc_msgSend(v6, "updateContent");

}

- (void)navigationService:(id)a3 didUpdateArrivalInfo:(id)a4
{
  id v5;

  -[CarNavigationModeController _captureCurrentNavigationModeState](self, "_captureCurrentNavigationModeState", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController etaCardController](self, "etaCardController"));
  objc_msgSend(v5, "updateContent");

}

- (void)navigationService:(id)a3 didUpdateTargetLegIndex:(unint64_t)a4
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController etaCardController](self, "etaCardController", a3, a4));
  objc_msgSend(v4, "updateContent");

}

- (void)navigationService:(id)a3 didResumeNavigatingFromWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5 reason:(unint64_t)a6
{
  id v7;

  -[CarNavigationModeController setNavigationModeState:](self, "setNavigationModeState:", 0, a4, a5, a6);
  v7 = (id)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController etaCardController](self, "etaCardController"));
  objc_msgSend(v7, "updateContent");

}

- (void)navigationService:(id)a3 didEnterPreArrivalStateForWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController etaCardController](self, "etaCardController", a3, a4, a5));
  objc_msgSend(v5, "updateContent");

}

- (void)navigationService:(id)a3 isApproachingEndOfLeg:(unint64_t)a4
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController etaCardController](self, "etaCardController", a3, a4));
  objc_msgSend(v4, "updateContent");

}

- (void)navigationService:(id)a3 didEnableGuidancePrompts:(BOOL)a4
{
  id v5;

  if (!a4)
    objc_msgSend(a3, "stopCurrentGuidancePrompt");
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController etaCardController](self, "etaCardController", a3));
  objc_msgSend(v5, "updateContent");

}

- (void)navigationService:(id)a3 didChangeVoiceGuidanceLevel:(unint64_t)a4
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController etaCardController](self, "etaCardController", a3, a4));
  objc_msgSend(v4, "updateContent");

}

- (void)navigationService:(id)a3 didUpdateNavTrayGuidance:(id)a4
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController etaCardController](self, "etaCardController", a3, a4));
  objc_msgSend(v4, "updateContent");

}

- (void)navigationService:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  if (MNNavigationServiceStateChangedToNavigating(a4, a5, v8))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "route"));
    -[CarNavigationModeController setCurrentRoute:](self, "setCurrentRoute:", v9);

  }
}

- (void)navigationService:(id)a3 showJunctionView:(id)a4
{
  self->_forceShareButtonHidden = 1;
  -[CarNavigationModeController _updateShareButtonContentAndVisibility:](self, "_updateShareButtonContentAndVisibility:", 1, a4);
  -[CarNavigationModeController setShowingJunctionView:](self, "setShowingJunctionView:", 1);
}

- (void)navigationService:(id)a3 hideJunctionViewForId:(id)a4
{
  self->_forceShareButtonHidden = 0;
  -[CarNavigationModeController _updateShareButtonContentAndVisibility:](self, "_updateShareButtonContentAndVisibility:", 1, a4);
  -[CarNavigationModeController setShowingJunctionView:](self, "setShowingJunctionView:", 0);
}

- (void)navigationService:(id)a3 didUpdateMatchedLocation:(id)a4
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController etaCardController](self, "etaCardController", a3, a4));
  objc_msgSend(v4, "updateContent");

}

- (void)navigationService:(id)a3 didReceiveTrafficIncidentAlert:(id)a4 responseCallback:(id)a5
{
  id v7;
  id v8;
  CarTrafficAlertCardViewController *v9;
  void *v10;
  void *v11;
  id v12;

  v7 = a5;
  v8 = a4;
  v9 = -[CarTrafficAlertCardViewController initWithDelegate:trafficAlert:response:]([CarTrafficAlertCardViewController alloc], "initWithDelegate:trafficAlert:response:", self, v8, v7);

  -[CarNavigationModeController setTrafficAlertCardController:](self, "setTrafficAlertCardController:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController carChromeViewController](self, "carChromeViewController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "navigationDisplay"));
  objc_msgSend(v11, "setTrafficAlert:", v8);

  v12 = (id)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController chromeViewController](self, "chromeViewController"));
  objc_msgSend(v12, "updateCardsForContext:animated:", self, 1);

}

- (void)navigationService:(id)a3 didUpdateTrafficIncidentAlert:(id)a4
{
  id v5;
  NSMutableSet *invalidatedAlertIds;
  void *v7;
  void *v8;
  CarTrafficAlertCardViewController *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v5 = a4;
  invalidatedAlertIds = self->_invalidatedAlertIds;
  v14 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "alertID"));
  LOBYTE(invalidatedAlertIds) = -[NSMutableSet containsObject:](invalidatedAlertIds, "containsObject:", v7);

  if ((invalidatedAlertIds & 1) == 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController trafficAlertCardController](self, "trafficAlertCardController"));

    if (!v8)
    {
      v9 = -[CarTrafficAlertCardViewController initWithDelegate:trafficAlert:response:]([CarTrafficAlertCardViewController alloc], "initWithDelegate:trafficAlert:response:", self, v14, 0);
      -[CarNavigationModeController setTrafficAlertCardController:](self, "setTrafficAlertCardController:", v9);

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController chromeViewController](self, "chromeViewController"));
      objc_msgSend(v10, "updateCardsForContext:animated:", self, 1);

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController trafficAlertCardController](self, "trafficAlertCardController"));
    objc_msgSend(v11, "updateFromTrafficAlert:", v14);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController carChromeViewController](self, "carChromeViewController"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "navigationDisplay"));
    objc_msgSend(v13, "setTrafficAlert:", v14);

  }
}

- (void)navigationService:(id)a3 didInvalidateTrafficIncidentAlert:(id)a4
{
  NSMutableSet *invalidatedAlertIds;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  invalidatedAlertIds = self->_invalidatedAlertIds;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "alertID", a3));
  -[NSMutableSet addObject:](invalidatedAlertIds, "addObject:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController trafficAlertCardController](self, "trafficAlertCardController"));
  if (v7)
  {
    -[CarNavigationModeController setTrafficAlertCardController:](self, "setTrafficAlertCardController:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController chromeViewController](self, "chromeViewController"));
    objc_msgSend(v8, "updateCardsForContext:animated:", self, 1);

  }
  v10 = (id)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController carChromeViewController](self, "carChromeViewController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "navigationDisplay"));
  objc_msgSend(v9, "setTrafficAlert:", 0);

}

- (void)trafficAlertCardViewControllerDismiss:(id)a3
{
  NSMutableSet *invalidatedAlertIds;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;

  invalidatedAlertIds = self->_invalidatedAlertIds;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "trafficAlert"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "alertID"));
  -[NSMutableSet addObject:](invalidatedAlertIds, "addObject:", v7);

  v15 = CFSTR("kCarTrafficAlertIdKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "trafficAlert"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "alertID"));
  v16 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v11, "postNotificationName:object:userInfo:", CFSTR("CarTrafficAlertDidChangeVisibility"), 0, v10);

  -[CarNavigationModeController setTrafficAlertCardController:](self, "setTrafficAlertCardController:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController carChromeViewController](self, "carChromeViewController"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "navigationDisplay"));
  objc_msgSend(v13, "setTrafficAlert:", 0);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController chromeViewController](self, "chromeViewController"));
  objc_msgSend(v14, "updateCardsForContext:animated:", self, 1);

}

- (void)sharedTripServiceDidUpdateSendingAvailability:(id)a3
{
  -[CarNavigationModeController _updateShareButtonContentAndVisibility:](self, "_updateShareButtonContentAndVisibility:", 1);
}

- (void)sharedTripService:(id)a3 didUpdateReceivers:(id)a4
{
  id v5;
  unsigned int v6;
  id v7;
  void *v8;
  unsigned int v9;
  id v10;

  v5 = a4;
  v6 = -[CarNavigationModeController _shouldShowShareButton](self, "_shouldShowShareButton");
  v7 = objc_msgSend(v5, "count");

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController etaCardController](self, "etaCardController"));
    v9 = objc_msgSend(v8, "isShowingShareETASuggestion");

    if (v9)
      -[CarNavigationModeController _updateShareETADisclosureAutoDismissTimer](self, "_updateShareETADisclosureAutoDismissTimer");
    else
      -[CarNavigationModeController setShareEtaDisclosureAutoDismissTimer:](self, "setShareEtaDisclosureAutoDismissTimer:", 0);
  }
  -[CarNavigationModeController _updateShareButtonContentAndVisibility:](self, "_updateShareButtonContentAndVisibility:", v6 ^ 1);
  v10 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication _maps_keyMapsSceneDelegate](UIApplication, "_maps_keyMapsSceneDelegate"));
  objc_msgSend(v10, "setNeedsUserActivityUpdate");

}

- (void)sharedTripService:(id)a3 sharingDidInvalidateWithError:(id)a4
{
  -[CarNavigationModeController _updateShareButtonContentAndVisibility:](self, "_updateShareButtonContentAndVisibility:", 1, a4);
}

- (void)sharedTripService:(id)a3 didUpdateSharingIdentity:(id)a4
{
  -[CarNavigationModeController _updateShareButtonContentAndVisibility:](self, "_updateShareButtonContentAndVisibility:", 1, a4);
}

- (void)_loadCompressionTestCardWithHeight:(double)a3 priority:(float)a4
{
  CarCompressionTestCardViewController *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  id v12;

  v7 = objc_alloc_init(CarCompressionTestCardViewController);
  -[CarNavigationModeController setCompressionTestCardController:](self, "setCompressionTestCardController:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController compressionTestCardController](self, "compressionTestCardController"));
  objc_msgSend(v8, "setDelegate:", self);

  if (a3 >= 0.0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController compressionTestCardController](self, "compressionTestCardController"));
    objc_msgSend(v9, "setSpacerHeight:", a3);

  }
  if (a4 >= 0.0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController compressionTestCardController](self, "compressionTestCardController"));
    *(float *)&v11 = a4;
    objc_msgSend(v10, "setSpacerPriority:", v11);

  }
  v12 = (id)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController chromeViewController](self, "chromeViewController"));
  objc_msgSend(v12, "updateCardsForContext:animated:", self, 1);

}

- (void)compressionTestCard:(id)a3 reloadWithSpacerHeight:(double)a4 priority:(float)a5
{
  void *v8;
  dispatch_time_t v9;
  _QWORD block[6];
  float v11;

  -[CarNavigationModeController setCompressionTestCardController:](self, "setCompressionTestCardController:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController chromeViewController](self, "chromeViewController"));
  objc_msgSend(v8, "updateCardsForContext:animated:", self, 1);

  v9 = dispatch_time(0, 2000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002801A4;
  block[3] = &unk_1011AEA00;
  block[4] = self;
  *(double *)&block[5] = a4;
  v11 = a5;
  dispatch_after(v9, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)compressionTestCardRequestsDismiss:(id)a3
{
  id v4;

  -[CarNavigationModeController setCompressionTestCardController:](self, "setCompressionTestCardController:", 0);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController chromeViewController](self, "chromeViewController"));
  objc_msgSend(v4, "updateCardsForContext:animated:", self, 1);

}

- (NSArray)preferredCarFocusEnvironments
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  _QWORD v11[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController trafficAlertCardController](self, "trafficAlertCardController"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController trafficAlertCardController](self, "trafficAlertCardController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[CarFocusOrderEnvironment environmentWithFocusEnvironment:](CarFocusOrderEnvironment, "environmentWithFocusEnvironment:", v4));
    v11[0] = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController etaCardController](self, "etaCardController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CarFocusOrderEnvironment environmentWithFocusEnvironment:](CarFocusOrderEnvironment, "environmentWithFocusEnvironment:", v6));
    v11[1] = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, 2));

  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController etaCardController](self, "etaCardController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[CarFocusOrderEnvironment environmentWithFocusEnvironment:](CarFocusOrderEnvironment, "environmentWithFocusEnvironment:", v4));
    v10 = v5;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));
  }

  return (NSArray *)v8;
}

- (NSArray)carFocusOrderSequences
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
  void *v14;
  _QWORD v15[4];
  void *v16;

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController chromeViewController](self, "chromeViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "itemRepresentingStatusBanner"));
  v15[0] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController chromeViewController](self, "chromeViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "itemRepresentingOverlays"));
  v15[1] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController chromeViewController](self, "chromeViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "itemRepresentingAlternateRoutes"));
  v15[2] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController chromeViewController](self, "chromeViewController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "itemRepresentingMapControls"));
  v15[3] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v15, 4));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[CarFocusOrderSequence sequenceWithItems:options:](CarFocusOrderSequence, "sequenceWithItems:options:", v10, 5));
  v16 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v16, 1));

  return (NSArray *)v12;
}

- (void)chromeNavigationDisplay:(id)a3 configurationDidChange:(id)a4
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController carChromeViewController](self, "carChromeViewController", a3, a4));
  objc_msgSend(v4, "setNeedsUpdateComponent:animated:", CFSTR("mapcontrols"), 1);

}

- (void)chromeNavigationDisplay:(id)a3 userDidTapMap:(id)a4 atPoint:(CGPoint)a5
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController guidanceCardController](self, "guidanceCardController", a3, a4, a5.x, a5.y));
  objc_msgSend(v5, "temporarilyHideJunctionViewForSeconds:animated:", 0, 12.0);

}

- (void)carChromeNavigationCameraStyleManager:(id)a3 didChangeCenterConsoleCameraStyle:(int64_t)a4
{
  -[CarNavigationModeController setCameraStyle:animated:](self, "setCameraStyle:animated:", a4, 1);
}

- (int)currentUsageTarget
{
  return 1001;
}

- (void)carShareETAInfoViewDidChangeShareETASuggestionVisibilityNotification:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController carChromeViewController](self, "carChromeViewController", a3));
  objc_msgSend(v4, "updateCardsForContext:animated:completion:", self, 1, 0);

  v5 = (id)objc_claimAutoreleasedReturnValue(-[CarNavigationModeController carChromeViewController](self, "carChromeViewController"));
  objc_msgSend(v5, "updateComponentsIfNeeded");

}

- (void)_maneuverBannerViewEVStationsNotification:(id)a3
{
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100280630;
  v3[3] = &unk_1011AD260;
  objc_copyWeak(&v4, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (ChromeViewController)chromeViewController
{
  return (ChromeViewController *)objc_loadWeakRetained((id *)&self->_chromeViewController);
}

- (void)setChromeViewController:(id)a3
{
  objc_storeWeak((id *)&self->_chromeViewController, a3);
}

- (int64_t)cameraStyle
{
  return self->_cameraStyle;
}

- (int64_t)navigationModeState
{
  return self->_navigationModeState;
}

- (void)setGuidanceCardController:(id)a3
{
  objc_storeStrong((id *)&self->_guidanceCardController, a3);
}

- (void)setEtaCardController:(id)a3
{
  objc_storeStrong((id *)&self->_etaCardController, a3);
}

- (void)setWaypointsOverviewCardController:(id)a3
{
  objc_storeStrong((id *)&self->_waypointsOverviewCardController, a3);
}

- (CarTrafficAlertCardViewController)trafficAlertCardController
{
  return self->_trafficAlertCardController;
}

- (CarCompressionTestCardViewController)compressionTestCardController
{
  return self->_compressionTestCardController;
}

- (void)setCompressionTestCardController:(id)a3
{
  objc_storeStrong((id *)&self->_compressionTestCardController, a3);
}

- (GEOComposedRoute)currentRoute
{
  return self->_currentRoute;
}

- (BOOL)isTogglingETACard
{
  return self->_isTogglingETACard;
}

- (void)setIsTogglingETACard:(BOOL)a3
{
  self->_isTogglingETACard = a3;
}

- (BOOL)isShowingJunctionView
{
  return self->_showingJunctionView;
}

- (void)setAudioPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_audioPreferences, a3);
}

- (CarChromeNavigationCameraStyleManager)cameraStyleManager
{
  return self->_cameraStyleManager;
}

- (void)setCameraStyleManager:(id)a3
{
  objc_storeStrong((id *)&self->_cameraStyleManager, a3);
}

- (GCDTimer)shareEtaDisclosureAutoDismissTimer
{
  return self->_shareEtaDisclosureAutoDismissTimer;
}

- (void)setShareEtaDisclosureAutoDismissTimer:(id)a3
{
  objc_storeStrong((id *)&self->_shareEtaDisclosureAutoDismissTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareEtaDisclosureAutoDismissTimer, 0);
  objc_storeStrong((id *)&self->_cameraStyleManager, 0);
  objc_storeStrong((id *)&self->_audioPreferences, 0);
  objc_storeStrong((id *)&self->_currentRoute, 0);
  objc_storeStrong((id *)&self->_compressionTestCardController, 0);
  objc_storeStrong((id *)&self->_trafficAlertCardController, 0);
  objc_storeStrong((id *)&self->_waypointsOverviewCardController, 0);
  objc_storeStrong((id *)&self->_etaCardController, 0);
  objc_storeStrong((id *)&self->_guidanceCardController, 0);
  objc_destroyWeak((id *)&self->_chromeViewController);
  objc_storeStrong((id *)&self->_previousGuidanceCardSignAudioSetting, 0);
  objc_storeStrong((id *)&self->_invalidatedAlertIds, 0);
}

@end
