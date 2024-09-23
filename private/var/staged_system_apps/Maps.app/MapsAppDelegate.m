@implementation MapsAppDelegate

- (void)createSubmissionManagerIfNeeded
{
  FeedbackSubmissionManager *v3;
  FeedbackSubmissionManager *submissionManager;

  if (!self->_submissionManager)
  {
    v3 = objc_alloc_init(FeedbackSubmissionManager);
    submissionManager = self->_submissionManager;
    self->_submissionManager = v3;

  }
}

- (FeedbackSubmissionManager)submissionManager
{
  -[MapsAppDelegate createSubmissionManagerIfNeeded](self, "createSubmissionManagerIfNeeded");
  return self->_submissionManager;
}

+ (BOOL)mapsIsLaunchedForTesting
{
  id v2;
  char v3;

  v2 = a1;
  objc_sync_enter(v2);
  v3 = byte_1014D2910;
  objc_sync_exit(v2);

  return v3;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v6;
  void *v7;
  objc_super v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  objc_msgSend(UIApp, "setDelegate:", 0);
  -[MapsAppDelegate _releaseSecureAppAssertion](self, "_releaseSecureAppAssertion");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[IPCServer sharedServer](IPCServer, "sharedServer"));
  objc_msgSend(v4, "setBackgroundNavigationDelegate:", 0);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  if (MGGetBoolAnswer(CFSTR("assistant")))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[AFContextManager defaultContextManager](AFContextManager, "defaultContextManager"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MapsSiriContextProvider sharedContextProvider](MapsSiriContextProvider, "sharedContextProvider"));
    objc_msgSend(v6, "removeContextProvider:", v7);

  }
  -[BKSProcessAssertion invalidate](self->_priorityAssertion, "invalidate");
  v8.receiver = self;
  v8.super_class = (Class)MapsAppDelegate;
  -[MapsAppDelegate dealloc](&v8, "dealloc");
}

- (ApplicationSessionController)appSessionController
{
  ApplicationSessionController *appSessionController;
  ApplicationSessionController *v4;
  ApplicationSessionController *v5;

  appSessionController = self->_appSessionController;
  if (!appSessionController)
  {
    v4 = objc_alloc_init(ApplicationSessionController);
    v5 = self->_appSessionController;
    self->_appSessionController = v4;

    appSessionController = self->_appSessionController;
  }
  return appSessionController;
}

- (PlatformController)platformController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication _maps_keyMapsSceneDelegate](UIApplication, "_maps_keyMapsSceneDelegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "platformController"));

  return (PlatformController *)v3;
}

- (AppCoordinator)appCoordinator
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication _maps_keyMapsSceneDelegate](UIApplication, "_maps_keyMapsSceneDelegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "appCoordinator"));

  return (AppCoordinator *)v3;
}

- (IOSChromeViewController)chromeViewController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication _maps_keyMapsSceneDelegate](UIApplication, "_maps_keyMapsSceneDelegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "chromeViewController"));

  return (IOSChromeViewController *)v3;
}

- (id)entryPointsCoordinator
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication _maps_keyMapsSceneDelegate](UIApplication, "_maps_keyMapsSceneDelegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "entryPointsCoordinator"));

  return v3;
}

- (IdleTimerController)idleTimerController
{
  IdleTimerController *idleTimerController;
  IdleTimerController *v4;
  IdleTimerController *v5;

  idleTimerController = self->_idleTimerController;
  if (!idleTimerController)
  {
    v4 = objc_alloc_init(IdleTimerController);
    v5 = self->_idleTimerController;
    self->_idleTimerController = v4;

    idleTimerController = self->_idleTimerController;
  }
  return idleTimerController;
}

- (POISearchManager)poiSearchManager
{
  POISearchManager *poiSearchManager;
  POISearchManager *v4;
  POISearchManager *v5;

  poiSearchManager = self->_poiSearchManager;
  if (!poiSearchManager)
  {
    v4 = objc_alloc_init(POISearchManager);
    v5 = self->_poiSearchManager;
    self->_poiSearchManager = v4;

    poiSearchManager = self->_poiSearchManager;
  }
  return poiSearchManager;
}

- (void)_startLegacyDataMigration
{
  MapsLegacyDataMigrator *v2;
  id v3;

  v2 = objc_alloc_init(MapsLegacyDataMigrator);
  -[MapsLegacyDataMigrator performMigration](v2, "performMigration");

  v3 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  objc_msgSend(v3, "registerForRemoteNotifications");

}

- (void)_setupSharedLocationManager
{
  void *v2;
  _QWORD v3[5];
  _QWORD v4[5];
  id v5;

  +[MKLocationManager setCanMonitorWiFiStatus:](MKLocationManager, "setCanMonitorWiFiStatus:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  v4[0] = 0;
  v4[1] = v4;
  v4[2] = 0x3032000000;
  v4[3] = sub_10054F27C;
  v4[4] = sub_10054F28C;
  v5 = 0;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10054F294;
  v3[3] = &unk_1011AEF80;
  v3[4] = v4;
  objc_msgSend(v2, "setNetworkActivity:", v3);
  objc_msgSend(v2, "setActivityType:", 4);
  _Block_object_dispose(v4, 8);

}

- (void)checkCoreRoutineEnabledState
{
  void *v3;
  _QWORD v4[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[RTRoutineManager defaultManager](RTRoutineManager, "defaultManager"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10054F390;
  v4[3] = &unk_1011BAD80;
  v4[4] = self;
  objc_msgSend(v3, "fetchRoutineStateWithHandler:", v4);

}

- (double)timeIntervalSinceLastBackgrounded
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v2, "doubleForKey:", CFSTR("LastSuspendTime"));
  v4 = v3;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", v4));
  objc_msgSend(v5, "timeIntervalSinceNow");
  v7 = fabs(v6);

  return v7;
}

- (void)sendDidEnterBackgroundNotification
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("MapsApplicationDidEnterBackgroundNotification"), UIApp);

}

- (void)receivedFullyDrawnNotification
{
  void *v3;
  void *v4;
  _QWORD block[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, VKMapViewDidBecomeFullyDrawnNotification, 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  if (objc_msgSend(v4, "shouldRecordExtendedLaunchTime"))
    objc_msgSend(v4, "finishedTest:extraResults:", CFSTR("launch"), 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10054F5DC;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)_performPostExtendedLaunchInitialization
{
  id v3;
  NSObject *v4;
  MapsDistanceUnitUpdater *v5;
  MapsDistanceUnitUpdater *distanceUnitUpdater;
  MUPlaceholderGridCache *v7;
  MUPlaceholderGridCache *placeholderGridCache;
  void *v9;
  id v10;
  NSObject *v11;
  uint8_t v12[8];
  _QWORD v13[4];
  id v14;
  id buf[2];

  v3 = sub_100431A4C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_signpost_enabled(v4))
  {
    LOWORD(buf[0]) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "PostExtendedLaunchInitialization", ", (uint8_t *)buf, 2u);
  }

  if (!self->_distanceUnitUpdater)
  {
    v5 = objc_alloc_init(MapsDistanceUnitUpdater);
    distanceUnitUpdater = self->_distanceUnitUpdater;
    self->_distanceUnitUpdater = v5;

    -[MapsDistanceUnitUpdater start](self->_distanceUnitUpdater, "start");
  }
  if (!self->_placeholderGridCache)
  {
    v7 = (MUPlaceholderGridCache *)objc_claimAutoreleasedReturnValue(+[MUPlaceholderGridCache unretainedInstance](MUPlaceholderGridCache, "unretainedInstance"));
    placeholderGridCache = self->_placeholderGridCache;
    self->_placeholderGridCache = v7;

    -[MUPlaceholderGridCache loadPlaceholderGridImages](self->_placeholderGridCache, "loadPlaceholderGridImages");
  }
  objc_initWeak(buf, self);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10054F7B8;
  v13[3] = &unk_1011AD260;
  objc_copyWeak(&v14, buf);
  geo_dispatch_async_qos(21, v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MapsMetroAnalyticsManager sharedManager](MapsMetroAnalyticsManager, "sharedManager"));
  objc_msgSend(v9, "startMonitoring");

  v10 = sub_100431A4C();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_signpost_enabled(v11))
  {
    *(_WORD *)v12 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "PostExtendedLaunchInitialization", ", v12, 2u);
  }

  objc_destroyWeak(&v14);
  objc_destroyWeak(buf);
}

- (void)application:(id)a3 handleEventsForBackgroundURLSession:(id)a4 completionHandler:(id)a5
{
  id v7;
  void (**v8)(_QWORD);
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  id v13;

  v7 = a4;
  v8 = (void (**)(_QWORD))a5;
  if (+[FeedbackSubmissionManager canHandleSessionIdentifier:](FeedbackSubmissionManager, "canHandleSessionIdentifier:", v7))
  {
    v9 = sub_100431FFC();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v12 = 138412290;
      v13 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Received a call from the app delegate with identifier %@", (uint8_t *)&v12, 0xCu);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppDelegate submissionManager](self, "submissionManager"));
    objc_msgSend(v11, "updateEventsForBackgroundURLSessionWithCompletionHandler:", v8);

  }
  else
  {
    v8[2](v8);
  }

}

- (BOOL)application:(id)a3 willFinishLaunchingWithOptions:(id)a4
{
  id v6;
  id v7;
  uint64_t Log;
  NSObject *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  id v26;
  NSObject *v27;
  id v28;
  NSObject *v29;
  id v30;
  id v31;
  NSObject *v32;
  id v33;
  NSObject *v34;
  void *v35;
  id v36;
  id v37;
  NSObject *v38;
  id v39;
  NSObject *v40;
  void *v41;
  id v42;
  NSObject *v43;
  id v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  NSObject *v55;
  id v56;
  NSObject *v57;
  id v58;
  NSObject *v59;
  id v60;
  NSObject *v61;
  void *v62;
  id v63;
  NSObject *v64;
  id v65;
  NSObject *v66;
  id v67;
  NSObject *v68;
  id v69;
  NSObject *v70;
  id v71;
  NSObject *v72;
  id v73;
  NSObject *v74;
  id v75;
  NSObject *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  id v81;
  NSObject *v82;
  id v83;
  id v84;
  NSObject *v85;
  id v86;
  NSObject *v87;
  void *v88;
  void *v89;
  id v90;
  NSObject *v91;
  id v92;
  NSObject *v93;
  id v94;
  NSObject *v95;
  id v96;
  NSObject *v97;
  void *v98;
  void *v99;
  id v100;
  NSObject *v101;
  id v102;
  NSObject *v103;
  uint8_t buf[4];
  id v106;

  v6 = a3;
  v7 = a4;
  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "MapsAppDelegate");
  v9 = (id)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v106 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "application:willFinishLaunchingWithOptions: %@", buf, 0xCu);
  }

  v10 = sub_100431A4C();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "WillFinishLaunching", ", buf, 2u);
  }

  byte_1014D2910 = objc_msgSend(v6, "launchedToTest");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bundleIdentifier"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", v13, 0));
  SBSSetAlertSuppressionContexts();

  +[GEOUserSession setInitialShareSessionWithMaps:](GEOUserSession, "setInitialShareSessionWithMaps:", 1);
  v15 = sub_100431A4C();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SetInstallState", ", buf, 2u);
  }

  +[MSPMapsInstallState setRunningInsideMapsApp](MSPMapsInstallState, "setRunningInsideMapsApp");
  v17 = sub_100431A4C();
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SetInstallState", ", buf, 2u);
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "hardwareIdentifier"));

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[GEOMapService sharedService](GEOMapService, "sharedService"));
  objc_msgSend(v21, "setDefaultTraitsHardwareIdentifier:", v20);

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform"));
  objc_msgSend(v22, "setClientCapabilitiesHardwareIdentifier:", v20);

  v23 = sub_100431A4C();
  v24 = objc_claimAutoreleasedReturnValue(v23);
  if (os_signpost_enabled(v24))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v24, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "StartOfflineService", ", buf, 2u);
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineHelper sharedHelper](MapsOfflineHelper, "sharedHelper"));
  objc_msgSend(v25, "startServiceIfEnabled");

  v26 = sub_100431A4C();
  v27 = objc_claimAutoreleasedReturnValue(v26);
  if (os_signpost_enabled(v27))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v27, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "StartOfflineService", ", buf, 2u);
  }

  v28 = sub_100431A4C();
  v29 = objc_claimAutoreleasedReturnValue(v28);
  if (os_signpost_enabled(v29))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v29, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SearchVirtualGarageSetup", ", buf, 2u);
  }

  v30 = +[SearchVirtualGarageManager sharedSearchVirtualGarageManager](SearchVirtualGarageManager, "sharedSearchVirtualGarageManager");
  v31 = sub_100431A4C();
  v32 = objc_claimAutoreleasedReturnValue(v31);
  if (os_signpost_enabled(v32))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v32, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SearchVirtualGarageSetup", ", buf, 2u);
  }

  v33 = sub_100431A4C();
  v34 = objc_claimAutoreleasedReturnValue(v33);
  if (os_signpost_enabled(v34))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v34, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "NavigationServiceSetup", ", buf, 2u);
  }

  v35 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  objc_msgSend(v35, "registerObserver:", self);

  v36 = +[NavigationFeedbackCollector sharedFeedbackCollector](NavigationFeedbackCollector, "sharedFeedbackCollector");
  v37 = sub_100431A4C();
  v38 = objc_claimAutoreleasedReturnValue(v37);
  if (os_signpost_enabled(v38))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v38, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "NavigationServiceSetup", ", buf, 2u);
  }

  v39 = sub_100431A4C();
  v40 = objc_claimAutoreleasedReturnValue(v39);
  if (os_signpost_enabled(v40))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v40, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "StartIPCServer", ", buf, 2u);
  }

  v41 = (void *)objc_claimAutoreleasedReturnValue(+[IPCServer sharedServer](IPCServer, "sharedServer"));
  objc_msgSend(v41, "setBackgroundNavigationDelegate:", self);

  v42 = sub_100431A4C();
  v43 = objc_claimAutoreleasedReturnValue(v42);
  if (os_signpost_enabled(v43))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v43, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "StartIPCServer", ", buf, 2u);
  }

  v44 = sub_100431A4C();
  v45 = objc_claimAutoreleasedReturnValue(v44);
  if (os_signpost_enabled(v45))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v45, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AddNotificationObservers", ", buf, 2u);
  }

  v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v46, "addObserver:selector:name:object:", self, "_maps_applicationDidBecomeActive:", UIApplicationDidBecomeActiveNotification, 0);

  v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v47, "addObserver:selector:name:object:", self, "_maps_applicationWillResignActive:", UIApplicationWillResignActiveNotification, 0);

  v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v48, "addObserver:selector:name:object:", self, "_maps_applicationWillEnterForeground:", UIApplicationWillEnterForegroundNotification, 0);

  v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v49, "addObserver:selector:name:object:", self, "_maps_applicationDidEnterBackground:", UIApplicationDidEnterBackgroundNotification, 0);

  v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v50, "addObserver:selector:name:object:", self, "_userDefaultsDidChange:", NSUserDefaultsDidChangeNotification, 0);

  v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v51, "addObserver:selector:name:object:", self, "_localeDidChange:", NSCurrentLocaleDidChangeNotification, 0);

  v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v52, "addObserver:selector:name:object:", self, "applicationWillAddDeactivationReason:", _UIApplicationWillAddDeactivationReasonNotification, 0);

  v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v53, "addObserver:selector:name:object:", self, "applicationDidRemoveDeactivationReason:", _UIApplicationDidRemoveDeactivationReasonNotification, 0);

  v54 = sub_100431A4C();
  v55 = objc_claimAutoreleasedReturnValue(v54);
  if (os_signpost_enabled(v55))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v55, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AddNotificationObservers", ", buf, 2u);
  }

  v56 = sub_100431A4C();
  v57 = objc_claimAutoreleasedReturnValue(v56);
  if (os_signpost_enabled(v57))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v57, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "PrepareCarPlayLaunch", ", buf, 2u);
  }

  -[MapsAppDelegate prepareForCarPlayLaunch](self, "prepareForCarPlayLaunch");
  v58 = sub_100431A4C();
  v59 = objc_claimAutoreleasedReturnValue(v58);
  if (os_signpost_enabled(v59))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v59, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "PrepareCarPlayLaunch", ", buf, 2u);
  }

  v60 = sub_100431A4C();
  v61 = objc_claimAutoreleasedReturnValue(v60);
  if (os_signpost_enabled(v61))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v61, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "MigrateARPDefaults", ", buf, 2u);
  }

  v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  -[MapsAppDelegate migrateARPConsentDefaults:](self, "migrateARPConsentDefaults:", v62);

  v63 = sub_100431A4C();
  v64 = objc_claimAutoreleasedReturnValue(v63);
  if (os_signpost_enabled(v64))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v64, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "MigrateARPDefaults", ", buf, 2u);
  }

  v65 = sub_100431A4C();
  v66 = objc_claimAutoreleasedReturnValue(v65);
  if (os_signpost_enabled(v66))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v66, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "RegisterDefaults", ", buf, 2u);
  }

  -[MapsAppDelegate _registerDefaults](self, "_registerDefaults");
  v67 = sub_100431A4C();
  v68 = objc_claimAutoreleasedReturnValue(v67);
  if (os_signpost_enabled(v68))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v68, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "RegisterDefaults", ", buf, 2u);
  }

  v69 = sub_100431A4C();
  v70 = objc_claimAutoreleasedReturnValue(v69);
  if (os_signpost_enabled(v70))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v70, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "InitializeLocationManager", ", buf, 2u);
  }

  -[MapsAppDelegate _setupSharedLocationManager](self, "_setupSharedLocationManager");
  v71 = sub_100431A4C();
  v72 = objc_claimAutoreleasedReturnValue(v71);
  if (os_signpost_enabled(v72))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v72, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "InitializeLocationManager", ", buf, 2u);
  }

  v73 = sub_100431A4C();
  v74 = objc_claimAutoreleasedReturnValue(v73);
  if (os_signpost_enabled(v74))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v74, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SetMeasurementUnits", ", buf, 2u);
  }

  +[MapsSettings setSystemMeasurementUnits](MapsSettings, "setSystemMeasurementUnits");
  v75 = sub_100431A4C();
  v76 = objc_claimAutoreleasedReturnValue(v75);
  if (os_signpost_enabled(v76))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v76, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SetMeasurementUnits", ", buf, 2u);
  }

  v77 = (void *)objc_claimAutoreleasedReturnValue(+[UNUserNotificationCenter currentNotificationCenter](UNUserNotificationCenter, "currentNotificationCenter"));
  objc_msgSend(v77, "setDelegate:", self);

  if (objc_msgSend(UIApp, "shouldLaunchSafe"))
  {
    GEOResetAllDefaults();
    v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults __maps_groupUserDefaults](NSUserDefaults, "__maps_groupUserDefaults"));
    objc_msgSend(v78, "removeObjectForKey:", CFSTR("MapsActivity"));

    v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v79, "removeObjectForKey:", CFSTR("WebBasedPlacecardManifest"));

  }
  if (objc_msgSend(UIApp, "launchedToTest"))
  {
    -[MapsAppDelegate doPostLaunchTestSetup](self, "doPostLaunchTestSetup");
  }
  else
  {
    v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v80, "addObserver:selector:name:object:", self, "receivedFullyDrawnNotification", VKMapViewDidBecomeFullyDrawnNotification, 0);

  }
  v81 = sub_100431A4C();
  v82 = objc_claimAutoreleasedReturnValue(v81);
  if (os_signpost_enabled(v82))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v82, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "InitializeMapsXPCConnections", ", buf, 2u);
  }

  v83 = +[MapsXPCConnectionsManager sharedManager](MapsXPCConnectionsManager, "sharedManager");
  v84 = sub_100431A4C();
  v85 = objc_claimAutoreleasedReturnValue(v84);
  if (os_signpost_enabled(v85))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v85, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "InitializeMapsXPCConnections", ", buf, 2u);
  }

  v86 = sub_100431A4C();
  v87 = objc_claimAutoreleasedReturnValue(v86);
  if (os_signpost_enabled(v87))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v87, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "MapsSuggestionsSignalPack", ", buf, 2u);
  }

  v88 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapsSuggestionsPredictor sharedPredictor](MKMapsSuggestionsPredictor, "sharedPredictor"));
  v89 = (void *)objc_claimAutoreleasedReturnValue(+[MapsSuggestionsPredictor sharedPredictor](MapsSuggestionsPredictor, "sharedPredictor"));
  objc_msgSend(v88, "setSignalPackCacheInterface:", v89);

  v90 = sub_100431A4C();
  v91 = objc_claimAutoreleasedReturnValue(v90);
  if (os_signpost_enabled(v91))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v91, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "MapsSuggestionsSignalPack", ", buf, 2u);
  }

  v92 = sub_100431A4C();
  v93 = objc_claimAutoreleasedReturnValue(v92);
  if (os_signpost_enabled(v93))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v93, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SharedTripContactsSetup", ", buf, 2u);
  }

  +[MSPSharedTripContact _maps_prepareForFirstUse](MSPSharedTripContact, "_maps_prepareForFirstUse");
  v94 = sub_100431A4C();
  v95 = objc_claimAutoreleasedReturnValue(v94);
  if (os_signpost_enabled(v95))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v95, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SharedTripContactsSetup", ", buf, 2u);
  }

  if (MGGetBoolAnswer(CFSTR("assistant")))
  {
    v96 = sub_100431A4C();
    v97 = objc_claimAutoreleasedReturnValue(v96);
    if (os_signpost_enabled(v97))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v97, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SiriContext", ", buf, 2u);
    }

    v98 = (void *)objc_claimAutoreleasedReturnValue(+[AFContextManager defaultContextManager](AFContextManager, "defaultContextManager"));
    v99 = (void *)objc_claimAutoreleasedReturnValue(+[MapsSiriContextProvider sharedContextProvider](MapsSiriContextProvider, "sharedContextProvider"));
    objc_msgSend(v98, "addContextProvider:", v99);

    v100 = sub_100431A4C();
    v101 = objc_claimAutoreleasedReturnValue(v100);
    if (os_signpost_enabled(v101))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v101, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SiriContext", ", buf, 2u);
    }

  }
  v102 = sub_100431A4C();
  v103 = objc_claimAutoreleasedReturnValue(v102);
  if (os_signpost_enabled(v103))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v103, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "WillFinishLaunching", ", buf, 2u);
  }

  return 1;
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v5;
  uint64_t Log;
  NSObject *v7;
  id v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  MapsActivityItemsConfiguration *v21;
  id v22;
  NSObject *v23;
  id v24;
  NSObject *v25;
  int v27;
  id v28;

  v5 = a4;
  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "MapsAppDelegate");
  v7 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v27 = 138412290;
    v28 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "application:didFinishLaunchingWithOptions: %@", (uint8_t *)&v27, 0xCu);
  }

  v8 = sub_100431A4C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_signpost_enabled(v9))
  {
    LOWORD(v27) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "DidFinishLaunching", ", (uint8_t *)&v27, 2u);
  }

  v10 = sub_100431A4C();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_signpost_enabled(v11))
  {
    LOWORD(v27) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "CarPlaySetup", ", (uint8_t *)&v27, 2u);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  objc_msgSend(v12, "didFinishLaunchingSuspendedWithOptions:", v5);

  v13 = sub_100431A4C();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_signpost_enabled(v14))
  {
    LOWORD(v27) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "CarPlaySetup", ", (uint8_t *)&v27, 2u);
  }

  v15 = sub_100431A4C();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_signpost_enabled(v16))
  {
    LOWORD(v27) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "NetworkFlags", ", (uint8_t *)&v27, 2u);
  }

  -[MapsAppDelegate _unsuppressNetworkFlags](self, "_unsuppressNetworkFlags");
  v17 = sub_100431A4C();
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_signpost_enabled(v18))
  {
    LOWORD(v27) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "NetworkFlags", ", (uint8_t *)&v27, 2u);
  }

  v19 = sub_100431A4C();
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_signpost_enabled(v20))
  {
    LOWORD(v27) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v20, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "InitializeActivityItemsConfiguration", ", (uint8_t *)&v27, 2u);
  }

  v21 = objc_alloc_init(MapsActivityItemsConfiguration);
  -[MapsAppDelegate setActivityItemsConfiguration:](self, "setActivityItemsConfiguration:", v21);

  v22 = sub_100431A4C();
  v23 = objc_claimAutoreleasedReturnValue(v22);
  if (os_signpost_enabled(v23))
  {
    LOWORD(v27) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v23, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "InitializeActivityItemsConfiguration", ", (uint8_t *)&v27, 2u);
  }

  v24 = sub_100431A4C();
  v25 = objc_claimAutoreleasedReturnValue(v24);
  if (os_signpost_enabled(v25))
  {
    LOWORD(v27) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v25, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "DidFinishLaunching", ", (uint8_t *)&v27, 2u);
  }

  return 1;
}

- (void)applicationWillTerminate:(id)a3
{
  uint64_t Log;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t v11[16];

  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "MapsAppDelegate");
  v5 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "-applicationWillTerminate:", v11, 2u);
  }

  if (self->_isNavigatingTurnByTurn)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    objc_msgSend(v6, "captureUserAction:onTarget:eventValue:", 3002, 0, 0);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v7, "removeObjectForKey:", CFSTR("NavigationUserActivityDefault"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v8, "removeObjectForKey:", CFSTR("NavigationRestorationAttempts"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  objc_msgSend(v9, "stopNavigationWithReason:", 9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  objc_msgSend(v10, "unregisterObserver:", self);

}

- (void)applicationDidReceiveMemoryWarning:(id)a3
{
  uint64_t Log;
  NSObject *v4;
  uint8_t v5[16];

  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "MapsAppDelegate");
  v4 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "applicationDidReceiveMemoryWarning:", v5, 2u);
  }

}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t Log;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  __objc2_class **v19;
  void *v20;
  int v21;
  void *v22;
  unsigned int v23;
  uint64_t v24;
  NSObject *v25;
  id v26;
  int v28;
  id v29;
  __int16 v30;
  id v31;

  v6 = a4;
  v7 = a5;
  v8 = DefaultLoggingSubsystem;
  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "MapsAppDelegate");
  v10 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v28 = 138412546;
    v29 = v6;
    v30 = 2112;
    v31 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "application:configurationForConnectingSceneSession: %@, options: %@", (uint8_t *)&v28, 0x16u);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "role"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UISceneConfiguration configurationWithName:sessionRole:](UISceneConfiguration, "configurationWithName:sessionRole:", 0, v11));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "role"));
  v14 = objc_msgSend(v13, "isEqualToString:", UIWindowSceneSessionRoleApplication);

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userActivities"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "anyObject"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "activityType"));
    v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("com.apple.Maps.MacPlacePhotoViewer"));

    v19 = &off_101197848;
    if (v18)
      v19 = off_101197658;
  }
  else
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "role"));
    v21 = objc_msgSend(v20, "isEqualToString:", _UIWindowSceneSessionTypeCoverSheet);

    if ((v21 & 1) != 0)
    {
      v19 = &off_101196E00;
    }
    else
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "role"));
      v23 = objc_msgSend(v22, "isEqualToString:", _UIWindowSceneSessionRoleCarPlay);

      if (!v23)
        goto LABEL_12;
      v19 = off_1011960A0;
    }
  }
  objc_msgSend(v12, "setDelegateClass:", objc_opt_class(*v19));
LABEL_12:
  v24 = GEOFindOrCreateLog(v8, "MapsAppDelegate");
  v25 = objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    v26 = objc_msgSend(v12, "delegateClass");
    v28 = 138412546;
    v29 = v12;
    v30 = 2112;
    v31 = v26;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "application:configurationForConnectingSceneSession:options: sceneConfiguration: %@, delegateClass: %@", (uint8_t *)&v28, 0x16u);
  }

  return v12;
}

- (unint64_t)application:(id)a3 supportedInterfaceOrientationsForWindow:(id)a4
{
  if (-[MapsAppDelegate lockedOrientations](self, "lockedOrientations", a3, a4))
    return -[MapsAppDelegate lockedOrientations](self, "lockedOrientations");
  else
    return 30;
}

- (void)application:(id)a3 didRegisterForRemoteNotificationsWithDeviceToken:(id)a4
{
  id v4;
  uint64_t Log;
  NSObject *v6;
  int v7;
  id v8;

  v4 = a4;
  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "MapsSupport");
  v6 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = 138477827;
    v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Registered for sync push notifications with token: %{private}@", (uint8_t *)&v7, 0xCu);
  }

}

- (void)application:(id)a3 didFailToRegisterForRemoteNotificationsWithError:(id)a4
{
  id v4;
  uint64_t Log;
  NSObject *v6;
  int v7;
  id v8;

  v4 = a4;
  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "MapsSupport");
  v6 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = 138477827;
    v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Could not register for sync push notifications with error: %{private}@", (uint8_t *)&v7, 0xCu);
  }

}

- (void)application:(id)a3 didReceiveRemoteNotification:(id)a4 fetchCompletionHandler:(id)a5
{
  void (**v6)(id, uint64_t);

  v6 = (void (**)(id, uint64_t))a5;
  v6[2](v6, 2 * (objc_msgSend(a3, "applicationState") == (id)2));

}

- (void)_maps_applicationDidBecomeActive:(id)a3
{
  uint64_t Log;
  NSObject *v5;
  SiriNavStatusUpdater *v6;
  void *v7;
  SiriNavStatusUpdater *v8;
  SiriNavStatusUpdater *siriNavStatusUpdater;
  uint8_t v10[16];

  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "MapsAppDelegate");
  v5 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "-_maps_applicationDidBecomeActive:", v10, 2u);
  }

  -[MapsAppDelegate _startLegacyDataMigration](self, "_startLegacyDataMigration");
  if (!self->_siriNavStatusUpdater)
  {
    v6 = [SiriNavStatusUpdater alloc];
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    v8 = -[SiriNavStatusUpdater initWithNavigationService:](v6, "initWithNavigationService:", v7);
    siriNavStatusUpdater = self->_siriNavStatusUpdater;
    self->_siriNavStatusUpdater = v8;

  }
  -[MapsAppDelegate checkCoreRoutineEnabledState](self, "checkCoreRoutineEnabledState");
}

- (void)_maps_applicationWillResignActive:(id)a3
{
  uint64_t Log;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "MapsAppDelegate");
  v4 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "_maps_applicationWillResignActive:", v6, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSPMapsPushDaemonRemoteProxy sharedInstance](MSPMapsPushDaemonRemoteProxy, "sharedInstance"));
  objc_msgSend(v5, "closeConnection");

}

- (void)_maps_applicationWillEnterForeground:(id)a3
{
  uint64_t Log;
  NSObject *v4;
  uint8_t v5[16];

  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "MapsAppDelegate");
  v4 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "_maps_applicationWillEnterForeground:", v5, 2u);
  }

  +[MapsSettings clearSelectedViewModeIfExpired](MapsSettings, "clearSelectedViewModeIfExpired");
}

- (void)_maps_applicationDidEnterBackground:(id)a3
{
  uint64_t Log;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "MapsAppDelegate");
  v4 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "-_maps_applicationDidEnterBackground:", v6, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v5, "setDouble:forKey:", CFSTR("LastSuspendTime"), CFAbsoluteTimeGetCurrent());

}

- (void)applicationWillAddDeactivationReason:(id)a3
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  uint64_t v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", _UIApplicationDeactivationReasonUserInfoKey));
  v5 = objc_msgSend(v4, "integerValue");

  if (v5 == 1)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    v8 = v6;
    v7 = 710;
  }
  else
  {
    if (v5 != 2)
      return;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    v8 = v6;
    v7 = 709;
  }
  objc_msgSend(v6, "captureUserAction:onTarget:eventValue:", 26, v7, 0);

}

- (void)applicationDidRemoveDeactivationReason:(id)a3
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  uint64_t v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", _UIApplicationDeactivationReasonUserInfoKey));
  v5 = objc_msgSend(v4, "integerValue");

  if (v5 == 1)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    v8 = v6;
    v7 = 710;
  }
  else
  {
    if (v5 != 2)
      return;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    v8 = v6;
    v7 = 709;
  }
  objc_msgSend(v6, "captureUserAction:onTarget:eventValue:", 27, v7, 0);

}

- (BOOL)applicationCanPromptToCalibrateHeading:(id)a3
{
  return 0;
}

- (void)_registerDefaults
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[52];
  _QWORD v11[52];

  v10[0] = CFSTR("LastViewMode");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0));
  v11[0] = v2;
  v10[1] = CFSTR("SearchMode");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 1));
  v11[1] = v3;
  v11[2] = CFSTR("YES");
  v10[2] = CFSTR("PlaybackControls");
  v10[3] = CFSTR("TraceBookmarksAlert");
  v11[3] = CFSTR("NO");
  v11[4] = CFSTR("YES");
  v10[4] = CFSTR("__internal__AlwaysShowRouteTraffic");
  v10[5] = CFSTR("MapsWalkingEnableImageBasedHeading");
  v11[5] = &__kCFBooleanTrue;
  v11[6] = &__kCFBooleanTrue;
  v10[6] = CFSTR("MapsEnablePedestrianARRaiseToStart");
  v10[7] = CFSTR("PedestrianARAutoFocusEnabledKey");
  v11[7] = &__kCFBooleanTrue;
  v11[8] = &__kCFBooleanTrue;
  v10[8] = CFSTR("PedestrianAREnableLowerToExitKey");
  v10[9] = CFSTR("PedestrianARSafetyUIKey");
  v11[9] = &__kCFBooleanTrue;
  v11[10] = &__kCFBooleanTrue;
  v10[10] = CFSTR("PedestrianARTTRButtonEnabledKey");
  v10[11] = CFSTR("PedestrianARIndoorOutdoorDetectionInterval");
  v11[11] = &off_101274BC8;
  v11[12] = &__kCFBooleanTrue;
  v10[12] = CFSTR("VLFSessionIgnoreFusedLocationForReplayKey");
  v10[13] = CFSTR("VLFSessionAppLaunchDelayMonitorAffectsPuckVisibilityKey");
  v11[13] = &__kCFBooleanTrue;
  v11[14] = &__kCFBooleanTrue;
  v10[14] = CFSTR("VLFSessionAppLaunchDelayMonitorAffectsBannerVisibilityKey");
  v10[15] = CFSTR("VLFSessionCarPlayConnectionMonitorAffectsPuckVisibilityKey");
  v11[15] = &__kCFBooleanTrue;
  v11[16] = &__kCFBooleanTrue;
  v10[16] = CFSTR("VLFSessionCarPlayConnectionMonitorAffectsBannerVisibilityKey");
  v10[17] = CFSTR("VLFSessionChromeStackMonitorAffectsPuckVisibilityKey");
  v11[17] = &__kCFBooleanTrue;
  v11[18] = &__kCFBooleanTrue;
  v10[18] = CFSTR("VLFSessionChromeStackMonitorAffectsBannerVisibilityKey");
  v10[19] = CFSTR("VLFSessionCoarseLocationMonitorAffectsPuckVisibilityKey");
  v11[19] = &__kCFBooleanTrue;
  v11[20] = &__kCFBooleanTrue;
  v10[20] = CFSTR("VLFSessionCoarseLocationMonitorAffectsBannerVisibilityKey");
  v10[21] = CFSTR("VLFSessionHistoricalLocationAccuracyMonitorAffectsPuckVisibilityKey");
  v11[21] = &__kCFBooleanTrue;
  v11[22] = &__kCFBooleanFalse;
  v10[22] = CFSTR("VLFSessionHistoricalLocationAccuracyMonitorAffectsBannerVisibilityKey");
  v10[23] = CFSTR("VLFSessionHomeWorkMonitorAffectsPuckVisibilityKey");
  v11[23] = &__kCFBooleanTrue;
  v11[24] = &__kCFBooleanTrue;
  v10[24] = CFSTR("VLFSessionHomeWorkMonitorAffectsBannerVisibilityKey");
  v10[25] = CFSTR("VLFSessionLocationHorizontalAccuracyMonitorAffectsPuckVisibilityKey");
  v11[25] = &__kCFBooleanTrue;
  v11[26] = &__kCFBooleanTrue;
  v10[26] = CFSTR("VLFSessionLocationHorizontalAccuracyMonitorAffectsBannerVisibilityKey");
  v10[27] = CFSTR("VLFSessionLocationOutdoorMonitorAffectsPuckVisibilityKey");
  v11[27] = &__kCFBooleanTrue;
  v11[28] = &__kCFBooleanTrue;
  v10[28] = CFSTR("VLFSessionLocationOutdoorMonitorAffectsBannerVisibilityKey");
  v10[29] = CFSTR("VLFSessionLocationTypeMonitorAffectsPuckVisibilityKey");
  v11[29] = &__kCFBooleanTrue;
  v11[30] = &__kCFBooleanTrue;
  v10[30] = CFSTR("VLFSessionLocationTypeMonitorAffectsBannerVisibilityKey");
  v10[31] = CFSTR("VLFSessionLocationSignalEnvironmentMonitorAffectsPuckVisibilityKey");
  v11[31] = &__kCFBooleanTrue;
  v11[32] = &__kCFBooleanTrue;
  v10[32] = CFSTR("VLFSessionLocationSignalEnvironmentMonitorAffectsBannerVisibilityKey");
  v10[33] = CFSTR("VLFSessionMapsHomeMonitorAffectsPuckVisibilityKey");
  v11[33] = &__kCFBooleanFalse;
  v11[34] = &__kCFBooleanTrue;
  v10[34] = CFSTR("VLFSessionMapsHomeMonitorAffectsBannerVisibilityKey");
  v10[35] = CFSTR("VLFSessionNetworkReachabilityMonitorAffectsPuckVisibilityKey");
  v11[35] = &__kCFBooleanTrue;
  v11[36] = &__kCFBooleanTrue;
  v10[36] = CFSTR("VLFSessionNetworkReachabilityMonitorAffectsBannerVisibilityKey");
  v10[37] = CFSTR("VLFSessionSunsetSunriseMonitorAffectsPuckVisibilityKey");
  v11[37] = &__kCFBooleanTrue;
  v11[38] = &__kCFBooleanFalse;
  v10[38] = CFSTR("VLFSessionSunsetSunriseMonitorAffectsBannerVisibilityKey");
  v10[39] = CFSTR("VLFSessionThermalStateMonitorAffectsPuckVisibilityKey");
  v11[39] = &__kCFBooleanTrue;
  v11[40] = &__kCFBooleanTrue;
  v10[40] = CFSTR("VLFSessionThermalStateMonitorAffectsBannerVisibilityKey");
  v10[41] = CFSTR("VLFSessionTransitSteppingMonitorAffectsPuckVisibilityKey");
  v10[42] = CFSTR("VLFSessionTransitSteppingMonitorAffectsBannerVisibilityKey");
  v10[43] = CFSTR("VLFSessionTileAvailabilityMonitorAffectsPuckVisibilityKey");
  v11[41] = &__kCFBooleanTrue;
  v11[42] = &__kCFBooleanTrue;
  v10[44] = CFSTR("VLFSessionTileAvailabilityMonitorAffectsBannerVisibilityKey");
  v10[45] = CFSTR("VLFSessionUsageMonitorAffectsPuckVisibilityKey");
  v11[43] = &__kCFBooleanTrue;
  v11[44] = &__kCFBooleanTrue;
  v11[45] = &__kCFBooleanFalse;
  v11[46] = &__kCFBooleanTrue;
  v10[46] = CFSTR("VLFSessionUsageMonitorAffectsBannerVisibilityKey");
  v10[47] = CFSTR("NavigationShowRawGPSTrail");
  v11[47] = CFSTR("NO");
  v11[48] = CFSTR("NO");
  v10[48] = CFSTR("NavigationShowMatchedLocationTrail");
  v10[49] = CFSTR("EnableEnvironmentSelectionInSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MKSystemController sharedInstance](MKSystemController, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v4, "isInternalInstall")));
  v11[49] = v5;
  v10[50] = CFSTR("EnableCustomEnvironmentsInSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MKSystemController sharedInstance](MKSystemController, "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v6, "isInternalInstall")));
  v10[51] = CFSTR("SCROLLING_OPENS_PLACECARD_KEY_ROTATED");
  v11[50] = v7;
  v11[51] = CFSTR("YES");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v11, v10, 52));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v9, "registerDefaults:", v8);

}

- (void)_userDefaultsDidChange:(id)a3
{
  -[CarDisplayController updateForCurrentEnablingState](self->_carDisplayController, "updateForCurrentEnablingState", a3);
}

- (void)migrateNavigoDefaults:(id)a3
{
  void *v3;
  id v4;

  v4 = a3;
  if ((objc_msgSend(v4, "BOOLForKey:", CFSTR("MigratedNavigoAppPreferences")) & 1) == 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("DefaultsDistanceUnits")));
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Imperial")) & 1) != 0
      || objc_msgSend(v3, "isEqualToString:", CFSTR("Metric")))
    {
      +[MapsSettings setValue:forDefaultsKey:bundleID:syncToNano:](MapsSettings, "setValue:forDefaultsKey:bundleID:syncToNano:", v3, CFSTR("DistanceUnits"), 0, 0);
    }
    objc_msgSend(v4, "setBool:forKey:", 1, CFSTR("MigratedNavigoAppPreferences"));

  }
}

- (void)migrateARPConsentDefaults:(id)a3
{
  unsigned int BOOL;
  id v4;

  v4 = a3;
  if ((objc_msgSend(v4, "BOOLForKey:", CFSTR("MigratedARPConsentPreference")) & 1) == 0)
  {
    BOOL = GEOConfigGetBOOL(MapKitConfig_MKHasUserGivenInformedConsentToAddContributions[0], MapKitConfig_MKHasUserGivenInformedConsentToAddContributions[1]);
    GEOConfigSetInteger(MapKitConfig_UserConsentState[0], MapKitConfig_UserConsentState[1], BOOL);
    objc_msgSend(v4, "setBool:forKey:", 1, CFSTR("MigratedARPConsentPreference"));
    _GEOConfigRemoveValue(MapKitConfig_MKHasUserGivenInformedConsentToAddContributions[0], MapKitConfig_MKHasUserGivenInformedConsentToAddContributions[1]);
  }

}

- (void)_localeDidChange:(id)a3
{
  +[MapsSettings setSystemMeasurementUnits](MapsSettings, "setSystemMeasurementUnits", a3);
}

- (void)prepareForCarPlayLaunch
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  objc_msgSend(v3, "prepareCarPlay");
  objc_msgSend(v3, "setDelegate:", self);
  self->_carNavigationWasVisible = objc_msgSend(v3, "isAnyCarSceneHostingDrivingNavigation");

}

- (void)carDisplayControllerDidUpdateNavigationVisibility:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  _QWORD *v7;
  id v8;
  _QWORD v9[4];
  _QWORD *v10;
  _QWORD v11[5];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MapsLightLevelController sharedController](MapsLightLevelController, "sharedController"));
  objc_msgSend(v5, "reloadForChangedLightLevelTrackers");

  v6 = objc_msgSend(v4, "isAnyCarSceneHostingDrivingNavigation");
  if (self->_carNavigationWasVisible != v6)
  {
    self->_carNavigationWasVisible = v6;
    if (v6)
    {
      -[MapsAppDelegate _releaseSecureAppAssertion](self, "_releaseSecureAppAssertion");
      v8 = (id)objc_claimAutoreleasedReturnValue(-[MapsAppDelegate appCoordinator](self, "appCoordinator"));
      objc_msgSend(v8, "showFullscreenDirectionsList");

    }
    else if (self->_isNavigatingTurnByTurn)
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_100551ECC;
      v11[3] = &unk_1011AC860;
      v11[4] = self;
      v7 = objc_retainBlock(v11);
      if (+[UIApplication _maps_isAnySceneConnectedForRole:](UIApplication, "_maps_isAnySceneConnectedForRole:", UIWindowSceneSessionRoleApplication))
      {
        ((void (*)(_QWORD *))v7[2])(v7);
      }
      else
      {
        v9[0] = _NSConcreteStackBlock;
        v9[1] = 3221225472;
        v9[2] = sub_100551F10;
        v9[3] = &unk_1011AE218;
        v10 = v7;
        +[UIApplication _maps_openApplicationSceneSuspendedWithCompletion:](UIApplication, "_maps_openApplicationSceneSuspendedWithCompletion:", v9);

      }
    }
  }
}

- (void)_suppressNetworkFlags
{
  uint64_t v2;

  v2 = SBSSpringBoardServerPort(self, a2);
  SBSetApplicationNetworkFlags(v2, 0, 0);
}

- (void)_unsuppressNetworkFlags
{
  uint64_t v2;

  v2 = SBSSpringBoardServerPort(self, a2);
  SBSetApplicationNetworkFlags(v2, 1, 1);
}

- (void)_acquireDoubleHeightStatusBarAssertionIfNeeded
{
  uint64_t Log;
  NSObject *v4;
  SBSStatusBarStyleOverridesAssertion *v5;
  SBSStatusBarStyleOverridesAssertion *doubleHeightStatusBarAssertion;
  void *v7;
  void *v8;
  uint8_t v9[16];

  if (!self->_doubleHeightStatusBarAssertion)
  {
    Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "MapsAppDelegate");
    v4 = objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Acquiring navigation status bar assertion", v9, 2u);
    }

    v5 = (SBSStatusBarStyleOverridesAssertion *)objc_msgSend(objc_alloc((Class)SBSStatusBarStyleOverridesAssertion), "initWithStatusBarStyleOverrides:forPID:exclusive:showsWhenForeground:", 128, getpid(), 0, 0);
    doubleHeightStatusBarAssertion = self->_doubleHeightStatusBarAssertion;
    self->_doubleHeightStatusBarAssertion = v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Touch to return to Navigation"), CFSTR("localized string not found"), 0));
    -[SBSStatusBarStyleOverridesAssertion setStatusString:](self->_doubleHeightStatusBarAssertion, "setStatusString:", v8);

    -[SBSStatusBarStyleOverridesAssertion acquireWithHandler:invalidationHandler:](self->_doubleHeightStatusBarAssertion, "acquireWithHandler:invalidationHandler:", &stru_1011BADA0, &stru_1011BADC0);
  }
}

- (void)_clearDoubleHeightStatusBar
{
  uint64_t Log;
  NSObject *v4;
  SBSStatusBarStyleOverridesAssertion *doubleHeightStatusBarAssertion;
  uint8_t v6[16];

  if (self->_doubleHeightStatusBarAssertion)
  {
    Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "MapsAppDelegate");
    v4 = objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Invalidating navigation status bar assertion", v6, 2u);
    }

    -[SBSStatusBarStyleOverridesAssertion invalidate](self->_doubleHeightStatusBarAssertion, "invalidate");
    doubleHeightStatusBarAssertion = self->_doubleHeightStatusBarAssertion;
    self->_doubleHeightStatusBarAssertion = 0;

  }
}

- (void)setTrackingMode:(int64_t)a3 monitorBatteryState:(BOOL)a4
{
  int isTrackingLocation;
  int v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  isTrackingLocation = self->_isTrackingLocation;
  v5 = a3 != 0;
  self->_isTrackingLocation = v5;
  if (isTrackingLocation != v5)
  {
    v6 = 1;
    if (a4)
      v6 = 2;
    if (a3)
      v7 = v6;
    else
      v7 = 0;
    v8 = (id)objc_claimAutoreleasedReturnValue(-[MapsAppDelegate idleTimerController](self, "idleTimerController"));
    objc_msgSend(v8, "setDesiredIdleTimerState:forReason:", v7, 0);

  }
}

- (void)setMapsIsShowingTour:(BOOL)a3
{
  _BOOL4 isShowingTour;
  dispatch_time_t v6;
  id v7;
  _QWORD block[5];

  isShowingTour = self->_isShowingTour;
  self->_isShowingTour = a3;
  if (isShowingTour || !a3)
  {
    if (isShowingTour && !a3)
    {
      v6 = dispatch_time(0, 10000000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10055242C;
      block[3] = &unk_1011AC860;
      block[4] = self;
      dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
  else
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[MapsAppDelegate idleTimerController](self, "idleTimerController"));
    objc_msgSend(v7, "setDesiredIdleTimerState:forReason:", 1, 1);

  }
}

- (void)updateNavigationIdleTimerConfiguration
{
  -[NavigationIdleTimerProvider updateConfiguration](self->_navigationIdleTimerProvider, "updateConfiguration");
}

- (void)_setCanShowInLockscreen:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  _BOOL4 canShowInLockscreen;
  uint64_t Log;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t v19[16];
  uint8_t buf[16];

  if (self->_canShowInLockscreen != a3)
  {
    self->_canShowInLockscreen = a3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppDelegate appSessionController](self, "appSessionController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentlyNavigatingCoverSheetSceneAssociation"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mapsScene"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "delegate"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "chromeViewController"));
    v9 = objc_opt_class(IOSChromeViewController);
    if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
      v10 = v8;
    else
      v10 = 0;
    v11 = v10;

    canShowInLockscreen = self->_canShowInLockscreen;
    Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "MapsAppDelegate");
    v14 = objc_claimAutoreleasedReturnValue(Log);
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);
    if (canShowInLockscreen)
    {
      if (v15)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Now able to show in lockscreen", buf, 2u);
      }

      v16 = (void *)objc_claimAutoreleasedReturnValue(+[GEOTileLoader modernLoader](GEOTileLoader, "modernLoader"));
      objc_msgSend(v16, "openForClient:", CFSTR("LockScreenNav"));

      v17 = (void *)objc_claimAutoreleasedReturnValue(+[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager"));
      objc_msgSend(v17, "openServerConnection");

      -[MapsAppDelegate acquireSecureAppAssertionIfNeeded](self, "acquireSecureAppAssertionIfNeeded");
      objc_msgSend(v11, "addContextStackObserver:", self);
    }
    else
    {
      if (v15)
      {
        *(_WORD *)v19 = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "No longer able to show in lockscreen", v19, 2u);
      }

      objc_msgSend(v11, "removeContextStackObserver:", self);
      -[MapsAppDelegate _releaseSecureAppAssertion](self, "_releaseSecureAppAssertion");
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[GEOTileLoader modernLoader](GEOTileLoader, "modernLoader"));
      objc_msgSend(v18, "closeForClient:", CFSTR("LockScreenNav"));

      v11 = (id)objc_claimAutoreleasedReturnValue(+[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager"));
      objc_msgSend(v11, "closeServerConnection");
    }

  }
}

- (void)_updateSecureAppAssertion
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  char isKindOfClass;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t Log;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  __CFString *v24;
  uint64_t v25;
  id v26;
  void *v27;
  objc_class *v28;
  NSString *v29;
  void *v30;
  void *v31;
  void *v32;
  __CFString *v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  void *v37;
  objc_class *v38;
  NSString *v39;
  void *v40;
  void *v41;
  void *v42;
  const char *v43;
  uint8_t buf[4];
  __CFString *v45;

  if (self->_canShowInLockscreen)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppDelegate appSessionController](self, "appSessionController"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentlyNavigatingCoverSheetSceneAssociation"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapsScene"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "delegate"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "chromeViewController"));
    if (!v7)
    {
      Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "MapsAppDelegate");
      v21 = objc_claimAutoreleasedReturnValue(Log);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "No chrome is navigating", buf, 2u);
      }

      -[MapsAppDelegate _releaseSecureAppAssertion](self, "_releaseSecureAppAssertion");
      goto LABEL_45;
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "chromeViewController"));
    v9 = objc_opt_class(IOSChromeViewController);
    isKindOfClass = objc_opt_isKindOfClass(v8, v9);

    if ((isKindOfClass & 1) == 0)
    {
      v22 = GEOFindOrCreateLog(DefaultLoggingSubsystem, "MapsAppDelegate");
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        v24 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "chromeViewController"));
        *(_DWORD *)buf = 138412290;
        v45 = v24;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Chrome not ready to take secure app assertion: %@", buf, 0xCu);

      }
      goto LABEL_45;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "chromeViewController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "topIOSBasedContext"));
    if ((objc_msgSend(v12, "conformsToProtocol:", &OBJC_PROTOCOL___LockScreenProtocol) & 1) != 0)
    {
      if ((objc_opt_respondsToSelector(v12, "supportsLockscreen") & 1) == 0
        || (objc_msgSend(v12, "supportsLockscreen") & 1) != 0)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
        v14 = objc_msgSend(v13, "isAnyCarSceneHostingNavigation");

        if (v14)
        {
          v15 = GEOFindOrCreateLog(DefaultLoggingSubsystem, "MapsAppDelegate");
          v16 = objc_claimAutoreleasedReturnValue(v15);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            v17 = "Not taking secure app assertion for Maps navigation: CarPlay is hosting navigation";
LABEL_30:
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, v17, buf, 2u);
          }
        }
        else
        {
          if (!-[NavigationThermalWarningController isDeviceMelting](self->_thermalWarningController, "isDeviceMelting"))
          {
            -[MapsAppDelegate _acquireSecureAppAssertion](self, "_acquireSecureAppAssertion");
            goto LABEL_44;
          }
          v34 = GEOFindOrCreateLog(DefaultLoggingSubsystem, "MapsAppDelegate");
          v16 = objc_claimAutoreleasedReturnValue(v34);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            v17 = "Not taking secure app assertion for Maps navigation: thermal level is too high";
            goto LABEL_30;
          }
        }
LABEL_43:

        -[MapsAppDelegate _releaseSecureAppAssertion](self, "_releaseSecureAppAssertion");
LABEL_44:

LABEL_45:
        return;
      }
      v35 = GEOFindOrCreateLog(DefaultLoggingSubsystem, "MapsAppDelegate");
      v16 = (id)objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v36 = v12;
        v37 = v36;
        if (!v36)
        {
          v33 = CFSTR("<nil>");
          goto LABEL_50;
        }
        v38 = (objc_class *)objc_opt_class(v36);
        v39 = NSStringFromClass(v38);
        v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
        if ((objc_opt_respondsToSelector(v37, "accessibilityIdentifier") & 1) != 0)
        {
          v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "performSelector:", "accessibilityIdentifier"));
          v42 = v41;
          if (v41 && !objc_msgSend(v41, "isEqualToString:", v40))
          {
            v33 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v40, v37, v42));

            goto LABEL_38;
          }

        }
        v33 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v40, v37));
LABEL_38:

LABEL_50:
        *(_DWORD *)buf = 138412290;
        v45 = v33;
        v43 = "Not taking secure app assertion, topContext %@ reports that it currently does not support the lockscreen";
        goto LABEL_41;
      }
LABEL_42:

      goto LABEL_43;
    }
    v25 = GEOFindOrCreateLog(DefaultLoggingSubsystem, "MapsAppDelegate");
    v16 = (id)objc_claimAutoreleasedReturnValue(v25);
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      goto LABEL_42;
    v26 = v12;
    v27 = v26;
    if (!v26)
    {
      v33 = CFSTR("<nil>");
      goto LABEL_40;
    }
    v28 = (objc_class *)objc_opt_class(v26);
    v29 = NSStringFromClass(v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    if ((objc_opt_respondsToSelector(v27, "accessibilityIdentifier") & 1) != 0)
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "performSelector:", "accessibilityIdentifier"));
      v32 = v31;
      if (v31 && !objc_msgSend(v31, "isEqualToString:", v30))
      {
        v33 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v30, v27, v32));

        goto LABEL_26;
      }

    }
    v33 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v30, v27));
LABEL_26:

LABEL_40:
    *(_DWORD *)buf = 138412290;
    v45 = v33;
    v43 = "Not taking secure app assertion for Maps navigation: top mode %@ doesn't conform to LockScreenProtocol";
LABEL_41:
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, v43, buf, 0xCu);

    goto LABEL_42;
  }
  v18 = GEOFindOrCreateLog(DefaultLoggingSubsystem, "MapsAppDelegate");
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Not taking secure app assertion for Maps navigation: not permitted", buf, 2u);
  }

  -[MapsAppDelegate _releaseSecureAppAssertion](self, "_releaseSecureAppAssertion");
}

- (void)_acquireSecureAppAssertion
{
  SBSSecureAppAssertion *secureAppAssertion;
  uint64_t Log;
  NSObject *v5;
  _BOOL4 v6;
  SBSSecureAppAssertion *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  secureAppAssertion = self->_secureAppAssertion;
  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "MapsAppDelegate");
  v5 = objc_claimAutoreleasedReturnValue(Log);
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (secureAppAssertion)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Not taking secure app assertion for Maps navigation: we already have one", buf, 2u);
    }
  }
  else
  {
    if (v6)
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Taking secure app assertion for Maps navigation", v8, 2u);
    }

    v7 = (SBSSecureAppAssertion *)objc_claimAutoreleasedReturnValue(+[SBSSecureAppAssertion acquireContentProviderAssertionForType:slot:identifier:errorHandler:](SBSSecureAppAssertion, "acquireContentProviderAssertionForType:slot:identifier:errorHandler:", 2, SBSLockScreenContentAssertionSlotApp, CFSTR("com.apple.Maps"), &stru_1011BADE0));
    v5 = self->_secureAppAssertion;
    self->_secureAppAssertion = v7;
  }

}

- (void)_releaseSecureAppAssertion
{
  uint64_t Log;
  NSObject *v4;
  SBSSecureAppAssertion *secureAppAssertion;
  uint8_t v6[16];

  if (self->_secureAppAssertion)
  {
    Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "MapsAppDelegate");
    v4 = objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Releasing secure app assertion for Maps navigation", v6, 2u);
    }

    -[SBSSecureAppAssertion invalidate](self->_secureAppAssertion, "invalidate");
    secureAppAssertion = self->_secureAppAssertion;
    self->_secureAppAssertion = 0;

  }
}

- (BOOL)canPlayTrace
{
  void *v2;
  unsigned int v3;

  if (sub_100424728())
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    v3 = objc_msgSend(v2, "isInNavigatingState") ^ 1;

  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (void)startTransitTurnByTurn
{
  NavigationIdleTimerProvider *v3;
  NavigationIdleTimerProvider *transitIdleTimerProvider;

  v3 = -[NavigationIdleTimerProvider initWithIdleStateHandler:undimHandler:]([NavigationIdleTimerProvider alloc], "initWithIdleStateHandler:undimHandler:", 0, &stru_1011BAE00);
  transitIdleTimerProvider = self->_transitIdleTimerProvider;
  self->_transitIdleTimerProvider = v3;

}

- (void)startTurnByTurn:(id)a3
{
  id v4;
  void *v5;
  NavigationIdleTimerProvider *v6;
  NavigationIdleTimerProvider *v7;
  NavigationIdleTimerProvider *navigationIdleTimerProvider;
  NavigationThermalWarningController *v9;
  NavigationThermalWarningController *thermalWarningController;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  DataActivationPopupAssertion *v16;
  DataActivationPopupAssertion *navigatorDataActivationPopupAssertion;
  void **v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  id from;
  _QWORD v24[4];
  id v25;
  id location;

  v4 = a3;
  self->_isNavigatingTurnByTurn = 1;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppDelegate idleTimerController](self, "idleTimerController"));
  objc_initWeak(&location, v5);

  v6 = [NavigationIdleTimerProvider alloc];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100553360;
  v24[3] = &unk_1011AD4F0;
  objc_copyWeak(&v25, &location);
  v7 = -[NavigationIdleTimerProvider initWithIdleStateHandler:undimHandler:](v6, "initWithIdleStateHandler:undimHandler:", v24, &stru_1011BAE20);
  navigationIdleTimerProvider = self->_navigationIdleTimerProvider;
  self->_navigationIdleTimerProvider = v7;

  v9 = objc_alloc_init(NavigationThermalWarningController);
  thermalWarningController = self->_thermalWarningController;
  self->_thermalWarningController = v9;

  objc_initWeak(&from, self);
  v18 = _NSConcreteStackBlock;
  v19 = 3221225472;
  v20 = sub_100553454;
  v21 = &unk_1011AD4F0;
  objc_copyWeak(&v22, &from);
  -[NavigationThermalWarningController setChangeHandler:](self->_thermalWarningController, "setChangeHandler:", &v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[IPCServer sharedServer](IPCServer, "sharedServer", v18, v19, v20, v21));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "externalGuidanceSource"));

  if (v13 != v12)
    objc_msgSend(v11, "setExternalGuidanceSource:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[VGVirtualGarageService sharedService](VGVirtualGarageService, "sharedService"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "virtualGarageSource"));

  if (v15 != v14)
    objc_msgSend(v11, "setVirtualGarageSource:", v14);
  -[MapsAppDelegate _acquireProcessAssertionForTurnByTurn:](self, "_acquireProcessAssertionForTurnByTurn:", 1);
  -[MapsAppDelegate _setCanShowInLockscreen:](self, "_setCanShowInLockscreen:", 1);
  if (!self->_hasNavNotifyToken)
  {
    if (notify_register_check("com.apple.Maps.Navigation", &self->_navNotifyToken))
    {
      NSLog(CFSTR("Failed to get notify token"));
      if (!self->_hasNavNotifyToken)
        goto LABEL_13;
    }
    else
    {
      self->_hasNavNotifyToken = 1;
    }
  }
  if (notify_set_state(self->_navNotifyToken, 1uLL))
  {
    NSLog(CFSTR("Failed to set state for notify token"));
  }
  else if (notify_post("com.apple.Maps.Navigation"))
  {
    NSLog(CFSTR("Failed to post notification for token"));
  }
LABEL_13:
  if (!self->_navigatorDataActivationPopupAssertion)
  {
    v16 = objc_alloc_init(DataActivationPopupAssertion);
    navigatorDataActivationPopupAssertion = self->_navigatorDataActivationPopupAssertion;
    self->_navigatorDataActivationPopupAssertion = v16;

  }
  -[MapsAppDelegate _suppressNetworkFlags](self, "_suppressNetworkFlags");

  objc_destroyWeak(&v22);
  objc_destroyWeak(&from);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

}

- (void)endTransitTurnByTurn
{
  NavigationIdleTimerProvider *transitIdleTimerProvider;

  transitIdleTimerProvider = self->_transitIdleTimerProvider;
  self->_transitIdleTimerProvider = 0;

}

- (void)endTurnByTurn:(id)a3
{
  NavigationIdleTimerProvider *navigationIdleTimerProvider;
  void *v5;
  NavigationThermalWarningController *thermalWarningController;
  void *v7;
  void *v8;
  void *v9;
  DataActivationPopupAssertion *navigatorDataActivationPopupAssertion;
  id v11;

  self->_isNavigatingTurnByTurn = 0;
  navigationIdleTimerProvider = self->_navigationIdleTimerProvider;
  self->_navigationIdleTimerProvider = 0;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppDelegate idleTimerController](self, "idleTimerController"));
  objc_msgSend(v5, "setDesiredIdleTimerState:forReason:", 0, 2);

  thermalWarningController = self->_thermalWarningController;
  self->_thermalWarningController = 0;

  v11 = (id)objc_claimAutoreleasedReturnValue(+[IPCServer sharedServer](IPCServer, "sharedServer"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "externalGuidanceSource"));

  if (v8 == v7)
    objc_msgSend(v11, "setExternalGuidanceSource:", 0);
  -[MapsAppDelegate _setCanShowInLockscreen:](self, "_setCanShowInLockscreen:", 0);
  -[MapsAppDelegate _clearDoubleHeightStatusBar](self, "_clearDoubleHeightStatusBar");
  -[MapsAppDelegate _releaseSecureAppAssertion](self, "_releaseSecureAppAssertion");
  -[MapsAppDelegate _releaseProcessAssertion](self, "_releaseProcessAssertion");
  if (self->_hasNavNotifyToken)
  {
    if (notify_set_state(self->_navNotifyToken, 0))
    {
      NSLog(CFSTR("Failed to set state for notify token"));
    }
    else if (notify_post("com.apple.Maps.Navigation"))
    {
      NSLog(CFSTR("Failed to post notification for token"));
    }
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MapsLightLevelController sharedController](MapsLightLevelController, "sharedController"));
  objc_msgSend(v9, "reloadForChangedLightLevelTrackers");

  -[DataActivationPopupAssertion invalidate](self->_navigatorDataActivationPopupAssertion, "invalidate");
  navigatorDataActivationPopupAssertion = self->_navigatorDataActivationPopupAssertion;
  self->_navigatorDataActivationPopupAssertion = 0;

  -[MapsAppDelegate _unsuppressNetworkFlagsIfNecessary](self, "_unsuppressNetworkFlagsIfNecessary");
}

- (void)chromeViewController:(id)a3 willMoveFromContextStack:(id)a4 toContextStack:(id)a5
{
  id v6;

  if (self->_canShowInLockscreen)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a5, "lastObject", a3, a4));
    if (!objc_msgSend(v6, "conformsToProtocol:", &OBJC_PROTOCOL___LockScreenProtocol)
      || (objc_opt_respondsToSelector(v6, "supportsLockscreen") & 1) != 0
      && (objc_msgSend(v6, "supportsLockscreen") & 1) == 0)
    {
      -[MapsAppDelegate _updateSecureAppAssertion](self, "_updateSecureAppAssertion");
    }

  }
}

- (void)chromeViewController:(id)a3 didMoveFromContextStack:(id)a4 toContextStack:(id)a5
{
  id v6;

  if (self->_canShowInLockscreen)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a5, "lastObject", a3, a4));
    if (objc_msgSend(v6, "conformsToProtocol:", &OBJC_PROTOCOL___LockScreenProtocol)
      && ((objc_opt_respondsToSelector(v6, "supportsLockscreen") & 1) == 0
       || objc_msgSend(v6, "supportsLockscreen")))
    {
      -[MapsAppDelegate _updateSecureAppAssertion](self, "_updateSecureAppAssertion");
    }

  }
}

- (void)_acquireProcessAssertionForTurnByTurn:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  BOOL v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t Log;
  NSObject *v14;
  NSObject *v15;
  int v16;
  void *v17;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppDelegate priorityAssertion](self, "priorityAssertion"));

  if (!v5)
  {
    v6 = !v3;
    if (v3)
      v7 = CFSTR(".Navigation.TurnByTurn");
    else
      v7 = CFSTR(".Navigation.Stepping");
    if (v6)
      v8 = 1;
    else
      v8 = 11;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bundleIdentifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByAppendingString:", v7));

    v12 = objc_msgSend(objc_alloc((Class)BKSProcessAssertion), "initWithBundleIdentifier:flags:reason:name:", CFSTR("com.apple.Maps"), v8, 7, v11);
    LODWORD(v10) = objc_msgSend(v12, "acquire");
    Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "MapsAppDelegate");
    v14 = objc_claimAutoreleasedReturnValue(Log);
    v15 = v14;
    if ((_DWORD)v10)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v16 = 138412290;
        v17 = v11;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Acquired priority assertion %@", (uint8_t *)&v16, 0xCu);
      }

      -[MapsAppDelegate setPriorityAssertion:](self, "setPriorityAssertion:", v12);
    }
    else
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v16 = 138412290;
        v17 = v11;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to acquire a priority assertion %@", (uint8_t *)&v16, 0xCu);
      }

    }
  }
}

- (void)_releaseProcessAssertion
{
  void *v3;
  void *v4;
  uint64_t Log;
  NSObject *v6;
  void *v7;
  dispatch_time_t v8;
  id v9;
  _QWORD block[4];
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  uint64_t v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppDelegate priorityAssertion](self, "priorityAssertion"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppDelegate priorityAssertion](self, "priorityAssertion"));
    -[MapsAppDelegate setPriorityAssertion:](self, "setPriorityAssertion:", 0);
    Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "MapsAppDelegate");
    v6 = objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
      *(_DWORD *)buf = 138412546;
      v13 = v7;
      v14 = 2048;
      v15 = 0x4014000000000000;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Will invalidate priority assertion %@ in %#.1lfs", buf, 0x16u);

    }
    v8 = dispatch_time(0, 5000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100553A80;
    block[3] = &unk_1011AC860;
    v11 = v4;
    v9 = v4;
    dispatch_after(v8, (dispatch_queue_t)&_dispatch_main_q, block);

  }
}

- (BOOL)_supportsModernTransitNavigation:(id)a3
{
  return objc_msgSend(a3, "desiredTransportType") == 1;
}

- (void)navigationService:(id)a3 willChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  uint64_t v8;
  _BOOL8 v9;
  void *v10;
  BOOL v11;
  id v12;

  v12 = a3;
  if (MNNavigationServiceStateChangedToNavigating(a4, a5, v8))
  {
    if (objc_msgSend(v12, "desiredNavigationType") != (id)2)
    {
      v11 = objc_msgSend(v12, "desiredNavigationType") == (id)3;
      v10 = v12;
      if (!v11)
        goto LABEL_15;
      -[MapsAppDelegate startTurnByTurn:](self, "startTurnByTurn:", v12);
      -[MapsAppDelegate _acquireDoubleHeightStatusBarAssertionIfNeeded](self, "_acquireDoubleHeightStatusBarAssertionIfNeeded");
      goto LABEL_14;
    }
    -[MapsAppDelegate _suppressNetworkFlags](self, "_suppressNetworkFlags");
    v9 = -[MapsAppDelegate _supportsModernTransitNavigation:](self, "_supportsModernTransitNavigation:", v12);
    -[MapsAppDelegate _setCanShowInLockscreen:](self, "_setCanShowInLockscreen:", v9);
    v10 = v12;
    if (v9)
    {
      -[MapsAppDelegate _acquireProcessAssertionForTurnByTurn:](self, "_acquireProcessAssertionForTurnByTurn:", 0);
      -[MapsAppDelegate startTransitTurnByTurn](self, "startTransitTurnByTurn");
LABEL_14:
      v10 = v12;
    }
  }
  else
  {
    v10 = v12;
    if (!a5)
    {
      if (objc_msgSend(v12, "navigationType") == (id)2)
      {
        -[MapsAppDelegate endTransitTurnByTurn](self, "endTransitTurnByTurn");
        -[MapsAppDelegate _releaseProcessAssertion](self, "_releaseProcessAssertion");
        -[MapsAppDelegate _setCanShowInLockscreen:](self, "_setCanShowInLockscreen:", 0);
        -[MapsAppDelegate _unsuppressNetworkFlagsIfNecessary](self, "_unsuppressNetworkFlagsIfNecessary");
      }
      if (objc_msgSend(v12, "navigationType") == (id)3)
        -[MapsAppDelegate endTurnByTurn:](self, "endTurnByTurn:", v12);
      -[MapsAppDelegate _clearDoubleHeightStatusBar](self, "_clearDoubleHeightStatusBar");
      -[MapsAppDelegate _releaseSecureAppAssertion](self, "_releaseSecureAppAssertion");
      goto LABEL_14;
    }
  }
LABEL_15:

}

- (void)navigationService:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  ForegroundOnlyDataActivationPopupAssertion *v13;
  ForegroundOnlyDataActivationPopupAssertion *foregroundDataActivationPopupAssertion;
  ForegroundOnlyDataActivationPopupAssertion *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  if (MNNavigationServiceStateChangedToNavigating(a4, a5, v8))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MapsLightLevelController sharedController](MapsLightLevelController, "sharedController"));
    objc_msgSend(v9, "reloadForChangedLightLevelTrackers");

    if (objc_msgSend(v18, "desiredNavigationType") == (id)2)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[IPCServer sharedServer](IPCServer, "sharedServer"));
      v11 = v10;
      v12 = CFSTR("Stepping navigation started");
    }
    else
    {
      if (objc_msgSend(v18, "desiredNavigationType") != (id)3)
        goto LABEL_11;
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[IPCServer sharedServer](IPCServer, "sharedServer"));
      v11 = v10;
      v12 = CFSTR("TBT navigation started");
    }
    objc_msgSend(v10, "navigationStateDidChangeTo:reason:", 1, v12);

LABEL_11:
    if (!self->_foregroundDataActivationPopupAssertion)
    {
      v15 = objc_alloc_init(ForegroundOnlyDataActivationPopupAssertion);
      foregroundDataActivationPopupAssertion = self->_foregroundDataActivationPopupAssertion;
      self->_foregroundDataActivationPopupAssertion = v15;
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  if (!a5)
    -[MapsAppDelegate endTurnByTurn:](self, "endTurnByTurn:", v18);
  v13 = self->_foregroundDataActivationPopupAssertion;
  if (v13)
  {
    -[DataActivationPopupAssertion invalidate](v13, "invalidate");
    foregroundDataActivationPopupAssertion = self->_foregroundDataActivationPopupAssertion;
    self->_foregroundDataActivationPopupAssertion = 0;
LABEL_13:

  }
LABEL_14:
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[IPCServer sharedServer](IPCServer, "sharedServer"));
  objc_msgSend(v16, "setEtaOnlyNavMode:", a5 == 5);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[IPCServer sharedServer](IPCServer, "sharedServer"));
  objc_msgSend(v17, "setRoutePreviewGuidanceNavMode:", a5 == 3);

}

- (void)navigationService:(id)a3 didArriveAtWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5
{
  void *v7;

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "route"));
  LODWORD(a5) = objc_msgSend(v7, "isLegIndexOfLastLeg:", a5);

  if ((_DWORD)a5)
    -[MapsAppDelegate _clearDoubleHeightStatusBar](self, "_clearDoubleHeightStatusBar");
}

- (void)navigationService:(id)a3 didResumeNavigatingFromWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5 reason:(unint64_t)a6
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;

  v7 = a4;
  v8 = sub_100431C0C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "shortDescription"));
    v11 = 138412290;
    v12 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Did resume from waypoint: %@; update idle timer state",
      (uint8_t *)&v11,
      0xCu);

  }
  -[NavigationIdleTimerProvider updateConfiguration](self->_navigationIdleTimerProvider, "updateConfiguration");

}

- (void)navigationService:(id)a3 didEnableGuidancePrompts:(BOOL)a4
{
  _BOOL4 v4;
  id v6;

  v4 = a4;
  v6 = a3;
  if (v4)
  {
    -[MapsAppDelegate _acquireDoubleHeightStatusBarAssertionIfNeeded](self, "_acquireDoubleHeightStatusBarAssertionIfNeeded");
    -[MapsAppDelegate _updateSecureAppAssertion](self, "_updateSecureAppAssertion");
  }
  else
  {
    -[MapsAppDelegate _clearDoubleHeightStatusBar](self, "_clearDoubleHeightStatusBar");
    if (!objc_msgSend(v6, "navigationState"))
      -[MapsAppDelegate _releaseSecureAppAssertion](self, "_releaseSecureAppAssertion");
  }

}

- (void)navigationService:(id)a3 didFailWithError:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  dispatch_time_t v9;
  _QWORD block[4];
  id v11;
  MapsAppDelegate *v12;
  id v13;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[IPCServer sharedServer](IPCServer, "sharedServer"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "description"));
  objc_msgSend(v6, "navigationStateDidChangeTo:reason:", 3, v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform"));
  if (objc_msgSend(v8, "isInternalInstall") && objc_msgSend(v5, "code") == (id)10)
  {
    v9 = dispatch_time(0, 1000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1005540D8;
    block[3] = &unk_1011AD238;
    v11 = v5;
    v12 = self;
    v13 = v8;
    dispatch_after(v9, (dispatch_queue_t)&_dispatch_main_q, block);

  }
}

- (id)hardwareModel
{
  return (id)MGCopyAnswer(CFSTR("HWModelStr"), 0);
}

- (void)prepareBackgroundNavigationWithMessage:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  const __CFString *v40;
  id v41;
  uint8_t buf[4];
  id v43;
  __int16 v44;
  id v45;

  v5 = a3;
  objc_storeStrong((id *)&self->_lastPrepareNavigationMessage, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication _maps_keyMapsSceneDelegate](UIApplication, "_maps_keyMapsSceneDelegate"));
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication _maps_applicationScenes](UIApplication, "_maps_applicationScenes"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "delegate"));

  }
  v11 = v8;
  v12 = objc_opt_class(MapsSceneDelegate);
  if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
    v13 = v11;
  else
    v13 = 0;
  v14 = v13;

  v39 = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "entryPointsCoordinator"));
  v16 = v15;
  if (v15)
  {
    v17 = v15;
  }
  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppDelegate appSessionController](self, "appSessionController"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "primaryPlatformController"));
    v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "entryPointsCoordinator"));

  }
  v20 = sub_1005548E4();
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v43 = v11;
    v44 = 2112;
    v45 = v17;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Will prepare background navigation, sceneDelegate: %@, entryPointsCoordinator: %@", buf, 0x16u);
  }
  v38 = v11;

  objc_msgSend(v17, "prepareBackgroundNavigation");
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  objc_msgSend(v22, "resetAfterResumeIfNecessary");

  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "routeContextData"));
  v24 = v17;
  if (v23)
    v25 = objc_msgSend(objc_alloc((Class)GEOCompanionRouteContext), "initWithData:", v23, v38);
  else
    v25 = 0;
  v26 = objc_msgSend(objc_alloc((Class)MKURLContext), "initWithOriginatedFromWatch:companionRouteContext:", objc_msgSend(v5, "originIsWatch"), v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "windows"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "firstObject"));
  v30 = v5;
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "windowScene"));

  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "url"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "session"));
  v40 = CFSTR("MKURLContext");
  v41 = v26;
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "coordinateSpace"));
  objc_msgSend(v35, "bounds");
  objc_msgSend(v24, "openURL:session:sceneOptions:mkOptions:windowSize:", v32, v33, 0, v34, v36, v37);

}

- (void)startPreparedBackgroundNavigationWithMessage:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  _QWORD *v24;
  unsigned int v25;
  id v26;
  NSObject *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  uint64_t v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  id v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  id v49;
  _QWORD *v50;
  id v51;
  void *v52;
  _QWORD v53[4];
  id v54;
  _QWORD v55[4];
  id v56;
  _QWORD *v57;
  _QWORD v58[5];
  id v59;
  id v60;
  uint8_t buf[8];
  uint64_t v62;

  v4 = a3;
  v5 = sub_1005548E4();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Will start prepared background navigation", buf, 2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppDelegate platformController](self, "platformController"));
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppDelegate appSessionController](self, "appSessionController"));
    v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "primaryPlatformController"));

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "currentSession"));
  v12 = objc_opt_class(RoutePlanningSession);
  if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
    v13 = v11;
  else
    v13 = 0;
  v14 = v13;

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "currentRouteCollection"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "iosBasedChromeViewController"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "appCoordinator"));

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "routeID"));
  v51 = objc_msgSend(v4, "routeIndex");
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "loadDirectionsMessage"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "routePersistentData"));

  if (v20)
  {
    v21 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(GEOComposedGeometryRoutePersistentData), v20, 0);
    v52 = (void *)objc_claimAutoreleasedReturnValue(v21);
  }
  else
  {
    v52 = 0;
  }
  v58[0] = _NSConcreteStackBlock;
  v58[1] = 3221225472;
  v58[2] = sub_100554F48;
  v58[3] = &unk_1011BAE48;
  v58[4] = self;
  v22 = v4;
  v59 = v22;
  v23 = v17;
  v60 = v23;
  v24 = objc_retainBlock(v58);
  v25 = objc_msgSend(v22, "originIsWatch");
  if (v20 && v25 && !v15)
  {
    v26 = sub_1005548E4();
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Will recreate a navigable route from provided persistent data", buf, 2u);
    }

    v28 = (id)objc_claimAutoreleasedReturnValue(+[GEOComposedRoute _maps_composedRouteWithPersistentData:](GEOComposedRoute, "_maps_composedRouteWithPersistentData:", v52));
    if (v28)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppDelegate chromeViewController](self, "chromeViewController"));
      v30 = v18;
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "currentTraits"));
      v55[0] = _NSConcreteStackBlock;
      v55[1] = 3221225472;
      v55[2] = sub_100555108;
      v55[3] = &unk_1011BAEB0;
      v57 = v24;
      v28 = v28;
      v56 = v28;
      v32 = objc_msgSend(v28, "_maps_convertToNavigableRouteWithTraits:errorHandler:completionHandler:", v31, &stru_1011BAE88, v55);

      v18 = v30;
      v15 = 0;

    }
    goto LABEL_37;
  }
  if (!v15)
  {
    v28 = (id)objc_claimAutoreleasedReturnValue(+[IPCServer sharedServer](IPCServer, "sharedServer"));
    objc_msgSend(v28, "navigationStateDidChangeTo:reason:", 3, CFSTR("No routes available"));
    goto LABEL_37;
  }
  v50 = v24;
  if (v18)
  {
    *(_QWORD *)buf = 0;
    v62 = 0;
    objc_msgSend(v18, "getBytes:length:", buf, objc_msgSend(v18, "length"));
    v33 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", buf);
    v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "routes"));
    v49 = v14;
    v35 = v9;
    v36 = v23;
    v37 = v15;
    v38 = v18;
    v39 = (void *)v34;
    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472;
    v53[2] = sub_100555208;
    v53[3] = &unk_1011B1A50;
    v54 = v33;
    v40 = v33;
    v41 = (uint64_t)objc_msgSend(v39, "indexOfObjectPassingTest:", v53);

    v18 = v38;
    v15 = v37;
    v23 = v36;
    v9 = v35;
    v14 = v49;

    if (v41 != 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_30;
  }
  if (self->_lastPrepareNavigationMessage
    && (objc_msgSend(v22, "matchesLoadDirectionsMessage:") & 1) == 0)
  {
    v42 = sub_1005548E4();
    v43 = objc_claimAutoreleasedReturnValue(v42);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "This IPC request is not the same as the last Siri/Watch request we got, so we fail.", buf, 2u);
    }

    v44 = (void *)objc_claimAutoreleasedReturnValue(+[IPCServer sharedServer](IPCServer, "sharedServer"));
    objc_msgSend(v44, "navigationStateDidChangeTo:reason:", 2, CFSTR("Request to start navigation doesn't match prepared directions."));

  }
  v41 = 0x7FFFFFFFFFFFFFFFLL;
  if (v51 == (id)0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_30;
  v45 = v18;
  v41 = (uint64_t)v51;
  if (v51 >= objc_msgSend(v15, "count"))
  {
    v41 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_30:
    v45 = v18;
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[IPCServer sharedServer](IPCServer, "sharedServer", v49));
    objc_msgSend(v46, "navigationStateDidChangeTo:reason:", 2, CFSTR("Requested route index not found in prepared directions."));

  }
  if (v41 == 0x7FFFFFFFFFFFFFFFLL)
    v41 = (uint64_t)objc_msgSend(v15, "currentRouteIndex");
  objc_msgSend(v14, "setSelectedRouteIndex:forTransportType:", v41, objc_msgSend(v14, "currentTransportType", v49));
  v47 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "currentRouteCollection"));
  v18 = v45;
  if (v47)
  {
    v28 = (id)v47;
    v24 = v50;
    ((void (*)(_QWORD *, uint64_t))v50[2])(v50, v47);
  }
  else
  {
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[IPCServer sharedServer](IPCServer, "sharedServer"));
    objc_msgSend(v48, "navigationStateDidChangeTo:reason:", 2, CFSTR("No route collection to navigate"));

    v28 = 0;
    v24 = v50;
  }
LABEL_37:

}

- (void)updateWithGuidance:(id)a3
{
  NavigationIdleTimerProvider *navigationIdleTimerProvider;
  id v5;

  navigationIdleTimerProvider = self->_navigationIdleTimerProvider;
  v5 = a3;
  -[NavigationIdleTimerProvider updateGuidanceState:](navigationIdleTimerProvider, "updateGuidanceState:", v5);
  -[NavigationIdleTimerProvider updateGuidanceState:](self->_transitIdleTimerProvider, "updateGuidanceState:", v5);

}

- (void)endBackgroundNavigation
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  v3 = sub_1005548E4();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Will end background navigation", v8, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppDelegate appSessionController](self, "appSessionController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentlyNavigatingPlatformController"));
  objc_msgSend(v6, "clearSessions");

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  -[MapsAppDelegate endTurnByTurn:](self, "endTurnByTurn:", v7);

}

- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5
{
  id v6;
  void (**v7)(id, uint64_t);
  void *v8;
  unsigned __int8 v9;
  id v10;
  NSObject *v11;
  _BOOL4 v12;
  uint64_t v13;
  int v14;
  id v15;

  v6 = a4;
  v7 = (void (**)(id, uint64_t))a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "request"));
  v9 = objc_msgSend(v8, "shouldShowIfAppInForeground");

  v10 = sub_100431ABC();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
  if ((v9 & 1) != 0)
  {
    if (v12)
    {
      v14 = 138412290;
      v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Will present notification - %@", (uint8_t *)&v14, 0xCu);
    }
    v13 = 6;
  }
  else
  {
    if (v12)
    {
      v14 = 138412290;
      v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Skipping showing notification since app in FG - %@", (uint8_t *)&v14, 0xCu);
    }
    v13 = 0;
  }

  v7[2](v7, v13);
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a4;
  v5 = a3;
  if (v5)
  {
    v14 = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "presentingViewController"));

    v5 = v14;
    if (!v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication _maps_keyMapsWindow](UIApplication, "_maps_keyMapsWindow"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "rootViewController"));

      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "presentedViewController"));
      if (v9)
      {
        do
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "presentedViewController"));

          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "presentedViewController"));
          v8 = v10;
        }
        while (v11);
      }
      else
      {
        v10 = v8;
      }
      if (objc_msgSend(v10, "isViewLoaded"))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "view"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "window"));

        if (v13)
        {
          objc_msgSend(v14, "setModalPresentationStyle:", 2);
          objc_msgSend(v10, "presentViewController:animated:completion:", v14, v4, 0);
        }
      }

      v5 = v14;
    }
  }

}

- (NSArray)allVisibleMapViews
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  char isKindOfClass;
  void *v15;
  void *v16;
  void *v17;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "connectedScenes"));

  v19 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v3, "count")));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v21;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v8);
        v10 = objc_opt_class(UIWindowScene);
        if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
        {
          v11 = v9;
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "delegate"));
          v13 = objc_opt_class(MapsSceneDelegate);
          isKindOfClass = objc_opt_isKindOfClass(v12, v13);

          if ((isKindOfClass & 1) != 0)
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "delegate"));
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "chromeViewController"));
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "mapView"));
            objc_msgSend(v19, "addObject:", v17);

          }
        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v6);
  }

  return (NSArray *)v19;
}

- (NSArray)allVisibleMapViewsButNotCarPlay
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppDelegate allVisibleMapViews](self, "allVisibleMapViews"));
  v3 = objc_msgSend(v2, "mutableCopy");

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "chromeViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mapView"));

  objc_msgSend(v3, "removeObject:", v6);
  return (NSArray *)v3;
}

- (id)visibleMapViewFromCarPlay
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "chromeViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mapView"));

  return v4;
}

- (id)sceneDelegateForTesting
{
  id v2;
  void *v3;

  if (+[UIApplication _maps_isAnyCarPlayApplicationSceneForeground](UIApplication, "_maps_isAnyCarPlayApplicationSceneForeground"))
  {
    v2 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication _maps_carPlayApplicationSceneDelegate](UIApplication, "_maps_carPlayApplicationSceneDelegate"));
    if ((objc_msgSend(v2, "conformsToProtocol:", &OBJC_PROTOCOL___PPTTestableProtocol) & 1) != 0)
      return v2;

  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication _maps_keyMapsSceneDelegate](UIApplication, "_maps_keyMapsSceneDelegate"));
  if (objc_msgSend(v3, "conformsToProtocol:", &OBJC_PROTOCOL___PPTTestableProtocol))
    v2 = v3;
  else
    v2 = 0;

  return v2;
}

- (id)mainVKMapView
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppDelegate sceneDelegateForTesting](self, "sceneDelegateForTesting"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "chromeViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mapView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_mapLayer"));

  return v5;
}

- (id)testCoordinator
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppDelegate sceneDelegateForTesting](self, "sceneDelegateForTesting"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "testCoordinator"));

  return v3;
}

- (void)buildMenuWithBuilder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v10;
  void *v11;
  _BOOL8 v12;
  id v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "system"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenuSystem mainSystem](UIMenuSystem, "mainSystem"));

  v6 = v16;
  if (v4 == v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    v8 = sub_1002A8AA0(v7);

    if (!self->_didSkipInitialUIKitBuildMenuCall && v8 == 5)
      goto LABEL_11;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppDelegate chromeViewController](self, "chromeViewController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "currentShareItemSource"));

    v12 = 0;
    if (v8 == 5)
    {
      v13 = v16;
      if (!v11)
      {
LABEL_10:
        +[MapsMenuBuilder buildMenuWithBuilder:sendToDeviceEnabled:](MapsMenuBuilder, "buildMenuWithBuilder:sendToDeviceEnabled:", v13, v12);

LABEL_11:
        self->_didSkipInitialUIKitBuildMenuCall = 1;
        v6 = v16;
        goto LABEL_12;
      }
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppDelegate chromeViewController](self, "chromeViewController", v16));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "currentCollectionShareItemSource"));
      v12 = v15 == 0;

    }
    v13 = v16;
    goto LABEL_10;
  }
LABEL_12:

}

- (Class)appKitBundleClass
{
  return 0;
}

- (id)loadAppKitBundle
{
  return 0;
}

- (void)presentMacPreferencesTabWithType:(int64_t)a3
{
  switch(a3)
  {
    case 2:
      -[MapsAppDelegate presentMacARPPreferences](self, "presentMacARPPreferences");
      break;
    case 1:
      -[MapsAppDelegate presentMacRoutePlannerPreferences](self, "presentMacRoutePlannerPreferences");
      break;
    case 0:
      -[MapsAppDelegate presentMacGeneralPreferences](self, "presentMacGeneralPreferences");
      break;
  }
}

- (void)presentMacGeneralPreferences
{
  -[MapsAppDelegate presentPreferences](self, "presentPreferences");
}

- (void)presentMacRoutePlannerPreferences
{
  -[MapsAppDelegate presentPreferences](self, "presentPreferences");
}

- (void)presentMacARPPreferences
{
  -[MapsAppDelegate presentPreferences](self, "presentPreferences");
}

- (void)preferencesPrivacyControllerDidDismiss:(id)a3
{
  AppKitPreferencesPrivacyController *privacyController;

  privacyController = self->_privacyController;
  self->_privacyController = 0;

}

- (void)fetchNotificationAuthUndetermined:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UNUserNotificationCenter currentNotificationCenter](UNUserNotificationCenter, "currentNotificationCenter"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100555B9C;
  v6[3] = &unk_1011BAED8;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "getNotificationSettingsWithCompletionHandler:", v6);

}

- (void)notificationButtonPressedWithCompletionHandler:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UNUserNotificationCenter currentNotificationCenter](UNUserNotificationCenter, "currentNotificationCenter"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100555CEC;
  v6[3] = &unk_1011BAED8;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "getNotificationSettingsWithCompletionHandler:", v6);

}

- (void)presentRatingsAndPhotosPrivacyScreen
{
  AppKitPreferencesPrivacyController *v3;
  AppKitPreferencesPrivacyController *privacyController;
  uint8_t v5[16];

  if (self->_privacyController)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Assertion failed: _privacyController == ((void *)0)", v5, 2u);
    }
  }
  else
  {
    v3 = -[AppKitPreferencesPrivacyController initWithBundleIdentifier:]([AppKitPreferencesPrivacyController alloc], "initWithBundleIdentifier:", CFSTR("com.apple.onboarding.ratingsAndPhotos"));
    privacyController = self->_privacyController;
    self->_privacyController = v3;

    -[AppKitPreferencesPrivacyController setDelegate:](self->_privacyController, "setDelegate:", self);
    -[AppKitPreferencesPrivacyController present](self->_privacyController, "present");
  }
}

- (void)presentAboutAndPrivacyScreen
{
  AppKitPreferencesPrivacyController *v3;
  AppKitPreferencesPrivacyController *privacyController;
  uint8_t v5[16];

  if (self->_privacyController)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Assertion failed: _privacyController == ((void *)0)", v5, 2u);
    }
  }
  else
  {
    v3 = -[AppKitPreferencesPrivacyController initWithBundleIdentifier:]([AppKitPreferencesPrivacyController alloc], "initWithBundleIdentifier:", CFSTR("com.apple.onboarding.maps"));
    privacyController = self->_privacyController;
    self->_privacyController = v3;

    -[AppKitPreferencesPrivacyController setDelegate:](self->_privacyController, "setDelegate:", self);
    -[AppKitPreferencesPrivacyController present](self->_privacyController, "present");
  }
}

- (void)appkitBundleSetUseLargeLabels:(BOOL)a3
{
  GEOConfigSetInteger(MapKitConfig_MapTextSize[0], MapKitConfig_MapTextSize[1], a3);
}

- (BOOL)useLargeLabelsPreferenceForAppkitBundle
{
  return GEOConfigGetInteger(MapKitConfig_MapTextSize[0], MapKitConfig_MapTextSize[1]) == 1;
}

- (id)photoAttributionPreferencesManager
{
  return +[UGCPhotoAttributionPreferencesManager sharedManager](UGCPhotoAttributionPreferencesManager, "sharedManager");
}

- (void)setAppSessionController:(id)a3
{
  objc_storeStrong((id *)&self->_appSessionController, a3);
}

- (void)setIdleTimerController:(id)a3
{
  objc_storeStrong((id *)&self->_idleTimerController, a3);
}

- (unint64_t)lockedOrientations
{
  return self->_lockedOrientations;
}

- (void)setLockedOrientations:(unint64_t)a3
{
  self->_lockedOrientations = a3;
}

- (BOOL)isCoreRoutineEnabled
{
  return self->_coreRoutineEnabled;
}

- (BKSProcessAssertion)priorityAssertion
{
  return self->_priorityAssertion;
}

- (void)setPriorityAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_priorityAssertion, a3);
}

- (SiriNavStatusUpdater)siriNavStatusUpdater
{
  return self->_siriNavStatusUpdater;
}

- (void)setSiriNavStatusUpdater:(id)a3
{
  objc_storeStrong((id *)&self->_siriNavStatusUpdater, a3);
}

- (MapsDistanceUnitUpdater)distanceUnitUpdater
{
  return self->_distanceUnitUpdater;
}

- (void)setDistanceUnitUpdater:(id)a3
{
  objc_storeStrong((id *)&self->_distanceUnitUpdater, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_distanceUnitUpdater, 0);
  objc_storeStrong((id *)&self->_siriNavStatusUpdater, 0);
  objc_storeStrong((id *)&self->_priorityAssertion, 0);
  objc_storeStrong((id *)&self->_idleTimerController, 0);
  objc_storeStrong((id *)&self->_appSessionController, 0);
  objc_storeStrong((id *)&self->_submissionManager, 0);
  objc_storeStrong((id *)&self->_secureAppAssertion, 0);
  objc_storeStrong((id *)&self->_doubleHeightStatusBarAssertion, 0);
  objc_storeStrong((id *)&self->_thermalWarningController, 0);
  objc_storeStrong((id *)&self->_transitIdleTimerProvider, 0);
  objc_storeStrong((id *)&self->_navigationIdleTimerProvider, 0);
  objc_storeStrong((id *)&self->_lastPrepareNavigationMessage, 0);
  objc_storeStrong((id *)&self->_privacyController, 0);
  objc_storeStrong((id *)&self->_placeholderGridCache, 0);
  objc_storeStrong((id *)&self->_carDisplayController, 0);
  objc_storeStrong((id *)&self->_poiSearchManager, 0);
  objc_storeStrong((id *)&self->_foregroundDataActivationPopupAssertion, 0);
  objc_storeStrong((id *)&self->_navigatorDataActivationPopupAssertion, 0);
}

- (id)_currentInterruptionHandle
{
  return objc_getAssociatedObject(self, &unk_1014D3A28);
}

- (void)_setCurrentInterruptionHandle:(id)a3
{
  id v4;
  NSString *v5;
  void *v6;
  NSString *v7;
  id v8;

  v4 = a3;
  v5 = NSStringFromSelector("_currentInterruptionHandle");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  -[MapsAppDelegate willChangeValueForKey:](self, "willChangeValueForKey:", v6);

  objc_setAssociatedObject(self, &unk_1014D3A28, v4, (void *)1);
  v7 = NSStringFromSelector("_currentInterruptionHandle");
  v8 = (id)objc_claimAutoreleasedReturnValue(v7);
  -[MapsAppDelegate didChangeValueForKey:](self, "didChangeValueForKey:", v8);

}

- (BOOL)_isShowingLocationServicesAuthorizationPrompt
{
  id AssociatedObject;
  void *v3;
  uint64_t v4;
  void *v5;
  unsigned int v6;
  id v7;
  NSObject *v8;
  const __CFString *v9;
  int v11;
  const __CFString *v12;

  AssociatedObject = objc_getAssociatedObject(self, &unk_1014D3A29);
  v3 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  v4 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    v5 = v3;
  else
    v5 = 0;
  v6 = objc_msgSend(v5, "BOOLValue");
  v7 = sub_100949148();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = CFSTR("NO");
    if (v6)
      v9 = CFSTR("YES");
    if (!v5)
      v9 = CFSTR("nil");
    v11 = 138412290;
    v12 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Current value of kIsShowingLocationServicesAuthorizationPromptKey => %@", (uint8_t *)&v11, 0xCu);
  }

  return v6;
}

- (void)_setShowingLocationServicesAuthorizationPrompt:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  id v9;
  NSObject *v10;
  const __CFString *v11;
  void *v12;
  int v13;
  const __CFString *v14;

  v3 = a3;
  v5 = sub_100949148();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v7)
    {
      LOWORD(v13) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Will start observing LocationAuthorizationDismissedNotification", (uint8_t *)&v13, 2u);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v8, "addObserver:selector:name:object:", self, "_locationAuthorizationDismissed:", CFSTR("LocationAuthorizationDismissedNotification"), 0);
  }
  else
  {
    if (v7)
    {
      LOWORD(v13) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Will stop observing LocationAuthorizationDismissedNotification", (uint8_t *)&v13, 2u);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v8, "removeObserver:name:object:", self, CFSTR("LocationAuthorizationDismissedNotification"), 0);
  }

  v9 = sub_100949148();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = CFSTR("NO");
    if (v3)
      v11 = CFSTR("YES");
    v13 = 138412290;
    v14 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Setting value of kIsShowingLocationServicesAuthorizationPromptKey to %@", (uint8_t *)&v13, 0xCu);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v3));
  objc_setAssociatedObject(self, &unk_1014D3A29, v12, (void *)1);

}

- (void)_locationAuthorizationDismissed:(id)a3
{
  -[MapsAppDelegate _setShowingLocationServicesAuthorizationPrompt:](self, "_setShowingLocationServicesAuthorizationPrompt:", 0);
}

- (int64_t)currentInterruptionKind
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppDelegate _currentInterruptionHandle](self, "_currentInterruptionHandle"));
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "interruptionKind");
  else
    v4 = 0;

  return (int64_t)v4;
}

- (void)dismissCurrentInterruption
{
  id v3;
  NSObject *v4;
  int64_t v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  const __CFString *v16;

  v3 = sub_100949148();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = -[MapsAppDelegate currentInterruptionKind](self, "currentInterruptionKind");
    if ((unint64_t)(v5 - 1) > 0x16)
      v6 = CFSTR("kMapsInterruptionNone");
    else
      v6 = *(&off_1011DC8E0 + v5 - 1);
    *(_DWORD *)buf = 138412290;
    v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Dismissing the current interruption with kind: %@", buf, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppDelegate _currentInterruptionHandle](self, "_currentInterruptionHandle"));
  v8 = v7;
  if (v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dismissalBlock"));
    v10 = objc_msgSend(v9, "copy");

    if (v10)
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100949554;
      v13[3] = &unk_1011ADA00;
      v14 = v10;
      +[UIViewController _performWithoutDeferringTransitions:](UIViewController, "_performWithoutDeferringTransitions:", v13);

    }
    -[MapsAppDelegate _setCurrentInterruptionHandle:](self, "_setCurrentInterruptionHandle:", 0);
    -[MapsAppDelegate _setShowingLocationServicesAuthorizationPrompt:](self, "_setShowingLocationServicesAuthorizationPrompt:", 0);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  if (objc_msgSend(v11, "isChromeAvailable"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "chromeViewController"));
    objc_msgSend(v12, "dismissInterruption");

  }
}

- (BOOL)dismissCurrentInterruptionOfKind:(int64_t)a3
{
  int64_t v5;

  v5 = -[MapsAppDelegate currentInterruptionKind](self, "currentInterruptionKind");
  if (v5 == a3)
    -[MapsAppDelegate dismissCurrentInterruption](self, "dismissCurrentInterruption");
  return v5 == a3;
}

- (void)interruptApplicationWithKind:(int64_t)a3 userInfo:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  MapsAppDelegate *v10;
  MapsAppDelegate *v11;
  objc_class *v12;
  NSString *v13;
  void *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  const __CFString *v18;
  DismissalHandle *v19;
  DismissalHandle *v20;
  InterruptionHandle *v21;
  void *v22;
  InterruptionHandle *v23;
  DismissalHandle *v24;
  DismissalHandle *v25;
  DismissalHandle *v26;
  DismissalHandle *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  _QWORD *v33;
  id v34;
  NSObject *v35;
  MapsAppDelegate *v36;
  MapsAppDelegate *v37;
  objc_class *v38;
  NSString *v39;
  void *v40;
  void *v41;
  void *v42;
  __CFString *v43;
  id v44;
  NSObject *v45;
  MapsAppDelegate *v46;
  MapsAppDelegate *v47;
  objc_class *v48;
  NSString *v49;
  void *v50;
  void *v51;
  void *v52;
  __CFString *v53;
  void *v54;
  __CFString *v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  DismissalHandle *v60;
  _QWORD *v61;
  void *v62;
  id v63;
  id v64;
  id v66;
  _QWORD v67[4];
  DismissalHandle *v68;
  _BYTE *v69;
  _QWORD v70[4];
  NSObject *v71;
  _BYTE *v72;
  _QWORD v73[4];
  DismissalHandle *v74;
  DismissalHandle *v75;
  _BYTE *v76;
  _QWORD v77[5];
  InterruptionHandle *v78;
  id v79;
  DismissalHandle *v80;
  DismissalHandle *v81;
  id v82;
  _QWORD *v83;
  _QWORD v84[3];
  char v85;
  uint8_t v86[4];
  __CFString *v87;
  __int16 v88;
  id v89;
  __int16 v90;
  void *v91;
  _BYTE buf[24];
  id (*v93)(uint64_t, uint64_t);
  void (*v94)(uint64_t);
  _QWORD *v95;

  v66 = a4;
  v7 = a5;
  v8 = sub_100949148();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    goto LABEL_14;
  v10 = self;
  v11 = v10;
  if (!v10)
  {
    v17 = CFSTR("<nil>");
    goto LABEL_10;
  }
  v12 = (objc_class *)objc_opt_class(v10);
  v13 = NSStringFromClass(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  if ((objc_opt_respondsToSelector(v11, "accessibilityIdentifier") & 1) != 0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppDelegate performSelector:](v11, "performSelector:", "accessibilityIdentifier"));
    v16 = v15;
    if (v15 && !objc_msgSend(v15, "isEqualToString:", v14))
    {
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v14, v11, v16));

      goto LABEL_8;
    }

  }
  v17 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v14, v11));
LABEL_8:

LABEL_10:
  if ((unint64_t)(a3 - 1) > 0x16)
    v18 = CFSTR("kMapsInterruptionNone");
  else
    v18 = *(&off_1011DC8E0 + a3 - 1);
  *(_DWORD *)buf = 138543618;
  *(_QWORD *)&buf[4] = v17;
  *(_WORD *)&buf[12] = 2112;
  *(_QWORD *)&buf[14] = v18;
  _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Showing interrupt with kind: %@", buf, 0x16u);

LABEL_14:
  v84[0] = 0;
  v84[1] = v84;
  v84[2] = 0x2020000000;
  v85 = 0;
  v19 = objc_alloc_init(DismissalHandle);
  v20 = objc_alloc_init(DismissalHandle);
  v21 = objc_alloc_init(InterruptionHandle);
  -[InterruptionHandle setInterruptionKind:](v21, "setInterruptionKind:", a3);
  -[MapsAppDelegate _setCurrentInterruptionHandle:](self, "_setCurrentInterruptionHandle:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "objectForKeyedSubscript:", CFSTR("kMapsInterruptionActions")));
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v93 = sub_100949DB0;
  v94 = sub_100949DD8;
  v77[0] = _NSConcreteStackBlock;
  v77[1] = 3221225472;
  v77[2] = sub_100949DE0;
  v77[3] = &unk_1011DC800;
  v77[4] = self;
  v23 = v21;
  v78 = v23;
  v83 = v84;
  v64 = v22;
  v79 = v64;
  v63 = v7;
  v82 = v63;
  v24 = v20;
  v80 = v24;
  v25 = v19;
  v81 = v25;
  v95 = objc_retainBlock(v77);
  v73[0] = _NSConcreteStackBlock;
  v73[1] = 3221225472;
  v73[2] = sub_100949EBC;
  v73[3] = &unk_1011DC828;
  v26 = v25;
  v74 = v26;
  v27 = v24;
  v75 = v27;
  v76 = buf;
  -[DismissalHandle setDismissalBlock:](v23, "setDismissalBlock:", v73);
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "chromeViewController"));

  v30 = objc_opt_class(IOSBasedChromeViewController);
  if ((objc_opt_isKindOfClass(v29, v30) & 1) != 0)
    v31 = v29;
  else
    v31 = 0;
  v32 = v31;

  if (v32)
  {
    v70[0] = _NSConcreteStackBlock;
    v70[1] = 3221225472;
    v70[2] = sub_100949F74;
    v70[3] = &unk_1011DC850;
    v71 = v27;
    v72 = buf;
    v33 = objc_retainBlock(v70);
    v34 = sub_100949148();
    v35 = objc_claimAutoreleasedReturnValue(v34);
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
LABEL_36:

      v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "presentInterruptionOfKind:userInfo:completionHandler:", a3, v66, v33));
      -[DismissalHandle setDismissalBlock:](v26, "setDismissalBlock:", v54);

      v45 = v71;
      goto LABEL_39;
    }
    v36 = self;
    v37 = v36;
    if (!v36)
    {
      v43 = CFSTR("<nil>");
      goto LABEL_35;
    }
    v38 = (objc_class *)objc_opt_class(v36);
    v39 = NSStringFromClass(v38);
    v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
    if ((objc_opt_respondsToSelector(v37, "accessibilityIdentifier") & 1) != 0)
    {
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppDelegate performSelector:](v37, "performSelector:", "accessibilityIdentifier"));
      v42 = v41;
      if (v41 && (objc_msgSend(v41, "isEqualToString:", v40) & 1) == 0)
      {
        v43 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v40, v37, v42));

        goto LABEL_25;
      }

    }
    v43 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v40, v37));
LABEL_25:

LABEL_35:
    *(_DWORD *)v86 = 138543362;
    v87 = v43;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "[%{public}@] Showing interruption on iOS", v86, 0xCu);

    goto LABEL_36;
  }
  v44 = sub_100949148();
  v45 = objc_claimAutoreleasedReturnValue(v44);
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    v46 = self;
    v47 = v46;
    if (!v46)
    {
      v53 = CFSTR("<nil>");
      goto LABEL_38;
    }
    v48 = (objc_class *)objc_opt_class(v46);
    v49 = NSStringFromClass(v48);
    v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
    if ((objc_opt_respondsToSelector(v47, "accessibilityIdentifier") & 1) != 0)
    {
      v51 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppDelegate performSelector:](v47, "performSelector:", "accessibilityIdentifier"));
      v52 = v51;
      if (v51 && (objc_msgSend(v51, "isEqualToString:", v50) & 1) == 0)
      {
        v53 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v50, v47, v52));

        goto LABEL_33;
      }

    }
    v53 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v50, v47));
LABEL_33:

LABEL_38:
    v55 = v53;
    v56 = (id)objc_claimAutoreleasedReturnValue(-[MapsAppDelegate appSessionController](v47, "appSessionController"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppDelegate appSessionController](v47, "appSessionController"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "primaryPlatformController"));
    *(_DWORD *)v86 = 138543874;
    v87 = v55;
    v88 = 2112;
    v89 = v56;
    v90 = 2112;
    v91 = v58;
    _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "[%{public}@] Will NOT show interrupt on iOS; appSessionController: %@; primaryPlatformController: %@",
      v86,
      0x20u);

  }
LABEL_39:

  v59 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v67[0] = _NSConcreteStackBlock;
  v67[1] = 3221225472;
  v67[2] = sub_100949FFC;
  v67[3] = &unk_1011DC850;
  v60 = v26;
  v68 = v60;
  v69 = buf;
  v61 = objc_retainBlock(v67);
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "presentInterruptionOfKind:userInfo:completionHandler:", a3, v66, v61));
  -[DismissalHandle setDismissalBlock:](v27, "setDismissalBlock:", v62);

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(v84, 8);

}

- (void)showLocationServicesAlertWithError:(id)a3
{
  id v4;
  id AssociatedObject;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];

  v4 = a3;
  AssociatedObject = objc_getAssociatedObject(self, off_1014B7A00);
  v6 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  v7 = objc_msgSend(v6, "BOOLValue");

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "domain"));
  v9 = objc_msgSend(v8, "isEqualToString:", MKLocationErrorDomain);

  if (v9 && (v7 & 1) == 0)
  {
    objc_setAssociatedObject(self, off_1014B7A00, &__kCFBooleanTrue, (void *)3);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("LocationServiceAlert_Title"), CFSTR("localized string not found"), 0));

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v13 = v12;
    if (v11)
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, CFSTR("kMapsInterruptionTitle"));
    if (v4)
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v4, CFSTR("kMapsInterruptionError"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10094A1F8;
    v14[3] = &unk_1011AFA20;
    v14[4] = self;
    -[MapsAppDelegate interruptApplicationWithKind:userInfo:completionHandler:](self, "interruptApplicationWithKind:userInfo:completionHandler:", 6, v13, v14);

  }
}

- (void)promptLocationServicesAuthorizationWithHandler:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  const __CFString *v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  const __CFString *v11;

  v4 = a3;
  v5 = sub_100949148();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("handler");
    if (!v4)
      v7 = CFSTR("no handler");
    *(_DWORD *)buf = 138412290;
    v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Showing Location Services Authorization Prompt with %@", buf, 0xCu);
  }

  if (!-[MapsAppDelegate _isShowingLocationServicesAuthorizationPrompt](self, "_isShowingLocationServicesAuthorizationPrompt"))
  {
    -[MapsAppDelegate _setShowingLocationServicesAuthorizationPrompt:](self, "_setShowingLocationServicesAuthorizationPrompt:", 1);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10094A348;
    v8[3] = &unk_1011DB340;
    v9 = v4;
    -[MapsAppDelegate interruptApplicationWithKind:userInfo:completionHandler:](self, "interruptApplicationWithKind:userInfo:completionHandler:", 5, 0, v8);

  }
}

- (void)_locationManagerApprovalDidChange:(id)a3
{
  id AssociatedObject;
  void *v5;
  void *v6;
  unsigned int v7;
  id v8;
  void *v9;
  unsigned int v10;
  void *v11;
  unsigned int v12;
  id v13;
  void *v14;
  unsigned int v15;
  id v16;

  AssociatedObject = objc_getAssociatedObject(self, off_1014B7A68);
  v5 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  if (v5)
  {
    v16 = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
    v7 = objc_msgSend(v6, "isLocationServicesApproved");

    v8 = objc_getAssociatedObject(self, off_1014B7A70);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = objc_msgSend(v9, "BOOLValue");

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
    v12 = objc_msgSend(v11, "isAuthorizedForPreciseLocation");

    v13 = objc_getAssociatedObject(self, off_1014B7A78);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = objc_msgSend(v14, "BOOLValue");

    v5 = v16;
    if (v7 != v10 || v12 != v15)
    {
      objc_msgSend(v16, "dismissViewControllerAnimated:completion:", 1, 0);
      -[MapsAppDelegate _cleanupAfterLocationServicesAlertController](self, "_cleanupAfterLocationServicesAlertController");
      v5 = v16;
    }
  }

}

- (void)_cleanupAfterLocationServicesAlertController
{
  id v3;

  objc_setAssociatedObject(self, off_1014B7A68, 0, (void *)1);
  objc_setAssociatedObject(self, off_1014B7A70, 0, (void *)3);
  objc_setAssociatedObject(self, off_1014B7A78, 0, (void *)3);
  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, MKLocationManagerApprovalDidChangeNotification, 0);

}

- (void)_presentLocationServicesAlertController:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  const void *v9;
  void *v10;
  const void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  v6 = objc_msgSend(v5, "isLocationServicesApproved");

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  v8 = objc_msgSend(v7, "isAuthorizedForPreciseLocation");

  objc_setAssociatedObject(self, off_1014B7A68, v4, (void *)1);
  v9 = off_1014B7A70;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v6));
  objc_setAssociatedObject(self, v9, v10, (void *)3);

  v11 = off_1014B7A78;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v8));
  objc_setAssociatedObject(self, v11, v12, (void *)3);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v13, "addObserver:selector:name:object:", self, "_locationManagerApprovalDidChange:", MKLocationManagerApprovalDidChangeNotification, 0);

  v14 = (id)objc_claimAutoreleasedReturnValue(-[MapsAppDelegate chromeViewController](self, "chromeViewController"));
  objc_msgSend(v14, "_maps_topMostPresentViewController:animated:completion:", v4, 1, 0);

}

- (void)promptLocationServicesOff
{
  void *v3;
  unsigned __int8 v4;
  uint64_t v5;
  void *v6;
  unsigned __int8 v7;
  id v8;
  void *v9;
  _BOOL4 v10;
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
  id v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  int v27;
  _QWORD v28[4];
  id v29;
  id v30;
  int v31;
  id location;
  id v33[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  v4 = objc_msgSend(v3, "isLocationServicesAuthorizationNeeded");

  if ((v4 & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
    v33[0] = 0;
    v7 = objc_msgSend(v6, "isLocationServicesPossiblyAvailable:", v33);
    v8 = v33[0];

    v24 = v8;
    if ((v7 & 1) == 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "domain"));
      if (objc_msgSend(v9, "isEqualToString:", MKLocationErrorDomain))
      {
        v10 = objc_msgSend(v8, "code") != 0;

        v5 = 2 * v10;
        goto LABEL_8;
      }

    }
    v5 = 2;
    goto LABEL_8;
  }
  v5 = 0;
  v24 = 0;
LABEL_8:
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", MKLocationErrorDomain, v5, 0));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Maps works best with Location Services turned on."), CFSTR("localized string not found"), 0));

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("You'll get turn-by-turn directions, estimated travel times, and improved search results when you turn on Location Services for Maps."), CFSTR("localized string not found"), 0));

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("Turn On in Settings"), CFSTR("localized string not found"), 0));

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("Keep Location Services Off"), CFSTR("localized string not found"), 0));

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v13, v15, 1));
  objc_initWeak(&location, self);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10094AA2C;
  v28[3] = &unk_1011DC878;
  objc_copyWeak(&v30, &location);
  v31 = 0;
  v21 = v11;
  v29 = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v17, 0, v28));
  objc_msgSend(v20, "addAction:", v22);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10094AAD0;
  v25[3] = &unk_1011DC8A0;
  objc_copyWeak(&v26, &location);
  v27 = 0;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v19, 0, v25));
  objc_msgSend(v20, "addAction:", v23);
  -[MapsAppDelegate _presentLocationServicesAlertController:](self, "_presentLocationServicesAlertController:", v20);

  objc_destroyWeak(&v26);
  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);

}

- (void)promptPreciseLocationOff
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  MapsAppDelegate *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  int v24;
  _QWORD v25[4];
  id v26;
  id v27;
  int v28;
  _QWORD v29[4];
  id v30;
  id location[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", MKLocationErrorDomain, 6, 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Maps works best with your precise location."), CFSTR("localized string not found"), 0));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("You'll get turn-by-turn directions, estimated travel times, and improved search results when you allow Maps to use your precise location."), CFSTR("localized string not found"), 0));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Turn On in Settings"), CFSTR("localized string not found"), 0));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Keep Precise Off"), CFSTR("localized string not found"), 0));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v5, v7, 1));
  v20 = self;
  objc_initWeak(location, self);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Allow Once"), CFSTR("localized string not found"), 0));
  v18 = (void *)v7;
  v19 = (void *)v5;

  if (v13)
  {
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10094AEF8;
    v29[3] = &unk_1011AFA88;
    objc_copyWeak(&v30, location);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v13, 0, v29, v7, v5));
    objc_msgSend(v11, "addAction:", v14);
    objc_destroyWeak(&v30);
  }
  else
  {
    v14 = 0;
  }
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10094AF58;
  v25[3] = &unk_1011DC878;
  objc_copyWeak(&v27, location);
  v28 = 688;
  v15 = v3;
  v26 = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v21, 0, v25));
  objc_msgSend(v11, "addAction:", v16);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10094AFFC;
  v22[3] = &unk_1011DC8A0;
  objc_copyWeak(&v23, location);
  v24 = 688;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v10, 0, v22));
  objc_msgSend(v11, "addAction:", v17);
  -[MapsAppDelegate _presentLocationServicesAlertController:](v20, "_presentLocationServicesAlertController:", v11);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&v27);

  objc_destroyWeak(location);
}

- (void)showNavigationAdvisoryIfNeeded
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10094B0E0;
  block[3] = &unk_1011AC860;
  block[4] = self;
  if (qword_1014D3A30 != -1)
    dispatch_once(&qword_1014D3A30, block);
}

- (void)interruptConvertToNavigableSavedRouteID:(id)a3 routeName:(id)a4 error:(id)a5 directionsError:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  MapsAppDelegate *v16;
  MapsAppDelegate *v17;
  objc_class *v18;
  NSString *v19;
  void *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  NSMutableDictionary *v24;
  void *v25;
  unsigned int v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  _QWORD v40[4];
  id v41;
  uint8_t buf[4];
  __CFString *v43;
  __int16 v44;
  id v45;
  __int16 v46;
  id v47;
  __int16 v48;
  id v49;
  __int16 v50;
  id v51;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = sub_100949148();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    v16 = self;
    v17 = v16;
    if (!v16)
    {
      v23 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v18 = (objc_class *)objc_opt_class(v16);
    v19 = NSStringFromClass(v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    if ((objc_opt_respondsToSelector(v17, "accessibilityIdentifier") & 1) != 0)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppDelegate performSelector:](v17, "performSelector:", "accessibilityIdentifier"));
      v22 = v21;
      if (v21 && !objc_msgSend(v21, "isEqualToString:", v20))
      {
        v23 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v20, v17, v22));

        goto LABEL_8;
      }

    }
    v23 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v20, v17));
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138544386;
    v43 = v23;
    v44 = 2112;
    v45 = v11;
    v46 = 2114;
    v47 = v10;
    v48 = 2114;
    v49 = v12;
    v50 = 2114;
    v51 = v13;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "[%{public}@] interrupting navigable conversion for %@ (%{public}@) with error: %{public}@ directionsError: %{public}@", buf, 0x34u);

  }
  v24 = objc_opt_new(NSMutableDictionary);
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
  v26 = objc_msgSend(v25, "isUsingOfflineMaps");

  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v28 = v27;
  if (v26)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("[Interruption] Offline Custom Route Error Title"), CFSTR("localized string not found"), 0));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v24, "setObject:forKeyedSubscript:", v29, CFSTR("kMapsInterruptionTitle"));

    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("[Interruption] Offline Custom Route Error Message"), CFSTR("localized string not found"), 0));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v24, "setObject:forKeyedSubscript:", v31, CFSTR("kMapsInterruptionMessage"));

LABEL_17:
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppDelegate chromeViewController](self, "chromeViewController"));
    v37 = objc_msgSend(v36, "presentInterruptionOfKind:userInfo:completionHandler:", 3, v24, 0);
    goto LABEL_18;
  }
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("[Interruption] Generic Error Title"), CFSTR("localized string not found"), 0));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v24, "setObject:forKeyedSubscript:", v32, CFSTR("kMapsInterruptionTitle"));

  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("[Interruption] Generic Error Message"), CFSTR("localized string not found"), 0));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v24, "setObject:forKeyedSubscript:", v34, CFSTR("kMapsInterruptionMessage"));

  -[NSMutableDictionary setObject:forKeyedSubscript:](v24, "setObject:forKeyedSubscript:", v11, CFSTR("kMapsInterruptionRouteNameKey"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v24, "setObject:forKeyedSubscript:", v10, CFSTR("kMapsInterruptionRouteStorageIDKey"));
  if (!objc_msgSend(v13, "problemDetailsCount"))
    goto LABEL_17;
  v35 = 0;
  while (objc_msgSend(v13, "problemDetailAtIndex:", v35) != 8)
  {
    if (++v35 >= (unint64_t)objc_msgSend(v13, "problemDetailsCount"))
      goto LABEL_17;
  }
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppDelegate chromeViewController](self, "chromeViewController"));
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_10094B698;
  v40[3] = &unk_1011AFA20;
  v41 = v10;
  v39 = objc_msgSend(v38, "presentInterruptionOfKind:userInfo:completionHandler:", 22, v24, v40);

  v36 = v41;
LABEL_18:

}

+ (id)keyPathsForValuesAffectingValueForKey:(id)a3
{
  id v4;
  NSString *v5;
  void *v6;
  unsigned int v7;
  NSString *v8;
  void *v9;
  void *v10;
  id v11;
  objc_super v13;

  v4 = a3;
  v5 = NSStringFromSelector("currentInterruptionKind");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = objc_msgSend(v4, "isEqualToString:", v6);

  if (v7)
  {
    v8 = NSStringFromSelector("_currentInterruptionHandle");
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v9));

  }
  else
  {
    v13.receiver = a1;
    v13.super_class = (Class)&OBJC_METACLASS___MapsAppDelegate;
    v11 = objc_msgSendSuper2(&v13, "keyPathsForValuesAffectingValueForKey:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v11);
  }

  return v10;
}

- (void)presentRAP
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication _maps_keyMapsSceneDelegate](UIApplication, "_maps_keyMapsSceneDelegate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "rapPresenter"));
  objc_msgSend(v2, "presentReportAProblemWithCompletion:", 0);

}

- (void)presentAddAMissingPlace
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication _maps_keyMapsSceneDelegate](UIApplication, "_maps_keyMapsSceneDelegate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "rapPresenter"));
  objc_msgSend(v2, "presentAddAPlaceWithCompletion:", 0);

}

- (void)toggleSidebarSelection
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("SIDEBAR_SELECTION_ENABLED_KEY")));

  v5 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    v6 = objc_msgSend(v4, "BOOLValue") ^ 1;
  else
    v6 = 0;

  objc_msgSend(v2, "setBool:forKey:", v6, CFSTR("SIDEBAR_SELECTION_ENABLED_KEY"));
  exit(0);
}

- (void)toggleScrollingOpensPlacecard
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v3, "setBool:forKey:", objc_msgSend(v2, "BOOLForKey:", CFSTR("SCROLLING_OPENS_PLACECARD_KEY_ROTATED")) ^ 1, CFSTR("SCROLLING_OPENS_PLACECARD_KEY_ROTATED"));

}

- (void)toggleDisableMenuSharing
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v2, "setBool:forKey:", objc_msgSend(v3, "BOOLForKey:", CFSTR("MENU_SHARING_DISABLED_KEY")) ^ 1, CFSTR("MENU_SHARING_DISABLED_KEY"));

  exit(0);
}

- (void)presentRadar
{
  MapsRadarDraft *v3;
  void *v4;
  NSObject *v5;
  MapsAppDelegate *v6;
  MapsAppDelegate *v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  uint8_t buf[4];
  __CFString *v16;

  v3 = objc_opt_new(MapsRadarDraft);
  -[MapsRadarDraft setTitle:](v3, "setTitle:", CFSTR("[macOS]"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MapsRadarComponent mapsComponent](MapsRadarComponent, "mapsComponent"));
  -[MapsRadarDraft setComponent:](v3, "setComponent:", v4);

  if (qword_1014D3F38 != -1)
    dispatch_once(&qword_1014D3F38, &stru_1011E2360);
  v5 = (id)qword_1014D3F30;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = self;
    v7 = v6;
    if (!v6)
    {
      v13 = CFSTR("<nil>");
      goto LABEL_12;
    }
    v8 = (objc_class *)objc_opt_class(v6);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    if ((objc_opt_respondsToSelector(v7, "accessibilityIdentifier") & 1) != 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppDelegate performSelector:](v7, "performSelector:", "accessibilityIdentifier"));
      v12 = v11;
      if (v11 && !objc_msgSend(v11, "isEqualToString:", v10))
      {
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v10, v7, v12));

        goto LABEL_10;
      }

    }
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v10, v7));
LABEL_10:

LABEL_12:
    *(_DWORD *)buf = 138543362;
    v16 = v13;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Launching TTR", buf, 0xCu);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[MapsRadarController sharedInstance](MapsRadarController, "sharedInstance"));
  objc_msgSend(v14, "launchTTRWithRadar:", v3);

}

- (void)requestNewTab:(id)a3
{
  -[MapsAppDelegate newScene](self, "newScene", a3);
}

- (void)requestNewWindow:(id)a3
{
  -[MapsAppDelegate newScene](self, "newScene", a3);
}

- (void)newScene
{
  id v2;
  void *v3;
  id v4;

  v4 = objc_msgSend(objc_alloc((Class)NSUserActivity), "initWithActivityType:", CFSTR("com.apple.Maps.NewWindow"));
  objc_msgSend(v4, "setEligibleForHandoff:", 0);
  v2 = objc_alloc_init((Class)UISceneActivationRequestOptions);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  objc_msgSend(v3, "requestSceneSessionActivation:userActivity:options:errorHandler:", 0, v4, v2, 0);

}

- (void)presentAddAMissingPlaceWith:(id)a3
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication _maps_keyMapsSceneDelegate](UIApplication, "_maps_keyMapsSceneDelegate", a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rapPresenter"));
  objc_msgSend(v3, "presentAddAPlaceWithCompletion:", 0);

}

- (void)doPostLaunchTestSetup
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100BAAD68;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)setCurrentTest:(id)a3
{
  +[_MapsApplicationDelegateTestingCoordinator setCurrentTest:](_MapsApplicationDelegateTestingCoordinator, "setCurrentTest:", a3);
}

- (id)currentTest
{
  return +[_MapsApplicationDelegateTestingCoordinator currentTest](_MapsApplicationDelegateTestingCoordinator, "currentTest");
}

- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  BOOL v13;
  _QWORD v15[4];
  id v16;
  id v17;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  notify_post("com.apple.Maps.PPT.start");
  v10 = objc_msgSend(v9, "_mapstest_isUsingSampleProactiveData");
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100BAAEEC;
  v15[3] = &unk_1011E7D40;
  v16 = v7;
  v17 = v8;
  v11 = v8;
  v12 = v7;
  v13 = +[_MapsApplicationDelegateTestingCoordinator application:testName:options:shouldLoadSampleProactiveData:shouldRaiseExceptionIfNeeded:runTest:](_MapsApplicationDelegateTestingCoordinator, "application:testName:options:shouldLoadSampleProactiveData:shouldRaiseExceptionIfNeeded:runTest:", v12, v11, v9, v10, 0, v15);

  return v13;
}

@end
