@implementation NavigationStateMonitoringTask

- (NavigationStateMonitoringTask)initWithPlatformController:(id)a3 navigationService:(id)a4
{
  id v6;
  id v7;
  NavigationStateMonitoringTask *v8;
  NavigationStateMonitoringTask *v9;
  void *v10;
  __CFString *v11;
  id WeakRetained;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSHashTable *navigationCompletionBlocks;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v23;

  v6 = a3;
  v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)NavigationStateMonitoringTask;
  v8 = -[NavigationStateMonitoringTask init](&v23, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_platformController, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v11 = PlatformControllerDidChangeChromeViewControllerNotification;
    WeakRetained = objc_loadWeakRetained((id *)&v9->_platformController);
    objc_msgSend(v10, "addObserver:selector:name:object:", v9, "platformControllerDidChangeChromeViewControllerNotification:", v11, WeakRetained);

    v13 = objc_loadWeakRetained((id *)&v9->_platformController);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "chromeViewController"));
    -[NavigationStateMonitoringTask setChromeViewController:](v9, "setChromeViewController:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v15, "addObserver:selector:name:object:", v9, "_checkAnimationsForAndromeda:", CFSTR("BacklightLuminanceDidChangeNotification"), 0);

    objc_storeStrong((id *)&v9->_navigationService, a4);
    v16 = objc_claimAutoreleasedReturnValue(+[NSHashTable hashTableWithOptions:](NSHashTable, "hashTableWithOptions:", 66048));
    navigationCompletionBlocks = v9->_navigationCompletionBlocks;
    v9->_navigationCompletionBlocks = (NSHashTable *)v16;

    -[MNNavigationService registerObserver:](v9->_navigationService, "registerObserver:", v9);
    -[MNNavigationService openForClient:](v9->_navigationService, "openForClient:", v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[MapsThermalPressureController sharedController](MapsThermalPressureController, "sharedController"));
    objc_msgSend(v18, "addObserver:forMitigationNamed:", v9, CFSTR("NavigationForceModernMapMitigation"));

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[MapsThermalPressureController sharedController](MapsThermalPressureController, "sharedController"));
    objc_msgSend(v19, "addObserver:forMitigationNamed:", v9, CFSTR("NavigationSuppressAllAnimations"));

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[MapsThermalPressureController sharedController](MapsThermalPressureController, "sharedController"));
    objc_msgSend(v20, "addObserver:forMitigationNamed:", v9, CFSTR("NavigationSuppressETAUpdates"));

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[MapsThermalPressureController sharedController](MapsThermalPressureController, "sharedController"));
    objc_msgSend(v21, "addObserver:forMitigationNamed:", v9, CFSTR("NavigationThermalMitigationForceMapInactive"));

    -[NavigationStateMonitoringTask _checkModernMapMitigation](v9, "_checkModernMapMitigation");
    -[NavigationStateMonitoringTask _checkAnimationsMitigation](v9, "_checkAnimationsMitigation");
    -[NavigationStateMonitoringTask _checkETAUpdatesMitigation](v9, "_checkETAUpdatesMitigation");
    -[NavigationStateMonitoringTask _checkMapViewMitigation](v9, "_checkMapViewMitigation");
    -[NavigationStateMonitoringTask _checkAnimationsForAndromeda:](v9, "_checkAnimationsForAndromeda:", 0);
  }

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[NavigationStateMonitoringTask cancelNavigationAutoLaunchIfNeccessary](self, "cancelNavigationAutoLaunchIfNeccessary");
  -[MNNavigationService unregisterObserver:](self->_navigationService, "unregisterObserver:", self);
  -[MNNavigationService closeForClient:](self->_navigationService, "closeForClient:", self);
  v3.receiver = self;
  v3.super_class = (Class)NavigationStateMonitoringTask;
  -[NavigationStateMonitoringTask dealloc](&v3, "dealloc");
}

- (void)setChromeViewController:(id)a3
{
  id WeakRetained;
  id navigationModernMapToken;
  id routePlanningModernMapToken;
  id navigationHikingMapToken;
  id routePlanningHikingMapToken;
  id thermalPressureMapToken;
  id thermalPressureChromeDeactivationToken;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);

  if (WeakRetained != obj)
  {
    navigationModernMapToken = self->_navigationModernMapToken;
    self->_navigationModernMapToken = 0;

    routePlanningModernMapToken = self->_routePlanningModernMapToken;
    self->_routePlanningModernMapToken = 0;

    navigationHikingMapToken = self->_navigationHikingMapToken;
    self->_navigationHikingMapToken = 0;

    routePlanningHikingMapToken = self->_routePlanningHikingMapToken;
    self->_routePlanningHikingMapToken = 0;

    thermalPressureMapToken = self->_thermalPressureMapToken;
    self->_thermalPressureMapToken = 0;

    thermalPressureChromeDeactivationToken = self->_thermalPressureChromeDeactivationToken;
    self->_thermalPressureChromeDeactivationToken = 0;

    objc_storeWeak((id *)&self->_chromeViewController, obj);
    -[NavigationStateMonitoringTask _checkModernMapMitigation](self, "_checkModernMapMitigation");
    -[NavigationStateMonitoringTask _checkMapViewMitigation](self, "_checkMapViewMitigation");
  }

}

+ (int64_t)creationPreference
{
  return 0;
}

- (BOOL)isNavigationAutoLaunchInProgress
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationStateMonitoringTask navigationAutoLaunchTimer](self, "navigationAutoLaunchTimer"));
  v3 = v2 != 0;

  return v3;
}

- (void)cancelNavigationAutoLaunchIfNeccessary
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  v3 = sub_10036C3C4();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Canceling auto launch timer", v8, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationStateMonitoringTask navigationAutoLaunchTimer](self, "navigationAutoLaunchTimer"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationStateMonitoringTask navigationAutoLaunchTimer](self, "navigationAutoLaunchTimer"));
    objc_msgSend(v6, "invalidate");

    -[NavigationStateMonitoringTask setNavigationAutoLaunchTimer:](self, "setNavigationAutoLaunchTimer:", 0);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationStateMonitoringTask currentRoutePlanningSessionConfiguration](self, "currentRoutePlanningSessionConfiguration"));
  objc_msgSend(v7, "setNavigationAutoLaunchDelay:", 0);

}

- (void)beginNavigationWithRouteCollection:(id)a3 navigationDetailsOptions:(NavigationDetailsOptions *)a4 mapServiceTraits:(id)a5 sessionInitiator:(unint64_t)a6 isResumingMultipointRoute:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  char isKindOfClass;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  unsigned int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NavigationSessionBuilder *v31;
  __int128 v32;
  NavigationSessionBuilder *v33;
  void *v34;
  void *v35;
  _OWORD v36[3];
  unint64_t navigationModeContext;

  v7 = a7;
  v12 = a3;
  v13 = a5;
  v14 = sub_10036C3C4();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v36[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Attempting to begin navigation", (uint8_t *)v36, 2u);
  }

  -[NavigationStateMonitoringTask cancelNavigationAutoLaunchIfNeccessary](self, "cancelNavigationAutoLaunchIfNeccessary");
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationStateMonitoringTask platformController](self, "platformController"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "currentSession"));
  v18 = objc_opt_class(NavigationSession);
  isKindOfClass = objc_opt_isKindOfClass(v17, v18);

  if ((isKindOfClass & 1) != 0)
  {
    v20 = sub_10036C3C4();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationStateMonitoringTask platformController](self, "platformController"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "currentSession"));
      LODWORD(v36[0]) = 138412290;
      *(_QWORD *)((char *)v36 + 4) = v23;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Attempted to begin navigation, but there is already a NavigationSession on the sessionStack: %@", (uint8_t *)v36, 0xCu);

    }
  }
  else
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "currentRoute"));
    v25 = objc_msgSend(v24, "carplayDestinationHandoffRequired");

    if (v25)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "currentRoute"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "_maps_directionsWaypoints"));
      v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "lastObject"));

      v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject pin](v21, "pin"));
      if (-[NavigationStateMonitoringTask shouldStartNavigationAutoLaunchTimer](self, "shouldStartNavigationAutoLaunchTimer"))
      {
        -[NavigationStateMonitoringTask handoffDestinationToExternalDevice:](self, "handoffDestinationToExternalDevice:", v28);
      }
      else
      {
        -[NavigationStateMonitoringTask presentHandoffAlertForDestination:](self, "presentHandoffAlertForDestination:", v28);
      }

    }
    else
    {
      if (a6 == 6)
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationStateMonitoringTask observedRoutePlanningSession](self, "observedRoutePlanningSession"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "configuration"));
        v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "tracePlaybackPath"));

      }
      else
      {
        v21 = 0;
      }
      v31 = [NavigationSessionBuilder alloc];
      v32 = *(_OWORD *)&a4->guidanceType;
      v36[0] = *(_OWORD *)&a4->shouldSimulateLocations;
      v36[1] = v32;
      v36[2] = *(_OWORD *)&a4->isReconnecting;
      navigationModeContext = a4->navigationModeContext;
      v33 = -[NavigationSessionBuilder initWithRouteCollection:navigationDetailsOptions:mapServiceTraits:sessionInitiator:isResumingMultipointRoute:tracePlaybackPath:](v31, "initWithRouteCollection:navigationDetailsOptions:mapServiceTraits:sessionInitiator:isResumingMultipointRoute:tracePlaybackPath:", v12, v36, v13, a6, v7, v21);
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationSessionBuilder build](v33, "build"));

      v35 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationStateMonitoringTask platformController](self, "platformController"));
      objc_msgSend(v35, "pushSession:", v34);

    }
  }

}

- (void)endNavigationWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  char isKindOfClass;
  void *v10;
  void *v11;
  void (**v12)(_QWORD);
  id v13;
  NSObject *v14;
  const __CFString *v15;
  void *v16;
  id v17;
  NSObject *v18;
  int v19;
  const __CFString *v20;

  v4 = (void (**)(_QWORD))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationStateMonitoringTask navigationService](self, "navigationService"));
  if (objc_msgSend(v5, "isInNavigatingState"))
  {

LABEL_4:
    if (v4)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationStateMonitoringTask navigationCompletionBlocks](self, "navigationCompletionBlocks"));
      objc_sync_enter(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationStateMonitoringTask navigationCompletionBlocks](self, "navigationCompletionBlocks"));
      v12 = objc_retainBlock(v4);
      objc_msgSend(v11, "addObject:", v12);

      objc_sync_exit(v10);
    }
    v13 = sub_10036C3C4();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = CFSTR("with");
      if (!v4)
        v15 = CFSTR("without");
      v19 = 138412290;
      v20 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Ending navigation %@ a completion block", (uint8_t *)&v19, 0xCu);
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationStateMonitoringTask platformController](self, "platformController"));
    objc_msgSend(v16, "clearIfCurrentSessionIsKindOfClass:", objc_opt_class(NavigationSession));

    goto LABEL_11;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationStateMonitoringTask platformController](self, "platformController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentSession"));
  v8 = objc_opt_class(NavigationSession);
  isKindOfClass = objc_opt_isKindOfClass(v7, v8);

  if ((isKindOfClass & 1) != 0)
    goto LABEL_4;
  v17 = sub_10036C3C4();
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v19) = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "Cannot end navigation when navigation is not running", (uint8_t *)&v19, 2u);
  }

  if (v4)
    v4[2](v4);
LABEL_11:

}

- (id)currentRoutePlanningSessionConfiguration
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationStateMonitoringTask observedRoutePlanningSession](self, "observedRoutePlanningSession"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "configuration"));

  return v3;
}

- (BOOL)shouldStartNavigationAutoLaunchTimer
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationStateMonitoringTask currentRoutePlanningSessionConfiguration](self, "currentRoutePlanningSessionConfiguration"));
  v3 = objc_msgSend(v2, "shouldAutoLaunchNavigation");

  return v3;
}

- (void)startNavigationAutoLaunchTimer
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  void **v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  NavigationStateMonitoringTask *v16;
  id v17;
  uint8_t buf[4];
  double v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationStateMonitoringTask navigationAutoLaunchTimer](self, "navigationAutoLaunchTimer"));

  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationStateMonitoringTask currentRoutePlanningSessionConfiguration](self, "currentRoutePlanningSessionConfiguration"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "navigationAutoLaunchDelay"));
    objc_msgSend(v5, "doubleValue");
    v7 = v6;

    v8 = sub_10036C3C4();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v19 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Starting navigation auto launch timer with delay: %f", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    v10 = &_dispatch_main_q;
    v12 = _NSConcreteStackBlock;
    v13 = 3221225472;
    v14 = sub_10036CB4C;
    v15 = &unk_1011B0FF8;
    objc_copyWeak(&v17, (id *)buf);
    v16 = self;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[GCDTimer scheduledTimerWithTimeInterval:queue:block:](GCDTimer, "scheduledTimerWithTimeInterval:queue:block:", &_dispatch_main_q, &v12, v7));
    -[NavigationStateMonitoringTask setNavigationAutoLaunchTimer:](self, "setNavigationAutoLaunchTimer:", v11, v12, v13, v14, v15);

    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)buf);
  }
}

- (void)presentHandoffAlertForDestination:(id)a3
{
  id v3;
  NSObject *v4;
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
  id v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v24[5];
  id v25;
  uint8_t buf[16];

  v22 = a3;
  v3 = sub_10036C3C4();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Presenting NAD handoff alert", buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MapsExternalDevice sharedInstance](MapsExternalDevice, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mapsDisplayName"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Destination handoff alert title [phone]"), CFSTR("localized string not found"), 0));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v6));

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Destination handoff alert message [phone]"), CFSTR("localized string not found"), 0));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v6));

  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Unknown destination handoff alert title [phone]"), CFSTR("localized string not found"), 0));

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Unknown destination handoff alert message [phone]"), CFSTR("localized string not found"), 0));
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v9, v12, 1));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Cancel [destination handoff action to CarPlay car]"), CFSTR("localized string not found"), 0));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v15, 1, 0));

  objc_msgSend(v13, "addAction:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("Continue [destination handoff action to CarPlay car]"), CFSTR("localized string not found"), 0));
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10036D170;
  v24[3] = &unk_1011B0210;
  v24[4] = self;
  v25 = v22;
  v19 = v22;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v18, 0, v24));

  objc_msgSend(v13, "addAction:", v20);
  objc_msgSend(v13, "setPreferredAction:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationStateMonitoringTask chromeViewController](self, "chromeViewController"));
  objc_msgSend(v21, "_maps_topMostPresentViewController:animated:completion:", v13, 1, 0);

}

- (void)handoffDestinationToExternalDevice:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[16];

  v4 = a3;
  v5 = sub_10036C3C4();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Performing NAD handoff", buf, 2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MapsExternalDevice sharedInstance](MapsExternalDevice, "sharedInstance"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10036D260;
  v9[3] = &unk_1011B2EA8;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v7, "handoffDestination:completion:", v8, v9);

}

- (void)callNavigationCompletionBlocksIfNecessary
{
  void *v3;
  uint64_t v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;

  v14 = (id)objc_claimAutoreleasedReturnValue(-[NavigationStateMonitoringTask platformController](self, "platformController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "currentSession"));
  v4 = objc_opt_class(NavigationSession);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {

  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationStateMonitoringTask navigationService](self, "navigationService"));
    v6 = objc_msgSend(v5, "isInNavigatingState");

    if ((v6 & 1) == 0)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationStateMonitoringTask navigationCompletionBlocks](self, "navigationCompletionBlocks"));
      objc_sync_enter(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationStateMonitoringTask navigationCompletionBlocks](self, "navigationCompletionBlocks"));
      v9 = objc_msgSend(v8, "count");

      if (v9)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationStateMonitoringTask navigationCompletionBlocks](self, "navigationCompletionBlocks"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "allObjects"));

        v12 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationStateMonitoringTask navigationCompletionBlocks](self, "navigationCompletionBlocks"));
        objc_msgSend(v12, "removeAllObjects");

        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10036D50C;
        block[3] = &unk_1011AC860;
        v16 = v11;
        v13 = v11;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

      }
      objc_sync_exit(v7);

    }
  }
}

- (void)updateHikingMapConfiguration
{
  const char *label;
  const char *v4;
  BOOL v5;
  id droppedPinBlock;
  id v7;
  void *v8;
  _BOOL4 v9;
  id routePlanningHikingMapToken;
  void *v11;
  _BOOL4 v12;
  id navigationHikingMapToken;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  id v20;
  uint64_t v21;
  id v22;
  id v23;
  NSObject *v24;
  NavigationStateMonitoringTask *v25;
  id v26;
  NSObject *v27;
  void *v28;
  void *v29;
  char IsEnabled_HikingiOS;
  id v31;
  NSObject *v32;
  uint64_t v33;
  id v34;
  id v35;
  NSObject *v36;
  void *v37;
  id v38;
  NSObject *v39;
  NSObject *v40;
  id v41;
  uint64_t v42;
  void *j;
  void *v44;
  double v45;
  CLLocationDegrees v46;
  CLLocationDegrees v47;
  CLLocationCoordinate2D v48;
  id v49;
  NSObject *v50;
  void *v51;
  dispatch_block_t v52;
  id v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  unsigned int v59;
  id v60;
  NSObject *v61;
  id v62;
  NSObject *v63;
  void *v64;
  uint64_t v65;
  id v66;
  NSObject *v67;
  void *v68;
  id v69;
  NSObject *v70;
  void *v71;
  unsigned int v72;
  id v73;
  _BOOL4 v74;
  void *v75;
  void *v76;
  id v77;
  void *v78;
  id v79;
  uint64_t v80;
  void *i;
  void *v82;
  uint64_t v83;
  id v84;
  NSObject *v85;
  void *v86;
  id v87;
  NSObject *v88;
  void *v89;
  unsigned int v90;
  id v91;
  NSObject *v92;
  _BOOL4 v93;
  void *v94;
  void *v95;
  id v96;
  NSObject *v97;
  void *v98;
  id v99;
  void *v100;
  void *v101;
  uint64_t v102;
  id v103;
  id v104;
  NSObject *v105;
  void *v106;
  id v107;
  void *v108;
  void *v109;
  uint64_t v110;
  id v111;
  id v112;
  NSObject *v113;
  const char *v114;
  const char *v115;
  id v116;
  NSObject *v117;
  void *v118;
  id *v119;
  uint64_t v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  _QWORD *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  BOOL obj;
  id obja;
  NavigationStateMonitoringTask *val;
  _QWORD block[4];
  id v135;
  _QWORD *v136;
  _BYTE *v137;
  id v138;
  _QWORD v139[4];
  NSObject *v140;
  _BYTE *v141;
  id v142;
  CLLocationCoordinate2D v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  _QWORD v148[4];
  id v149;
  BOOL v150;
  id location;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  uint8_t v160[4];
  NavigationStateMonitoringTask *v161;
  __int16 v162;
  CLLocationDegrees latitude;
  __int16 v164;
  CLLocationDegrees longitude;
  _BYTE v166[128];
  _BYTE v167[128];
  uint8_t v168[128];
  _BYTE buf[24];
  int v170;
  __int16 v171;
  const char *v172;
  __int16 v173;
  const char *v174;
  __int16 v175;
  const char *v176;

  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v4 = dispatch_queue_get_label(0);
  val = self;
  if (label != v4)
  {
    v5 = !label || v4 == 0;
    if (v5 || strcmp(label, v4))
    {
      v112 = sub_1004318FC();
      v113 = objc_claimAutoreleasedReturnValue(v112);
      if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR))
      {
        v114 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v115 = dispatch_queue_get_label(0);
        *(_DWORD *)buf = 136316418;
        *(_QWORD *)&buf[4] = "-[NavigationStateMonitoringTask updateHikingMapConfiguration]";
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "NavigationStateMonitoringTask.m";
        *(_WORD *)&buf[22] = 1024;
        v170 = 383;
        v171 = 2080;
        v172 = "dispatch_get_main_queue()";
        v173 = 2080;
        v174 = v114;
        v175 = 2080;
        v176 = v115;
        _os_log_impl((void *)&_mh_execute_header, v113, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          buf,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v116 = sub_1004318FC();
        v117 = objc_claimAutoreleasedReturnValue(v116);
        if (os_log_type_enabled(v117, OS_LOG_TYPE_ERROR))
        {
          v118 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v118;
          _os_log_impl((void *)&_mh_execute_header, v117, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

        }
      }
    }
  }
  droppedPinBlock = self->_droppedPinBlock;
  if (droppedPinBlock)
  {
    dispatch_block_cancel(droppedPinBlock);
    v7 = self->_droppedPinBlock;
    self->_droppedPinBlock = 0;

  }
  if (self->_routePlanningHikingMapToken)
    obj = self->_navigationHikingMapToken != 0;
  else
    obj = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationStateMonitoringTask observedRoutePlanningSession](self, "observedRoutePlanningSession"));
  v9 = v8 == 0;

  if (v9)
  {
    routePlanningHikingMapToken = val->_routePlanningHikingMapToken;
    val->_routePlanningHikingMapToken = 0;

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationStateMonitoringTask observedNavigationSession](val, "observedNavigationSession"));
  v12 = v11 == 0;

  if (v12)
  {
    navigationHikingMapToken = val->_navigationHikingMapToken;
    val->_navigationHikingMapToken = 0;

  }
  v126 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v130 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationStateMonitoringTask observedRoutePlanningSession](val, "observedRoutePlanningSession"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v130, "currentRouteCollection"));
  v124 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "currentRoute"));

  v127 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v130, "resolvedWaypoints"));
  v123 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v127, "waypointsOrNull"));
  v128 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationStateMonitoringTask observedNavigationSession](val, "observedNavigationSession"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128, "currentRouteCollection"));
  v129 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "currentRoute"));

  v122 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v129, "anchorPoints"));
  v121 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v129, "waypoints"));
  if (v130)
  {
    v16 = sub_10036C3C4();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      *(_QWORD *)&buf[4] = val;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "[%{public}p] Updating hiking map configuration in route planning", buf, 0xCu);
    }

    if (!objc_msgSend(v127, "areAllValidWaypoints")
      || objc_msgSend(v130, "currentTransportType") != (id)2
      || (MapsFeature_IsEnabled_HikingiOS() & 1) == 0)
    {
      v23 = sub_10036C3C4();
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134349056;
        *(_QWORD *)&buf[4] = val;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "[%{public}p] Waypoints are not all valid or we are in an unsupported transport type; disabling topographic map",
          buf,
          0xCu);
      }

      v20 = val->_routePlanningHikingMapToken;
      val->_routePlanningHikingMapToken = 0;
      goto LABEL_44;
    }
    if (objc_msgSend(v124, "source") == (id)2)
    {
      v18 = sub_10036C3C4();
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134349056;
        *(_QWORD *)&buf[4] = val;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "[%{public}p] Found curated route; enabling topographic map",
          buf,
          0xCu);
      }

      v20 = (id)objc_claimAutoreleasedReturnValue(-[NavigationStateMonitoringTask chromeViewController](val, "chromeViewController"));
      v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "acquireHikingMapToken"));
      v22 = val->_routePlanningHikingMapToken;
      val->_routePlanningHikingMapToken = (id)v21;

      goto LABEL_44;
    }
    v158 = 0u;
    v159 = 0u;
    v156 = 0u;
    v157 = 0u;
    v20 = v123;
    v54 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v156, v168, 16);
    if (!v54)
      goto LABEL_44;
    v55 = *(_QWORD *)v157;
    v120 = 138412290;
LABEL_64:
    v56 = 0;
    while (1)
    {
      if (*(_QWORD *)v157 != v55)
        objc_enumerationMutation(v20);
      v57 = *(void **)(*((_QWORD *)&v156 + 1) + 8 * v56);
      v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null", v120));
      v59 = objc_msgSend(v57, "isEqual:", v58);

      if (v59)
        break;
      if (objc_msgSend(v57, "mapDisplayType") == 1)
      {
        v96 = sub_10036C3C4();
        v97 = objc_claimAutoreleasedReturnValue(v96);
        if (os_log_type_enabled(v97, OS_LOG_TYPE_INFO))
        {
          v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "name"));
          *(_DWORD *)buf = 134349314;
          *(_QWORD *)&buf[4] = val;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v98;
          _os_log_impl((void *)&_mh_execute_header, v97, OS_LOG_TYPE_INFO, "[%{public}p] Found waypoint with topographic map display type; enabling topographic map (%@)",
            buf,
            0x16u);

        }
        goto LABEL_131;
      }
      v65 = objc_opt_class(GEOComposedWaypointToRoute);
      if ((objc_opt_isKindOfClass(v57, v65) & 1) != 0)
      {
        v99 = sub_10036C3C4();
        v97 = objc_claimAutoreleasedReturnValue(v99);
        if (os_log_type_enabled(v97, OS_LOG_TYPE_INFO))
        {
          v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "name"));
          *(_DWORD *)buf = 134349314;
          *(_QWORD *)&buf[4] = val;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v100;
          _os_log_impl((void *)&_mh_execute_header, v97, OS_LOG_TYPE_INFO, "[%{public}p] Found waypoint to route; enabling topographic map (%@)",
            buf,
            0x16u);

        }
LABEL_131:

        v101 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationStateMonitoringTask chromeViewController](val, "chromeViewController"));
        v102 = objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "acquireHikingMapToken"));
        v103 = val->_routePlanningHikingMapToken;
        val->_routePlanningHikingMapToken = (id)v102;

        goto LABEL_44;
      }
      if (objc_msgSend(v57, "isCurrentLocation"))
      {
        v66 = sub_10036C3C4();
        v67 = objc_claimAutoreleasedReturnValue(v66);
        if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
        {
          v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "name"));
          *(_DWORD *)buf = 134349314;
          *(_QWORD *)&buf[4] = val;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v68;
          _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_INFO, "[%{public}p] Found current location waypoint: %@", buf, 0x16u);

        }
        if (!GEOConfigGetBOOL(MapsConfig_HikingTopographicMapCheckCurrentLocationWaypoint, off_1014B5548))
          goto LABEL_94;
      }
      else if (objc_msgSend(v57, "isLocationWaypointType"))
      {
        v69 = sub_10036C3C4();
        v70 = objc_claimAutoreleasedReturnValue(v69);
        if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
        {
          v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "name"));
          *(_DWORD *)buf = 134349314;
          *(_QWORD *)&buf[4] = val;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v71;
          _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_INFO, "[%{public}p] Found location waypoint: %@", buf, 0x16u);

        }
        if (!GEOConfigGetBOOL(MapsConfig_HikingTopographicMapCheckDroppedPinWaypoint, off_1014B5558))
          goto LABEL_94;
      }
      else
      {
        v72 = objc_msgSend(v57, "isAddressWaypointType");
        v73 = sub_10036C3C4();
        v63 = objc_claimAutoreleasedReturnValue(v73);
        v74 = os_log_type_enabled(v63, OS_LOG_TYPE_INFO);
        if (!v72)
        {
          if (v74)
          {
            v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "name"));
            *(_DWORD *)buf = 134349314;
            *(_QWORD *)&buf[4] = val;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v76;
            _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_INFO, "[%{public}p] Found other waypoint: %@", buf, 0x16u);

          }
LABEL_93:

          goto LABEL_94;
        }
        if (v74)
        {
          v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "name"));
          *(_DWORD *)buf = 134349314;
          *(_QWORD *)&buf[4] = val;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v75;
          _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_INFO, "[%{public}p] Found address waypoint: %@", buf, 0x16u);

        }
        if (!GEOConfigGetBOOL(MapsConfig_HikingTopographicMapCheckAddressWaypoint, off_1014B5568))
          goto LABEL_94;
      }
      objc_msgSend(v126, "addObject:", v57);
LABEL_94:
      if (v54 == (id)++v56)
      {
        v54 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v156, v168, 16);
        if (v54)
          goto LABEL_64;
        goto LABEL_44;
      }
    }
    v60 = sub_1004318FC();
    v61 = objc_claimAutoreleasedReturnValue(v60);
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "-[NavigationStateMonitoringTask updateHikingMapConfiguration]";
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "NavigationStateMonitoringTask.m";
      *(_WORD *)&buf[22] = 1024;
      v170 = 418;
      _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
    }

    if (!sub_100A70734())
      goto LABEL_94;
    v62 = sub_1004318FC();
    v63 = objc_claimAutoreleasedReturnValue(v62);
    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
    {
      v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
      *(_DWORD *)buf = v120;
      *(_QWORD *)&buf[4] = v64;
      _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

    }
    goto LABEL_93;
  }
  v25 = val;
  if (!v128)
    goto LABEL_45;
  v26 = sub_10036C3C4();
  v27 = objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    *(_QWORD *)&buf[4] = val;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "[%{public}p] Updating hiking map configuration in navigation", buf, 0xCu);
  }

  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128, "currentRouteCollection"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "currentRoute"));
  if (!v29)
    goto LABEL_40;
  if (objc_msgSend(v128, "currentTransportType") != (id)2)
  {

LABEL_40:
    goto LABEL_41;
  }
  IsEnabled_HikingiOS = MapsFeature_IsEnabled_HikingiOS();

  if ((IsEnabled_HikingiOS & 1) == 0)
  {
LABEL_41:
    v35 = sub_10036C3C4();
    v36 = objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      *(_QWORD *)&buf[4] = val;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "[%{public}p] We have no route or we are in an unsupported transport type; disabling topographic map",
        buf,
        0xCu);
    }

    v20 = val->_navigationHikingMapToken;
    val->_navigationHikingMapToken = 0;
    goto LABEL_44;
  }
  if (objc_msgSend(v129, "source") == (id)2)
  {
    v31 = sub_10036C3C4();
    v32 = objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      *(_QWORD *)&buf[4] = val;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "[%{public}p] Found curated route; enabling topographic map",
        buf,
        0xCu);
    }

    v20 = (id)objc_claimAutoreleasedReturnValue(-[NavigationStateMonitoringTask chromeViewController](val, "chromeViewController"));
    v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "acquireHikingMapToken"));
    v34 = val->_navigationHikingMapToken;
    val->_navigationHikingMapToken = (id)v33;

    goto LABEL_44;
  }
  v154 = 0u;
  v155 = 0u;
  v152 = 0u;
  v153 = 0u;
  v77 = objc_msgSend(v122, "count");
  v78 = v122;
  if (!v77)
    v78 = v121;
  v20 = v78;
  v79 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v152, v167, 16);
  if (v79)
  {
    v80 = *(_QWORD *)v153;
    do
    {
      for (i = 0; i != v79; i = (char *)i + 1)
      {
        if (*(_QWORD *)v153 != v80)
          objc_enumerationMutation(v20);
        v82 = *(void **)(*((_QWORD *)&v152 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v82, "mapDisplayType") == 1)
        {
          v104 = sub_10036C3C4();
          v105 = objc_claimAutoreleasedReturnValue(v104);
          if (os_log_type_enabled(v105, OS_LOG_TYPE_INFO))
          {
            v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "name"));
            *(_DWORD *)buf = 134349314;
            *(_QWORD *)&buf[4] = val;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v106;
            _os_log_impl((void *)&_mh_execute_header, v105, OS_LOG_TYPE_INFO, "[%{public}p] Found waypoint with topographic map display type; enabling topographic map (%@)",
              buf,
              0x16u);

          }
          goto LABEL_137;
        }
        v83 = objc_opt_class(GEOComposedWaypointToRoute);
        if ((objc_opt_isKindOfClass(v82, v83) & 1) != 0)
        {
          v107 = sub_10036C3C4();
          v105 = objc_claimAutoreleasedReturnValue(v107);
          if (os_log_type_enabled(v105, OS_LOG_TYPE_INFO))
          {
            v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "name"));
            *(_DWORD *)buf = 134349314;
            *(_QWORD *)&buf[4] = val;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v108;
            _os_log_impl((void *)&_mh_execute_header, v105, OS_LOG_TYPE_INFO, "[%{public}p] Found waypoint to route; enabling topographic map (%@)",
              buf,
              0x16u);

          }
LABEL_137:

          v109 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationStateMonitoringTask chromeViewController](val, "chromeViewController"));
          v110 = objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "acquireHikingMapToken"));
          v111 = val->_navigationHikingMapToken;
          val->_navigationHikingMapToken = (id)v110;

          goto LABEL_44;
        }
        if (objc_msgSend(v82, "isCurrentLocation"))
        {
          v84 = sub_10036C3C4();
          v85 = objc_claimAutoreleasedReturnValue(v84);
          if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
          {
            v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "name"));
            *(_DWORD *)buf = 134349314;
            *(_QWORD *)&buf[4] = val;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v86;
            _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_INFO, "[%{public}p] Found current location waypoint: %@", buf, 0x16u);

          }
          if (GEOConfigGetBOOL(MapsConfig_HikingTopographicMapCheckCurrentLocationWaypoint, off_1014B5548))goto LABEL_120;
        }
        else if (objc_msgSend(v82, "isLocationWaypointType"))
        {
          v87 = sub_10036C3C4();
          v88 = objc_claimAutoreleasedReturnValue(v87);
          if (os_log_type_enabled(v88, OS_LOG_TYPE_INFO))
          {
            v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "name"));
            *(_DWORD *)buf = 134349314;
            *(_QWORD *)&buf[4] = val;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v89;
            _os_log_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_INFO, "[%{public}p] Found location waypoint: %@", buf, 0x16u);

          }
          if (GEOConfigGetBOOL(MapsConfig_HikingTopographicMapCheckDroppedPinWaypoint, off_1014B5558))
            goto LABEL_120;
        }
        else
        {
          v90 = objc_msgSend(v82, "isAddressWaypointType");
          v91 = sub_10036C3C4();
          v92 = objc_claimAutoreleasedReturnValue(v91);
          v93 = os_log_type_enabled(v92, OS_LOG_TYPE_INFO);
          if (v90)
          {
            if (v93)
            {
              v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "name"));
              *(_DWORD *)buf = 134349314;
              *(_QWORD *)&buf[4] = val;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v94;
              _os_log_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_INFO, "[%{public}p] Found address waypoint: %@", buf, 0x16u);

            }
            if (GEOConfigGetBOOL(MapsConfig_HikingTopographicMapCheckAddressWaypoint, off_1014B5568))
            {
LABEL_120:
              objc_msgSend(v126, "addObject:", v82);
              continue;
            }
          }
          else
          {
            if (v93)
            {
              v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "name"));
              *(_DWORD *)buf = 134349314;
              *(_QWORD *)&buf[4] = val;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v95;
              _os_log_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_INFO, "[%{public}p] Found other waypoint: %@", buf, 0x16u);

            }
          }
        }
      }
      v79 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v152, v167, 16);
    }
    while (v79);
  }
LABEL_44:

  v25 = val;
LABEL_45:
  objc_initWeak(&location, v25);
  v148[0] = _NSConcreteStackBlock;
  v148[1] = 3221225472;
  v148[2] = sub_10036EAC8;
  v148[3] = &unk_1011AD388;
  v119 = &v149;
  objc_copyWeak(&v149, &location);
  v150 = obj;
  v125 = objc_retainBlock(v148);
  v37 = v125;
  if (!objc_msgSend(v126, "count") || val->_routePlanningHikingMapToken || val->_navigationHikingMapToken)
  {
    ((void (*)(_QWORD *))v125[2])(v125);
  }
  else
  {
    v38 = sub_10036C3C4();
    v39 = objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      *(_QWORD *)&buf[4] = val;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "[%{public}p] Checking all location waypoints for hiking contextual regions", buf, 0xCu);
    }

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    LOBYTE(v170) = 0;
    v40 = dispatch_group_create();
    v144 = 0u;
    v145 = 0u;
    v146 = 0u;
    v147 = 0u;
    obja = v126;
    v41 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v144, v166, 16, &v149);
    if (v41)
    {
      v42 = *(_QWORD *)v145;
      do
      {
        for (j = 0; j != v41; j = (char *)j + 1)
        {
          if (*(_QWORD *)v145 != v42)
            objc_enumerationMutation(obja);
          v44 = *(void **)(*((_QWORD *)&v144 + 1) + 8 * (_QWORD)j);
          dispatch_group_enter(v40);
          objc_msgSend(v44, "coordinate");
          v46 = v45;
          objc_msgSend(v44, "coordinate");
          v48 = CLLocationCoordinate2DMake(v46, v47);
          v49 = sub_10036C3C4();
          v50 = objc_claimAutoreleasedReturnValue(v49);
          if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v160 = 134349569;
            v161 = val;
            v162 = 2049;
            latitude = v48.latitude;
            v164 = 2049;
            longitude = v48.longitude;
            _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_INFO, "[%{public}p] Checking location %{private}f, %{private}f", v160, 0x20u);
          }

          v51 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationStateMonitoringTask chromeViewController](val, "chromeViewController"));
          v139[0] = _NSConcreteStackBlock;
          v139[1] = 3221225472;
          v139[2] = sub_10036EB34;
          v139[3] = &unk_1011B2ED0;
          objc_copyWeak(&v142, &location);
          v143 = v48;
          v141 = buf;
          v140 = v40;
          objc_msgSend(v51, "checkIfCoordinate:isInHikingContextualRegionWithCompletionHandler:", v139, v48.latitude, v48.longitude);

          objc_destroyWeak(&v142);
        }
        v41 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v144, v166, 16);
      }
      while (v41);
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10036EC30;
    block[3] = &unk_1011B2EF8;
    objc_copyWeak(&v138, &location);
    v137 = buf;
    v135 = v130;
    v136 = v125;
    v52 = dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, block);
    v53 = val->_droppedPinBlock;
    val->_droppedPinBlock = v52;

    dispatch_group_notify(v40, (dispatch_queue_t)&_dispatch_main_q, val->_droppedPinBlock);
    objc_destroyWeak(&v138);

    _Block_object_dispose(buf, 8);
    v37 = v125;
  }

  objc_destroyWeak(v119);
  objc_destroyWeak(&location);

}

- (void)platformController:(id)a3 willChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5
{
  uint64_t v6;
  char isKindOfClass;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id navigationModernMapToken;
  id v13;

  v13 = a5;
  v6 = objc_opt_class(NavigationSession);
  isKindOfClass = objc_opt_isKindOfClass(v13, v6);
  v8 = v13;
  if ((isKindOfClass & 1) != 0)
  {
    v9 = objc_msgSend(v13, "currentTransportType");
    if ((v9 == (id)5 || v9 == (id)2) && !self->_navigationModernMapToken)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationStateMonitoringTask iosBasedChromeViewController](self, "iosBasedChromeViewController"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "acquireModernMapTokenForReason:", 0));
      navigationModernMapToken = self->_navigationModernMapToken;
      self->_navigationModernMapToken = v11;

    }
    -[NavigationStateMonitoringTask updateHikingMapConfiguration](self, "updateHikingMapConfiguration");
    v8 = v13;
  }

}

- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5
{
  id v7;
  uint64_t v8;
  id routePlanningModernMapToken;
  id routePlanningHikingMapToken;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  id navigationModernMapToken;
  id navigationHikingMapToken;
  id v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;

  v22 = a4;
  v7 = a5;
  v8 = objc_opt_class(RoutePlanningSession);
  if ((objc_opt_isKindOfClass(v22, v8) & 1) != 0)
  {
    -[NavigationStateMonitoringTask cancelNavigationAutoLaunchIfNeccessary](self, "cancelNavigationAutoLaunchIfNeccessary");
    routePlanningModernMapToken = self->_routePlanningModernMapToken;
    self->_routePlanningModernMapToken = 0;

    routePlanningHikingMapToken = self->_routePlanningHikingMapToken;
    self->_routePlanningHikingMapToken = 0;

  }
  v11 = v7;
  v12 = objc_opt_class(RoutePlanningSession);
  if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
    v13 = v11;
  else
    v13 = 0;
  v14 = v13;

  -[NavigationStateMonitoringTask setObservedRoutePlanningSession:](self, "setObservedRoutePlanningSession:", v14);
  v15 = objc_opt_class(NavigationSession);
  if ((objc_opt_isKindOfClass(v22, v15) & 1) != 0)
  {
    -[NavigationStateMonitoringTask callNavigationCompletionBlocksIfNecessary](self, "callNavigationCompletionBlocksIfNecessary");
    navigationModernMapToken = self->_navigationModernMapToken;
    self->_navigationModernMapToken = 0;

    navigationHikingMapToken = self->_navigationHikingMapToken;
    self->_navigationHikingMapToken = 0;

  }
  v18 = v11;
  v19 = objc_opt_class(NavigationSession);
  if ((objc_opt_isKindOfClass(v18, v19) & 1) != 0)
    v20 = v18;
  else
    v20 = 0;
  v21 = v20;

  -[NavigationStateMonitoringTask setObservedNavigationSession:](self, "setObservedNavigationSession:", v21);
}

- (void)setObservedRoutePlanningSession:(id)a3
{
  RoutePlanningSession *v5;
  RoutePlanningSession *observedRoutePlanningSession;
  RoutePlanningSession *v7;
  id v8;
  void *v9;
  void *v10;
  id routePlanningModernMapToken;
  RoutePlanningSession *v12;

  v5 = (RoutePlanningSession *)a3;
  observedRoutePlanningSession = self->_observedRoutePlanningSession;
  if (observedRoutePlanningSession != v5)
  {
    v12 = v5;
    -[RoutePlanningSession removeObserver:](observedRoutePlanningSession, "removeObserver:", self);
    -[RoutePlanningSession setNavigationStateMonitoringTask:](self->_observedRoutePlanningSession, "setNavigationStateMonitoringTask:", 0);
    objc_storeStrong((id *)&self->_observedRoutePlanningSession, a3);
    -[RoutePlanningSession addObserver:](self->_observedRoutePlanningSession, "addObserver:", self);
    -[RoutePlanningSession setNavigationStateMonitoringTask:](self->_observedRoutePlanningSession, "setNavigationStateMonitoringTask:", self);
    v7 = self->_observedRoutePlanningSession;
    if (v7)
    {
      if (!self->_routePlanningModernMapToken)
      {
        v8 = -[RoutePlanningSession currentTransportType](v7, "currentTransportType");
        if (v8 == (id)5 || v8 == (id)2)
        {
          v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationStateMonitoringTask iosBasedChromeViewController](self, "iosBasedChromeViewController"));
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "acquireModernMapTokenForReason:", 0));
          routePlanningModernMapToken = self->_routePlanningModernMapToken;
          self->_routePlanningModernMapToken = v10;

        }
      }
    }
    -[NavigationStateMonitoringTask updateHikingMapConfiguration](self, "updateHikingMapConfiguration");
    v5 = v12;
  }

}

- (void)setObservedNavigationSession:(id)a3
{
  NavigationSession *v5;
  NavigationSession *observedNavigationSession;
  NavigationSession *v7;

  v5 = (NavigationSession *)a3;
  observedNavigationSession = self->_observedNavigationSession;
  if (observedNavigationSession != v5)
  {
    v7 = v5;
    -[NavigationSession removeObserver:](observedNavigationSession, "removeObserver:", self);
    objc_storeStrong((id *)&self->_observedNavigationSession, a3);
    -[NavigationSession addObserver:](self->_observedNavigationSession, "addObserver:", self);
    -[NavigationStateMonitoringTask updateHikingMapConfiguration](self, "updateHikingMapConfiguration");
    v5 = v7;
  }

}

- (void)routePlanningSession:(id)a3 didChangeCurrentTransportType:(int64_t)a4 userInitiated:(BOOL)a5
{
  id v7;
  void *v8;
  id routePlanningModernMapToken;
  id v10;

  v10 = a3;
  if (a4 == 5 || a4 == 2)
  {
    if (!self->_routePlanningModernMapToken)
    {
      v7 = (id)objc_claimAutoreleasedReturnValue(-[NavigationStateMonitoringTask iosBasedChromeViewController](self, "iosBasedChromeViewController"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "acquireModernMapTokenForReason:", 0));
      routePlanningModernMapToken = self->_routePlanningModernMapToken;
      self->_routePlanningModernMapToken = v8;

LABEL_7:
    }
  }
  else
  {
    v7 = self->_routePlanningModernMapToken;
    if (v7)
    {
      self->_routePlanningModernMapToken = 0;
      goto LABEL_7;
    }
  }
  -[NavigationStateMonitoringTask updateHikingMapConfiguration](self, "updateHikingMapConfiguration");

}

- (void)routePlanningSession:(id)a3 didUpdateRouteCollectionResult:(id)a4 forTransportType:(int64_t)a5
{
  id v8;

  v8 = a4;
  if (objc_msgSend(a3, "currentTransportType") == (id)a5
    && objc_msgSend(v8, "isSuccess")
    && -[NavigationStateMonitoringTask shouldStartNavigationAutoLaunchTimer](self, "shouldStartNavigationAutoLaunchTimer"))
  {
    -[NavigationStateMonitoringTask startNavigationAutoLaunchTimer](self, "startNavigationAutoLaunchTimer");
  }

}

- (void)navigationService:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  char v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  RouteCollection *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  char isKindOfClass;
  id v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  _BYTE v38[56];
  uint8_t buf[16];

  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  if (objc_msgSend(v9, "userInterfaceIdiom") || (MNNavigationServiceStateChangedToNavigating(a4, a5, v10) & 1) == 0)
  {
LABEL_16:

LABEL_17:
    if (MNNavigationServiceStateChangedFromNavigatingToStopped(a4, a5))
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationStateMonitoringTask platformController](self, "platformController"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "currentSession"));
      v31 = objc_opt_class(NavigationSession);
      isKindOfClass = objc_opt_isKindOfClass(v30, v31);

      if ((isKindOfClass & 1) != 0)
      {
        v33 = sub_10036C3C4();
        v34 = objc_claimAutoreleasedReturnValue(v33);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "Detected MNNavigationService ended navigation with a currently active NavigationSession; clearing session stack",
            buf,
            2u);
        }

        v35 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationStateMonitoringTask platformController](self, "platformController"));
        objc_msgSend(v35, "clearSessions");

      }
      else
      {
        -[NavigationStateMonitoringTask callNavigationCompletionBlocksIfNecessary](self, "callNavigationCompletionBlocksIfNecessary");
      }
    }
    goto LABEL_23;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationStateMonitoringTask platformController](self, "platformController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "currentSession"));
  v13 = objc_opt_class(NavigationSession);
  v14 = objc_opt_isKindOfClass(v12, v13);

  if ((v14 & 1) != 0)
    goto LABEL_17;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "route"));
  v15 = sub_10036C3C4();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  v17 = v16;
  if (v9)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Detected MNNavigationService started navigation without a currently active NavigationSession; pushing new NavigationSession",
        buf,
        2u);
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", v9));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "alternateRoutes"));

    if (v19)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "alternateRoutes"));
      v21 = objc_msgSend(v18, "arrayByAddingObjectsFromArray:", v20);

    }
    v22 = -[RouteCollection initWithRoutes:currentRouteIndex:]([RouteCollection alloc], "initWithRoutes:currentRouteIndex:", v18, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationStateMonitoringTask observedRoutePlanningSession](self, "observedRoutePlanningSession"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "configuration"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "traits"));
    v26 = v25;
    v37 = v18;
    if (v25)
    {
      v27 = v25;
    }
    else
    {
      v36 = v9;
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationStateMonitoringTask chromeViewController](self, "chromeViewController"));
      v27 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "currentTraits"));

      v9 = v36;
    }

    +[StartNavigationDetailsBuilder defaultNavigationDetailsOptions](StartNavigationDetailsBuilder, "defaultNavigationDetailsOptions");
    -[NavigationStateMonitoringTask beginNavigationWithRouteCollection:navigationDetailsOptions:mapServiceTraits:sessionInitiator:isResumingMultipointRoute:](self, "beginNavigationWithRouteCollection:navigationDetailsOptions:mapServiceTraits:sessionInitiator:isResumingMultipointRoute:", v22, v38, v27, 3, 0);

    goto LABEL_16;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_FAULT, "Navigation started without an active nav session but the service didn't have a route.  Telling navd to exit navigation state", buf, 2u);
  }

  objc_msgSend(v8, "stopNavigationWithReason:", 1);
LABEL_23:

}

- (void)navigationService:(id)a3 didSwitchToNewTransportType:(int)a4 newRoute:(id)a5 traffic:(id)a6
{
  id v7;
  void *v8;
  id navigationModernMapToken;
  id v10;

  v10 = a5;
  if ((objc_msgSend(v10, "transportType") & 0xFFFFFFFE) == 2 && !self->_navigationModernMapToken)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[NavigationStateMonitoringTask iosBasedChromeViewController](self, "iosBasedChromeViewController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "acquireModernMapTokenForReason:", 0));
    navigationModernMapToken = self->_navigationModernMapToken;
    self->_navigationModernMapToken = v8;

    goto LABEL_7;
  }
  if ((objc_msgSend(v10, "transportType") & 0xFFFFFFFE) != 2)
  {
    v7 = self->_navigationModernMapToken;
    if (v7)
    {
      self->_navigationModernMapToken = 0;
LABEL_7:

    }
  }
  -[NavigationStateMonitoringTask updateHikingMapConfiguration](self, "updateHikingMapConfiguration");

}

- (void)navigationService:(id)a3 didArriveAtWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5
{
  void *v6;
  void *v7;
  unsigned int v8;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationStateMonitoringTask chromeViewController](self, "chromeViewController", a3, a4, a5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "traitCollection"));
  v8 = objc_msgSend(v7, "isLuminanceReduced");

  if (v8)
    -[NavigationStateMonitoringTask _checkAnimationsForAndromeda:](self, "_checkAnimationsForAndromeda:", 0);
}

- (void)didUpdateMitigationNamed:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  NavigationStateMonitoringTask *v7;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10036F6A8;
  v5[3] = &unk_1011AC8B0;
  v6 = a3;
  v7 = self;
  v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

}

- (void)_checkModernMapMitigation
{
  void *v3;
  unsigned int v4;
  id thermalPressureMapToken;
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  uint8_t v13[16];
  uint8_t buf[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MapsThermalPressureController sharedController](MapsThermalPressureController, "sharedController"));
  v4 = objc_msgSend(v3, "shouldActivateMitigationNamed:", CFSTR("NavigationForceModernMapMitigation"));

  thermalPressureMapToken = self->_thermalPressureMapToken;
  if (v4)
  {
    if (thermalPressureMapToken)
      return;
    v6 = sub_10036C3C4();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Acquiring thermal pressure map mode token", buf, 2u);
    }

    v8 = (id)objc_claimAutoreleasedReturnValue(-[NavigationStateMonitoringTask iosBasedChromeViewController](self, "iosBasedChromeViewController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "acquireModernMapTokenForReason:", 1));
    v10 = self->_thermalPressureMapToken;
    self->_thermalPressureMapToken = v9;

  }
  else
  {
    if (!thermalPressureMapToken)
      return;
    v11 = sub_10036C3C4();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Releasing thermal pressure map mode token", v13, 2u);
    }

    v8 = self->_thermalPressureMapToken;
    self->_thermalPressureMapToken = 0;
  }

}

- (void)_checkAnimationsMitigation
{
  void *v3;
  unsigned int v4;
  id thermalPressureAnimationSuppressionToken;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  uint8_t v12[16];
  uint8_t buf[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MapsThermalPressureController sharedController](MapsThermalPressureController, "sharedController"));
  v4 = objc_msgSend(v3, "shouldActivateMitigationNamed:", CFSTR("NavigationSuppressAllAnimations"));

  thermalPressureAnimationSuppressionToken = self->_thermalPressureAnimationSuppressionToken;
  if (v4)
  {
    if (thermalPressureAnimationSuppressionToken)
      return;
    v6 = sub_10036C3C4();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Acquiring thermal pressure animation suppression token", buf, 2u);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MapsAppAnimationSuppressor acquireAnimationSuppressionTokenForReason:](MapsAppAnimationSuppressor, "acquireAnimationSuppressionTokenForReason:", CFSTR("Thermal Pressure")));
  }
  else
  {
    if (!thermalPressureAnimationSuppressionToken)
      return;
    v9 = sub_10036C3C4();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Releasing thermal pressure animation suppression token", v12, 2u);
    }

    v8 = 0;
  }
  v11 = self->_thermalPressureAnimationSuppressionToken;
  self->_thermalPressureAnimationSuppressionToken = v8;

}

- (void)_checkETAUpdatesMitigation
{
  void *v3;
  unsigned int v4;
  MNNavigationService *navigationService;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MapsThermalPressureController sharedController](MapsThermalPressureController, "sharedController"));
  v4 = objc_msgSend(v3, "shouldActivateMitigationNamed:", CFSTR("NavigationSuppressETAUpdates"));

  navigationService = self->_navigationService;
  if (v4)
    -[MNNavigationService disableNavigationCapability:reason:](navigationService, "disableNavigationCapability:reason:", 1, 1);
  else
    -[MNNavigationService enableNavigationCapability:reason:](navigationService, "enableNavigationCapability:reason:", 1, 1);
}

- (void)_checkMapViewMitigation
{
  void *v3;
  unsigned int v4;
  id thermalPressureChromeDeactivationToken;
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  uint8_t v13[16];
  uint8_t buf[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MapsThermalPressureController sharedController](MapsThermalPressureController, "sharedController"));
  v4 = objc_msgSend(v3, "shouldActivateMitigationNamed:", CFSTR("NavigationThermalMitigationForceMapInactive"));

  thermalPressureChromeDeactivationToken = self->_thermalPressureChromeDeactivationToken;
  if (v4)
  {
    if (thermalPressureChromeDeactivationToken)
      return;
    v6 = sub_10036C3C4();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Acquiring thermal pressure chrome deactivation token", buf, 2u);
    }

    v8 = (id)objc_claimAutoreleasedReturnValue(-[NavigationStateMonitoringTask iosBasedChromeViewController](self, "iosBasedChromeViewController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "acquireChromeDeactivationTokenForReason:", CFSTR("thermal")));
    v10 = self->_thermalPressureChromeDeactivationToken;
    self->_thermalPressureChromeDeactivationToken = v9;

  }
  else
  {
    if (!thermalPressureChromeDeactivationToken)
      return;
    v11 = sub_10036C3C4();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Releasing thermal pressure chrome deactivation token", v13, 2u);
    }

    v8 = self->_thermalPressureChromeDeactivationToken;
    self->_thermalPressureChromeDeactivationToken = 0;
  }

}

- (BOOL)_shouldSuppressAnimationsForAndromeda
{
  void *v3;
  unsigned __int8 v4;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  int v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationStateMonitoringTask iosChromeViewController](self, "iosChromeViewController"));
  v4 = objc_msgSend(v3, "isTransitioningToLockScreen");

  if ((v4 & 1) != 0)
    return 1;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationStateMonitoringTask chromeViewController](self, "chromeViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "traitCollection"));
  v8 = objc_msgSend(v7, "isLuminanceReduced");

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationStateMonitoringTask navigationService](self, "navigationService"));
  if (objc_msgSend(v9, "navigationState") == 6)
  {
    v10 = 1;
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationStateMonitoringTask navigationService](self, "navigationService"));
    v10 = objc_msgSend(v11, "navigationState") == 7;

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationStateMonitoringTask navigationService](self, "navigationService"));
  v13 = objc_msgSend(v12, "state");
  v15 = MNNavigationServiceStateIsNavigating(v13, v14) & v10;

  return v8 & (v15 ^ 1);
}

- (void)_checkAnimationsForAndromeda:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  unsigned int v10;
  id v11;
  NSObject *v12;
  void *v13;
  id andromedaAnimationSuppressionToken;
  id v15;
  NSObject *v16;
  uint8_t v17[16];
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("kBacklightLuminanceInitialSetupDoneKey")));
    v8 = v7 != 0;

  }
  else
  {
    v8 = 0;
  }
  if ((-[NavigationStateMonitoringTask _shouldSuppressAnimationsForAndromeda](self, "_shouldSuppressAnimationsForAndromeda")|| v8)&& (v9 = (void *)objc_claimAutoreleasedReturnValue(+[BLSBacklight sharedBacklight](BLSBacklight, "sharedBacklight")), v10 = objc_msgSend(v9, "isAlwaysOnEnabled"), v9, v10))
  {
    if (!self->_andromedaAnimationSuppressionToken)
    {
      v11 = sub_10036C3C4();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Acquiring animation suppression token", buf, 2u);
      }

      v13 = (void *)objc_claimAutoreleasedReturnValue(+[MapsAppAnimationSuppressor acquireAnimationSuppressionTokenForReason:](MapsAppAnimationSuppressor, "acquireAnimationSuppressionTokenForReason:", CFSTR("Backlight Luminance")));
      andromedaAnimationSuppressionToken = self->_andromedaAnimationSuppressionToken;
      self->_andromedaAnimationSuppressionToken = v13;
LABEL_15:

    }
  }
  else if (self->_andromedaAnimationSuppressionToken)
  {
    v15 = sub_10036C3C4();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Releasing animation suppression token", v17, 2u);
    }

    andromedaAnimationSuppressionToken = self->_andromedaAnimationSuppressionToken;
    self->_andromedaAnimationSuppressionToken = 0;
    goto LABEL_15;
  }

}

- (void)platformControllerDidChangeChromeViewControllerNotification:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[NavigationStateMonitoringTask platformController](self, "platformController", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "chromeViewController"));
  -[NavigationStateMonitoringTask setChromeViewController:](self, "setChromeViewController:", v4);

}

- (PlatformController)platformController
{
  return (PlatformController *)objc_loadWeakRetained((id *)&self->_platformController);
}

- (void)setPlatformController:(id)a3
{
  objc_storeWeak((id *)&self->_platformController, a3);
}

- (MNNavigationService)navigationService
{
  return self->_navigationService;
}

- (void)setNavigationService:(id)a3
{
  objc_storeStrong((id *)&self->_navigationService, a3);
}

- (ChromeViewController)chromeViewController
{
  return (ChromeViewController *)objc_loadWeakRetained((id *)&self->_chromeViewController);
}

- (RoutePlanningSession)observedRoutePlanningSession
{
  return self->_observedRoutePlanningSession;
}

- (NavigationSession)observedNavigationSession
{
  return self->_observedNavigationSession;
}

- (GCDTimer)navigationAutoLaunchTimer
{
  return self->_navigationAutoLaunchTimer;
}

- (void)setNavigationAutoLaunchTimer:(id)a3
{
  objc_storeStrong((id *)&self->_navigationAutoLaunchTimer, a3);
}

- (NSHashTable)navigationCompletionBlocks
{
  return self->_navigationCompletionBlocks;
}

- (void)setNavigationCompletionBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_navigationCompletionBlocks, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_navigationAutoLaunchTimer, 0);
  objc_storeStrong((id *)&self->_observedNavigationSession, 0);
  objc_storeStrong((id *)&self->_observedRoutePlanningSession, 0);
  objc_destroyWeak((id *)&self->_chromeViewController);
  objc_storeStrong((id *)&self->_navigationService, 0);
  objc_destroyWeak((id *)&self->_platformController);
  objc_storeStrong(&self->_droppedPinBlock, 0);
  objc_storeStrong(&self->_andromedaAnimationSuppressionToken, 0);
  objc_storeStrong(&self->_thermalPressureAnimationSuppressionToken, 0);
  objc_storeStrong(&self->_thermalPressureChromeDeactivationToken, 0);
  objc_storeStrong(&self->_thermalPressureMapToken, 0);
  objc_storeStrong(&self->_navigationHikingMapToken, 0);
  objc_storeStrong(&self->_routePlanningHikingMapToken, 0);
  objc_storeStrong(&self->_navigationModernMapToken, 0);
  objc_storeStrong(&self->_routePlanningModernMapToken, 0);
}

@end
