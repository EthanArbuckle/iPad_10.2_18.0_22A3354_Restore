@implementation CarChromeViewController

+ (void)initialize
{
  void *v3;
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___CarChromeViewController;
  objc_msgSendSuper2(&v4, "initialize");
  if ((id)objc_opt_class(CarChromeViewController) == a1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v3, "registerDefaults:", &off_101274458);

  }
}

+ (id)localizedLocationAuthorizationTitle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("%@ not available [CarPlay]"), CFSTR("localized string not found"), 0));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForInfoDictionaryKey:", CFSTR("CFBundleDisplayName")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v3, v5));

  return v6;
}

+ (id)localizedLocationAuthorizationMessage
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForInfoDictionaryKey:", CFSTR("CFBundleDisplayName")));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("To use %@ in CarPlay, allow %@ to use your location on your iPhone. [CarPlay]"), CFSTR("localized string not found"), 0));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v3, v3));
  return v6;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  const char *label;
  const char *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  const char *v12;
  const char *v13;
  id v14;
  NSObject *v15;
  CarChromeViewController *v16;
  objc_super v17;
  uint8_t buf[4];
  CarChromeViewController *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  const char *v29;

  v3 = sub_10043364C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v19 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%p] Deallocating", buf, 0xCu);
  }

  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v6 = dispatch_queue_get_label(0);
  if (label != v6 && (!label || !v6 || strcmp(label, v6)))
  {
    v10 = sub_1004318FC();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
      v13 = dispatch_queue_get_label(0);
      *(_DWORD *)buf = 136316418;
      v19 = (CarChromeViewController *)"-[CarChromeViewController dealloc]";
      v20 = 2080;
      v21 = "CarChromeViewController.m";
      v22 = 1024;
      v23 = 290;
      v24 = 2080;
      v25 = "dispatch_get_main_queue()";
      v26 = 2080;
      v27 = v12;
      v28 = 2080;
      v29 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
        buf,
        0x3Au);

    }
    if (sub_100A70734())
    {
      v14 = sub_1004318FC();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = (CarChromeViewController *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v19 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v7, "removeObserver:", self);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "routeGeniusManager"));
  objc_msgSend(v9, "deactivateForChrome:", self);

  v17.receiver = self;
  v17.super_class = (Class)CarChromeViewController;
  -[ChromeViewController dealloc](&v17, "dealloc");
}

- (CarChromeViewController)initWithCarSceneType:(int64_t)a3
{
  const char *label;
  const char *v6;
  BOOL v7;
  CarChromeViewController *v8;
  id v9;
  NSObject *v10;
  const __CFString *v11;
  MapsTokenStorage *v12;
  MapsTokenStorage *forcedAutohideTokens;
  MapsTokenStorage *v14;
  MapsTokenStorage *modernMapTokens;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v21;
  NSObject *v22;
  id v23;
  NSObject *v24;
  char *v25;
  objc_super v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  const char *v38;

  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v6 = dispatch_queue_get_label(0);
  if (label != v6)
  {
    v7 = !label || v6 == 0;
    if (v7 || strcmp(label, v6))
    {
      v21 = sub_1004318FC();
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        v28 = "-[CarChromeViewController initWithCarSceneType:]";
        v29 = 2080;
        v30 = "CarChromeViewController.m";
        v31 = 1024;
        v32 = 298;
        v33 = 2080;
        v34 = "dispatch_get_main_queue()";
        v35 = 2080;
        v36 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v37 = 2080;
        v38 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          buf,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v23 = sub_1004318FC();
        v24 = objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          v25 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          *(_DWORD *)buf = 138412290;
          v28 = v25;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

        }
      }
    }
  }
  v26.receiver = self;
  v26.super_class = (Class)CarChromeViewController;
  v8 = -[ChromeViewController init](&v26, "init");
  if (v8)
  {
    v9 = sub_10043364C();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      if ((unint64_t)a3 > 7)
        v11 = CFSTR(".Unknown");
      else
        v11 = off_1011AD748[a3];
      *(_DWORD *)buf = 134349314;
      v28 = (const char *)v8;
      v29 = 2114;
      v30 = (const char *)v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[%{public}p] initialising with sceneType: %{public}@", buf, 0x16u);
    }

    v8->_sceneType = a3;
    v12 = -[MapsTokenStorage initWithDelegate:tokenGroupName:callbackQueue:]([MapsTokenStorage alloc], "initWithDelegate:tokenGroupName:callbackQueue:", v8, CFSTR("CarForcedAutohideBehaviorTokenGroup"), &_dispatch_main_q);
    forcedAutohideTokens = v8->_forcedAutohideTokens;
    v8->_forcedAutohideTokens = v12;

    v14 = -[MapsTokenStorage initWithDelegate:tokenGroupName:callbackQueue:]([MapsTokenStorage alloc], "initWithDelegate:tokenGroupName:callbackQueue:", v8, CFSTR("CarChromeModernMap"), &_dispatch_main_q);
    modernMapTokens = v8->_modernMapTokens;
    v8->_modernMapTokens = v14;

    v8->_mapViewRegionIsChanging = 0;
    v8->_ownsFocus = 1;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v16, "addObserver:selector:name:object:", v8, "_carExternalDeviceStateUpdated:", CFSTR("MapsExternalDeviceUpdated"), 0);

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v17, "addObserver:selector:name:object:", v8, "_carOneHandedZoomSettingUpdated:", CFSTR("CarPlayOneHandedZoomingSettingDidChangeNotification"), 0);

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v18, "addObserver:selector:name:object:", v8, "_carPlayWindowMapStyleDidChange:", CRSUIWindowMapStyleChangedNotification, 0);

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v19, "addObserver:selector:name:object:", v8, "offlineStateChanged:", GEOOfflineStateChangedNotification, 0);

  }
  return v8;
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  MapsLightLevelController *v7;
  void *v8;
  MapsLightLevelController *v9;
  MapsLightLevelController *lightLevelController;
  objc_super v11;

  v4 = a4;
  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CarChromeViewController;
  -[CarChromeViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v11, "viewDidMoveToWindow:shouldAppearOrDisappear:", v6, v4);
  if (v6)
  {
    v7 = [MapsLightLevelController alloc];
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "windowScene"));
    v9 = -[MapsLightLevelController initWithWindowScene:](v7, "initWithWindowScene:", v8);
    lightLevelController = self->_lightLevelController;
    self->_lightLevelController = v9;

    -[MapsLightLevelController addObserver:](self->_lightLevelController, "addObserver:", self);
    if ((id)-[CarChromeViewController sceneType](self, "sceneType") == (id)7)
    {
      -[ChromeViewController setNeedsUpdateComponent:animated:](self, "setNeedsUpdateComponent:animated:", CFSTR("cards"), 0);
      -[ChromeViewController setNeedsUpdateComponent:animated:](self, "setNeedsUpdateComponent:animated:", CFSTR("accessories"), 0);
      -[ChromeViewController updateComponentsIfNeeded](self, "updateComponentsIfNeeded");
    }
  }

}

- (id)currentTraits
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  ClientTypeResolver *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapViewEnteredForegroundDate](self, "mapViewEnteredForegroundDate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController lastMapViewportChangedDate](self, "lastMapViewportChangedDate"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapsDefaultTraitsForMapView:mapViewEnteredForegroundDate:mapViewportChangedDate:directionsType:includeCarPlayInfo:", v5, v6, v7, 1, 1));

    v9 = -[ClientTypeResolver initWithCurrentLocation:parkedCar:personalizedItems:]([ClientTypeResolver alloc], "initWithCurrentLocation:parkedCar:personalizedItems:", 1, 0, 1);
    +[GEOMapServiceTraits addCommonKnownClientResolvedTypesIfAvailableWithClientTypeResolver:toTraits:](GEOMapServiceTraits, "addCommonKnownClientResolvedTypesIfAvailableWithClientTypeResolver:toTraits:", v9, v8);

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (void)didSuppress
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  UILayoutGuide *notificationLayoutGuide;
  CarAlertViewController *currentAlertViewController;
  CarChromeViewController *v13;
  objc_super v14;
  uint8_t buf[4];
  CarChromeViewController *v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, MKLocationManagerApprovalDidChangeNotification, 0);
  v4 = sub_1004336BC();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v16 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] is suppressing. Will deactivate RG for chrome.", buf, 0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "routeGeniusManager"));
  objc_msgSend(v7, "deactivateForChrome:", self);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController navigationDisplay](self, "navigationDisplay"));
  objc_msgSend(v8, "setSuppressed:", 1);

  -[CarChromeViewController disableDoubleTapRecognizer](self, "disableDoubleTapRecognizer");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController nudgerizer](self, "nudgerizer"));
  objc_msgSend(v9, "setActive:", 0);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController cardsOverlay](self, "cardsOverlay"));
  objc_msgSend(v10, "reset");

  notificationLayoutGuide = self->_notificationLayoutGuide;
  self->_notificationLayoutGuide = 0;

  currentAlertViewController = self->_currentAlertViewController;
  if (currentAlertViewController)
  {
    v13 = (CarChromeViewController *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController presentingViewController](currentAlertViewController, "presentingViewController"));

    if (v13 == self)
      -[CarChromeViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 0, 0);
  }
  v14.receiver = self;
  v14.super_class = (Class)CarChromeViewController;
  -[ChromeViewController didSuppress](&v14, "didSuppress");

}

- (void)didUnsuppress
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  char isKindOfClass;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  CarAlertViewController *currentAlertViewController;
  CarChromeViewController *v17;
  objc_super v18;
  uint8_t buf[4];
  CarChromeViewController *v20;

  v18.receiver = self;
  v18.super_class = (Class)CarChromeViewController;
  -[ChromeViewController didUnsuppress](&v18, "didUnsuppress");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
  v4 = objc_opt_class(CarBasicMapBrowsingModeController);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {

  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
    v6 = objc_opt_class(CarBasicRouteGeniusModeController);
    isKindOfClass = objc_opt_isKindOfClass(v5, v6);

    if ((isKindOfClass & 1) == 0)
      goto LABEL_7;
  }
  v8 = sub_1004336BC();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v20 = self;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{public}p] is unsuppressing. Will try to activate RG for chrome.", buf, 0xCu);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "routeGeniusManager"));
  objc_msgSend(v11, "activateIfPossibleForChrome:", self);

LABEL_7:
  -[ChromeViewController setNeedsUpdateComponent:animated:](self, "setNeedsUpdateComponent:animated:", CFSTR("mapcontrols"), 0);
  -[ChromeViewController setNeedsUpdateComponent:animated:](self, "setNeedsUpdateComponent:animated:", CFSTR("accessories"), 0);
  -[ChromeViewController setNeedsUpdateComponent:animated:](self, "setNeedsUpdateComponent:animated:", CFSTR("statusBanner"), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  v13 = objc_msgSend(v12, "isLocationServicesAuthorizationNeeded");

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v14, "addObserver:selector:name:object:", self, "_locationAuthorizationDidChange:", MKLocationManagerApprovalDidChangeNotification, 0);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
  -[CarChromeViewController updateCardsForContext:animated:completion:](self, "updateCardsForContext:animated:completion:", v15, 0, 0);

  -[ChromeViewController setNeedsUpdateComponent:animated:](self, "setNeedsUpdateComponent:animated:", CFSTR("navigationDisplay"), 0);
  currentAlertViewController = self->_currentAlertViewController;
  if (currentAlertViewController)
  {
    v17 = (CarChromeViewController *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController presentingViewController](currentAlertViewController, "presentingViewController"));

    if (v17 != self)
      -[CarChromeViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", self->_currentAlertViewController, 0, 0);
  }
  -[CarChromeViewController _updateNudgerizer](self, "_updateNudgerizer");
  -[CarChromeViewController _updateRouteSelectionController](self, "_updateRouteSelectionController");
  -[ChromeViewController updateMapViewFrameRate](self, "updateMapViewFrameRate");
}

- (void)deactivationReasonsDidChange
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CarChromeViewController;
  -[ChromeViewController deactivationReasonsDidChange](&v7, "deactivationReasonsDidChange");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController currentMapReplacementView](self, "currentMapReplacementView"));
  if (v3)
  {
    v4 = objc_opt_class(CarMapReplacementView);
    if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    {
      v5 = v3;
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController deactivationReasons](self, "deactivationReasons"));
      objc_msgSend(v5, "setReasonStrings:", v6);

    }
  }

}

- (void)didBecomeInactive:(BOOL)a3
{
  void *v5;
  id v6;
  NSObject *v7;
  CarChromeViewController *v8;
  CarChromeViewController *v9;
  objc_class *v10;
  NSString *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  objc_super v16;
  uint8_t buf[4];
  __CFString *v18;

  v16.receiver = self;
  v16.super_class = (Class)CarChromeViewController;
  -[ChromeViewController didBecomeInactive:](&v16, "didBecomeInactive:");
  if (!a3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController navigationDisplay](self, "navigationDisplay"));
    objc_msgSend(v5, "setTemporaryDisplayRate:forDuration:", -1, -1.0);

    v6 = sub_100432D1C();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
LABEL_12:

      -[MapsLightLevelController reloadForChangedLightLevelTrackers](self->_lightLevelController, "reloadForChangedLightLevelTrackers");
      return;
    }
    v8 = self;
    v9 = v8;
    if (!v8)
    {
      v15 = CFSTR("<nil>");
      goto LABEL_11;
    }
    v10 = (objc_class *)objc_opt_class(v8);
    v11 = NSStringFromClass(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    if ((objc_opt_respondsToSelector(v9, "accessibilityIdentifier") & 1) != 0)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController performSelector:](v9, "performSelector:", "accessibilityIdentifier"));
      v14 = v13;
      if (v13 && !objc_msgSend(v13, "isEqualToString:", v12))
      {
        v15 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v12, v9, v14));

        goto LABEL_9;
      }

    }
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v12, v9));
LABEL_9:

LABEL_11:
    *(_DWORD *)buf = 138543362;
    v18 = v15;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}@] Force updating light level as the map view is no longer inactive", buf, 0xCu);

    goto LABEL_12;
  }
}

- (BOOL)removesMapViewWhenInactive
{
  return GEOConfigGetBOOL(MapsConfig_CarPlayRemovesMapViewWhenInactive, off_1014B5168);
}

- (id)createMapView
{
  int64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v3 = -[CarChromeViewController sceneType](self, "sceneType");
  if ((unint64_t)(v3 - 1) > 6)
    v4 = 0;
  else
    v4 = qword_100E34848[v3 - 1];
  v5 = objc_alloc((Class)MKMapView);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController view](self, "view"));
  objc_msgSend(v6, "bounds");
  v7 = objc_msgSend(v5, "_initWithFrame:gestureRecognizerHostView:showsAttribution:showsAppleLogo:allowsAntialiasing:carDisplayType:", 0, 0, 0, 1, v4);

  return v7;
}

- (id)createMapReplacementView
{
  void *v3;
  int BOOL;
  CarMapReplacementView *v5;
  CarMapReplacementView *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  objc_class *v13;
  NSString *v14;
  void *v15;
  void *v16;

  if ((-[CarChromeViewController sceneType](self, "sceneType") & 0xFFFFFFFFFFFFFFFCLL) != 4)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[MapsExternalDevice sharedInstance](MapsExternalDevice, "sharedInstance"));
    if ((objc_msgSend(v3, "ownsScreen") & 1) != 0)
    {
      BOOL = GEOConfigGetBOOL(MapsConfig_CarPlayAllowActiveChromeWithoutScreenOwnership, off_1014B4AF8);

      if (!BOOL)
      {
        v5 = 0;
        return v5;
      }
    }
    else
    {

    }
  }
  v6 = [CarMapReplacementView alloc];
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController view](self, "view"));
  objc_msgSend(v7, "bounds");
  v5 = -[CarMapReplacementView initWithFrame:](v6, "initWithFrame:");

  -[CarMapReplacementView setUserInteractionEnabled:](v5, "setUserInteractionEnabled:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController deactivationReasons](self, "deactivationReasons"));
  -[CarMapReplacementView setReasonStrings:](v5, "setReasonStrings:", v8);

  if (+[CarDisplayController debugLaunchPerformance](CarDisplayController, "debugLaunchPerformance"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemDarkBlueColor](UIColor, "systemDarkBlueColor"));
    -[CarMapReplacementView setBackgroundColor:](v5, "setBackgroundColor:", v9);

    v10 = objc_claimAutoreleasedReturnValue(+[UIColor systemCyanColor](UIColor, "systemCyanColor"));
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController mapReplacementColor](self, "mapReplacementColor"));
    -[CarMapReplacementView setBackgroundColor:](v5, "setBackgroundColor:", v11);

    v10 = objc_claimAutoreleasedReturnValue(+[UIColor colorWithDynamicProvider:](UIColor, "colorWithDynamicProvider:", &stru_1011AD3E8));
  }
  v12 = (void *)v10;
  -[CarMapReplacementView setTextColor:](v5, "setTextColor:", v10);

  v13 = (objc_class *)objc_opt_class(self);
  v14 = NSStringFromClass(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.mapReplacementView"), v15));
  -[CarMapReplacementView setAccessibilityIdentifier:](v5, "setAccessibilityIdentifier:", v16);

  return v5;
}

- (CarRouteGeniusAnnotationsManager)routeGeniusAnnotationsManager
{
  CarRouteGeniusAnnotationsManager *routeGeniusAnnotationsManager;
  CarRouteGeniusAnnotationsManager *v4;
  CarRouteGeniusAnnotationsManager *v5;

  routeGeniusAnnotationsManager = self->_routeGeniusAnnotationsManager;
  if (!routeGeniusAnnotationsManager)
  {
    v4 = -[CarRouteGeniusAnnotationsManager initWithChromeViewController:]([CarRouteGeniusAnnotationsManager alloc], "initWithChromeViewController:", self);
    v5 = self->_routeGeniusAnnotationsManager;
    self->_routeGeniusAnnotationsManager = v4;

    routeGeniusAnnotationsManager = self->_routeGeniusAnnotationsManager;
  }
  return routeGeniusAnnotationsManager;
}

- (CarMapNudgerizer)nudgerizer
{
  CarMapNudgerizer *nudgerizer;
  CarMapNudgerizer *v4;
  CarMapNudgerizer *v5;
  void *v6;

  nudgerizer = self->_nudgerizer;
  if (!nudgerizer)
  {
    v4 = objc_alloc_init(CarMapNudgerizer);
    v5 = self->_nudgerizer;
    self->_nudgerizer = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
    -[CarMapNudgerizer setMapView:](self->_nudgerizer, "setMapView:", v6);

    nudgerizer = self->_nudgerizer;
  }
  return nudgerizer;
}

- (MapViewResponder)mapViewResponder
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

- (CarRouteSelectionController)routeSelectionController
{
  CarRouteSelectionController *routeSelectionController;
  void *v4;
  void *v5;
  CarRouteSelectionController *v6;
  CarRouteSelectionController *v7;
  void *v8;

  routeSelectionController = self->_routeSelectionController;
  if (!routeSelectionController)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "platformController"));

    v6 = -[CarRouteSelectionController initWithPlatformController:chromeViewController:]([CarRouteSelectionController alloc], "initWithPlatformController:chromeViewController:", v5, self);
    v7 = self->_routeSelectionController;
    self->_routeSelectionController = v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
    -[CarRouteSelectionController setMapView:](self->_routeSelectionController, "setMapView:", v8);

    routeSelectionController = self->_routeSelectionController;
  }
  return routeSelectionController;
}

- (ChromeMapSettings)defaultMapSettings
{
  ChromeMapSettings *defaultMapSettings;
  ChromeMapSettings *v4;
  ChromeMapSettings *v5;
  void *v6;

  defaultMapSettings = self->_defaultMapSettings;
  if (!defaultMapSettings)
  {
    v4 = -[ChromeMapSettings initWithType:userInterfaceIdiom:]([ChromeMapSettings alloc], "initWithType:userInterfaceIdiom:", 1, 3);
    v5 = self->_defaultMapSettings;
    self->_defaultMapSettings = v4;

    -[ChromeMapSettings setDelegate:](self->_defaultMapSettings, "setDelegate:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
    -[ChromeMapSettings setMapView:](self->_defaultMapSettings, "setMapView:", v6);

    defaultMapSettings = self->_defaultMapSettings;
  }
  return defaultMapSettings;
}

- (ChromeMapSettings)transientMapSettings
{
  ChromeMapSettings *v3;
  void *v4;

  v3 = -[ChromeMapSettings initWithType:userInterfaceIdiom:]([ChromeMapSettings alloc], "initWithType:userInterfaceIdiom:", 0, 3);
  -[ChromeMapSettings setDelegate:](v3, "setDelegate:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
  -[ChromeMapSettings setMapView:](v3, "setMapView:", v4);

  return v3;
}

- (void)loadView
{
  CarChromeContainingView *v3;
  void *v4;
  id v5;

  v3 = -[CarChromeContainingView initWithFrame:]([CarChromeContainingView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[CarChromeViewController setView:](self, "setView:", v3);

  v5 = (id)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController view](self, "view"));
  objc_msgSend(v4, "setBackgroundColor:", v5);

}

- (id)mapReplacementColor
{
  return +[UIColor colorWithDynamicProvider:](UIColor, "colorWithDynamicProvider:", &stru_1011AD408);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  UILayoutGuide *v11;
  UILayoutGuide *cardsLayoutGuide;
  objc_class *v13;
  NSString *v14;
  void *v15;
  void *v16;
  void *v17;
  UILayoutGuide *v18;
  UILayoutGuide *statusBannerLayoutGuide;
  objc_class *v20;
  NSString *v21;
  void *v22;
  void *v23;
  void *v24;
  UILayoutGuide *v25;
  UILayoutGuide *accessoriesCompactLayoutGuide;
  objc_class *v27;
  NSString *v28;
  void *v29;
  void *v30;
  void *v31;
  CarCardsOverlay *v32;
  void *v33;
  CarStatusBannerOverlay *v34;
  void *v35;
  CarAccessoriesOverlay *v36;
  void *v37;
  void *v38;
  int64_t v39;
  CarMapControlsOverlay *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NSLayoutConstraint *v46;
  NSLayoutConstraint *headingUpMapInsetAdjustmentConstraint;
  CarFocusContainerGuideController *v48;
  void *v49;
  CarFocusContainerGuideController *v50;
  CarFocusContainerGuideController *focusContainerGuideController;
  objc_super v52;

  v52.receiver = self;
  v52.super_class = (Class)CarChromeViewController;
  -[ChromeViewController viewDidLoad](&v52, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController view](self, "view"));
  objc_msgSend(v3, "setTintAdjustmentMode:", 1);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController backButtonRecognizer](self, "backButtonRecognizer"));
  if (!v4)
  {
    v5 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "_handleBackButtonPressed:");
    -[CarChromeViewController setBackButtonRecognizer:](self, "setBackButtonRecognizer:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController backButtonRecognizer](self, "backButtonRecognizer"));
    objc_msgSend(v6, "setAllowedPressTypes:", &off_101272F48);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController backButtonRecognizer](self, "backButtonRecognizer"));
    objc_msgSend(v7, "setDelegate:", self);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController backButtonRecognizer](self, "backButtonRecognizer"));
    objc_msgSend(v8, "setEnabled:", 0);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController view](self, "view"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController backButtonRecognizer](self, "backButtonRecognizer"));
  objc_msgSend(v9, "addGestureRecognizer:", v10);

  v11 = (UILayoutGuide *)objc_alloc_init((Class)UILayoutGuide);
  cardsLayoutGuide = self->_cardsLayoutGuide;
  self->_cardsLayoutGuide = v11;

  v13 = (objc_class *)objc_opt_class(CarChromeViewController);
  v14 = NSStringFromClass(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.cardsLayoutGuide"), v15));
  -[UILayoutGuide setIdentifier:](self->_cardsLayoutGuide, "setIdentifier:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController view](self, "view"));
  objc_msgSend(v17, "addLayoutGuide:", self->_cardsLayoutGuide);

  v18 = (UILayoutGuide *)objc_alloc_init((Class)UILayoutGuide);
  statusBannerLayoutGuide = self->_statusBannerLayoutGuide;
  self->_statusBannerLayoutGuide = v18;

  v20 = (objc_class *)objc_opt_class(CarChromeViewController);
  v21 = NSStringFromClass(v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.statusBannerLayoutGuide"), v22));
  -[UILayoutGuide setIdentifier:](self->_statusBannerLayoutGuide, "setIdentifier:", v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController view](self, "view"));
  objc_msgSend(v24, "addLayoutGuide:", self->_statusBannerLayoutGuide);

  v25 = (UILayoutGuide *)objc_alloc_init((Class)UILayoutGuide);
  accessoriesCompactLayoutGuide = self->_accessoriesCompactLayoutGuide;
  self->_accessoriesCompactLayoutGuide = v25;

  v27 = (objc_class *)objc_opt_class(CarChromeViewController);
  v28 = NSStringFromClass(v27);
  v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.accessoriesDashboardLayoutGuide"), v29));
  -[UILayoutGuide setIdentifier:](self->_accessoriesCompactLayoutGuide, "setIdentifier:", v30);

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController view](self, "view"));
  objc_msgSend(v31, "addLayoutGuide:", self->_accessoriesCompactLayoutGuide);

  v32 = -[CarCardsOverlay initWithCarSceneType:]([CarCardsOverlay alloc], "initWithCarSceneType:", -[CarChromeViewController sceneType](self, "sceneType"));
  -[CarCardsOverlay setCardDelegate:](v32, "setCardDelegate:", self);
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController overlayController](self, "overlayController"));
  objc_msgSend(v33, "addOverlay:inLayoutGuide:", v32, self->_cardsLayoutGuide);

  -[CarChromeViewController setCardsOverlay:](self, "setCardsOverlay:", v32);
  v34 = -[CarStatusBannerOverlay initWithChromeViewController:]([CarStatusBannerOverlay alloc], "initWithChromeViewController:", self);
  -[CarStatusBannerOverlay setDelegate:](v34, "setDelegate:", self);
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController overlayController](self, "overlayController"));
  objc_msgSend(v35, "addOverlay:inLayoutGuide:", v34, self->_statusBannerLayoutGuide);

  -[CarChromeViewController setStatusBannerOverlay:](self, "setStatusBannerOverlay:", v34);
  v36 = -[CarAccessoriesOverlay initWithCarSceneType:]([CarAccessoriesOverlay alloc], "initWithCarSceneType:", self->_sceneType);
  if ((id)-[CarChromeViewController sceneType](self, "sceneType") == (id)7
    && GEOConfigGetBOOL(MapsConfig_HybridInstrumentClusterGuidanceCardEnabled, off_1014B4D38))
  {
    -[CarAccessoriesOverlay setIgnoresCollisionConstraints:](v36, "setIgnoresCollisionConstraints:", 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController overlayController](self, "overlayController"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController viewportLayoutGuide](self, "viewportLayoutGuide"));
    objc_msgSend(v37, "addOverlay:inLayoutGuide:", v36, v38);

  }
  else
  {
    v39 = -[CarChromeViewController sceneType](self, "sceneType");
    if (((unint64_t)(v39 - 4) < 4 || v39 == 1)
      && (unint64_t)-[CarChromeViewController sceneType](self, "sceneType") < 4)
    {
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController overlayController](self, "overlayController"));
      objc_msgSend(v37, "addOverlay:", v36);
    }
    else
    {
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController overlayController](self, "overlayController"));
      objc_msgSend(v37, "addOverlay:inLayoutGuide:", v36, self->_accessoriesCompactLayoutGuide);
    }
  }

  -[CarChromeViewController setAccessoriesOverlay:](self, "setAccessoriesOverlay:", v36);
  if ((unint64_t)-[CarChromeViewController sceneType](self, "sceneType") <= 3)
  {
    v40 = objc_alloc_init(CarMapControlsOverlay);
    -[CarMapControlsOverlay setDelegate:](v40, "setDelegate:", self);
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController overlayController](self, "overlayController"));
    objc_msgSend(v41, "addOverlay:", v40);

    -[CarChromeViewController setMapControlsOverlay:](self, "setMapControlsOverlay:", v40);
  }
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapInsetsLayoutGuide](self, "mapInsetsLayoutGuide"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "topAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController view](self, "view"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "topAnchor"));
  v46 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintGreaterThanOrEqualToAnchor:constant:", v45, 0.0));
  headingUpMapInsetAdjustmentConstraint = self->_headingUpMapInsetAdjustmentConstraint;
  self->_headingUpMapInsetAdjustmentConstraint = v46;

  v48 = [CarFocusContainerGuideController alloc];
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController view](self, "view"));
  v50 = -[CarFocusContainerGuideController initWithHostView:](v48, "initWithHostView:", v49);
  focusContainerGuideController = self->_focusContainerGuideController;
  self->_focusContainerGuideController = v50;

}

- (void)viewWillAppear:(BOOL)a3
{
  id visibilityDeactivationToken;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CarChromeViewController;
  -[CarChromeViewController viewWillAppear:](&v5, "viewWillAppear:", a3);
  self->_isCurrentlyVisible = 1;
  -[CarChromeViewController _updateMapToCurrentUserInterfaceStyleAnimated:](self, "_updateMapToCurrentUserInterfaceStyleAnimated:", 0);
  -[CarChromeViewController _updateAutohideBehavior](self, "_updateAutohideBehavior");
  visibilityDeactivationToken = self->_visibilityDeactivationToken;
  self->_visibilityDeactivationToken = 0;

  -[CarChromeViewController interruptAutohideForIncidentalInteraction](self, "interruptAutohideForIncidentalInteraction");
  -[CarChromeViewController setNeedsFocusUpdate](self, "setNeedsFocusUpdate");
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CarChromeViewController;
  -[CarChromeViewController viewDidAppear:](&v6, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[GEOOfflineService shared](GEOOfflineService, "shared"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
  objc_msgSend(v4, "registerMapView:withPriority:", v5, (double)-[CarChromeViewController sceneType](self, "sceneType"));

  -[CarChromeViewController _updateAutohideBehavior](self, "_updateAutohideBehavior");
  -[CarChromeViewController interruptAutohideForIncidentalInteraction](self, "interruptAutohideForIncidentalInteraction");
  -[ChromeViewController updateMapViewFrameRate](self, "updateMapViewFrameRate");
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CarChromeViewController;
  -[CarChromeViewController viewWillDisappear:](&v4, "viewWillDisappear:", a3);
  -[CarChromeViewController _updateAutohideBehavior](self, "_updateAutohideBehavior");
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  id visibilityDeactivationToken;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CarChromeViewController;
  -[CarChromeViewController viewDidDisappear:](&v6, "viewDidDisappear:", a3);
  self->_isCurrentlyVisible = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController acquireChromeDeactivationTokenForReason:](self, "acquireChromeDeactivationTokenForReason:", CFSTR("view controller no longer in hierarchy")));
  visibilityDeactivationToken = self->_visibilityDeactivationToken;
  self->_visibilityDeactivationToken = v4;

  -[CarChromeViewController _updateAutohideBehavior](self, "_updateAutohideBehavior");
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CarChromeViewController;
  -[ChromeViewController viewDidLayoutSubviews](&v7, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController overlayController](self, "overlayController"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController view](self, "view"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController overlayController](self, "overlayController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "overlayContentView"));
    objc_msgSend(v4, "bringSubviewToFront:", v6);

  }
}

- (void)viewSafeAreaInsetsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CarChromeViewController;
  -[CarChromeViewController viewSafeAreaInsetsDidChange](&v3, "viewSafeAreaInsetsDidChange");
  -[ChromeViewController setNeedsUpdateMapInsets](self, "setNeedsUpdateMapInsets");
}

- (BOOL)_shouldAccessoriesModifyMapInsetsForContext:(id)a3
{
  id v3;
  unsigned __int8 v4;

  v3 = a3;
  if (GEOConfigGetBOOL(MapsConfig_ShouldCarPlayAccessoriesModifyMapInsets, off_1014B4778)
    && (objc_opt_respondsToSelector(v3, "shouldAccessoriesModifyMapInsets") & 1) != 0)
  {
    v4 = objc_msgSend(v3, "shouldAccessoriesModifyMapInsets");
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)_shouldMapControlsModifyMapInsetsForContext:(id)a3
{
  id v3;
  unsigned __int8 v4;

  v3 = a3;
  if ((objc_opt_respondsToSelector(v3, "shouldMapControlsModifyMapInsets") & 1) != 0)
    v4 = objc_msgSend(v3, "shouldMapControlsModifyMapInsets");
  else
    v4 = 0;

  return v4;
}

- (void)setNotificationLayoutGuide:(id)a3
{
  UILayoutGuide *v5;
  void *v6;
  UILayoutGuide *notificationLayoutGuide;
  unsigned __int8 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = (UILayoutGuide *)a3;
  if (!v5)
    goto LABEL_5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapInsetsLayoutGuide](self, "mapInsetsLayoutGuide"));
  if (!v6 || -[ChromeViewController isSuppressed](self, "isSuppressed"))
  {

LABEL_5:
    notificationLayoutGuide = self->_notificationLayoutGuide;
    self->_notificationLayoutGuide = 0;

    goto LABEL_6;
  }
  v8 = -[CarChromeViewController isViewLoaded](self, "isViewLoaded");

  if ((v8 & 1) == 0)
    goto LABEL_5;
  if (self->_notificationLayoutGuide != v5)
  {
    objc_storeStrong((id *)&self->_notificationLayoutGuide, a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](self->_notificationLayoutGuide, "topAnchor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapInsetsLayoutGuide](self, "mapInsetsLayoutGuide"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bottomAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintGreaterThanOrEqualToAnchor:", v11));
    v14 = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v13);

  }
  -[ChromeViewController setNeedsUpdateMapInsets](self, "setNeedsUpdateMapInsets");
LABEL_6:

}

- (void)contextStackWillUpdateFrom:(id)a3 to:(id)a4 withAnimation:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  objc_super v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v8, "containsObject:", v15) & 1) == 0
          && (objc_opt_respondsToSelector(v15, "setChromeViewController:") & 1) != 0)
        {
          objc_msgSend(v15, "setChromeViewController:", self);
        }
      }
      v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v12);
  }
  v17.receiver = self;
  v17.super_class = (Class)CarChromeViewController;
  -[ChromeViewController contextStackWillUpdateFrom:to:withAnimation:](&v17, "contextStackWillUpdateFrom:to:withAnimation:", v8, v9, v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
  -[CarChromeViewController _resetMapViewDefaults:](self, "_resetMapViewDefaults:", v16);

}

- (void)contextStackDidUpdateFrom:(id)a3 to:(id)a4 withAnimation:(id)a5
{
  id v8;
  id v9;
  id v10;
  unsigned __int8 v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  CarChromeViewController *v23;
  id v24;
  id v25;
  unsigned __int8 v26;
  objc_super v27;

  v8 = a3;
  v9 = a4;
  v27.receiver = self;
  v27.super_class = (Class)CarChromeViewController;
  v10 = a5;
  -[ChromeViewController contextStackDidUpdateFrom:to:withAnimation:](&v27, "contextStackDidUpdateFrom:to:withAnimation:", v8, v9, v10);
  v11 = objc_msgSend(v10, "isAnimated");
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastObject"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastObject"));
  -[CarChromeViewController _reloadMapControlsForContext:withAnimation:](self, "_reloadMapControlsForContext:withAnimation:", v13, v10);
  -[CarChromeViewController _reloadAccessoriesForContext:withAnimation:](self, "_reloadAccessoriesForContext:withAnimation:", v13, v10);
  -[CarChromeViewController _reloadStatusBannerWithAnimation:](self, "_reloadStatusBannerWithAnimation:", v10);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1002347C4;
  v20[3] = &unk_1011AD458;
  v21 = v8;
  v22 = v9;
  v23 = self;
  v24 = v12;
  v25 = v13;
  v26 = v11;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100234D8C;
  v18[3] = &unk_1011ACCB8;
  v18[4] = self;
  v19 = v25;
  v14 = v25;
  v15 = v12;
  v16 = v9;
  v17 = v8;
  objc_msgSend(v10, "addPreparation:animations:completion:", v20, &stru_1011AD478, v18);

}

- (CarChromeContext)topContext
{
  ChromeContext *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CarChromeViewController;
  v2 = -[ChromeViewController topContext](&v4, "topContext");
  return (CarChromeContext *)(id)objc_claimAutoreleasedReturnValue(v2);
}

- (NSMapTable)chromeItemsByContext
{
  NSMapTable *chromeItemsByContext;
  NSMapTable *v4;
  NSMapTable *v5;

  chromeItemsByContext = self->_chromeItemsByContext;
  if (!chromeItemsByContext)
  {
    v4 = (NSMapTable *)objc_claimAutoreleasedReturnValue(+[NSMapTable weakToStrongObjectsMapTable](NSMapTable, "weakToStrongObjectsMapTable"));
    v5 = self->_chromeItemsByContext;
    self->_chromeItemsByContext = v4;

    chromeItemsByContext = self->_chromeItemsByContext;
  }
  return chromeItemsByContext;
}

- (id)chromeViewItemForContext:(id)a3 createIfNeeded:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a4;
  v6 = a3;
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController chromeItemsByContext](self, "chromeItemsByContext"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v6));

    if (!v8 && v4)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[CarChromeViewItem itemWithContext:](CarChromeViewItem, "itemWithContext:", v6));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController chromeItemsByContext](self, "chromeItemsByContext"));
      objc_msgSend(v9, "setObject:forKey:", v8, v6);

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_carExternalDeviceStateUpdated:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint8_t v9[16];

  v4 = sub_10043364C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Notified car external accessory updated", v9, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MapsExternalDevice sharedInstance](MapsExternalDevice, "sharedInstance"));
  v7 = objc_msgSend(v6, "hasLimitedUI") ^ 1;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
  objc_msgSend(v8, "setVehicleState:", v7);

}

- (void)dismissInterruption
{
  -[CarChromeViewController _dismissAlertViewController:animated:](self, "_dismissAlertViewController:animated:", self->_currentAlertViewController, 0);
}

- (BOOL)dismissCurrentInterruptionOfKind:(int64_t)a3
{
  int64_t v5;

  v5 = -[CarAlertViewController tag](self->_currentAlertViewController, "tag");
  if (v5 == a3)
    -[CarChromeViewController dismissInterruption](self, "dismissInterruption");
  return v5 == a3;
}

- (id)presentInterruptionOfKind:(int64_t)a3 userInfo:(id)a4 completionHandler:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  id v12;
  CarAlertViewController *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
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
  id v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  void *v40;
  void *v41;
  uint64_t v42;
  id v43;
  NSObject *v44;
  const __CFString *v45;
  void *v46;
  void *v47;
  id v48;
  uint64_t v49;
  _BOOL4 v50;
  void *v51;
  id v52;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  uint64_t v62;
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
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  id v94;
  void *v95;
  id v96;
  id v97;
  CarChromeViewController *v98;
  id v99;
  void *v100;
  _QWORD v101[5];
  id v102;
  _QWORD v103[5];
  id v104;
  id v105;
  int64_t v106;
  void *v107;
  _QWORD v108[2];
  void *v109;
  _QWORD v110[2];
  void *v111;
  _QWORD v112[2];
  uint8_t buf[4];
  id v114;
  __int16 v115;
  int64_t v116;
  __int16 v117;
  id v118;

  v99 = a4;
  v97 = a5;
  v98 = self;
  v100 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
  if ((objc_opt_respondsToSelector(v100, "canPresentInterruptionOfKind:") & 1) != 0
    && objc_msgSend(v100, "canPresentInterruptionOfKind:", a3))
  {
    v8 = sub_10043364C();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v114 = (id)objc_opt_class(v100);
      v115 = 2048;
      v116 = a3;
      v117 = 2112;
      v118 = v99;
      v10 = v114;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Will ask top context %@ to present interruption (kind:%ld, userInfo:%@)", buf, 0x20u);

    }
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "presentInterruptionOfKind:userInfo:completionHandler:", a3, v99, v97));
    goto LABEL_8;
  }
  if (a3 == 4)
  {
    v11 = objc_claimAutoreleasedReturnValue(-[CarChromeViewController _presentSearchRefinementWithUserInfo:completionHandler:](self, "_presentSearchRefinementWithUserInfo:completionHandler:", v99, v97));
LABEL_8:
    v12 = (id)v11;
    goto LABEL_42;
  }
  v96 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "objectForKeyedSubscript:", CFSTR("kMapsInterruptionActions")));
  v13 = self->_currentAlertViewController;
  if (-[CarAlertViewController tag](v13, "tag") == a3)
  {
    -[CarAlertViewController supersede](v13, "supersede");
    -[CarAlertViewController reset](v13, "reset");
  }
  else
  {
    a5 = objc_alloc_init(CarAlertViewController);

    objc_msgSend(a5, "setTag:", a3);
    v13 = (CarAlertViewController *)a5;
  }
  v12 = 0;
  switch(a3)
  {
    case 1:
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "objectForKeyedSubscript:", CFSTR("kMapsInterruptionTitle")));
      if (v14)
      {
        -[CarAlertViewController setAlertTitle:](v13, "setAlertTitle:", v14);
      }
      else
      {
        v83 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "localizedStringForKey:value:table:", CFSTR("Maps Safety Warning Title"), CFSTR("localized string not found"), 0));
        -[CarAlertViewController setAlertTitle:](v13, "setAlertTitle:", v84);

      }
      a5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "objectForKeyedSubscript:", CFSTR("kMapsInterruptionMessage")));
      if (a5)
        goto LABEL_23;
      v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "localizedStringForKey:value:table:", CFSTR("Maps Safety Warning Message"), CFSTR("localized string not found"), 0));
      -[CarAlertViewController setAlertMessage:](v13, "setAlertMessage:", v86);

      goto LABEL_24;
    case 2:
    case 3:
    case 6:
    case 8:
    case 12:
    case 13:
    case 16:
    case 17:
    case 18:
    case 19:
    case 20:
    case 23:
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "objectForKeyedSubscript:", CFSTR("kMapsInterruptionTitle")));
      -[CarAlertViewController setAlertTitle:](v13, "setAlertTitle:", v37);

      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "objectForKeyedSubscript:", CFSTR("kMapsInterruptionMessage")));
      goto LABEL_22;
    case 5:
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[CarChromeViewController localizedLocationAuthorizationTitle](CarChromeViewController, "localizedLocationAuthorizationTitle"));
      -[CarAlertViewController setAlertTitle:](v13, "setAlertTitle:", v15);

      a5 = (id)objc_claimAutoreleasedReturnValue(+[CarChromeViewController localizedLocationAuthorizationMessage](CarChromeViewController, "localizedLocationAuthorizationMessage"));
      -[CarAlertViewController setAlertMessage:](v13, "setAlertMessage:", a5);

      goto LABEL_30;
    case 7:
      v16 = sub_10043364C();
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "CarChromeViewController: ask for kMapsInterruptionMaybeEndNavigation", buf, 2u);
      }

      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("Route in Progress [CarPlay]"), CFSTR("localized string not found"), 0));
      -[CarAlertViewController setAlertTitle:](v13, "setAlertTitle:", v19);

      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("Are you sure you want to end navigation? [CarPlay]"), CFSTR("localized string not found"), 0));
      -[CarAlertViewController setAlertMessage:](v13, "setAlertMessage:", v21);

      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("Resume Navigation Cancel [CarPlay]"), CFSTR("localized string not found"), 0));
      v90 = (void *)objc_claimAutoreleasedReturnValue(+[MapsInterruptionAction actionWithTitle:cancels:handler:](MapsInterruptionAction, "actionWithTitle:cancels:handler:", v93, 1, 0));
      v112[0] = v90;
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("End Navigation [CarPlay]"), CFSTR("localized string not found"), 0));
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[MapsInterruptionAction actionWithTitle:cancels:handler:](MapsInterruptionAction, "actionWithTitle:cancels:handler:", v24, 0, 0));
      v112[1] = v25;
      a5 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v112, 2));

      goto LABEL_47;
    case 9:
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("Show navigable driving directions title [CarPlay]"), CFSTR("localized string not found"), 0));
      -[CarAlertViewController setAlertTitle:](v13, "setAlertTitle:", v27);

      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("Show navigable driving directions message [CarPlay]"), CFSTR("localized string not found"), 0));
      -[CarAlertViewController setAlertMessage:](v13, "setAlertMessage:", v29);

      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      a5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("Show navigable driving directions button [CarPlay]"), CFSTR("localized string not found"), 0));
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[MapsInterruptionAction actionWithTitle:cancels:handler:](MapsInterruptionAction, "actionWithTitle:cancels:handler:", a5, 0, 0));
      v111 = v31;
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v111, 1));

      goto LABEL_45;
    case 10:
      goto LABEL_41;
    case 11:
      v33 = CarDisplayDirectionsNotAvailableErrorTitle();
      v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
      -[CarAlertViewController setAlertTitle:](v13, "setAlertTitle:", v34);

      v35 = CarDisplayTurnByTurnNotAvailableAdvisory();
      v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
LABEL_22:
      a5 = v36;
LABEL_23:
      -[CarAlertViewController setAlertMessage:](v13, "setAlertMessage:", a5);
LABEL_24:

      goto LABEL_25;
    case 14:
      v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "objectForKeyedSubscript:", CFSTR("kMapsInterruptionSharedTripSenderName")));
      v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "objectForKeyedSubscript:", CFSTR("kMapsInterruptionSharedTripSenderHandle")));
      v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "localizedStringForKey:value:table:", CFSTR("Maps always shares as [name] [email/phone] [CarPlay]"), CFSTR("localized string not found"), 0));
      v89 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v56, v91, v54));

      v57 = objc_alloc((Class)NSMutableAttributedString);
      v58 = (void *)objc_claimAutoreleasedReturnValue(+[CarAlertViewController defaultMessageAttributes](CarAlertViewController, "defaultMessageAttributes"));
      v94 = objc_msgSend(v57, "initWithString:attributes:", v89, v58);

      v59 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
      v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "string"));
      v61 = objc_msgSend(v60, "rangeOfString:", v54);
      objc_msgSend(v94, "addAttribute:value:range:", NSForegroundColorAttributeName, v59, v61, v62);

      v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "localizedStringForKey:value:table:", CFSTR("Share ETA [CarPlay, Sender Info Title]"), CFSTR("localized string not found"), 0));
      -[CarAlertViewController setAlertTitle:](v13, "setAlertTitle:", v64);

      -[CarAlertViewController setAlertAttributedMessage:](v13, "setAlertAttributedMessage:", v94);
      v88 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "localizedStringForKey:value:table:", CFSTR("Cancel [CarPlay, Share ETA Alert]"), CFSTR("localized string not found"), 0));
      v65 = (void *)objc_claimAutoreleasedReturnValue(+[MapsInterruptionAction actionWithTitle:cancels:handler:](MapsInterruptionAction, "actionWithTitle:cancels:handler:", v87, 1, 0));
      v110[0] = v65;
      v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      a5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "localizedStringForKey:value:table:", CFSTR("Share [CarPlay, Share ETA Alert]"), CFSTR("localized string not found"), 0));
      v67 = (void *)objc_claimAutoreleasedReturnValue(+[MapsInterruptionAction actionWithTitle:cancels:handler:](MapsInterruptionAction, "actionWithTitle:cancels:handler:", a5, 0, 0));
      v110[1] = v67;
      v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v110, 2));

      v96 = v68;
      v38 = objc_msgSend(v68, "count");
      goto LABEL_26;
    case 15:
      v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "localizedStringForKey:value:table:", CFSTR("Precise_Location_Off_Title [CarPlay]"), CFSTR("localized string not found"), 0));
      -[CarAlertViewController setAlertTitle:](v13, "setAlertTitle:", v70);

      v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "localizedStringForKey:value:table:", CFSTR("Precise_Location_Off_Message [CarPlay]"), CFSTR("localized string not found"), 0));
      -[CarAlertViewController setAlertMessage:](v13, "setAlertMessage:", v72);

      v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      a5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "localizedStringForKey:value:table:", CFSTR("Continue [CarPlay]"), CFSTR("localized string not found"), 0));
      v74 = (void *)objc_claimAutoreleasedReturnValue(+[MapsInterruptionAction actionWithTitle:cancels:handler:](MapsInterruptionAction, "actionWithTitle:cancels:handler:", a5, 0, 0));
      v109 = v74;
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v109, 1));

LABEL_45:
      v96 = v32;
      v38 = objc_msgSend(v32, "count");
      goto LABEL_26;
    case 21:
      v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "localizedStringForKey:value:table:", CFSTR("Using Offline Maps"), CFSTR("localized string not found"), CFSTR("Offline")));
      -[CarAlertViewController setAlertTitle:](v13, "setAlertTitle:", v76);

      v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "localizedStringForKey:value:table:", CFSTR("You're using the offline maps you downloaded even when you have an internet connection."), CFSTR("localized string not found"), CFSTR("Offline")));
      -[CarAlertViewController setAlertMessage:](v13, "setAlertMessage:", v78);

      v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "localizedStringForKey:value:table:", CFSTR("Continue [CarPlay, Offline Alert]"), CFSTR("localized string not found"), 0));
      v92 = (void *)objc_claimAutoreleasedReturnValue(+[MapsInterruptionAction actionWithTitle:cancels:handler:](MapsInterruptionAction, "actionWithTitle:cancels:handler:", v95, 1, 0));
      v108[0] = v92;
      v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "localizedStringForKey:value:table:", CFSTR("Turn Off [CarPlay, Offline Alert]"), CFSTR("localized string not found"), 0));
      v82 = (void *)objc_claimAutoreleasedReturnValue(+[MapsInterruptionAction actionWithTitle:cancels:handler:](MapsInterruptionAction, "actionWithTitle:cancels:handler:", v81, 0, 0));
      v108[1] = v82;
      a5 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v108, 2));

LABEL_47:
      v96 = a5;
      v38 = objc_msgSend(a5, "count");
      goto LABEL_26;
    default:
LABEL_25:
      v38 = objc_msgSend(v96, "count");
LABEL_26:
      if (v38)
      {
        v39 = v96;
      }
      else
      {
        v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        a5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "localizedStringForKey:value:table:", CFSTR("OK [CarPlay error alert]"), CFSTR("localized string not found"), 0));

        v41 = (void *)objc_claimAutoreleasedReturnValue(+[MapsInterruptionAction actionWithTitle:cancels:handler:](MapsInterruptionAction, "actionWithTitle:cancels:handler:", a5, 0, 0));
        v107 = v41;
        v42 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v107, 1));

        v39 = (id)v42;
      }
      v96 = v39;
      -[CarAlertViewController setActions:](v13, "setActions:");
LABEL_30:
      v103[0] = _NSConcreteStackBlock;
      v103[1] = 3221225472;
      v103[2] = sub_100236024;
      v103[3] = &unk_1011AD4A0;
      v105 = v97;
      v106 = a3;
      v103[4] = v98;
      v96 = v96;
      v104 = v96;
      -[CarAlertViewController setResultBlock:](v13, "setResultBlock:", v103);
      v43 = sub_10043364C();
      v44 = objc_claimAutoreleasedReturnValue(v43);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
      {
        if (v13 == v98->_currentAlertViewController)
          v45 = CFSTR("reuse");
        else
          v45 = CFSTR("create");
        v46 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController title](v13, "title"));
        v47 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController title](v13, "title"));
        v48 = objc_msgSend(v47, "length");
        if ((unint64_t)v48 > 0x13)
        {
          v49 = 20;
        }
        else
        {
          a5 = (id)objc_claimAutoreleasedReturnValue(-[CarAlertViewController title](v13, "title"));
          v49 = (uint64_t)objc_msgSend(a5, "length");
        }
        v50 = (unint64_t)v48 < 0x14;
        v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "substringToIndex:", v49));
        *(_DWORD *)buf = 138412802;
        v114 = (id)v45;
        v115 = 2048;
        v116 = a3;
        v117 = 2112;
        v118 = v51;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "Did %@ alert controller (kind:%ld, title:%@)", buf, 0x20u);
        if (v50)

      }
      -[CarChromeViewController _presentAlertViewController:animated:](v98, "_presentAlertViewController:animated:", v13, 1);
      objc_initWeak((id *)buf, v13);
      v101[0] = _NSConcreteStackBlock;
      v101[1] = 3221225472;
      v101[2] = sub_1002361D0;
      v101[3] = &unk_1011AD1E8;
      objc_copyWeak(&v102, (id *)buf);
      v101[4] = v98;
      v52 = objc_msgSend(v101, "copy");
      v12 = objc_retainBlock(v52);

      objc_destroyWeak(&v102);
      objc_destroyWeak((id *)buf);

LABEL_41:
      break;
  }
LABEL_42:

  return v12;
}

- (id)_presentSearchRefinementWithUserInfo:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  CarDisambiguationModeController *v9;
  CarDisambiguationModeController *v10;
  id v11;
  NSObject *v12;
  id v13;
  _QWORD *v14;
  NSObject *v15;
  id v16;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  NSObject *v21;
  id v22;
  uint8_t buf[8];
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kMapsInterruptionSearchRefinementResults")));
  if (v8)
  {
    v9 = [CarDisambiguationModeController alloc];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100236598;
    v20[3] = &unk_1011AD4C8;
    v21 = v7;
    objc_copyWeak(&v22, &location);
    v10 = -[CarDisambiguationModeController initWithSearchInfo:completionBlock:](v9, "initWithSearchInfo:completionBlock:", v8, v20);
    v11 = sub_10043364C();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Will present search refinement controller", buf, 2u);
    }

    v13 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v10);
    -[CarChromeViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v13, 1, 0);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1002366D4;
    v18[3] = &unk_1011AD4F0;
    objc_copyWeak(&v19, &location);
    v14 = objc_retainBlock(v18);
    objc_destroyWeak(&v19);

    objc_destroyWeak(&v22);
    v15 = v21;
  }
  else
  {
    v16 = sub_10043364C();
    v15 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Will not present search refinement, no search info provided", buf, 2u);
    }
    v14 = 0;
  }

  objc_destroyWeak(&location);
  return v14;
}

- (void)_presentAlertViewController:(id)a3 animated:(BOOL)a4
{
  void *v4;
  void *v5;
  id v8;
  id v9;
  id v10;
  CarAlertViewController *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  _BOOL4 v21;
  void *v22;
  CarAlertViewController **p_currentAlertViewController;
  id v24;
  NSObject *v25;
  id v26;
  NSObject *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  _BOOL4 v32;
  void *v33;
  void *v34;
  void *v35;
  _BOOL4 v36;
  id v37;
  BOOL v38;
  id location;
  uint8_t buf[4];
  void *v41;

  v36 = a4;
  v8 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[CarChromeViewController presentedViewController](self, "presentedViewController"));
  v10 = sub_10043364C();
  v11 = (CarAlertViewController *)objc_claimAutoreleasedReturnValue(v10);
  v12 = os_log_type_enabled(&v11->super.super.super, OS_LOG_TYPE_INFO);
  if (v9 == v8)
  {
    if (v12)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "alertTitle"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "alertTitle"));
      v19 = objc_msgSend(v18, "length");
      if ((unint64_t)v19 > 0x13)
      {
        v20 = 20;
      }
      else
      {
        v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "alertTitle"));
        v20 = (uint64_t)objc_msgSend(v4, "length");
      }
      v32 = (unint64_t)v19 < 0x14;
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "substringToIndex:", v20));
      *(_DWORD *)buf = 138412290;
      v41 = v33;
      _os_log_impl((void *)&_mh_execute_header, &v11->super.super.super, OS_LOG_TYPE_INFO, "Asked to present alert, but it's already visible: %@", buf, 0xCu);
      if (v32)

    }
  }
  else
  {
    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "alertTitle"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "alertTitle"));
      v15 = objc_msgSend(v14, "length");
      if ((unint64_t)v15 > 0x13)
      {
        v16 = 20;
      }
      else
      {
        v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "alertTitle"));
        v16 = (uint64_t)objc_msgSend(v5, "length");
      }
      v21 = (unint64_t)v15 < 0x14;
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "substringToIndex:", v16));
      *(_DWORD *)buf = 138412290;
      v41 = v22;
      _os_log_impl((void *)&_mh_execute_header, &v11->super.super.super, OS_LOG_TYPE_INFO, "Asked to present alert: %@", buf, 0xCu);
      if (v21)

    }
    p_currentAlertViewController = &self->_currentAlertViewController;
    v11 = self->_currentAlertViewController;
    objc_storeStrong((id *)&self->_currentAlertViewController, a3);
    -[CarAlertViewController setModalPresentationStyle:](self->_currentAlertViewController, "setModalPresentationStyle:", 5);
    if (v11)
    {
      v24 = sub_10043364C();
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Already have an alert showing, transition to the new one", buf, 2u);
      }

      -[CarAlertViewController supersede](v11, "supersede");
    }
    objc_initWeak(&location, self);
    if (v9)
    {
      objc_copyWeak(&v37, &location);
      v38 = v36;
      -[CarChromeViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:");
      objc_destroyWeak(&v37);
    }
    else
    {
      v26 = sub_10043364C();
      v27 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController alertTitle](*p_currentAlertViewController, "alertTitle"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController alertTitle](*p_currentAlertViewController, "alertTitle"));
        v30 = objc_msgSend(v29, "length");
        if ((unint64_t)v30 > 0x13)
        {
          v31 = 20;
        }
        else
        {
          v35 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController alertTitle](*p_currentAlertViewController, "alertTitle"));
          v31 = (uint64_t)objc_msgSend(v35, "length");
        }
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "substringToIndex:", v31));
        *(_DWORD *)buf = 138412290;
        v41 = v34;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Will show a new alert %@", buf, 0xCu);
        if ((unint64_t)v30 <= 0x13)

      }
      -[CarChromeViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", *p_currentAlertViewController, v36, 0);
    }
    objc_destroyWeak(&location);
  }

}

- (void)_dismissAlertViewController:(id)a3 animated:(BOOL)a4
{
  void *v4;
  _BOOL8 v5;
  CarAlertViewController *v7;
  CarAlertViewController *currentAlertViewController;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  CarAlertViewController *v12;
  CarAlertViewController *v13;
  objc_class *v14;
  NSString *v15;
  void *v16;
  void *v17;
  void *v18;
  __CFString *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  CarAlertViewController *v26;
  CarAlertViewController *v27;
  objc_class *v28;
  NSString *v29;
  void *v30;
  void *v31;
  void *v32;
  __CFString *v33;
  __CFString *v34;
  CarAlertViewController *v35;
  __CFString *v36;
  CarAlertViewController *v37;
  CarAlertViewController *v38;
  objc_class *v39;
  NSString *v40;
  void *v41;
  void *v42;
  void *v43;
  __CFString *v44;
  _QWORD v45[5];
  BOOL v46;
  uint8_t buf[4];
  __CFString *v48;
  __int16 v49;
  __CFString *v50;

  v5 = a4;
  v7 = (CarAlertViewController *)a3;
  currentAlertViewController = self->_currentAlertViewController;
  if (currentAlertViewController != v7)
  {
    v9 = sub_10043364C();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
    if (currentAlertViewController)
    {
      if (v11)
      {
        v12 = self->_currentAlertViewController;
        v13 = v12;
        if (!v12)
        {
          v19 = CFSTR("<nil>");
LABEL_28:

          v36 = v19;
          v37 = v7;
          v38 = v37;
          if (!v37)
          {
            v44 = CFSTR("<nil>");
            goto LABEL_36;
          }
          v39 = (objc_class *)objc_opt_class(v37);
          v40 = NSStringFromClass(v39);
          v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
          if ((objc_opt_respondsToSelector(v38, "accessibilityIdentifier") & 1) != 0)
          {
            v42 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController performSelector:](v38, "performSelector:", "accessibilityIdentifier"));
            v43 = v42;
            if (v42 && !objc_msgSend(v42, "isEqualToString:", v41))
            {
              v44 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v41, v38, v43));

              goto LABEL_34;
            }

          }
          v44 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v41, v38));
LABEL_34:

LABEL_36:
          *(_DWORD *)buf = 138412546;
          v48 = v36;
          v49 = 2112;
          v50 = v44;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Will not dismiss current alert, does match instance passed in (current:%@, specified:%@)", buf, 0x16u);

          goto LABEL_39;
        }
        v14 = (objc_class *)objc_opt_class(v12);
        v15 = NSStringFromClass(v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
        if ((objc_opt_respondsToSelector(v13, "accessibilityIdentifier") & 1) != 0)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController performSelector:](v13, "performSelector:", "accessibilityIdentifier"));
          v18 = v17;
          if (v17 && !objc_msgSend(v17, "isEqualToString:", v16))
          {
            v19 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v16, v13, v18));

            goto LABEL_10;
          }

        }
        v19 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v16, v13));
LABEL_10:

        goto LABEL_28;
      }
LABEL_39:

      goto LABEL_40;
    }
    if (!v11)
      goto LABEL_39;
    v26 = v7;
    v27 = v26;
    if (!v26)
    {
      v33 = CFSTR("<nil>");
      goto LABEL_38;
    }
    v28 = (objc_class *)objc_opt_class(v26);
    v29 = NSStringFromClass(v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    if ((objc_opt_respondsToSelector(v27, "accessibilityIdentifier") & 1) != 0)
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController performSelector:](v27, "performSelector:", "accessibilityIdentifier"));
      v32 = v31;
      if (v31 && !objc_msgSend(v31, "isEqualToString:", v30))
      {
        v33 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v30, v27, v32));

        goto LABEL_21;
      }

    }
    v33 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v30, v27));
LABEL_21:

LABEL_38:
    *(_DWORD *)buf = 138412290;
    v48 = v33;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Will not dismiss current alert, we do not have one presented (specified:%@)", buf, 0xCu);

    goto LABEL_39;
  }
  v20 = sub_10043364C();
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController alertTitle](self->_currentAlertViewController, "alertTitle"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController alertTitle](self->_currentAlertViewController, "alertTitle"));
    v24 = objc_msgSend(v23, "length");
    if ((unint64_t)v24 > 0x13)
    {
      v25 = 20;
    }
    else
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController alertTitle](self->_currentAlertViewController, "alertTitle"));
      v25 = (uint64_t)objc_msgSend(v4, "length");
    }
    v34 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "substringToIndex:", v25));
    *(_DWORD *)buf = 138412290;
    v48 = v34;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Will dismiss current alert %@", buf, 0xCu);
    if ((unint64_t)v24 <= 0x13)

  }
  v35 = self->_currentAlertViewController;
  self->_currentAlertViewController = 0;

  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_100237078;
  v45[3] = &unk_1011ACE58;
  v45[4] = self;
  v46 = v5;
  -[CarChromeViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", v5, v45);
LABEL_40:

}

- (void)_presentAnyPendingAlert:(BOOL)a3
{
  _BOOL8 v3;
  CarAlertViewController *currentAlertViewController;
  CarAlertViewController *v6;
  void *v7;
  id v8;
  NSObject *v9;
  CarAlertViewController *v10;
  CarAlertViewController *v11;
  objc_class *v12;
  NSString *v13;
  void *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  _QWORD v18[5];
  BOOL v19;
  uint8_t buf[4];
  __CFString *v21;

  v3 = a3;
  currentAlertViewController = self->_currentAlertViewController;
  v6 = (CarAlertViewController *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController presentedViewController](self, "presentedViewController"));

  if (currentAlertViewController != v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController presentedViewController](self, "presentedViewController"));

    if (v7)
    {
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_1002372B0;
      v18[3] = &unk_1011ACE58;
      v18[4] = self;
      v19 = v3;
      -[CarChromeViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", v3, v18);
      return;
    }
    if (self->_currentAlertViewController)
    {
      v8 = sub_10043364C();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
LABEL_15:

        -[CarChromeViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", self->_currentAlertViewController, v3, 0);
        return;
      }
      v10 = self->_currentAlertViewController;
      v11 = v10;
      if (!v10)
      {
        v17 = CFSTR("<nil>");
        goto LABEL_14;
      }
      v12 = (objc_class *)objc_opt_class(v10);
      v13 = NSStringFromClass(v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      if ((objc_opt_respondsToSelector(v11, "accessibilityIdentifier") & 1) != 0)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlertViewController performSelector:](v11, "performSelector:", "accessibilityIdentifier"));
        v16 = v15;
        if (v15 && !objc_msgSend(v15, "isEqualToString:", v14))
        {
          v17 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v14, v11, v16));

          goto LABEL_12;
        }

      }
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v14, v11));
LABEL_12:

LABEL_14:
      *(_DWORD *)buf = 138412290;
      v21 = v17;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Ready for new alert, presenting %@", buf, 0xCu);

      goto LABEL_15;
    }
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  CarChromeViewController *v10;
  CarChromeViewController *v11;
  objc_class *v12;
  NSString *v13;
  void *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  __CFString *v18;
  unint64_t v19;
  __CFString *v20;
  __CFString *v21;
  void *v22;
  unint64_t v23;
  __CFString *v24;
  objc_super v25;
  uint8_t buf[4];
  __CFString *v27;
  __int16 v28;
  __CFString *v29;
  __int16 v30;
  __CFString *v31;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)CarChromeViewController;
  -[CarChromeViewController traitCollectionDidChange:](&v25, "traitCollectionDidChange:", v4);
  v5 = objc_msgSend(v4, "_car_userInterfaceStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController traitCollection](self, "traitCollection"));
  v7 = objc_msgSend(v6, "_car_userInterfaceStyle");

  if (v5 != v7)
  {
    v8 = sub_100432D1C();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
LABEL_18:

      -[MapsLightLevelController reloadForChangedLightLevelTrackers](self->_lightLevelController, "reloadForChangedLightLevelTrackers");
      goto LABEL_19;
    }
    v10 = self;
    v11 = v10;
    if (!v10)
    {
      v17 = CFSTR("<nil>");
      goto LABEL_11;
    }
    v12 = (objc_class *)objc_opt_class(v10);
    v13 = NSStringFromClass(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    if ((objc_opt_respondsToSelector(v11, "accessibilityIdentifier") & 1) != 0)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController performSelector:](v11, "performSelector:", "accessibilityIdentifier"));
      v16 = v15;
      if (v15 && !objc_msgSend(v15, "isEqualToString:", v14))
      {
        v17 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v14, v11, v16));

        goto LABEL_9;
      }

    }
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v14, v11));
LABEL_9:

LABEL_11:
    v18 = v17;
    v19 = (unint64_t)objc_msgSend(v4, "_car_userInterfaceStyle");
    if (v19 >= 3)
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Unknown %ld>"), v19));
    else
      v20 = off_1011AD788[v19];
    v21 = v20;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController traitCollection](v11, "traitCollection"));
    v23 = (unint64_t)objc_msgSend(v22, "_car_userInterfaceStyle");
    if (v23 >= 3)
      v24 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Unknown %ld>"), v23));
    else
      v24 = off_1011AD788[v23];
    *(_DWORD *)buf = 138543874;
    v27 = v18;
    v28 = 2112;
    v29 = v21;
    v30 = 2112;
    v31 = v24;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{public}@] In traitCollectionDidChange : _car_userInterfaceStyle changed from : %@ to : %@", buf, 0x20u);

    goto LABEL_18;
  }
LABEL_19:

}

- (void)_carPlayWindowMapStyleDidChange:(id)a3
{
  CarChromeViewController *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  CarChromeViewController *v8;
  void *v9;
  CarChromeViewController *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  CarChromeViewController *v14;
  CarChromeViewController *v15;
  objc_class *v16;
  NSString *v17;
  void *v18;
  void *v19;
  void *v20;
  __CFString *v21;
  id v22;
  CarChromeViewController *v23;
  CarChromeViewController *v24;
  objc_class *v25;
  NSString *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  CarChromeViewController *v31;
  CarChromeViewController *v32;
  objc_class *v33;
  NSString *v34;
  void *v35;
  void *v36;
  void *v37;
  CarChromeViewController *v38;
  CarChromeViewController *v39;
  objc_class *v40;
  NSString *v41;
  void *v42;
  void *v43;
  void *v44;
  __CFString *v45;
  const char *v46;
  NSObject *v47;
  os_log_type_t v48;
  void *v49;
  __CFString *v50;
  __CFString *v51;
  unint64_t v52;
  const __CFString *v53;
  void *v54;
  unint64_t v55;
  __CFString *v56;
  uint8_t buf[4];
  __CFString *v58;
  __int16 v59;
  CarChromeViewController *v60;
  __int16 v61;
  const __CFString *v62;
  __int16 v63;
  __CFString *v64;

  v4 = (CarChromeViewController *)a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController object](v4, "object"));
  v6 = objc_opt_class(CRSUIWindow);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    v7 = v5;
  else
    v7 = 0;
  v8 = v7;

  if (!v8)
  {
    v22 = sub_100432D1C();
    v13 = objc_claimAutoreleasedReturnValue(v22);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      goto LABEL_47;
    v23 = self;
    v24 = v23;
    if (!v23)
    {
      v21 = CFSTR("<nil>");
      goto LABEL_40;
    }
    v25 = (objc_class *)objc_opt_class(v23);
    v26 = NSStringFromClass(v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    if ((objc_opt_respondsToSelector(v24, "accessibilityIdentifier") & 1) != 0)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController performSelector:](v24, "performSelector:", "accessibilityIdentifier"));
      v29 = v28;
      if (v28 && !objc_msgSend(v28, "isEqualToString:", v27))
      {
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v27, v24, v29));

        goto LABEL_22;
      }

    }
    v21 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v27, v24));
LABEL_22:

LABEL_40:
    *(_DWORD *)buf = 138543618;
    v58 = v21;
    v59 = 2112;
    v60 = v4;
    v46 = "[%{public}@] was notified from an unsupported window scene: %@";
    v47 = v13;
    v48 = OS_LOG_TYPE_FAULT;
LABEL_43:
    _os_log_impl((void *)&_mh_execute_header, v47, v48, v46, buf, 0x16u);
LABEL_46:

    goto LABEL_47;
  }
  if ((-[CarChromeViewController isViewLoaded](self, "isViewLoaded") & 1) == 0)
  {
    v30 = sub_100432D1C();
    v13 = objc_claimAutoreleasedReturnValue(v30);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      goto LABEL_47;
    v31 = self;
    v32 = v31;
    if (!v31)
    {
      v21 = CFSTR("<nil>");
      goto LABEL_42;
    }
    v33 = (objc_class *)objc_opt_class(v31);
    v34 = NSStringFromClass(v33);
    v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
    if ((objc_opt_respondsToSelector(v32, "accessibilityIdentifier") & 1) != 0)
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController performSelector:](v32, "performSelector:", "accessibilityIdentifier"));
      v37 = v36;
      if (v36 && !objc_msgSend(v36, "isEqualToString:", v35))
      {
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v35, v32, v37));

        goto LABEL_30;
      }

    }
    v21 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v35, v32));
LABEL_30:

LABEL_42:
    *(_DWORD *)buf = 138543618;
    v58 = v21;
    v59 = 2112;
    v60 = v8;
    v46 = "[%{public}@] Ignoring update from window %@, our view is not loaded";
    v47 = v13;
    v48 = OS_LOG_TYPE_DEBUG;
    goto LABEL_43;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController view](self, "view"));
  v10 = (CarChromeViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "window"));

  v11 = sub_100432D1C();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v13 = v12;
  if (v8 == v10)
  {
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
LABEL_57:

      -[CarChromeViewController _updateMapToCurrentUserInterfaceStyleAnimated:](self, "_updateMapToCurrentUserInterfaceStyleAnimated:", -[ChromeViewController isSuppressed](self, "isSuppressed") ^ 1);
      goto LABEL_48;
    }
    v38 = self;
    v39 = v38;
    if (!v38)
    {
      v45 = CFSTR("<nil>");
      goto LABEL_50;
    }
    v40 = (objc_class *)objc_opt_class(v38);
    v41 = NSStringFromClass(v40);
    v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
    if ((objc_opt_respondsToSelector(v39, "accessibilityIdentifier") & 1) != 0)
    {
      v43 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController performSelector:](v39, "performSelector:", "accessibilityIdentifier"));
      v44 = v43;
      if (v43 && !objc_msgSend(v43, "isEqualToString:", v42))
      {
        v45 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v42, v39, v44));

        goto LABEL_38;
      }

    }
    v45 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v42, v39));
LABEL_38:

LABEL_50:
    v51 = v45;
    v52 = -[CarChromeViewController sceneType](v39, "sceneType");
    if (v52 > 7)
      v53 = CFSTR(".Unknown");
    else
      v53 = off_1011AD748[v52];
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController traitCollection](v39, "traitCollection"));
    v55 = (unint64_t)objc_msgSend(v54, "_car_userInterfaceStyle");
    if (v55 >= 3)
      v56 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Unknown %ld>"), v55));
    else
      v56 = off_1011AD788[v55];
    *(_DWORD *)buf = 138544130;
    v58 = v51;
    v59 = 2112;
    v60 = v39;
    v61 = 2112;
    v62 = v53;
    v63 = 2112;
    v64 = v56;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "[%{public}@] In %@: _carPlayWindowMapStyleDidChange: carSceneType: %@, interfaceStyle: %@", buf, 0x2Au);

    goto LABEL_57;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v14 = self;
    v15 = v14;
    if (!v14)
    {
      v21 = CFSTR("<nil>");
      goto LABEL_45;
    }
    v16 = (objc_class *)objc_opt_class(v14);
    v17 = NSStringFromClass(v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    if ((objc_opt_respondsToSelector(v15, "accessibilityIdentifier") & 1) != 0)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController performSelector:](v15, "performSelector:", "accessibilityIdentifier"));
      v20 = v19;
      if (v19 && !objc_msgSend(v19, "isEqualToString:", v18))
      {
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v18, v15, v20));

        goto LABEL_14;
      }

    }
    v21 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v18, v15));
LABEL_14:

LABEL_45:
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController view](v15, "view"));
    v50 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "window"));
    *(_DWORD *)buf = 138543874;
    v58 = v21;
    v59 = 2112;
    v60 = v8;
    v61 = 2112;
    v62 = v50;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "[%{public}@] Ignoring update from a window: %@ that does not belong to this VC (%@)", buf, 0x20u);

    goto LABEL_46;
  }
LABEL_47:

LABEL_48:
}

- (void)lightLevelController:(id)a3 didUpdateLightLevel:(int64_t)a4
{
  -[CarChromeViewController _updateMapToCurrentUserInterfaceStyleAnimated:](self, "_updateMapToCurrentUserInterfaceStyleAnimated:", 1, a4);
}

- (void)_updateMapToCurrentUserInterfaceStyleAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CarChromeViewController traitCollection](self, "traitCollection"));
  -[CarChromeViewController _updateMapUserInterfaceStyle:animated:](self, "_updateMapUserInterfaceStyle:animated:", objc_msgSend(v5, "_car_userInterfaceStyle"), v3);

}

- (void)_updateMapUserInterfaceStyle:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  NSObject *v8;
  CarChromeViewController *v9;
  CarChromeViewController *v10;
  objc_class *v11;
  NSString *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  __CFString *v18;
  id v19;
  NSObject *v20;
  CarChromeViewController *v21;
  CarChromeViewController *v22;
  objc_class *v23;
  NSString *v24;
  void *v25;
  void *v26;
  void *v27;
  __CFString *v28;
  void *v29;
  unsigned int v30;
  __CFString *v31;
  __CFString *v32;
  void *v33;
  void *v34;
  uint8_t buf[4];
  __CFString *v36;
  __int16 v37;
  __CFString *v38;

  v4 = a4;
  v7 = sub_100432D1C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    goto LABEL_14;
  v9 = self;
  v10 = v9;
  if (!v9)
  {
    v16 = CFSTR("<nil>");
    goto LABEL_10;
  }
  v11 = (objc_class *)objc_opt_class(v9);
  v12 = NSStringFromClass(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  if ((objc_opt_respondsToSelector(v10, "accessibilityIdentifier") & 1) != 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController performSelector:](v10, "performSelector:", "accessibilityIdentifier"));
    v15 = v14;
    if (v14 && !objc_msgSend(v14, "isEqualToString:", v13))
    {
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v13, v10, v15));

      goto LABEL_8;
    }

  }
  v16 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v13, v10));
LABEL_8:

LABEL_10:
  v17 = v16;
  if ((unint64_t)a3 >= 3)
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Unknown %ld>"), a3));
  else
    v18 = off_1011AD788[a3];
  *(_DWORD *)buf = 138543618;
  v36 = v17;
  v37 = 2112;
  v38 = v18;
  _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}@] In _updateMapUserInterfaceStyle : %@", buf, 0x16u);

LABEL_14:
  v19 = sub_100432D1C();
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (!os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    goto LABEL_26;
  v21 = self;
  v22 = v21;
  if (!v21)
  {
    v28 = CFSTR("<nil>");
    goto LABEL_23;
  }
  v23 = (objc_class *)objc_opt_class(v21);
  v24 = NSStringFromClass(v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  if ((objc_opt_respondsToSelector(v22, "accessibilityIdentifier") & 1) != 0)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController performSelector:](v22, "performSelector:", "accessibilityIdentifier"));
    v27 = v26;
    if (v26 && !objc_msgSend(v26, "isEqualToString:", v25))
    {
      v28 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v25, v22, v27));

      goto LABEL_21;
    }

  }
  v28 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v25, v22));
LABEL_21:

LABEL_23:
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](v22, "mapView"));
  v30 = objc_msgSend(v29, "_showsNightMode");
  v31 = CFSTR("NO");
  if (v30)
    v31 = CFSTR("YES");
  v32 = v31;
  *(_DWORD *)buf = 138543618;
  v36 = v28;
  v37 = 2112;
  v38 = v32;
  _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "[%{public}@] In _updateMapUserInterfaceStyle self.mapView.showsNightMode : %@", buf, 0x16u);

LABEL_26:
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[GroupAnimation animationForAnimatedFlag:](GroupAnimation, "animationForAnimatedFlag:", v4));
  -[CarChromeViewController _performMapUpdateToUserInterfaceStyle:animation:](self, "_performMapUpdateToUserInterfaceStyle:animation:", a3, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController navigationDisplay](self, "navigationDisplay"));
  objc_msgSend(v34, "setTemporaryDisplayRate:forDuration:", -1, 2.0);

  objc_msgSend(v33, "runWithDuration:delay:options:", 196608, 2.0, 0.0);
}

- (void)_performMapUpdateToUserInterfaceStyle:(int64_t)a3 animation:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  CarChromeViewController *v9;
  CarChromeViewController *v10;
  objc_class *v11;
  NSString *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  __CFString *v18;
  int BOOL;
  __CFString *v20;
  __CFString *v21;
  id v22;
  NSObject *v23;
  CarChromeViewController *v24;
  CarChromeViewController *v25;
  objc_class *v26;
  NSString *v27;
  void *v28;
  void *v29;
  void *v30;
  __CFString *v31;
  __CFString *v32;
  void *v33;
  void *v34;
  unint64_t v35;
  __CFString *v36;
  id v37;
  NSObject *v38;
  CarChromeViewController *v39;
  CarChromeViewController *v40;
  objc_class *v41;
  NSString *v42;
  void *v43;
  void *v44;
  void *v45;
  __CFString *v46;
  __CFString *v47;
  void *v48;
  unint64_t v49;
  __CFString *v50;
  _QWORD v51[6];
  uint8_t buf[4];
  __CFString *v53;
  __int16 v54;
  __CFString *v55;
  __int16 v56;
  __CFString *v57;

  v6 = a4;
  v7 = sub_100432D1C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    goto LABEL_16;
  v9 = self;
  v10 = v9;
  if (!v9)
  {
    v16 = CFSTR("<nil>");
    goto LABEL_10;
  }
  v11 = (objc_class *)objc_opt_class(v9);
  v12 = NSStringFromClass(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  if ((objc_opt_respondsToSelector(v10, "accessibilityIdentifier") & 1) != 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController performSelector:](v10, "performSelector:", "accessibilityIdentifier"));
    v15 = v14;
    if (v14 && !objc_msgSend(v14, "isEqualToString:", v13))
    {
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v13, v10, v15));

      goto LABEL_8;
    }

  }
  v16 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v13, v10));
LABEL_8:

LABEL_10:
  v17 = v16;
  if ((unint64_t)a3 >= 3)
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Unknown %ld>"), a3));
  else
    v18 = off_1011AD788[a3];
  BOOL = GEOConfigGetBOOL(MapsConfig_CarPlayMapAppearanceShouldFollowUserInterfaceStyle, off_1014B4768);
  v20 = CFSTR("NO");
  if (BOOL)
    v20 = CFSTR("YES");
  v21 = v20;
  *(_DWORD *)buf = 138543874;
  v53 = v17;
  v54 = 2112;
  v55 = v18;
  v56 = 2112;
  v57 = v21;
  _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}@] In _performMapUpdateToUserInterfaceStyle: %@, CarPlayMapAppearanceShouldFollowUserInterfaceStyle: %@", buf, 0x20u);

LABEL_16:
  v22 = sub_100432D1C();
  v23 = objc_claimAutoreleasedReturnValue(v22);
  if (!os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    goto LABEL_29;
  v24 = self;
  v25 = v24;
  if (!v24)
  {
    v31 = CFSTR("<nil>");
    goto LABEL_25;
  }
  v26 = (objc_class *)objc_opt_class(v24);
  v27 = NSStringFromClass(v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
  if ((objc_opt_respondsToSelector(v25, "accessibilityIdentifier") & 1) != 0)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController performSelector:](v25, "performSelector:", "accessibilityIdentifier"));
    v30 = v29;
    if (v29 && !objc_msgSend(v29, "isEqualToString:", v28))
    {
      v31 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v28, v25, v30));

      goto LABEL_23;
    }

  }
  v31 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v28, v25));
LABEL_23:

LABEL_25:
  v32 = v31;
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](v25, "mapView"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "traitCollection"));
  v35 = (unint64_t)objc_msgSend(v34, "_car_userInterfaceStyle");
  if (v35 >= 3)
    v36 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Unknown %ld>"), v35));
  else
    v36 = off_1011AD788[v35];
  *(_DWORD *)buf = 138543618;
  v53 = v32;
  v54 = 2112;
  v55 = v36;
  _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "[%{public}@] self.mapView.traitCollection._car_userInterfaceStyle: %@", buf, 0x16u);

LABEL_29:
  v37 = sub_100432D1C();
  v38 = objc_claimAutoreleasedReturnValue(v37);
  if (!os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    goto LABEL_42;
  v39 = self;
  v40 = v39;
  if (!v39)
  {
    v46 = CFSTR("<nil>");
    goto LABEL_38;
  }
  v41 = (objc_class *)objc_opt_class(v39);
  v42 = NSStringFromClass(v41);
  v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
  if ((objc_opt_respondsToSelector(v40, "accessibilityIdentifier") & 1) != 0)
  {
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController performSelector:](v40, "performSelector:", "accessibilityIdentifier"));
    v45 = v44;
    if (v44 && !objc_msgSend(v44, "isEqualToString:", v43))
    {
      v46 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v43, v40, v45));

      goto LABEL_36;
    }

  }
  v46 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v43, v40));
LABEL_36:

LABEL_38:
  v47 = v46;
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](v40, "mapView"));
  v49 = (unint64_t)objc_msgSend(v48, "overrideUserInterfaceStyle");
  if (v49 >= 3)
    v50 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Unknown %ld>"), v49));
  else
    v50 = off_1011AD788[v49];
  *(_DWORD *)buf = 138543618;
  v53 = v47;
  v54 = 2112;
  v55 = v50;
  _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "[%{public}@] self.mapView.overrideUserInterfaceStyle: %@", buf, 0x16u);

LABEL_42:
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472;
  v51[2] = sub_100238518;
  v51[3] = &unk_1011AD518;
  v51[4] = self;
  v51[5] = a3;
  objc_msgSend(v6, "addAnimations:completion:", v51, 0);

}

+ (Class)userLocationViewClass
{
  return (Class)objc_opt_class(CarUserLocationView, a2);
}

- (void)_resetMapViewDefaults:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  char v9;
  _BYTE v10[23];
  uint8_t buf[16];

  if (a3)
  {
    v4 = a3;
    v5 = sub_10043364C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Will reset mapView default settings", buf, 2u);
    }

    objc_msgSend(v4, "setZoomEnabled:", 0);
    v7 = objc_msgSend((id)objc_opt_class(self), "allowOneHandedZooming");
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_oneHandedZoomGestureRecognizer"));
    objc_msgSend(v8, "setEnabled:", v7);

    objc_msgSend(v4, "setShowsUserLocation:", 1);
    *(_OWORD *)v10 = *(_OWORD *)((char *)VKAnnotationTrackingBehaviorDefault + 1);
    *(_QWORD *)&v10[15] = VKAnnotationTrackingBehaviorDefault[2];
    v9 = 0;
    objc_msgSend(v4, "_setUserTrackingBehavior:", &v9);

  }
}

- (void)prepareMapViewForFirstUse
{
  void *v3;
  MapViewResponder *v4;
  MapViewResponder *mapViewResponder;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  CarOneHandedZoomConfiguration *v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  void *v19;
  void *v20;
  _OWORD v21[3];
  uint64_t v22;
  __int128 v23;
  int64x2_t v24;
  __int128 v25;
  uint64_t v26;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)CarChromeViewController;
  -[ChromeViewController prepareMapViewForFirstUse](&v27, "prepareMapViewForFirstUse");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
  v4 = -[MapViewResponder initWithMapView:]([MapViewResponder alloc], "initWithMapView:", v3);
  mapViewResponder = self->_mapViewResponder;
  self->_mapViewResponder = v4;

  -[CarMapNudgerizer setMapView:](self->_nudgerizer, "setMapView:", v3);
  -[ChromeMapSettings setMapView:](self->_defaultMapSettings, "setMapView:", v3);
  -[CarRouteSelectionController setMapView:](self->_routeSelectionController, "setMapView:", v3);
  -[CarChromeViewController _updateOfflineModernMapToken](self, "_updateOfflineModernMapToken");
  self->_configuringMapView = 1;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_mapLayer"));
  objc_msgSend(v6, "setDisplayRate:", 30);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_mapLayer"));
  objc_msgSend(v7, "setNavigationShieldSize:", 5);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_mapLayer"));
  objc_msgSend(v8, "setShieldSize:", 4);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_mapLayer"));
  objc_msgSend(v9, "setShieldIdiom:", 1);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_mapLayer"));
  objc_msgSend(v10, "setLabelScaleFactor:", 2);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_mapLayer"));
  objc_msgSend(v11, "setApplicationUILayout:", 1);

  objc_msgSend(v3, "setShowsTraffic:", 1);
  objc_msgSend(v3, "_setShowsTrafficIncidents:", 1);
  v26 = 0;
  v24 = 0u;
  v25 = 0u;
  v23 = 0u;
  if (v3)
    objc_msgSend(v3, "_cartographicConfiguration");
  *((_QWORD *)&v23 + 1) = 2;
  *(_QWORD *)&v25 = 0;
  if (!-[CarChromeViewController shouldUseModernMap](self, "shouldUseModernMap"))
    v24 = vdupq_n_s64(1uLL);
  v21[0] = v23;
  v21[1] = v24;
  v21[2] = v25;
  v22 = v26;
  objc_msgSend(v3, "_setCartographicConfiguration:", v21);
  objc_msgSend(v3, "setCompassEnabled:", 0);
  objc_msgSend(v3, "setScaleEnabled:", 0);
  objc_msgSend(v3, "_setUseVehicleHeading:", 1);
  objc_msgSend(v3, "_setCanSelectPOIs:", -[CarChromeViewController _canSelectAlternateRoutes](self, "_canSelectAlternateRoutes"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _maps_keyColor](UIColor, "_maps_keyColor"));
  objc_msgSend(v3, "setTintColor:", v12);

  objc_msgSend(v3, "_setShouldLoadFallbackTiles:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_panningGestureRecognizer"));
  objc_msgSend(v13, "setAllowedTouchTypes:", &off_101272F60);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_oneHandedZoomGestureRecognizer"));
  objc_msgSend(v14, "setAllowedPressTypes:", &off_101272F78);
  v15 = -[CarOneHandedZoomConfiguration initWithGestureRecongizer:]([CarOneHandedZoomConfiguration alloc], "initWithGestureRecongizer:", v14);
  objc_msgSend(v14, "setConfiguration:", v15);

  objc_msgSend(v3, "_setShowsVenues:", 0);
  objc_msgSend(v3, "_setLoadLookAroundAvailability:", 0);
  -[CarChromeViewController _resetMapViewDefaults:](self, "_resetMapViewDefaults:", v3);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController _maps_mapsSceneDelegate](self, "_maps_mapsSceneDelegate"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "entryPointsCoordinator"));
  v18 = objc_msgSend(v17, "didLaunchWithExplicitIntent");

  if ((v18 & 1) == 0)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController defaultMapSettings](self, "defaultMapSettings"));
    objc_msgSend(v19, "applyToMapViewAnimated:duration:completion:", 0, 0, 0.0);

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController traitCollection](self, "traitCollection"));
  -[CarChromeViewController _updateMapUserInterfaceStyle:animated:](self, "_updateMapUserInterfaceStyle:animated:", objc_msgSend(v20, "_car_userInterfaceStyle"), 1);

}

- (BOOL)shouldAnimateMapTransition:(BOOL)a3
{
  void *v4;
  void *v5;
  unsigned __int8 v6;

  if (!a3)
    return 0;
  if (!-[ChromeViewController isTransitioning](self, "isTransitioning"))
    return 1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController previousTopContext](self, "previousTopContext"));
  if (objc_msgSend(v4, "showsMapView"))
    v6 = objc_msgSend(v5, "showsMapView");
  else
    v6 = 0;

  return v6;
}

- (id)allComponents
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  objc_super v7;
  _QWORD v8[4];

  v7.receiver = self;
  v7.super_class = (Class)CarChromeViewController;
  v2 = -[ChromeViewController allComponents](&v7, "allComponents");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = objc_msgSend(v3, "mutableCopy");

  v8[0] = CFSTR("cards");
  v8[1] = CFSTR("accessories");
  v8[2] = CFSTR("mapcontrols");
  v8[3] = CFSTR("statusBanner");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v8, 4));
  objc_msgSend(v4, "addObjectsFromArray:", v5);

  return v4;
}

- (void)willUpdateComponents:(id)a3 withAnimation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned __int8 v9;
  double v10;
  void *v11;
  unsigned int v12;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CarChromeViewController;
  -[ChromeViewController willUpdateComponents:withAnimation:](&v13, "willUpdateComponents:withAnimation:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("cards"), CFSTR("statusBanner"), 0));
  v9 = objc_msgSend(v6, "intersectsSet:", v8);

  v10 = 1.0;
  if ((v9 & 1) != 0)
    goto LABEL_4;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("accessories"), 1.0, CFSTR("mapcontrols"), 0));
  v12 = objc_msgSend(v6, "intersectsSet:", v11);

  if (v12)
  {
    v10 = 0.1;
LABEL_4:
    objc_msgSend(v7, "setDuration:", v10);
  }

}

- (void)updateComponent:(id)a3 forTiming:(unint64_t)a4 withAnimation:(id)a5
{
  __CFString *v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  NSLayoutConstraint **p_headingUpMapInsetAdjustmentConstraint;
  uint64_t v17;
  void *v18;
  objc_super v19;

  v8 = (__CFString *)a3;
  v9 = a5;
  if (v8 == CFSTR("cards"))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
    -[CarChromeViewController _updateCardsForContext:withAnimation:completion:](self, "_updateCardsForContext:withAnimation:completion:", v18, v9, 0);
LABEL_14:

    goto LABEL_15;
  }
  if (v8 != CFSTR("statusBanner"))
  {
    if (v8 == CFSTR("accessories"))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
      -[CarChromeViewController _reloadAccessoriesForContext:withAnimation:](self, "_reloadAccessoriesForContext:withAnimation:", v18, v9);
    }
    else
    {
      if (v8 != CFSTR("mapcontrols"))
      {
        if (CFSTR("mapInsets") != v8)
        {
LABEL_19:
          v19.receiver = self;
          v19.super_class = (Class)CarChromeViewController;
          -[ChromeViewController updateComponent:forTiming:withAnimation:](&v19, "updateComponent:forTiming:withAnimation:", v8, a4, v9);
          goto LABEL_15;
        }
        if (!-[ChromeViewController isRunningNavigationDisplay](self, "isRunningNavigationDisplay"))
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
          if (objc_msgSend(v10, "userTrackingMode") == (id)2)
          {
            v11 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
            objc_msgSend(v11, "vehicleHeadingOrCourse");
            v13 = v12;

            if (v13 > -1.0)
            {
              v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController view](self, "view"));
              objc_msgSend(v14, "bounds");
              p_headingUpMapInsetAdjustmentConstraint = &self->_headingUpMapInsetAdjustmentConstraint;
              -[NSLayoutConstraint setConstant:](self->_headingUpMapInsetAdjustmentConstraint, "setConstant:", round(v15 / 2.5));

              v17 = 1;
LABEL_18:
              -[NSLayoutConstraint setActive:](*p_headingUpMapInsetAdjustmentConstraint, "setActive:", v17);
              goto LABEL_19;
            }
          }
          else
          {

          }
        }
        v17 = 0;
        p_headingUpMapInsetAdjustmentConstraint = &self->_headingUpMapInsetAdjustmentConstraint;
        goto LABEL_18;
      }
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
      -[CarChromeViewController _reloadMapControlsForContext:withAnimation:](self, "_reloadMapControlsForContext:withAnimation:", v18, v9);
    }
    goto LABEL_14;
  }
  -[CarChromeViewController _reloadStatusBannerWithAnimation:](self, "_reloadStatusBannerWithAnimation:", v9);
LABEL_15:

}

- (BOOL)mapSettings:(id)a3 shouldApplyAnimated:(BOOL *)a4
{
  ChromeMapSettings *v6;
  BOOL v7;
  BOOL v8;
  id v10;
  NSObject *v11;
  uint8_t v12[16];

  v6 = (ChromeMapSettings *)a3;
  if (CarDisplayIsDriveCameraEnabled()
    && (id)-[ChromeMapSettings type](v6, "type") == (id)1
    && (-[ChromeViewController setNeedsUpdateComponent:animated:](self, "setNeedsUpdateComponent:animated:", CFSTR("navigationDisplay"), *a4), -[ChromeMapSettings pitched](v6, "pitched")))
  {
    v7 = -[CarChromeViewController shouldAnimateMapTransition:](self, "shouldAnimateMapTransition:", *a4);
    v8 = 0;
    *a4 = v7;
  }
  else if (self->_defaultMapSettings == v6
         && !-[CarChromeViewController shouldRecenterAndZoom](self, "shouldRecenterAndZoom"))
  {
    v10 = sub_10043364C();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Will not recenter and zoom, not allowed", v12, 2u);
    }

    v8 = 0;
  }
  else
  {
    if (a4)
      *a4 = -[CarChromeViewController shouldAnimateMapTransition:](self, "shouldAnimateMapTransition:", *a4);
    v8 = 1;
  }

  return v8;
}

- (double)mapInsetsUpdateAnimationDuration
{
  return 1.0;
}

- (BOOL)shouldRecenterAndZoom
{
  _BOOL4 configuringMapView;
  void *v4;
  char v5;
  void *v6;
  unsigned __int8 v7;

  configuringMapView = self->_configuringMapView;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
  v5 = objc_opt_respondsToSelector(v4, "allowMapZoomAndRecentering");

  if ((v5 & 1) == 0)
    return configuringMapView;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
  v7 = objc_msgSend(v6, "allowMapZoomAndRecentering");

  return v7;
}

- (void)mapView:(id)a3 didUpdateUserLocation:(id)a4
{
  void *v5;
  double v6;
  double v7;
  unsigned int v8;
  void *v9;
  unsigned int v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CarChromeViewController;
  -[CarChromeViewController mapView:didUpdateUserLocation:](&v15, "mapView:didUpdateUserLocation:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  objc_msgSend(v5, "vehicleHeadingOrCourse");
  v7 = v6;
  v8 = -[CarChromeViewController haveVehicleDirection](self, "haveVehicleDirection");
  if (v7 <= -1.0)
  {
    if (!v8)
      goto LABEL_6;
    goto LABEL_5;
  }
  if ((v8 & 1) == 0)
  {
LABEL_5:
    -[CarChromeViewController setHaveVehicleDirection:](self, "setHaveVehicleDirection:", v7 > -1.0);
    -[ChromeViewController setNeedsUpdateMapInsets](self, "setNeedsUpdateMapInsets");
  }
LABEL_6:
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v10 = objc_msgSend(v9, "isInNavigatingState");

  if (v7 == -1.0)
    v11 = v10;
  else
    v11 = 1;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController userLocationView](self, "userLocationView"));
  v13 = objc_msgSend(v12, "mode");

  if (v13 != (id)v11)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController userLocationView](self, "userLocationView"));
    objc_msgSend(v14, "setMode:", v11);

  }
}

- (void)mapView:(id)a3 didFailToLocateUserWithError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned int v9;
  void *v10;
  unsigned int v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  NSObject *v16;
  uint8_t v17[16];
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CarChromeViewController;
  -[CarChromeViewController mapView:didFailToLocateUserWithError:](&v18, "mapView:didFailToLocateUserWithError:", v6, v7);
  if ((objc_msgSend(v6, "hasUserLocation") & 1) == 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
    v9 = objc_msgSend(v8, "isCurrentlyConnectedToCarAppScene");

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "domain"));
      v11 = objc_msgSend(v10, "isEqualToString:", MKLocationErrorDomain);

      if (v11)
      {
        v12 = sub_10043364C();
        v13 = objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v17 = 0;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Notified did fail to locate user, will request location services error alert", v17, 2u);
        }

        v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
        objc_msgSend(v14, "showLocationServicesAlertWithError:", v7);

        v15 = sub_10043364C();
        v16 = objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v17 = 0;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Will force user tracking to None and hide user location", v17, 2u);
        }

        objc_msgSend(v6, "setUserTrackingMode:", 0);
        objc_msgSend(v6, "setShowsUserLocation:", 0);
      }
    }
  }

}

- (BOOL)mapView:(id)a3 shouldSelectLabelMarker:(id)a4
{
  id v6;
  unsigned int v7;
  id v8;
  NSObject *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  objc_super v15;
  uint8_t buf[4];
  __CFString *v17;
  __int16 v18;
  __CFString *v19;

  v6 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CarChromeViewController;
  -[ChromeViewController mapView:shouldSelectLabelMarker:](&v15, "mapView:shouldSelectLabelMarker:", a3, v6);
  if (-[CarChromeViewController _canSelectAlternateRoutes](self, "_canSelectAlternateRoutes"))
    v7 = objc_msgSend(v6, "isRouteEta");
  else
    v7 = 0;
  v8 = sub_10043364C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    if (v7)
      v10 = CFSTR("YES");
    else
      v10 = CFSTR("NO");
    v11 = v10;
    if (objc_msgSend(v6, "isRouteEta"))
      v12 = CFSTR("YES");
    else
      v12 = CFSTR("NO");
    v13 = v12;
    *(_DWORD *)buf = 138412546;
    v17 = v11;
    v18 = 2112;
    v19 = v13;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "shouldSelectLabelMarker: %@, isRouteETA: %@", buf, 0x16u);

  }
  return v7;
}

- (void)mapView:(id)a3 didSelectLabelMarker:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  unsigned int v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  objc_super v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  __CFString *v21;

  v6 = a3;
  v7 = a4;
  v8 = sub_10043364C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = objc_msgSend(v7, "isRouteEta");
    v11 = CFSTR("NO");
    if (v10)
      v11 = CFSTR("YES");
    v12 = v11;
    *(_DWORD *)buf = 138412546;
    v19 = v7;
    v20 = 2112;
    v21 = v12;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "User didSelectLabelMarker: %@, isRouteETA: %@", buf, 0x16u);

  }
  if (objc_msgSend(v7, "isRouteEta"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController routeSelectionController](self, "routeSelectionController"));
    objc_msgSend(v13, "mapView:didSelectLabelMarker:", v6, v7);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
  v15 = objc_opt_respondsToSelector(v14, "mapView:didSelectLabelMarker:");

  if ((v15 & 1) != 0)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
    objc_msgSend(v16, "mapView:didSelectLabelMarker:", v6, v7);

  }
  v17.receiver = self;
  v17.super_class = (Class)CarChromeViewController;
  -[ChromeViewController mapView:didSelectLabelMarker:](&v17, "mapView:didSelectLabelMarker:", v6, v7);

}

- (void)mapView:(id)a3 didDeselectLabelMarker:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
  v9 = objc_opt_respondsToSelector(v8, "mapView:didDeselectLabelMarker:");

  if ((v9 & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
    objc_msgSend(v10, "mapView:didDeselectLabelMarker:", v6, v7);

  }
  v11.receiver = self;
  v11.super_class = (Class)CarChromeViewController;
  -[ChromeViewController mapView:didDeselectLabelMarker:](&v11, "mapView:didDeselectLabelMarker:", v6, v7);

}

- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  double v14;
  double v15;
  id v16;
  double v17;
  double v18;
  uint64_t Integer;
  double Double;
  double v21;
  CLLocationDegrees v22;
  CLLocationDegrees v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  char v28;
  void *v29;
  objc_super v30;

  v4 = a4;
  v6 = a3;
  v7 = objc_msgSend(v6, "_canZoomIn");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController mapControlsOverlay](self, "mapControlsOverlay"));
  objc_msgSend(v8, "setZoomInEnabled:", v7);

  v9 = objc_msgSend(v6, "_canZoomOut");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController mapControlsOverlay](self, "mapControlsOverlay"));
  objc_msgSend(v10, "setZoomOutEnabled:", v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
  LODWORD(v10) = objc_msgSend(v11, "isUsingOfflineMaps");

  if ((_DWORD)v10)
  {
    v12 = objc_msgSend(objc_alloc((Class)CLLocation), "initWithLatitude:longitude:", self->_mapViewRegion.center.latitude, self->_mapViewRegion.center.longitude);
    v13 = objc_alloc((Class)CLLocation);
    objc_msgSend(v6, "region");
    v15 = v14;
    objc_msgSend(v6, "region");
    v16 = objc_msgSend(v13, "initWithLatitude:longitude:", v15);
    objc_msgSend(v12, "distanceFromLocation:", v16);
    v18 = v17;
    Integer = GEOConfigGetInteger(MapsConfig_ViewPortPanDistance, off_1014B4F18);
    Double = GEOConfigGetDouble(MapsConfig_ViewPortZoomLevel, off_1014B4F28);
    if (v18 > (double)Integer || (objc_msgSend(v6, "_zoomLevel"), vabdd_f64(v21, self->_zoomLevel) > Double))
    {
      objc_msgSend(v6, "region");
      self->_mapViewRegion.center.latitude = v22;
      self->_mapViewRegion.center.longitude = v23;
      self->_mapViewRegion.span.latitudeDelta = v24;
      self->_mapViewRegion.span.longitudeDelta = v25;
      objc_msgSend(v6, "_zoomLevel");
      self->_zoomLevel = v26;
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
      v28 = objc_opt_respondsToSelector(v27, "checkFullTextSearchSupport");

      if ((v28 & 1) != 0)
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
        objc_msgSend(v29, "checkFullTextSearchSupport");

      }
    }

  }
  v30.receiver = self;
  v30.super_class = (Class)CarChromeViewController;
  -[ChromeViewController mapView:regionDidChangeAnimated:](&v30, "mapView:regionDidChangeAnimated:", v6, v4);

}

- (void)mapView:(id)a3 canZoomInDidChange:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  objc_super v8;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController mapControlsOverlay](self, "mapControlsOverlay"));
  objc_msgSend(v7, "setZoomInEnabled:", v4);

  v8.receiver = self;
  v8.super_class = (Class)CarChromeViewController;
  -[CarChromeViewController mapView:canZoomInDidChange:](&v8, "mapView:canZoomInDidChange:", v6, v4);

}

- (void)mapView:(id)a3 canZoomOutDidChange:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  objc_super v8;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController mapControlsOverlay](self, "mapControlsOverlay"));
  objc_msgSend(v7, "setZoomOutEnabled:", v4);

  v8.receiver = self;
  v8.super_class = (Class)CarChromeViewController;
  -[CarChromeViewController mapView:canZoomOutDidChange:](&v8, "mapView:canZoomOutDidChange:", v6, v4);

}

- (void)mapView:(id)a3 didStopRespondingToGesture:(int64_t)a4 zoomDirection:(int64_t)a5 zoomGestureType:(int64_t)a6 didDecelerate:(BOOL)a7 tiltDirection:(int64_t)a8
{
  _BOOL8 v9;
  id v14;
  uint64_t v15;
  unsigned int *v16;
  objc_super v17;

  v9 = a7;
  v14 = a3;
  if (!a4)
  {
    v15 = 1001;
LABEL_11:
    -[CarChromeViewController captureUserAction:](self, "captureUserAction:", v15);
    goto LABEL_12;
  }
  if (a4 == 1)
  {
    if (a5 == 1)
      v15 = 1043;
    else
      v15 = 1044;
    if ((unint64_t)a6 <= 7)
    {
      v16 = (unsigned int *)&unk_100E348A0;
      if (a5 == 1)
        v16 = (unsigned int *)&unk_100E34880;
      v15 = v16[a6];
    }
    goto LABEL_11;
  }
LABEL_12:
  v17.receiver = self;
  v17.super_class = (Class)CarChromeViewController;
  -[CarChromeViewController mapView:didStopRespondingToGesture:zoomDirection:zoomGestureType:didDecelerate:tiltDirection:](&v17, "mapView:didStopRespondingToGesture:zoomDirection:zoomGestureType:didDecelerate:tiltDirection:", v14, a4, a5, a6, v9, a8);

}

- (void)mapView:(id)a3 didBecomePitched:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  objc_super v7;

  v4 = a4;
  v7.receiver = self;
  v7.super_class = (Class)CarChromeViewController;
  -[CarChromeViewController mapView:didBecomePitched:](&v7, "mapView:didBecomePitched:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController defaultMapSettings](self, "defaultMapSettings"));
  objc_msgSend(v6, "setPitched:", v4);

  -[CarChromeViewController _update3DButton](self, "_update3DButton");
  -[CarChromeViewController _updateCameraToggleButton](self, "_updateCameraToggleButton");
}

- (void)mapView:(id)a3 canEnter3DModeDidChange:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CarChromeViewController;
  -[CarChromeViewController mapView:canEnter3DModeDidChange:](&v5, "mapView:canEnter3DModeDidChange:", a3, a4);
  -[CarChromeViewController _update3DButton](self, "_update3DButton");
}

- (id)mapView:(id)a3 viewForAnnotation:(id)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;

  v7 = a3;
  v8 = a4;
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userLocation"));

  if (v9 != v8
    || (v10 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController userLocationView](self, "userLocationView"))) == 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapViewDelegateForSelector:](self, "mapViewDelegateForSelector:", a2));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "mapView:viewForAnnotation:", v7, v8));

  }
  return v10;
}

- (void)mapViewDidFinishRenderingMap:(id)a3 fullyRendered:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  objc_super v10;
  uint8_t buf[16];

  v4 = a4;
  v6 = a3;
  v7 = sub_10043364C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Map view did finish rendering, informing Search pins manager so that it can drop pins.", buf, 2u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController searchPinsManager](self, "searchPinsManager"));
  objc_msgSend(v9, "mapViewDidBecomeFullyDrawn");

  v10.receiver = self;
  v10.super_class = (Class)CarChromeViewController;
  -[CarChromeViewController mapViewDidFinishRenderingMap:fullyRendered:](&v10, "mapViewDidFinishRenderingMap:fullyRendered:", v6, v4);

}

- (void)mapViewNavigationCameraHasStoppedPanning:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "_canZoomIn");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController mapControlsOverlay](self, "mapControlsOverlay"));
  objc_msgSend(v6, "setZoomInEnabled:", v5);

  v7 = objc_msgSend(v4, "_canZoomOut");
  v8 = (id)objc_claimAutoreleasedReturnValue(-[CarChromeViewController mapControlsOverlay](self, "mapControlsOverlay"));
  objc_msgSend(v8, "setZoomOutEnabled:", v7);

}

- (void)_locationAuthorizationDidChange:(id)a3
{
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  unsigned int v11;
  __CFString *v12;
  __CFString *v13;
  int v14;
  __CFString *v15;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager", a3));
  if (objc_msgSend(v4, "isLocationServicesAuthorizationNeeded"))
  {
    v5 = sub_10043364C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v14) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Location authorization changed, but it's not yet approved", (uint8_t *)&v14, 2u);
    }
  }
  else
  {
    v7 = objc_msgSend(v4, "isLocationServicesApproved");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
    objc_msgSend(v8, "setShowsUserLocation:", v7);

    v9 = sub_10043364C();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v11 = objc_msgSend(v4, "isLocationServicesApproved");
      v12 = CFSTR("NO");
      if (v11)
        v12 = CFSTR("YES");
      v13 = v12;
      v14 = 138412290;
      v15 = v13;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "mapView.showsUserLocation = %@", (uint8_t *)&v14, 0xCu);

    }
    v6 = objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    -[NSObject removeObserver:name:object:](v6, "removeObserver:name:object:", self, MKLocationManagerApprovalDidChangeNotification, 0);
  }

}

- (void)clearMapGesturesAndAnimations
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController nudgerizer](self, "nudgerizer"));
  objc_msgSend(v3, "_clearGesturesAndAnimations");

  v4.receiver = self;
  v4.super_class = (Class)CarChromeViewController;
  -[ChromeViewController clearMapGesturesAndAnimations](&v4, "clearMapGesturesAndAnimations");
}

- (BOOL)shouldUseModernMap
{
  return !GEOConfigGetBOOL(MapsConfig_StarkEnableMaps357, off_1014B4798)
      || -[MapsTokenStorage count](self->_modernMapTokens, "count") != 0;
}

- (int64_t)modernMapTerrainMode
{
  return 0;
}

- (int64_t)modernMapProjectionType
{
  return 0;
}

- (void)_updateModernMapCartographicConfiguration
{
  int64_t v3;
  int64_t v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  _OWORD v10[3];
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  uint8_t buf[32];
  __int128 v17;
  uint64_t v18;

  if (-[CarChromeViewController shouldUseModernMap](self, "shouldUseModernMap"))
  {
    v3 = -[CarChromeViewController modernMapTerrainMode](self, "modernMapTerrainMode");
    v4 = -[CarChromeViewController modernMapProjectionType](self, "modernMapProjectionType");
  }
  else
  {
    v3 = 1;
    v4 = 1;
  }
  v5 = sub_10043196C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)&buf[4] = v3;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "_updateModernMapCartographicConfiguration with terrainMode: %ld projectionType: %ld", buf, 0x16u);
  }

  v18 = 0;
  v17 = 0u;
  memset(buf, 0, sizeof(buf));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "_cartographicConfiguration");
  }
  else
  {
    v18 = 0;
    v17 = 0u;
    memset(buf, 0, sizeof(buf));
  }

  *(_QWORD *)&buf[16] = v4;
  *(_QWORD *)&buf[24] = v3;
  v13 = *(_OWORD *)&buf[16];
  v14 = v17;
  v15 = v18;
  v12 = *(_OWORD *)buf;
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

- (void)offlineStateChanged:(id)a3
{
  -[CarChromeViewController _updateOfflineModernMapToken](self, "_updateOfflineModernMapToken", a3);
  -[CarChromeViewController reloadStatusBannerAnimated:](self, "reloadStatusBannerAnimated:", 1);
}

- (void)_updateOfflineModernMapToken
{
  _BOOL4 v3;
  void *v4;
  unsigned int v5;
  void *v6;
  id usingOfflineDataModernMapToken;

  v3 = self->_usingOfflineDataModernMapToken == 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[GEOOfflineService shared](GEOOfflineService, "shared"));
  v5 = objc_msgSend(v4, "isUsingOffline");

  if (((v3 ^ v5) & 1) == 0)
  {
    if (v5)
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController acquireModernMapTokenForReason:](self, "acquireModernMapTokenForReason:", 0));
    else
      v6 = 0;
    usingOfflineDataModernMapToken = self->_usingOfflineDataModernMapToken;
    self->_usingOfflineDataModernMapToken = v6;

  }
}

- (BOOL)isDisplayingNavigation
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController pendingContexts](self, "pendingContexts"));
  v4 = v3;
  if (!v3)
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController contexts](self, "contexts"));
  v5 = objc_msgSend(v4, "_maps_firstContextOfClass:", objc_opt_class(CarNavigationModeController));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  if (!v3)
  return v6 != 0;
}

- (BOOL)wantsNavigationDisplayByDefault
{
  unsigned __int8 v3;
  void *v4;
  unsigned __int8 v5;

  v3 = -[CarChromeViewController isDisplayingNavigation](self, "isDisplayingNavigation");
  if (CarDisplayIsDriveCameraEnabled())
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController defaultMapSettings](self, "defaultMapSettings"));
    v5 = objc_msgSend(v4, "pitched");

  }
  else
  {
    v5 = 0;
  }
  return v3 | v5;
}

- (void)_startNavigationObscuredTimeout
{
  void *v3;
  double v4;
  double v5;
  id v6;
  NSObject *v7;
  NSTimer *v8;
  NSTimer *navigationObscuredTimeout;
  int v10;
  double v11;

  -[CarChromeViewController _stopNavigationObscuredTimeout](self, "_stopNavigationObscuredTimeout");
  if (-[CarChromeViewController isDisplayingNavigation](self, "isDisplayingNavigation"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v3, "doubleForKey:", CFSTR("CarNavigationObscuredTimeoutInterval"));
    v5 = v4;

    v6 = sub_10043364C();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v10 = 134217984;
      v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Scheduling navigation obscured timeout (%.1f)", (uint8_t *)&v10, 0xCu);
    }

    v8 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "_navigationObscuredTimeoutFired:", 0, 0, v5));
    navigationObscuredTimeout = self->_navigationObscuredTimeout;
    self->_navigationObscuredTimeout = v8;

  }
}

- (void)_restartNavigationObscuredTimeout
{
  if (self->_navigationObscuredTimeout)
    -[CarChromeViewController _startNavigationObscuredTimeout](self, "_startNavigationObscuredTimeout");
}

- (void)_stopNavigationObscuredTimeout
{
  id v3;
  NSObject *v4;
  NSTimer *navigationObscuredTimeout;
  NSTimer *v6;
  uint8_t v7[16];

  if (self->_navigationObscuredTimeout)
  {
    v3 = sub_10043364C();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Cancelling navigation obscured timeout", v7, 2u);
    }

    navigationObscuredTimeout = self->_navigationObscuredTimeout;
  }
  else
  {
    navigationObscuredTimeout = 0;
  }
  -[NSTimer invalidate](navigationObscuredTimeout, "invalidate");
  v6 = self->_navigationObscuredTimeout;
  self->_navigationObscuredTimeout = 0;

}

- (void)_navigationObscuredTimeoutFired:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  -[CarChromeViewController _stopNavigationObscuredTimeout](self, "_stopNavigationObscuredTimeout", a3);
  if (-[CarChromeViewController isDisplayingNavigation](self, "isDisplayingNavigation"))
  {
    v4 = sub_10043364C();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Navigation obscured timeout fired", v7, 2u);
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CarChromeModeCoordinator sharedInstance](CarChromeModeCoordinator, "sharedInstance"));
    objc_msgSend(v6, "displayNavigation");

  }
}

- (void)chromeNavigationDisplay:(id)a3 configurationDidChange:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CarChromeViewController;
  -[ChromeViewController chromeNavigationDisplay:configurationDidChange:](&v5, "chromeNavigationDisplay:configurationDidChange:", a3, a4);
  -[CarChromeViewController updateZoomControls](self, "updateZoomControls");
}

- (void)chromeNavigationDisplay:(id)a3 didChangePanning:(BOOL)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  objc_super v7;

  v5 = a5;
  v7.receiver = self;
  v7.super_class = (Class)CarChromeViewController;
  -[ChromeViewController chromeNavigationDisplay:didChangePanning:animated:](&v7, "chromeNavigationDisplay:didChangePanning:animated:", a3, a4);
  -[ChromeViewController setNeedsUpdateComponent:animated:](self, "setNeedsUpdateComponent:animated:", CFSTR("mapcontrols"), v5);
}

- (void)chromeNavigationDisplayDidRenderRoute:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CarChromeViewController;
  -[ChromeViewController chromeNavigationDisplayDidRenderRoute:](&v4, "chromeNavigationDisplayDidRenderRoute:", a3);
  -[CarChromeViewController captureUserAction:](self, "captureUserAction:", 3072);
}

- (BOOL)_canSelectAlternateRoutes
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
  if ((objc_opt_respondsToSelector(v3, "supportsAlternateRouteSelection") & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
    v5 = objc_msgSend(v4, "supportsAlternateRouteSelection");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (BOOL)allowOneHandedZooming
{
  return byte_1014A1D00;
}

+ (void)_updateAllowOneHandedZooming
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("__internal__CarPlayOneHandedZoomEnabled")));

  if (v3)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    byte_1014A1D00 = objc_msgSend(v4, "BOOLForKey:", CFSTR("__internal__CarPlayOneHandedZoomEnabled"));

  }
}

- (void)_carOneHandedZoomSettingUpdated:(id)a3
{
  void *v3;

  v3 = (void *)objc_opt_class(self, a2);
  _objc_msgSend(v3, "_updateAllowOneHandedZooming");
}

- (void)_handleDoubleTap:(id)a3
{
  void *v4;
  id v5;
  NSObject *v6;
  void (**v7)(void);
  uint8_t v8[16];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController doubleTapBlock](self, "doubleTapBlock", a3));

  if (v4)
  {
    v5 = sub_10043364C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Will fire doubleTapBlock", v8, 2u);
    }

    v7 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[CarChromeViewController doubleTapBlock](self, "doubleTapBlock"));
    v7[2]();

  }
}

- (void)enableDoubleTapRecognizerWithBlock:(id)a3
{
  id v4;
  UITapGestureRecognizer *doubleTapRecognizer;
  UITapGestureRecognizer *v6;
  UITapGestureRecognizer *v7;
  UITapGestureRecognizer *autohideTapRecognizer;
  void *v9;
  id v10;
  NSObject *v11;
  uint8_t v12[16];

  v4 = a3;
  if (v4)
  {
    doubleTapRecognizer = self->_doubleTapRecognizer;
    if (!doubleTapRecognizer)
    {
      v6 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "_handleDoubleTap:");
      v7 = self->_doubleTapRecognizer;
      self->_doubleTapRecognizer = v6;

      -[UITapGestureRecognizer setNumberOfTapsRequired:](self->_doubleTapRecognizer, "setNumberOfTapsRequired:", 2);
      -[UITapGestureRecognizer setNumberOfTouchesRequired:](self->_doubleTapRecognizer, "setNumberOfTouchesRequired:", 1);
      -[UITapGestureRecognizer setDelegate:](self->_doubleTapRecognizer, "setDelegate:", self);
      autohideTapRecognizer = self->_autohideTapRecognizer;
      if (autohideTapRecognizer)
        -[UITapGestureRecognizer requireGestureRecognizerToFail:](autohideTapRecognizer, "requireGestureRecognizerToFail:", self->_doubleTapRecognizer);
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController view](self, "view"));
      objc_msgSend(v9, "addGestureRecognizer:", self->_doubleTapRecognizer);

      doubleTapRecognizer = self->_doubleTapRecognizer;
    }
    if ((-[UITapGestureRecognizer isEnabled](doubleTapRecognizer, "isEnabled") & 1) == 0)
    {
      v10 = sub_10043364C();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Will enable double tap gesture", v12, 2u);
      }

    }
    -[CarChromeViewController setDoubleTapBlock:](self, "setDoubleTapBlock:", v4);
    -[UITapGestureRecognizer setEnabled:](self->_doubleTapRecognizer, "setEnabled:", 1);
  }
  else
  {
    -[CarChromeViewController disableDoubleTapRecognizer](self, "disableDoubleTapRecognizer");
  }

}

- (void)disableDoubleTapRecognizer
{
  UITapGestureRecognizer *doubleTapRecognizer;
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  doubleTapRecognizer = self->_doubleTapRecognizer;
  if (doubleTapRecognizer)
  {
    if (-[UITapGestureRecognizer isEnabled](doubleTapRecognizer, "isEnabled"))
    {
      v4 = sub_10043364C();
      v5 = objc_claimAutoreleasedReturnValue(v4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Will disable double tap gesture", v6, 2u);
      }

    }
    -[UITapGestureRecognizer setEnabled:](self->_doubleTapRecognizer, "setEnabled:", 0);
    -[CarChromeViewController setDoubleTapBlock:](self, "setDoubleTapBlock:", 0);
  }
}

- (void)setNeedsFocusUpdateIfUnfocused
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "window"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "windowScene"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "focusSystem"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "focusedItem"));

  if (!v7)
    -[CarChromeViewController setNeedsFocusUpdate](self, "setNeedsFocusUpdate");
}

- (BOOL)_shouldAllowKnobFocusMovement
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "window"));
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "windowScene"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v5, "focusSystem"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "focusedItem"));

  v8 = -[CarChromeViewController isAutohidingContentHiddenForCurrentContext](self, "isAutohidingContentHiddenForCurrentContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
  LOBYTE(v5) = objc_opt_respondsToSelector(v9, "shouldAllowKnobFocusMovement");

  if ((v5 & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
    v11 = objc_msgSend(v10, "shouldAllowKnobFocusMovement");

    if (v7)
      return 1;
  }
  else
  {
    v11 = 0;
    if (v7)
      return 1;
  }
  return v8 ^ 1 | v11;
}

- (BOOL)_nudgeHandlesPress:(id)a3
{
  return (unint64_t)objc_msgSend(a3, "type") < 4;
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  if (-[ChromeViewController isSuppressed](self, "isSuppressed")
    || (v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext")),
        v8,
        !v8))
  {
LABEL_11:
    v12.receiver = self;
    v12.super_class = (Class)CarChromeViewController;
    -[CarChromeViewController pressesBegan:withEvent:](&v12, "pressesBegan:withEvent:", v6, v7);
    goto LABEL_12;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
  if ((objc_opt_respondsToSelector(v9, "handlePressesBegan:withEvent:") & 1) == 0
    || !objc_msgSend(v9, "handlePressesBegan:withEvent:", v6, v7))
  {
    if ((objc_opt_respondsToSelector(v9, "allowKnobNudgeMapPanning") & 1) != 0
      && (objc_msgSend(v9, "allowKnobNudgeMapPanning") & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "anyObject"));
      v11 = -[CarChromeViewController _nudgeHandlesPress:](self, "_nudgeHandlesPress:", v10);

      if ((v11 & 1) != 0)
        goto LABEL_12;
    }
    else
    {

    }
    goto LABEL_11;
  }

LABEL_12:
}

- (void)pressesChanged:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  if (-[ChromeViewController isSuppressed](self, "isSuppressed")
    || (v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext")),
        v8,
        !v8))
  {
LABEL_11:
    v12.receiver = self;
    v12.super_class = (Class)CarChromeViewController;
    -[CarChromeViewController pressesChanged:withEvent:](&v12, "pressesChanged:withEvent:", v6, v7);
    goto LABEL_12;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
  if ((objc_opt_respondsToSelector(v9, "handlePressesChanged:withEvent:") & 1) == 0
    || !objc_msgSend(v9, "handlePressesChanged:withEvent:", v6, v7))
  {
    if ((objc_opt_respondsToSelector(v9, "allowKnobNudgeMapPanning") & 1) != 0
      && (objc_msgSend(v9, "allowKnobNudgeMapPanning") & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "anyObject"));
      v11 = -[CarChromeViewController _nudgeHandlesPress:](self, "_nudgeHandlesPress:", v10);

      if ((v11 & 1) != 0)
        goto LABEL_12;
    }
    else
    {

    }
    goto LABEL_11;
  }

LABEL_12:
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  if (-[ChromeViewController isSuppressed](self, "isSuppressed")
    || (v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext")),
        v8,
        !v8))
  {
LABEL_15:
    v15.receiver = self;
    v15.super_class = (Class)CarChromeViewController;
    -[CarChromeViewController pressesEnded:withEvent:](&v15, "pressesEnded:withEvent:", v6, v7);
    goto LABEL_16;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
  if ((objc_opt_respondsToSelector(v9, "handlePressesEnded:withEvent:") & 1) != 0)
    v10 = objc_msgSend(v9, "handlePressesEnded:withEvent:", v6, v7);
  else
    v10 = 0;
  if (-[CarChromeViewController _canSelectAlternateRoutes](self, "_canSelectAlternateRoutes"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController routeSelectionController](self, "routeSelectionController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "anyObject"));
    v10 = objc_msgSend(v11, "handleKnobPress:", v12);

  }
  if (!v10)
  {
    if ((objc_opt_respondsToSelector(v9, "allowKnobNudgeMapPanning") & 1) != 0
      && (objc_msgSend(v9, "allowKnobNudgeMapPanning") & 1) != 0)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "anyObject"));
      v14 = -[CarChromeViewController _nudgeHandlesPress:](self, "_nudgeHandlesPress:", v13);

      if ((v14 & 1) != 0)
        goto LABEL_16;
    }
    else
    {

    }
    goto LABEL_15;
  }

LABEL_16:
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  if (-[ChromeViewController isSuppressed](self, "isSuppressed")
    || (v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext")),
        v8,
        !v8))
  {
LABEL_11:
    v12.receiver = self;
    v12.super_class = (Class)CarChromeViewController;
    -[CarChromeViewController pressesCancelled:withEvent:](&v12, "pressesCancelled:withEvent:", v6, v7);
    goto LABEL_12;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
  if ((objc_opt_respondsToSelector(v9, "handlePressesCancelled:withEvent:") & 1) == 0
    || !objc_msgSend(v9, "handlePressesCancelled:withEvent:", v6, v7))
  {
    if ((objc_opt_respondsToSelector(v9, "allowKnobNudgeMapPanning") & 1) != 0
      && (objc_msgSend(v9, "allowKnobNudgeMapPanning") & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "anyObject"));
      v11 = -[CarChromeViewController _nudgeHandlesPress:](self, "_nudgeHandlesPress:", v10);

      if ((v11 & 1) != 0)
        goto LABEL_12;
    }
    else
    {

    }
    goto LABEL_11;
  }

LABEL_12:
}

- (BOOL)suppressIdleFocus
{
  CarChromeViewController *v2;
  void *v3;

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
  LOBYTE(v2) = -[CarChromeViewController isAutohidingContentHiddenForContext:](v2, "isAutohidingContentHiddenForContext:", v3);

  return (char)v2;
}

- (id)visuallySelectedItem
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
  v4 = objc_opt_respondsToSelector(v3, "visuallySelectedItem");

  if ((v4 & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "visuallySelectedItem"));

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (CarFocusOrderItem)itemRepresentingMapControls
{
  return +[CarFocusOrderItem itemWithRepresentativeItemType:](CarFocusOrderItem, "itemWithRepresentativeItemType:", 0);
}

- (CarFocusOrderItem)itemRepresentingOverlays
{
  return +[CarFocusOrderItem itemWithRepresentativeItemType:](CarFocusOrderItem, "itemWithRepresentativeItemType:", 1);
}

- (CarFocusOrderItem)itemRepresentingAlternateRoutes
{
  return +[CarFocusOrderItem itemWithRepresentativeItemType:](CarFocusOrderItem, "itemWithRepresentativeItemType:", 2);
}

- (CarFocusOrderItem)itemRepresentingStatusBanner
{
  return +[CarFocusOrderItem itemWithRepresentativeItemType:](CarFocusOrderItem, "itemWithRepresentativeItemType:", 3);
}

- (CarFocusOrderEnvironment)environmentRepresentingMapControls
{
  return +[CarFocusOrderEnvironment environmentWithRepresentativeItemType:](CarFocusOrderEnvironment, "environmentWithRepresentativeItemType:", 0);
}

- (CarFocusOrderEnvironment)environmentRepresentingOverlays
{
  return +[CarFocusOrderEnvironment environmentWithRepresentativeItemType:](CarFocusOrderEnvironment, "environmentWithRepresentativeItemType:", 1);
}

- (CarFocusOrderEnvironment)environmentRepresentingAlternateRoutes
{
  return +[CarFocusOrderEnvironment environmentWithRepresentativeItemType:](CarFocusOrderEnvironment, "environmentWithRepresentativeItemType:", 2);
}

- (NSMapTable)lastFocusedIdentifiersByContext
{
  NSMapTable *lastFocusedIdentifiersByContext;
  NSMapTable *v4;
  NSMapTable *v5;

  lastFocusedIdentifiersByContext = self->_lastFocusedIdentifiersByContext;
  if (!lastFocusedIdentifiersByContext)
  {
    v4 = (NSMapTable *)objc_claimAutoreleasedReturnValue(+[NSMapTable weakToStrongObjectsMapTable](NSMapTable, "weakToStrongObjectsMapTable"));
    v5 = self->_lastFocusedIdentifiersByContext;
    self->_lastFocusedIdentifiersByContext = v4;

    lastFocusedIdentifiersByContext = self->_lastFocusedIdentifiersByContext;
  }
  return lastFocusedIdentifiersByContext;
}

- (NSMapTable)lastFocusedItemsByContext
{
  NSMapTable *lastFocusedItemsByContext;
  NSMapTable *v4;
  NSMapTable *v5;

  lastFocusedItemsByContext = self->_lastFocusedItemsByContext;
  if (!lastFocusedItemsByContext)
  {
    v4 = (NSMapTable *)objc_claimAutoreleasedReturnValue(+[NSMapTable weakToWeakObjectsMapTable](NSMapTable, "weakToWeakObjectsMapTable"));
    v5 = self->_lastFocusedItemsByContext;
    self->_lastFocusedItemsByContext = v4;

    lastFocusedItemsByContext = self->_lastFocusedItemsByContext;
  }
  return lastFocusedItemsByContext;
}

- (void)_preserveFocusedItemFromContext:(id)a3 toContext:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "window"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "windowScene"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "focusSystem"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "focusedItem"));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController mapControlsOverlay](self, "mapControlsOverlay"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "focusOrderSubItems"));

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v13 = v12;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v20;
      while (2)
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(_QWORD *)v20 != v16)
            objc_enumerationMutation(v13);
          if (v10 == *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i))
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController lastFocusedItemsByContext](self, "lastFocusedItemsByContext", (_QWORD)v19));
            objc_msgSend(v18, "setObject:forKey:", v10, v5);

            goto LABEL_12;
          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v15)
          continue;
        break;
      }
    }
LABEL_12:

  }
}

- (void)setOwnsFocus:(BOOL)a3
{
  _QWORD block[5];

  if (self->_ownsFocus != a3)
  {
    self->_ownsFocus = a3;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10023B5F8;
    block[3] = &unk_1011AC860;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (BOOL)_isFocusMovementValidInContext:(id)a3
{
  id v4;
  BOOL v5;
  __CFString *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  char *v13;
  id v14;
  NSObject *v15;
  id v16;
  void *v17;
  __CFString *v18;
  void *v19;
  __CFString *v20;
  id v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  char *v25;
  unsigned __int16 v26;
  id v27;
  NSObject *v28;
  id v29;
  NSObject *v30;
  id v31;
  NSObject *v32;
  __CFString *v33;
  void *v34;
  id v35;
  void *v36;
  __CFString *v38;
  _QWORD v39[4];
  NSObject *v40;
  _QWORD v41[4];
  NSObject *v42;
  uint8_t buf[4];
  __CFString *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  id v48;

  v4 = a3;
  if ((objc_msgSend(v4, "focusHeading") & 0x20) != 0
    || (objc_msgSend(v4, "focusHeading") & 0x10) != 0
    || (objc_msgSend(v4, "focusHeading") & 0x100) != 0
    || (objc_msgSend(v4, "focusHeading") & 0x200) != 0)
  {
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController _linearFocusMovementSequences](self, "_linearFocusMovementSequences"));
    if ((unint64_t)-[__CFString count](v6, "count") >= 2)
    {
      v7 = sub_10043364C();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v44 = v6;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "We've produced more than 1 linearMovementSequence, this is not supported. sequences: %@", buf, 0xCu);
      }

    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString firstObject](v6, "firstObject"));
    v10 = v9;
    if (!v9)
    {
      v21 = sub_10043364C();
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_FAULT, "We've don't have a linearMovementSequence. This should never happen. If you see this, check the implementation of _linearFocusMovementSequences.", buf, 2u);
      }
      v5 = 1;
      goto LABEL_44;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "items"));
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_10023BC68;
    v41[3] = &unk_1011AD540;
    v12 = v4;
    v42 = v12;
    v13 = (char *)objc_msgSend(v11, "indexOfObjectPassingTest:", v41);

    if (v13 == (char *)0x7FFFFFFFFFFFFFFFLL)
    {
      v14 = sub_10043364C();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "items"));
        v17 = v16;
        if (v16)
        {
          if (objc_msgSend(v16, "count"))
          {
            v18 = v6;
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "componentsJoinedByString:", CFSTR(", ")));
            v20 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> [%@]"), v17, v19));

            v6 = v18;
          }
          else
          {
            v20 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> (empty)"), v17));
          }
        }
        else
        {
          v20 = CFSTR("<nil>");
        }

        v36 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject nextFocusedItem](v12, "nextFocusedItem"));
        *(_DWORD *)buf = 138412546;
        v44 = v20;
        v45 = 2112;
        v46 = v36;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Focus engine tried to focus something which was not in our provided sequence of items. sequence.items: %@, nextItem: %@", buf, 0x16u);

      }
      v5 = 0;
      goto LABEL_43;
    }
    v38 = v6;
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "items"));
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_10023BCB8;
    v39[3] = &unk_1011AD540;
    v24 = v12;
    v40 = v24;
    v25 = (char *)objc_msgSend(v23, "indexOfObjectPassingTest:", v39);

    v26 = (unsigned __int16)-[NSObject focusHeading](v24, "focusHeading");
    if (v25 == (char *)0x7FFFFFFFFFFFFFFFLL)
    {
      if ((v26 & 0x100) == 0)
      {
        v27 = sub_10043364C();
        v28 = objc_claimAutoreleasedReturnValue(v27);
        v6 = v38;
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "The currently focused item is no longer present in the linear sequence, knob can focus anything.", buf, 2u);
        }

        goto LABEL_33;
      }
      v6 = v38;
      if (v13)
      {
        v29 = sub_10043364C();
        v30 = objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "We are coming to the app from the status bar, but focus engine is trying to focus an item that is not first in the provided linearMovementSequence. Denying this attempt and forcing a new pass.", buf, 2u);
        }

        -[CarChromeViewController setNeedsFocusUpdate](self, "setNeedsFocusUpdate");
LABEL_38:
        v5 = 0;
        goto LABEL_39;
      }
    }
    else
    {
      if ((v26 & 0x20) != 0 && v25 - 1 == v13)
      {
        v5 = 1;
        v6 = v38;
LABEL_39:
        v15 = v40;
LABEL_43:

        v22 = v42;
LABEL_44:

        goto LABEL_45;
      }
      v6 = v38;
      if ((-[NSObject focusHeading](v24, "focusHeading") & 0x10) == 0 || v25 + 1 != v13)
      {
        v31 = sub_10043364C();
        v32 = objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          v33 = (__CFString *)objc_claimAutoreleasedReturnValue(-[NSObject previouslyFocusedItem](v24, "previouslyFocusedItem"));
          v34 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject nextFocusedItem](v24, "nextFocusedItem"));
          v35 = -[NSObject focusHeading](v24, "focusHeading");
          *(_DWORD *)buf = 138412802;
          v44 = v33;
          v45 = 2112;
          v46 = v34;
          v47 = 2048;
          v48 = v35;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "Focus engine tried to focus: %@ from current item: %@ with heading: %ld. This is not supported", buf, 0x20u);

        }
        goto LABEL_38;
      }
    }
LABEL_33:
    v5 = 1;
    goto LABEL_39;
  }
  v5 = 1;
LABEL_45:

  return v5;
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  unsigned __int8 v8;

  v4 = a3;
  if (-[CarChromeViewController _isFocusMovementValidInContext:](self, "_isFocusMovementValidInContext:", v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
    v6 = objc_opt_respondsToSelector(v5, "shouldUpdateFocusInContext:");

    if ((v6 & 1) != 0)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
      v8 = objc_msgSend(v7, "shouldUpdateFocusInContext:", v4);

    }
    else
    {
      v8 = 1;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSArray)preferredFocusEnvironments
{
  id v3;
  CarChromeContext **p_restoreFocusForContext;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSArray *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  _QWORD *v16;
  _QWORD *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *i;
  id v22;
  NSArray *v23;
  objc_super v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[6];
  _QWORD v31[5];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  objc_super v38;
  _BYTE v39[128];
  void *v40;

  if (!self->_ownsFocus)
  {
    v38.receiver = self;
    v38.super_class = (Class)CarChromeViewController;
    v11 = -[CarChromeViewController preferredFocusEnvironments](&v38, "preferredFocusEnvironments");
    v10 = (void *)objc_claimAutoreleasedReturnValue(v11);
    return (NSArray *)v10;
  }
  v3 = (id)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
  p_restoreFocusForContext = &self->_restoreFocusForContext;
  WeakRetained = objc_loadWeakRetained((id *)&self->_restoreFocusForContext);

  if (v3 == WeakRetained)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController lastFocusedItemsByContext](self, "lastFocusedItemsByContext"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v7));

    if (objc_msgSend(v8, "canBecomeFocused"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "superview"));

      if (v9)
      {
        objc_storeWeak((id *)p_restoreFocusForContext, 0);
        v40 = v8;
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v40, 1));
      }
      else
      {
        v10 = &__NSArray0__struct;
      }

      return (NSArray *)v10;
    }
    objc_storeWeak((id *)&self->_restoreFocusForContext, 0);

  }
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = sub_10023C164;
  v36 = sub_10023C174;
  v37 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
  v13 = objc_opt_respondsToSelector(v12, "preferredCarFocusEnvironments");

  if ((v13 & 1) != 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "preferredCarFocusEnvironments"));

    if (objc_msgSend(v15, "count"))
    {
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_10023C17C;
      v31[3] = &unk_1011AD568;
      v31[4] = &v32;
      v16 = objc_retainBlock(v31);
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_10023C18C;
      v30[3] = &unk_1011AD590;
      v30[4] = self;
      v30[5] = &v32;
      v17 = objc_retainBlock(v30);
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      v18 = v15;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v39, 16);
      if (v19)
      {
        v20 = *(_QWORD *)v27;
        do
        {
          for (i = 0; i != v19; i = (char *)i + 1)
          {
            if (*(_QWORD *)v27 != v20)
              objc_enumerationMutation(v18);
            objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i), "ifFocusEnvironment:ifRepresentativeItem:", v16, v17);
          }
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v39, 16);
        }
        while (v19);
      }

    }
  }
  if (objc_msgSend((id)v33[5], "count"))
  {
    v22 = objc_msgSend((id)v33[5], "copy");
  }
  else
  {
    v25.receiver = self;
    v25.super_class = (Class)CarChromeViewController;
    v23 = -[CarChromeViewController preferredFocusEnvironments](&v25, "preferredFocusEnvironments");
    v22 = (id)objc_claimAutoreleasedReturnValue(v23);
  }
  v10 = v22;
  _Block_object_dispose(&v32, 8);

  return (NSArray *)v10;
}

- (NSArray)_linearFocusMovementSequences
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  _QWORD *v17;
  _QWORD v18[6];
  _QWORD v19[5];
  _QWORD v20[5];
  id v21;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "carFocusOrderSequences"));

  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "count");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v4, "count")));
    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x3032000000;
    v20[3] = sub_10023C164;
    v20[4] = sub_10023C174;
    v21 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10023C460;
    v19[3] = &unk_1011AD5B8;
    v19[4] = v20;
    v6 = objc_retainBlock(v19);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10023C470;
    v18[3] = &unk_1011AD5E0;
    v18[4] = self;
    v18[5] = v20;
    v7 = objc_retainBlock(v18);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10023C5C0;
    v13[3] = &unk_1011AD648;
    v17 = v20;
    v8 = v6;
    v15 = v8;
    v9 = v7;
    v16 = v9;
    v10 = v5;
    v14 = v10;
    objc_msgSend(v4, "enumerateObjectsWithOptions:usingBlock:", 2, v13);
    if (objc_msgSend(v10, "count"))
      v11 = objc_msgSend(v10, "copy");
    else
      v11 = &__NSArray0__struct;

    _Block_object_dispose(v20, 8);
  }
  else
  {
    v11 = &__NSArray0__struct;
  }

  return (NSArray *)v11;
}

- (void)_reloadFocusContainerGuidesForContext:(id)a3
{
  void *v4;
  char v5;
  CarFocusContainerGuideController *focusContainerGuideController;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  objc_class *v14;
  NSString *v15;
  void *v16;
  void *v17;
  void *v18;
  __CFString *v19;
  uint8_t buf[4];
  __CFString *v21;
  __int16 v22;
  unint64_t v23;
  __int16 v24;
  unint64_t v25;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext", a3));
  v5 = objc_opt_respondsToSelector(v4, "configureFocusContainerGuideController:");

  focusContainerGuideController = self->_focusContainerGuideController;
  if ((v5 & 1) == 0)
  {
    -[CarFocusContainerGuideController setActiveEdges:](focusContainerGuideController, "setActiveEdges:", 15);
    return;
  }
  v7 = -[CarFocusContainerGuideController activeEdges](focusContainerGuideController, "activeEdges");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
  objc_msgSend(v8, "configureFocusContainerGuideController:", self->_focusContainerGuideController);

  v9 = -[CarFocusContainerGuideController activeEdges](self->_focusContainerGuideController, "activeEdges");
  v10 = sub_10043364C();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = (id)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
    v13 = v12;
    if (!v12)
    {
      v19 = CFSTR("<nil>");
      goto LABEL_12;
    }
    v14 = (objc_class *)objc_opt_class(v12);
    v15 = NSStringFromClass(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    if ((objc_opt_respondsToSelector(v13, "accessibilityIdentifier") & 1) != 0)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "performSelector:", "accessibilityIdentifier"));
      v18 = v17;
      if (v17 && !objc_msgSend(v17, "isEqualToString:", v16))
      {
        v19 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v16, v13, v18));

        goto LABEL_9;
      }

    }
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v16, v13));
LABEL_9:

LABEL_12:
    *(_DWORD *)buf = 138412802;
    v21 = v19;
    v22 = 2048;
    v23 = v7;
    v24 = 2048;
    v25 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Top context: %@, configured focusContainer guides from: %lu, to %lu", buf, 0x20u);

  }
}

- (void)configureAccessoriesOverlay:(id)a3 forContext:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v9 = a4;
  if ((objc_opt_respondsToSelector(v9, "showsSpeedLimit") & 1) != 0)
    v5 = objc_msgSend(v9, "showsSpeedLimit");
  else
    v5 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController accessoriesOverlay](self, "accessoriesOverlay"));
  objc_msgSend(v6, "setShowSpeedSign:", v5);

  if ((objc_opt_respondsToSelector(v9, "showsHeadingIndicator") & 1) != 0)
    v7 = objc_msgSend(v9, "showsHeadingIndicator");
  else
    v7 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController accessoriesOverlay](self, "accessoriesOverlay"));
  objc_msgSend(v8, "setShowHeadingIndicator:", v7);

}

- (void)reloadAccessoriesForContext:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[GroupAnimation animationForAnimatedFlag:](GroupAnimation, "animationForAnimatedFlag:", v4));
  -[CarChromeViewController _reloadAccessoriesForContext:withAnimation:](self, "_reloadAccessoriesForContext:withAnimation:", v6, v7);

  objc_msgSend(v7, "runWithCurrentOptions");
}

- (void)_reloadAccessoriesForContext:(id)a3 withAnimation:(id)a4
{
  id v6;
  id v7;
  unsigned __int8 v8;
  id v9;
  NSObject *v10;
  objc_class *v11;
  NSString *v12;
  void *v13;
  _QWORD v14[5];
  unsigned __int8 v15;
  _QWORD v16[5];
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;

  v6 = a3;
  v7 = a4;
  if (-[ChromeViewController isCurrentContext:](self, "isCurrentContext:", v6))
  {
    v8 = objc_msgSend(v7, "isAnimated");
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10023CD3C;
    v16[3] = &unk_1011AC8B0;
    v16[4] = self;
    v17 = v6;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10023CDB4;
    v14[3] = &unk_1011ACE58;
    v14[4] = self;
    v15 = v8;
    objc_msgSend(v7, "addPreparation:animations:completion:", v16, v14, 0);

  }
  else
  {
    v9 = sub_10043364C();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = (objc_class *)objc_opt_class(v6);
      v12 = NSStringFromClass(v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      *(_DWORD *)buf = 138412546;
      v19 = v13;
      v20 = 2048;
      v21 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%@ (%p) asked for accessories reload, but it is not the current context. Ignoring the call.", buf, 0x16u);

    }
  }

}

- (void)_reloadAccessoriesInsetsForContext:(id)a3
{
  _BOOL8 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = !-[CarChromeViewController _areAccessoriesHiddenForCurrentContext](self, "_areAccessoriesHiddenForCurrentContext")&& -[CarChromeViewController _shouldAccessoriesModifyMapInsetsForContext:](self, "_shouldAccessoriesModifyMapInsetsForContext:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController overlayController](self, "overlayController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController accessoriesOverlay](self, "accessoriesOverlay"));
  objc_msgSend(v5, "setViewportConstraintsEnabled:forOverlay:", v4, v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController overlayController](self, "overlayController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController accessoriesOverlay](self, "accessoriesOverlay"));
  objc_msgSend(v7, "setMapInsetsConstraintsEnabled:forOverlay:", v4, v8);

}

- (void)reloadStatusBannerAnimated:(BOOL)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[GroupAnimation animationForAnimatedFlag:](GroupAnimation, "animationForAnimatedFlag:", a3));
  -[CarChromeViewController _reloadStatusBannerWithAnimation:](self, "_reloadStatusBannerWithAnimation:", v4);
  objc_msgSend(v4, "runWithCurrentOptions");

}

- (void)_reloadStatusBannerWithAnimation:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  unsigned int v9;
  id v10;
  NSObject *v11;
  void *v12;
  objc_class *v13;
  NSString *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  char v18;
  _QWORD v19[5];
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
  v6 = -[ChromeViewController isCurrentContext:](self, "isCurrentContext:", v5);

  if ((v6 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
    if ((objc_opt_respondsToSelector(v7, "suppressesStatusBannerAnimation") & 1) != 0)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
      v9 = objc_msgSend(v8, "suppressesStatusBannerAnimation") ^ 1;

    }
    else
    {
      LOBYTE(v9) = 1;
    }

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10023D10C;
    v19[3] = &unk_1011AC860;
    v19[4] = self;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10023D140;
    v17[3] = &unk_1011ACE58;
    v17[4] = self;
    v18 = objc_msgSend(v4, "isAnimated") & v9;
    objc_msgSend(v4, "addPreparation:animations:completion:", v19, v17, 0);
  }
  else
  {
    v10 = sub_10043364C();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
      v13 = (objc_class *)objc_opt_class(v12);
      v14 = NSStringFromClass(v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
      *(_DWORD *)buf = 138412546;
      v21 = v15;
      v22 = 2048;
      v23 = v16;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%@ (%p) asked for status banner reload, but it is not the current context. Ignoring the call.", buf, 0x16u);

    }
  }

}

- (BOOL)_hideStatusBanner
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
  if (objc_msgSend(v3, "isUsingOfflineMaps"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
    if ((objc_opt_respondsToSelector(v4, "hidesStatusBanner") & 1) != 0)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
      v6 = objc_msgSend(v5, "hidesStatusBanner") ^ 1;

    }
    else
    {
      LOBYTE(v6) = 1;
    }

  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6 ^ 1;
}

- (void)_updateAudioControls
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  objc_class *v11;
  NSString *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  objc_class *v20;
  NSString *v21;
  void *v22;
  void *v23;
  void *v24;
  __CFString *v25;
  id v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  objc_class *v30;
  NSString *v31;
  void *v32;
  void *v33;
  void *v34;
  __CFString *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint8_t buf[4];
  __CFString *v41;
  __int16 v42;
  __CFString *v43;

  if (!-[ChromeViewController isSuppressed](self, "isSuppressed"))
  {
    v4 = objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
    if ((objc_opt_respondsToSelector(v4, "audioSettingsCurrentState") & 1) != 0)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController mapControlsOverlay](self, "mapControlsOverlay"));
      if (v5)
      {
        v6 = v5;
        objc_msgSend(v5, "configuration");
        if (v37 == 2 || v38 == 2)
        {

          goto LABEL_27;
        }

        if (v39 == 2)
        {
LABEL_27:
          v25 = (__CFString *)-[NSObject audioSettingsCurrentState](v4, "audioSettingsCurrentState");
          v26 = sub_10043364C();
          v27 = objc_claimAutoreleasedReturnValue(v26);
          if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
LABEL_42:

            v8 = objc_claimAutoreleasedReturnValue(-[CarChromeViewController mapControlsOverlay](self, "mapControlsOverlay"));
            -[NSObject setAudioSettings:](v8, "setAudioSettings:", v25);
            goto LABEL_43;
          }
          v28 = v4;
          v29 = v28;
          if (!v28)
          {
            v35 = CFSTR("<nil>");
            goto LABEL_41;
          }
          v30 = (objc_class *)objc_opt_class(v28);
          v31 = NSStringFromClass(v30);
          v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
          if ((objc_opt_respondsToSelector(v29, "accessibilityIdentifier") & 1) != 0)
          {
            v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject performSelector:](v29, "performSelector:", "accessibilityIdentifier"));
            v34 = v33;
            if (v33 && !objc_msgSend(v33, "isEqualToString:", v32))
            {
              v35 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v32, v29, v34));

              goto LABEL_34;
            }

          }
          v35 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v32, v29));
LABEL_34:

LABEL_41:
          *(_DWORD *)buf = 134218242;
          v41 = v25;
          v42 = 2114;
          v43 = v35;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Updating mapControls.audioControls with audioSettings: %ld per request from context: %{public}@.", buf, 0x16u);

          goto LABEL_42;
        }
      }
      v17 = sub_10043364C();
      v8 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v18 = v4;
        v19 = v18;
        if (!v18)
        {
          v16 = CFSTR("<nil>");
          goto LABEL_38;
        }
        v20 = (objc_class *)objc_opt_class(v18);
        v21 = NSStringFromClass(v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
        if ((objc_opt_respondsToSelector(v19, "accessibilityIdentifier") & 1) != 0)
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject performSelector:](v19, "performSelector:", "accessibilityIdentifier"));
          v24 = v23;
          if (v23 && !objc_msgSend(v23, "isEqualToString:", v22))
          {
            v16 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v22, v19, v24));

            goto LABEL_25;
          }

        }
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v22, v19));
LABEL_25:

LABEL_38:
        *(_DWORD *)buf = 138543362;
        v41 = v16;
        v36 = "%{public}@'s mapControls configuration doesn't have audio controls. Ignoring the call.";
        goto LABEL_39;
      }
LABEL_43:

      goto LABEL_44;
    }
    v7 = sub_10043364C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      goto LABEL_43;
    v9 = v4;
    v10 = v9;
    if (!v9)
    {
      v16 = CFSTR("<nil>");
      goto LABEL_36;
    }
    v11 = (objc_class *)objc_opt_class(v9);
    v12 = NSStringFromClass(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    if ((objc_opt_respondsToSelector(v10, "accessibilityIdentifier") & 1) != 0)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject performSelector:](v10, "performSelector:", "accessibilityIdentifier"));
      v15 = v14;
      if (v14 && !objc_msgSend(v14, "isEqualToString:", v13))
      {
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v13, v10, v15));

        goto LABEL_17;
      }

    }
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v13, v10));
LABEL_17:

LABEL_36:
    *(_DWORD *)buf = 138543362;
    v41 = v16;
    v36 = "%{public}@ does not respond to audioSettingsCurrentState. Ignoring the call";
LABEL_39:
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v36, buf, 0xCu);

    goto LABEL_43;
  }
  v3 = sub_10043364C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Chrome is suppressed, ignoring call to update audio controls.", buf, 2u);
  }
LABEL_44:

}

- (void)_reloadMapControlsForContext:(id)a3 withAnimation:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  objc_class *v11;
  NSString *v12;
  void *v13;
  _QWORD v14[5];
  _QWORD v15[5];
  id v16;
  _BYTE *v17;
  id v18;
  id location;
  _BYTE buf[24];
  unsigned __int8 v21;

  v6 = a3;
  v7 = a4;
  if (-[ChromeViewController isSuppressed](self, "isSuppressed"))
  {
    v8 = sub_10043364C();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Will not reload map controls, chrome is suppressed", buf, 2u);
    }
LABEL_4:

    goto LABEL_12;
  }
  if (!-[ChromeViewController isCurrentContext:](self, "isCurrentContext:", v6))
  {
    v10 = sub_10043364C();
    v9 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = (objc_class *)objc_opt_class(v6);
      v12 = NSStringFromClass(v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v13;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%@ (%p) asked for mapControls update, but it is not the current context. Ignoring the call.", buf, 0x16u);

    }
    goto LABEL_4;
  }
  if (v7)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v21 = 0;
    v21 = objc_msgSend(v7, "isAnimated");
    objc_initWeak(&location, v7);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10023D95C;
    v15[3] = &unk_1011AD670;
    v15[4] = self;
    v16 = v6;
    v17 = buf;
    objc_copyWeak(&v18, &location);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10023DB00;
    v14[3] = &unk_1011AC860;
    v14[4] = self;
    objc_msgSend(v7, "addPreparation:animations:completion:", v15, v14, 0);
    objc_destroyWeak(&v18);

    objc_destroyWeak(&location);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(+[GroupAnimation animationForAnimatedFlag:](GroupAnimation, "animationForAnimatedFlag:", 0));
    -[CarChromeViewController _reloadMapControlsForContext:withAnimation:](self, "_reloadMapControlsForContext:withAnimation:", v6, v7);
    objc_msgSend(v7, "runWithCurrentOptions");
  }
LABEL_12:

}

- (void)_reloadMapControlsInsetsForContext:(id)a3
{
  id v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  uint64_t v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController mapControlsOverlay](self, "mapControlsOverlay"));
  v6 = (_BOOL8)v5;
  if (v5)
  {
    objc_msgSend(v5, "configuration");
    if (v11 == 0)
    {

      if (!v12)
      {
        v6 = 0;
        goto LABEL_8;
      }
    }
    else
    {

    }
    v6 = -[CarChromeViewController _shouldMapControlsModifyMapInsetsForContext:](self, "_shouldMapControlsModifyMapInsetsForContext:", v4);
  }
LABEL_8:
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController overlayController](self, "overlayController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController mapControlsOverlay](self, "mapControlsOverlay"));
  objc_msgSend(v7, "setViewportConstraintsEnabled:forOverlay:", v6, v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController overlayController](self, "overlayController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController mapControlsOverlay](self, "mapControlsOverlay"));
  objc_msgSend(v9, "setMapInsetsConstraintsEnabled:forOverlay:", v6, v10);

}

- (void)carMapControls:(id)a3 didTriggerAction:(unint64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = v6;
  switch(a4)
  {
    case 1uLL:
      -[CarChromeViewController _navRecenterButtonPressed](self, "_navRecenterButtonPressed");
      goto LABEL_9;
    case 2uLL:
      -[CarChromeViewController panButtonPressed](self, "panButtonPressed");
      goto LABEL_9;
    case 3uLL:
      -[CarChromeViewController zoomInButtonPressed](self, "zoomInButtonPressed");
      goto LABEL_9;
    case 4uLL:
      -[CarChromeViewController zoomOutButtonPressed](self, "zoomOutButtonPressed");
      goto LABEL_9;
    case 5uLL:
      -[CarChromeViewController _toggle3DButtonPressed](self, "_toggle3DButtonPressed");
      goto LABEL_9;
    case 6uLL:
      -[CarChromeViewController _toggleCameraPressed](self, "_toggleCameraPressed");
      goto LABEL_9;
    case 7uLL:
      -[CarChromeViewController _reportIncidentPressed](self, "_reportIncidentPressed");
LABEL_9:
      v6 = v7;
      break;
    default:
      break;
  }

}

- (void)_navRecenterButtonPressed
{
  id v3;

  -[CarChromeViewController captureUserAction:](self, "captureUserAction:", 4001);
  v3 = (id)objc_claimAutoreleasedReturnValue(-[ChromeViewController navigationDisplay](self, "navigationDisplay"));
  objc_msgSend(v3, "recenterCameraAnimated:", 1);

}

- (void)panButtonPressed
{
  id v2;

  -[CarChromeViewController captureUserAction:](self, "captureUserAction:", 9007);
  v2 = (id)objc_claimAutoreleasedReturnValue(+[CarChromeModeCoordinator sharedInstance](CarChromeModeCoordinator, "sharedInstance"));
  objc_msgSend(v2, "displayMapPanning");

}

- (void)zoomInButtonPressed
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = sub_10043364C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "zoomIn button pressed", v5, 2u);
  }

  -[CarChromeViewController zoomIn](self, "zoomIn");
}

- (void)zoomIn
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  _QWORD v9[5];

  -[CarChromeViewController captureUserAction:](self, "captureUserAction:", 1049);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
  if ((objc_opt_respondsToSelector(v3, "zoomInButtonPressed") & 1) == 0
    || (objc_msgSend(v3, "zoomInButtonPressed") & 1) == 0)
  {
    v4 = objc_claimAutoreleasedReturnValue(-[ChromeViewController navigationDisplay](self, "navigationDisplay"));
    if (v4
      && (v5 = (void *)v4,
          v6 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance")),
          v7 = objc_msgSend(v6, "isCarAppSceneHostingNavigation"),
          v6,
          v5,
          v7))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController navigationDisplay](self, "navigationDisplay"));
      objc_msgSend(v8, "zoomIn");
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_10023DF28;
      v9[3] = &unk_1011AC860;
      v9[4] = self;
      objc_msgSend(v8, "_zoomInWithCompletionHandler:", v9);
    }

  }
  -[CarChromeViewController updateZoomControls](self, "updateZoomControls");

}

- (void)zoomOutButtonPressed
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = sub_10043364C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "zoomOut button pressed", v5, 2u);
  }

  -[CarChromeViewController zoomOut](self, "zoomOut");
}

- (void)zoomOut
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  _QWORD v9[5];

  -[CarChromeViewController captureUserAction:](self, "captureUserAction:", 1050);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
  if ((objc_opt_respondsToSelector(v3, "zoomOutButtonPressed") & 1) == 0
    || (objc_msgSend(v3, "zoomOutButtonPressed") & 1) == 0)
  {
    v4 = objc_claimAutoreleasedReturnValue(-[ChromeViewController navigationDisplay](self, "navigationDisplay"));
    if (v4
      && (v5 = (void *)v4,
          v6 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance")),
          v7 = objc_msgSend(v6, "isCarAppSceneHostingNavigation"),
          v6,
          v5,
          v7))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController navigationDisplay](self, "navigationDisplay"));
      objc_msgSend(v8, "zoomOut");
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_10023E110;
      v9[3] = &unk_1011AC860;
      v9[4] = self;
      objc_msgSend(v8, "_zoomOutWithCompletionHandler:", v9);
    }

  }
  -[CarChromeViewController updateZoomControls](self, "updateZoomControls");

}

- (void)_toggle3DButtonPressed
{
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  if (CarDisplayIsDriveCameraEnabled())
  {
    v3 = -[ChromeViewController isRunningNavigationDisplay](self, "isRunningNavigationDisplay");
    v4 = v3 ^ 1;
    if (v3)
      v5 = 5010;
    else
      v5 = 5009;
    -[CarChromeViewController captureUserAction:](self, "captureUserAction:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController defaultMapSettings](self, "defaultMapSettings"));
    objc_msgSend(v6, "setPitched:", v4);

    -[ChromeViewController setNeedsUpdateComponent:animated:](self, "setNeedsUpdateComponent:animated:", CFSTR("navigationDisplay"), 1);
    -[ChromeViewController updateComponentsIfNeeded](self, "updateComponentsIfNeeded");
    -[CarChromeViewController _update3DButton](self, "_update3DButton");
    if ((v4 & 1) == 0)
    {
      v13 = (id)objc_claimAutoreleasedReturnValue(-[CarChromeViewController defaultMapSettings](self, "defaultMapSettings"));
      objc_msgSend(v13, "applyToMapViewAnimated:duration:completion:", 1, 0, -1.0);

    }
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
    v8 = objc_msgSend(v7, "_isPitched");

    if (v8)
      v9 = 5010;
    else
      v9 = 5009;
    -[CarChromeViewController captureUserAction:](self, "captureUserAction:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController defaultMapSettings](self, "defaultMapSettings"));
    objc_msgSend(v10, "setPitched:", v8 ^ 1);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
    v12 = v11;
    if ((v8 & 1) != 0)
      objc_msgSend(v11, "_exit3DMode");
    else
      objc_msgSend(v11, "_enter3DMode");

    -[CarChromeViewController _update3DButton](self, "_update3DButton");
  }
}

- (void)_toggleCameraPressed
{
  void *v3;
  char v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
  v4 = objc_opt_respondsToSelector(v3, "toggleCameraPressed");

  if ((v4 & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
    objc_msgSend(v5, "toggleCameraPressed");

    -[CarChromeViewController _updateCameraToggleButton](self, "_updateCameraToggleButton");
  }
  else
  {
    v6 = sub_10043364C();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "_toggleCameraPressed called, because toggleCameraButton is present in map controls, but topContext doesn't respond to toggleCameraPressed", v8, 2u);
    }

  }
}

- (void)_reportIncidentPressed
{
  id v2;

  -[CarChromeViewController captureUserAction:onTarget:](self, "captureUserAction:onTarget:", 115, 1004);
  v2 = (id)objc_claimAutoreleasedReturnValue(+[CarChromeModeCoordinator sharedInstance](CarChromeModeCoordinator, "sharedInstance"));
  objc_msgSend(v2, "displayIncidentReporting");

}

- (void)_update3DButton
{
  unsigned int v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;

  if (CarDisplayIsDriveCameraEnabled())
  {
    v3 = -[ChromeViewController isRunningNavigationDisplay](self, "isRunningNavigationDisplay");
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController mapControlsOverlay](self, "mapControlsOverlay"));
    v5 = v4;
    if (v3)
      v6 = 1;
    else
      v6 = 2;
    objc_msgSend(v4, "setMode3DState:", v6);

    v14 = (id)objc_claimAutoreleasedReturnValue(-[CarChromeViewController mapControlsOverlay](self, "mapControlsOverlay"));
    objc_msgSend(v14, "setMode3DEnabled:", 1);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
    v8 = objc_msgSend(v7, "_isPitched");

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController mapControlsOverlay](self, "mapControlsOverlay"));
    v10 = v9;
    if (v8)
      v11 = 1;
    else
      v11 = 2;
    objc_msgSend(v9, "setMode3DState:", v11);

    v14 = (id)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
    v12 = objc_msgSend(v14, "_canEnter3DMode");
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController mapControlsOverlay](self, "mapControlsOverlay"));
    objc_msgSend(v13, "setMode3DEnabled:", v12);

  }
}

- (void)_updateCameraToggleButton
{
  void *v3;
  void *v4;
  NSObject *v6;
  void *v7;
  char *v8;
  void *v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  id v17;
  const __CFString *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController mapControlsOverlay](self, "mapControlsOverlay"));
  if (!v3)
  {
    v6 = 0;
LABEL_24:

    return;
  }
  v4 = v3;
  objc_msgSend(v3, "configuration");
  if (v22 == 2 || v23 == 2)
  {

    goto LABEL_10;
  }

  if (v24 == 2)
  {
LABEL_10:
    if (-[ChromeViewController isRunningNavigationDisplay](self, "isRunningNavigationDisplay"))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController navigationDisplay](self, "navigationDisplay"));
      v8 = (char *)objc_msgSend(v7, "currentCameraMode");

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController mapControlsOverlay](self, "mapControlsOverlay"));
      v10 = objc_msgSend(v9, "cameraToggleButtonState");

      if ((unint64_t)(v8 - 2) < 2)
      {
        v14 = sub_10043364C();
        v15 = objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "_updateCameraToggleButton with NavigationCameraModeLowGuidance, which shouldn't happen.", buf, 2u);
        }

        v12 = 0;
      }
      else
      {
        v11 = 2;
        if (v8 != (char *)1)
          v11 = 0;
        if (v8)
          v12 = v11;
        else
          v12 = 1;
      }
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController mapControlsOverlay](self, "mapControlsOverlay"));
      objc_msgSend(v16, "setCameraToggleButtonState:", v12);

      v17 = sub_10043364C();
      v6 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        v18 = sub_100754010((unint64_t)v10);
        v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
        v20 = sub_100754010(v12);
        v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
        *(_DWORD *)buf = 138412546;
        v26 = v19;
        v27 = 2112;
        v28 = v21;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "_updateCameraToggleButton: updating from buttonState: %@ to state: %@", buf, 0x16u);

      }
    }
    else
    {
      v13 = sub_10043364C();
      v6 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "_updateCameraToggleButton called, but we are not running the navigation display.", buf, 2u);
      }
    }
    goto LABEL_24;
  }
}

- (void)_updateNudgerizer
{
  void *v3;
  char v4;
  void *v5;
  id v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
  v4 = objc_opt_respondsToSelector(v3, "allowKnobNudgeMapPanning");

  if ((v4 & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
    v6 = objc_msgSend(v5, "allowKnobNudgeMapPanning");

  }
  else
  {
    v6 = 0;
  }
  v7 = (id)objc_claimAutoreleasedReturnValue(-[CarChromeViewController nudgerizer](self, "nudgerizer"));
  objc_msgSend(v7, "setActive:", v6);

}

- (void)_updateRouteSelectionController
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = -[CarChromeViewController _canSelectAlternateRoutes](self, "_canSelectAlternateRoutes");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
  objc_msgSend(v4, "_setCanSelectPOIs:", v3);

  if (v3)
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController routeSelectionController](self, "routeSelectionController"));
  else
    v5 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController mapViewResponder](self, "mapViewResponder"));
  objc_msgSend(v6, "setTarget:", v5);

  if (v3)
  v7 = (id)objc_claimAutoreleasedReturnValue(-[CarChromeViewController routeSelectionController](self, "routeSelectionController"));
  objc_msgSend(v7, "setActive:", v3);

}

- (void)updateZoomControls
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
  v4 = objc_msgSend(v3, "_canZoomIn");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController mapControlsOverlay](self, "mapControlsOverlay"));
  objc_msgSend(v5, "setZoomInEnabled:", v4);

  v8 = (id)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
  v6 = objc_msgSend(v8, "_canZoomOut");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController mapControlsOverlay](self, "mapControlsOverlay"));
  objc_msgSend(v7, "setZoomOutEnabled:", v6);

}

- (void)_enableZoomGesture:(BOOL)a3
{
  id v3;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void **v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  id location;

  v3 = (id)a3;
  if (a3)
  {
    objc_initWeak(&location, self);
    v14 = _NSConcreteStackBlock;
    v15 = 3221225472;
    v16 = sub_10023EA6C;
    v17 = &unk_1011AD260;
    objc_copyWeak(&v18, &location);
    -[CarChromeViewController enableDoubleTapRecognizerWithBlock:](self, "enableDoubleTapRecognizerWithBlock:", &v14);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  else
  {
    -[CarChromeViewController disableDoubleTapRecognizer](self, "disableDoubleTapRecognizer");
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext", v14, v15, v16, v17));
  v6 = objc_opt_respondsToSelector(v5, "allowMapZoomAndRecentering");

  if ((v6 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
    v3 = objc_msgSend(v7, "allowMapZoomAndRecentering");

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
  objc_msgSend(v8, "setZoomEnabled:", v3);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_doubleTapGestureRecognizer"));
  objc_msgSend(v10, "setEnabled:", 0);

  v11 = 0;
  if ((_DWORD)v3)
    v11 = objc_msgSend((id)objc_opt_class(self), "allowOneHandedZooming");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "_oneHandedZoomGestureRecognizer"));
  objc_msgSend(v13, "setEnabled:", v11);

}

- (void)carStatusBannerDidTapBanner
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
  objc_msgSend(v2, "interruptApplicationWithKind:userInfo:completionHandler:", 21, 0, &stru_1011AD6B0);

}

- (unint64_t)desiredRadarScreenshotTypes
{
  unint64_t v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CarChromeViewController;
  v3 = -[ChromeViewController desiredRadarScreenshotTypes](&v6, "desiredRadarScreenshotTypes");
  if (-[ChromeViewController isInactive](self, "isInactive")
    || (v4 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController currentMapReplacementView](self, "currentMapReplacementView")),
        v4,
        v4))
  {
    v3 |= 8uLL;
  }
  return v3;
}

- (id)_userActionDetailsWithMapItem:(id)a3 resultIndex:(int)a4
{
  return +[GEOPlaceActionDetails actionDetailsWithMapItem:timestamp:resultIndex:](GEOPlaceActionDetails, "actionDetailsWithMapItem:timestamp:resultIndex:", a3, *(_QWORD *)&a4, 0.0);
}

- (int)_currentUsageTarget
{
  void *v3;
  char v4;
  void *v5;
  int v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
  v4 = objc_opt_respondsToSelector(v3, "currentUsageTarget");

  if ((v4 & 1) == 0)
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
  v6 = objc_msgSend(v5, "currentUsageTarget");

  return v6;
}

- (void)_captureUserActionBackToContext:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
  if ((objc_opt_respondsToSelector(v4, "backButtonUsageActionToContext:") & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
    v6 = (uint64_t)objc_msgSend(v5, "backButtonUsageActionToContext:", v8);

    if (!(_DWORD)v6)
      goto LABEL_9;
  }
  else
  {
    v6 = 25;
  }
  if ((objc_opt_respondsToSelector(v4, "backButtonUsageEventValueToContext:") & 1) != 0)
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "backButtonUsageEventValueToContext:", v8));
  else
    v7 = 0;
  -[CarChromeViewController captureUserAction:eventValue:](self, "captureUserAction:eventValue:", v6, v7);

LABEL_9:
}

- (void)captureUserAction:(int)a3 onTarget:(int)a4
{
  -[CarChromeViewController captureUserAction:onTarget:eventValue:](self, "captureUserAction:onTarget:eventValue:", *(_QWORD *)&a3, *(_QWORD *)&a4, 0);
}

- (void)captureUserAction:(int)a3 onTarget:(int)a4 eventValue:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;

  v5 = *(_QWORD *)&a4;
  v6 = *(_QWORD *)&a3;
  v7 = a5;
  v8 = (id)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v8, "captureUserAction:onTarget:eventValue:", v6, v5, v7);

}

- (void)captureUserAction:(int)a3
{
  -[CarChromeViewController captureUserAction:mapItem:](self, "captureUserAction:mapItem:", *(_QWORD *)&a3, 0);
}

- (void)captureUserAction:(int)a3 eventValue:(id)a4
{
  uint64_t v4;
  id v6;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  -[CarChromeViewController captureUserAction:onTarget:eventValue:](self, "captureUserAction:onTarget:eventValue:", v4, -[CarChromeViewController _currentUsageTarget](self, "_currentUsageTarget"), v6);

}

- (void)captureUserAction:(int)a3 mapItem:(id)a4
{
  -[CarChromeViewController captureUserAction:mapItem:atResultIndex:](self, "captureUserAction:mapItem:atResultIndex:", *(_QWORD *)&a3, a4, 0xFFFFFFFFLL);
}

- (void)captureUserAction:(int)a3 mapItem:(id)a4 atResultIndex:(int)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a3;
  v11 = a4;
  v8 = -[CarChromeViewController _currentUsageTarget](self, "_currentUsageTarget");
  if (v11 || (v5 & 0x80000000) == 0)
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController _userActionDetailsWithMapItem:resultIndex:](self, "_userActionDetailsWithMapItem:resultIndex:", v11, v5));
  else
    v9 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v10, "captureUserAction:onTarget:eventValue:placeActionDetails:", v6, v8, 0, v9);

}

- (void)captureUserAction:(int)a3 selectedRouteIndex:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  v6 = -[CarChromeViewController _currentUsageTarget](self, "_currentUsageTarget");
  v8 = (id)objc_claimAutoreleasedReturnValue(+[GEORouteDetails routeDetailsWithResultIndex:](GEORouteDetails, "routeDetailsWithResultIndex:", v4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v7, "captureUserAction:onTarget:eventValue:routeDetails:", v5, v6, 0, v8);

}

- (void)captureUserActionChangedTrackingMode:(int64_t)a3
{
  if ((unint64_t)a3 <= 2)
    -[CarChromeViewController captureUserAction:](self, "captureUserAction:", dword_100E348C0[a3]);
}

- (void)captureUserActionPannedInDirection:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) <= 3)
    -[CarChromeViewController captureUserAction:](self, "captureUserAction:", dword_100E348D0[a3 - 1]);
}

- (void)captureUserActionSelectedSearchCategory:(id)a3 categoriesDisplayed:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  v8 = -[CarChromeViewController _currentUsageTarget](self, "_currentUsageTarget");
  v10 = (id)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "displayString"));
  objc_msgSend(v10, "captureUserAction:onTarget:eventValue:categoriesDisplayed:categorySelected:", 2004, v8, v9, v6, v7);

}

- (BOOL)canShowCards
{
  return 1;
}

- (id)_desiredCards
{
  void *v3;
  void *v4;
  void *v5;

  if (-[CarChromeViewController canShowCards](self, "canShowCards"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
    if ((objc_opt_respondsToSelector(v3, "desiredCards") & 1) != 0)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "desiredCards"));

    }
    else
    {
      v5 = &__NSArray0__struct;
    }

  }
  else
  {
    v5 = &__NSArray0__struct;
  }
  return v5;
}

- (void)updateCardsForContext:(id)a3 animated:(BOOL)a4
{
  -[ChromeViewController setNeedsUpdateComponent:animated:](self, "setNeedsUpdateComponent:animated:", CFSTR("cards"), a4);
}

- (void)updateCardsForContext:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  -[ChromeViewController setNeedsUpdateComponent:animated:completion:](self, "setNeedsUpdateComponent:animated:completion:", CFSTR("cards"), a4, a5);
}

- (void)_updateCardsForContext:(id)a3 withAnimation:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  CarChromeViewController *v13;
  CarChromeViewController *v14;
  objc_class *v15;
  NSString *v16;
  void *v17;
  void *v18;
  void *v19;
  __CFString *v20;
  id v21;
  NSObject *v22;
  objc_class *v23;
  NSString *v24;
  __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  _QWORD v31[5];
  id v32;
  id v33;
  id v34;
  id v35;
  _QWORD v36[5];
  uint8_t buf[4];
  __CFString *v38;
  __int16 v39;
  id v40;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[ChromeViewController isCurrentContext:](self, "isCurrentContext:", v8))
  {
    v11 = sub_10043333C();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
LABEL_16:

      v26 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController _desiredCards](self, "_desiredCards"));
      if ((objc_opt_respondsToSelector(v26, "chromeDidStartConfiguringCards:") & 1) != 0)
        objc_msgSend(v26, "chromeDidStartConfiguringCards:", v27);
      objc_initWeak((id *)buf, self);
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController cardsOverlay](self, "cardsOverlay"));
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      v36[2] = sub_10023F480;
      v36[3] = &unk_1011AC860;
      v36[4] = self;
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_10023F48C;
      v31[3] = &unk_1011AD6D8;
      v31[4] = self;
      objc_copyWeak(&v35, (id *)buf);
      v29 = v26;
      v32 = v29;
      v30 = v27;
      v33 = v30;
      v34 = v10;
      objc_msgSend(v28, "performBatchUpdates:withAnimation:completion:", v36, v9, v31);

      objc_destroyWeak(&v35);
      objc_destroyWeak((id *)buf);

      goto LABEL_19;
    }
    v13 = self;
    v14 = v13;
    if (!v13)
    {
      v20 = CFSTR("<nil>");
      goto LABEL_15;
    }
    v15 = (objc_class *)objc_opt_class(v13);
    v16 = NSStringFromClass(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    if ((objc_opt_respondsToSelector(v14, "accessibilityIdentifier") & 1) != 0)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController performSelector:](v14, "performSelector:", "accessibilityIdentifier"));
      v19 = v18;
      if (v18 && !objc_msgSend(v18, "isEqualToString:", v17))
      {
        v20 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v17, v14, v19));

        goto LABEL_9;
      }

    }
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v17, v14));
LABEL_9:

LABEL_15:
    *(_DWORD *)buf = 138543362;
    v38 = v20;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[%{public}@] Chrome started configuring cards.", buf, 0xCu);

    goto LABEL_16;
  }
  v21 = sub_10043364C();
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    v23 = (objc_class *)objc_opt_class(v8);
    v24 = NSStringFromClass(v23);
    v25 = (__CFString *)objc_claimAutoreleasedReturnValue(v24);
    *(_DWORD *)buf = 138412546;
    v38 = v25;
    v39 = 2048;
    v40 = v8;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%@ (%p) asked for card update, but it is not the current context. Ignoring the call.", buf, 0x16u);

  }
  if (v10)
    (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
LABEL_19:

}

- (void)_reloadCardOverlayConstraintsIfNeeded
{
  void *v3;
  _BOOL4 didSetupOverlayConstraints;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  double v9;
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
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  _QWORD v50[13];

  v48 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController overlayController](self, "overlayController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "contentLayoutGuide"));
  if (v3)
  {
    didSetupOverlayConstraints = self->_didSetupOverlayConstraints;

    if (!didSetupOverlayConstraints)
    {
      self->_didSetupOverlayConstraints = 1;
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController overlayController](self, "overlayController"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contentLayoutGuide"));

      v49 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](self->_statusBannerLayoutGuide, "topAnchor"));
      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topAnchor"));
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "constraintEqualToAnchor:", v47));
      v50[0] = v46;
      v45 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](self->_statusBannerLayoutGuide, "leadingAnchor"));
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leadingAnchor"));
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "constraintEqualToAnchor:", v44));
      v50[1] = v43;
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](self->_statusBannerLayoutGuide, "trailingAnchor"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trailingAnchor"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:", v41));
      v50[2] = v40;
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](self->_accessoriesCompactLayoutGuide, "leadingAnchor"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leadingAnchor"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:", v38));
      v50[3] = v37;
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](self->_accessoriesCompactLayoutGuide, "trailingAnchor"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trailingAnchor"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:", v35));
      v50[4] = v34;
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](self->_accessoriesCompactLayoutGuide, "topAnchor"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topAnchor"));
      LODWORD(v7) = 1148846080;
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintGreaterThanOrEqualToAnchor:constant:priority:", v32, 0.0, v7));
      v50[5] = v31;
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](self->_accessoriesCompactLayoutGuide, "bottomAnchor"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bottomAnchor"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:", v29));
      v50[6] = v28;
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](self->_statusBannerLayoutGuide, "bottomAnchor"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](self->_accessoriesCompactLayoutGuide, "topAnchor"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:constant:", v26, 8.0));
      v50[7] = v25;
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](self->_cardsLayoutGuide, "leadingAnchor"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leadingAnchor"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v23));
      v50[8] = v22;
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](self->_cardsLayoutGuide, "trailingAnchor"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trailingAnchor"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v20));
      v50[9] = v19;
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](self->_cardsLayoutGuide, "topAnchor"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topAnchor"));
      LODWORD(v9) = 1148846080;
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintGreaterThanOrEqualToAnchor:constant:priority:", v8, 0.0, v9));
      v50[10] = v10;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](self->_cardsLayoutGuide, "bottomAnchor"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bottomAnchor"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:", v12));
      v50[11] = v13;
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](self->_statusBannerLayoutGuide, "bottomAnchor"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](self->_cardsLayoutGuide, "topAnchor"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:constant:", v15, 8.0));
      v50[12] = v16;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v50, 13));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v17);

    }
  }
  else
  {

  }
}

- (void)_reloadCardsAnimated:(BOOL)a3
{
  id v4;
  NSObject *v5;
  CarChromeViewController *v6;
  CarChromeViewController *v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  char v21;
  id v22;
  id v23;
  uint64_t v24;
  void *i;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  CarChromeViewController *v30;
  CarChromeViewController *v31;
  objc_class *v32;
  NSString *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  CarChromeViewController *v38;
  CarChromeViewController *v39;
  objc_class *v40;
  NSString *v41;
  void *v42;
  void *v43;
  void *v44;
  const char *v45;
  id v46;
  CarChromeViewController *v47;
  CarChromeViewController *v48;
  objc_class *v49;
  NSString *v50;
  void *v51;
  void *v52;
  void *v53;
  NSObject *v54;
  os_log_type_t v55;
  _QWORD v56[6];
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint8_t v61[128];
  uint8_t buf[4];
  __CFString *v63;

  -[CarChromeViewController _reloadCardOverlayConstraintsIfNeeded](self, "_reloadCardOverlayConstraintsIfNeeded", a3);
  if (!-[ChromeViewController isSuppressed](self, "isSuppressed"))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController overlayController](self, "overlayController"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "overlayContentView"));

    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController cardsOverlay](self, "cardsOverlay"));
      objc_msgSend(v16, "dismissAllCardsAnimated:completion:", 0, 0);

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController overlayController](self, "overlayController"));
      v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "overlayContentView"));
      objc_msgSend((id)v18, "setAccessibilityViewIsModal:", 0);

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
      LOBYTE(v18) = objc_opt_respondsToSelector(v19, "desiredCards");

      if ((v18 & 1) != 0)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
        v21 = objc_opt_respondsToSelector(v20, "configureCard:forKey:");

        if ((v21 & 1) != 0)
        {
          v5 = objc_claimAutoreleasedReturnValue(-[CarChromeViewController _desiredCards](self, "_desiredCards"));
          if (-[NSObject count](v5, "count"))
          {
            v59 = 0u;
            v60 = 0u;
            v57 = 0u;
            v58 = 0u;
            v5 = v5;
            v22 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
            if (v22)
            {
              v23 = v22;
              v24 = *(_QWORD *)v58;
              do
              {
                for (i = 0; i != v23; i = (char *)i + 1)
                {
                  if (*(_QWORD *)v58 != v24)
                    objc_enumerationMutation(v5);
                  v26 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)i);
                  v27 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController cardsOverlay](self, "cardsOverlay"));
                  v56[0] = _NSConcreteStackBlock;
                  v56[1] = 3221225472;
                  v56[2] = sub_10024027C;
                  v56[3] = &unk_1011AD700;
                  v56[4] = self;
                  v56[5] = v26;
                  objc_msgSend(v27, "configureCard:withBlock:", v26, v56);

                }
                v23 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
              }
              while (v23);
            }

            v28 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController cardsOverlay](self, "cardsOverlay"));
            objc_msgSend(v28, "presentAllCardsAnimated:completion:", 0, 0);

          }
          goto LABEL_58;
        }
        v46 = sub_10043333C();
        v5 = objc_claimAutoreleasedReturnValue(v46);
        if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
          goto LABEL_58;
        v47 = self;
        v48 = v47;
        if (!v47)
        {
          v13 = CFSTR("<nil>");
          goto LABEL_55;
        }
        v49 = (objc_class *)objc_opt_class(v47);
        v50 = NSStringFromClass(v49);
        v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
        if ((objc_opt_respondsToSelector(v48, "accessibilityIdentifier") & 1) != 0)
        {
          v52 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController performSelector:](v48, "performSelector:", "accessibilityIdentifier"));
          v53 = v52;
          if (v52 && !objc_msgSend(v52, "isEqualToString:", v51))
          {
            v13 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v51, v48, v53));

            goto LABEL_47;
          }

        }
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v51, v48));
LABEL_47:

LABEL_55:
        *(_DWORD *)buf = 138543362;
        v63 = v13;
        goto LABEL_56;
      }
      v37 = sub_10043333C();
      v5 = objc_claimAutoreleasedReturnValue(v37);
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        goto LABEL_58;
      v38 = self;
      v39 = v38;
      if (!v38)
      {
        v13 = CFSTR("<nil>");
        goto LABEL_52;
      }
      v40 = (objc_class *)objc_opt_class(v38);
      v41 = NSStringFromClass(v40);
      v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
      if ((objc_opt_respondsToSelector(v39, "accessibilityIdentifier") & 1) != 0)
      {
        v43 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController performSelector:](v39, "performSelector:", "accessibilityIdentifier"));
        v44 = v43;
        if (v43 && !objc_msgSend(v43, "isEqualToString:", v42))
        {
          v13 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v42, v39, v44));

          goto LABEL_37;
        }

      }
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v42, v39));
LABEL_37:

LABEL_52:
      *(_DWORD *)buf = 138543362;
      v63 = v13;
LABEL_56:
      v54 = v5;
      v55 = OS_LOG_TYPE_ERROR;
      goto LABEL_57;
    }
    v29 = sub_10043333C();
    v5 = objc_claimAutoreleasedReturnValue(v29);
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      goto LABEL_58;
    v30 = self;
    v31 = v30;
    if (!v30)
    {
      v13 = CFSTR("<nil>");
      goto LABEL_49;
    }
    v32 = (objc_class *)objc_opt_class(v30);
    v33 = NSStringFromClass(v32);
    v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
    if ((objc_opt_respondsToSelector(v31, "accessibilityIdentifier") & 1) != 0)
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController performSelector:](v31, "performSelector:", "accessibilityIdentifier"));
      v36 = v35;
      if (v35 && !objc_msgSend(v35, "isEqualToString:", v34))
      {
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v34, v31, v36));

        goto LABEL_29;
      }

    }
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v34, v31));
LABEL_29:

LABEL_49:
    *(_DWORD *)buf = 138543362;
    v63 = v13;
    v45 = "[%{public}@] Will not reload cards, no overlay content view available.";
    goto LABEL_50;
  }
  v4 = sub_10043333C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = self;
    v7 = v6;
    if (!v6)
    {
      v13 = CFSTR("<nil>");
      goto LABEL_39;
    }
    v8 = (objc_class *)objc_opt_class(v6);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    if ((objc_opt_respondsToSelector(v7, "accessibilityIdentifier") & 1) != 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController performSelector:](v7, "performSelector:", "accessibilityIdentifier"));
      v12 = v11;
      if (v11 && !objc_msgSend(v11, "isEqualToString:", v10))
      {
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v10, v7, v12));

        goto LABEL_9;
      }

    }
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v10, v7));
LABEL_9:

LABEL_39:
    *(_DWORD *)buf = 138543362;
    v63 = v13;
    v45 = "[%{public}@] Will not reload cards, suppressed.";
LABEL_50:
    v54 = v5;
    v55 = OS_LOG_TYPE_INFO;
LABEL_57:
    _os_log_impl((void *)&_mh_execute_header, v54, v55, v45, buf, 0xCu);

  }
LABEL_58:

}

- (void)carCardViewCloseButtonTapped:(id)a3
{
  id v4;
  void *v5;
  char v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  CarChromeViewController *v10;
  CarChromeViewController *v11;
  objc_class *v12;
  NSString *v13;
  void *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  CarChromeViewController *v18;
  CarChromeViewController *v19;
  objc_class *v20;
  NSString *v21;
  void *v22;
  void *v23;
  void *v24;
  __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint8_t buf[4];
  __CFString *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
  v6 = objc_opt_respondsToSelector(v5, "carCardViewCloseButtonTapped:");

  v7 = sub_10043333C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if ((v6 & 1) == 0)
  {
    if (!v9)
    {
LABEL_23:

      v31 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController _previousContext](self, "_previousContext"));
      -[CarChromeViewController _captureUserActionBackToContext:](self, "_captureUserActionBackToContext:", v31);

      v28 = (void *)objc_claimAutoreleasedReturnValue(+[CarChromeModeCoordinator sharedInstance](CarChromeModeCoordinator, "sharedInstance"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
      objc_msgSend(v28, "popFromContext:", v32);

      goto LABEL_24;
    }
    v18 = self;
    v19 = v18;
    if (!v18)
    {
      v25 = CFSTR("<nil>");
      goto LABEL_22;
    }
    v20 = (objc_class *)objc_opt_class(v18);
    v21 = NSStringFromClass(v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    if ((objc_opt_respondsToSelector(v19, "accessibilityIdentifier") & 1) != 0)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController performSelector:](v19, "performSelector:", "accessibilityIdentifier"));
      v24 = v23;
      if (v23 && !objc_msgSend(v23, "isEqualToString:", v22))
      {
        v25 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v22, v19, v24));

        goto LABEL_17;
      }

    }
    v25 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v22, v19));
LABEL_17:

LABEL_22:
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](v19, "topContext"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController contexts](v19, "contexts"));
    *(_DWORD *)buf = 138543874;
    v34 = v25;
    v35 = 2112;
    v36 = v29;
    v37 = 2112;
    v38 = v30;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}@] CardView closeButton accessory tapped, chrome will pop current context. Top Context: %@ All Contexts : %@", buf, 0x20u);

    goto LABEL_23;
  }
  if (v9)
  {
    v10 = self;
    v11 = v10;
    if (!v10)
    {
      v17 = CFSTR("<nil>");
      goto LABEL_19;
    }
    v12 = (objc_class *)objc_opt_class(v10);
    v13 = NSStringFromClass(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    if ((objc_opt_respondsToSelector(v11, "accessibilityIdentifier") & 1) != 0)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController performSelector:](v11, "performSelector:", "accessibilityIdentifier"));
      v16 = v15;
      if (v15 && !objc_msgSend(v15, "isEqualToString:", v14))
      {
        v17 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v14, v11, v16));

        goto LABEL_9;
      }

    }
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v14, v11));
LABEL_9:

LABEL_19:
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](v11, "topContext"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController contexts](v11, "contexts"));
    *(_DWORD *)buf = 138543874;
    v34 = v17;
    v35 = 2112;
    v36 = v26;
    v37 = 2112;
    v38 = v27;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}@] CardView closeButton accessory tapped, top context will handle responding. Top Context: %@ All Contexts : %@", buf, 0x20u);

  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
  objc_msgSend(v28, "carCardViewCloseButtonTapped:", v4);
LABEL_24:

}

- (void)carCardView:(id)a3 chevronButtonSelected:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  id v10;
  NSObject *v11;
  CarChromeViewController *v12;
  CarChromeViewController *v13;
  objc_class *v14;
  NSString *v15;
  void *v16;
  void *v17;
  void *v18;
  __CFString *v19;
  void *v20;
  uint8_t buf[4];
  __CFString *v22;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
  v9 = objc_opt_respondsToSelector(v8, "carCardView:chevronButtonSelected:");

  if ((v9 & 1) != 0)
  {
    v10 = sub_10043333C();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
LABEL_12:

      v20 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
      objc_msgSend(v20, "carCardView:chevronButtonSelected:", v6, v7);

      goto LABEL_13;
    }
    v12 = self;
    v13 = v12;
    if (!v12)
    {
      v19 = CFSTR("<nil>");
      goto LABEL_11;
    }
    v14 = (objc_class *)objc_opt_class(v12);
    v15 = NSStringFromClass(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    if ((objc_opt_respondsToSelector(v13, "accessibilityIdentifier") & 1) != 0)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController performSelector:](v13, "performSelector:", "accessibilityIdentifier"));
      v18 = v17;
      if (v17 && !objc_msgSend(v17, "isEqualToString:", v16))
      {
        v19 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v16, v13, v18));

        goto LABEL_9;
      }

    }
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v16, v13));
LABEL_9:

LABEL_11:
    *(_DWORD *)buf = 138543362;
    v22 = v19;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[%{public}@] CardView chevronButton accessory tapped, top context will handle responding.", buf, 0xCu);

    goto LABEL_12;
  }
LABEL_13:

}

- (void)carCardView:(id)a3 didChangeFocus:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  char v8;
  id v9;
  NSObject *v10;
  CarChromeViewController *v11;
  CarChromeViewController *v12;
  objc_class *v13;
  NSString *v14;
  void *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  void *v19;
  uint8_t buf[4];
  __CFString *v21;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
  v8 = objc_opt_respondsToSelector(v7, "carCardView:didChangeFocus:");

  if ((v8 & 1) != 0)
  {
    v9 = sub_10043333C();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
LABEL_12:

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
      objc_msgSend(v19, "carCardView:didChangeFocus:", v6, v4);

      goto LABEL_13;
    }
    v11 = self;
    v12 = v11;
    if (!v11)
    {
      v18 = CFSTR("<nil>");
      goto LABEL_11;
    }
    v13 = (objc_class *)objc_opt_class(v11);
    v14 = NSStringFromClass(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    if ((objc_opt_respondsToSelector(v12, "accessibilityIdentifier") & 1) != 0)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController performSelector:](v12, "performSelector:", "accessibilityIdentifier"));
      v17 = v16;
      if (v16 && !objc_msgSend(v16, "isEqualToString:", v15))
      {
        v18 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v15, v12, v17));

        goto LABEL_9;
      }

    }
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v15, v12));
LABEL_9:

LABEL_11:
    *(_DWORD *)buf = 138543362;
    v21 = v18;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[%{public}@] CardView became focused, topContext will handle responding.", buf, 0xCu);

    goto LABEL_12;
  }
LABEL_13:

}

- (void)setNeedsAutohideBehaviorUpdateForContext:(id)a3
{
  id v4;
  unsigned int v5;

  v4 = a3;
  -[CarChromeViewController _requestAutohideBehaviorForContext:](self, "_requestAutohideBehaviorForContext:", v4);
  v5 = -[ChromeViewController isTopContext:](self, "isTopContext:", v4);

  if (v5)
    -[CarChromeViewController _updateAutohideBehavior](self, "_updateAutohideBehavior");
}

- (void)_requestAutohideBehaviorForContext:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  if ((objc_opt_respondsToSelector(v5, "autohideBehavior") & 1) != 0)
    v4 = objc_msgSend(v5, "autohideBehavior");
  else
    v4 = 0;
  if (v4 != (id)-[CarChromeViewController _autohidingBehaviorForContext:](self, "_autohidingBehaviorForContext:", v5))
    -[CarChromeViewController _setAutohideBehavior:forContext:](self, "_setAutohideBehavior:forContext:", v4, v5);

}

- (BOOL)_autohidingContentIsHiddenForContext:(id)a3
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController chromeViewItemForContext:createIfNeeded:](self, "chromeViewItemForContext:createIfNeeded:", a3, 0));
  v4 = objc_msgSend(v3, "isAutohidingContentHidden");

  return v4;
}

- (void)_recordAutohidingContentIsHidden:(BOOL)a3 forContext:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  NSObject *v8;
  __CFString *v9;
  __CFString *v10;
  id v11;
  void *v12;
  objc_class *v13;
  NSString *v14;
  void *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  void *v19;
  uint8_t buf[4];
  __CFString *v21;
  __int16 v22;
  __CFString *v23;

  v4 = a3;
  v6 = a4;
  v7 = sub_10043364C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = CFSTR("NO");
    if (v4)
      v9 = CFSTR("YES");
    v10 = v9;
    v11 = v6;
    v12 = v11;
    if (!v11)
    {
      v18 = CFSTR("<nil>");
      goto LABEL_12;
    }
    v13 = (objc_class *)objc_opt_class(v11);
    v14 = NSStringFromClass(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    if ((objc_opt_respondsToSelector(v12, "accessibilityIdentifier") & 1) != 0)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "performSelector:", "accessibilityIdentifier"));
      v17 = v16;
      if (v16 && !objc_msgSend(v16, "isEqualToString:", v15))
      {
        v18 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v15, v12, v17));

        goto LABEL_10;
      }

    }
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v15, v12));
LABEL_10:

LABEL_12:
    *(_DWORD *)buf = 138412546;
    v21 = v10;
    v22 = 2112;
    v23 = v18;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "_setAutohidingContentIsHidden (hidden:%@, context:%@", buf, 0x16u);

  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController chromeViewItemForContext:createIfNeeded:](self, "chromeViewItemForContext:createIfNeeded:", v6, 1));
  objc_msgSend(v19, "setAutohidingContentIsHidden:", v4);

}

- (int64_t)_autohidingBehaviorForContext:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (-[CarChromeViewController isForcingAutohideBehavior](self, "isForcingAutohideBehavior"))
  {
    v5 = -[CarChromeViewController forcedAutohideBehavior](self, "forcedAutohideBehavior");
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController chromeViewItemForContext:createIfNeeded:](self, "chromeViewItemForContext:createIfNeeded:", v4, 0));
    v7 = v6;
    if (v6)
      v5 = objc_msgSend(v6, "autohideBehavior");
    else
      v5 = 0;

  }
  return (int64_t)v5;
}

- (void)_setAutohideBehavior:(int64_t)a3 forContext:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  objc_class *v11;
  NSString *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  void *v17;
  uint8_t buf[4];
  int64_t v19;
  __int16 v20;
  __CFString *v21;

  v6 = a4;
  v7 = sub_10043364C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = v6;
    v10 = v9;
    if (!v9)
    {
      v16 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v11 = (objc_class *)objc_opt_class(v9);
    v12 = NSStringFromClass(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    if ((objc_opt_respondsToSelector(v10, "accessibilityIdentifier") & 1) != 0)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "performSelector:", "accessibilityIdentifier"));
      v15 = v14;
      if (v14 && !objc_msgSend(v14, "isEqualToString:", v13))
      {
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v13, v10, v15));

        goto LABEL_8;
      }

    }
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v13, v10));
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 134218242;
    v19 = a3;
    v20 = 2112;
    v21 = v16;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "_setAutohideBehaviour (behavior:%ld, context:%@", buf, 0x16u);

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController chromeViewItemForContext:createIfNeeded:](self, "chromeViewItemForContext:createIfNeeded:", v6, 1));
  objc_msgSend(v17, "setAutohideBehavior:", a3);

}

- (void)_updateAutohideBehavior
{
  void *v3;
  int64_t v4;
  id v5;
  NSObject *v6;
  void *v7;
  unsigned int v8;
  CarChromeViewController *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  void *v15;
  unsigned __int8 v16;
  id v17;
  NSObject *v18;
  uint8_t v19[16];
  uint8_t v20[16];
  uint8_t v21[16];
  uint8_t buf[16];

  if (self->_isCurrentlyVisible)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
    v4 = -[CarChromeViewController _autohidingBehaviorForContext:](self, "_autohidingBehaviorForContext:", v3);

    switch(v4)
    {
      case -1:
      case 0:
        break;
      case 1:
        v13 = sub_10043364C();
        v14 = objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v21 = 0;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Will set autohide to always", v21, 2u);
        }

        v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
        v16 = -[CarChromeViewController _autohidingContentIsHiddenForContext:](self, "_autohidingContentIsHiddenForContext:", v15);

        if ((v16 & 1) != 0)
          goto LABEL_8;
        v9 = self;
        v10 = 1;
        goto LABEL_7;
      case 2:
      case 3:
        v11 = sub_10043364C();
        v12 = objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v19 = 0;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Will set autohide to when idle/toggle with initial idle hiding", v19, 2u);
        }

        -[CarChromeViewController _addAutohideGestureRecognizer](self, "_addAutohideGestureRecognizer");
        -[CarChromeViewController _startAutohideIdleTimerIfStopped](self, "_startAutohideIdleTimerIfStopped");
        return;
      case 4:
        v17 = sub_10043364C();
        v18 = objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v20 = 0;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "Will set autohide to toggle", v20, 2u);
        }

        -[CarChromeViewController _addAutohideGestureRecognizer](self, "_addAutohideGestureRecognizer");
        return;
      default:
        return;
    }
  }
  v5 = sub_10043364C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Will set autohide to never", buf, 2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
  v8 = -[CarChromeViewController _autohidingContentIsHiddenForContext:](self, "_autohidingContentIsHiddenForContext:", v7);

  if (v8)
  {
    v9 = self;
    v10 = 0;
LABEL_7:
    -[CarChromeViewController setAutohidingContentHiddenForCurrentContext:](v9, "setAutohidingContentHiddenForCurrentContext:", v10);
  }
LABEL_8:
  -[CarChromeViewController _stopAutohideIdleTimer](self, "_stopAutohideIdleTimer");
  -[CarChromeViewController _removeAutohideGestureRecognizer](self, "_removeAutohideGestureRecognizer");
}

- (void)_autohideBecameIdle
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;
  int64_t v7;

  -[CarChromeViewController _stopAutohideIdleTimer](self, "_stopAutohideIdleTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "screen"));
  v5 = objc_msgSend(v4, "_isCarPlayHumanPresenceInRange");

  if ((v5 & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
    v7 = -[CarChromeViewController _autohidingBehaviorForContext:](self, "_autohidingBehaviorForContext:", v6);

    if ((v7 & 0xFFFFFFFFFFFFFFFELL) == 2)
      -[CarChromeViewController setAutohidingContentHiddenForCurrentContext:](self, "setAutohidingContentHiddenForCurrentContext:", 1);
  }
}

- (void)_autohideGestureRecognizerDetectedTap:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  void *v11;
  unsigned __int8 v12;
  id v13;
  NSObject *v14;
  uint8_t v15[16];
  uint8_t buf[16];

  if (-[UITapGestureRecognizer state](self->_autohideTapRecognizer, "state", a3) == (id)3)
  {
    v4 = sub_10043364C();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Autohide gesture recognizer fired", buf, 2u);
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
    v7 = -[CarChromeViewController _autohidingBehaviorForContext:](self, "_autohidingBehaviorForContext:", v6);

    if (v7 <= 1)
    {
      v13 = sub_10043364C();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Autohide gesture recognizer tried to show/hide content, but it shouldn't be installed.", v15, 2u);
      }

    }
    else
    {
      -[CarChromeViewController _stopAutohideIdleTimer](self, "_stopAutohideIdleTimer");
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
      v9 = -[CarChromeViewController _autohidingContentIsHiddenForContext:](self, "_autohidingContentIsHiddenForContext:", v8);

      if (v9)
        v10 = 1039;
      else
        v10 = 1038;
      -[CarChromeViewController captureUserAction:](self, "captureUserAction:", v10);
      -[CarChromeViewController setAutohidingContentHiddenForCurrentContext:](self, "setAutohidingContentHiddenForCurrentContext:", v9 ^ 1);
      if (v7 == 2)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
        v12 = -[CarChromeViewController _autohidingContentIsHiddenForContext:](self, "_autohidingContentIsHiddenForContext:", v11);

        if ((v12 & 1) == 0)
          -[CarChromeViewController _restartAutohideIdleTimer](self, "_restartAutohideIdleTimer");
      }
    }
  }
}

- (void)_humanPresenceDidChange
{
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "screen"));

  if (objc_msgSend(v7, "_isCarPlayHumanPresenceInRange"))
  {
    -[CarChromeViewController setAutohidingContentHiddenForCurrentContext:](self, "setAutohidingContentHiddenForCurrentContext:", 0);
    -[CarChromeViewController _stopAutohideIdleTimer](self, "_stopAutohideIdleTimer");
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
    if ((id)-[CarChromeViewController _autohidingBehaviorForContext:](self, "_autohidingBehaviorForContext:", v4) == (id)2)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
      v6 = -[CarChromeViewController _autohidingContentIsHiddenForContext:](self, "_autohidingContentIsHiddenForContext:", v5);

      if ((v6 & 1) == 0)
        -[CarChromeViewController _restartAutohideIdleTimer](self, "_restartAutohideIdleTimer");
    }
    else
    {

    }
  }

}

- (void)interruptAutohideForIncidentalInteraction
{
  void *v3;
  int64_t v4;

  if (self->_isCurrentlyVisible)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
    v4 = -[CarChromeViewController _autohidingBehaviorForContext:](self, "_autohidingBehaviorForContext:", v3);

    switch(v4)
    {
      case 4:
        -[CarChromeViewController setAutohidingContentHiddenForCurrentContext:](self, "setAutohidingContentHiddenForCurrentContext:", 0);
        return;
      case 3:
        if (!self->_autohideIdleTimer)
          return;
        break;
      case 2:
        -[CarChromeViewController setAutohidingContentHiddenForCurrentContext:](self, "setAutohidingContentHiddenForCurrentContext:", 0);
        break;
      default:
        return;
    }
    -[CarChromeViewController _restartAutohideIdleTimer](self, "_restartAutohideIdleTimer");
  }
}

- (void)setAutohidingContentHiddenForCurrentContext:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  int64_t v6;
  BOOL v7;
  void *v8;
  int64_t v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  char v22;
  void *v23;
  int v24;
  void *v25;
  void **v26;
  uint64_t v27;
  void (*v28)(uint64_t);
  void *v29;
  id v30;
  id v31;
  id from;
  id location;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
  v6 = -[CarChromeViewController _autohidingBehaviorForContext:](self, "_autohidingBehaviorForContext:", v5);

  if (!v3 || (self->_isCurrentlyVisible ? (v7 = v6 == 0) : (v7 = 1), !v7))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
    v9 = -[CarChromeViewController _autohidingBehaviorForContext:](self, "_autohidingBehaviorForContext:", v8);

    if (v3 || v9 != 1)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
      v11 = -[CarChromeViewController _autohidingContentIsHiddenForContext:](self, "_autohidingContentIsHiddenForContext:", v10);

      if (v11 != v3)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
        -[CarChromeViewController _recordAutohidingContentIsHidden:forContext:](self, "_recordAutohidingContentIsHidden:forContext:", v3, v12);

        v13 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "window"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "windowScene"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "focusSystem"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "focusedItem"));

        if (!self->_ownsFocus || v3 || v17)
        {
          if (!self->_ownsFocus || !v17 || (objc_msgSend(v17, "canBecomeFocused") & 1) != 0)
          {
LABEL_14:
            v19 = (void *)objc_claimAutoreleasedReturnValue(+[GroupAnimation animation](GroupAnimation, "animation"));
            v20 = objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
            v21 = (void *)v20;
            if (v3)
            {
              v22 = objc_opt_respondsToSelector(v20, "hideAutohidingContentWithAnimation:");

              if ((v22 & 1) != 0)
              {
                v23 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
                objc_msgSend(v23, "hideAutohidingContentWithAnimation:", v19);
LABEL_23:

              }
            }
            else
            {
              v24 = objc_opt_respondsToSelector(v20, "showAutohidingContentWithAnimation:");

              if ((v24 & 1) != 0)
              {
                v23 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
                objc_msgSend(v23, "showAutohidingContentWithAnimation:", v19);
                goto LABEL_23;
              }
            }
            -[ChromeViewController setNeedsUpdateComponent:animated:](self, "setNeedsUpdateComponent:animated:", CFSTR("mapcontrols"), 1);
            -[ChromeViewController setNeedsUpdateComponent:animated:](self, "setNeedsUpdateComponent:animated:", CFSTR("accessories"), 1);
            -[ChromeViewController updateComponentsIfNeededWithAnimation:](self, "updateComponentsIfNeededWithAnimation:", v19);
            v25 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController navigationDisplay](self, "navigationDisplay"));
            objc_initWeak(&location, v25);

            objc_initWeak(&from, v19);
            v26 = _NSConcreteStackBlock;
            v27 = 3221225472;
            v28 = sub_1002418E4;
            v29 = &unk_1011AD728;
            objc_copyWeak(&v30, &location);
            objc_copyWeak(&v31, &from);
            objc_msgSend(v19, "addPreparation:animations:completion:", &v26, 0, 0);
            objc_msgSend(v19, "runWithCurrentOptions", v26, v27, v28, v29);
            objc_destroyWeak(&v31);
            objc_destroyWeak(&v30);
            objc_destroyWeak(&from);
            objc_destroyWeak(&location);

            return;
          }
        }
        else
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
          objc_storeWeak((id *)&self->_restoreFocusForContext, v18);

        }
        -[CarChromeViewController setNeedsFocusUpdate](self, "setNeedsFocusUpdate");
        -[CarChromeViewController updateFocusIfNeeded](self, "updateFocusIfNeeded");
        goto LABEL_14;
      }
    }
  }
}

- (BOOL)isAutohidingContentHiddenForCurrentContext
{
  CarChromeViewController *v2;
  void *v3;

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
  LOBYTE(v2) = -[CarChromeViewController _autohidingContentIsHiddenForContext:](v2, "_autohidingContentIsHiddenForContext:", v3);

  return (char)v2;
}

- (BOOL)isAutohidingContentHiddenForContext:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (-[ChromeViewController isCurrentContext:](self, "isCurrentContext:", v4))
    v5 = -[CarChromeViewController _autohidingContentIsHiddenForContext:](self, "_autohidingContentIsHiddenForContext:", v4);
  else
    v5 = 0;

  return v5;
}

- (BOOL)_areAccessoriesHiddenForCurrentContext
{
  CarChromeViewController *v2;
  void *v3;

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
  LOBYTE(v2) = -[CarChromeViewController _areAccessoriesHiddenForContext:](v2, "_areAccessoriesHiddenForContext:", v3);

  return (char)v2;
}

- (BOOL)_areAccessoriesHiddenForContext:(id)a3
{
  id v4;
  id v5;
  unsigned __int8 v6;
  unsigned __int8 v7;

  v4 = a3;
  if ((objc_opt_respondsToSelector(v4, "accessoriesHidingBehavior") & 1) != 0)
  {
    v5 = objc_msgSend(v4, "accessoriesHidingBehavior");
    if (v5 == (id)3)
    {
      v6 = -[ChromeViewController isCurrentContext:](self, "isCurrentContext:", v4);
      goto LABEL_8;
    }
    if (v5 == (id)2)
    {
      v7 = -[CarChromeViewController isAutohidingContentHiddenForContext:](self, "isAutohidingContentHiddenForContext:", v4);
      goto LABEL_10;
    }
    if (v5 == (id)1)
    {
      v6 = -[CarChromeViewController isAutohidingContentHiddenForContext:](self, "isAutohidingContentHiddenForContext:", v4);
LABEL_8:
      v7 = v6 ^ 1;
      goto LABEL_10;
    }
  }
  v7 = 1;
LABEL_10:

  return v7;
}

- (void)_startAutohideIdleTimerIfStopped
{
  if (!self->_autohideIdleTimer)
    -[CarChromeViewController _restartAutohideIdleTimer](self, "_restartAutohideIdleTimer");
}

- (void)restartAutohideIdleTimerIfStarted
{
  if (self->_autohideIdleTimer)
    -[CarChromeViewController _restartAutohideIdleTimer](self, "_restartAutohideIdleTimer");
  -[CarChromeViewController _restartNavigationObscuredTimeout](self, "_restartNavigationObscuredTimeout");
}

- (void)_restartAutohideIdleTimer
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  NSTimer *v13;
  NSTimer *autohideIdleTimer;

  -[CarChromeViewController _stopAutohideIdleTimer](self, "_stopAutohideIdleTimer");
  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 10.0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("CarAutoHideContentTimeInterval")));

  if (v5)
    v6 = v5;
  else
    v6 = v3;
  v7 = v6;

  objc_msgSend(v7, "doubleValue");
  v9 = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
  LOBYTE(v7) = objc_opt_respondsToSelector(v10, "autohideIdlenessInterval");

  if ((v7 & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
    objc_msgSend(v11, "autohideIdlenessInterval");
    v9 = v12;

  }
  v13 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "_autohideBecameIdle", 0, 0, v9));
  autohideIdleTimer = self->_autohideIdleTimer;
  self->_autohideIdleTimer = v13;

}

- (void)_stopAutohideIdleTimer
{
  NSTimer *autohideIdleTimer;
  NSTimer *v4;

  autohideIdleTimer = self->_autohideIdleTimer;
  if (autohideIdleTimer)
  {
    -[NSTimer invalidate](autohideIdleTimer, "invalidate");
    v4 = self->_autohideIdleTimer;
    self->_autohideIdleTimer = 0;

  }
}

- (void)_addAutohideGestureRecognizer
{
  UITapGestureRecognizer *autohideTapRecognizer;
  UITapGestureRecognizer *v4;
  UITapGestureRecognizer *v5;
  void *v6;
  void *v7;
  void *v8;
  UITapGestureRecognizer *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  UITapGestureRecognizer *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *autohidePresenceObserverToken;
  _QWORD v22[4];
  id v23;
  id location;

  autohideTapRecognizer = self->_autohideTapRecognizer;
  if (!autohideTapRecognizer)
  {
    v4 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "_autohideGestureRecognizerDetectedTap:");
    v5 = self->_autohideTapRecognizer;
    self->_autohideTapRecognizer = v4;

    -[UITapGestureRecognizer setAllowedTouchTypes:](self->_autohideTapRecognizer, "setAllowedTouchTypes:", &off_101272F90);
    -[UITapGestureRecognizer setDelegate:](self->_autohideTapRecognizer, "setDelegate:", self);
    if (self->_doubleTapRecognizer)
      -[UITapGestureRecognizer requireGestureRecognizerToFail:](self->_autohideTapRecognizer, "requireGestureRecognizerToFail:");
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController view](self, "view"));
    objc_msgSend(v6, "addGestureRecognizer:", self->_autohideTapRecognizer);

    autohideTapRecognizer = self->_autohideTapRecognizer;
  }
  -[UITapGestureRecognizer setEnabled:](autohideTapRecognizer, "setEnabled:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_doubleTapGestureRecognizer"));

  if (v8)
  {
    v9 = self->_autohideTapRecognizer;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_doubleTapGestureRecognizer"));
    -[UITapGestureRecognizer requireGestureRecognizerToFail:](v9, "requireGestureRecognizerToFail:", v11);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "_oneHandedZoomGestureRecognizer"));

  if (v13)
  {
    v14 = self->_autohideTapRecognizer;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "_oneHandedZoomGestureRecognizer"));
    -[UITapGestureRecognizer requireGestureRecognizerToFail:](v14, "requireGestureRecognizerToFail:", v16);

  }
  if (!self->_autohidePresenceObserverToken)
  {
    objc_initWeak(&location, self);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
    v19 = _UIScreenCarPlayHumanPresenceDidChangeNotification;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100241ECC;
    v22[3] = &unk_1011AD288;
    objc_copyWeak(&v23, &location);
    v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "addObserverForName:object:queue:usingBlock:", v19, 0, v18, v22));
    autohidePresenceObserverToken = self->_autohidePresenceObserverToken;
    self->_autohidePresenceObserverToken = v20;

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  UITapGestureRecognizer *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  BOOL v14;

  v6 = (UITapGestureRecognizer *)a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "view"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController passThroughView](self, "passThroughView"));
  if (v8 != v9 && (objc_msgSend(v8, "isDescendantOfView:", v9) & 1) == 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController viewIfLoaded](self, "viewIfLoaded"));

    if (v8 != v10)
      goto LABEL_7;
  }
  if (self->_autohideTapRecognizer != v6)
    goto LABEL_9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
  if ((objc_opt_respondsToSelector(v11, "shouldSuppressAutohideRecognizerForTouch:") & 1) == 0)
  {

    goto LABEL_9;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
  v13 = objc_msgSend(v12, "shouldSuppressAutohideRecognizerForTouch:", v7);

  if ((v13 & 1) == 0)
  {
LABEL_9:
    v14 = 1;
    goto LABEL_10;
  }
LABEL_7:
  v14 = 0;
LABEL_10:

  return v14;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 0;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v5;
  void *v6;
  id v7;

  if (self->_autohideTapRecognizer == a3
    && (v5 = a4,
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView")),
        v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_selectingTapGestureRecognizer")),
        v5,
        v7,
        v6,
        v7 == v5))
  {
    return -[CarChromeViewController _canSelectAlternateRoutes](self, "_canSelectAlternateRoutes");
  }
  else
  {
    return 0;
  }
}

- (void)_removeAutohideGestureRecognizer
{
  UITapGestureRecognizer *autohideTapRecognizer;
  void *v4;
  NSObject *autohidePresenceObserverToken;

  autohideTapRecognizer = self->_autohideTapRecognizer;
  if (autohideTapRecognizer)
    -[UITapGestureRecognizer setEnabled:](autohideTapRecognizer, "setEnabled:", 0);
  if (self->_autohidePresenceObserverToken)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v4, "removeObserver:", self->_autohidePresenceObserverToken);

    autohidePresenceObserverToken = self->_autohidePresenceObserverToken;
    self->_autohidePresenceObserverToken = 0;

  }
}

- (BOOL)isForcingAutohideBehavior
{
  return -[MapsTokenStorage count](self->_forcedAutohideTokens, "count") != 0;
}

- (int64_t)forcedAutohideBehavior
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  int v11;
  id v12;

  if (!-[CarChromeViewController isForcingAutohideBehavior](self, "isForcingAutohideBehavior"))
    return -1;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsTokenStorage tokens](self->_forcedAutohideTokens, "tokens"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastObject"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CarForcedAutohideBehaviorKey")));
  v7 = objc_msgSend(v6, "integerValue");

  v8 = sub_10043364C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v11 = 134217984;
    v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "forcedAutohideBehavior: %ld", (uint8_t *)&v11, 0xCu);
  }

  return (int64_t)v7;
}

- (id)acquireForcedAutohideBehaviourTokenWithBehaviour:(int64_t)a3
{
  MapsTokenStorage *forcedAutohideTokens;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  void *v9;

  forcedAutohideTokens = self->_forcedAutohideTokens;
  v8 = CFSTR("CarForcedAutohideBehaviorKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  v9 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsTokenStorage tokenWithUserInfo:](forcedAutohideTokens, "tokenWithUserInfo:", v5));

  return v6;
}

- (void)incrementForToken:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  objc_class *v14;
  NSString *v15;
  void *v16;
  void *v17;
  void *v18;
  __CFString *v19;
  void *v20;
  unsigned int v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  objc_super v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  __CFString *v33;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)CarChromeViewController;
  -[ChromeViewController incrementForToken:](&v29, "incrementForToken:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tokenGroupName"));
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("CarForcedAutohideBehaviorTokenGroup"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("CarForcedAutohideBehaviorKey")));
    v9 = objc_msgSend(v8, "integerValue");

    v10 = sub_10043364C();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
LABEL_20:

      -[CarChromeViewController _updateAutohideBehavior](self, "_updateAutohideBehavior");
      goto LABEL_21;
    }
    v12 = v4;
    v13 = v12;
    if (!v12)
    {
      v19 = CFSTR("<nil>");
      goto LABEL_19;
    }
    v14 = (objc_class *)objc_opt_class(v12);
    v15 = NSStringFromClass(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    if ((objc_opt_respondsToSelector(v13, "accessibilityIdentifier") & 1) != 0)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "performSelector:", "accessibilityIdentifier"));
      v18 = v17;
      if (v17 && !objc_msgSend(v17, "isEqualToString:", v16))
      {
        v19 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v16, v13, v18));

        goto LABEL_9;
      }

    }
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v16, v13));
LABEL_9:

LABEL_19:
    *(_DWORD *)buf = 134218242;
    v31 = v9;
    v32 = 2112;
    v33 = v19;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "_beginForcingAutohideBehavior (behavior: %ld, token: %@)", buf, 0x16u);

    goto LABEL_20;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tokenGroupName"));
  v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("CarChromeModernMap"));

  if (v21)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("reason")));

    v24 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v23, v24) & 1) == 0)
    {
      v25 = sub_10043196C();
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v31 = v4;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Invalid modern map token: %@", buf, 0xCu);
      }

    }
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v27, "postNotificationName:object:", CFSTR("ChromeViewControllerDidUpdateShouldUseModernMap"), self);

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
    if (v28)
      -[CarChromeViewController _updateModernMapCartographicConfiguration](self, "_updateModernMapCartographicConfiguration");

  }
LABEL_21:

}

- (void)decrementForToken:(id)a3
{
  id v4;
  const char *label;
  const char *v6;
  BOOL v7;
  void *v8;
  unsigned int v9;
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  objc_class *v14;
  NSString *v15;
  void *v16;
  void *v17;
  void *v18;
  __CFString *v19;
  void *v20;
  unsigned int v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  id v28;
  NSObject *v29;
  char *v30;
  objc_super v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  const char *v43;

  v4 = a3;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v6 = dispatch_queue_get_label(0);
  if (label != v6)
  {
    v7 = !label || v6 == 0;
    if (v7 || strcmp(label, v6))
    {
      v26 = sub_1004318FC();
      v27 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        v33 = "-[CarChromeViewController decrementForToken:]";
        v34 = 2080;
        v35 = "CarChromeViewController.m";
        v36 = 1024;
        v37 = 3479;
        v38 = 2080;
        v39 = "dispatch_get_main_queue()";
        v40 = 2080;
        v41 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v42 = 2080;
        v43 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          buf,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v28 = sub_1004318FC();
        v29 = objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          v30 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          *(_DWORD *)buf = 138412290;
          v33 = v30;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

        }
      }
    }
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tokenGroupName"));
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("CarForcedAutohideBehaviorTokenGroup"));

  if (v9)
  {
    v10 = sub_10043364C();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
LABEL_24:

      -[CarChromeViewController _updateAutohideBehavior](self, "_updateAutohideBehavior");
      goto LABEL_25;
    }
    v12 = v4;
    v13 = v12;
    if (!v12)
    {
      v19 = CFSTR("<nil>");
      goto LABEL_23;
    }
    v14 = (objc_class *)objc_opt_class(v12);
    v15 = NSStringFromClass(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    if ((objc_opt_respondsToSelector(v13, "accessibilityIdentifier") & 1) != 0)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "performSelector:", "accessibilityIdentifier"));
      v18 = v17;
      if (v17 && !objc_msgSend(v17, "isEqualToString:", v16))
      {
        v19 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v16, v13, v18));

        goto LABEL_15;
      }

    }
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v16, v13));
LABEL_15:

LABEL_23:
    *(_DWORD *)buf = 138412290;
    v33 = (const char *)v19;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "_endForcingAutohideBehaviorWithToken (token: %@)", buf, 0xCu);

    goto LABEL_24;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tokenGroupName"));
  v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("CarChromeModernMap"));

  if (v21)
  {
    v22 = sub_10043196C();
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v33 = (const char *)v4;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Releasing modern map token: %@", buf, 0xCu);
    }

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v24, "postNotificationName:object:", CFSTR("ChromeViewControllerDidUpdateShouldUseModernMap"), self);

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController mapView](self, "mapView"));
    if (v25)
      -[CarChromeViewController _updateModernMapCartographicConfiguration](self, "_updateModernMapCartographicConfiguration");
  }
  else
  {
    v31.receiver = self;
    v31.super_class = (Class)CarChromeViewController;
    -[ChromeViewController decrementForToken:](&v31, "decrementForToken:", v4);
  }
LABEL_25:

}

- (void)setHardwareBackButtonBehavior:(int64_t)a3 forContext:(id)a4
{
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  unint64_t v10;
  __CFString *v11;
  __CFString *v12;
  objc_class *v13;
  NSString *v14;
  void *v15;
  int v16;
  __CFString *v17;
  __int16 v18;
  __CFString *v19;
  __int16 v20;
  void *v21;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController chromeViewItemForContext:createIfNeeded:](self, "chromeViewItemForContext:createIfNeeded:", v6, 1));
  if (a3 == 1)
    a3 = objc_opt_respondsToSelector(v6, "handleHardwareBackButtonPressed") & 1;
  v8 = sub_10043364C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = (unint64_t)objc_msgSend(v7, "hardwareBackButtonBehavior");
    if (v10 > 3)
      v11 = 0;
    else
      v11 = off_1011AD7A0[v10];
    if ((unint64_t)a3 > 3)
      v12 = 0;
    else
      v12 = off_1011AD7A0[a3];
    v13 = (objc_class *)objc_opt_class(v6);
    v14 = NSStringFromClass(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = 138412802;
    v17 = v11;
    v18 = 2112;
    v19 = v12;
    v20 = 2112;
    v21 = v15;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Updating HW back button behavior from: %@ to : %@. For context: %@", (uint8_t *)&v16, 0x20u);

  }
  objc_msgSend(v7, "setHardwareBackButtonBehavior:", a3);
  -[CarChromeViewController updateHardwareBackButtonBehavior](self, "updateHardwareBackButtonBehavior");

}

- (void)updateHardwareBackButtonBehavior
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  _BOOL8 v8;
  void *v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController chromeViewItemForContext:createIfNeeded:](self, "chromeViewItemForContext:createIfNeeded:", v3, 0));
  v5 = objc_msgSend(v4, "hardwareBackButtonBehavior");

  switch((unint64_t)v5)
  {
    case 0uLL:
      v10 = (id)objc_claimAutoreleasedReturnValue(-[ChromeViewController contexts](self, "contexts"));
      v8 = (unint64_t)objc_msgSend(v10, "count") > 1;
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController backButtonRecognizer](self, "backButtonRecognizer"));
      objc_msgSend(v9, "setEnabled:", v8);

      goto LABEL_6;
    case 1uLL:
    case 3uLL:
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController backButtonRecognizer](self, "backButtonRecognizer"));
      v10 = v6;
      v7 = 1;
      goto LABEL_5;
    case 2uLL:
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController backButtonRecognizer](self, "backButtonRecognizer"));
      v10 = v6;
      v7 = 0;
LABEL_5:
      objc_msgSend(v6, "setEnabled:", v7);
LABEL_6:

      break;
    default:
      return;
  }
}

- (id)_previousContext
{
  void *v3;
  char *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController contexts](self, "contexts"));
  v4 = (char *)objc_msgSend(v3, "count");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController contexts](self, "contexts"));
  v6 = objc_msgSend(v5, "count");

  if ((unint64_t)v6 >= 2)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeViewController contexts](self, "contexts"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v4 - 2));

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)_handleBackButtonPressed:(id)a3
{
  -[CarChromeViewController _handleBackButton](self, "_handleBackButton", a3);
}

- (void)_handleBackButton
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  objc_class *v10;
  NSString *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  uint8_t buf[4];
  __CFString *v23;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController chromeViewItemForContext:createIfNeeded:](self, "chromeViewItemForContext:createIfNeeded:", v3, 0));

  v5 = objc_msgSend(v4, "hardwareBackButtonBehavior");
  if (!v5)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController _previousContext](self, "_previousContext"));
    -[CarChromeViewController _captureUserActionBackToContext:](self, "_captureUserActionBackToContext:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[CarChromeModeCoordinator sharedInstance](CarChromeModeCoordinator, "sharedInstance"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
    objc_msgSend(v17, "popFromContext:", v18);

    goto LABEL_16;
  }
  if (v5 == (id)1)
  {
    v6 = sub_10043364C();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      goto LABEL_14;
    v8 = (id)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
    v9 = v8;
    if (!v8)
    {
      v15 = CFSTR("<nil>");
      goto LABEL_13;
    }
    v10 = (objc_class *)objc_opt_class(v8);
    v11 = NSStringFromClass(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    if ((objc_opt_respondsToSelector(v9, "accessibilityIdentifier") & 1) != 0)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "performSelector:", "accessibilityIdentifier"));
      v14 = v13;
      if (v13 && !objc_msgSend(v13, "isEqualToString:", v12))
      {
        v15 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v12, v9, v14));

        goto LABEL_10;
      }

    }
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v12, v9));
LABEL_10:

LABEL_13:
    *(_DWORD *)buf = 138412290;
    v23 = v15;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%@ will handle hardware back button", buf, 0xCu);

LABEL_14:
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
    v20 = objc_opt_respondsToSelector(v19, "handleHardwareBackButtonPressed");

    if ((v20 & 1) != 0)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeViewController topContext](self, "topContext"));
      objc_msgSend(v21, "handleHardwareBackButtonPressed");

    }
  }
LABEL_16:

}

- ($6E15C01CA1BE37A4936191A84F7075E2)thermalRateLimitsConfigKey
{
  uint64_t v2;
  void *v3;
  $6E15C01CA1BE37A4936191A84F7075E2 result;

  v2 = MapsConfig_ThermalPressureCarPlayNavigationRateLimits;
  v3 = off_1014B47C8;
  result.var0.var1 = v3;
  *(_QWORD *)&result.var0.var0 = v2;
  return result;
}

- ($6E15C01CA1BE37A4936191A84F7075E2)batteryLevelRateLimitEnabledConfigKey
{
  uint64_t v2;
  void *v3;
  $6E15C01CA1BE37A4936191A84F7075E2 result;

  v2 = MapsConfig_BatteryLevelNavigationRateLimitEnabledCarPlay;
  v3 = off_1014B47E8;
  result.var0.var1 = v3;
  *(_QWORD *)&result.var0.var0 = v2;
  return result;
}

- ($6E15C01CA1BE37A4936191A84F7075E2)lowPowerModeRateLimitEnabledConfigKey
{
  uint64_t v2;
  void *v3;
  $6E15C01CA1BE37A4936191A84F7075E2 result;

  v2 = MapsConfig_LowPowerNavigationRateLimitEnabledCarPlay;
  v3 = off_1014B4828;
  result.var0.var1 = v3;
  *(_QWORD *)&result.var0.var0 = v2;
  return result;
}

- (int64_t)sceneType
{
  return self->_sceneType;
}

- (MapsLightLevelController)lightLevelController
{
  return self->_lightLevelController;
}

- (void)setLightLevelController:(id)a3
{
  objc_storeStrong((id *)&self->_lightLevelController, a3);
}

- (void)setRouteGeniusAnnotationsManager:(id)a3
{
  objc_storeStrong((id *)&self->_routeGeniusAnnotationsManager, a3);
}

- (void)setDefaultMapSettings:(id)a3
{
  objc_storeStrong((id *)&self->_defaultMapSettings, a3);
}

- (void)setNudgerizer:(id)a3
{
  objc_storeStrong((id *)&self->_nudgerizer, a3);
}

- (UILayoutGuide)notificationLayoutGuide
{
  return self->_notificationLayoutGuide;
}

- (UILayoutGuide)cardsLayoutGuide
{
  return self->_cardsLayoutGuide;
}

- (void)setCardsLayoutGuide:(id)a3
{
  objc_storeStrong((id *)&self->_cardsLayoutGuide, a3);
}

- (UILayoutGuide)statusBannerLayoutGuide
{
  return self->_statusBannerLayoutGuide;
}

- (void)setStatusBannerLayoutGuide:(id)a3
{
  objc_storeStrong((id *)&self->_statusBannerLayoutGuide, a3);
}

- (UILayoutGuide)accessoriesCompactLayoutGuide
{
  return self->_accessoriesCompactLayoutGuide;
}

- (void)setAccessoriesCompactLayoutGuide:(id)a3
{
  objc_storeStrong((id *)&self->_accessoriesCompactLayoutGuide, a3);
}

- (CarCardsOverlay)cardsOverlay
{
  return self->_cardsOverlay;
}

- (void)setCardsOverlay:(id)a3
{
  objc_storeStrong((id *)&self->_cardsOverlay, a3);
}

- (CarAccessoriesOverlay)accessoriesOverlay
{
  return self->_accessoriesOverlay;
}

- (void)setAccessoriesOverlay:(id)a3
{
  objc_storeStrong((id *)&self->_accessoriesOverlay, a3);
}

- (CarMapControlsOverlay)mapControlsOverlay
{
  return self->_mapControlsOverlay;
}

- (void)setMapControlsOverlay:(id)a3
{
  objc_storeStrong((id *)&self->_mapControlsOverlay, a3);
}

- (CarStatusBannerOverlay)statusBannerOverlay
{
  return self->_statusBannerOverlay;
}

- (void)setStatusBannerOverlay:(id)a3
{
  objc_storeStrong((id *)&self->_statusBannerOverlay, a3);
}

- (BOOL)haveVehicleDirection
{
  return self->_haveVehicleDirection;
}

- (void)setHaveVehicleDirection:(BOOL)a3
{
  self->_haveVehicleDirection = a3;
}

- (void)setMapViewResponder:(id)a3
{
  objc_storeStrong((id *)&self->_mapViewResponder, a3);
}

- (void)setRouteSelectionController:(id)a3
{
  objc_storeStrong((id *)&self->_routeSelectionController, a3);
}

- (UITapGestureRecognizer)backButtonRecognizer
{
  return self->_backButtonRecognizer;
}

- (void)setBackButtonRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_backButtonRecognizer, a3);
}

- (id)doubleTapBlock
{
  return self->_doubleTapBlock;
}

- (void)setDoubleTapBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 912);
}

- (void)setChromeItemsByContext:(id)a3
{
  objc_storeStrong((id *)&self->_chromeItemsByContext, a3);
}

- (void)setLastFocusedIdentifiersByContext:(id)a3
{
  objc_storeStrong((id *)&self->_lastFocusedIdentifiersByContext, a3);
}

- (void)setLastFocusedItemsByContext:(id)a3
{
  objc_storeStrong((id *)&self->_lastFocusedItemsByContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastFocusedItemsByContext, 0);
  objc_storeStrong((id *)&self->_lastFocusedIdentifiersByContext, 0);
  objc_storeStrong((id *)&self->_chromeItemsByContext, 0);
  objc_storeStrong(&self->_doubleTapBlock, 0);
  objc_storeStrong((id *)&self->_backButtonRecognizer, 0);
  objc_storeStrong((id *)&self->_routeSelectionController, 0);
  objc_storeStrong((id *)&self->_mapViewResponder, 0);
  objc_storeStrong((id *)&self->_statusBannerOverlay, 0);
  objc_storeStrong((id *)&self->_mapControlsOverlay, 0);
  objc_storeStrong((id *)&self->_accessoriesOverlay, 0);
  objc_storeStrong((id *)&self->_cardsOverlay, 0);
  objc_storeStrong((id *)&self->_accessoriesCompactLayoutGuide, 0);
  objc_storeStrong((id *)&self->_statusBannerLayoutGuide, 0);
  objc_storeStrong((id *)&self->_cardsLayoutGuide, 0);
  objc_storeStrong((id *)&self->_notificationLayoutGuide, 0);
  objc_storeStrong((id *)&self->_nudgerizer, 0);
  objc_storeStrong((id *)&self->_defaultMapSettings, 0);
  objc_storeStrong((id *)&self->_routeGeniusAnnotationsManager, 0);
  objc_storeStrong((id *)&self->_lightLevelController, 0);
  objc_storeStrong((id *)&self->_headingUpMapInsetAdjustmentConstraint, 0);
  objc_storeStrong((id *)&self->_interruptionManager, 0);
  objc_storeStrong((id *)&self->_focusContainerGuideController, 0);
  objc_destroyWeak((id *)&self->_restoreFocusForContext);
  objc_storeStrong((id *)&self->_customPOIsController, 0);
  objc_storeStrong((id *)&self->_personalizedItemManager, 0);
  objc_storeStrong((id *)&self->_alertDismissalBlocks, 0);
  objc_storeStrong((id *)&self->_currentAlertViewController, 0);
  objc_storeStrong(&self->_visibilityDeactivationToken, 0);
  objc_storeStrong((id *)&self->_navigationObscuredTimeout, 0);
  objc_storeStrong(&self->_usingOfflineDataModernMapToken, 0);
  objc_storeStrong((id *)&self->_modernMapTokens, 0);
  objc_storeStrong((id *)&self->_forcedAutohideTokens, 0);
  objc_storeStrong((id *)&self->_autohidePresenceObserverToken, 0);
  objc_storeStrong((id *)&self->_doubleTapRecognizer, 0);
  objc_storeStrong((id *)&self->_autohideTapRecognizer, 0);
  objc_storeStrong((id *)&self->_autohideIdleTimer, 0);
}

@end
