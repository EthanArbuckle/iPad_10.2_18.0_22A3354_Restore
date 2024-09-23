@implementation PlatformController

- (NavigationSession)currentNavigationSession
{
  PlatformController *v2;
  void *v3;

  v2 = self;
  v3 = (void *)PlatformController.currentNavigationSession.getter();

  return (NavigationSession *)v3;
}

- (void)pushNavigationWithRoute:(id)a3 navigationMode:(unint64_t)a4 shouldCheckNavSafetyAlert:(BOOL)a5 completion:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23[2];
  const __CFString *v24;
  void *v25;
  uint8_t buf[4];
  const char *v27;

  v7 = a5;
  v10 = a3;
  v11 = a6;
  v12 = sub_100431C0C();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v27 = "-[PlatformController(CustomRoute) pushNavigationWithRoute:navigationMode:shouldCheckNavSafetyAlert:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v15 = objc_msgSend(v14, "BOOLForKey:", CFSTR("HasShownCustomNavModeAdvisoryKey"));

  if ((!v7 | v15) == 1)
  {
    -[PlatformController _continuePushNavigationWithRoute:navigationMode:completion:](self, "_continuePushNavigationWithRoute:navigationMode:completion:", v10, a4, v11);
  }
  else
  {
    objc_initWeak((id *)buf, self);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
    v24 = CFSTR("kMapsInterruptionMessage");
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("Custom Route Safety Warning Message"), CFSTR("localized string not found"), 0));
    v25 = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1));
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1002C93D4;
    v20[3] = &unk_1011B0098;
    objc_copyWeak(v23, (id *)buf);
    v21 = v10;
    v23[1] = (id)a4;
    v22 = v11;
    objc_msgSend(v16, "interruptApplicationWithKind:userInfo:completionHandler:", 1, v19, v20);

    objc_destroyWeak(v23);
    objc_destroyWeak((id *)buf);
  }

}

- (void)_continuePushNavigationWithRoute:(id)a3 navigationMode:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  GEOMapServiceTraits *v15;
  GEOMapServiceTraits *v16;
  GEOMapServiceTraits *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  GEOMapServiceTraits *v21;
  id v22;
  id v23[2];
  uint8_t buf[4];
  const char *v25;

  v8 = a3;
  v9 = a5;
  v10 = sub_100431C0C();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v25 = "-[PlatformController(CustomRoute) _continuePushNavigationWithRoute:navigationMode:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PlatformController chromeViewController](self, "chromeViewController"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "currentTraits"));
  v14 = v13;
  if (v13)
    v15 = v13;
  else
    v15 = objc_opt_new(GEOMapServiceTraits);
  v16 = v15;

  objc_initWeak((id *)buf, self);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1002C962C;
  v20[3] = &unk_1011B00E8;
  objc_copyWeak(v23, (id *)buf);
  v23[1] = (id)a4;
  v17 = v16;
  v21 = v17;
  v18 = v9;
  v22 = v18;
  v19 = objc_msgSend(v8, "_maps_convertToNavigableRouteWithTraits:errorHandler:completionHandler:", v17, v18, v20);

  objc_destroyWeak(v23);
  objc_destroyWeak((id *)buf);

}

- (id)directionsDataSource
{
  void *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *i;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  NavigationSessionRAP *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PlatformController sessionStack](self, "sessionStack", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = 0;
    v7 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v2);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v10 = objc_opt_class(NavigationSession);
        if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
        {
          v11 = v9;

          v6 = v11;
        }
        v12 = objc_opt_class(RoutePlanningSession);
        if ((objc_opt_isKindOfClass(v9, v12) & 1) != 0)
        {
          v13 = v9;

          v5 = v13;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
    v6 = 0;
  }

  v14 = -[NavigationSessionRAP initWithNavigationSession:routePlanningSession:]([NavigationSessionRAP alloc], "initWithNavigationSession:routePlanningSession:", v6, v5);
  return v14;
}

- (PedestrianARSessionStateManager)pedestrianARSessionStateManager
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PlatformController auxiliaryTasksManager](self, "auxiliaryTasksManager"));
  v3 = objc_msgSend(v2, "auxilaryTaskForClass:", objc_opt_class(PedestrianARSessionTask));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stateManager"));
  return (PedestrianARSessionStateManager *)v5;
}

- (PlatformController)init
{
  PlatformController *v2;
  id v3;
  NSObject *v4;
  dispatch_queue_attr_t v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *stackLock;
  NSMutableArray *v9;
  NSMutableArray *stack;
  GEOObserverHashTable *v11;
  GEOObserverHashTable *observers;
  AuxiliaryTasksManager *v13;
  AuxiliaryTasksManager *auxiliaryTasksManager;
  uint64_t v15;
  NSMutableSet *auxiliaryTaskCreationPreferencesSatisfied;
  void *v17;
  uint64_t v18;
  GCDTimer *mapViewRenderTimeoutTimer;
  _QWORD v21[4];
  id v22;
  _QWORD block[4];
  id v24;
  objc_super v25;
  uint8_t buf[4];
  PlatformController *v27;

  v25.receiver = self;
  v25.super_class = (Class)PlatformController;
  v2 = -[PlatformController init](&v25, "init");
  if (v2)
  {
    v3 = sub_10097F824();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v27 = v2;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Initializing", buf, 0xCu);
    }

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    v7 = dispatch_queue_create("PlatformController.lock", v6);
    stackLock = v2->_stackLock;
    v2->_stackLock = (OS_dispatch_queue *)v7;

    v9 = objc_opt_new(NSMutableArray);
    stack = v2->_stack;
    v2->_stack = v9;

    v11 = (GEOObserverHashTable *)objc_msgSend(objc_alloc((Class)GEOObserverHashTable), "initWithProtocol:queue:", &OBJC_PROTOCOL___PlatformControllerObserver, 0);
    observers = v2->_observers;
    v2->_observers = v11;

    v13 = -[AuxiliaryTasksManager initWithPlatformController:]([AuxiliaryTasksManager alloc], "initWithPlatformController:", v2);
    auxiliaryTasksManager = v2->_auxiliaryTasksManager;
    v2->_auxiliaryTasksManager = v13;

    v15 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    auxiliaryTaskCreationPreferencesSatisfied = v2->_auxiliaryTaskCreationPreferencesSatisfied;
    v2->_auxiliaryTaskCreationPreferencesSatisfied = (NSMutableSet *)v15;

    -[PlatformController _createAuxiliaryTasksIfNecessaryForPreference:](v2, "_createAuxiliaryTasksIfNecessaryForPreference:", 0);
    objc_initWeak((id *)buf, v2);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10097F864;
    block[3] = &unk_1011AD260;
    objc_copyWeak(&v24, (id *)buf);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v17, "addObserver:selector:name:object:", v2, "mapViewDidBecomeFullyDrawnNotification:", VKMapViewDidBecomeFullyDrawnNotification, 0);

    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10097F894;
    v21[3] = &unk_1011AE190;
    objc_copyWeak(&v22, (id *)buf);
    v18 = objc_claimAutoreleasedReturnValue(+[GCDTimer scheduledTimerWithTimeInterval:queue:block:](GCDTimer, "scheduledTimerWithTimeInterval:queue:block:", &_dispatch_main_q, v21, 5.0));
    mapViewRenderTimeoutTimer = v2->_mapViewRenderTimeoutTimer;
    v2->_mapViewRenderTimeoutTimer = (GCDTimer *)v18;

    objc_destroyWeak(&v22);
    objc_destroyWeak(&v24);
    objc_destroyWeak((id *)buf);
  }
  return v2;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  PlatformController *v7;

  v3 = sub_10097F824();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Deallocating", buf, 0xCu);
  }

  v5.receiver = self;
  v5.super_class = (Class)PlatformController;
  -[PlatformController dealloc](&v5, "dealloc");
}

- (EntryPointsCoordinator)entryPointsCoordinator
{
  EntryPointsCoordinator *entryPointsCoordinator;
  EntryPointsCoordinator *v4;
  EntryPointsCoordinator *v5;

  entryPointsCoordinator = self->_entryPointsCoordinator;
  if (!entryPointsCoordinator)
  {
    v4 = objc_alloc_init(EntryPointsCoordinator);
    v5 = self->_entryPointsCoordinator;
    self->_entryPointsCoordinator = v4;

    entryPointsCoordinator = self->_entryPointsCoordinator;
  }
  return entryPointsCoordinator;
}

- (void)setChromeViewController:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_chromeViewController, obj);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v6, "postNotificationName:object:", PlatformControllerDidChangeChromeViewControllerNotification, self);

    v5 = obj;
  }

}

- (BOOL)_shouldCreateAuxiliaryTask:(Class)a3 forCreationPreference:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;

  v6 = -[objc_class creationPreference](a3, "creationPreference");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PlatformController auxiliaryTaskCreationPreferencesSatisfied](self, "auxiliaryTaskCreationPreferencesSatisfied"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v6));
  v9 = objc_msgSend(v7, "containsObject:", v8);

  return ((uint64_t)v6 <= a4) & ~v9;
}

- (void)_createAllAuxiliaryTasks
{
  -[PlatformController _createAuxiliaryTasksIfNecessaryForPreference:](self, "_createAuxiliaryTasksIfNecessaryForPreference:", 0);
  -[PlatformController _createAuxiliaryTasksIfNecessaryForPreference:](self, "_createAuxiliaryTasksIfNecessaryForPreference:", 1);
  -[PlatformController _createAuxiliaryTasksIfNecessaryForPreference:](self, "_createAuxiliaryTasksIfNecessaryForPreference:", 2);
}

- (void)_createAuxiliaryTasksIfNecessaryForPreference:(int64_t)a3
{
  void *v5;
  void *v6;
  unsigned __int8 v7;
  id v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  unint64_t v15;
  void *v16;
  NavigationStateMonitoringTask *v17;
  void *v18;
  NavigationStateMonitoringTask *v19;
  NavdDefaultsUpdater *v20;
  void *v21;
  void *v22;
  void *v23;
  NavdDefaultsUpdater *v24;
  MapsLocationProviderUpdater *v25;
  void *v26;
  MapsLocationProviderUpdater *v27;
  TilePreloadingTask *v28;
  void *v29;
  void *v30;
  TilePreloadingTask *v31;
  void ***v32;
  RoutePlanningSessionRouteLoadedNotifier *v33;
  NavigationIntentCapturer *v34;
  void *v35;
  NavigationIntentCapturer *v36;
  RoutePlanningAnalyticsTask *v37;
  RoutePlanningUpdater *v38;
  void *v39;
  unsigned int v40;
  MapsRadarAttachmentProviderTask *v41;
  void *v42;
  MapsRadarAttachmentProviderTask *v43;
  NavigationStateUpdater *v44;
  NavigationTrackingTask *v45;
  _TtC4Maps31NavigationProgressCapturingTask *v46;
  void *v47;
  void *v48;
  _TtC4Maps31NavigationProgressCapturingTask *v49;
  _TtC4Maps47NavigationAlertsOnlyOverrideSynchronizationTask *v50;
  void *v51;
  AudioPreferences *v52;
  void *v53;
  AudioPreferences *v54;
  _TtC4Maps47NavigationAlertsOnlyOverrideSynchronizationTask *v55;
  void *v56;
  NavigationRouteInterrupter *v57;
  id v58;
  void *v59;
  NavigationRouteInterrupter *v60;
  NavigationRouteHistoryInfoProvider *v61;
  HistoryDirectionsItemSavingTask *v62;
  AutomaticVehicleSelectionTask *v63;
  VehicleMonitoringTask *v64;
  VehicleDisambiguationTask *v65;
  VIOSessionTask *v66;
  VLFSessionTask *v67;
  VLFPuckAnimationTask *v68;
  PedestrianARSessionTask *v69;
  void *v70;
  PedestrianARMotionMonitorTask *v71;
  void *v72;
  PedestrianARMotionMonitorTask *v73;
  PedestrianARMuteSpeechOverrideTask *v74;
  void *v75;
  PedestrianARMuteSpeechOverrideTask *v76;
  PedestrianARUsageMigratorTask *v77;
  void *v78;
  PedestrianARUsageMigratorTask *v79;
  void *v80;
  void *v81;
  unsigned int v82;
  PedestrianARDebugMapAnnotationsTask *v83;
  PedestrianARDebugMapAnnotationsTask *v84;
  void *v85;
  unsigned int v86;
  RoutePlanningServerEnvrionmentChangeRouteRefreshTask *v87;
  void *v88;
  unsigned int v89;
  ThermalPressureAnalyticsTask *v90;
  void *v91;
  void *v92;
  void *v93;
  ThermalPressureAnalyticsTask *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  BOOL v99;
  NanoCompanionController *v100;
  void *v101;
  NanoCompanionController *v102;
  VirtualGarageServiceTask *v103;
  void *v104;
  unsigned int v105;
  InternalDebugTask *v106;
  DebugCoreMotionCompassAvailabilityTask *v107;
  int BOOL;
  void *v109;
  CarDisplayConfigAuxiliaryTask *v110;
  CustomRoutesTask *v111;
  id v112;
  NSObject *v113;
  void *v114;
  void *v115;
  void *v116;
  id v117;
  NSObject *v118;
  NSObject *v119;
  os_signpost_id_t spid;
  os_signpost_id_t spida;
  void **v122;
  uint64_t v123;
  void (*v124)(uint64_t, void *);
  void *v125;
  id v126;
  uint8_t buf[4];
  PlatformController *v128;
  __int16 v129;
  int64_t v130;
  __int16 v131;
  void *v132;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PlatformController auxiliaryTaskCreationPreferencesSatisfied](self, "auxiliaryTaskCreationPreferencesSatisfied"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  v7 = objc_msgSend(v5, "containsObject:", v6);

  if ((v7 & 1) == 0)
  {
    v8 = sub_10097F824();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349312;
      v128 = self;
      v129 = 2048;
      v130 = a3;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{public}p] Creating auxiliary tasks for preference: %ld", buf, 0x16u);
    }

    v10 = sub_10097F824();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    spid = os_signpost_id_generate(v11);

    v12 = sub_10097F824();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    v14 = v13;
    v15 = spid - 1;
    if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_BEGIN, spid, "CreateAuxiliaryTasks", ", buf, 2u);
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    if (-[PlatformController _shouldCreateAuxiliaryTask:forCreationPreference:](self, "_shouldCreateAuxiliaryTask:forCreationPreference:", objc_opt_class(NavigationStateMonitoringTask), a3))
    {
      v17 = [NavigationStateMonitoringTask alloc];
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
      v19 = -[NavigationStateMonitoringTask initWithPlatformController:navigationService:](v17, "initWithPlatformController:navigationService:", self, v18);
      objc_msgSend(v16, "addObject:", v19);

    }
    if (-[PlatformController _shouldCreateAuxiliaryTask:forCreationPreference:](self, "_shouldCreateAuxiliaryTask:forCreationPreference:", objc_opt_class(NavdDefaultsUpdater), a3))
    {
      v20 = [NavdDefaultsUpdater alloc];
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
      v24 = -[NavdDefaultsUpdater initWithDefaults:navigationService:carDisplayController:](v20, "initWithDefaults:navigationService:carDisplayController:", v21, v22, v23);
      objc_msgSend(v16, "addObject:", v24);

    }
    if (-[PlatformController _shouldCreateAuxiliaryTask:forCreationPreference:](self, "_shouldCreateAuxiliaryTask:forCreationPreference:", objc_opt_class(MapsLocationProviderUpdater), a3))
    {
      v25 = [MapsLocationProviderUpdater alloc];
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
      v27 = -[MapsLocationProviderUpdater initWithLocationManager:](v25, "initWithLocationManager:", v26);
      objc_msgSend(v16, "addObject:", v27);

    }
    if (-[PlatformController _shouldCreateAuxiliaryTask:forCreationPreference:](self, "_shouldCreateAuxiliaryTask:forCreationPreference:", objc_opt_class(TilePreloadingTask), a3))
    {
      v28 = [TilePreloadingTask alloc];
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
      v31 = -[TilePreloadingTask initWithNavigationService:carDisplayController:](v28, "initWithNavigationService:carDisplayController:", v29, v30);
      objc_msgSend(v16, "addObject:", v31);

    }
    if (-[PlatformController _shouldCreateAuxiliaryTask:forCreationPreference:](self, "_shouldCreateAuxiliaryTask:forCreationPreference:", objc_opt_class(RoutePlanningSessionRouteLoadedNotifier), a3))
    {
      objc_initWeak((id *)buf, self);
      v122 = _NSConcreteStackBlock;
      v123 = 3221225472;
      v124 = sub_100980D30;
      v125 = &unk_1011DD2F0;
      objc_copyWeak(&v126, (id *)buf);
      v32 = objc_retainBlock(&v122);
      v33 = -[RoutePlanningSessionRouteLoadedNotifier initWithPlatformController:handler:]([RoutePlanningSessionRouteLoadedNotifier alloc], "initWithPlatformController:handler:", self, v32);
      objc_msgSend(v16, "addObject:", v33);

      objc_destroyWeak(&v126);
      objc_destroyWeak((id *)buf);
    }
    if (-[PlatformController _shouldCreateAuxiliaryTask:forCreationPreference:](self, "_shouldCreateAuxiliaryTask:forCreationPreference:", objc_opt_class(NavigationIntentCapturer), a3))
    {
      v34 = [NavigationIntentCapturer alloc];
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
      v36 = -[NavigationIntentCapturer initWithMapService:](v34, "initWithMapService:", v35);
      objc_msgSend(v16, "addObject:", v36);

    }
    if (-[PlatformController _shouldCreateAuxiliaryTask:forCreationPreference:](self, "_shouldCreateAuxiliaryTask:forCreationPreference:", objc_opt_class(RoutePlanningAnalyticsTask), a3))
    {
      v37 = objc_alloc_init(RoutePlanningAnalyticsTask);
      objc_msgSend(v16, "addObject:", v37);

    }
    if (-[PlatformController _shouldCreateAuxiliaryTask:forCreationPreference:](self, "_shouldCreateAuxiliaryTask:forCreationPreference:", objc_opt_class(RoutePlanningUpdater), a3))
    {
      v38 = objc_alloc_init(RoutePlanningUpdater);
      objc_msgSend(v16, "addObject:", v38);

    }
    if (-[PlatformController _shouldCreateAuxiliaryTask:forCreationPreference:](self, "_shouldCreateAuxiliaryTask:forCreationPreference:", objc_opt_class(MapsRadarAttachmentProviderTask), a3))
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue(+[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform"));
      v40 = objc_msgSend(v39, "isInternalInstall");

      if (v40)
      {
        v41 = [MapsRadarAttachmentProviderTask alloc];
        v42 = (void *)objc_claimAutoreleasedReturnValue(+[MapsRadarController sharedInstance](MapsRadarController, "sharedInstance"));
        v43 = -[MapsRadarAttachmentProviderTask initWithRadarController:](v41, "initWithRadarController:", v42);
        objc_msgSend(v16, "addObject:", v43);

      }
    }
    if (-[PlatformController _shouldCreateAuxiliaryTask:forCreationPreference:](self, "_shouldCreateAuxiliaryTask:forCreationPreference:", objc_opt_class(NavigationStateUpdater), a3))
    {
      v44 = -[NavigationStateUpdater initWithPlatformController:]([NavigationStateUpdater alloc], "initWithPlatformController:", self);
      objc_msgSend(v16, "addObject:", v44);

    }
    if (-[PlatformController _shouldCreateAuxiliaryTask:forCreationPreference:](self, "_shouldCreateAuxiliaryTask:forCreationPreference:", objc_opt_class(NavigationTrackingTask), a3))
    {
      v45 = objc_alloc_init(NavigationTrackingTask);
      objc_msgSend(v16, "addObject:", v45);

    }
    if (-[PlatformController _shouldCreateAuxiliaryTask:forCreationPreference:](self, "_shouldCreateAuxiliaryTask:forCreationPreference:", objc_opt_class(_TtC4Maps31NavigationProgressCapturingTask), a3))
    {
      v46 = [_TtC4Maps31NavigationProgressCapturingTask alloc];
      v47 = (void *)objc_claimAutoreleasedReturnValue(+[GEOUserSession sharedInstance](GEOUserSession, "sharedInstance"));
      v48 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
      v49 = -[NavigationProgressCapturingTask initWithPlatformController:session:navigationService:](v46, "initWithPlatformController:session:navigationService:", self, v47, v48);

      objc_msgSend(v16, "addObject:", v49);
    }
    else
    {
      v49 = 0;
    }
    if (-[PlatformController _shouldCreateAuxiliaryTask:forCreationPreference:](self, "_shouldCreateAuxiliaryTask:forCreationPreference:", objc_opt_class(_TtC4Maps47NavigationAlertsOnlyOverrideSynchronizationTask), a3))
    {
      v50 = [_TtC4Maps47NavigationAlertsOnlyOverrideSynchronizationTask alloc];
      v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      v52 = [AudioPreferences alloc];
      v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      v54 = -[AudioPreferences initWithDefaults:](v52, "initWithDefaults:", v53);
      v55 = -[NavigationAlertsOnlyOverrideSynchronizationTask initWithPlatformController:userDefaults:audioPreferences:](v50, "initWithPlatformController:userDefaults:audioPreferences:", self, v51, v54);
      objc_msgSend(v16, "addObject:", v55);

    }
    if (-[PlatformController _shouldCreateAuxiliaryTask:forCreationPreference:](self, "_shouldCreateAuxiliaryTask:forCreationPreference:", objc_opt_class(HistoryDirectionsItemSavingTask), a3))
    {
      v56 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
      v57 = [NavigationRouteInterrupter alloc];
      v58 = sub_100B3A5D4();
      v59 = (void *)objc_claimAutoreleasedReturnValue(v58);
      v60 = -[NavigationRouteInterrupter initWithSuggestionsEngine:delegate:](v57, "initWithSuggestionsEngine:delegate:", v59, v49);

      v61 = -[NavigationRouteHistoryInfoProvider initWithNavigationService:]([NavigationRouteHistoryInfoProvider alloc], "initWithNavigationService:", v56);
      v62 = -[HistoryDirectionsItemSavingTask initWithNavigationService:routeInfoProvider:routeInterrupter:]([HistoryDirectionsItemSavingTask alloc], "initWithNavigationService:routeInfoProvider:routeInterrupter:", v56, v61, v60);
      objc_msgSend(v16, "addObject:", v62);

    }
    if (-[PlatformController _shouldCreateAuxiliaryTask:forCreationPreference:](self, "_shouldCreateAuxiliaryTask:forCreationPreference:", objc_opt_class(AutomaticVehicleSelectionTask), a3))
    {
      v63 = -[AutomaticVehicleSelectionTask initWithPlatformController:]([AutomaticVehicleSelectionTask alloc], "initWithPlatformController:", self);
      objc_msgSend(v16, "addObject:", v63);

    }
    if (-[PlatformController _shouldCreateAuxiliaryTask:forCreationPreference:](self, "_shouldCreateAuxiliaryTask:forCreationPreference:", objc_opt_class(VehicleMonitoringTask), a3))
    {
      v64 = objc_alloc_init(VehicleMonitoringTask);
      objc_msgSend(v16, "addObject:", v64);

    }
    if (-[PlatformController _shouldCreateAuxiliaryTask:forCreationPreference:](self, "_shouldCreateAuxiliaryTask:forCreationPreference:", objc_opt_class(VehicleDisambiguationTask), a3))
    {
      v65 = objc_alloc_init(VehicleDisambiguationTask);
      objc_msgSend(v16, "addObject:", v65);

    }
    if (-[PlatformController _shouldCreateAuxiliaryTask:forCreationPreference:](self, "_shouldCreateAuxiliaryTask:forCreationPreference:", objc_opt_class(VIOSessionTask), a3))
    {
      v66 = -[VIOSessionTask initWithPlatformController:]([VIOSessionTask alloc], "initWithPlatformController:", self);
      objc_msgSend(v16, "addObject:", v66);

    }
    if (-[PlatformController _shouldCreateAuxiliaryTask:forCreationPreference:](self, "_shouldCreateAuxiliaryTask:forCreationPreference:", objc_opt_class(VLFSessionTask), a3)&& +[VLFSessionTask isVLFModeSupported](VLFSessionTask, "isVLFModeSupported"))
    {
      v67 = -[VLFSessionTask initWithPlatformController:]([VLFSessionTask alloc], "initWithPlatformController:", self);
      objc_msgSend(v16, "addObject:", v67);

    }
    if (-[PlatformController _shouldCreateAuxiliaryTask:forCreationPreference:](self, "_shouldCreateAuxiliaryTask:forCreationPreference:", objc_opt_class(VLFPuckAnimationTask), a3)&& +[VLFSessionTask isVLFModeSupported](VLFSessionTask, "isVLFModeSupported"))
    {
      v68 = -[VLFPuckAnimationTask initWithPlatformController:]([VLFPuckAnimationTask alloc], "initWithPlatformController:", self);
      objc_msgSend(v16, "addObject:", v68);

    }
    if (-[PlatformController _shouldCreateAuxiliaryTask:forCreationPreference:](self, "_shouldCreateAuxiliaryTask:forCreationPreference:", objc_opt_class(PedestrianARSessionTask), a3)&& +[PedestrianARSessionTask isPedestrianARModeSupported](PedestrianARSessionTask, "isPedestrianARModeSupported"))
    {
      v69 = -[PedestrianARSessionTask initWithPlatformController:]([PedestrianARSessionTask alloc], "initWithPlatformController:", self);
      objc_msgSend(v16, "addObject:", v69);
    }
    else
    {
      v69 = 0;
    }
    if (-[PlatformController _shouldCreateAuxiliaryTask:forCreationPreference:](self, "_shouldCreateAuxiliaryTask:forCreationPreference:", objc_opt_class(PedestrianARMotionMonitorTask), a3)&& +[PedestrianARSessionTask isPedestrianARModeSupported](PedestrianARSessionTask, "isPedestrianARModeSupported"))
    {
      v70 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionTask stateManager](v69, "stateManager"));
      if (v70)
      {
        v71 = [PedestrianARMotionMonitorTask alloc];
        v72 = (void *)objc_claimAutoreleasedReturnValue(+[PedestrianARSessionUsageTracker sharedInstance](PedestrianARSessionUsageTracker, "sharedInstance"));
        v73 = -[PedestrianARMotionMonitorTask initWithPlatformController:stateManager:usageTracker:](v71, "initWithPlatformController:stateManager:usageTracker:", self, v70, v72);
        objc_msgSend(v16, "addObject:", v73);

      }
    }
    if (-[PlatformController _shouldCreateAuxiliaryTask:forCreationPreference:](self, "_shouldCreateAuxiliaryTask:forCreationPreference:", objc_opt_class(PedestrianARMuteSpeechOverrideTask), a3)&& +[PedestrianARSessionTask isPedestrianARModeSupported](PedestrianARSessionTask, "isPedestrianARModeSupported"))
    {
      v74 = [PedestrianARMuteSpeechOverrideTask alloc];
      v75 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
      v76 = -[PedestrianARMuteSpeechOverrideTask initWithNavigationService:](v74, "initWithNavigationService:", v75);
      objc_msgSend(v16, "addObject:", v76);

    }
    if (-[PlatformController _shouldCreateAuxiliaryTask:forCreationPreference:](self, "_shouldCreateAuxiliaryTask:forCreationPreference:", objc_opt_class(PedestrianARUsageMigratorTask), a3)&& +[PedestrianARSessionTask isPedestrianARModeSupported](PedestrianARSessionTask, "isPedestrianARModeSupported"))
    {
      v77 = [PedestrianARUsageMigratorTask alloc];
      v78 = (void *)objc_claimAutoreleasedReturnValue(+[PedestrianARSessionUsageTracker sharedInstance](PedestrianARSessionUsageTracker, "sharedInstance"));
      v79 = -[PedestrianARUsageMigratorTask initWithUsageTracker:](v77, "initWithUsageTracker:", v78);
      objc_msgSend(v16, "addObject:", v79);

    }
    if (-[PlatformController _shouldCreateAuxiliaryTask:forCreationPreference:](self, "_shouldCreateAuxiliaryTask:forCreationPreference:", objc_opt_class(PedestrianARDebugMapAnnotationsTask), a3))
    {
      v80 = (void *)objc_claimAutoreleasedReturnValue(+[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform"));
      if (!objc_msgSend(v80, "isInternalInstall"))
      {
LABEL_70:

        goto LABEL_71;
      }
      v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      v82 = objc_msgSend(v81, "BOOLForKey:", CFSTR("PedestrianARDebugMapAnnotationsKey"));

      if (v82)
      {
        v83 = [PedestrianARDebugMapAnnotationsTask alloc];
        v80 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
        v84 = -[PedestrianARDebugMapAnnotationsTask initWithPlatformController:navigationService:](v83, "initWithPlatformController:navigationService:", self, v80);
        objc_msgSend(v16, "addObject:", v84);

        goto LABEL_70;
      }
    }
LABEL_71:
    if (-[PlatformController _shouldCreateAuxiliaryTask:forCreationPreference:](self, "_shouldCreateAuxiliaryTask:forCreationPreference:", objc_opt_class(RoutePlanningServerEnvrionmentChangeRouteRefreshTask), a3))
    {
      v85 = (void *)objc_claimAutoreleasedReturnValue(+[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform"));
      v86 = objc_msgSend(v85, "isInternalInstall");

      if (v86)
      {
        v87 = objc_alloc_init(RoutePlanningServerEnvrionmentChangeRouteRefreshTask);
        objc_msgSend(v16, "addObject:", v87);

      }
    }
    if (-[PlatformController _shouldCreateAuxiliaryTask:forCreationPreference:](self, "_shouldCreateAuxiliaryTask:forCreationPreference:", objc_opt_class(ThermalPressureAnalyticsTask), a3))
    {
      if ((GEOConfigGetBOOL(MapsConfig_ThermalPressureAnalyticsAllowNonInternal, off_1014B4618) & 1) == 0)
      {
        v88 = (void *)objc_claimAutoreleasedReturnValue(+[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform"));
        v89 = objc_msgSend(v88, "isInternalInstall");

        if (!v89)
        {
LABEL_117:

          return;
        }
      }
      v90 = [ThermalPressureAnalyticsTask alloc];
      v91 = (void *)objc_claimAutoreleasedReturnValue(+[MapsThermalPressureController sharedController](MapsThermalPressureController, "sharedController"));
      v92 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
      v93 = (void *)objc_claimAutoreleasedReturnValue(+[MapsPowerSourceController sharedController](MapsPowerSourceController, "sharedController"));
      v94 = -[ThermalPressureAnalyticsTask initWithPlatformController:thermalPressureController:navigationService:powerSourceController:](v90, "initWithPlatformController:thermalPressureController:navigationService:powerSourceController:", self, v91, v92, v93);
      objc_msgSend(v16, "addObject:", v94);

    }
    if (-[PlatformController _shouldCreateAuxiliaryTask:forCreationPreference:](self, "_shouldCreateAuxiliaryTask:forCreationPreference:", objc_opt_class(TrafficIncidentLayoutManager), a3)&& MapsFeature_IsEnabled_Bakersfield())
    {
      v95 = (void *)objc_claimAutoreleasedReturnValue(+[TrafficIncidentLayoutManager sharedInstance](TrafficIncidentLayoutManager, "sharedInstance"));
      objc_msgSend(v16, "addObject:", v95);

    }
    if (-[PlatformController _shouldCreateAuxiliaryTask:forCreationPreference:](self, "_shouldCreateAuxiliaryTask:forCreationPreference:", objc_opt_class(TrafficIncidentsStorageManager), a3)&& MapsFeature_IsEnabled_Bakersfield())
    {
      v96 = (void *)objc_claimAutoreleasedReturnValue(+[TrafficIncidentsStorageManager sharedInstance](TrafficIncidentsStorageManager, "sharedInstance"));
      objc_msgSend(v16, "addObject:", v96);

    }
    if (-[PlatformController _shouldCreateAuxiliaryTask:forCreationPreference:](self, "_shouldCreateAuxiliaryTask:forCreationPreference:", objc_opt_class(RAPRecordManagerTrafficIncidentReportSaver), a3))
    {
      v97 = (void *)objc_claimAutoreleasedReturnValue(+[RAPRecordManagerTrafficIncidentReportSaver sharedInstance](RAPRecordManagerTrafficIncidentReportSaver, "sharedInstance"));
      objc_msgSend(v16, "addObject:", v97);

    }
    if (-[PlatformController _shouldCreateAuxiliaryTask:forCreationPreference:](self, "_shouldCreateAuxiliaryTask:forCreationPreference:", objc_opt_class(NanoCompanionController), a3))
    {
      v98 = (void *)objc_claimAutoreleasedReturnValue(+[IPCServer sharedServer](IPCServer, "sharedServer"));
      v99 = v98 == 0;

      if (!v99)
      {
        v100 = [NanoCompanionController alloc];
        v101 = (void *)objc_claimAutoreleasedReturnValue(+[IPCServer sharedServer](IPCServer, "sharedServer"));
        v102 = -[NanoCompanionController initWithPlatformController:ipcServer:](v100, "initWithPlatformController:ipcServer:", self, v101);
        objc_msgSend(v16, "addObject:", v102);

      }
    }
    if (-[PlatformController _shouldCreateAuxiliaryTask:forCreationPreference:](self, "_shouldCreateAuxiliaryTask:forCreationPreference:", objc_opt_class(VirtualGarageServiceTask), a3))
    {
      v103 = objc_alloc_init(VirtualGarageServiceTask);
      objc_msgSend(v16, "addObject:", v103);

    }
    if (-[PlatformController _shouldCreateAuxiliaryTask:forCreationPreference:](self, "_shouldCreateAuxiliaryTask:forCreationPreference:", objc_opt_class(InternalDebugTask), a3))
    {
      v104 = (void *)objc_claimAutoreleasedReturnValue(+[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform"));
      v105 = objc_msgSend(v104, "isInternalInstall");

      if (v105)
      {
        v106 = objc_alloc_init(InternalDebugTask);
        objc_msgSend(v16, "addObject:", v106);

      }
    }
    if (-[PlatformController _shouldCreateAuxiliaryTask:forCreationPreference:](self, "_shouldCreateAuxiliaryTask:forCreationPreference:", objc_opt_class(DebugCoreMotionCompassAvailabilityTask), a3))
    {
      v107 = (DebugCoreMotionCompassAvailabilityTask *)objc_claimAutoreleasedReturnValue(+[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform"));
      if (-[DebugCoreMotionCompassAvailabilityTask isInternalInstall](v107, "isInternalInstall"))
      {
        BOOL = GEOConfigGetBOOL(MapsConfig_PedestrianARCompassCalibrationInternalAlertEnabled, off_1014B4918);

        if (!BOOL)
          goto LABEL_99;
        v107 = -[DebugCoreMotionCompassAvailabilityTask initWithPlatformController:]([DebugCoreMotionCompassAvailabilityTask alloc], "initWithPlatformController:", self);
        objc_msgSend(v16, "addObject:", v107);
      }

    }
LABEL_99:
    if (-[PlatformController _shouldCreateAuxiliaryTask:forCreationPreference:](self, "_shouldCreateAuxiliaryTask:forCreationPreference:", objc_opt_class(RAPWebBundleDownloadManager), a3))
    {
      v109 = (void *)objc_claimAutoreleasedReturnValue(+[RAPWebBundleDownloadManager sharedInstance](RAPWebBundleDownloadManager, "sharedInstance"));
      objc_msgSend(v16, "addObject:", v109);

    }
    if (-[PlatformController _shouldCreateAuxiliaryTask:forCreationPreference:](self, "_shouldCreateAuxiliaryTask:forCreationPreference:", objc_opt_class(CarDisplayConfigAuxiliaryTask), a3))
    {
      v110 = objc_alloc_init(CarDisplayConfigAuxiliaryTask);
      objc_msgSend(v16, "addObject:", v110);

    }
    if (-[PlatformController _shouldCreateAuxiliaryTask:forCreationPreference:](self, "_shouldCreateAuxiliaryTask:forCreationPreference:", objc_opt_class(CustomRoutesTask), a3))
    {
      v111 = objc_opt_new(CustomRoutesTask);
      objc_msgSend(v16, "addObject:", v111);

    }
    -[AuxiliaryTasksManager addTasks:](self->_auxiliaryTasksManager, "addTasks:", v16, spid, v122, v123, v124, v125);
    v112 = sub_10097F824();
    v113 = objc_claimAutoreleasedReturnValue(v112);
    if (os_log_type_enabled(v113, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349570;
      v128 = self;
      v129 = 2048;
      v130 = a3;
      v131 = 2112;
      v132 = v16;
      _os_log_impl((void *)&_mh_execute_header, v113, OS_LOG_TYPE_INFO, "[%{public}p] Created auxiliary tasks for preference: %ld\n%@", buf, 0x20u);
    }

    if (a3)
    {
      if (a3 != 1)
      {
        if (a3 != 2)
        {
LABEL_113:
          v117 = sub_10097F824();
          v118 = objc_claimAutoreleasedReturnValue(v117);
          v119 = v118;
          if (v15 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v118))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v119, OS_SIGNPOST_INTERVAL_END, spida, "CreateAuxiliaryTasks", ", buf, 2u);
          }

          goto LABEL_117;
        }
        v114 = (void *)objc_claimAutoreleasedReturnValue(-[PlatformController auxiliaryTaskCreationPreferencesSatisfied](self, "auxiliaryTaskCreationPreferencesSatisfied"));
        objc_msgSend(v114, "addObject:", &off_10126FD90);

      }
      v115 = (void *)objc_claimAutoreleasedReturnValue(-[PlatformController auxiliaryTaskCreationPreferencesSatisfied](self, "auxiliaryTaskCreationPreferencesSatisfied"));
      objc_msgSend(v115, "addObject:", &off_10126FD78);

    }
    v116 = (void *)objc_claimAutoreleasedReturnValue(-[PlatformController auxiliaryTaskCreationPreferencesSatisfied](self, "auxiliaryTaskCreationPreferencesSatisfied"));
    objc_msgSend(v116, "addObject:", &off_10126FD60);

    goto LABEL_113;
  }
}

- (void)_handleInitialRouteLoaded:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
  objc_msgSend(v4, "showNavigationAdvisoryIfNeeded");

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100980E10;
  block[3] = &unk_1011AC860;
  v7 = v3;
  v5 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (MapsSession)currentSession
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PlatformController sessionStack](self, "sessionStack"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "lastObject"));

  return (MapsSession *)v3;
}

- (NSArray)sessionStack
{
  NSObject *stackLock;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_100980FC4;
  v10 = sub_100980FD4;
  v11 = 0;
  stackLock = self->_stackLock;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100980FDC;
  v5[3] = &unk_1011ADF48;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stackLock, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (void)pushSession:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint8_t buf[4];
  PlatformController *v16;
  __int16 v17;
  id v18;

  v4 = a3;
  v5 = sub_10097F824();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349314;
    v16 = self;
    v17 = 2112;
    v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Pushing new session: %@", buf, 0x16u);
  }

  +[CATransaction setFrameStallSkipRequest:](CATransaction, "setFrameStallSkipRequest:", 1);
  -[PlatformController _createAllAuxiliaryTasks](self, "_createAllAuxiliaryTasks");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PlatformController currentSession](self, "currentSession"));
  objc_storeStrong((id *)&self->_previousSession, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PlatformController observers](self, "observers"));
  objc_msgSend(v8, "platformController:willChangeCurrentSessionFromSession:toSession:", self, v7, v4);

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1009811BC;
  v12[3] = &unk_1011AD238;
  v12[4] = self;
  v13 = v4;
  v14 = v7;
  v9 = v7;
  v10 = v4;
  v11 = objc_retainBlock(v12);
  -[PlatformController _suspendSession:completion:](self, "_suspendSession:completion:", v9, v11);

}

- (void)popSession
{
  id v3;
  NSObject *v4;
  _QWORD v5[5];
  _BYTE buf[24];
  uint64_t v7;

  v3 = sub_10097F824();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349314;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = "-[PlatformController popSession]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[%{public}p] %s", buf, 0x16u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v7 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100981490;
  v5[3] = &unk_1011DD358;
  v5[4] = buf;
  -[PlatformController popUntil:](self, "popUntil:", v5);
  _Block_object_dispose(buf, 8);
}

- (void)popIfCurrentSession:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  int v9;
  PlatformController *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;

  v4 = a3;
  v5 = sub_10097F824();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PlatformController currentSession](self, "currentSession"));
    v9 = 134349570;
    v10 = self;
    v11 = 2112;
    v12 = v7;
    v13 = 2112;
    v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[%{public}p] Pop if the current session (%@) is equal to: %@", (uint8_t *)&v9, 0x20u);

  }
  v8 = (id)objc_claimAutoreleasedReturnValue(-[PlatformController currentSession](self, "currentSession"));

  if (v8 == v4)
    -[PlatformController popSession](self, "popSession");

}

- (void)replaceCurrentSessionWithSession:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  PlatformController *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;

  v4 = a3;
  v5 = sub_10097F824();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PlatformController currentSession](self, "currentSession"));
    v12 = 134349570;
    v13 = self;
    v14 = 2112;
    v15 = v7;
    v16 = 2112;
    v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[%{public}p] Replace current session (%@) with: %@", (uint8_t *)&v12, 0x20u);

  }
  if (v4)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PlatformController currentSession](self, "currentSession"));
    -[PlatformController pushSession:](self, "pushSession:", v4);
    if (v8)
    {
      -[PlatformController removeSession:](self, "removeSession:", v8);
      v9 = sub_10097F824();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[PlatformController sessionStack](self, "sessionStack"));
        v12 = 134349314;
        v13 = self;
        v14 = 2112;
        v15 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "[%{public}p] Current session stack: %@", (uint8_t *)&v12, 0x16u);

      }
    }

  }
}

- (void)popUntil:(id)a3
{
  uint64_t (**v4)(id, void *);
  id v5;
  NSObject *v6;
  void *v7;
  BOOL v8;
  void *v9;
  char v10;
  NSObject *stackLock;
  void *v12;
  BOOL v13;
  id v14;
  BOOL v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD *v19;
  id v20;
  NSObject *v21;
  void *v22;
  id obj;
  _QWORD v24[5];
  id v25;
  _QWORD block[6];
  _BYTE buf[24];
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v4 = (uint64_t (**)(id, void *))a3;
  v5 = sub_10097F824();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349314;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = "-[PlatformController popUntil:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[%{public}p] %s", buf, 0x16u);
  }

  obj = (id)objc_claimAutoreleasedReturnValue(-[PlatformController currentSession](self, "currentSession"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PlatformController sessionStack](self, "sessionStack"));
  v8 = objc_msgSend(v7, "count") == 0;

  if (!v8)
  {
    do
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[PlatformController currentSession](self, "currentSession"));
      v10 = v4[2](v4, v9);

      if ((v10 & 1) != 0)
        break;
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v28 = sub_100980FC4;
      v29 = sub_100980FD4;
      v30 = 0;
      stackLock = self->_stackLock;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100981AA4;
      block[3] = &unk_1011ADF48;
      block[4] = self;
      block[5] = buf;
      dispatch_sync(stackLock, block);
      -[PlatformController removeSession:](self, "removeSession:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
      _Block_object_dispose(buf, 8);

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[PlatformController sessionStack](self, "sessionStack"));
      v13 = objc_msgSend(v12, "count") == 0;

    }
    while (!v13);
  }
  v14 = (id)objc_claimAutoreleasedReturnValue(-[PlatformController currentSession](self, "currentSession"));
  v15 = obj == v14;

  if (!v15)
  {
    objc_storeStrong((id *)&self->_previousSession, obj);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[PlatformController observers](self, "observers"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[PlatformController currentSession](self, "currentSession"));
    objc_msgSend(v16, "platformController:willChangeCurrentSessionFromSession:toSession:", self, obj, v17);

    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100981AF8;
    v24[3] = &unk_1011AC8B0;
    v24[4] = self;
    v18 = obj;
    v25 = v18;
    v19 = objc_retainBlock(v24);
    -[PlatformController _suspendSession:completion:](self, "_suspendSession:completion:", v18, v19);

  }
  v20 = sub_10097F824();
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[PlatformController sessionStack](self, "sessionStack"));
    *(_DWORD *)buf = 134349314;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v22;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "[%{public}p] Current session stack: %@", buf, 0x16u);

  }
}

- (void)_suspendSession:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  id v8;
  NSObject *v9;
  int v10;
  PlatformController *v11;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  if ((objc_opt_respondsToSelector(v6, "suspendWithCompletion:") & 1) != 0)
  {
    v8 = sub_10097F824();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v10 = 134349056;
      v11 = self;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[%{public}p] Outgoing session requires asynchronous suspension", (uint8_t *)&v10, 0xCu);
    }

    objc_msgSend(v6, "suspendWithCompletion:", v7);
  }
  else
  {
    objc_msgSend(v6, "suspend");
    v7[2](v7);
  }

}

- (void)removeSession:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  NSObject *stackLock;
  id v8;
  void **v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  PlatformController *v13;
  id v14;
  uint8_t buf[4];
  PlatformController *v16;
  __int16 v17;
  id v18;

  v4 = a3;
  v5 = sub_10097F824();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349314;
    v16 = self;
    v17 = 2112;
    v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Removing session: %@", buf, 0x16u);
  }

  if (v4)
  {
    stackLock = self->_stackLock;
    v9 = _NSConcreteStackBlock;
    v10 = 3221225472;
    v11 = sub_100981DAC;
    v12 = &unk_1011AC8B0;
    v13 = self;
    v8 = v4;
    v14 = v8;
    dispatch_sync(stackLock, &v9);
    objc_msgSend(v8, "setPlatformController:", 0, v9, v10, v11, v12, v13);

  }
}

- (void)clearSessions
{
  id v3;
  NSObject *v4;
  int v5;
  PlatformController *v6;
  __int16 v7;
  const char *v8;

  v3 = sub_10097F824();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = 134349314;
    v6 = self;
    v7 = 2080;
    v8 = "-[PlatformController clearSessions]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[%{public}p] %s", (uint8_t *)&v5, 0x16u);
  }

  -[PlatformController popUntil:](self, "popUntil:", &stru_1011DD378);
}

- (void)clearIfCurrentSession:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  int v9;
  PlatformController *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;

  v4 = a3;
  v5 = sub_10097F824();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PlatformController currentSession](self, "currentSession"));
    v9 = 134349570;
    v10 = self;
    v11 = 2112;
    v12 = v7;
    v13 = 2112;
    v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[%{public}p] Clear all sessions if the current session (%@) is equal to: %@", (uint8_t *)&v9, 0x20u);

  }
  v8 = (id)objc_claimAutoreleasedReturnValue(-[PlatformController currentSession](self, "currentSession"));

  if (v8 == v4)
    -[PlatformController clearSessions](self, "clearSessions");

}

- (void)clearIfCurrentSessionIsKindOfClass:(Class)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  char isKindOfClass;
  int v10;
  PlatformController *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  Class v15;

  v5 = sub_10097F824();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PlatformController currentSession](self, "currentSession"));
    v10 = 134349570;
    v11 = self;
    v12 = 2112;
    v13 = v7;
    v14 = 2112;
    v15 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[%{public}p] Clear all sessions if the current session (%@) is kind of class: %@", (uint8_t *)&v10, 0x20u);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PlatformController currentSession](self, "currentSession"));
  isKindOfClass = objc_opt_isKindOfClass(v8, a3);

  if ((isKindOfClass & 1) != 0)
    -[PlatformController clearSessions](self, "clearSessions");
}

- (void)addObserver:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  PlatformController *v9;
  __int16 v10;
  id v11;

  v4 = a3;
  v5 = sub_10097F824();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v8 = 134349314;
    v9 = self;
    v10 = 2112;
    v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[%{public}p] Adding observer: %@", (uint8_t *)&v8, 0x16u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PlatformController observers](self, "observers"));
  objc_msgSend(v7, "registerObserver:", v4);

}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  PlatformController *v9;
  __int16 v10;
  id v11;

  v4 = a3;
  v5 = sub_10097F824();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v8 = 134349314;
    v9 = self;
    v10 = 2112;
    v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[%{public}p] Removing observer: %@", (uint8_t *)&v8, 0x16u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PlatformController observers](self, "observers"));
  objc_msgSend(v7, "unregisterObserver:", v4);

}

- (id)description
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PlatformController sessionStack](self, "sessionStack"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p, sessions=%@>"), v3, self, v4));

  return v5;
}

- (void)prepareToReplaySessions
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  PlatformController *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;

  if (!-[PlatformController didReplaySessions](self, "didReplaySessions"))
  {
    v3 = sub_10097F824();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[PlatformController sessionStack](self, "sessionStack"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[PlatformController observers](self, "observers"));
      *(_DWORD *)buf = 134349570;
      v19 = self;
      v20 = 2112;
      v21 = v5;
      v22 = 2112;
      v23 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Preparing to replay with sessions: %@ and current observers: %@", buf, 0x20u);

    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PlatformController observers](self, "observers"));
    objc_msgSend(v7, "snapshotCurrentObservers");

    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PlatformController sessionStack](self, "sessionStack", 0));
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v14;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v14 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v12), "prepareToReplayCurrentState");
          v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v10);
    }

  }
}

- (void)replaySessions
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  NSObject *stackLock;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  MapsSession *previousSession;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[6];
  _QWORD block[7];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint8_t v39[128];
  uint8_t buf[4];
  PlatformController *v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  uint64_t v45;

  if (!-[PlatformController didReplaySessions](self, "didReplaySessions"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[PlatformController currentSession](self, "currentSession"));

    if (v3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[PlatformController observers](self, "observers"));
      objc_msgSend(v4, "removeSnapshottedObservers");

      v5 = (void *)objc_claimAutoreleasedReturnValue(-[PlatformController observers](self, "observers"));
      v6 = objc_msgSend(v5, "hasObservers");

      if (v6)
      {
        v33 = 0;
        v34 = &v33;
        v35 = 0x3032000000;
        v36 = sub_100980FC4;
        v37 = sub_100980FD4;
        v38 = 0;
        v27 = 0;
        v28 = &v27;
        v29 = 0x3032000000;
        v30 = sub_100980FC4;
        v31 = sub_100980FD4;
        v32 = 0;
        stackLock = self->_stackLock;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1009827F8;
        block[3] = &unk_1011B8078;
        block[4] = self;
        block[5] = &v33;
        block[6] = &v27;
        dispatch_sync(stackLock, block);
        v8 = sub_10097F824();
        v9 = objc_claimAutoreleasedReturnValue(v8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          v10 = v28[5];
          v11 = v34[5];
          *(_DWORD *)buf = 134349570;
          v41 = self;
          v42 = 2112;
          v43 = v10;
          v44 = 2112;
          v45 = v11;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{public}p] Replaying session transition: %@ => %@", buf, 0x20u);
        }

        objc_storeStrong((id *)&self->_previousSession, (id)v28[5]);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[PlatformController observers](self, "observers"));
        objc_msgSend(v12, "platformController:willChangeCurrentSessionFromSession:toSession:", self, v28[5], v34[5]);

        v13 = self->_stackLock;
        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472;
        v25[2] = sub_100982894;
        v25[3] = &unk_1011AD318;
        v25[4] = self;
        v25[5] = &v33;
        dispatch_sync(v13, v25);
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[PlatformController observers](self, "observers"));
        objc_msgSend(v14, "platformController:didChangeCurrentSessionFromSession:toSession:", self, v28[5], v34[5]);

        objc_msgSend((id)v34[5], "replayCurrentState");
        previousSession = self->_previousSession;
        self->_previousSession = 0;

        _Block_object_dispose(&v27, 8);
        _Block_object_dispose(&v33, 8);

      }
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[PlatformController observers](self, "observers"));
    objc_msgSend(v16, "restoreOriginalObservers");

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[PlatformController sessionStack](self, "sessionStack", 0));
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v21, v39, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v22;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v22 != v19)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v20), "cleanupStateReplay");
          v20 = (char *)v20 + 1;
        }
        while (v18 != v20);
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v21, v39, 16);
      }
      while (v18);
    }

    -[PlatformController setDidReplaySessions:](self, "setDidReplaySessions:", 1);
  }
}

- (void)mapViewDidBecomeFullyDrawnNotification:(id)a3
{
  void *v4;
  GCDTimer *mapViewRenderTimeoutTimer;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter", a3));
  objc_msgSend(v4, "removeObserver:name:object:", self, VKMapViewDidBecomeFullyDrawnNotification, 0);

  mapViewRenderTimeoutTimer = self->_mapViewRenderTimeoutTimer;
  self->_mapViewRenderTimeoutTimer = 0;

  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1009829A8;
  v6[3] = &unk_1011AD260;
  objc_copyWeak(&v7, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (AuxiliaryTasksManager)auxiliaryTasksManager
{
  return self->_auxiliaryTasksManager;
}

- (ChromeViewController)chromeViewController
{
  return (ChromeViewController *)objc_loadWeakRetained((id *)&self->_chromeViewController);
}

- (BOOL)isPrimary
{
  return self->_isPrimary;
}

- (void)setIsPrimary:(BOOL)a3
{
  self->_isPrimary = a3;
}

- (MapsSession)previousSession
{
  return self->_previousSession;
}

- (NSMutableArray)stack
{
  return self->_stack;
}

- (void)setStack:(id)a3
{
  objc_storeStrong((id *)&self->_stack, a3);
}

- (GEOObserverHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (NSMutableSet)auxiliaryTaskCreationPreferencesSatisfied
{
  return self->_auxiliaryTaskCreationPreferencesSatisfied;
}

- (void)setAuxiliaryTaskCreationPreferencesSatisfied:(id)a3
{
  objc_storeStrong((id *)&self->_auxiliaryTaskCreationPreferencesSatisfied, a3);
}

- (GCDTimer)mapViewRenderTimeoutTimer
{
  return self->_mapViewRenderTimeoutTimer;
}

- (void)setMapViewRenderTimeoutTimer:(id)a3
{
  objc_storeStrong((id *)&self->_mapViewRenderTimeoutTimer, a3);
}

- (BOOL)didReplaySessions
{
  return self->_didReplaySessions;
}

- (void)setDidReplaySessions:(BOOL)a3
{
  self->_didReplaySessions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapViewRenderTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_auxiliaryTaskCreationPreferencesSatisfied, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_stack, 0);
  objc_storeStrong((id *)&self->_previousSession, 0);
  objc_destroyWeak((id *)&self->_chromeViewController);
  objc_storeStrong((id *)&self->_auxiliaryTasksManager, 0);
  objc_storeStrong((id *)&self->_entryPointsCoordinator, 0);
  objc_storeStrong((id *)&self->_stackLock, 0);
}

@end
