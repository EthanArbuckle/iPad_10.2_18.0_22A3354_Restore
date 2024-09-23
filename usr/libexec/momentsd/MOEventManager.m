@implementation MOEventManager

- (MOEventManager)initWithUniverse:(id)a3
{
  id v6;
  uint64_t v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  objc_class *v13;
  NSString *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  objc_class *v18;
  NSString *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  objc_class *v23;
  NSString *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  objc_class *v28;
  NSString *v29;
  void *v30;
  void *v31;
  MOEventManager *v32;
  dispatch_queue_attr_t v33;
  NSObject *v34;
  dispatch_queue_t v35;
  OS_dispatch_queue *queue;
  MOEventManager *v37;
  id os_log;
  NSObject *v39;
  void *v40;
  void *v41;
  const __CFString *v42;
  SEL v43;
  MOEventManager *v44;
  uint64_t v45;
  id v46;
  NSObject *v47;
  id v48;
  NSObject *v49;
  id v50;
  NSObject *v51;
  objc_super v53;

  v6 = a3;
  objc_storeStrong((id *)&self->fUniverse, a3);
  v8 = (objc_class *)objc_opt_class(MODefaultsManager, v7);
  v9 = NSStringFromClass(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getService:", v10));

  v13 = (objc_class *)objc_opt_class(MOConfigurationManager, v12);
  v14 = NSStringFromClass(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getService:", v15));

  v18 = (objc_class *)objc_opt_class(MOEventStore, v17);
  v19 = NSStringFromClass(v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getService:", v20));

  v23 = (objc_class *)objc_opt_class(MOEventBundleStore, v22);
  v24 = NSStringFromClass(v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getService:", v25));

  v28 = (objc_class *)objc_opt_class(MOEventPatternManager, v27);
  v29 = NSStringFromClass(v28);
  v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getService:", v30));

  if (!v21)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v39 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      -[MORoutineServiceManager initWithUniverse:].cold.2();

    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v41 = v40;
    v42 = CFSTR("Invalid parameter not satisfying: eventStore");
    v43 = a2;
    v44 = self;
    v45 = 115;
    goto LABEL_20;
  }
  if (!v11)
  {
    v46 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v47 = objc_claimAutoreleasedReturnValue(v46);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      -[MOEventManager initWithUniverse:].cold.2();

    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v41 = v40;
    v42 = CFSTR("Invalid parameter not satisfying: defaultsManager");
    v43 = a2;
    v44 = self;
    v45 = 117;
    goto LABEL_20;
  }
  if (!v16)
  {
    v48 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v49 = objc_claimAutoreleasedReturnValue(v48);
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      -[MOPeopleDiscoveryManager initWithUniverse:].cold.1();

    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v41 = v40;
    v42 = CFSTR("Invalid parameter not satisfying: configurationManager");
    v43 = a2;
    v44 = self;
    v45 = 118;
    goto LABEL_20;
  }
  if (!v31)
  {
    v50 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v51 = objc_claimAutoreleasedReturnValue(v50);
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      -[MOEventManager initWithUniverse:].cold.4();

    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v41 = v40;
    v42 = CFSTR("Invalid parameter not satisfying: patternManager");
    v43 = a2;
    v44 = self;
    v45 = 119;
LABEL_20:
    objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", v43, v44, CFSTR("MOEventManager.m"), v45, v42);

    v37 = 0;
    goto LABEL_21;
  }
  v53.receiver = self;
  v53.super_class = (Class)MOEventManager;
  v32 = -[MOEventManager init](&v53, "init");
  if (v32)
  {
    v33 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v34 = objc_claimAutoreleasedReturnValue(v33);
    v35 = dispatch_queue_create("MOEventManager", v34);
    queue = v32->_queue;
    v32->_queue = (OS_dispatch_queue *)v35;

    objc_storeStrong((id *)&v32->_defaultsManager, v11);
    objc_storeStrong((id *)&v32->_eventStore, v21);
    objc_storeStrong((id *)&v32->_configurationManager, v16);
    objc_storeStrong((id *)&v32->_patternManager, v31);
    objc_storeStrong((id *)&v32->_eventBundleStore, v26);
  }
  self = v32;
  v37 = self;
LABEL_21:

  return v37;
}

- (MOPhotoManager)photoManager
{
  MOPhotoManager *photoManager;
  MODaemonUniverse *fUniverse;
  objc_class *v5;
  NSString *v6;
  void *v7;
  MOPhotoManager *v8;
  MOPhotoManager *v9;

  photoManager = self->_photoManager;
  if (!photoManager)
  {
    fUniverse = self->fUniverse;
    v5 = (objc_class *)objc_opt_class(MOPhotoManager, a2);
    v6 = NSStringFromClass(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = (MOPhotoManager *)objc_claimAutoreleasedReturnValue(-[MODaemonUniverse getService:](fUniverse, "getService:", v7));
    v9 = self->_photoManager;
    self->_photoManager = v8;

    photoManager = self->_photoManager;
  }
  return photoManager;
}

- (MORoutineServiceManager)routineServiceManager
{
  MORoutineServiceManager *routineServiceManager;
  MODaemonUniverse *fUniverse;
  objc_class *v5;
  NSString *v6;
  void *v7;
  MORoutineServiceManager *v8;
  MORoutineServiceManager *v9;

  routineServiceManager = self->_routineServiceManager;
  if (!routineServiceManager)
  {
    fUniverse = self->fUniverse;
    v5 = (objc_class *)objc_opt_class(MORoutineServiceManager, a2);
    v6 = NSStringFromClass(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = (MORoutineServiceManager *)objc_claimAutoreleasedReturnValue(-[MODaemonUniverse getService:](fUniverse, "getService:", v7));
    v9 = self->_routineServiceManager;
    self->_routineServiceManager = v8;

    routineServiceManager = self->_routineServiceManager;
  }
  return routineServiceManager;
}

- (MOHealthKitManager)healthKitManager
{
  MOHealthKitManager *healthKitManager;
  MODaemonUniverse *fUniverse;
  objc_class *v5;
  NSString *v6;
  void *v7;
  MOHealthKitManager *v8;
  MOHealthKitManager *v9;

  healthKitManager = self->_healthKitManager;
  if (!healthKitManager)
  {
    fUniverse = self->fUniverse;
    v5 = (objc_class *)objc_opt_class(MOHealthKitManager, a2);
    v6 = NSStringFromClass(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = (MOHealthKitManager *)objc_claimAutoreleasedReturnValue(-[MODaemonUniverse getService:](fUniverse, "getService:", v7));
    v9 = self->_healthKitManager;
    self->_healthKitManager = v8;

    healthKitManager = self->_healthKitManager;
  }
  return healthKitManager;
}

- (MOSharedWithYouManager)sharedWithYouManager
{
  MOSharedWithYouManager *sharedWithYouManager;
  MODaemonUniverse *fUniverse;
  objc_class *v5;
  NSString *v6;
  void *v7;
  MOSharedWithYouManager *v8;
  MOSharedWithYouManager *v9;

  sharedWithYouManager = self->_sharedWithYouManager;
  if (!sharedWithYouManager)
  {
    fUniverse = self->fUniverse;
    v5 = (objc_class *)objc_opt_class(MOSharedWithYouManager, a2);
    v6 = NSStringFromClass(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = (MOSharedWithYouManager *)objc_claimAutoreleasedReturnValue(-[MODaemonUniverse getService:](fUniverse, "getService:", v7));
    v9 = self->_sharedWithYouManager;
    self->_sharedWithYouManager = v8;

    sharedWithYouManager = self->_sharedWithYouManager;
  }
  return sharedWithYouManager;
}

- (MOSuggestedEventManager)suggestedEventManager
{
  MOSuggestedEventManager *suggestedEventManager;
  MODaemonUniverse *fUniverse;
  objc_class *v5;
  NSString *v6;
  void *v7;
  MOSuggestedEventManager *v8;
  MOSuggestedEventManager *v9;

  suggestedEventManager = self->_suggestedEventManager;
  if (!suggestedEventManager)
  {
    fUniverse = self->fUniverse;
    v5 = (objc_class *)objc_opt_class(MOSuggestedEventManager, a2);
    v6 = NSStringFromClass(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = (MOSuggestedEventManager *)objc_claimAutoreleasedReturnValue(-[MODaemonUniverse getService:](fUniverse, "getService:", v7));
    v9 = self->_suggestedEventManager;
    self->_suggestedEventManager = v8;

    suggestedEventManager = self->_suggestedEventManager;
  }
  return suggestedEventManager;
}

- (MOProactiveTravelManager)proactiveTravelManager
{
  MOProactiveTravelManager *proactiveTravelManager;
  MODaemonUniverse *fUniverse;
  objc_class *v5;
  NSString *v6;
  void *v7;
  MOProactiveTravelManager *v8;
  MOProactiveTravelManager *v9;

  proactiveTravelManager = self->_proactiveTravelManager;
  if (!proactiveTravelManager)
  {
    fUniverse = self->fUniverse;
    v5 = (objc_class *)objc_opt_class(MOProactiveTravelManager, a2);
    v6 = NSStringFromClass(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = (MOProactiveTravelManager *)objc_claimAutoreleasedReturnValue(-[MODaemonUniverse getService:](fUniverse, "getService:", v7));
    v9 = self->_proactiveTravelManager;
    self->_proactiveTravelManager = v8;

    proactiveTravelManager = self->_proactiveTravelManager;
  }
  return proactiveTravelManager;
}

- (MONowPlayingMediaManager)nowPlayingMediaManager
{
  MONowPlayingMediaManager *nowPlayingMediaManager;
  MODaemonUniverse *fUniverse;
  objc_class *v5;
  NSString *v6;
  void *v7;
  MONowPlayingMediaManager *v8;
  MONowPlayingMediaManager *v9;

  nowPlayingMediaManager = self->_nowPlayingMediaManager;
  if (!nowPlayingMediaManager)
  {
    fUniverse = self->fUniverse;
    v5 = (objc_class *)objc_opt_class(MONowPlayingMediaManager, a2);
    v6 = NSStringFromClass(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = (MONowPlayingMediaManager *)objc_claimAutoreleasedReturnValue(-[MODaemonUniverse getService:](fUniverse, "getService:", v7));
    v9 = self->_nowPlayingMediaManager;
    self->_nowPlayingMediaManager = v8;

    nowPlayingMediaManager = self->_nowPlayingMediaManager;
  }
  return nowPlayingMediaManager;
}

- (MOSignificantContactManager)significantContactManager
{
  MOSignificantContactManager *significantContactManager;
  MODaemonUniverse *fUniverse;
  objc_class *v5;
  NSString *v6;
  void *v7;
  MOSignificantContactManager *v8;
  MOSignificantContactManager *v9;

  significantContactManager = self->_significantContactManager;
  if (!significantContactManager)
  {
    fUniverse = self->fUniverse;
    v5 = (objc_class *)objc_opt_class(MOSignificantContactManager, a2);
    v6 = NSStringFromClass(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = (MOSignificantContactManager *)objc_claimAutoreleasedReturnValue(-[MODaemonUniverse getService:](fUniverse, "getService:", v7));
    v9 = self->_significantContactManager;
    self->_significantContactManager = v8;

    significantContactManager = self->_significantContactManager;
  }
  return significantContactManager;
}

- (MOPeopleDiscoveryManager)peopleDiscoveryManager
{
  MOPeopleDiscoveryManager *peopleDiscoveryManager;
  MODaemonUniverse *fUniverse;
  objc_class *v5;
  NSString *v6;
  void *v7;
  MOPeopleDiscoveryManager *v8;
  MOPeopleDiscoveryManager *v9;

  peopleDiscoveryManager = self->_peopleDiscoveryManager;
  if (!peopleDiscoveryManager)
  {
    fUniverse = self->fUniverse;
    v5 = (objc_class *)objc_opt_class(MOPeopleDiscoveryManager, a2);
    v6 = NSStringFromClass(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = (MOPeopleDiscoveryManager *)objc_claimAutoreleasedReturnValue(-[MODaemonUniverse getService:](fUniverse, "getService:", v7));
    v9 = self->_peopleDiscoveryManager;
    self->_peopleDiscoveryManager = v8;

    peopleDiscoveryManager = self->_peopleDiscoveryManager;
  }
  return peopleDiscoveryManager;
}

- (MOWeatherManager)weatherManager
{
  MOWeatherManager *weatherManager;
  MODaemonUniverse *fUniverse;
  objc_class *v5;
  NSString *v6;
  void *v7;
  MOWeatherManager *v8;
  MOWeatherManager *v9;

  weatherManager = self->_weatherManager;
  if (!weatherManager)
  {
    fUniverse = self->fUniverse;
    v5 = (objc_class *)objc_opt_class(MOWeatherManager, a2);
    v6 = NSStringFromClass(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = (MOWeatherManager *)objc_claimAutoreleasedReturnValue(-[MODaemonUniverse getService:](fUniverse, "getService:", v7));
    v9 = self->_weatherManager;
    self->_weatherManager = v8;

    weatherManager = self->_weatherManager;
  }
  return weatherManager;
}

- (MOLifeEventManager)lifeEventManager
{
  MOLifeEventManager *lifeEventManager;
  MODaemonUniverse *fUniverse;
  objc_class *v5;
  NSString *v6;
  void *v7;
  MOLifeEventManager *v8;
  MOLifeEventManager *v9;

  lifeEventManager = self->_lifeEventManager;
  if (!lifeEventManager)
  {
    fUniverse = self->fUniverse;
    v5 = (objc_class *)objc_opt_class(MOLifeEventManager, a2);
    v6 = NSStringFromClass(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = (MOLifeEventManager *)objc_claimAutoreleasedReturnValue(-[MODaemonUniverse getService:](fUniverse, "getService:", v7));
    v9 = self->_lifeEventManager;
    self->_lifeEventManager = v8;

    lifeEventManager = self->_lifeEventManager;
  }
  return lifeEventManager;
}

- (MOMotionManager)motionManager
{
  MOMotionManager *motionManager;
  MODaemonUniverse *fUniverse;
  objc_class *v5;
  NSString *v6;
  void *v7;
  MOMotionManager *v8;
  MOMotionManager *v9;

  motionManager = self->_motionManager;
  if (!motionManager)
  {
    fUniverse = self->fUniverse;
    v5 = (objc_class *)objc_opt_class(MOMotionManager, a2);
    v6 = NSStringFromClass(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = (MOMotionManager *)objc_claimAutoreleasedReturnValue(-[MODaemonUniverse getService:](fUniverse, "getService:", v7));
    v9 = self->_motionManager;
    self->_motionManager = v8;

    motionManager = self->_motionManager;
  }
  return motionManager;
}

- (id)_getEarliestDateForCategory_prelaunch:(unint64_t)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", v3, -2419200.0));

  return v4;
}

- (id)_getEarliestDateForCategory_postlaunch:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;

  v3 = 0;
  switch(a3)
  {
    case 1uLL:
    case 0x16uLL:
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventManager defaultsManager](self, "defaultsManager"));
      v5 = v4;
      v6 = CFSTR("OnboardingEarliestCollectDateLocation");
      goto LABEL_9;
    case 2uLL:
    case 0xDuLL:
    case 0x10uLL:
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventManager defaultsManager](self, "defaultsManager"));
      v5 = v4;
      v6 = CFSTR("OnboardingEarliestCollectDateActivity");
      goto LABEL_9;
    case 3uLL:
    case 4uLL:
    case 6uLL:
    case 9uLL:
    case 0x13uLL:
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventManager defaultsManager](self, "defaultsManager"));
      v5 = v4;
      v6 = CFSTR("OnboardingEarliestCollectDateMedia");
      goto LABEL_9;
    case 5uLL:
    case 0xEuLL:
    case 0x11uLL:
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventManager defaultsManager](self, "defaultsManager"));
      v5 = v4;
      v6 = CFSTR("OnboardingEarliestCollectDatePhoto");
      goto LABEL_9;
    case 0xAuLL:
    case 0x12uLL:
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventManager defaultsManager](self, "defaultsManager"));
      v5 = v4;
      v6 = CFSTR("OnboardingEarliestCollectDateCommunication");
      goto LABEL_9;
    case 0xFuLL:
    case 0x15uLL:
    case 0x17uLL:
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventManager defaultsManager](self, "defaultsManager"));
      v5 = v4;
      v6 = CFSTR("OnboardingEarliestCollectDatePeople");
      goto LABEL_9;
    case 0x18uLL:
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventManager defaultsManager](self, "defaultsManager"));
      v5 = v4;
      v6 = CFSTR("OnboardingEarliestCollectDateStateOfMind");
LABEL_9:
      v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", v6));

      break;
    default:
      return v3;
  }
  return v3;
}

- (void)clearEventsWithRefreshVariant:(unint64_t)a3 andHandler:(id)a4
{
  void (**v6)(id, _QWORD, void *);
  id os_log;
  NSObject *v8;
  NSObject *v9;
  MOPerformanceMeasurement *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  uint8_t v23[8];
  NSErrorUserInfoKey v24;
  const __CFString *v25;

  v6 = (void (**)(id, _QWORD, void *))a4;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  v9 = v8;
  if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)v23 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_BEGIN, a3, "EventManagerClearEvents", ", v23, 2u);
  }

  v10 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("ClearEvents"), 0);
  -[MOPerformanceMeasurement startSession](v10, "startSession");
  if (a3 == 0xFFFF)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventManager photoManager](self, "photoManager"));
    objc_msgSend(v11, "deletePhotoMemoryPlistFile");

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventManager eventStore](self, "eventStore"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "persistenceManager"));
  v14 = objc_msgSend(v13, "availability");

  v15 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  v17 = v16;
  if (v14 == (id)2)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v23 = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "clear event since datastore is available", v23, 2u);
    }

    -[MOEventManager _clearEvents](self, "_clearEvents");
    if (v6)
      v6[2](v6, 0, &__NSDictionary0__struct);
  }
  else
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[MOEventManager clearEventsWithRefreshVariant:andHandler:].cold.1();

    if (v6)
    {
      v24 = NSLocalizedDescriptionKey;
      v25 = CFSTR("[clearEventsWithRefreshVariant] database is not available");
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("MOErrorDomain"), 16, v18));

      ((void (**)(id, void *, void *))v6)[2](v6, v19, &__NSDictionary0__struct);
    }
  }
  v20 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v21 = objc_claimAutoreleasedReturnValue(v20);
  v22 = v21;
  if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_WORD *)v23 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v22, OS_SIGNPOST_INTERVAL_END, a3, "EventManagerClearEvents", ", v23, 2u);
  }

  -[MOPerformanceMeasurement endSession](v10, "endSession");
}

- (void)_clearEvents
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[MOEventManager eventStore](self, "eventStore"));
  objc_msgSend(v2, "removeAllEventsWithCompletionHandler:", &__block_literal_global_45);

}

void __30__MOEventManager__clearEvents__block_invoke(id a1, NSError *a2)
{
  id os_log;
  NSObject *v3;
  uint8_t v4[16];

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
  v3 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "cleared all events", v4, 2u);
  }

}

- (void)collectEventsWithRefreshVariant:(unint64_t)a3 andHandler:(id)a4
{
  id v6;
  id os_log;
  NSObject *v8;
  NSObject *v9;
  MOPerformanceMeasurement *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  _QWORD v23[4];
  MOPerformanceMeasurement *v24;
  id v25;
  unint64_t v26;
  uint8_t buf[8];
  const __CFString *v28;
  void *v29;
  NSErrorUserInfoKey v30;
  const __CFString *v31;

  v6 = a4;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  v9 = v8;
  if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_BEGIN, a3, "EventManagerCollectEvents", ", buf, 2u);
  }

  v10 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("CollectEvents"), 0);
  -[MOPerformanceMeasurement startSession](v10, "startSession");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventManager eventStore](self, "eventStore"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "persistenceManager"));
  v13 = objc_msgSend(v12, "availability");

  v14 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  v16 = v15;
  if (v13 == (id)2)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "collect event since datastore is available", buf, 2u);
    }

    +[MOPersistenceManager persistCollectionDate](MOPersistenceManager, "persistCollectionDate");
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = __61__MOEventManager_collectEventsWithRefreshVariant_andHandler___block_invoke;
    v23[3] = &unk_1002B2410;
    v25 = v6;
    v26 = a3;
    v24 = v10;
    -[MOEventManager _collectEventsWithRefreshVariant:andHandler:](self, "_collectEventsWithRefreshVariant:andHandler:", a3, v23);

  }
  else
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[MOEventManager collectEventsWithRefreshVariant:andHandler:].cold.1();

    if (v6)
    {
      v30 = NSLocalizedDescriptionKey;
      v31 = CFSTR("[collectEventsWithRefreshVariant] database is not available");
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("MOErrorDomain"), 16, v17));

      v28 = CFSTR("stateDatabaseAvailable");
      v29 = &__kCFBooleanFalse;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1));
      (*((void (**)(id, void *, void *))v6 + 2))(v6, v18, v19);

    }
    v20 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    v22 = v21;
    if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v22, OS_SIGNPOST_INTERVAL_END, a3, "EventManagerCollectEvents", ", buf, 2u);
    }

    -[MOPerformanceMeasurement endSession](v10, "endSession");
  }

}

void __61__MOEventManager_collectEventsWithRefreshVariant_andHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id os_log;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  uint8_t v12[16];

  v5 = a2;
  v6 = objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v6, "setObject:forKey:", &__kCFBooleanTrue, CFSTR("stateDatabaseAvailable"));
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v9 = objc_claimAutoreleasedReturnValue(os_log);
  v10 = v9;
  v11 = *(_QWORD *)(a1 + 48);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)v12 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_END, v11, "EventManagerCollectEvents", ", v12, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "endSession");
}

- (void)_collectEventsWithRefreshVariant:(unint64_t)a3 andHandler:(id)a4
{
  id v7;
  MOEventRefreshHelper *v8;
  id os_log;
  NSObject *v10;
  NSString *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  MOEventBundleFetchOptions *v16;
  id v17;
  id v18;
  MOEventBundleFetchOptions *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  uint64_t *v24;
  uint64_t *v25;
  SEL v26;
  unint64_t v27;
  _QWORD v28[6];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint8_t buf[4];
  id v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  void *v48;
  NSErrorUserInfoKey v49;
  const __CFString *v50;

  v7 = a4;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__37;
  v39 = __Block_byref_object_dispose__37;
  v40 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__37;
  v33 = __Block_byref_object_dispose__37;
  v34 = 0;
  v8 = -[MOEventRefreshHelper initWithUniverse:]([MOEventRefreshHelper alloc], "initWithUniverse:", self->fUniverse);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = __62__MOEventManager__collectEventsWithRefreshVariant_andHandler___block_invoke;
  v28[3] = &unk_1002B1E88;
  v28[4] = &v35;
  v28[5] = &v29;
  -[MOEventRefreshHelper getCollectDatesForVariant:withHandler:](v8, "getCollectDatesForVariant:withHandler:", a3, v28);
  if (v36[5] && v30[5])
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    v10 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = NSStringFromSelector(a2);
      v12 = (id)objc_claimAutoreleasedReturnValue(v11);
      v13 = v36[5];
      v14 = v30[5];
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
      *(_DWORD *)buf = 138413058;
      v42 = v12;
      v43 = 2112;
      v44 = v13;
      v45 = 2112;
      v46 = v14;
      v47 = 2112;
      v48 = v15;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%@, collect startDate, %@, endDate, %@, refreshVariant, %@", buf, 0x2Au);

    }
    v16 = [MOEventBundleFetchOptions alloc];
    v17 = objc_alloc((Class)NSDateInterval);
    v18 = objc_msgSend(v17, "initWithStartDate:endDate:", v36[5], v30[5]);
    v19 = -[MOEventBundleFetchOptions initWithDateInterval:ascending:limit:includeDeletedBundles:skipRanking:interfaceType:](v16, "initWithDateInterval:ascending:limit:includeDeletedBundles:skipRanking:interfaceType:", v18, 1, &off_1002DB1C8, 0, 1, 13);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventManager eventBundleStore](self, "eventBundleStore"));
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = __62__MOEventManager__collectEventsWithRefreshVariant_andHandler___block_invoke_134;
    v22[3] = &unk_1002B5538;
    v25 = &v29;
    v26 = a2;
    v27 = a3;
    v24 = &v35;
    v22[4] = self;
    v23 = v7;
    objc_msgSend(v20, "fetchEventBundleWithOptions:CompletionHandler:", v19, v22);

  }
  else
  {
    v49 = NSLocalizedDescriptionKey;
    v50 = CFSTR("collec start or end date cannot be nil");
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1));
    v19 = (MOEventBundleFetchOptions *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("MOErrorDomain"), 7, v21));

    if (v7)
      (*((void (**)(id, MOEventBundleFetchOptions *, void *))v7 + 2))(v7, v19, &__NSDictionary0__struct);
  }

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);

}

void __62__MOEventManager__collectEventsWithRefreshVariant_andHandler___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v8;
  id v9;

  v9 = a3;
  v8 = a4;
  if (a2)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a4);
  }

}

void __62__MOEventManager__collectEventsWithRefreshVariant_andHandler___block_invoke_134(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id os_log;
  NSObject *v8;
  id v9;
  NSObject *v10;
  NSString *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  MOEventFetchOptions *v16;
  id v17;
  MOEventFetchOptions *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  __int128 v29;
  _QWORD v30[5];
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  void *v41;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    v8 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __62__MOEventManager__collectEventsWithRefreshVariant_andHandler___block_invoke_134_cold_1();
    goto LABEL_4;
  }
  if (objc_msgSend(v5, "count"))
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "startDate"));
    v25 = objc_msgSend(v24, "isBeforeDate:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

    if (v25)
    {
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
      v26 = objc_claimAutoreleasedReturnValue(-[NSObject startDate](v8, "startDate"));
      v27 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v28 = *(void **)(v27 + 40);
      *(_QWORD *)(v27 + 40) = v26;

LABEL_4:
    }
  }
  v9 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = NSStringFromSelector(*(SEL *)(a1 + 64));
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v14 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 72)));
    *(_DWORD *)buf = 138413058;
    v35 = v12;
    v36 = 2112;
    v37 = v13;
    v38 = 2112;
    v39 = v14;
    v40 = 2112;
    v41 = v15;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%@, updated collect startDate for trip bundle, %@, endDate, %@, refreshVariant, %@", buf, 0x2Au);

  }
  v16 = [MOEventFetchOptions alloc];
  v17 = objc_msgSend(objc_alloc((Class)NSDateInterval), "initWithStartDate:endDate:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  v18 = -[MOEventFetchOptions initWithDateInterval:ascending:limit:](v16, "initWithDateInterval:ascending:limit:", v17, 1, 0);

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "eventStore"));
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = __62__MOEventManager__collectEventsWithRefreshVariant_andHandler___block_invoke_136;
  v30[3] = &unk_1002B5510;
  v20 = *(_QWORD *)(a1 + 56);
  v30[4] = *(_QWORD *)(a1 + 32);
  v21 = *(_QWORD *)(a1 + 72);
  v29 = *(_OWORD *)(a1 + 40);
  v32 = v20;
  v33 = v21;
  v22 = (id)v29;
  v31 = v29;
  objc_msgSend(v19, "fetchEventsWithOptions:CompletionHandler:", v18, v30);

}

void __62__MOEventManager__collectEventsWithRefreshVariant_andHandler___block_invoke_136(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;

  v3 = a1[6];
  v4 = a1[7];
  v5 = *(_QWORD *)(*(_QWORD *)(v3 + 8) + 40);
  v6 = *(_QWORD *)(*(_QWORD *)(v4 + 8) + 40);
  v7 = a1[8];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __62__MOEventManager__collectEventsWithRefreshVariant_andHandler___block_invoke_2;
  v9[3] = &unk_1002B54E8;
  v8 = (void *)a1[5];
  v10 = (id)a1[4];
  v12 = v3;
  v13 = v4;
  v11 = v8;
  objc_msgSend(v10, "_collectCompleteEventsBetweenStartDate:endDate:refreshVariant:withStoredEvents:handler:", v5, v6, v7, a2, v9);

}

void __62__MOEventManager__collectEventsWithRefreshVariant_andHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  v5 = a3;
  if (!v9)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "defaultsManager"));
    objc_msgSend(v6, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), CFSTR("EventManagerLastCollectStartDate"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "defaultsManager"));
    objc_msgSend(v7, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), CFSTR("EventManagerLastCollectEndDate"));

  }
  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v9, v5);

}

- (void)_collectCompleteEventsBetweenStartDate:(id)a3 endDate:(id)a4 refreshVariant:(unint64_t)a5 withStoredEvents:(id)a6 handler:(id)a7
{
  id v11;
  id v12;
  id v13;
  id os_log;
  NSObject *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSMutableArray *v20;
  dispatch_queue_attr_t v21;
  NSObject *v22;
  void *v23;
  id v24;
  NSObject *v25;
  MOPerformanceMeasurement *v26;
  id v27;
  NSObject *v28;
  MOPerformanceMeasurement *v29;
  NSObject *v30;
  id v31;
  void *v32;
  id v33;
  NSObject *v34;
  MOPerformanceMeasurement *v35;
  id v36;
  NSObject *v37;
  MOPerformanceMeasurement *v38;
  NSObject *v39;
  id v40;
  void *v41;
  id v42;
  NSObject *v43;
  MOPerformanceMeasurement *v44;
  id v45;
  NSObject *v46;
  MOPerformanceMeasurement *v47;
  NSObject *v48;
  id v49;
  void *v50;
  id v51;
  NSObject *v52;
  MOPerformanceMeasurement *v53;
  id v54;
  NSObject *v55;
  MOPerformanceMeasurement *v56;
  NSObject *v57;
  id v58;
  void *v59;
  id v60;
  NSObject *v61;
  MOPerformanceMeasurement *v62;
  id v63;
  NSObject *v64;
  MOPerformanceMeasurement *v65;
  NSObject *v66;
  id v67;
  void *v68;
  id v69;
  NSObject *v70;
  MOPerformanceMeasurement *v71;
  id v72;
  NSObject *v73;
  MOPerformanceMeasurement *v74;
  NSObject *v75;
  id v76;
  void *v77;
  id v78;
  NSObject *v79;
  MOPerformanceMeasurement *v80;
  id v81;
  NSObject *v82;
  MOPerformanceMeasurement *v83;
  NSObject *v84;
  id v85;
  void *v86;
  id v87;
  NSObject *v88;
  MOPerformanceMeasurement *v89;
  id v90;
  NSObject *v91;
  MOPerformanceMeasurement *v92;
  NSObject *v93;
  id v94;
  void *v95;
  id v96;
  NSObject *v97;
  MOPerformanceMeasurement *v98;
  id v99;
  NSObject *v100;
  MOPerformanceMeasurement *v101;
  NSObject *v102;
  id v103;
  void *v104;
  id v105;
  NSObject *v106;
  MOPerformanceMeasurement *v107;
  id v108;
  NSObject *v109;
  MOPerformanceMeasurement *v110;
  NSObject *v111;
  id v112;
  id v113;
  id v114;
  id v115;
  id v116;
  NSMutableArray *v117;
  NSMutableArray *v118;
  id v119;
  NSObject *v120;
  id v121;
  id v122;
  NSMutableArray *v123;
  NSMutableArray *v124;
  MOPerformanceMeasurement *v125;
  MOPerformanceMeasurement *v126;
  NSMutableArray *v127;
  NSMutableArray *v128;
  NSObject *queue;
  NSMutableArray *v130;
  NSObject *group;
  _QWORD v132[4];
  id v133;
  NSMutableArray *v134;
  NSMutableArray *v135;
  NSMutableArray *v136;
  id v137;
  id v138;
  id v139;
  MOEventManager *v140;
  NSMutableArray *v141;
  MOPerformanceMeasurement *v142;
  id v143;
  uint64_t *v144;
  uint64_t *v145;
  uint64_t *v146;
  uint64_t *v147;
  uint64_t *v148;
  uint64_t *v149;
  uint64_t *v150;
  uint64_t *v151;
  uint64_t *v152;
  uint64_t *v153;
  _BYTE *v154;
  _QWORD v155[5];
  id v156;
  id v157;
  id v158;
  id v159;
  NSMutableArray *v160;
  NSMutableArray *v161;
  MOPerformanceMeasurement *v162;
  NSObject *v163;
  uint64_t *v164;
  _BYTE *v165;
  _QWORD v166[5];
  id v167;
  id v168;
  id v169;
  id v170;
  NSMutableArray *v171;
  NSMutableArray *v172;
  NSMutableArray *v173;
  MOPerformanceMeasurement *v174;
  NSObject *v175;
  uint64_t *v176;
  _QWORD v177[5];
  id v178;
  id v179;
  id v180;
  NSMutableArray *v181;
  NSMutableArray *v182;
  NSMutableArray *v183;
  MOPerformanceMeasurement *v184;
  NSObject *v185;
  uint64_t *v186;
  _BYTE *v187;
  _QWORD v188[5];
  id v189;
  id v190;
  id v191;
  id v192;
  NSMutableArray *v193;
  NSMutableArray *v194;
  MOPerformanceMeasurement *v195;
  NSObject *v196;
  uint64_t *v197;
  _QWORD v198[5];
  id v199;
  id v200;
  id v201;
  id v202;
  NSMutableArray *v203;
  NSMutableArray *v204;
  MOPerformanceMeasurement *v205;
  NSObject *v206;
  uint64_t *v207;
  _BYTE *v208;
  _QWORD v209[5];
  id v210;
  id v211;
  id v212;
  id v213;
  NSMutableArray *v214;
  NSMutableArray *v215;
  MOPerformanceMeasurement *v216;
  NSObject *v217;
  uint64_t *v218;
  _BYTE *v219;
  _QWORD v220[5];
  id v221;
  id v222;
  id v223;
  id v224;
  NSMutableArray *v225;
  NSMutableArray *v226;
  NSMutableArray *v227;
  MOPerformanceMeasurement *v228;
  NSObject *v229;
  uint64_t *v230;
  _QWORD v231[5];
  id v232;
  id v233;
  id v234;
  id v235;
  NSMutableArray *v236;
  NSMutableArray *v237;
  NSMutableArray *v238;
  MOPerformanceMeasurement *v239;
  NSObject *v240;
  uint64_t *v241;
  _QWORD v242[5];
  id v243;
  id v244;
  id v245;
  id v246;
  NSMutableArray *v247;
  NSMutableArray *v248;
  NSMutableArray *v249;
  MOPerformanceMeasurement *v250;
  NSObject *v251;
  uint64_t *v252;
  _BYTE *v253;
  _QWORD block[5];
  id v255;
  id v256;
  id v257;
  id v258;
  NSMutableArray *v259;
  NSMutableArray *v260;
  NSMutableArray *v261;
  MOPerformanceMeasurement *v262;
  NSObject *v263;
  uint64_t *v264;
  _BYTE *v265;
  uint8_t v266[16];
  uint64_t v267;
  uint64_t *v268;
  uint64_t v269;
  uint64_t (*v270)(uint64_t, uint64_t);
  void (*v271)(uint64_t);
  NSMutableDictionary *v272;
  uint64_t v273;
  uint64_t *v274;
  uint64_t v275;
  uint64_t (*v276)(uint64_t, uint64_t);
  void (*v277)(uint64_t);
  NSMutableDictionary *v278;
  uint64_t v279;
  uint64_t *v280;
  uint64_t v281;
  uint64_t (*v282)(uint64_t, uint64_t);
  void (*v283)(uint64_t);
  NSMutableDictionary *v284;
  uint64_t v285;
  uint64_t *v286;
  uint64_t v287;
  uint64_t (*v288)(uint64_t, uint64_t);
  void (*v289)(uint64_t);
  NSMutableDictionary *v290;
  uint64_t v291;
  uint64_t *v292;
  uint64_t v293;
  uint64_t (*v294)(uint64_t, uint64_t);
  void (*v295)(uint64_t);
  NSMutableDictionary *v296;
  uint64_t v297;
  uint64_t *v298;
  uint64_t v299;
  uint64_t (*v300)(uint64_t, uint64_t);
  void (*v301)(uint64_t);
  NSMutableDictionary *v302;
  uint64_t v303;
  uint64_t *v304;
  uint64_t v305;
  uint64_t (*v306)(uint64_t, uint64_t);
  void (*v307)(uint64_t);
  NSMutableDictionary *v308;
  uint64_t v309;
  uint64_t *v310;
  uint64_t v311;
  uint64_t (*v312)(uint64_t, uint64_t);
  void (*v313)(uint64_t);
  NSMutableDictionary *v314;
  uint64_t v315;
  uint64_t *v316;
  uint64_t v317;
  uint64_t (*v318)(uint64_t, uint64_t);
  void (*v319)(uint64_t);
  NSMutableDictionary *v320;
  uint64_t v321;
  uint64_t *v322;
  uint64_t v323;
  uint64_t (*v324)(uint64_t, uint64_t);
  void (*v325)(uint64_t);
  NSMutableDictionary *v326;
  _BYTE buf[24];
  uint64_t (*v328)(uint64_t, uint64_t);
  void (*v329)(uint64_t);
  id v330;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v122 = a7;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v15 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerCollectEvents", ", buf, 2u);
  }

  v125 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("CollectEventsBetweenStartEndWithStoredEvents"), 0);
  -[MOPerformanceMeasurement startSession](v125, "startSession");
  v16 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringFromDate"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringFromDate"));
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v18;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v19;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "start collecting events, start date, %@, end date, %@", buf, 0x16u);

  }
  v121 = objc_alloc_init((Class)NSMutableDictionary);
  v20 = objc_opt_new(NSMutableArray);
  v130 = objc_opt_new(NSMutableArray);
  v127 = objc_opt_new(NSMutableArray);
  v123 = objc_opt_new(NSMutableArray);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v328 = __Block_byref_object_copy__37;
  v329 = __Block_byref_object_dispose__37;
  v330 = 0;
  v321 = 0;
  v322 = &v321;
  v323 = 0x3032000000;
  v324 = __Block_byref_object_copy__37;
  v325 = __Block_byref_object_dispose__37;
  v326 = objc_opt_new(NSMutableDictionary);
  v315 = 0;
  v316 = &v315;
  v317 = 0x3032000000;
  v318 = __Block_byref_object_copy__37;
  v319 = __Block_byref_object_dispose__37;
  v320 = objc_opt_new(NSMutableDictionary);
  v309 = 0;
  v310 = &v309;
  v311 = 0x3032000000;
  v312 = __Block_byref_object_copy__37;
  v313 = __Block_byref_object_dispose__37;
  v314 = objc_opt_new(NSMutableDictionary);
  v303 = 0;
  v304 = &v303;
  v305 = 0x3032000000;
  v306 = __Block_byref_object_copy__37;
  v307 = __Block_byref_object_dispose__37;
  v308 = objc_opt_new(NSMutableDictionary);
  v297 = 0;
  v298 = &v297;
  v299 = 0x3032000000;
  v300 = __Block_byref_object_copy__37;
  v301 = __Block_byref_object_dispose__37;
  v302 = objc_opt_new(NSMutableDictionary);
  v291 = 0;
  v292 = &v291;
  v293 = 0x3032000000;
  v294 = __Block_byref_object_copy__37;
  v295 = __Block_byref_object_dispose__37;
  v296 = objc_opt_new(NSMutableDictionary);
  v285 = 0;
  v286 = &v285;
  v287 = 0x3032000000;
  v288 = __Block_byref_object_copy__37;
  v289 = __Block_byref_object_dispose__37;
  v290 = objc_opt_new(NSMutableDictionary);
  v279 = 0;
  v280 = &v279;
  v281 = 0x3032000000;
  v282 = __Block_byref_object_copy__37;
  v283 = __Block_byref_object_dispose__37;
  v284 = objc_opt_new(NSMutableDictionary);
  v273 = 0;
  v274 = &v273;
  v275 = 0x3032000000;
  v276 = __Block_byref_object_copy__37;
  v277 = __Block_byref_object_dispose__37;
  v278 = objc_opt_new(NSMutableDictionary);
  v267 = 0;
  v268 = &v267;
  v269 = 0x3032000000;
  v270 = __Block_byref_object_copy__37;
  v271 = __Block_byref_object_dispose__37;
  v272 = objc_opt_new(NSMutableDictionary);
  group = dispatch_group_create();
  v21 = dispatch_queue_attr_make_with_autorelease_frequency((dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v22 = objc_claimAutoreleasedReturnValue(v21);
  queue = dispatch_queue_create("collect", v22);

  if (-[MOConfigurationManager isAllowedToProcessEventCategory:](self->_configurationManager, "isAllowedToProcessEventCategory:", 24))
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventManager _getEarliestDateForCategory:](self, "_getEarliestDateForCategory:", 24));
    objc_msgSend((id)v322[5], "setObject:forKey:", &__kCFBooleanFalse, CFSTR("resultMindfulSessionsSuccess"));
    v24 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_signpost_enabled(v25))
    {
      *(_WORD *)v266 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v25, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerCollectEventsState Of Mind", ", v266, 2u);
    }

    v26 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("CollectStateOfMind"), 0);
    -[MOPerformanceMeasurement startSession](v26, "startSession");
    v27 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v266 = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "start fetching and rehydrating state of mind data", v266, 2u);
    }

    dispatch_group_enter(group);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke;
    block[3] = &unk_1002B55B0;
    block[4] = self;
    v255 = v11;
    v256 = v23;
    v257 = v12;
    v258 = v13;
    v259 = v20;
    v260 = v130;
    v264 = &v321;
    v265 = buf;
    v261 = v127;
    v262 = v26;
    v263 = group;
    v29 = v26;
    v30 = v23;
    dispatch_async(queue, block);

  }
  else
  {
    v31 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    v30 = objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v266 = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "skipping fetching and rehydrating state of mind", v266, 2u);
    }
  }

  if (-[MOConfigurationManager isAllowedToProcessEventCategory:](self->_configurationManager, "isAllowedToProcessEventCategory:", 2))
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventManager _getEarliestDateForCategory:](self, "_getEarliestDateForCategory:", 2));
    objc_msgSend((id)v316[5], "setObject:forKey:", &__kCFBooleanFalse, CFSTR("resultWorkoutsSuccess"));
    v33 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    v34 = objc_claimAutoreleasedReturnValue(v33);
    if (os_signpost_enabled(v34))
    {
      *(_WORD *)v266 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v34, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerCollectEventsWorkouts", ", v266, 2u);
    }

    v35 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("CollectWorkouts"), 0);
    -[MOPerformanceMeasurement startSession](v35, "startSession");
    v36 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    v37 = objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v266 = 0;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "start fetching and rehydrating workouts", v266, 2u);
    }

    dispatch_group_enter(group);
    v242[0] = _NSConcreteStackBlock;
    v242[1] = 3221225472;
    v242[2] = __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_158;
    v242[3] = &unk_1002B55B0;
    v242[4] = self;
    v243 = v11;
    v244 = v32;
    v245 = v12;
    v246 = v13;
    v247 = v20;
    v248 = v130;
    v252 = &v315;
    v253 = buf;
    v249 = v127;
    v250 = v35;
    v251 = group;
    v38 = v35;
    v39 = v32;
    dispatch_async(queue, v242);

  }
  else
  {
    v40 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    v39 = objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v266 = 0;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "skipping fetching and rehydrating workouts", v266, 2u);
    }
  }

  if (-[MOConfigurationManager isAllowedToProcessEventCategory:](self->_configurationManager, "isAllowedToProcessEventCategory:", 17))
  {
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventManager _getEarliestDateForCategory:](self, "_getEarliestDateForCategory:", 17));
    objc_msgSend((id)v310[5], "setObject:forKey:", &__kCFBooleanFalse, CFSTR("resultPhotoMemorySuccess"));
    v42 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    v43 = objc_claimAutoreleasedReturnValue(v42);
    if (os_signpost_enabled(v43))
    {
      *(_WORD *)v266 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v43, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerCollectEventsPhotoMemories", ", v266, 2u);
    }

    v44 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("CollectPhotoMemories"), 0);
    -[MOPerformanceMeasurement startSession](v44, "startSession");
    v45 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    v46 = objc_claimAutoreleasedReturnValue(v45);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v266 = 0;
      _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_INFO, "start fetching and rehydrating photo memory", v266, 2u);
    }

    dispatch_group_enter(group);
    v231[0] = _NSConcreteStackBlock;
    v231[1] = 3221225472;
    v231[2] = __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_163;
    v231[3] = &unk_1002B5628;
    v231[4] = self;
    v232 = v11;
    v233 = v41;
    v234 = v12;
    v235 = v13;
    v236 = v20;
    v237 = v130;
    v241 = &v309;
    v238 = v127;
    v239 = v44;
    v240 = group;
    v47 = v44;
    v48 = v41;
    dispatch_async(queue, v231);

  }
  else
  {
    v49 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    v48 = objc_claimAutoreleasedReturnValue(v49);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v266 = 0;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_INFO, "skipping fetching and rehydrating photo memory", v266, 2u);
    }
  }

  if (-[MOConfigurationManager isAllowedToProcessEventCategory:](self->_configurationManager, "isAllowedToProcessEventCategory:", 10))
  {
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventManager _getEarliestDateForCategory:](self, "_getEarliestDateForCategory:", 10));
    objc_msgSend((id)v304[5], "setObject:forKey:", &__kCFBooleanFalse, CFSTR("resultContactsSuccess"));
    v51 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    v52 = objc_claimAutoreleasedReturnValue(v51);
    if (os_signpost_enabled(v52))
    {
      *(_WORD *)v266 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v52, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerCollectEventsContacts", ", v266, 2u);
    }

    v53 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("CollectContacts"), 0);
    -[MOPerformanceMeasurement startSession](v53, "startSession");
    v54 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    v55 = objc_claimAutoreleasedReturnValue(v54);
    if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v266 = 0;
      _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_INFO, "start fetching and rehydrating contact events", v266, 2u);
    }

    dispatch_group_enter(group);
    v220[0] = _NSConcreteStackBlock;
    v220[1] = 3221225472;
    v220[2] = __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_168;
    v220[3] = &unk_1002B5628;
    v220[4] = self;
    v221 = v11;
    v222 = v50;
    v223 = v12;
    v224 = v13;
    v225 = v20;
    v226 = v130;
    v230 = &v303;
    v227 = v127;
    v228 = v53;
    v229 = group;
    v56 = v53;
    v57 = v50;
    dispatch_async(queue, v220);

  }
  else
  {
    v58 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    v57 = objc_claimAutoreleasedReturnValue(v58);
    if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v266 = 0;
      _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_INFO, "skipping fetching and rehydrating contact events", v266, 2u);
    }
  }

  if (-[MOConfigurationManager isAllowedToProcessEventCategory:](self->_configurationManager, "isAllowedToProcessEventCategory:", 15))
  {
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventManager _getEarliestDateForCategory:](self, "_getEarliestDateForCategory:", 15));
    objc_msgSend((id)v298[5], "setObject:forKey:", &__kCFBooleanFalse, CFSTR("resultPeopleDiscoverySuccess"));
    v60 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    v61 = objc_claimAutoreleasedReturnValue(v60);
    if (os_signpost_enabled(v61))
    {
      *(_WORD *)v266 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v61, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerCollectEventsProximity", ", v266, 2u);
    }

    v62 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("CollectProximity"), 0);
    -[MOPerformanceMeasurement startSession](v62, "startSession");
    v63 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    v64 = objc_claimAutoreleasedReturnValue(v63);
    if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v266 = 0;
      _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_INFO, "start fetching and rehydrating prox", v266, 2u);
    }

    dispatch_group_enter(group);
    v209[0] = _NSConcreteStackBlock;
    v209[1] = 3221225472;
    v209[2] = __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_173;
    v209[3] = &unk_1002B56A0;
    v209[4] = self;
    v210 = v11;
    v211 = v59;
    v212 = v12;
    v213 = v13;
    v214 = v20;
    v218 = &v297;
    v219 = buf;
    v215 = v130;
    v216 = v62;
    v217 = group;
    v65 = v62;
    v66 = v59;
    dispatch_async(queue, v209);

  }
  else
  {
    v67 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    v66 = objc_claimAutoreleasedReturnValue(v67);
    if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v266 = 0;
      _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_INFO, "skipping fetching and rehydrating prox", v266, 2u);
    }
  }

  if (-[MOConfigurationManager isAllowedToProcessEventCategory:](self->_configurationManager, "isAllowedToProcessEventCategory:", 23))
  {
    v68 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventManager _getEarliestDateForCategory:](self, "_getEarliestDateForCategory:", 23));
    objc_msgSend((id)v292[5], "setObject:forKey:", &__kCFBooleanFalse, CFSTR("resultPeopleDensitySuccess"));
    v69 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    v70 = objc_claimAutoreleasedReturnValue(v69);
    if (os_signpost_enabled(v70))
    {
      *(_WORD *)v266 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v70, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerCollectEventsPeopleDensity", ", v266, 2u);
    }

    v71 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("CollectPeopleDensity"), 0);
    -[MOPerformanceMeasurement startSession](v71, "startSession");
    v72 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    v73 = objc_claimAutoreleasedReturnValue(v72);
    if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v266 = 0;
      _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_INFO, "start fetching and rehydrating people density events", v266, 2u);
    }

    dispatch_group_enter(group);
    v198[0] = _NSConcreteStackBlock;
    v198[1] = 3221225472;
    v198[2] = __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_178;
    v198[3] = &unk_1002B56A0;
    v198[4] = self;
    v199 = v11;
    v200 = v68;
    v201 = v12;
    v202 = v13;
    v203 = v20;
    v207 = &v291;
    v208 = buf;
    v204 = v130;
    v205 = v71;
    v206 = group;
    v74 = v71;
    v75 = v68;
    dispatch_async(queue, v198);

  }
  else
  {
    v76 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    v75 = objc_claimAutoreleasedReturnValue(v76);
    if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v266 = 0;
      _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_INFO, "skipping fetching and rehydrating people density events", v266, 2u);
    }
  }

  if (-[MOConfigurationManager isAllowedToProcessEventCategory:](self->_configurationManager, "isAllowedToProcessEventCategory:", 22))
  {
    v77 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventManager _getEarliestDateForCategory:](self, "_getEarliestDateForCategory:", 22));
    objc_msgSend((id)v286[5], "setObject:forKey:", &__kCFBooleanFalse, CFSTR("resultLifeEventsSuccess"));
    v78 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    v79 = objc_claimAutoreleasedReturnValue(v78);
    if (os_signpost_enabled(v79))
    {
      *(_WORD *)v266 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v79, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerCollectEventsLifeEvents", ", v266, 2u);
    }

    v80 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("CollectLifeEvents"), 0);
    -[MOPerformanceMeasurement startSession](v80, "startSession");
    v81 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    v82 = objc_claimAutoreleasedReturnValue(v81);
    if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v266 = 0;
      _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_INFO, "start fetching and rehydrating life events", v266, 2u);
    }

    dispatch_group_enter(group);
    v188[0] = _NSConcreteStackBlock;
    v188[1] = 3221225472;
    v188[2] = __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_183;
    v188[3] = &unk_1002B5718;
    v188[4] = self;
    v189 = v11;
    v190 = v77;
    v191 = v12;
    v192 = v13;
    v193 = v20;
    v197 = &v285;
    v194 = v130;
    v195 = v80;
    v196 = group;
    v83 = v80;
    v84 = v77;
    dispatch_async(queue, v188);

  }
  else
  {
    v85 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    v84 = objc_claimAutoreleasedReturnValue(v85);
    if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v266 = 0;
      _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_INFO, "skipping fetching and rehydrating life events", v266, 2u);
    }
  }

  if (-[MOConfigurationManager isAllowedToProcessEventCategory:](self->_configurationManager, "isAllowedToProcessEventCategory:", 1))
  {
    v86 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventManager _getEarliestDateForCategory:](self, "_getEarliestDateForCategory:", 1));
    objc_msgSend((id)v280[5], "setObject:forKey:", &__kCFBooleanFalse, CFSTR("resultVisitsTrainingSuccess"));
    objc_msgSend((id)v280[5], "setObject:forKey:", &__kCFBooleanFalse, CFSTR("resultVisitsSuccess"));
    v87 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    v88 = objc_claimAutoreleasedReturnValue(v87);
    if (os_signpost_enabled(v88))
    {
      *(_WORD *)v266 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v88, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerCollectEventsVisits", ", v266, 2u);
    }

    v89 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("CollectVisits"), 0);
    -[MOPerformanceMeasurement startSession](v89, "startSession");
    v90 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    v91 = objc_claimAutoreleasedReturnValue(v90);
    if (os_log_type_enabled(v91, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v266 = 0;
      _os_log_impl((void *)&_mh_execute_header, v91, OS_LOG_TYPE_INFO, "start training, fetching and rehydrating visits", v266, 2u);
    }

    dispatch_group_enter(group);
    v177[0] = _NSConcreteStackBlock;
    v177[1] = 3221225472;
    v177[2] = __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_188;
    v177[3] = &unk_1002B57E0;
    v177[4] = self;
    v186 = &v279;
    v187 = buf;
    v178 = v11;
    v179 = v86;
    v180 = v13;
    v181 = v20;
    v182 = v123;
    v183 = v130;
    v184 = v89;
    v185 = group;
    v92 = v89;
    v93 = v86;
    dispatch_async(queue, v177);

  }
  else
  {
    v94 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    v93 = objc_claimAutoreleasedReturnValue(v94);
    if (os_log_type_enabled(v93, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v266 = 0;
      _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_INFO, "skipping training, fetching and rehydrating visits", v266, 2u);
    }
  }

  if (-[MOConfigurationManager isAllowedToProcessEventCategory:](self->_configurationManager, "isAllowedToProcessEventCategory:", 6))
  {
    v95 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventManager _getEarliestDateForCategory:](self, "_getEarliestDateForCategory:", 6));
    objc_msgSend((id)v274[5], "setObject:forKey:", &__kCFBooleanFalse, CFSTR("resultMusicSuccess"));
    v96 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    v97 = objc_claimAutoreleasedReturnValue(v96);
    if (os_signpost_enabled(v97))
    {
      *(_WORD *)v266 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v97, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerCollectEventsMusic", ", v266, 2u);
    }

    v98 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("CollectMusic"), 0);
    -[MOPerformanceMeasurement startSession](v98, "startSession");
    v99 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    v100 = objc_claimAutoreleasedReturnValue(v99);
    if (os_log_type_enabled(v100, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v266 = 0;
      _os_log_impl((void *)&_mh_execute_header, v100, OS_LOG_TYPE_INFO, "start fetching and rehydrating music", v266, 2u);
    }

    dispatch_group_enter(group);
    v166[0] = _NSConcreteStackBlock;
    v166[1] = 3221225472;
    v166[2] = __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_201;
    v166[3] = &unk_1002B5628;
    v166[4] = self;
    v167 = v11;
    v168 = v95;
    v169 = v12;
    v170 = v13;
    v171 = v20;
    v172 = v130;
    v176 = &v273;
    v173 = v127;
    v174 = v98;
    v175 = group;
    v101 = v98;
    v102 = v95;
    dispatch_async(queue, v166);

  }
  else
  {
    v103 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    v102 = objc_claimAutoreleasedReturnValue(v103);
    if (os_log_type_enabled(v102, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v266 = 0;
      _os_log_impl((void *)&_mh_execute_header, v102, OS_LOG_TYPE_INFO, "skipping fetching and rehydrating music", v266, 2u);
    }
  }

  if (-[MOConfigurationManager isAllowedToProcessEventCategory:](self->_configurationManager, "isAllowedToProcessEventCategory:", 16))
  {
    v104 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventManager _getEarliestDateForCategory:](self, "_getEarliestDateForCategory:", 16));
    objc_msgSend((id)v268[5], "setObject:forKey:", &__kCFBooleanFalse, CFSTR("resultMotionSuccess"));
    v105 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    v106 = objc_claimAutoreleasedReturnValue(v105);
    if (os_signpost_enabled(v106))
    {
      *(_WORD *)v266 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v106, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerCollectEventsMotionActivity", ", v266, 2u);
    }

    v107 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("CollectMotionActivity"), 0);
    -[MOPerformanceMeasurement startSession](v107, "startSession");
    v108 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    v109 = objc_claimAutoreleasedReturnValue(v108);
    if (os_log_type_enabled(v109, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v266 = 0;
      _os_log_impl((void *)&_mh_execute_header, v109, OS_LOG_TYPE_INFO, "start fetching and rehydrating motion events", v266, 2u);
    }

    dispatch_group_enter(group);
    v155[0] = _NSConcreteStackBlock;
    v155[1] = 3221225472;
    v155[2] = __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_206;
    v155[3] = &unk_1002B56A0;
    v155[4] = self;
    v156 = v11;
    v157 = v104;
    v158 = v12;
    v159 = v13;
    v160 = v20;
    v164 = &v267;
    v165 = buf;
    v161 = v130;
    v162 = v107;
    v163 = group;
    v110 = v107;
    v111 = v104;
    dispatch_async(queue, v155);

  }
  else
  {
    v112 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    v111 = objc_claimAutoreleasedReturnValue(v112);
    if (os_log_type_enabled(v111, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v266 = 0;
      _os_log_impl((void *)&_mh_execute_header, v111, OS_LOG_TYPE_INFO, "skipping fetching and saving motion events", v266, 2u);
    }
  }

  v120 = objc_claimAutoreleasedReturnValue(-[MOEventManager queue](self, "queue"));
  v132[0] = _NSConcreteStackBlock;
  v132[1] = 3221225472;
  v132[2] = __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_209;
  v132[3] = &unk_1002B5830;
  v145 = &v315;
  v146 = &v309;
  v147 = &v303;
  v148 = &v297;
  v149 = &v291;
  v150 = &v285;
  v151 = &v279;
  v152 = &v273;
  v153 = &v267;
  v154 = buf;
  v133 = v121;
  v134 = v130;
  v135 = v127;
  v136 = v20;
  v137 = v11;
  v138 = v12;
  v139 = v13;
  v140 = self;
  v143 = v122;
  v144 = &v321;
  v141 = v123;
  v142 = v125;
  v126 = v125;
  v113 = v122;
  v124 = v123;
  v114 = v13;
  v115 = v12;
  v116 = v11;
  v117 = v20;
  v128 = v127;
  v118 = v130;
  v119 = v121;
  dispatch_group_notify(group, v120, v132);

  _Block_object_dispose(&v267, 8);
  _Block_object_dispose(&v273, 8);

  _Block_object_dispose(&v279, 8);
  _Block_object_dispose(&v285, 8);

  _Block_object_dispose(&v291, 8);
  _Block_object_dispose(&v297, 8);

  _Block_object_dispose(&v303, 8);
  _Block_object_dispose(&v309, 8);

  _Block_object_dispose(&v315, 8);
  _Block_object_dispose(&v321, 8);

  _Block_object_dispose(buf, 8);
}

void __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke(uint64_t a1)
{
  dispatch_semaphore_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  id v13;
  id os_log;
  NSObject *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  NSObject *v21;
  id v22;
  __int128 v23;

  v2 = dispatch_semaphore_create(0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "healthKitManager"));
  v4 = *(void **)(a1 + 40);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", *(_QWORD *)(a1 + 48), 0.0));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "laterDate:", v5));
  v7 = *(void **)(a1 + 56);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", *(_QWORD *)(a1 + 48), 1.0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "laterDate:", v8));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_2;
  v17[3] = &unk_1002B5588;
  v17[4] = *(_QWORD *)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 64);
  v18 = *(id *)(a1 + 72);
  v19 = *(id *)(a1 + 80);
  v20 = *(id *)(a1 + 88);
  v23 = *(_OWORD *)(a1 + 112);
  v11 = v2;
  v21 = v11;
  v22 = *(id *)(a1 + 96);
  objc_msgSend(v3, "fetchStateOfMindEventsBetweenStartDate:endDate:withStoredEvents:handler:", v6, v9, v10, v17);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ - [%s] - %d - %s"), CFSTR("MOSemaphoreWait"), "/Library/Caches/com.apple.xbs/Sources/Moments/momentsd/PromptEngine/PromptProvider/MOEventManager.m", 505, "-[MOEventManager _collectCompleteEventsBetweenStartDate:endDate:refreshVariant:withStoredEvents:handler:]_block_invoke"));
  v16 = 0;
  LOBYTE(v6) = MOSemaphoreWaitAndFaultIfTimeout_Internal(v11, &v16, v12, 120.0);
  v13 = v16;
  if ((v6 & 1) == 0)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    v15 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_cold_3();

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 104));

}

void __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id os_log;
  NSObject *v11;
  uint8_t v12[8];
  _QWORD block[4];
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  __int128 v19;

  v5 = a2;
  v6 = a3;
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_3;
  block[3] = &unk_1002B5560;
  v8 = v5;
  v14 = v8;
  v9 = v6;
  v15 = v9;
  v16 = *(id *)(a1 + 40);
  v17 = *(id *)(a1 + 48);
  v18 = *(id *)(a1 + 56);
  v19 = *(_OWORD *)(a1 + 80);
  dispatch_sync(v7, block);

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 64));
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v11 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_signpost_enabled(v11))
  {
    *(_WORD *)v12 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerCollectEventsState Of Mind", ", v12, 2u);
  }

  objc_msgSend(*(id *)(a1 + 72), "endSession");
}

void __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_3(uint64_t a1)
{
  void *v2;
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int16 v13;
  __CFString *v14;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "domain"));
    if (v3 == CFSTR("MOErrorDomain"))
    {
      v14 = v3;
      v13 = (unsigned __int16)objc_msgSend(*(id *)(a1 + 32), "code");

      if ((v13 & 0x400) != 0)
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), *(id *)(a1 + 32));
    }
    else
    {

    }
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("newEvents")));

    if (v4)
    {
      v5 = *(void **)(a1 + 48);
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("newEvents")));
      objc_msgSend(v5, "addObjectsFromArray:", v6);

    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("rehydratedEvents")));

    if (v7)
    {
      v8 = *(void **)(a1 + 56);
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("rehydratedEvents")));
      objc_msgSend(v8, "addObjectsFromArray:", v9);

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("unrehydratedEvents")));

    if (v10)
    {
      v11 = *(void **)(a1 + 64);
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("unrehydratedEvents")));
      objc_msgSend(v11, "addObjectsFromArray:", v12);

    }
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setObject:forKey:", &__kCFBooleanTrue, CFSTR("resultMindfulSessionsSuccess"));
  }
}

void __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_158(uint64_t a1)
{
  dispatch_semaphore_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  id v13;
  id os_log;
  NSObject *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  NSObject *v21;
  id v22;
  __int128 v23;

  v2 = dispatch_semaphore_create(0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "healthKitManager"));
  v4 = *(void **)(a1 + 40);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", *(_QWORD *)(a1 + 48), 0.0));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "laterDate:", v5));
  v7 = *(void **)(a1 + 56);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", *(_QWORD *)(a1 + 48), 1.0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "laterDate:", v8));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_2_159;
  v17[3] = &unk_1002B5588;
  v17[4] = *(_QWORD *)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 64);
  v18 = *(id *)(a1 + 72);
  v19 = *(id *)(a1 + 80);
  v20 = *(id *)(a1 + 88);
  v23 = *(_OWORD *)(a1 + 112);
  v11 = v2;
  v21 = v11;
  v22 = *(id *)(a1 + 96);
  objc_msgSend(v3, "fetchWorkoutEventsBetweenStartDate:endDate:withStoredEvents:handler:", v6, v9, v10, v17);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ - [%s] - %d - %s"), CFSTR("MOSemaphoreWait"), "/Library/Caches/com.apple.xbs/Sources/Moments/momentsd/PromptEngine/PromptProvider/MOEventManager.m", 551, "-[MOEventManager _collectCompleteEventsBetweenStartDate:endDate:refreshVariant:withStoredEvents:handler:]_block_invoke"));
  v16 = 0;
  LOBYTE(v6) = MOSemaphoreWaitAndFaultIfTimeout_Internal(v11, &v16, v12, 120.0);
  v13 = v16;
  if ((v6 & 1) == 0)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    v15 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_cold_3();

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 104));

}

void __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_2_159(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id os_log;
  NSObject *v11;
  uint8_t v12[8];
  _QWORD block[4];
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  __int128 v19;

  v5 = a2;
  v6 = a3;
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_3_160;
  block[3] = &unk_1002B5560;
  v8 = v5;
  v14 = v8;
  v9 = v6;
  v15 = v9;
  v16 = *(id *)(a1 + 40);
  v17 = *(id *)(a1 + 48);
  v18 = *(id *)(a1 + 56);
  v19 = *(_OWORD *)(a1 + 80);
  dispatch_sync(v7, block);

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 64));
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v11 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_signpost_enabled(v11))
  {
    *(_WORD *)v12 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerCollectEventsWorkouts", ", v12, 2u);
  }

  objc_msgSend(*(id *)(a1 + 72), "endSession");
}

void __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_3_160(uint64_t a1)
{
  void *v2;
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int16 v13;
  __CFString *v14;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "domain"));
    if (v3 == CFSTR("MOErrorDomain"))
    {
      v14 = v3;
      v13 = (unsigned __int16)objc_msgSend(*(id *)(a1 + 32), "code");

      if ((v13 & 0x400) != 0)
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), *(id *)(a1 + 32));
    }
    else
    {

    }
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("newEvents")));

    if (v4)
    {
      v5 = *(void **)(a1 + 48);
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("newEvents")));
      objc_msgSend(v5, "addObjectsFromArray:", v6);

    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("rehydratedEvents")));

    if (v7)
    {
      v8 = *(void **)(a1 + 56);
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("rehydratedEvents")));
      objc_msgSend(v8, "addObjectsFromArray:", v9);

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("unrehydratedEvents")));

    if (v10)
    {
      v11 = *(void **)(a1 + 64);
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("unrehydratedEvents")));
      objc_msgSend(v11, "addObjectsFromArray:", v12);

    }
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setObject:forKey:", &__kCFBooleanTrue, CFSTR("resultWorkoutsSuccess"));
  }
}

void __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_163(uint64_t a1)
{
  dispatch_semaphore_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  id v15;
  id os_log;
  NSObject *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  NSObject *v23;
  id v24;
  uint64_t v25;

  v2 = dispatch_semaphore_create(0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "photoManager"));
  v4 = *(void **)(a1 + 40);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", *(_QWORD *)(a1 + 48), 0.0));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "laterDate:", v5));
  v7 = *(void **)(a1 + 56);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", *(_QWORD *)(a1 + 48), 1.0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "laterDate:", v8));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_2_164;
  v19[3] = &unk_1002B5600;
  v19[4] = *(_QWORD *)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 64);
  v20 = *(id *)(a1 + 72);
  v21 = *(id *)(a1 + 80);
  v11 = *(id *)(a1 + 88);
  v12 = *(_QWORD *)(a1 + 112);
  v22 = v11;
  v25 = v12;
  v13 = v2;
  v23 = v13;
  v24 = *(id *)(a1 + 96);
  objc_msgSend(v3, "fetchPhotoMemoryEventsBetweenStartDate:endDate:withStoredEvents:handler:", v6, v9, v10, v19);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ - [%s] - %d - %s"), CFSTR("MOSemaphoreWait"), "/Library/Caches/com.apple.xbs/Sources/Moments/momentsd/PromptEngine/PromptProvider/MOEventManager.m", 592, "-[MOEventManager _collectCompleteEventsBetweenStartDate:endDate:refreshVariant:withStoredEvents:handler:]_block_invoke"));
  v18 = 0;
  LOBYTE(v6) = MOSemaphoreWaitAndFaultIfTimeout_Internal(v13, &v18, v14, 120.0);
  v15 = v18;
  if ((v6 & 1) == 0)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    v17 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_cold_3();

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 104));

}

void __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_2_164(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id os_log;
  NSObject *v13;
  uint8_t v14[16];
  _QWORD block[4];
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;

  v5 = a2;
  v6 = a3;
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_3_165;
  block[3] = &unk_1002B55D8;
  v8 = v5;
  v16 = v8;
  v9 = v6;
  v17 = v9;
  v18 = *(id *)(a1 + 40);
  v19 = *(id *)(a1 + 48);
  v10 = *(id *)(a1 + 56);
  v11 = *(_QWORD *)(a1 + 80);
  v20 = v10;
  v21 = v11;
  dispatch_sync(v7, block);

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 64));
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v13 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_signpost_enabled(v13))
  {
    *(_WORD *)v14 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerCollectEventsPhotoMemories", ", v14, 2u);
  }

  objc_msgSend(*(id *)(a1 + 72), "endSession");
}

id *__105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_3_165(id *result)
{
  id *v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  if (!result[4])
  {
    v1 = result;
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(result[5], "objectForKey:", CFSTR("newEvents")));

    if (v2)
    {
      v3 = v1[6];
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1[5], "objectForKey:", CFSTR("newEvents")));
      objc_msgSend(v3, "addObjectsFromArray:", v4);

    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1[5], "objectForKey:", CFSTR("rehydratedEvents")));

    if (v5)
    {
      v6 = v1[7];
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1[5], "objectForKey:", CFSTR("rehydratedEvents")));
      objc_msgSend(v6, "addObjectsFromArray:", v7);

    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1[5], "objectForKey:", CFSTR("unrehydratedEvents")));

    if (v8)
    {
      v9 = v1[8];
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1[5], "objectForKey:", CFSTR("unrehydratedEvents")));
      objc_msgSend(v9, "addObjectsFromArray:", v10);

    }
    return (id *)objc_msgSend(*(id *)(*((_QWORD *)v1[9] + 1) + 40), "setObject:forKey:", &__kCFBooleanTrue, CFSTR("resultPhotoMemorySuccess"));
  }
  return result;
}

void __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_168(uint64_t a1)
{
  dispatch_semaphore_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  id v15;
  id os_log;
  NSObject *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  NSObject *v23;
  id v24;
  uint64_t v25;

  v2 = dispatch_semaphore_create(0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "significantContactManager"));
  v4 = *(void **)(a1 + 40);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", *(_QWORD *)(a1 + 48), 0.0));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "laterDate:", v5));
  v7 = *(void **)(a1 + 56);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", *(_QWORD *)(a1 + 48), 1.0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "laterDate:", v8));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_2_169;
  v19[3] = &unk_1002B5600;
  v19[4] = *(_QWORD *)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 64);
  v20 = *(id *)(a1 + 72);
  v21 = *(id *)(a1 + 80);
  v11 = *(id *)(a1 + 88);
  v12 = *(_QWORD *)(a1 + 112);
  v22 = v11;
  v25 = v12;
  v13 = v2;
  v23 = v13;
  v24 = *(id *)(a1 + 96);
  objc_msgSend(v3, "fetchConversationEventsBetweenStartDate:endDate:withStoredEvents:handler:", v6, v9, v10, v19);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ - [%s] - %d - %s"), CFSTR("MOSemaphoreWait"), "/Library/Caches/com.apple.xbs/Sources/Moments/momentsd/PromptEngine/PromptProvider/MOEventManager.m", 633, "-[MOEventManager _collectCompleteEventsBetweenStartDate:endDate:refreshVariant:withStoredEvents:handler:]_block_invoke"));
  v18 = 0;
  LOBYTE(v6) = MOSemaphoreWaitAndFaultIfTimeout_Internal(v13, &v18, v14, 120.0);
  v15 = v18;
  if ((v6 & 1) == 0)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    v17 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_cold_3();

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 104));

}

void __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_2_169(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id os_log;
  NSObject *v13;
  uint8_t v14[16];
  _QWORD block[4];
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;

  v5 = a2;
  v6 = a3;
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_3_170;
  block[3] = &unk_1002B55D8;
  v8 = v5;
  v16 = v8;
  v9 = v6;
  v17 = v9;
  v18 = *(id *)(a1 + 40);
  v19 = *(id *)(a1 + 48);
  v10 = *(id *)(a1 + 56);
  v11 = *(_QWORD *)(a1 + 80);
  v20 = v10;
  v21 = v11;
  dispatch_sync(v7, block);

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 64));
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v13 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_signpost_enabled(v13))
  {
    *(_WORD *)v14 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerCollectEventsContacts", ", v14, 2u);
  }

  objc_msgSend(*(id *)(a1 + 72), "endSession");
}

id *__105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_3_170(id *result)
{
  id *v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  if (!result[4])
  {
    v1 = result;
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(result[5], "objectForKey:", CFSTR("newEvents")));

    if (v2)
    {
      v3 = v1[6];
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1[5], "objectForKey:", CFSTR("newEvents")));
      objc_msgSend(v3, "addObjectsFromArray:", v4);

    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1[5], "objectForKey:", CFSTR("rehydratedEvents")));

    if (v5)
    {
      v6 = v1[7];
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1[5], "objectForKey:", CFSTR("rehydratedEvents")));
      objc_msgSend(v6, "addObjectsFromArray:", v7);

    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1[5], "objectForKey:", CFSTR("unrehydratedEvents")));

    if (v8)
    {
      v9 = v1[8];
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1[5], "objectForKey:", CFSTR("unrehydratedEvents")));
      objc_msgSend(v9, "addObjectsFromArray:", v10);

    }
    return (id *)objc_msgSend(*(id *)(*((_QWORD *)v1[9] + 1) + 40), "setObject:forKey:", &__kCFBooleanTrue, CFSTR("resultContactsSuccess"));
  }
  return result;
}

void __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_173(uint64_t a1)
{
  dispatch_semaphore_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  id v13;
  id os_log;
  NSObject *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  NSObject *v20;
  id v21;
  __int128 v22;

  v2 = dispatch_semaphore_create(0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "peopleDiscoveryManager"));
  v4 = *(void **)(a1 + 40);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", *(_QWORD *)(a1 + 48), 0.0));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "laterDate:", v5));
  v7 = *(void **)(a1 + 56);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", *(_QWORD *)(a1 + 48), 1.0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "laterDate:", v8));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_2_174;
  v17[3] = &unk_1002B5678;
  v17[4] = *(_QWORD *)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 64);
  v18 = *(id *)(a1 + 72);
  v19 = *(id *)(a1 + 80);
  v22 = *(_OWORD *)(a1 + 104);
  v11 = v2;
  v20 = v11;
  v21 = *(id *)(a1 + 88);
  objc_msgSend(v3, "fetchProxEventsBetweenStartDate:endDate:withStoredEvents:handler:", v6, v9, v10, v17);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ - [%s] - %d - %s"), CFSTR("MOSemaphoreWait"), "/Library/Caches/com.apple.xbs/Sources/Moments/momentsd/PromptEngine/PromptProvider/MOEventManager.m", 674, "-[MOEventManager _collectCompleteEventsBetweenStartDate:endDate:refreshVariant:withStoredEvents:handler:]_block_invoke"));
  v16 = 0;
  LOBYTE(v6) = MOSemaphoreWaitAndFaultIfTimeout_Internal(v11, &v16, v12, 120.0);
  v13 = v16;
  if ((v6 & 1) == 0)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    v15 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_cold_3();

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 96));

}

void __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_2_174(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id os_log;
  NSObject *v11;
  uint8_t v12[16];
  _QWORD block[4];
  id v14;
  id v15;
  id v16;
  id v17;
  __int128 v18;

  v5 = a2;
  v6 = a3;
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_3_175;
  block[3] = &unk_1002B5650;
  v8 = v5;
  v14 = v8;
  v9 = v6;
  v15 = v9;
  v16 = *(id *)(a1 + 40);
  v17 = *(id *)(a1 + 48);
  v18 = *(_OWORD *)(a1 + 72);
  dispatch_sync(v7, block);

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v11 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_signpost_enabled(v11))
  {
    *(_WORD *)v12 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerCollectEventsProximity", ", v12, 2u);
  }

  objc_msgSend(*(id *)(a1 + 64), "endSession");
}

void __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_3_175(uint64_t a1)
{
  void *v2;
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int16 v10;
  uint64_t v11;
  id *v12;
  void *v13;
  void *v14;
  __CFString *v15;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "domain"));
    if (v3 == CFSTR("MOErrorDomain"))
    {
      v15 = v3;
      v10 = (unsigned __int16)objc_msgSend(*(id *)(a1 + 32), "code");

      if ((v10 & 0x400) != 0)
      {
        v11 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
        v14 = *(void **)(v11 + 40);
        v12 = (id *)(v11 + 40);
        v13 = v14;
        if (!v14)
          v13 = *(void **)(a1 + 32);
        objc_storeStrong(v12, v13);
      }
    }
    else
    {

    }
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("newEvents")));

    if (v4)
    {
      v5 = *(void **)(a1 + 48);
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("newEvents")));
      objc_msgSend(v5, "addObjectsFromArray:", v6);

    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("rehydratedEvents")));

    if (v7)
    {
      v8 = *(void **)(a1 + 56);
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("rehydratedEvents")));
      objc_msgSend(v8, "addObjectsFromArray:", v9);

    }
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setObject:forKey:", &__kCFBooleanTrue, CFSTR("resultPeopleDiscoverySuccess"));
  }
}

void __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_178(uint64_t a1)
{
  dispatch_semaphore_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  id v13;
  id os_log;
  NSObject *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  NSObject *v20;
  id v21;
  __int128 v22;

  v2 = dispatch_semaphore_create(0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "peopleDiscoveryManager"));
  v4 = *(void **)(a1 + 40);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", *(_QWORD *)(a1 + 48), 0.0));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "laterDate:", v5));
  v7 = *(void **)(a1 + 56);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", *(_QWORD *)(a1 + 48), 1.0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "laterDate:", v8));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_2_179;
  v17[3] = &unk_1002B5678;
  v17[4] = *(_QWORD *)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 64);
  v18 = *(id *)(a1 + 72);
  v19 = *(id *)(a1 + 80);
  v22 = *(_OWORD *)(a1 + 104);
  v11 = v2;
  v20 = v11;
  v21 = *(id *)(a1 + 88);
  objc_msgSend(v3, "fetchPeopleDensityEventsBetweenStartDate:endDate:withStoredEvents:handler:", v6, v9, v10, v17);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ - [%s] - %d - %s"), CFSTR("MOSemaphoreWait"), "/Library/Caches/com.apple.xbs/Sources/Moments/momentsd/PromptEngine/PromptProvider/MOEventManager.m", 716, "-[MOEventManager _collectCompleteEventsBetweenStartDate:endDate:refreshVariant:withStoredEvents:handler:]_block_invoke"));
  v16 = 0;
  LOBYTE(v6) = MOSemaphoreWaitAndFaultIfTimeout_Internal(v11, &v16, v12, 120.0);
  v13 = v16;
  if ((v6 & 1) == 0)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    v15 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_cold_3();

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 96));

}

void __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_2_179(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id os_log;
  NSObject *v11;
  uint8_t v12[16];
  _QWORD block[4];
  id v14;
  id v15;
  id v16;
  id v17;
  __int128 v18;

  v5 = a2;
  v6 = a3;
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_3_180;
  block[3] = &unk_1002B5650;
  v8 = v5;
  v14 = v8;
  v9 = v6;
  v15 = v9;
  v16 = *(id *)(a1 + 40);
  v17 = *(id *)(a1 + 48);
  v18 = *(_OWORD *)(a1 + 72);
  dispatch_sync(v7, block);

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v11 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_signpost_enabled(v11))
  {
    *(_WORD *)v12 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerCollectEventsPeopleDensity", ", v12, 2u);
  }

  objc_msgSend(*(id *)(a1 + 64), "endSession");
}

void __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_3_180(uint64_t a1)
{
  void *v2;
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int16 v10;
  uint64_t v11;
  id *v12;
  void *v13;
  void *v14;
  __CFString *v15;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "domain"));
    if (v3 == CFSTR("MOErrorDomain"))
    {
      v15 = v3;
      v10 = (unsigned __int16)objc_msgSend(*(id *)(a1 + 32), "code");

      if ((v10 & 0x400) != 0)
      {
        v11 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
        v14 = *(void **)(v11 + 40);
        v12 = (id *)(v11 + 40);
        v13 = v14;
        if (!v14)
          v13 = *(void **)(a1 + 32);
        objc_storeStrong(v12, v13);
      }
    }
    else
    {

    }
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("newEvents")));

    if (v4)
    {
      v5 = *(void **)(a1 + 48);
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("newEvents")));
      objc_msgSend(v5, "addObjectsFromArray:", v6);

    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("rehydratedEvents")));

    if (v7)
    {
      v8 = *(void **)(a1 + 56);
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("rehydratedEvents")));
      objc_msgSend(v8, "addObjectsFromArray:", v9);

    }
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setObject:forKey:", &__kCFBooleanTrue, CFSTR("resultPeopleDensitySuccess"));
  }
}

void __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_183(uint64_t a1)
{
  dispatch_semaphore_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  id v15;
  id os_log;
  NSObject *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  NSObject *v22;
  id v23;
  uint64_t v24;

  v2 = dispatch_semaphore_create(0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "lifeEventManager"));
  v4 = *(void **)(a1 + 40);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", *(_QWORD *)(a1 + 48), 0.0));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "laterDate:", v5));
  v7 = *(void **)(a1 + 56);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", *(_QWORD *)(a1 + 48), 1.0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "laterDate:", v8));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_2_184;
  v19[3] = &unk_1002B56F0;
  v19[4] = *(_QWORD *)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 64);
  v20 = *(id *)(a1 + 72);
  v11 = *(id *)(a1 + 80);
  v12 = *(_QWORD *)(a1 + 104);
  v21 = v11;
  v24 = v12;
  v13 = v2;
  v22 = v13;
  v23 = *(id *)(a1 + 88);
  objc_msgSend(v3, "fetchLifeEventsBetweenStartDate:endDate:withStoredEvents:handler:", v6, v9, v10, v19);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ - [%s] - %d - %s"), CFSTR("MOSemaphoreWait"), "/Library/Caches/com.apple.xbs/Sources/Moments/momentsd/PromptEngine/PromptProvider/MOEventManager.m", 755, "-[MOEventManager _collectCompleteEventsBetweenStartDate:endDate:refreshVariant:withStoredEvents:handler:]_block_invoke"));
  v18 = 0;
  LOBYTE(v6) = MOSemaphoreWaitAndFaultIfTimeout_Internal(v13, &v18, v14, 120.0);
  v15 = v18;
  if ((v6 & 1) == 0)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    v17 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_cold_3();

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 96));

}

void __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_2_184(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id os_log;
  NSObject *v13;
  uint8_t v14[8];
  _QWORD block[4];
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;

  v5 = a2;
  v6 = a3;
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_3_185;
  block[3] = &unk_1002B56C8;
  v8 = v5;
  v16 = v8;
  v9 = v6;
  v17 = v9;
  v18 = *(id *)(a1 + 40);
  v10 = *(id *)(a1 + 48);
  v11 = *(_QWORD *)(a1 + 72);
  v19 = v10;
  v20 = v11;
  dispatch_sync(v7, block);

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v13 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_signpost_enabled(v13))
  {
    *(_WORD *)v14 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerCollectEventsLifeEvents", ", v14, 2u);
  }

  objc_msgSend(*(id *)(a1 + 64), "endSession");
}

id *__105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_3_185(id *result)
{
  id *v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  if (!result[4])
  {
    v1 = result;
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(result[5], "objectForKey:", CFSTR("newEvents")));

    if (v2)
    {
      v3 = v1[6];
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1[5], "objectForKey:", CFSTR("newEvents")));
      objc_msgSend(v3, "addObjectsFromArray:", v4);

    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1[5], "objectForKey:", CFSTR("rehydratedEvents")));

    if (v5)
    {
      v6 = v1[7];
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1[5], "objectForKey:", CFSTR("rehydratedEvents")));
      objc_msgSend(v6, "addObjectsFromArray:", v7);

    }
    return (id *)objc_msgSend(*(id *)(*((_QWORD *)v1[8] + 1) + 40), "setObject:forKey:", &__kCFBooleanTrue, CFSTR("resultLifeEventsSuccess"));
  }
  return result;
}

void __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_188(uint64_t a1)
{
  dispatch_semaphore_t v2;
  id os_log;
  NSObject *v4;
  MOPerformanceMeasurement *v5;
  void *v6;
  NSObject *v7;
  MOPerformanceMeasurement *v8;
  void *v9;
  BOOL v10;
  id v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  MOPerformanceMeasurement *v15;
  dispatch_semaphore_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  MOPerformanceMeasurement *v24;
  void *v25;
  BOOL v26;
  id v27;
  id v28;
  NSObject *v29;
  id v30;
  id v31;
  _QWORD v32[5];
  id v33;
  id v34;
  id v35;
  id v36;
  NSObject *v37;
  MOPerformanceMeasurement *v38;
  id v39;
  __int128 v40;
  id v41;
  _QWORD v42[5];
  NSObject *v43;
  MOPerformanceMeasurement *v44;
  __int128 v45;
  uint8_t buf[16];

  v2 = dispatch_semaphore_create(0);
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v4 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerCollectEventsVisits-Training", ", buf, 2u);
  }

  v5 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("CollectVisitsTraining"), 0);
  -[MOPerformanceMeasurement startSession](v5, "startSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "routineServiceManager"));
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_191;
  v42[3] = &unk_1002B5768;
  v42[4] = *(_QWORD *)(a1 + 32);
  v45 = *(_OWORD *)(a1 + 104);
  v7 = v2;
  v43 = v7;
  v8 = v5;
  v44 = v8;
  objc_msgSend(v6, "detectHindsightVisitsWithCompletionHandler:", v42);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ - [%s] - %d - %s"), CFSTR("MOSemaphoreWait"), "/Library/Caches/com.apple.xbs/Sources/Moments/momentsd/PromptEngine/PromptProvider/MOEventManager.m", 792, "-[MOEventManager _collectCompleteEventsBetweenStartDate:endDate:refreshVariant:withStoredEvents:handler:]_block_invoke"));
  v41 = 0;
  v10 = MOSemaphoreWaitAndFaultIfTimeout_Internal(v7, &v41, v9, 120.0);
  v30 = v41;
  if (!v10)
  {
    v11 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_cold_3();

  }
  v13 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerCollectEventsVisits-Fetching", ", buf, 2u);
  }

  v15 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("CollectVisitsFetching"), 0);
  -[MOPerformanceMeasurement startSession](v15, "startSession");
  v16 = dispatch_semaphore_create(0);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "routineServiceManager"));
  v18 = *(void **)(a1 + 40);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", *(_QWORD *)(a1 + 48), 0.0));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "laterDate:", v19));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](NSDate, "distantFuture"));
  v22 = *(void **)(a1 + 56);
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_195;
  v32[3] = &unk_1002B57B8;
  v32[4] = *(_QWORD *)(a1 + 32);
  v33 = v22;
  v34 = *(id *)(a1 + 64);
  v35 = *(id *)(a1 + 72);
  v36 = *(id *)(a1 + 80);
  v40 = *(_OWORD *)(a1 + 104);
  v23 = v16;
  v37 = v23;
  v24 = v15;
  v38 = v24;
  v39 = *(id *)(a1 + 88);
  objc_msgSend(v17, "fetchVisitsBetweenStartDate:endDate:withStoredEvents:handler:", v20, v21, v33, v32);

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ - [%s] - %d - %s"), CFSTR("MOSemaphoreWait"), "/Library/Caches/com.apple.xbs/Sources/Moments/momentsd/PromptEngine/PromptProvider/MOEventManager.m", 831, "-[MOEventManager _collectCompleteEventsBetweenStartDate:endDate:refreshVariant:withStoredEvents:handler:]_block_invoke"));
  v31 = 0;
  v26 = MOSemaphoreWaitAndFaultIfTimeout_Internal(v23, &v31, v25, 120.0);
  v27 = v31;
  if (!v26)
  {
    v28 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_cold_3();

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 96));

}

void __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_191(uint64_t a1, void *a2)
{
  id v3;
  id os_log;
  NSObject *v5;
  NSObject *v6;
  id v7;
  id v8;
  NSObject *v9;
  _QWORD block[4];
  id v11;
  __int128 v12;
  uint8_t buf[4];
  id v14;

  v3 = a2;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
  v5 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "detectHindsightVisits, error, %@", buf, 0xCu);
  }

  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_192;
  block[3] = &unk_1002B5740;
  v7 = v3;
  v11 = v7;
  v12 = *(_OWORD *)(a1 + 56);
  dispatch_sync(v6, block);

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  v8 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerCollectEventsVisits-Training", ", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 48), "endSession");
}

void __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_192(uint64_t a1)
{
  void *v2;
  __CFString *v3;
  unsigned __int16 v4;
  uint64_t v5;
  id *v6;
  void *v7;
  void *v8;
  __CFString *v9;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "domain"));
    if (v3 == CFSTR("MOErrorDomain"))
    {
      v9 = v3;
      v4 = (unsigned __int16)objc_msgSend(*(id *)(a1 + 32), "code");

      if ((v4 & 0x400) != 0)
      {
        v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v8 = *(void **)(v5 + 40);
        v6 = (id *)(v5 + 40);
        v7 = v8;
        if (!v8)
          v7 = *(void **)(a1 + 32);
        objc_storeStrong(v6, v7);
      }
    }
    else
    {

    }
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKey:", &__kCFBooleanTrue, CFSTR("resultVisitsSuccess"));
  }
}

void __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_195(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id os_log;
  NSObject *v13;
  id v14;
  NSObject *v15;
  uint8_t v16[8];
  _QWORD block[4];
  id v18;
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  id v24;
  __int128 v25;

  v5 = a2;
  v6 = a3;
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_2_196;
  block[3] = &unk_1002B5790;
  v8 = v5;
  v18 = v8;
  v9 = v6;
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(a1 + 40);
  v19 = v9;
  v20 = v10;
  v21 = v11;
  v22 = *(id *)(a1 + 48);
  v23 = *(id *)(a1 + 56);
  v24 = *(id *)(a1 + 64);
  v25 = *(_OWORD *)(a1 + 96);
  dispatch_sync(v7, block);

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 72));
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v13 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_signpost_enabled(v13))
  {
    *(_WORD *)v16 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerCollectEventsVisits-Fetching", ", v16, 2u);
  }

  objc_msgSend(*(id *)(a1 + 80), "endSession");
  v14 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_signpost_enabled(v15))
  {
    *(_WORD *)v16 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerCollectEventsVisits", ", v16, 2u);
  }

  objc_msgSend(*(id *)(a1 + 88), "endSession");
}

void __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_2_196(uint64_t a1)
{
  void *v2;
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id os_log;
  NSObject *v9;
  id v10;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;
  unsigned __int16 v15;
  uint64_t v16;
  id *v17;
  void *v18;
  void *v19;
  __CFString *v20;
  _QWORD v21[6];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint8_t buf[4];
  id v35;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "domain"));
    if (v3 == CFSTR("MOErrorDomain"))
    {
      v20 = v3;
      v15 = (unsigned __int16)objc_msgSend(*(id *)(a1 + 32), "code");

      if ((v15 & 0x400) != 0)
      {
        v16 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
        v19 = *(void **)(v16 + 40);
        v17 = (id *)(v16 + 40);
        v18 = v19;
        if (!v19)
          v18 = *(void **)(a1 + 32);
        objc_storeStrong(v17, v18);
      }
    }
    else
    {

    }
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("newEvents")));

    if (v4)
    {
      v28 = 0;
      v29 = &v28;
      v30 = 0x3032000000;
      v31 = __Block_byref_object_copy__37;
      v32 = __Block_byref_object_dispose__37;
      v33 = 0;
      v22 = 0;
      v23 = &v22;
      v24 = 0x3032000000;
      v25 = __Block_byref_object_copy__37;
      v26 = __Block_byref_object_dispose__37;
      v27 = 0;
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "routineServiceManager"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("newEvents")));
      v7 = *(_QWORD *)(a1 + 56);
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_3_197;
      v21[3] = &unk_1002B20B8;
      v21[4] = &v28;
      v21[5] = &v22;
      objc_msgSend(v5, "fetchConsolidatedEvents:withStored:handler:", v6, v7, v21);

      objc_msgSend(*(id *)(a1 + 64), "addObjectsFromArray:", v29[5]);
      if (objc_msgSend((id)v23[5], "count"))
      {
        os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
        v9 = objc_claimAutoreleasedReturnValue(os_log);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          v10 = objc_msgSend((id)v23[5], "count");
          *(_DWORD *)buf = 134217984;
          v35 = v10;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Number of real time new home events to be deleted is , %lu", buf, 0xCu);
        }

        objc_msgSend(*(id *)(a1 + 72), "addObjectsFromArray:", v23[5]);
      }
      _Block_object_dispose(&v22, 8);

      _Block_object_dispose(&v28, 8);
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("rehydratedEvents")));
    v12 = v11 == 0;

    if (!v12)
    {
      v13 = *(void **)(a1 + 80);
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("rehydratedEvents")));
      objc_msgSend(v13, "addObjectsFromArray:", v14);

    }
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "setObject:forKey:", &__kCFBooleanTrue, CFSTR("resultVisitsTrainingSuccess"));
  }
}

void __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_3_197(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_201(uint64_t a1)
{
  dispatch_semaphore_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  id v15;
  id os_log;
  NSObject *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  NSObject *v23;
  id v24;
  uint64_t v25;

  v2 = dispatch_semaphore_create(0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "nowPlayingMediaManager"));
  v4 = *(void **)(a1 + 40);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", *(_QWORD *)(a1 + 48), 0.0));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "laterDate:", v5));
  v7 = *(void **)(a1 + 56);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", *(_QWORD *)(a1 + 48), 1.0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "laterDate:", v8));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_2_202;
  v19[3] = &unk_1002B5600;
  v19[4] = *(_QWORD *)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 64);
  v20 = *(id *)(a1 + 72);
  v21 = *(id *)(a1 + 80);
  v11 = *(id *)(a1 + 88);
  v12 = *(_QWORD *)(a1 + 112);
  v22 = v11;
  v25 = v12;
  v13 = v2;
  v23 = v13;
  v24 = *(id *)(a1 + 96);
  objc_msgSend(v3, "fetchMediaPlayEventsBetweenStartDate:endDate:withStoredEvents:handler:", v6, v9, v10, v19);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ - [%s] - %d - %s"), CFSTR("MOSemaphoreWait"), "/Library/Caches/com.apple.xbs/Sources/Moments/momentsd/PromptEngine/PromptProvider/MOEventManager.m", 872, "-[MOEventManager _collectCompleteEventsBetweenStartDate:endDate:refreshVariant:withStoredEvents:handler:]_block_invoke"));
  v18 = 0;
  LOBYTE(v6) = MOSemaphoreWaitAndFaultIfTimeout_Internal(v13, &v18, v14, 120.0);
  v15 = v18;
  if ((v6 & 1) == 0)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    v17 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_cold_3();

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 104));

}

void __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_2_202(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id os_log;
  NSObject *v13;
  uint8_t v14[16];
  _QWORD block[4];
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;

  v5 = a2;
  v6 = a3;
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_3_203;
  block[3] = &unk_1002B55D8;
  v8 = v5;
  v16 = v8;
  v9 = v6;
  v17 = v9;
  v18 = *(id *)(a1 + 40);
  v19 = *(id *)(a1 + 48);
  v10 = *(id *)(a1 + 56);
  v11 = *(_QWORD *)(a1 + 80);
  v20 = v10;
  v21 = v11;
  dispatch_sync(v7, block);

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 64));
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v13 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_signpost_enabled(v13))
  {
    *(_WORD *)v14 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerCollectEventsMusic", ", v14, 2u);
  }

  objc_msgSend(*(id *)(a1 + 72), "endSession");
}

id *__105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_3_203(id *result)
{
  id *v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  if (!result[4])
  {
    v1 = result;
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(result[5], "objectForKey:", CFSTR("newEvents")));

    if (v2)
    {
      v3 = v1[6];
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1[5], "objectForKey:", CFSTR("newEvents")));
      objc_msgSend(v3, "addObjectsFromArray:", v4);

    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1[5], "objectForKey:", CFSTR("rehydratedEvents")));

    if (v5)
    {
      v6 = v1[7];
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1[5], "objectForKey:", CFSTR("rehydratedEvents")));
      objc_msgSend(v6, "addObjectsFromArray:", v7);

    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1[5], "objectForKey:", CFSTR("unrehydratedEvents")));

    if (v8)
    {
      v9 = v1[8];
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1[5], "objectForKey:", CFSTR("unrehydratedEvents")));
      objc_msgSend(v9, "addObjectsFromArray:", v10);

    }
    return (id *)objc_msgSend(*(id *)(*((_QWORD *)v1[9] + 1) + 40), "setObject:forKey:", &__kCFBooleanTrue, CFSTR("resultMusicSuccess"));
  }
  return result;
}

void __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_206(uint64_t a1)
{
  dispatch_semaphore_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  id v13;
  id os_log;
  NSObject *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  NSObject *v20;
  id v21;
  __int128 v22;

  v2 = dispatch_semaphore_create(0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "motionManager"));
  v4 = *(void **)(a1 + 40);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", *(_QWORD *)(a1 + 48), 0.0));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "laterDate:", v5));
  v7 = *(void **)(a1 + 56);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", *(_QWORD *)(a1 + 48), 1.0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "laterDate:", v8));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_2_207;
  v17[3] = &unk_1002B5678;
  v17[4] = *(_QWORD *)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 64);
  v18 = *(id *)(a1 + 72);
  v19 = *(id *)(a1 + 80);
  v22 = *(_OWORD *)(a1 + 104);
  v11 = v2;
  v20 = v11;
  v21 = *(id *)(a1 + 88);
  objc_msgSend(v3, "fetchMotionActivityBetweenStartDate:endDate:withStoredEvents:handler:", v6, v9, v10, v17);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ - [%s] - %d - %s"), CFSTR("MOSemaphoreWait"), "/Library/Caches/com.apple.xbs/Sources/Moments/momentsd/PromptEngine/PromptProvider/MOEventManager.m", 913, "-[MOEventManager _collectCompleteEventsBetweenStartDate:endDate:refreshVariant:withStoredEvents:handler:]_block_invoke"));
  v16 = 0;
  LOBYTE(v6) = MOSemaphoreWaitAndFaultIfTimeout_Internal(v11, &v16, v12, 120.0);
  v13 = v16;
  if ((v6 & 1) == 0)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    v15 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_cold_3();

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 96));

}

void __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_2_207(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id os_log;
  NSObject *v11;
  uint8_t v12[16];
  _QWORD block[4];
  id v14;
  id v15;
  id v16;
  id v17;
  __int128 v18;

  v5 = a2;
  v6 = a3;
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_3_208;
  block[3] = &unk_1002B5650;
  v8 = v5;
  v14 = v8;
  v9 = v6;
  v15 = v9;
  v16 = *(id *)(a1 + 40);
  v17 = *(id *)(a1 + 48);
  v18 = *(_OWORD *)(a1 + 72);
  dispatch_sync(v7, block);

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v11 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_signpost_enabled(v11))
  {
    *(_WORD *)v12 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerCollectEventsMotionActivity", ", v12, 2u);
  }

  objc_msgSend(*(id *)(a1 + 64), "endSession");
}

void __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_3_208(uint64_t a1)
{
  void *v2;
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int16 v10;
  uint64_t v11;
  id *v12;
  void *v13;
  void *v14;
  __CFString *v15;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "domain"));
    if (v3 == CFSTR("MOErrorDomain"))
    {
      v15 = v3;
      v10 = (unsigned __int16)objc_msgSend(*(id *)(a1 + 32), "code");

      if ((v10 & 0x400) != 0)
      {
        v11 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
        v14 = *(void **)(v11 + 40);
        v12 = (id *)(v11 + 40);
        v13 = v14;
        if (!v14)
          v13 = *(void **)(a1 + 32);
        objc_storeStrong(v12, v13);
      }
    }
    else
    {

    }
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("newEvents")));

    if (v4)
    {
      v5 = *(void **)(a1 + 48);
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("newEvents")));
      objc_msgSend(v5, "addObjectsFromArray:", v6);

    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("rehydratedEvents")));

    if (v7)
    {
      v8 = *(void **)(a1 + 56);
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("rehydratedEvents")));
      objc_msgSend(v8, "addObjectsFromArray:", v9);

    }
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setObject:forKey:", &__kCFBooleanTrue, CFSTR("resultMotionSuccess"));
  }
}

void __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_209(uint64_t a1)
{
  unsigned int v2;
  unsigned int v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id os_log;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  NSMutableArray *v16;
  NSMutableArray *v17;
  id v18;
  NSObject *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  id v30;
  NSObject *v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  NSMutableArray *v35;
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  uint64_t v40;
  uint8_t buf[4];
  id v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  id v46;
  __int16 v47;
  id v48;
  __int16 v49;
  id v50;
  __int16 v51;
  id v52;

  objc_msgSend(*(id *)(a1 + 32), "addEntriesFromDictionary:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 40));
  objc_msgSend(*(id *)(a1 + 32), "addEntriesFromDictionary:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 40));
  objc_msgSend(*(id *)(a1 + 32), "addEntriesFromDictionary:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 136) + 8) + 40));
  objc_msgSend(*(id *)(a1 + 32), "addEntriesFromDictionary:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 144) + 8) + 40));
  objc_msgSend(*(id *)(a1 + 32), "addEntriesFromDictionary:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 152) + 8) + 40));
  objc_msgSend(*(id *)(a1 + 32), "addEntriesFromDictionary:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 160) + 8) + 40));
  objc_msgSend(*(id *)(a1 + 32), "addEntriesFromDictionary:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 168) + 8) + 40));
  objc_msgSend(*(id *)(a1 + 32), "addEntriesFromDictionary:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 176) + 8) + 40));
  objc_msgSend(*(id *)(a1 + 32), "addEntriesFromDictionary:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 184) + 8) + 40));
  objc_msgSend(*(id *)(a1 + 32), "addEntriesFromDictionary:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 192) + 8) + 40));
  v2 = objc_msgSend(*(id *)(a1 + 40), "count");
  v3 = objc_msgSend(*(id *)(a1 + 48), "count") + v2;
  v4 = v3 + objc_msgSend(*(id *)(a1 + 56), "count");
  v5 = *(void **)(a1 + 32);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v4));
  objc_msgSend(v5, "setValue:forKey:", v6, CFSTR("resultNumberOfEvents"));

  v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 200) + 8) + 40);
  if (v7 && (objc_msgSend(v7, "code") & 0x400) != 0)
    objc_msgSend(*(id *)(a1 + 32), "setValue:forKey:", &off_1002DB1C8, CFSTR("stateDataProviderDatabaseUnavailable"));
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
  v9 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = *(void **)(a1 + 64);
    v11 = *(void **)(a1 + 72);
    v12 = objc_msgSend(*(id *)(a1 + 40), "count");
    v13 = objc_msgSend(*(id *)(a1 + 56), "count");
    v14 = objc_msgSend(*(id *)(a1 + 48), "count");
    v15 = objc_msgSend(*(id *)(a1 + 80), "count");
    *(_DWORD *)buf = 138413570;
    v42 = v10;
    v43 = 2112;
    v44 = v11;
    v45 = 2048;
    v46 = v12;
    v47 = 2048;
    v48 = v13;
    v49 = 2048;
    v50 = v14;
    v51 = 2048;
    v52 = v15;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "done with fetching and rehydrating events, start date, %@, end date, %@, rehydrated events count, %lu, new events count, %lu, unrehydrated events count, %lu, stored events count, %lu", buf, 0x3Eu);
  }

  v16 = objc_opt_new(NSMutableArray);
  v17 = objc_opt_new(NSMutableArray);
  if (objc_msgSend(*(id *)(a1 + 40), "count"))
    -[NSMutableArray addObjectsFromArray:](v16, "addObjectsFromArray:", *(_QWORD *)(a1 + 40));
  if (objc_msgSend(*(id *)(a1 + 56), "count"))
  {
    -[NSMutableArray addObjectsFromArray:](v16, "addObjectsFromArray:", *(_QWORD *)(a1 + 56));
    -[NSMutableArray addObjectsFromArray:](v17, "addObjectsFromArray:", *(_QWORD *)(a1 + 56));
  }
  if (objc_msgSend(*(id *)(a1 + 48), "count"))
    -[NSMutableArray addObjectsFromArray:](v17, "addObjectsFromArray:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 88), "setCachedEvents:", v16);
  objc_msgSend(*(id *)(a1 + 88), "setCacheStartDate:", *(_QWORD *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 88), "setCacheEndDate:", *(_QWORD *)(a1 + 72));
  v18 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 88), "cachedEvents"));
    v21 = objc_msgSend(v20, "count");
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 88), "cacheStartDate"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 88), "cacheEndDate"));
    *(_DWORD *)buf = 134218498;
    v42 = v21;
    v43 = 2112;
    v44 = v22;
    v45 = 2112;
    v46 = v23;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "done with updating cache, event count, %lu, start date, %@, end date, %@", buf, 0x20u);

  }
  v24 = objc_msgSend(*(id *)(a1 + 96), "count");
  v25 = *(_QWORD *)(a1 + 200);
  if (v24 && !*(_QWORD *)(*(_QWORD *)(v25 + 8) + 40))
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 88), "eventStore"));
    v27 = *(void **)(a1 + 96);
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_210;
    v38[3] = &unk_1002B22B0;
    v40 = *(_QWORD *)(a1 + 200);
    v39 = v27;
    objc_msgSend(v26, "removeEvents:CompletionHandler:", v39, v38);

    v25 = *(_QWORD *)(a1 + 200);
  }
  if (*(_QWORD *)(*(_QWORD *)(v25 + 8) + 40))
  {
    if (*(_QWORD *)(a1 + 112))
    {
      v28 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
      v29 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_209_cold_1();

      (*(void (**)(void))(*(_QWORD *)(a1 + 112) + 16))();
    }
    v30 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    v31 = objc_claimAutoreleasedReturnValue(v30);
    if (os_signpost_enabled(v31))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v31, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerCollectEvents", ", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 104), "endSession");
  }
  else
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 88), "eventStore"));
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_213;
    v33[3] = &unk_1002B5808;
    v37 = *(id *)(a1 + 112);
    v34 = *(id *)(a1 + 32);
    v35 = v17;
    v36 = *(id *)(a1 + 104);
    objc_msgSend(v32, "storeEvents:CompletionHandler:", v35, v33);

  }
}

void __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_210(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  id *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  id os_log;
  NSObject *v12;
  id v13;
  id v14;
  int v15;
  id v16;
  NSErrorUserInfoKey v17;
  const __CFString *v18;

  v3 = a2;
  if (v3)
  {
    v17 = NSLocalizedDescriptionKey;
    v18 = CFSTR("Remove old real time visits events failed");
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
    v5 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("MOErrorDomain"), 22, v4));

    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(NSObject **)(v6 + 40);
    v7 = (id *)(v6 + 40);
    v8 = v9;
    if (v9)
      v10 = v8;
    else
      v10 = v5;
    objc_storeStrong(v7, v10);
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    v12 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_210_cold_1();

  }
  else
  {
    v13 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    v5 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v14 = objc_msgSend(*(id *)(a1 + 32), "count");
      v15 = 134217984;
      v16 = v14;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "remove old real time visits events succeeded and continue refresh, removed events count %lu", (uint8_t *)&v15, 0xCu);
    }
  }

}

void __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_213(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id os_log;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  void (*v11)(void);
  id v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  int v16;
  id v17;

  v5 = a2;
  v6 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_213_cold_1();

    v10 = *(_QWORD *)(a1 + 56);
    if (v10)
    {
      v11 = *(void (**)(void))(v10 + 16);
LABEL_10:
      v11();
    }
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v12 = objc_msgSend(*(id *)(a1 + 40), "count");
      v16 = 134217984;
      v17 = v12;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "saved new and unrehydrated events into database. %lu", (uint8_t *)&v16, 0xCu);
    }

    v13 = *(_QWORD *)(a1 + 56);
    if (v13)
    {
      v11 = *(void (**)(void))(v13 + 16);
      goto LABEL_10;
    }
  }
  v14 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_signpost_enabled(v15))
  {
    LOWORD(v16) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerCollectEvents", ", (uint8_t *)&v16, 2u);
  }

  objc_msgSend(*(id *)(a1 + 48), "endSession");
}

- (void)_collectEventsBetweenStartDate:(id)a3 EndDate:(id)a4 handler:(id)a5
{
  id os_log;
  NSObject *v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  MOPerformanceMeasurement *v16;
  id v17;
  NSObject *v18;
  dispatch_semaphore_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  MOPerformanceMeasurement *v26;
  void *v27;
  id v28;
  id v29;
  NSObject *v30;
  id v31;
  NSObject *v32;
  id v33;
  NSObject *v34;
  MOPerformanceMeasurement *v35;
  id v36;
  NSObject *v37;
  dispatch_semaphore_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  NSObject *v44;
  MOPerformanceMeasurement *v45;
  void *v46;
  id v47;
  id v48;
  NSObject *v49;
  id v50;
  NSObject *v51;
  id v52;
  NSObject *v53;
  MOPerformanceMeasurement *v54;
  id v55;
  NSObject *v56;
  dispatch_semaphore_t v57;
  id v58;
  NSObject *v59;
  MOPerformanceMeasurement *v60;
  void *v61;
  NSObject *v62;
  void *v63;
  id v64;
  NSObject *v65;
  id v66;
  NSObject *v67;
  MOPerformanceMeasurement *v68;
  dispatch_semaphore_t v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  NSObject *v75;
  MOPerformanceMeasurement *v76;
  MOPerformanceMeasurement *v77;
  void *v78;
  unint64_t v79;
  id v80;
  NSObject *v81;
  id v82;
  NSObject *v83;
  id v84;
  NSObject *v85;
  MOPerformanceMeasurement *v86;
  id v87;
  NSObject *v88;
  dispatch_semaphore_t v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  uint64_t v94;
  NSObject *v95;
  MOPerformanceMeasurement *v96;
  void *v97;
  id v98;
  id v99;
  NSObject *v100;
  id v101;
  NSObject *v102;
  id v103;
  NSObject *v104;
  MOPerformanceMeasurement *v105;
  id v106;
  NSObject *v107;
  dispatch_semaphore_t v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  uint64_t v113;
  NSObject *v114;
  MOPerformanceMeasurement *v115;
  void *v116;
  id v117;
  id v118;
  NSObject *v119;
  id v120;
  NSObject *v121;
  id v122;
  NSObject *v123;
  MOPerformanceMeasurement *v124;
  id v125;
  NSObject *v126;
  dispatch_semaphore_t v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  uint64_t v132;
  NSObject *v133;
  MOPerformanceMeasurement *v134;
  void *v135;
  id v136;
  id v137;
  NSObject *v138;
  id v139;
  NSObject *v140;
  id v141;
  NSObject *v142;
  MOPerformanceMeasurement *v143;
  id v144;
  NSObject *v145;
  dispatch_semaphore_t v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  uint64_t v151;
  NSObject *v152;
  MOPerformanceMeasurement *v153;
  void *v154;
  id v155;
  id v156;
  NSObject *v157;
  id v158;
  NSObject *v159;
  id v160;
  NSObject *v161;
  MOPerformanceMeasurement *v162;
  id v163;
  NSObject *v164;
  dispatch_semaphore_t v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  uint64_t v170;
  NSObject *v171;
  MOPerformanceMeasurement *v172;
  void *v173;
  id v174;
  id v175;
  NSObject *v176;
  id v177;
  NSObject *v178;
  id v179;
  NSObject *v180;
  MOPerformanceMeasurement *v181;
  id v182;
  NSObject *v183;
  dispatch_semaphore_t v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  uint64_t v189;
  NSObject *v190;
  MOPerformanceMeasurement *v191;
  void *v192;
  id v193;
  id v194;
  NSObject *v195;
  id v196;
  NSObject *v197;
  id v198;
  NSObject *v199;
  MOPerformanceMeasurement *v200;
  id v201;
  NSObject *v202;
  dispatch_semaphore_t v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  uint64_t v208;
  NSObject *v209;
  MOPerformanceMeasurement *v210;
  void *v211;
  id v212;
  id v213;
  NSObject *v214;
  id v215;
  NSObject *v216;
  id v217;
  NSObject *v218;
  MOPerformanceMeasurement *v219;
  id v220;
  NSObject *v221;
  dispatch_semaphore_t v222;
  void *v223;
  void *v224;
  void *v225;
  void *v226;
  uint64_t v227;
  NSObject *v228;
  MOPerformanceMeasurement *v229;
  void *v230;
  id v231;
  id v232;
  NSObject *v233;
  id v234;
  NSObject *v235;
  id v236;
  NSObject *v237;
  MOPerformanceMeasurement *v238;
  id v239;
  NSObject *v240;
  dispatch_semaphore_t v241;
  void *v242;
  void *v243;
  void *v244;
  void *v245;
  uint64_t v246;
  NSObject *v247;
  MOPerformanceMeasurement *v248;
  void *v249;
  id v250;
  id v251;
  NSObject *v252;
  id v253;
  NSObject *v254;
  id v255;
  NSObject *v256;
  MOPerformanceMeasurement *v257;
  id v258;
  NSObject *v259;
  dispatch_semaphore_t v260;
  void *v261;
  void *v262;
  void *v263;
  void *v264;
  uint64_t v265;
  NSObject *v266;
  MOPerformanceMeasurement *v267;
  void *v268;
  id v269;
  id v270;
  NSObject *v271;
  id v272;
  NSObject *v273;
  id v274;
  MOPerformanceMeasurement *v275;
  MOPerformanceMeasurement *v276;
  unint64_t v277;
  id v278;
  MOPerformanceMeasurement *v279;
  id v280;
  id v281;
  NSObject *group;
  _QWORD block[4];
  MOPerformanceMeasurement *v285;
  id v286;
  uint8_t *v287;
  _QWORD *v288;
  id v289;
  _QWORD v290[4];
  NSObject *v291;
  NSObject *v292;
  MOPerformanceMeasurement *v293;
  _QWORD *v294;
  uint8_t *v295;
  id v296;
  _QWORD v297[4];
  NSObject *v298;
  NSObject *v299;
  MOPerformanceMeasurement *v300;
  _QWORD *v301;
  uint8_t *v302;
  id v303;
  _QWORD v304[4];
  NSObject *v305;
  NSObject *v306;
  MOPerformanceMeasurement *v307;
  _QWORD *v308;
  uint8_t *v309;
  id v310;
  _QWORD v311[4];
  NSObject *v312;
  NSObject *v313;
  MOPerformanceMeasurement *v314;
  _QWORD *v315;
  uint8_t *v316;
  id v317;
  _QWORD v318[4];
  NSObject *v319;
  NSObject *v320;
  MOPerformanceMeasurement *v321;
  _QWORD *v322;
  uint8_t *v323;
  id v324;
  _QWORD v325[4];
  NSObject *v326;
  NSObject *v327;
  MOPerformanceMeasurement *v328;
  _QWORD *v329;
  uint8_t *v330;
  id v331;
  _QWORD v332[4];
  NSObject *v333;
  NSObject *v334;
  MOPerformanceMeasurement *v335;
  _QWORD *v336;
  uint8_t *v337;
  id v338;
  _QWORD v339[4];
  NSObject *v340;
  NSObject *v341;
  MOPerformanceMeasurement *v342;
  _QWORD *v343;
  uint8_t *v344;
  id v345;
  _QWORD v346[4];
  NSObject *v347;
  NSObject *v348;
  MOPerformanceMeasurement *v349;
  _QWORD *v350;
  uint8_t *v351;
  id v352;
  _QWORD v353[4];
  NSObject *v354;
  NSObject *v355;
  MOPerformanceMeasurement *v356;
  _QWORD *v357;
  uint8_t *v358;
  id v359;
  _QWORD v360[4];
  NSObject *v361;
  NSObject *v362;
  MOPerformanceMeasurement *v363;
  MOPerformanceMeasurement *v364;
  _QWORD *v365;
  uint8_t *v366;
  id v367;
  _QWORD v368[4];
  NSObject *v369;
  MOPerformanceMeasurement *v370;
  uint8_t *v371;
  id v372;
  _QWORD v373[4];
  NSObject *v374;
  NSObject *v375;
  MOPerformanceMeasurement *v376;
  _QWORD *v377;
  uint8_t *v378;
  id v379;
  _QWORD v380[4];
  NSObject *v381;
  NSObject *v382;
  MOPerformanceMeasurement *v383;
  _QWORD *v384;
  uint8_t *v385;
  _QWORD v386[3];
  int v387;
  uint8_t buf[8];
  uint8_t *v389;
  uint64_t v390;
  uint64_t (*v391)(uint64_t, uint64_t);
  void (*v392)(uint64_t);
  id v393;
  uint8_t v394[4];
  id v395;
  __int16 v396;
  id v397;

  v281 = a3;
  v280 = a4;
  v278 = a5;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerCollectEvents", ", buf, 2u);
  }

  v279 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("CollectEventsBetweenStartEnd"), 0);
  -[MOPerformanceMeasurement startSession](v279, "startSession");
  *(_QWORD *)buf = 0;
  v389 = buf;
  v390 = 0x3032000000;
  v391 = __Block_byref_object_copy__37;
  v392 = __Block_byref_object_dispose__37;
  v393 = objc_alloc_init((Class)NSMutableDictionary);
  v386[0] = 0;
  v386[1] = v386;
  v386[2] = 0x2020000000;
  v387 = 0;
  group = dispatch_group_create();
  v9 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v281, "stringFromDate"));
    v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v280, "stringFromDate"));
    *(_DWORD *)v394 = 138412546;
    v395 = v11;
    v396 = 2112;
    v397 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "start collecting events, start date, %@, end date, %@", v394, 0x16u);

  }
  if (-[MOConfigurationManager isAllowedToProcessEventCategory:](self->_configurationManager, "isAllowedToProcessEventCategory:", 2))
  {
    v13 = objc_claimAutoreleasedReturnValue(-[MOEventManager _getEarliestDateForCategory:](self, "_getEarliestDateForCategory:", 2));
    v14 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_signpost_enabled(v15))
    {
      *(_WORD *)v394 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerCollectEventsWorkouts", ", v394, 2u);
    }

    v16 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("CollectWorkouts"), 0);
    -[MOPerformanceMeasurement startSession](v16, "startSession");
    v17 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v394 = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "start fetching and saving workouts", v394, 2u);
    }

    dispatch_group_enter(group);
    v19 = dispatch_semaphore_create(0);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventManager healthKitManager](self, "healthKitManager"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", v13, 0.0));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v281, "laterDate:", v21));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", v13, 1.0));
    v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v280, "laterDate:", v23));
    v380[0] = _NSConcreteStackBlock;
    v380[1] = 3221225472;
    v380[2] = __65__MOEventManager__collectEventsBetweenStartDate_EndDate_handler___block_invoke;
    v380[3] = &unk_1002B5858;
    v384 = v386;
    v385 = buf;
    v25 = v19;
    v381 = v25;
    v382 = group;
    v26 = v16;
    v383 = v26;
    objc_msgSend(v20, "fetchAndSaveWorkoutsBetweenStartDate:EndDate:handler:", v22, v24, v380);

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ - [%s] - %d - %s"), CFSTR("MOSemaphoreWait"), "/Library/Caches/com.apple.xbs/Sources/Moments/momentsd/PromptEngine/PromptProvider/MOEventManager.m", 1040, "-[MOEventManager _collectEventsBetweenStartDate:EndDate:handler:]"));
    v379 = 0;
    LOBYTE(v24) = MOSemaphoreWaitAndFaultIfTimeout_Internal(v25, &v379, v27, 120.0);
    v28 = v379;
    if ((v24 & 1) == 0)
    {
      v29 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
      v30 = objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_cold_3();

    }
    if (v28)
      objc_msgSend(*((id *)v389 + 5), "setObject:forKey:", &__kCFBooleanFalse, CFSTR("resultWorkoutsSuccess"));

  }
  else
  {
    v31 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    v13 = objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v394 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "skipping fetching and saving workouts", v394, 2u);
    }
  }

  if (-[MOConfigurationManager isAllowedToProcessEventCategory:](self->_configurationManager, "isAllowedToProcessEventCategory:", 13))
  {
    v32 = objc_claimAutoreleasedReturnValue(-[MOEventManager _getEarliestDateForCategory:](self, "_getEarliestDateForCategory:", 13));
    v33 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    v34 = objc_claimAutoreleasedReturnValue(v33);
    if (os_signpost_enabled(v34))
    {
      *(_WORD *)v394 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v34, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerCollectEventsMindfullSessions", ", v394, 2u);
    }

    v35 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("CollectMindfulSessions"), 0);
    -[MOPerformanceMeasurement startSession](v35, "startSession");
    v36 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    v37 = objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v394 = 0;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "start fetching and saving mindful sessions", v394, 2u);
    }

    dispatch_group_enter(group);
    v38 = dispatch_semaphore_create(0);
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventManager healthKitManager](self, "healthKitManager"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", v32, 0.0));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v281, "laterDate:", v40));
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", v32, 1.0));
    v43 = objc_claimAutoreleasedReturnValue(objc_msgSend(v280, "laterDate:", v42));
    v373[0] = _NSConcreteStackBlock;
    v373[1] = 3221225472;
    v373[2] = __65__MOEventManager__collectEventsBetweenStartDate_EndDate_handler___block_invoke_218;
    v373[3] = &unk_1002B5858;
    v377 = v386;
    v378 = buf;
    v44 = v38;
    v374 = v44;
    v375 = group;
    v45 = v35;
    v376 = v45;
    objc_msgSend(v39, "fetchAndSaveMindfulSessionsBetweenStartDate:EndDate:handler:", v41, v43, v373);

    v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ - [%s] - %d - %s"), CFSTR("MOSemaphoreWait"), "/Library/Caches/com.apple.xbs/Sources/Moments/momentsd/PromptEngine/PromptProvider/MOEventManager.m", 1074, "-[MOEventManager _collectEventsBetweenStartDate:EndDate:handler:]"));
    v372 = 0;
    LOBYTE(v43) = MOSemaphoreWaitAndFaultIfTimeout_Internal(v44, &v372, v46, 120.0);
    v47 = v372;
    if ((v43 & 1) == 0)
    {
      v48 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
      v49 = objc_claimAutoreleasedReturnValue(v48);
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_cold_3();

    }
    if (v47)
      objc_msgSend(*((id *)v389 + 5), "setObject:forKey:", &__kCFBooleanFalse, CFSTR("resultMindfulSessionsSuccess"));

  }
  else
  {
    v50 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    v32 = objc_claimAutoreleasedReturnValue(v50);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v394 = 0;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "skipping fetching and saving mindful sessions", v394, 2u);
    }
  }

  if (-[MOConfigurationManager isAllowedToProcessEventCategory:](self->_configurationManager, "isAllowedToProcessEventCategory:", 1))
  {
    v51 = objc_claimAutoreleasedReturnValue(-[MOEventManager _getEarliestDateForCategory:](self, "_getEarliestDateForCategory:", 1));
    v52 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    v53 = objc_claimAutoreleasedReturnValue(v52);
    if (os_signpost_enabled(v53))
    {
      *(_WORD *)v394 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v53, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerCollectEventsVisits", ", v394, 2u);
    }

    v54 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("CollectVisits"), 0);
    -[MOPerformanceMeasurement startSession](v54, "startSession");
    v55 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    v56 = objc_claimAutoreleasedReturnValue(v55);
    if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v394 = 0;
      _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_INFO, "start fetching and saving visits", v394, 2u);
    }

    dispatch_group_enter(group);
    v57 = dispatch_semaphore_create(0);
    v58 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    v59 = objc_claimAutoreleasedReturnValue(v58);
    if (os_signpost_enabled(v59))
    {
      *(_WORD *)v394 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v59, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerCollectEventsVisits-Training", ", v394, 2u);
    }

    v60 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("CollectVisitsTraining"), 0);
    -[MOPerformanceMeasurement startSession](v60, "startSession");
    v61 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventManager routineServiceManager](self, "routineServiceManager"));
    v368[0] = _NSConcreteStackBlock;
    v368[1] = 3221225472;
    v368[2] = __65__MOEventManager__collectEventsBetweenStartDate_EndDate_handler___block_invoke_219;
    v368[3] = &unk_1002B5880;
    v371 = buf;
    v62 = v57;
    v369 = v62;
    v276 = v60;
    v370 = v276;
    objc_msgSend(v61, "detectHindsightVisitsWithCompletionHandler:", v368);

    v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ - [%s] - %d - %s"), CFSTR("MOSemaphoreWait"), "/Library/Caches/com.apple.xbs/Sources/Moments/momentsd/PromptEngine/PromptProvider/MOEventManager.m", 1104, "-[MOEventManager _collectEventsBetweenStartDate:EndDate:handler:]"));
    v367 = 0;
    LOBYTE(v60) = MOSemaphoreWaitAndFaultIfTimeout_Internal(v62, &v367, v63, 120.0);
    v277 = (unint64_t)v367;
    if ((v60 & 1) == 0)
    {
      v64 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
      v65 = objc_claimAutoreleasedReturnValue(v64);
      if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
        __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_cold_3();

    }
    v66 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    v67 = objc_claimAutoreleasedReturnValue(v66);
    if (os_signpost_enabled(v67))
    {
      *(_WORD *)v394 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v67, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerCollectEventsVisits-Fetching", ", v394, 2u);
    }

    v68 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("CollectVisitsFetching"), 0);
    -[MOPerformanceMeasurement startSession](v68, "startSession");
    v69 = dispatch_semaphore_create(0);

    v70 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventManager routineServiceManager](self, "routineServiceManager"));
    v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", v51, 0.0));
    v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v281, "laterDate:", v71));
    v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", v51, 1.0));
    v74 = objc_claimAutoreleasedReturnValue(objc_msgSend(v280, "laterDate:", v73));
    v360[0] = _NSConcreteStackBlock;
    v360[1] = 3221225472;
    v360[2] = __65__MOEventManager__collectEventsBetweenStartDate_EndDate_handler___block_invoke_220;
    v360[3] = &unk_1002B58A8;
    v365 = v386;
    v366 = buf;
    v75 = v69;
    v361 = v75;
    v362 = group;
    v76 = v68;
    v363 = v76;
    v77 = v54;
    v364 = v77;
    objc_msgSend(v70, "fetchAndSaveVisitsBetweenStartDate:EndDate:handler:", v72, v74, v360);

    v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ - [%s] - %d - %s"), CFSTR("MOSemaphoreWait"), "/Library/Caches/com.apple.xbs/Sources/Moments/momentsd/PromptEngine/PromptProvider/MOEventManager.m", 1124, "-[MOEventManager _collectEventsBetweenStartDate:EndDate:handler:]"));
    v359 = 0;
    LOBYTE(v74) = MOSemaphoreWaitAndFaultIfTimeout_Internal(v75, &v359, v78, 120.0);
    v79 = (unint64_t)v359;
    if ((v74 & 1) == 0)
    {
      v80 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
      v81 = objc_claimAutoreleasedReturnValue(v80);
      if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
        __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_cold_3();

    }
    if (v277 | v79)
      objc_msgSend(*((id *)v389 + 5), "setObject:forKey:", &__kCFBooleanFalse, CFSTR("resultVisitsSuccess"));

  }
  else
  {
    v82 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    v51 = objc_claimAutoreleasedReturnValue(v82);
    if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v394 = 0;
      _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_INFO, "skipping fetching and saving visits", v394, 2u);
    }
  }

  if (-[MOConfigurationManager isAllowedToProcessEventCategory:](self->_configurationManager, "isAllowedToProcessEventCategory:", 14))
  {
    v83 = objc_claimAutoreleasedReturnValue(-[MOEventManager _getEarliestDateForCategory:](self, "_getEarliestDateForCategory:", 14));
    v84 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    v85 = objc_claimAutoreleasedReturnValue(v84);
    if (os_signpost_enabled(v85))
    {
      *(_WORD *)v394 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v85, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerCollectEventsSharedPhotoMoments", ", v394, 2u);
    }

    v86 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("CollectSharedPhotoMoments"), 0);
    -[MOPerformanceMeasurement startSession](v86, "startSession");
    v87 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    v88 = objc_claimAutoreleasedReturnValue(v87);
    if (os_log_type_enabled(v88, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v394 = 0;
      _os_log_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_INFO, "start fetching and saving shared p mom", v394, 2u);
    }

    dispatch_group_enter(group);
    v89 = dispatch_semaphore_create(0);
    v90 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventManager photoManager](self, "photoManager"));
    v91 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", v83, 0.0));
    v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v281, "laterDate:", v91));
    v93 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", v83, 1.0));
    v94 = objc_claimAutoreleasedReturnValue(objc_msgSend(v280, "laterDate:", v93));
    v353[0] = _NSConcreteStackBlock;
    v353[1] = 3221225472;
    v353[2] = __65__MOEventManager__collectEventsBetweenStartDate_EndDate_handler___block_invoke_223;
    v353[3] = &unk_1002B5858;
    v357 = v386;
    v358 = buf;
    v95 = v89;
    v354 = v95;
    v355 = group;
    v96 = v86;
    v356 = v96;
    objc_msgSend(v90, "fetchAndSaveSharedPhotosBetweenStartDate:EndDate:handler:", v92, v94, v353);

    v97 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ - [%s] - %d - %s"), CFSTR("MOSemaphoreWait"), "/Library/Caches/com.apple.xbs/Sources/Moments/momentsd/PromptEngine/PromptProvider/MOEventManager.m", 1159, "-[MOEventManager _collectEventsBetweenStartDate:EndDate:handler:]"));
    v352 = 0;
    LOBYTE(v94) = MOSemaphoreWaitAndFaultIfTimeout_Internal(v95, &v352, v97, 120.0);
    v98 = v352;
    if ((v94 & 1) == 0)
    {
      v99 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
      v100 = objc_claimAutoreleasedReturnValue(v99);
      if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
        __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_cold_3();

    }
    if (v98)
      objc_msgSend(*((id *)v389 + 5), "setObject:forKey:", &__kCFBooleanFalse, CFSTR("resultSharedPhotosSuccess"));

  }
  else
  {
    v101 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    v83 = objc_claimAutoreleasedReturnValue(v101);
    if (os_log_type_enabled(v83, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v394 = 0;
      _os_log_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_INFO, "skipping fetching and saving shared p mom", v394, 2u);
    }
  }

  if (-[MOConfigurationManager isAllowedToProcessEventCategory:](self->_configurationManager, "isAllowedToProcessEventCategory:", 17))
  {
    v102 = objc_claimAutoreleasedReturnValue(-[MOEventManager _getEarliestDateForCategory:](self, "_getEarliestDateForCategory:", 17));
    v103 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    v104 = objc_claimAutoreleasedReturnValue(v103);
    if (os_signpost_enabled(v104))
    {
      *(_WORD *)v394 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v104, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerCollectEventsPhotoMemories", ", v394, 2u);
    }

    v105 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("CollectPhotoMemories"), 0);
    -[MOPerformanceMeasurement startSession](v105, "startSession");
    v106 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    v107 = objc_claimAutoreleasedReturnValue(v106);
    if (os_log_type_enabled(v107, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v394 = 0;
      _os_log_impl((void *)&_mh_execute_header, v107, OS_LOG_TYPE_INFO, "start fetching and saving photo memory", v394, 2u);
    }

    dispatch_group_enter(group);
    v108 = dispatch_semaphore_create(0);
    v109 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventManager photoManager](self, "photoManager"));
    v110 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", v102, 0.0));
    v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v281, "laterDate:", v110));
    v112 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", v102, 1.0));
    v113 = objc_claimAutoreleasedReturnValue(objc_msgSend(v280, "laterDate:", v112));
    v346[0] = _NSConcreteStackBlock;
    v346[1] = 3221225472;
    v346[2] = __65__MOEventManager__collectEventsBetweenStartDate_EndDate_handler___block_invoke_224;
    v346[3] = &unk_1002B5858;
    v350 = v386;
    v351 = buf;
    v114 = v108;
    v347 = v114;
    v348 = group;
    v115 = v105;
    v349 = v115;
    objc_msgSend(v109, "fetchAndSavePhotoMemoriesStartDate:EndDate:handler:", v111, v113, v346);

    v116 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ - [%s] - %d - %s"), CFSTR("MOSemaphoreWait"), "/Library/Caches/com.apple.xbs/Sources/Moments/momentsd/PromptEngine/PromptProvider/MOEventManager.m", 1194, "-[MOEventManager _collectEventsBetweenStartDate:EndDate:handler:]"));
    v345 = 0;
    LOBYTE(v113) = MOSemaphoreWaitAndFaultIfTimeout_Internal(v114, &v345, v116, 120.0);
    v117 = v345;
    if ((v113 & 1) == 0)
    {
      v118 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
      v119 = objc_claimAutoreleasedReturnValue(v118);
      if (os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
        __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_cold_3();

    }
    if (v117)
      objc_msgSend(*((id *)v389 + 5), "setObject:forKey:", &__kCFBooleanFalse, CFSTR("resultPhotoMemorySuccess"));

  }
  else
  {
    v120 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    v102 = objc_claimAutoreleasedReturnValue(v120);
    if (os_log_type_enabled(v102, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v394 = 0;
      _os_log_impl((void *)&_mh_execute_header, v102, OS_LOG_TYPE_INFO, "skipping fetching and saving photo memory", v394, 2u);
    }
  }

  if (-[MOConfigurationManager isAllowedToProcessEventCategory:](self->_configurationManager, "isAllowedToProcessEventCategory:", 9))
  {
    v121 = objc_claimAutoreleasedReturnValue(-[MOEventManager _getEarliestDateForCategory:](self, "_getEarliestDateForCategory:", 9));
    v122 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    v123 = objc_claimAutoreleasedReturnValue(v122);
    if (os_signpost_enabled(v123))
    {
      *(_WORD *)v394 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v123, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerCollectEventsSharedWithYouItems", ", v394, 2u);
    }

    v124 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("CollectSharedWithYouItems"), 0);
    -[MOPerformanceMeasurement startSession](v124, "startSession");
    v125 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    v126 = objc_claimAutoreleasedReturnValue(v125);
    if (os_log_type_enabled(v126, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v394 = 0;
      _os_log_impl((void *)&_mh_execute_header, v126, OS_LOG_TYPE_INFO, "start fetching and saving share with you items", v394, 2u);
    }

    dispatch_group_enter(group);
    v127 = dispatch_semaphore_create(0);
    v128 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventManager sharedWithYouManager](self, "sharedWithYouManager"));
    v129 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", v121, 0.0));
    v130 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v281, "laterDate:", v129));
    v131 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", v121, 1.0));
    v132 = objc_claimAutoreleasedReturnValue(objc_msgSend(v280, "laterDate:", v131));
    v339[0] = _NSConcreteStackBlock;
    v339[1] = 3221225472;
    v339[2] = __65__MOEventManager__collectEventsBetweenStartDate_EndDate_handler___block_invoke_227;
    v339[3] = &unk_1002B5858;
    v343 = v386;
    v344 = buf;
    v133 = v127;
    v340 = v133;
    v341 = group;
    v134 = v124;
    v342 = v134;
    objc_msgSend(v128, "fetchAndSaveSharedContentBetweenStartDate:EndDate:handler:", v130, v132, v339);

    v135 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ - [%s] - %d - %s"), CFSTR("MOSemaphoreWait"), "/Library/Caches/com.apple.xbs/Sources/Moments/momentsd/PromptEngine/PromptProvider/MOEventManager.m", 1230, "-[MOEventManager _collectEventsBetweenStartDate:EndDate:handler:]"));
    v338 = 0;
    LOBYTE(v132) = MOSemaphoreWaitAndFaultIfTimeout_Internal(v133, &v338, v135, 120.0);
    v136 = v338;
    if ((v132 & 1) == 0)
    {
      v137 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
      v138 = objc_claimAutoreleasedReturnValue(v137);
      if (os_log_type_enabled(v138, OS_LOG_TYPE_ERROR))
        __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_cold_3();

    }
    if (v136)
      objc_msgSend(*((id *)v389 + 5), "setObject:forKey:", &__kCFBooleanFalse, CFSTR("resultSharedSuccess"));

  }
  else
  {
    v139 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    v121 = objc_claimAutoreleasedReturnValue(v139);
    if (os_log_type_enabled(v121, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v394 = 0;
      _os_log_impl((void *)&_mh_execute_header, v121, OS_LOG_TYPE_INFO, "skipping fetching and saving share with you items", v394, 2u);
    }
  }

  if (-[MOConfigurationManager isAllowedToProcessEventCategory:](self->_configurationManager, "isAllowedToProcessEventCategory:", 8))
  {
    v140 = objc_claimAutoreleasedReturnValue(-[MOEventManager _getEarliestDateForCategory:](self, "_getEarliestDateForCategory:", 8));
    v141 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    v142 = objc_claimAutoreleasedReturnValue(v141);
    if (os_signpost_enabled(v142))
    {
      *(_WORD *)v394 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v142, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerCollectEventsTrips", ", v394, 2u);
    }

    v143 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("CollectTrips"), 0);
    -[MOPerformanceMeasurement startSession](v143, "startSession");
    v144 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    v145 = objc_claimAutoreleasedReturnValue(v144);
    if (os_log_type_enabled(v145, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v394 = 0;
      _os_log_impl((void *)&_mh_execute_header, v145, OS_LOG_TYPE_INFO, "start fetching and saving trips", v394, 2u);
    }

    dispatch_group_enter(group);
    v146 = dispatch_semaphore_create(0);
    v147 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventManager proactiveTravelManager](self, "proactiveTravelManager"));
    v148 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", v140, 0.0));
    v149 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v281, "laterDate:", v148));
    v150 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", v140, 1.0));
    v151 = objc_claimAutoreleasedReturnValue(objc_msgSend(v280, "laterDate:", v150));
    v332[0] = _NSConcreteStackBlock;
    v332[1] = 3221225472;
    v332[2] = __65__MOEventManager__collectEventsBetweenStartDate_EndDate_handler___block_invoke_230;
    v332[3] = &unk_1002B5858;
    v336 = v386;
    v337 = buf;
    v152 = v146;
    v333 = v152;
    v334 = group;
    v153 = v143;
    v335 = v153;
    objc_msgSend(v147, "fetchAndSaveTripsBetweenStartDate:EndDate:handler:", v149, v151, v332);

    v154 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ - [%s] - %d - %s"), CFSTR("MOSemaphoreWait"), "/Library/Caches/com.apple.xbs/Sources/Moments/momentsd/PromptEngine/PromptProvider/MOEventManager.m", 1298, "-[MOEventManager _collectEventsBetweenStartDate:EndDate:handler:]"));
    v331 = 0;
    LOBYTE(v151) = MOSemaphoreWaitAndFaultIfTimeout_Internal(v152, &v331, v154, 120.0);
    v155 = v331;
    if ((v151 & 1) == 0)
    {
      v156 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
      v157 = objc_claimAutoreleasedReturnValue(v156);
      if (os_log_type_enabled(v157, OS_LOG_TYPE_ERROR))
        __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_cold_3();

    }
    if (v155)
      objc_msgSend(*((id *)v389 + 5), "setObject:forKey:", &__kCFBooleanFalse, CFSTR("resultTripsSuccess"));

  }
  else
  {
    v158 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    v140 = objc_claimAutoreleasedReturnValue(v158);
    if (os_log_type_enabled(v140, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v394 = 0;
      _os_log_impl((void *)&_mh_execute_header, v140, OS_LOG_TYPE_INFO, "skipping fetching and saving trips", v394, 2u);
    }
  }

  if (-[MOConfigurationManager isAllowedToProcessEventCategory:](self->_configurationManager, "isAllowedToProcessEventCategory:", 6))
  {
    v159 = objc_claimAutoreleasedReturnValue(-[MOEventManager _getEarliestDateForCategory:](self, "_getEarliestDateForCategory:", 6));
    v160 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    v161 = objc_claimAutoreleasedReturnValue(v160);
    if (os_signpost_enabled(v161))
    {
      *(_WORD *)v394 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v161, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerCollectEventsMusic", ", v394, 2u);
    }

    v162 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("CollectMusic"), 0);
    -[MOPerformanceMeasurement startSession](v162, "startSession");
    v163 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    v164 = objc_claimAutoreleasedReturnValue(v163);
    if (os_log_type_enabled(v164, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v394 = 0;
      _os_log_impl((void *)&_mh_execute_header, v164, OS_LOG_TYPE_INFO, "start fetching and saving music", v394, 2u);
    }

    dispatch_group_enter(group);
    v165 = dispatch_semaphore_create(0);
    v166 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventManager nowPlayingMediaManager](self, "nowPlayingMediaManager"));
    v167 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", v159, 0.0));
    v168 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v281, "laterDate:", v167));
    v169 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", v159, 1.0));
    v170 = objc_claimAutoreleasedReturnValue(objc_msgSend(v280, "laterDate:", v169));
    v325[0] = _NSConcreteStackBlock;
    v325[1] = 3221225472;
    v325[2] = __65__MOEventManager__collectEventsBetweenStartDate_EndDate_handler___block_invoke_231;
    v325[3] = &unk_1002B5858;
    v329 = v386;
    v330 = buf;
    v171 = v165;
    v326 = v171;
    v327 = group;
    v172 = v162;
    v328 = v172;
    objc_msgSend(v166, "fetchAndSaveMediaPlayEventsBetweenStartDate:EndDate:handler:", v168, v170, v325);

    v173 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ - [%s] - %d - %s"), CFSTR("MOSemaphoreWait"), "/Library/Caches/com.apple.xbs/Sources/Moments/momentsd/PromptEngine/PromptProvider/MOEventManager.m", 1334, "-[MOEventManager _collectEventsBetweenStartDate:EndDate:handler:]"));
    v324 = 0;
    LOBYTE(v170) = MOSemaphoreWaitAndFaultIfTimeout_Internal(v171, &v324, v173, 120.0);
    v174 = v324;
    if ((v170 & 1) == 0)
    {
      v175 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
      v176 = objc_claimAutoreleasedReturnValue(v175);
      if (os_log_type_enabled(v176, OS_LOG_TYPE_ERROR))
        __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_cold_3();

    }
    if (v174)
      objc_msgSend(*((id *)v389 + 5), "setObject:forKey:", &__kCFBooleanFalse, CFSTR("resultMusicSuccess"));

  }
  else
  {
    v177 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    v159 = objc_claimAutoreleasedReturnValue(v177);
    if (os_log_type_enabled(v159, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v394 = 0;
      _os_log_impl((void *)&_mh_execute_header, v159, OS_LOG_TYPE_INFO, "skipping fetching and saving music", v394, 2u);
    }
  }

  if (-[MOConfigurationManager isAllowedToProcessEventCategory:](self->_configurationManager, "isAllowedToProcessEventCategory:", 10))
  {
    v178 = objc_claimAutoreleasedReturnValue(-[MOEventManager _getEarliestDateForCategory:](self, "_getEarliestDateForCategory:", 10));
    v179 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    v180 = objc_claimAutoreleasedReturnValue(v179);
    if (os_signpost_enabled(v180))
    {
      *(_WORD *)v394 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v180, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerCollectEventsContacts", ", v394, 2u);
    }

    v181 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("CollectContacts"), 0);
    -[MOPerformanceMeasurement startSession](v181, "startSession");
    v182 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    v183 = objc_claimAutoreleasedReturnValue(v182);
    if (os_log_type_enabled(v183, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v394 = 0;
      _os_log_impl((void *)&_mh_execute_header, v183, OS_LOG_TYPE_INFO, "start fetching and saving contact events", v394, 2u);
    }

    dispatch_group_enter(group);
    v184 = dispatch_semaphore_create(0);
    v185 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventManager significantContactManager](self, "significantContactManager"));
    v186 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", v178, 0.0));
    v187 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v281, "laterDate:", v186));
    v188 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", v178, 1.0));
    v189 = objc_claimAutoreleasedReturnValue(objc_msgSend(v280, "laterDate:", v188));
    v318[0] = _NSConcreteStackBlock;
    v318[1] = 3221225472;
    v318[2] = __65__MOEventManager__collectEventsBetweenStartDate_EndDate_handler___block_invoke_232;
    v318[3] = &unk_1002B5858;
    v322 = v386;
    v323 = buf;
    v190 = v184;
    v319 = v190;
    v320 = group;
    v191 = v181;
    v321 = v191;
    objc_msgSend(v185, "fetchAndSaveConversationsBetweenStartDate:EndDate:handler:", v187, v189, v318);

    v192 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ - [%s] - %d - %s"), CFSTR("MOSemaphoreWait"), "/Library/Caches/com.apple.xbs/Sources/Moments/momentsd/PromptEngine/PromptProvider/MOEventManager.m", 1370, "-[MOEventManager _collectEventsBetweenStartDate:EndDate:handler:]"));
    v317 = 0;
    LOBYTE(v189) = MOSemaphoreWaitAndFaultIfTimeout_Internal(v190, &v317, v192, 120.0);
    v193 = v317;
    if ((v189 & 1) == 0)
    {
      v194 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
      v195 = objc_claimAutoreleasedReturnValue(v194);
      if (os_log_type_enabled(v195, OS_LOG_TYPE_ERROR))
        __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_cold_3();

    }
    if (v193)
      objc_msgSend(*((id *)v389 + 5), "setObject:forKey:", &__kCFBooleanFalse, CFSTR("resultContactsSuccess"));

  }
  else
  {
    v196 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    v178 = objc_claimAutoreleasedReturnValue(v196);
    if (os_log_type_enabled(v178, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v394 = 0;
      _os_log_impl((void *)&_mh_execute_header, v178, OS_LOG_TYPE_INFO, "skipping fetching and saving contact events", v394, 2u);
    }
  }

  if (-[MOConfigurationManager isAllowedToProcessEventCategory:](self->_configurationManager, "isAllowedToProcessEventCategory:", 15))
  {
    v197 = objc_claimAutoreleasedReturnValue(-[MOEventManager _getEarliestDateForCategory:](self, "_getEarliestDateForCategory:", 15));
    v198 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    v199 = objc_claimAutoreleasedReturnValue(v198);
    if (os_signpost_enabled(v199))
    {
      *(_WORD *)v394 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v199, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerCollectEventsProximity", ", v394, 2u);
    }

    v200 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("CollectProximity"), 0);
    -[MOPerformanceMeasurement startSession](v200, "startSession");
    v201 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    v202 = objc_claimAutoreleasedReturnValue(v201);
    if (os_log_type_enabled(v202, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v394 = 0;
      _os_log_impl((void *)&_mh_execute_header, v202, OS_LOG_TYPE_INFO, "start fetching and saving prox", v394, 2u);
    }

    dispatch_group_enter(group);
    v203 = dispatch_semaphore_create(0);
    v204 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventManager peopleDiscoveryManager](self, "peopleDiscoveryManager"));
    v205 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", v197, 0.0));
    v206 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v281, "laterDate:", v205));
    v207 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", v197, 1.0));
    v208 = objc_claimAutoreleasedReturnValue(objc_msgSend(v280, "laterDate:", v207));
    v311[0] = _NSConcreteStackBlock;
    v311[1] = 3221225472;
    v311[2] = __65__MOEventManager__collectEventsBetweenStartDate_EndDate_handler___block_invoke_233;
    v311[3] = &unk_1002B5858;
    v315 = v386;
    v316 = buf;
    v209 = v203;
    v312 = v209;
    v313 = group;
    v210 = v200;
    v314 = v210;
    objc_msgSend(v204, "fetchAndSaveProxBetweenStartDate:EndDate:handler:", v206, v208, v311);

    v211 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ - [%s] - %d - %s"), CFSTR("MOSemaphoreWait"), "/Library/Caches/com.apple.xbs/Sources/Moments/momentsd/PromptEngine/PromptProvider/MOEventManager.m", 1405, "-[MOEventManager _collectEventsBetweenStartDate:EndDate:handler:]"));
    v310 = 0;
    LOBYTE(v208) = MOSemaphoreWaitAndFaultIfTimeout_Internal(v209, &v310, v211, 120.0);
    v212 = v310;
    if ((v208 & 1) == 0)
    {
      v213 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
      v214 = objc_claimAutoreleasedReturnValue(v213);
      if (os_log_type_enabled(v214, OS_LOG_TYPE_ERROR))
        __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_cold_3();

    }
    if (v212)
      objc_msgSend(*((id *)v389 + 5), "setObject:forKey:", &__kCFBooleanFalse, CFSTR("resultPeopleDiscoverySuccess"));

  }
  else
  {
    v215 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    v197 = objc_claimAutoreleasedReturnValue(v215);
    if (os_log_type_enabled(v197, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v394 = 0;
      _os_log_impl((void *)&_mh_execute_header, v197, OS_LOG_TYPE_INFO, "skipping fetching and saving prox", v394, 2u);
    }
  }

  if (-[MOConfigurationManager isAllowedToProcessEventCategory:](self->_configurationManager, "isAllowedToProcessEventCategory:", 23))
  {
    v216 = objc_claimAutoreleasedReturnValue(-[MOEventManager _getEarliestDateForCategory:](self, "_getEarliestDateForCategory:", 23));
    v217 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    v218 = objc_claimAutoreleasedReturnValue(v217);
    if (os_signpost_enabled(v218))
    {
      *(_WORD *)v394 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v218, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerCollectEventsPeopleDensity", ", v394, 2u);
    }

    v219 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("CollectPeopleDensity"), 0);
    -[MOPerformanceMeasurement startSession](v219, "startSession");
    v220 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    v221 = objc_claimAutoreleasedReturnValue(v220);
    if (os_log_type_enabled(v221, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v394 = 0;
      _os_log_impl((void *)&_mh_execute_header, v221, OS_LOG_TYPE_INFO, "start fetching and saving people density events", v394, 2u);
    }

    dispatch_group_enter(group);
    v222 = dispatch_semaphore_create(0);
    v223 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventManager peopleDiscoveryManager](self, "peopleDiscoveryManager"));
    v224 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", v216, 0.0));
    v225 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v281, "laterDate:", v224));
    v226 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", v216, 1.0));
    v227 = objc_claimAutoreleasedReturnValue(objc_msgSend(v280, "laterDate:", v226));
    v304[0] = _NSConcreteStackBlock;
    v304[1] = 3221225472;
    v304[2] = __65__MOEventManager__collectEventsBetweenStartDate_EndDate_handler___block_invoke_234;
    v304[3] = &unk_1002B5858;
    v308 = v386;
    v309 = buf;
    v228 = v222;
    v305 = v228;
    v306 = group;
    v229 = v219;
    v307 = v229;
    objc_msgSend(v223, "fetchAndSavePeopleDensityEventsBetweenStartDate:EndDate:handler:", v225, v227, v304);

    v230 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ - [%s] - %d - %s"), CFSTR("MOSemaphoreWait"), "/Library/Caches/com.apple.xbs/Sources/Moments/momentsd/PromptEngine/PromptProvider/MOEventManager.m", 1441, "-[MOEventManager _collectEventsBetweenStartDate:EndDate:handler:]"));
    v303 = 0;
    LOBYTE(v227) = MOSemaphoreWaitAndFaultIfTimeout_Internal(v228, &v303, v230, 120.0);
    v231 = v303;
    if ((v227 & 1) == 0)
    {
      v232 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
      v233 = objc_claimAutoreleasedReturnValue(v232);
      if (os_log_type_enabled(v233, OS_LOG_TYPE_ERROR))
        __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_cold_3();

    }
    if (v231)
      objc_msgSend(*((id *)v389 + 5), "setObject:forKey:", &__kCFBooleanFalse, CFSTR("resultPeopleDensitySuccess"));

  }
  else
  {
    v234 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    v216 = objc_claimAutoreleasedReturnValue(v234);
    if (os_log_type_enabled(v216, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v394 = 0;
      _os_log_impl((void *)&_mh_execute_header, v216, OS_LOG_TYPE_INFO, "skipping fetching and saving people density events", v394, 2u);
    }
  }

  if (-[MOConfigurationManager isAllowedToProcessEventCategory:](self->_configurationManager, "isAllowedToProcessEventCategory:", 16))
  {
    v235 = objc_claimAutoreleasedReturnValue(-[MOEventManager _getEarliestDateForCategory:](self, "_getEarliestDateForCategory:", 16));
    v236 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    v237 = objc_claimAutoreleasedReturnValue(v236);
    if (os_signpost_enabled(v237))
    {
      *(_WORD *)v394 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v237, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerCollectEventsMotionActivity", ", v394, 2u);
    }

    v238 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("CollectMotionActivity"), 0);
    -[MOPerformanceMeasurement startSession](v238, "startSession");
    v239 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    v240 = objc_claimAutoreleasedReturnValue(v239);
    if (os_log_type_enabled(v240, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v394 = 0;
      _os_log_impl((void *)&_mh_execute_header, v240, OS_LOG_TYPE_INFO, "start fetching and saving motion events", v394, 2u);
    }

    dispatch_group_enter(group);
    v241 = dispatch_semaphore_create(0);
    v242 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventManager motionManager](self, "motionManager"));
    v243 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", v235, 0.0));
    v244 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v281, "laterDate:", v243));
    v245 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", v235, 1.0));
    v246 = objc_claimAutoreleasedReturnValue(objc_msgSend(v280, "laterDate:", v245));
    v297[0] = _NSConcreteStackBlock;
    v297[1] = 3221225472;
    v297[2] = __65__MOEventManager__collectEventsBetweenStartDate_EndDate_handler___block_invoke_235;
    v297[3] = &unk_1002B5858;
    v301 = v386;
    v302 = buf;
    v247 = v241;
    v298 = v247;
    v299 = group;
    v248 = v238;
    v300 = v248;
    objc_msgSend(v242, "fetchAndSaveMotionActivityBetweenStartDate:EndDate:handler:", v244, v246, v297);

    v249 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ - [%s] - %d - %s"), CFSTR("MOSemaphoreWait"), "/Library/Caches/com.apple.xbs/Sources/Moments/momentsd/PromptEngine/PromptProvider/MOEventManager.m", 1477, "-[MOEventManager _collectEventsBetweenStartDate:EndDate:handler:]"));
    v296 = 0;
    LOBYTE(v246) = MOSemaphoreWaitAndFaultIfTimeout_Internal(v247, &v296, v249, 120.0);
    v250 = v296;
    if ((v246 & 1) == 0)
    {
      v251 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
      v252 = objc_claimAutoreleasedReturnValue(v251);
      if (os_log_type_enabled(v252, OS_LOG_TYPE_ERROR))
        __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_cold_3();

    }
    if (v250)
      objc_msgSend(*((id *)v389 + 5), "setObject:forKey:", &__kCFBooleanFalse, CFSTR("resultMotionSuccess"));

  }
  else
  {
    v253 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    v235 = objc_claimAutoreleasedReturnValue(v253);
    if (os_log_type_enabled(v235, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v394 = 0;
      _os_log_impl((void *)&_mh_execute_header, v235, OS_LOG_TYPE_INFO, "skipping fetching and saving motion events", v394, 2u);
    }
  }

  if (-[MOConfigurationManager isAllowedToProcessEventCategory:](self->_configurationManager, "isAllowedToProcessEventCategory:", 22))
  {
    v254 = objc_claimAutoreleasedReturnValue(-[MOEventManager _getEarliestDateForCategory:](self, "_getEarliestDateForCategory:", 22));
    v255 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    v256 = objc_claimAutoreleasedReturnValue(v255);
    if (os_signpost_enabled(v256))
    {
      *(_WORD *)v394 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v256, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerCollectEventsLifeEvents", ", v394, 2u);
    }

    v257 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("CollectLifeEvents"), 0);
    -[MOPerformanceMeasurement startSession](v257, "startSession");
    v258 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    v259 = objc_claimAutoreleasedReturnValue(v258);
    if (os_log_type_enabled(v259, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v394 = 0;
      _os_log_impl((void *)&_mh_execute_header, v259, OS_LOG_TYPE_INFO, "start fetching and saving life events", v394, 2u);
    }

    dispatch_group_enter(group);
    v260 = dispatch_semaphore_create(0);
    v261 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventManager lifeEventManager](self, "lifeEventManager"));
    v262 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", v254, 0.0));
    v263 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v281, "laterDate:", v262));
    v264 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", v254, 1.0));
    v265 = objc_claimAutoreleasedReturnValue(objc_msgSend(v280, "laterDate:", v264));
    v290[0] = _NSConcreteStackBlock;
    v290[1] = 3221225472;
    v290[2] = __65__MOEventManager__collectEventsBetweenStartDate_EndDate_handler___block_invoke_236;
    v290[3] = &unk_1002B5858;
    v294 = v386;
    v295 = buf;
    v266 = v260;
    v291 = v266;
    v292 = group;
    v267 = v257;
    v293 = v267;
    objc_msgSend(v261, "fetchAndSaveLifeEventsBetweenStartDate:endDate:handler:", v263, v265, v290);

    v268 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ - [%s] - %d - %s"), CFSTR("MOSemaphoreWait"), "/Library/Caches/com.apple.xbs/Sources/Moments/momentsd/PromptEngine/PromptProvider/MOEventManager.m", 1513, "-[MOEventManager _collectEventsBetweenStartDate:EndDate:handler:]"));
    v289 = 0;
    LOBYTE(v265) = MOSemaphoreWaitAndFaultIfTimeout_Internal(v266, &v289, v268, 120.0);
    v269 = v289;
    if ((v265 & 1) == 0)
    {
      v270 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
      v271 = objc_claimAutoreleasedReturnValue(v270);
      if (os_log_type_enabled(v271, OS_LOG_TYPE_ERROR))
        __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_cold_3();

    }
    if (v269)
      objc_msgSend(*((id *)v389 + 5), "setObject:forKey:", &__kCFBooleanFalse, CFSTR("resultLifeEventsSuccess"));

  }
  else
  {
    v272 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    v254 = objc_claimAutoreleasedReturnValue(v272);
    if (os_log_type_enabled(v254, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v394 = 0;
      _os_log_impl((void *)&_mh_execute_header, v254, OS_LOG_TYPE_INFO, "skipping fetching and saving life events", v394, 2u);
    }
  }

  v273 = objc_claimAutoreleasedReturnValue(-[MOEventManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __65__MOEventManager__collectEventsBetweenStartDate_EndDate_handler___block_invoke_237;
  block[3] = &unk_1002B58D0;
  v287 = buf;
  v288 = v386;
  v274 = v278;
  v286 = v274;
  v275 = v279;
  v285 = v275;
  dispatch_group_notify(group, v273, block);

  _Block_object_dispose(v386, 8);
  _Block_object_dispose(buf, 8);

}

void __65__MOEventManager__collectEventsBetweenStartDate_EndDate_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id os_log;
  NSObject *v11;
  uint8_t v12[16];

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setObject:forKey:", &__kCFBooleanFalse, CFSTR("resultWorkoutsSuccess"));
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("resultNumberOfEvents")));
    v9 = v8;
    if (v8)
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) += objc_msgSend(v8, "intValue");

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v11 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_signpost_enabled(v11))
  {
    *(_WORD *)v12 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerCollectEventsWorkouts", ", v12, 2u);
  }

  objc_msgSend(*(id *)(a1 + 48), "endSession");
}

void __65__MOEventManager__collectEventsBetweenStartDate_EndDate_handler___block_invoke_218(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id os_log;
  NSObject *v11;
  uint8_t v12[16];

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setObject:forKey:", &__kCFBooleanFalse, CFSTR("resultMindfulSessionsSuccess"));
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("resultNumberOfEvents")));
    v9 = v8;
    if (v8)
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) += objc_msgSend(v8, "intValue");

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v11 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_signpost_enabled(v11))
  {
    *(_WORD *)v12 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerCollectEventsMindfullSessions", ", v12, 2u);
  }

  objc_msgSend(*(id *)(a1 + 48), "endSession");
}

void __65__MOEventManager__collectEventsBetweenStartDate_EndDate_handler___block_invoke_219(uint64_t a1, void *a2)
{
  id v3;
  id os_log;
  NSObject *v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;

  v3 = a2;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
  v5 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v8 = 138412290;
    v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "detectHindsightVisits, error, %@", (uint8_t *)&v8, 0xCu);
  }

  if (v3)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setObject:forKey:", &__kCFBooleanFalse, CFSTR("resultVisitsSuccess"));
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  v6 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_signpost_enabled(v7))
  {
    LOWORD(v8) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerCollectEventsVisits-Training", ", (uint8_t *)&v8, 2u);
  }

  objc_msgSend(*(id *)(a1 + 40), "endSession");
}

void __65__MOEventManager__collectEventsBetweenStartDate_EndDate_handler___block_invoke_220(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id os_log;
  NSObject *v11;
  id v12;
  NSObject *v13;
  uint8_t v14[16];
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setObject:forKey:", &__kCFBooleanFalse, CFSTR("resultVisitsSuccess"));
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("resultNumberOfEvents")));
    v9 = v8;
    if (v8)
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) += objc_msgSend(v8, "intValue");

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v11 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerCollectEventsVisits-Fetching", ", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 48), "endSession");
  v12 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_signpost_enabled(v13))
  {
    *(_WORD *)v14 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerCollectEventsVisits", ", v14, 2u);
  }

  objc_msgSend(*(id *)(a1 + 56), "endSession");
}

void __65__MOEventManager__collectEventsBetweenStartDate_EndDate_handler___block_invoke_223(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id os_log;
  NSObject *v11;
  uint8_t v12[16];

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setObject:forKey:", &__kCFBooleanFalse, CFSTR("resultSharedPhotosSuccess"));
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("resultNumberOfEvents")));
    v9 = v8;
    if (v8)
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) += objc_msgSend(v8, "intValue");

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v11 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_signpost_enabled(v11))
  {
    *(_WORD *)v12 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerCollectEventsSharedPhotoMoments", ", v12, 2u);
  }

  objc_msgSend(*(id *)(a1 + 48), "endSession");
}

void __65__MOEventManager__collectEventsBetweenStartDate_EndDate_handler___block_invoke_224(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id os_log;
  NSObject *v11;
  uint8_t v12[16];

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setObject:forKey:", &__kCFBooleanFalse, CFSTR("resultPhotoMemorySuccess"));
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("resultNumberOfEvents")));
    v9 = v8;
    if (v8)
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) += objc_msgSend(v8, "intValue");

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v11 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_signpost_enabled(v11))
  {
    *(_WORD *)v12 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerCollectEventsPhotoMemories", ", v12, 2u);
  }

  objc_msgSend(*(id *)(a1 + 48), "endSession");
}

void __65__MOEventManager__collectEventsBetweenStartDate_EndDate_handler___block_invoke_227(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id os_log;
  NSObject *v11;
  uint8_t v12[16];

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setObject:forKey:", &__kCFBooleanFalse, CFSTR("resultSharedSuccess"));
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("resultNumberOfEvents")));
    v9 = v8;
    if (v8)
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) += objc_msgSend(v8, "intValue");

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v11 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_signpost_enabled(v11))
  {
    *(_WORD *)v12 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerCollectEventsSharedWithYouItems", ", v12, 2u);
  }

  objc_msgSend(*(id *)(a1 + 48), "endSession");
}

void __65__MOEventManager__collectEventsBetweenStartDate_EndDate_handler___block_invoke_230(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id os_log;
  NSObject *v11;
  uint8_t v12[16];

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setObject:forKey:", &__kCFBooleanFalse, CFSTR("resultTripsSuccess"));
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("resultNumberOfEvents")));
    v9 = v8;
    if (v8)
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) += objc_msgSend(v8, "intValue");

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v11 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_signpost_enabled(v11))
  {
    *(_WORD *)v12 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerCollectEventsTrips", ", v12, 2u);
  }

  objc_msgSend(*(id *)(a1 + 48), "endSession");
}

void __65__MOEventManager__collectEventsBetweenStartDate_EndDate_handler___block_invoke_231(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id os_log;
  NSObject *v11;
  uint8_t v12[16];

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setObject:forKey:", &__kCFBooleanFalse, CFSTR("resultMusicSuccess"));
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("resultNumberOfEvents")));
    v9 = v8;
    if (v8)
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) += objc_msgSend(v8, "intValue");

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v11 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_signpost_enabled(v11))
  {
    *(_WORD *)v12 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerCollectEventsMusic", ", v12, 2u);
  }

  objc_msgSend(*(id *)(a1 + 48), "endSession");
}

void __65__MOEventManager__collectEventsBetweenStartDate_EndDate_handler___block_invoke_232(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id os_log;
  NSObject *v11;
  uint8_t v12[16];

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setObject:forKey:", &__kCFBooleanFalse, CFSTR("resultContactsSuccess"));
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("resultNumberOfEvents")));
    v9 = v8;
    if (v8)
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) += objc_msgSend(v8, "intValue");

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v11 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_signpost_enabled(v11))
  {
    *(_WORD *)v12 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerCollectEventsContacts", ", v12, 2u);
  }

  objc_msgSend(*(id *)(a1 + 48), "endSession");
}

void __65__MOEventManager__collectEventsBetweenStartDate_EndDate_handler___block_invoke_233(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id os_log;
  NSObject *v11;
  uint8_t v12[16];

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setObject:forKey:", &__kCFBooleanFalse, CFSTR("resultPeopleDiscoverySuccess"));
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("resultNumberOfEvents")));
    v9 = v8;
    if (v8)
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) += objc_msgSend(v8, "intValue");

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v11 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_signpost_enabled(v11))
  {
    *(_WORD *)v12 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerCollectEventsProximity", ", v12, 2u);
  }

  objc_msgSend(*(id *)(a1 + 48), "endSession");
}

void __65__MOEventManager__collectEventsBetweenStartDate_EndDate_handler___block_invoke_234(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id os_log;
  NSObject *v11;
  uint8_t v12[16];

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setObject:forKey:", &__kCFBooleanFalse, CFSTR("resultPeopleDensitySuccess"));
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("resultNumberOfEvents")));
    v9 = v8;
    if (v8)
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) += objc_msgSend(v8, "intValue");

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v11 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_signpost_enabled(v11))
  {
    *(_WORD *)v12 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerCollectEventsPeopleDensity", ", v12, 2u);
  }

  objc_msgSend(*(id *)(a1 + 48), "endSession");
}

void __65__MOEventManager__collectEventsBetweenStartDate_EndDate_handler___block_invoke_235(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id os_log;
  NSObject *v11;
  uint8_t v12[16];

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setObject:forKey:", &__kCFBooleanFalse, CFSTR("resultMotionSuccess"));
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("resultNumberOfEvents")));
    v9 = v8;
    if (v8)
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) += objc_msgSend(v8, "intValue");

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v11 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_signpost_enabled(v11))
  {
    *(_WORD *)v12 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerCollectEventsMotionActivity", ", v12, 2u);
  }

  objc_msgSend(*(id *)(a1 + 48), "endSession");
}

void __65__MOEventManager__collectEventsBetweenStartDate_EndDate_handler___block_invoke_236(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id os_log;
  NSObject *v11;
  uint8_t v12[16];

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setObject:forKey:", &__kCFBooleanFalse, CFSTR("resultLifeEventsSuccess"));
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("resultNumberOfEvents")));
    v9 = v8;
    if (v8)
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) += objc_msgSend(v8, "intValue");

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v11 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_signpost_enabled(v11))
  {
    *(_WORD *)v12 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerCollectEventsLifeEvents", ", v12, 2u);
  }

  objc_msgSend(*(id *)(a1 + 48), "endSession");
}

id __65__MOEventManager__collectEventsBetweenStartDate_EndDate_handler___block_invoke_237(uint64_t a1)
{
  void *v2;
  void *v3;
  id os_log;
  NSObject *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  uint8_t v10[16];
  uint8_t buf[16];

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24)));
  objc_msgSend(v2, "setValue:forKey:", v3, CFSTR("resultNumberOfEvents"));

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
  v5 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "done with fetching events ", buf, 2u);
  }

  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v6 + 16))(v6, 0, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  v7 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_signpost_enabled(v8))
  {
    *(_WORD *)v10 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerCollectEvents", ", v10, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "endSession");
}

- (void)storeEvents:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  id os_log;
  NSObject *v9;
  MOPerformanceMeasurement *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  _QWORD v22[4];
  MOPerformanceMeasurement *v23;
  id v24;
  uint8_t buf[8];
  NSErrorUserInfoKey v26;
  const __CFString *v27;

  v6 = a3;
  v7 = a4;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v9 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerStoreEvents", ", buf, 2u);
  }

  v10 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("StoreEvents"), 0);
  -[MOPerformanceMeasurement startSession](v10, "startSession");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventManager eventStore](self, "eventStore"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "persistenceManager"));
  v13 = objc_msgSend(v12, "availability");

  v14 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  v16 = v15;
  if (v13 == (id)2)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "store events since datastore is available", buf, 2u);
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventManager eventStore](self, "eventStore"));
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = __38__MOEventManager_storeEvents_handler___block_invoke;
    v22[3] = &unk_1002B25B0;
    v24 = v7;
    v23 = v10;
    objc_msgSend(v17, "storeEvents:CompletionHandler:", v6, v22);

    v18 = v24;
  }
  else
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[MOEventManager storeEvents:handler:].cold.1();

    v26 = NSLocalizedDescriptionKey;
    v27 = CFSTR("[storeEvents] database is not available");
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("MOErrorDomain"), 16, v19));

    if (v7)
      (*((void (**)(id, void *, void *))v7 + 2))(v7, v18, &__NSDictionary0__struct);
    v20 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_signpost_enabled(v21))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v21, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerStoreEvents", ", buf, 2u);
    }

    -[MOPerformanceMeasurement endSession](v10, "endSession");
  }

}

void __38__MOEventManager_storeEvents_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id os_log;
  NSObject *v9;
  uint8_t v10[16];

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v9 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)v10 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerStoreEvents", ", v10, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "endSession");
}

- (void)fetchEventsWithOptions:(id)a3 CompletionHandler:(id)a4
{
  id v6;
  id v7;
  id os_log;
  NSObject *v9;
  MOPerformanceMeasurement *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  _QWORD v21[4];
  MOPerformanceMeasurement *v22;
  id v23;
  uint8_t buf[8];
  NSErrorUserInfoKey v25;
  const __CFString *v26;

  v6 = a3;
  v7 = a4;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v9 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerFetchEvents", ", buf, 2u);
  }

  v10 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("FetchEvents"), 0);
  -[MOPerformanceMeasurement startSession](v10, "startSession");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventManager eventStore](self, "eventStore"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "persistenceManager"));
  v13 = objc_msgSend(v12, "availability");

  v14 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  v16 = v15;
  if (v13 == (id)2)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "fetch events since datastore is available", buf, 2u);
    }

    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = __59__MOEventManager_fetchEventsWithOptions_CompletionHandler___block_invoke;
    v21[3] = &unk_1002AEB80;
    v23 = v7;
    v22 = v10;
    -[MOEventManager _fetchEventsWithOptions:CompletionHandler:](self, "_fetchEventsWithOptions:CompletionHandler:", v6, v21);

    v17 = v23;
  }
  else
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[MOEventManager fetchEventsWithOptions:CompletionHandler:].cold.1();

    v25 = NSLocalizedDescriptionKey;
    v26 = CFSTR("database is not available");
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("MOErrorDomain"), 16, v18));

    if (v7)
      (*((void (**)(id, void *, void *))v7 + 2))(v7, &__NSArray0__struct, v17);
    v19 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_signpost_enabled(v20))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v20, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerFetchEvents", ", buf, 2u);
    }

    -[MOPerformanceMeasurement endSession](v10, "endSession");
  }

}

void __59__MOEventManager_fetchEventsWithOptions_CompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id os_log;
  NSObject *v9;
  uint8_t v10[16];

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v9 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)v10 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerFetchEvents", ", v10, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "endSession");
}

- (void)_fetchEventsWithOptions:(id)a3 CompletionHandler:(id)a4
{
  void *v4;
  void *v5;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  id os_log;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  MOEventStore *eventStore;
  _QWORD v37[5];
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  _QWORD v42[4];
  id v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  void *v51;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventManager cachedEvents](self, "cachedEvents"));
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dateInterval"));
    if (v12)
    {
      v11 = (id)objc_claimAutoreleasedReturnValue(-[MOEventManager cacheStartDate](self, "cacheStartDate"));
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dateInterval"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "startDate"));
      if ((objc_msgSend(v11, "isOnOrBefore:", v5) & 1) != 0)
      {

LABEL_11:
        os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
        v21 = objc_claimAutoreleasedReturnValue(os_log);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventManager cacheStartDate](self, "cacheStartDate"));
          v23 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventManager cacheEndDate](self, "cacheEndDate"));
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dateInterval"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "startDate"));
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dateInterval"));
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "endDate"));
          *(_DWORD *)buf = 138413058;
          v45 = v22;
          v46 = 2112;
          v47 = v23;
          v48 = 2112;
          v49 = v25;
          v50 = 2112;
          v51 = v27;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "cached events time window covers the query time window, so fetch data from cache, cache start date, %@, end date, %@, query start date, %@, end date, %@", buf, 0x2Au);

        }
        v40[0] = _NSConcreteStackBlock;
        v40[1] = 3221225472;
        v40[2] = __60__MOEventManager__fetchEventsWithOptions_CompletionHandler___block_invoke_246;
        v40[3] = &unk_1002ADFD8;
        v41 = v9;
        -[MOEventManager _fetchEventsFromCacheWithOptions:CompletionHandler:](self, "_fetchEventsFromCacheWithOptions:CompletionHandler:", v8, v40);
        v15 = v41;
        goto LABEL_17;
      }
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventManager cacheEndDate](self, "cacheEndDate"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventManager cacheStartDate](self, "cacheStartDate"));
    objc_msgSend(v16, "timeIntervalSinceDate:", v17);
    v19 = v18;

    if (v12)
    {

    }
    if (v19 > 2419200.0)
      goto LABEL_11;
    v28 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventManager cacheStartDate](self, "cacheStartDate"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventManager cacheEndDate](self, "cacheEndDate"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dateInterval"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "startDate"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dateInterval"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "endDate"));
      *(_DWORD *)buf = 138413058;
      v45 = v30;
      v46 = 2112;
      v47 = v31;
      v48 = 2112;
      v49 = v33;
      v50 = 2112;
      v51 = v35;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "cached events time window does not cover the query time window, so fetch part from cache and rehydrate rest, cache start date, %@, end date, %@, query start date, %@, end date, %@", buf, 0x2Au);

    }
    eventStore = self->_eventStore;
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = __60__MOEventManager__fetchEventsWithOptions_CompletionHandler___block_invoke_247;
    v37[3] = &unk_1002B2628;
    v37[4] = self;
    v39 = v9;
    v38 = v8;
    -[MOEventStore fetchEventsWithOptions:CompletionHandler:](eventStore, "fetchEventsWithOptions:CompletionHandler:", v38, v37);

    v15 = v39;
  }
  else
  {
    v13 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "no events in cache so fetch data from database and rehydrate them or fetch interval is nil", buf, 2u);
    }

    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = __60__MOEventManager__fetchEventsWithOptions_CompletionHandler___block_invoke;
    v42[3] = &unk_1002ADFD8;
    v43 = v9;
    -[MOEventManager _fetchEventsFromDBAndRehydrateEventsWithOptions:CompletionHandler:](self, "_fetchEventsFromDBAndRehydrateEventsWithOptions:CompletionHandler:", v8, v42);
    v15 = v43;
  }
LABEL_17:

}

uint64_t __60__MOEventManager__fetchEventsWithOptions_CompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __60__MOEventManager__fetchEventsWithOptions_CompletionHandler___block_invoke_246(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __60__MOEventManager__fetchEventsWithOptions_CompletionHandler___block_invoke_247(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;

  v5 = a2;
  v6 = a3;
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __60__MOEventManager__fetchEventsWithOptions_CompletionHandler___block_invoke_2;
  block[3] = &unk_1002B5920;
  v13 = v6;
  v17 = *(id *)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(a1 + 40);
  v14 = v5;
  v15 = v8;
  v16 = v9;
  v10 = v5;
  v11 = v6;
  dispatch_async(v7, block);

}

void __60__MOEventManager__fetchEventsWithOptions_CompletionHandler___block_invoke_2(uint64_t a1)
{
  _QWORD *v2;
  BOOL v3;
  id os_log;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  NSMutableArray *v9;
  NSMutableDictionary *v10;
  void *v11;
  NSMutableDictionary *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  id v23;
  id v24;
  NSObject *v25;
  id v26;
  void *v27;
  NSMutableArray *v28;
  NSMutableArray *v29;
  NSMutableArray *v30;
  NSMutableArray *v31;
  _QWORD v32[4];
  NSMutableArray *v33;
  id v34;
  id v35;
  __int128 *p_buf;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[4];
  NSMutableArray *v42;
  NSMutableDictionary *v43;
  __int128 buf;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  _BYTE v49[128];

  v2 = (_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 32) == 0;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
  v5 = objc_claimAutoreleasedReturnValue(os_log);
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v8 = objc_msgSend(*(id *)(a1 + 40), "count");
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "fetched events count from store, %lu", (uint8_t *)&buf, 0xCu);
    }

    v9 = objc_opt_new(NSMutableArray);
    v10 = objc_opt_new(NSMutableDictionary);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "cachedEvents"));
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = __60__MOEventManager__fetchEventsWithOptions_CompletionHandler___block_invoke_248;
    v41[3] = &unk_1002B52B0;
    v29 = v9;
    v42 = v29;
    v12 = v10;
    v43 = v12;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", v41);

    v31 = objc_opt_new(NSMutableArray);
    v30 = objc_opt_new(NSMutableArray);
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v13 = *(id *)(a1 + 40);
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(_QWORD *)v38 != v15)
            objc_enumerationMutation(v13);
          v17 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 120), "isAllowedToProcessEventCategory:", objc_msgSend(v17, "category")))
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "eventIdentifier"));
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "UUIDString"));
            v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", v19));

            if (v20)
              -[NSMutableArray addObject:](v31, "addObject:", v20);
            else
              -[NSMutableArray addObject:](v30, "addObject:", v17);

          }
        }
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
      }
      while (v14);
    }

    v21 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = -[NSMutableArray count](v31, "count");
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "fetched events count from cache after filtering authorized events, %lu", (uint8_t *)&buf, 0xCu);
    }

    v24 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      v26 = -[NSMutableArray count](v30, "count");
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = v26;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "fetched events count from store which needes rehydration after filtering authorized events, %lu", (uint8_t *)&buf, 0xCu);
    }

    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v45 = 0x3032000000;
    v46 = __Block_byref_object_copy__37;
    v47 = __Block_byref_object_dispose__37;
    v48 = -[NSMutableArray mutableCopy](v31, "mutableCopy");
    v27 = *(void **)(a1 + 48);
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = __60__MOEventManager__fetchEventsWithOptions_CompletionHandler___block_invoke_250;
    v32[3] = &unk_1002B58F8;
    v28 = v30;
    v33 = v28;
    p_buf = &buf;
    v34 = *(id *)(a1 + 56);
    v35 = *(id *)(a1 + 64);
    objc_msgSend(v27, "_rehydrateEvents:withHandler:", v28, v32);

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __60__MOEventManager__fetchEventsWithOptions_CompletionHandler___block_invoke_2_cold_1();

    v7 = *(_QWORD *)(a1 + 64);
    if (v7)
      (*(void (**)(uint64_t, void *, _QWORD))(v7 + 16))(v7, &__NSArray0__struct, *v2);
  }
}

void __60__MOEventManager__fetchEventsWithOptions_CompletionHandler___block_invoke_248(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id os_log;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "eventIdentifier"));

  if (v4)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    v6 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "eventIdentifier"));
      v14 = 138412290;
      v15 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "event id: %@", (uint8_t *)&v14, 0xCu);

    }
    v8 = *(void **)(a1 + 32);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "eventIdentifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUIDString"));
    objc_msgSend(v8, "addObject:", v10);

    v11 = *(void **)(a1 + 40);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "eventIdentifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "UUIDString"));
    objc_msgSend(v11, "setObject:forKey:", v3, v13);

  }
}

void __60__MOEventManager__fetchEventsWithOptions_CompletionHandler___block_invoke_250(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id os_log;
  NSObject *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;

  v5 = a2;
  v6 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = objc_msgSend(v5, "count");
    v10 = objc_msgSend(*(id *)(a1 + 32), "count");
    *(_DWORD *)buf = 134218240;
    v17 = v9;
    v18 = 2048;
    v19 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "rehydrated events count, %lu, input, %lu", buf, 0x16u);
  }

  if (objc_msgSend(v5, "count"))
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObjectsFromArray:", v5);
  v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  v12 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("startDate"), objc_msgSend(*(id *)(a1 + 40), "ascending"));
  v15 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
  v14 = objc_msgSend(v11, "sortedArrayUsingDescriptors:", v13);

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)_fetchEventsFromDBAndRehydrateEventsWithOptions:(id)a3 CompletionHandler:(id)a4
{
  id v6;
  MOEventStore *eventStore;
  id v8;
  _QWORD v9[5];
  id v10;

  v6 = a4;
  eventStore = self->_eventStore;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __84__MOEventManager__fetchEventsFromDBAndRehydrateEventsWithOptions_CompletionHandler___block_invoke;
  v9[3] = &unk_1002B2348;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  -[MOEventStore fetchEventsWithOptions:CompletionHandler:](eventStore, "fetchEventsWithOptions:CompletionHandler:", a3, v9);

}

void __84__MOEventManager__fetchEventsFromDBAndRehydrateEventsWithOptions_CompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;
  id v16;

  v5 = a2;
  v6 = a3;
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "queue"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = __84__MOEventManager__fetchEventsFromDBAndRehydrateEventsWithOptions_CompletionHandler___block_invoke_2;
  v12[3] = &unk_1002AF708;
  v13 = v6;
  v8 = *(id *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 32);
  v14 = v5;
  v15 = v9;
  v16 = v8;
  v10 = v5;
  v11 = v6;
  dispatch_async(v7, v12);

}

void __84__MOEventManager__fetchEventsFromDBAndRehydrateEventsWithOptions_CompletionHandler___block_invoke_2(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  id os_log;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  NSMutableArray *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  id v16;
  NSObject *v17;
  id v18;
  void *v19;
  NSMutableArray *v20;
  _QWORD v21[4];
  NSMutableArray *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  id v30;

  v2 = (_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 32);
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
  v5 = objc_claimAutoreleasedReturnValue(os_log);
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __60__MOEventManager__fetchEventsWithOptions_CompletionHandler___block_invoke_2_cold_1();

    v7 = *(_QWORD *)(a1 + 56);
    if (v7)
      (*(void (**)(uint64_t, void *, _QWORD))(v7 + 16))(v7, &__NSArray0__struct, *v2);
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v8 = objc_msgSend(*(id *)(a1 + 40), "count");
      *(_DWORD *)buf = 134217984;
      v30 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "fetched events count from store, %lu", buf, 0xCu);
    }

    v9 = objc_opt_new(NSMutableArray);
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v10 = *(id *)(a1 + 40);
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v25 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 120), "isAllowedToProcessEventCategory:", objc_msgSend(v15, "category")))-[NSMutableArray addObject:](v9, "addObject:", v15);
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v12);
    }

    v16 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = -[NSMutableArray count](v9, "count");
      *(_DWORD *)buf = 134217984;
      v30 = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "fetched events count from store after filtering authorized events, %lu", buf, 0xCu);
    }

    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = __84__MOEventManager__fetchEventsFromDBAndRehydrateEventsWithOptions_CompletionHandler___block_invoke_255;
    v21[3] = &unk_1002B2348;
    v22 = v9;
    v19 = *(void **)(a1 + 48);
    v23 = *(id *)(a1 + 56);
    v20 = v9;
    objc_msgSend(v19, "_rehydrateEvents:withHandler:", v20, v21);

  }
}

void __84__MOEventManager__fetchEventsFromDBAndRehydrateEventsWithOptions_CompletionHandler___block_invoke_255(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id os_log;
  NSObject *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  int v13;
  id v14;
  __int16 v15;
  id v16;

  v5 = a2;
  v6 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = objc_msgSend(v5, "count");
    v10 = objc_msgSend(*(id *)(a1 + 32), "count");
    v13 = 134218240;
    v14 = v9;
    v15 = 2048;
    v16 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "rehydrated events count, %lu, input, %lu", (uint8_t *)&v13, 0x16u);
  }

  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
  {
    if (v5)
      v12 = v5;
    else
      v12 = &__NSArray0__struct;
    (*(void (**)(uint64_t, void *, id))(v11 + 16))(v11, v12, v6);
  }

}

- (void)_fetchEventsFromCacheWithOptions:(id)a3 CompletionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSMutableArray *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  MOEventFetchOptions *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  MOEventFetchOptions *v22;
  MOEventStore *eventStore;
  NSMutableArray *v24;
  void *v25;
  id os_log;
  NSObject *v27;
  _QWORD v28[5];
  NSMutableArray *v29;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  NSErrorUserInfoKey v37;
  const __CFString *v38;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventManager cachedEvents](self, "cachedEvents"));
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    v10 = objc_opt_new(NSMutableArray);
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventManager cachedEvents](self, "cachedEvents"));
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(_QWORD *)v33 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
          if (-[MOConfigurationManager isAllowedToProcessEventCategory:](self->_configurationManager, "isAllowedToProcessEventCategory:", objc_msgSend(v16, "category")))
          {
            -[NSMutableArray addObject:](v10, "addObject:", v16);
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v13);
    }

    v17 = [MOEventFetchOptions alloc];
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dateInterval"));
    v19 = objc_msgSend(v6, "ascending");
    v20 = objc_msgSend(v6, "category");
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "limit"));
    v22 = -[MOEventFetchOptions initWithDateInterval:ascending:category:limit:](v17, "initWithDateInterval:ascending:category:limit:", v18, v19, v20, v21);

    eventStore = self->_eventStore;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = __69__MOEventManager__fetchEventsFromCacheWithOptions_CompletionHandler___block_invoke;
    v28[3] = &unk_1002B2090;
    v28[4] = self;
    v29 = v10;
    v30 = v6;
    v31 = v7;
    v24 = v10;
    -[MOEventStore fetchAnalyticsEventsWithOptions:CompletionHandler:](eventStore, "fetchAnalyticsEventsWithOptions:CompletionHandler:", v22, v28);

  }
  else
  {
    v37 = NSLocalizedDescriptionKey;
    v38 = CFSTR("no cached events");
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1));
    v22 = (MOEventFetchOptions *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("MOErrorDomain"), 19, v25));

    os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    v27 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      -[MOEventManager _fetchEventsFromCacheWithOptions:CompletionHandler:].cold.1();

    (*((void (**)(id, void *, MOEventFetchOptions *))v7 + 2))(v7, &__NSArray0__struct, v22);
  }

}

void __69__MOEventManager__fetchEventsFromCacheWithOptions_CompletionHandler___block_invoke(id *a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;

  v3 = a2;
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __69__MOEventManager__fetchEventsFromCacheWithOptions_CompletionHandler___block_invoke_2;
  v6[3] = &unk_1002ADA68;
  v7 = v3;
  v8 = a1[5];
  v9 = a1[6];
  v10 = a1[7];
  v5 = v3;
  dispatch_async(v4, v6);

}

void __69__MOEventManager__fetchEventsFromCacheWithOptions_CompletionHandler___block_invoke_2(uint64_t a1)
{
  id os_log;
  NSObject *v3;
  id v4;
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
  id v18;
  void *v19;
  id v20;
  id v21;
  NSObject *v22;
  id v23;
  id v24;
  _QWORD v25[2];
  uint8_t buf[4];
  id v27;

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
  v3 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "count");
    *(_DWORD *)buf = 134217984;
    v27 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "fetched analytics events from store %lu", buf, 0xCu);
  }

  if (objc_msgSend(*(id *)(a1 + 32), "count"))
    objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "dateInterval"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "dateInterval"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "endDate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("startDate <= %@"), v8));
    v25[0] = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "dateInterval"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "startDate"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("endDate >= %@"), v11));
    v25[1] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v25, 2));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v13));
    objc_msgSend(v5, "addObject:", v14);

  }
  if (objc_msgSend(*(id *)(a1 + 48), "category"))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("category == %lu"), objc_msgSend(*(id *)(a1 + 48), "category")));
    objc_msgSend(v5, "addObject:", v15);

  }
  if (objc_msgSend(v5, "count"))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v5));
    objc_msgSend(*(id *)(a1 + 40), "filterUsingPredicate:", v16);

  }
  v17 = *(void **)(a1 + 40);
  v18 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("startDate"), objc_msgSend(*(id *)(a1 + 48), "ascending"));
  v24 = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v24, 1));
  v20 = objc_msgSend(v17, "sortedArrayUsingDescriptors:", v19);

  v21 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    v23 = objc_msgSend(*(id *)(a1 + 40), "count");
    *(_DWORD *)buf = 134217984;
    v27 = v23;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "fetched events total count %lu", buf, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)rehydrateEvents:(id)a3 withHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[MOEventManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __46__MOEventManager_rehydrateEvents_withHandler___block_invoke;
  block[3] = &unk_1002AEBA8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __46__MOEventManager_rehydrateEvents_withHandler___block_invoke(uint64_t a1)
{
  MOEventFetchOptions *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  MOEventFetchOptions *v7;
  void *v8;
  id v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;

  v2 = [MOEventFetchOptions alloc];
  v3 = objc_alloc((Class)NSDateInterval);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](NSDate, "distantFuture"));
  v6 = objc_msgSend(v3, "initWithStartDate:endDate:", v4, v5);
  v7 = -[MOEventFetchOptions initWithDateInterval:ascending:category:limit:](v2, "initWithDateInterval:ascending:category:limit:", v6, 1, 0, 0);

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __46__MOEventManager_rehydrateEvents_withHandler___block_invoke_2;
  v11[3] = &unk_1002AEBD0;
  v8 = *(void **)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v10 = *(_QWORD *)(a1 + 32);
  v12 = v9;
  v13 = v10;
  v14 = *(id *)(a1 + 48);
  objc_msgSend(v8, "_fetchEventsFromCacheWithOptions:CompletionHandler:", v7, v11);

}

void __46__MOEventManager_rehydrateEvents_withHandler___block_invoke_2(uint64_t a1)
{
  NSMutableDictionary *v2;
  NSMutableDictionary *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *j;
  void *v18;
  void *v19;
  unsigned int v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  NSMutableArray *v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  void *k;
  void *v31;
  void *v32;
  NSMutableDictionary *v33;
  uint64_t v34;
  _QWORD v35[4];
  NSMutableDictionary *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];

  v2 = objc_opt_new(NSMutableDictionary);
  v3 = objc_opt_new(NSMutableDictionary);
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v50 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "eventIdentifier"));
        -[NSMutableDictionary setObject:forKey:](v2, "setObject:forKey:", v9, v10);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
    }
    while (v6);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v2, "allKeys"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v11));

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v34 = a1;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "cachedEvents"));
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v46;
    do
    {
      for (j = 0; j != v15; j = (char *)j + 1)
      {
        if (*(_QWORD *)v46 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)j);
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "eventIdentifier"));
        v20 = objc_msgSend(v12, "containsObject:", v19);

        if (v20)
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "eventIdentifier"));
          -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v18, v21);

        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
    }
    while (v15);
  }

  v22 = -[NSMutableDictionary count](v3, "count");
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v3, "allKeys"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v23));
  objc_msgSend(v12, "minusSet:", v24);

  v25 = objc_opt_new(NSMutableArray);
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v26 = v12;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v42;
    do
    {
      for (k = 0; k != v28; k = (char *)k + 1)
      {
        if (*(_QWORD *)v42 != v29)
          objc_enumerationMutation(v26);
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v2, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)k)));
        -[NSMutableArray addObject:](v25, "addObject:", v31);

      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
    }
    while (v28);
  }

  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = __46__MOEventManager_rehydrateEvents_withHandler___block_invoke_3;
  v35[3] = &unk_1002B5948;
  v36 = v3;
  v39 = v22;
  v40 = -[NSMutableArray count](v25, "count");
  v32 = *(void **)(v34 + 40);
  v37 = *(id *)(v34 + 32);
  v38 = *(id *)(v34 + 48);
  v33 = v3;
  objc_msgSend(v32, "_rehydrateEvents:withHandler:", v25, v35);

}

void __46__MOEventManager_rehydrateEvents_withHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSMutableArray *v7;
  void *v8;
  id os_log;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;

  v5 = a2;
  v6 = a3;
  v7 = objc_opt_new(NSMutableArray);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "allValues"));
  -[NSMutableArray addObjectsFromArray:](v7, "addObjectsFromArray:", v8);

  -[NSMutableArray addObjectsFromArray:](v7, "addObjectsFromArray:", v5);
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
  v10 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = *(_QWORD *)(a1 + 56);
    v12 = *(_QWORD *)(a1 + 64);
    v13 = objc_msgSend(v5, "count");
    v14 = -[NSMutableArray count](v7, "count");
    v15 = objc_msgSend(*(id *)(a1 + 40), "count");
    v16 = 134219008;
    v17 = v11;
    v18 = 2048;
    v19 = v12;
    v20 = 2048;
    v21 = v13;
    v22 = 2048;
    v23 = v14;
    v24 = 2048;
    v25 = v15;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "rehydrateEvents, from cache, %lu, not cached, %lu, rehydratedEvents, %lu, total rehydratedEvents, %lu, total events, %lu", (uint8_t *)&v16, 0x34u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)_rehydrateEvents:(id)a3 withHandler:(id)a4
{
  id v6;
  id v7;
  id os_log;
  NSObject *v9;
  NSObject *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  uint64_t v15;
  void *v16;
  id v17;
  NSObject *v18;
  id v19;
  id v20;
  NSObject *v21;
  MOPerformanceMeasurement *v22;
  void *v23;
  MOPerformanceMeasurement *v24;
  void *v25;
  _QWORD block[5];
  id v27;
  MOPerformanceMeasurement *v28;
  id v29;
  uint8_t *v30;
  _QWORD *v31;
  _QWORD v32[6];
  id v33;
  NSObject *v34;
  uint8_t *v35;
  _QWORD *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[5];
  id v42;
  uint8_t buf[8];
  uint8_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint8_t v49[4];
  uint64_t v50;
  __int16 v51;
  id v52;
  _BYTE v53[128];

  v6 = a3;
  v7 = a4;
  v25 = v6;
  if (objc_msgSend(v6, "count"))
  {
    v23 = v7;
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    v9 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerRehydrateEvents", ", buf, 2u);
    }

    v24 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("RehydrateEvents"), 0);
    -[MOPerformanceMeasurement startSession](v24, "startSession");
    *(_QWORD *)buf = 0;
    v44 = buf;
    v45 = 0x3032000000;
    v46 = __Block_byref_object_copy__37;
    v47 = __Block_byref_object_dispose__37;
    v48 = objc_alloc_init((Class)NSMutableDictionary);
    v41[0] = 0;
    v41[1] = v41;
    v41[2] = 0x3032000000;
    v41[3] = __Block_byref_object_copy__37;
    v41[4] = __Block_byref_object_dispose__37;
    v42 = 0;
    v10 = dispatch_group_create();
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v11 = (id)objc_claimAutoreleasedReturnValue(-[MOEventManager splitEventArrayByCategory:](self, "splitEventArrayByCategory:", v6));
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v37, v53, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v38 != v13)
            objc_enumerationMutation(v11);
          v15 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i);
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", v15));
          if (objc_msgSend(v16, "count"))
          {
            dispatch_group_enter(v10);
            v17 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
            v18 = objc_claimAutoreleasedReturnValue(v17);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
            {
              v19 = objc_msgSend(v16, "count");
              *(_DWORD *)v49 = 138412546;
              v50 = v15;
              v51 = 2048;
              v52 = v19;
              _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "_rehydrateEventsAtSingleSource, START, keyword, %@, original events count, %lu", v49, 0x16u);
            }

            v32[0] = _NSConcreteStackBlock;
            v32[1] = 3221225472;
            v32[2] = __47__MOEventManager__rehydrateEvents_withHandler___block_invoke;
            v32[3] = &unk_1002B5998;
            v32[4] = self;
            v32[5] = v15;
            v35 = buf;
            v36 = v41;
            v20 = v16;
            v33 = v20;
            v34 = v10;
            -[MOEventManager _rehydrateEventsBySingleSource:handler:](self, "_rehydrateEventsBySingleSource:handler:", v20, v32);

          }
        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v37, v53, 16);
      }
      while (v12);
    }

    v21 = objc_claimAutoreleasedReturnValue(-[MOEventManager queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __47__MOEventManager__rehydrateEvents_withHandler___block_invoke_271;
    block[3] = &unk_1002B59C0;
    block[4] = self;
    v29 = v23;
    v30 = buf;
    v31 = v41;
    v27 = v25;
    v28 = v24;
    v22 = v24;
    dispatch_group_notify(v10, v21, block);

    _Block_object_dispose(v41, 8);
    _Block_object_dispose(buf, 8);

    v7 = v23;
  }
  else if (v7)
  {
    (*((void (**)(id, void *, _QWORD))v7 + 2))(v7, &__NSArray0__struct, 0);
  }

}

void __47__MOEventManager__rehydrateEvents_withHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  __int128 v18;

  v5 = a2;
  v6 = a3;
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "queue"));
  block[0] = _NSConcreteStackBlock;
  block[2] = __47__MOEventManager__rehydrateEvents_withHandler___block_invoke_2;
  block[3] = &unk_1002B5970;
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(void **)(a1 + 48);
  v13 = v5;
  v14 = v8;
  block[1] = 3221225472;
  v18 = *(_OWORD *)(a1 + 64);
  v15 = v6;
  v16 = v9;
  v17 = *(id *)(a1 + 56);
  v10 = v6;
  v11 = v5;
  dispatch_async(v7, block);

}

void __47__MOEventManager__rehydrateEvents_withHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id os_log;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  MORehydrationMetrics *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  _BOOL8 v24;
  void *v25;
  MORehydrationMetrics *v26;
  id v27;
  id v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  __int16 v35;
  uint64_t v36;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setObject:forKey:", v2, *(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  v5 = *(_QWORD *)(v3 + 40);
  v4 = (id *)(v3 + 40);
  if (!v5)
  {
    v6 = *(void **)(a1 + 48);
    if (v6)
      objc_storeStrong(v4, v6);
  }
  v7 = *(_QWORD *)(a1 + 48);
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
  v9 = objc_claimAutoreleasedReturnValue(os_log);
  v10 = v9;
  if (v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = *(_QWORD *)(a1 + 40);
      v12 = objc_msgSend(*(id *)(a1 + 56), "count");
      v13 = objc_msgSend(*(id *)(a1 + 32), "count");
      v14 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138413058;
      v30 = v11;
      v31 = 2048;
      v32 = v12;
      v33 = 2048;
      v34 = v13;
      v35 = 2112;
      v36 = v14;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "_rehydrateEventsAtSingleSource, DONE, keyword, %@, original events count, %lu, rehydrated events count, %lu, error, %@", buf, 0x2Au);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v15 = *(_QWORD *)(a1 + 40);
    v16 = objc_msgSend(*(id *)(a1 + 56), "count");
    v17 = objc_msgSend(*(id *)(a1 + 32), "count");
    v18 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138413058;
    v30 = v15;
    v31 = 2048;
    v32 = v16;
    v33 = 2048;
    v34 = v17;
    v35 = 2112;
    v36 = v18;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "_rehydrateEventsAtSingleSource, DONE, keyword, %@, original events count, %lu, rehydrated events count, %lu, error, %@", buf, 0x2Au);
  }

  v19 = [MORehydrationMetrics alloc];
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 56), "firstObject"));
  v21 = objc_msgSend(v20, "category");
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 56), "firstObject"));
  v23 = objc_msgSend(v22, "provider");
  v24 = *(_QWORD *)(a1 + 32) != 0;
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "description"));
  v26 = -[MORehydrationMetrics initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:](v19, "initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:", v21, v23, v24, v25, objc_msgSend(*(id *)(a1 + 56), "count"), 2, (double)(int)(objc_msgSend(*(id *)(a1 + 56), "count")- objc_msgSend(*(id *)(a1 + 32), "count")), 0.0);

  v28 = 0;
  -[MORehydrationMetrics submitMetricsWithError:](v26, "submitMetricsWithError:", &v28);
  v27 = v28;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));

}

id __47__MOEventManager__rehydrateEvents_withHandler___block_invoke_271(uint64_t a1)
{
  void *v2;
  id os_log;
  NSObject *v4;
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  __int16 v15;
  uint64_t v16;

  if (*(_QWORD *)(a1 + 56))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "mergeEventArraysFromDict:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40)));
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    v4 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = objc_msgSend(*(id *)(a1 + 40), "count");
      v6 = objc_msgSend(v2, "count");
      v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
      v11 = 134218498;
      v12 = v5;
      v13 = 2048;
      v14 = v6;
      v15 = 2112;
      v16 = v7;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "_rehydrateEvents, DONE, all original events count, %lu, all rehydrated events count, %lu, error, %@", (uint8_t *)&v11, 0x20u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  v8 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_signpost_enabled(v9))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerRehydrateEvents", ", (uint8_t *)&v11, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 48), "endSession");
}

- (void)_rehydrateEventsBySingleSource:(id)a3 handler:(id)a4
{
  id v6;
  void (**v7)(id, id, _QWORD);
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  NSObject *v13;
  MOPerformanceMeasurement *v14;
  void *v15;
  MOPerformanceMeasurement *v16;
  void *v17;
  id os_log;
  NSObject *v19;
  id v20;
  NSObject *v21;
  MOPerformanceMeasurement *v22;
  void *v23;
  MOPerformanceMeasurement *v24;
  id v25;
  id v26;
  NSObject *v27;
  MOPerformanceMeasurement *v28;
  void *v29;
  id v30;
  NSObject *v31;
  MOPerformanceMeasurement *v32;
  void *v33;
  id v34;
  NSObject *v35;
  void *v36;
  void *v37;
  id v38;
  NSObject *v39;
  const char *v40;
  id v41;
  NSObject *v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  NSObject *v47;
  MOPerformanceMeasurement *v48;
  void *v49;
  id v50;
  NSObject *v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  NSObject *v56;
  void *v57;
  void *v58;
  id v59;
  id v60;
  NSObject *v61;
  MOPerformanceMeasurement *v62;
  void *v63;
  id v64;
  NSObject *v65;
  MOPerformanceMeasurement *v66;
  void *v67;
  id v68;
  NSObject *v69;
  MOPerformanceMeasurement *v70;
  void *v71;
  id v72;
  NSObject *v73;
  MOPerformanceMeasurement *v74;
  void *v75;
  id v76;
  NSObject *v77;
  MOPerformanceMeasurement *v78;
  void *v79;
  id v80;
  NSObject *v81;
  MOPerformanceMeasurement *v82;
  void *v83;
  id v84;
  NSObject *v85;
  MOPerformanceMeasurement *v86;
  void *v87;
  id v88;
  _QWORD v89[4];
  MOPerformanceMeasurement *v90;
  void (**v91)(id, id, _QWORD);
  _QWORD v92[4];
  MOPerformanceMeasurement *v93;
  void (**v94)(id, id, _QWORD);
  _QWORD v95[4];
  MOPerformanceMeasurement *v96;
  void (**v97)(id, id, _QWORD);
  _QWORD v98[4];
  MOPerformanceMeasurement *v99;
  void (**v100)(id, id, _QWORD);
  _QWORD v101[4];
  MOPerformanceMeasurement *v102;
  void (**v103)(id, id, _QWORD);
  _QWORD v104[4];
  MOPerformanceMeasurement *v105;
  void (**v106)(id, id, _QWORD);
  _QWORD v107[4];
  MOPerformanceMeasurement *v108;
  void (**v109)(id, id, _QWORD);
  _QWORD v110[4];
  MOPerformanceMeasurement *v111;
  void (**v112)(id, id, _QWORD);
  _QWORD v113[4];
  MOPerformanceMeasurement *v114;
  void (**v115)(id, id, _QWORD);
  _QWORD v116[4];
  MOPerformanceMeasurement *v117;
  void (**v118)(id, id, _QWORD);
  _QWORD v119[4];
  MOPerformanceMeasurement *v120;
  void (**v121)(id, id, _QWORD);
  _QWORD v122[5];
  MOPerformanceMeasurement *v123;
  void (**v124)(id, id, _QWORD);
  uint8_t buf[16];

  v6 = a3;
  v7 = (void (**)(id, id, _QWORD))a4;
  if (v7)
  {
    if (objc_msgSend(v6, "count"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
      v9 = objc_msgSend(v8, "provider");

      if (v9 == (id)5)
      {
LABEL_4:
        v7[2](v7, v6, 0);
        goto LABEL_72;
      }
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
      v11 = objc_msgSend(v10, "category");

      if (-[MOConfigurationManager isAllowedToProcessEventCategory:](self->_configurationManager, "isAllowedToProcessEventCategory:", v11))
      {
        switch((unint64_t)v11)
        {
          case 0uLL:
            os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
            v19 = objc_claimAutoreleasedReturnValue(os_log);
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
              goto LABEL_11;
            goto LABEL_70;
          case 1uLL:
            v20 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
            v21 = objc_claimAutoreleasedReturnValue(v20);
            if (os_signpost_enabled(v21))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v21, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerRehydrateEventsVisits", ", buf, 2u);
            }

            v22 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("RehydrateVisits"), 0);
            -[MOPerformanceMeasurement startSession](v22, "startSession");
            v23 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventManager routineServiceManager](self, "routineServiceManager"));
            v122[0] = _NSConcreteStackBlock;
            v122[1] = 3221225472;
            v122[2] = __57__MOEventManager__rehydrateEventsBySingleSource_handler___block_invoke;
            v122[3] = &unk_1002B2628;
            v122[4] = self;
            v123 = v22;
            v124 = v7;
            v24 = v22;
            objc_msgSend(v23, "rehydrateVisits:handler:", v6, v122);

            goto LABEL_72;
          case 2uLL:
          case 0xDuLL:
            v12 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
            v13 = objc_claimAutoreleasedReturnValue(v12);
            if (os_signpost_enabled(v13))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerRehydrateEventsWorkouts", ", buf, 2u);
            }

            v14 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("RehydrateWorkouts"), 0);
            -[MOPerformanceMeasurement startSession](v14, "startSession");
            v15 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventManager healthKitManager](self, "healthKitManager"));
            v119[0] = _NSConcreteStackBlock;
            v119[1] = 3221225472;
            v119[2] = __57__MOEventManager__rehydrateEventsBySingleSource_handler___block_invoke_276;
            v119[3] = &unk_1002AEB80;
            v120 = v14;
            v121 = v7;
            v16 = v14;
            objc_msgSend(v15, "rehydrateWorkouts:handler:", v6, v119);

            v17 = v121;
            goto LABEL_66;
          case 4uLL:
            v26 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
            v27 = objc_claimAutoreleasedReturnValue(v26);
            if (os_signpost_enabled(v27))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v27, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerRehydrateEventsLeisureMedia", ", buf, 2u);
            }

            v28 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("RehydrateLeisureMedia"), 0);
            -[MOPerformanceMeasurement startSession](v28, "startSession");
            v29 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventManager nowPlayingMediaManager](self, "nowPlayingMediaManager"));
            v113[0] = _NSConcreteStackBlock;
            v113[1] = 3221225472;
            v113[2] = __57__MOEventManager__rehydrateEventsBySingleSource_handler___block_invoke_282;
            v113[3] = &unk_1002AEB80;
            v114 = v28;
            v115 = v7;
            v16 = v28;
            objc_msgSend(v29, "rehydratedMediaPlayEvents:handler:", v6, v113);

            v17 = v115;
            goto LABEL_66;
          case 5uLL:
          case 0x12uLL:
          case 0x13uLL:
          case 0x14uLL:
            goto LABEL_4;
          case 6uLL:
            v30 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
            v31 = objc_claimAutoreleasedReturnValue(v30);
            if (os_signpost_enabled(v31))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v31, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerRehydrateEventsMediaPlaySessions", ", buf, 2u);
            }

            v32 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("RehydrateMediaPlaySessions"), 0);
            -[MOPerformanceMeasurement startSession](v32, "startSession");
            v33 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventManager nowPlayingMediaManager](self, "nowPlayingMediaManager"));
            v116[0] = _NSConcreteStackBlock;
            v116[1] = 3221225472;
            v116[2] = __57__MOEventManager__rehydrateEventsBySingleSource_handler___block_invoke_279;
            v116[3] = &unk_1002AEB80;
            v117 = v32;
            v118 = v7;
            v16 = v32;
            objc_msgSend(v33, "rehydratedMediaPlayEvents:handler:", v6, v116);

            v17 = v118;
            goto LABEL_66;
          case 7uLL:
            break;
          case 8uLL:
            v34 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
            v35 = objc_claimAutoreleasedReturnValue(v34);
            if (os_signpost_enabled(v35))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v35, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerRehydrateEventsTrips", ", buf, 2u);
            }

            v16 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("RehydrateTrips"), 0);
            -[MOPerformanceMeasurement startSession](v16, "startSession");
            v36 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventManager proactiveTravelManager](self, "proactiveTravelManager"));
            v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "rehydratedTripEvents:", v6));
            v7[2](v7, v37, 0);

            v38 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
            v39 = objc_claimAutoreleasedReturnValue(v38);
            if (!os_signpost_enabled(v39))
              goto LABEL_43;
            *(_WORD *)buf = 0;
            v40 = "EventManagerRehydrateEventsTrips";
            goto LABEL_42;
          case 9uLL:
            v41 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
            v42 = objc_claimAutoreleasedReturnValue(v41);
            if (os_signpost_enabled(v42))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v42, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerRehydrateEventsSharedWithYouItems", ", buf, 2u);
            }

            v16 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("RehydrateSharedWithYou"), 0);
            -[MOPerformanceMeasurement startSession](v16, "startSession");
            v43 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventManager sharedWithYouManager](self, "sharedWithYouManager"));
            v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "rehydratedSharedContentEvents:", v6));
            v7[2](v7, v44, 0);

            v45 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
            v39 = objc_claimAutoreleasedReturnValue(v45);
            if (!os_signpost_enabled(v39))
              goto LABEL_43;
            *(_WORD *)buf = 0;
            v40 = "EventManagerRehydrateEventsSharedWithYouItems";
            goto LABEL_42;
          case 0xAuLL:
            v46 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
            v47 = objc_claimAutoreleasedReturnValue(v46);
            if (os_signpost_enabled(v47))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v47, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerRehydrateEventsSignificantContact", ", buf, 2u);
            }

            v48 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("RehydrateSignificantContact"), 0);
            -[MOPerformanceMeasurement startSession](v48, "startSession");
            v49 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventManager significantContactManager](self, "significantContactManager"));
            v110[0] = _NSConcreteStackBlock;
            v110[1] = 3221225472;
            v110[2] = __57__MOEventManager__rehydrateEventsBySingleSource_handler___block_invoke_289;
            v110[3] = &unk_1002AEB80;
            v111 = v48;
            v112 = v7;
            v16 = v48;
            objc_msgSend(v49, "rehydrateConversations:handler:", v6, v110);

            v17 = v112;
            goto LABEL_66;
          case 0xBuLL:
            v50 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
            v51 = objc_claimAutoreleasedReturnValue(v50);
            if (os_signpost_enabled(v51))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v51, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerRehydrateEventsStructuredEvent", ", buf, 2u);
            }

            v16 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("RehydrateStructuredEvent"), 0);
            -[MOPerformanceMeasurement startSession](v16, "startSession");
            v52 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventManager suggestedEventManager](self, "suggestedEventManager"));
            v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "rehydratedSuggestedEvents:", v6));
            v7[2](v7, v53, 0);

            v54 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
            v39 = objc_claimAutoreleasedReturnValue(v54);
            if (!os_signpost_enabled(v39))
              goto LABEL_43;
            *(_WORD *)buf = 0;
            v40 = "EventManagerRehydrateEventsStructuredEvent";
            goto LABEL_42;
          case 0xCuLL:
            v55 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
            v56 = objc_claimAutoreleasedReturnValue(v55);
            if (os_signpost_enabled(v56))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v56, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerRehydrateEventsNLEvent", ", buf, 2u);
            }

            v16 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("RehydrateNLEvent"), 0);
            -[MOPerformanceMeasurement startSession](v16, "startSession");
            v57 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventManager suggestedEventManager](self, "suggestedEventManager"));
            v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "rehydratedSuggestedEvents:", v6));
            v7[2](v7, v58, 0);

            v59 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
            v39 = objc_claimAutoreleasedReturnValue(v59);
            if (!os_signpost_enabled(v39))
              goto LABEL_43;
            *(_WORD *)buf = 0;
            v40 = "EventManagerRehydrateEventsNLEvent";
LABEL_42:
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v39, OS_SIGNPOST_INTERVAL_END, 1uLL, v40, "", buf, 2u);
LABEL_43:

            -[MOPerformanceMeasurement endSession](v16, "endSession");
            goto LABEL_67;
          case 0xEuLL:
            v60 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
            v61 = objc_claimAutoreleasedReturnValue(v60);
            if (os_signpost_enabled(v61))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v61, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerRehydrateEventsSharedPhoto", ", buf, 2u);
            }

            v62 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("RehydrateSharedPhoto"), 0);
            -[MOPerformanceMeasurement startSession](v62, "startSession");
            v63 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventManager photoManager](self, "photoManager"));
            v107[0] = _NSConcreteStackBlock;
            v107[1] = 3221225472;
            v107[2] = __57__MOEventManager__rehydrateEventsBySingleSource_handler___block_invoke_296;
            v107[3] = &unk_1002AEB80;
            v108 = v62;
            v109 = v7;
            v16 = v62;
            objc_msgSend(v63, "rehydrateSharedPhotos:handler:", v6, v107);

            v17 = v109;
            goto LABEL_66;
          case 0xFuLL:
            v64 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
            v65 = objc_claimAutoreleasedReturnValue(v64);
            if (os_signpost_enabled(v65))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v65, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerRehydrateEventsProximity", ", buf, 2u);
            }

            v66 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("RehydrateProximity"), 0);
            -[MOPerformanceMeasurement startSession](v66, "startSession");
            v67 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventManager peopleDiscoveryManager](self, "peopleDiscoveryManager"));
            v98[0] = _NSConcreteStackBlock;
            v98[1] = 3221225472;
            v98[2] = __57__MOEventManager__rehydrateEventsBySingleSource_handler___block_invoke_305;
            v98[3] = &unk_1002AEB80;
            v99 = v66;
            v100 = v7;
            v16 = v66;
            objc_msgSend(v67, "rehydrateProx:handler:", v6, v98);

            v17 = v100;
            goto LABEL_66;
          case 0x10uLL:
            if (-[MOConfigurationManagerBase getBoolSettingForKey:withFallback:](self->_configurationManager, "getBoolSettingForKey:withFallback:", CFSTR("MODevEnableMotionActivity"), 1))
            {
              v68 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
              v69 = objc_claimAutoreleasedReturnValue(v68);
              if (os_signpost_enabled(v69))
              {
                *(_WORD *)buf = 0;
                _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v69, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerRehydrateEventsMotionActivity", ", buf, 2u);
              }

              v70 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("RehydrateMotionActivity"), 0);
              -[MOPerformanceMeasurement startSession](v70, "startSession");
              v71 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventManager motionManager](self, "motionManager"));
              v104[0] = _NSConcreteStackBlock;
              v104[1] = 3221225472;
              v104[2] = __57__MOEventManager__rehydrateEventsBySingleSource_handler___block_invoke_299;
              v104[3] = &unk_1002AEB80;
              v105 = v70;
              v106 = v7;
              v16 = v70;
              objc_msgSend(v71, "rehydrateMotionActivity:handler:", v6, v104);

              v17 = v106;
LABEL_66:

LABEL_67:
              goto LABEL_72;
            }
            v88 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
            v19 = objc_claimAutoreleasedReturnValue(v88);
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "rehydrateEvent at single source is disabled for motion activity.", buf, 2u);
            }
LABEL_70:

            break;
          case 0x11uLL:
            v72 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
            v73 = objc_claimAutoreleasedReturnValue(v72);
            if (os_signpost_enabled(v73))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v73, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerRehydrateEventsPhotoMemory", ", buf, 2u);
            }

            v74 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("RehydratePhotoMemory"), 0);
            -[MOPerformanceMeasurement startSession](v74, "startSession");
            v75 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventManager photoManager](self, "photoManager"));
            v101[0] = _NSConcreteStackBlock;
            v101[1] = 3221225472;
            v101[2] = __57__MOEventManager__rehydrateEventsBySingleSource_handler___block_invoke_302;
            v101[3] = &unk_1002AEB80;
            v102 = v74;
            v103 = v7;
            v16 = v74;
            objc_msgSend(v75, "rehydratePhotoMemories:handler:", v6, v101);

            v17 = v103;
            goto LABEL_66;
          case 0x16uLL:
            v76 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
            v77 = objc_claimAutoreleasedReturnValue(v76);
            if (os_signpost_enabled(v77))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v77, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerRehydrateEventsLifeEvent", ", buf, 2u);
            }

            v78 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("RehydrateLifeEvent"), 0);
            -[MOPerformanceMeasurement startSession](v78, "startSession");
            v79 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventManager lifeEventManager](self, "lifeEventManager"));
            v92[0] = _NSConcreteStackBlock;
            v92[1] = 3221225472;
            v92[2] = __57__MOEventManager__rehydrateEventsBySingleSource_handler___block_invoke_311;
            v92[3] = &unk_1002AEB80;
            v93 = v78;
            v94 = v7;
            v16 = v78;
            objc_msgSend(v79, "rehydrateLifeEvents:handler:", v6, v92);

            v17 = v94;
            goto LABEL_66;
          case 0x17uLL:
            v80 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
            v81 = objc_claimAutoreleasedReturnValue(v80);
            if (os_signpost_enabled(v81))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v81, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerRehydrateEventsPeopleDensity", ", buf, 2u);
            }

            v82 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("RehydratePeopleDensity"), 0);
            -[MOPerformanceMeasurement startSession](v82, "startSession");
            v83 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventManager peopleDiscoveryManager](self, "peopleDiscoveryManager"));
            v95[0] = _NSConcreteStackBlock;
            v95[1] = 3221225472;
            v95[2] = __57__MOEventManager__rehydrateEventsBySingleSource_handler___block_invoke_308;
            v95[3] = &unk_1002AEB80;
            v96 = v82;
            v97 = v7;
            v16 = v82;
            objc_msgSend(v83, "rehydratePeopleDensityEvents:handler:", v6, v95);

            v17 = v97;
            goto LABEL_66;
          case 0x18uLL:
            v84 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
            v85 = objc_claimAutoreleasedReturnValue(v84);
            if (os_signpost_enabled(v85))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v85, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerRehydrateEventsStateOfMind", ", buf, 2u);
            }

            v86 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("RehydrateStateOfMind"), 0);
            -[MOPerformanceMeasurement startSession](v86, "startSession");
            v87 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventManager healthKitManager](self, "healthKitManager"));
            v89[0] = _NSConcreteStackBlock;
            v89[1] = 3221225472;
            v89[2] = __57__MOEventManager__rehydrateEventsBySingleSource_handler___block_invoke_314;
            v89[3] = &unk_1002AEB80;
            v90 = v86;
            v91 = v7;
            v16 = v86;
            objc_msgSend(v87, "rehydrateStateOfMind:handler:", v6, v89);

            v17 = v91;
            goto LABEL_66;
          default:
            v25 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
            v19 = objc_claimAutoreleasedReturnValue(v25);
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
LABEL_11:
              -[MOEventManager _rehydrateEventsBySingleSource:handler:].cold.1();
            goto LABEL_70;
        }
      }
    }
    v7[2](v7, &__NSArray0__struct, 0);
  }
LABEL_72:

}

void __57__MOEventManager__rehydrateEventsBySingleSource_handler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void (*v6)(uint64_t, id, uint64_t);
  id v7;
  id os_log;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  uint8_t v13[16];
  _QWORD v14[4];
  id v15;
  id v16;

  if (a3)
  {
    v5 = *(_QWORD *)(a1 + 48);
    v6 = *(void (**)(uint64_t, id, uint64_t))(v5 + 16);
    v7 = a2;
    v6(v5, v7, a3);

    os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    v9 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_signpost_enabled(v9))
    {
      *(_WORD *)v13 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerRehydrateEventsVisits", ", v13, 2u);
    }

    objc_msgSend(*(id *)(a1 + 40), "endSession");
  }
  else
  {
    v10 = *(void **)(a1 + 32);
    v11 = a2;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "weatherManager"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = __57__MOEventManager__rehydrateEventsBySingleSource_handler___block_invoke_2;
    v14[3] = &unk_1002AEB80;
    v16 = *(id *)(a1 + 48);
    v15 = *(id *)(a1 + 40);
    objc_msgSend(v12, "rehydrateWeather:handler:", v11, v14);

  }
}

id __57__MOEventManager__rehydrateEventsBySingleSource_handler___block_invoke_2(uint64_t a1)
{
  id os_log;
  NSObject *v3;
  uint8_t v5[16];

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v3 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)v5 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerRehydrateEventsVisits", ", v5, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "endSession");
}

id __57__MOEventManager__rehydrateEventsBySingleSource_handler___block_invoke_276(uint64_t a1)
{
  id os_log;
  NSObject *v3;
  uint8_t v5[16];

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v3 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)v5 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerRehydrateEventsWorkouts", ", v5, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "endSession");
}

id __57__MOEventManager__rehydrateEventsBySingleSource_handler___block_invoke_279(uint64_t a1)
{
  id os_log;
  NSObject *v3;
  uint8_t v5[16];

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v3 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)v5 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerRehydrateEventsMediaPlaySessions", ", v5, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "endSession");
}

id __57__MOEventManager__rehydrateEventsBySingleSource_handler___block_invoke_282(uint64_t a1)
{
  id os_log;
  NSObject *v3;
  uint8_t v5[16];

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v3 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)v5 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerRehydrateEventsLeisureMedia", ", v5, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "endSession");
}

id __57__MOEventManager__rehydrateEventsBySingleSource_handler___block_invoke_289(uint64_t a1)
{
  id os_log;
  NSObject *v3;
  uint8_t v5[16];

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v3 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)v5 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerRehydrateEventsSignificantContact", ", v5, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "endSession");
}

id __57__MOEventManager__rehydrateEventsBySingleSource_handler___block_invoke_296(uint64_t a1)
{
  id os_log;
  NSObject *v3;
  uint8_t v5[16];

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v3 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)v5 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerRehydrateEventsSharedPhoto", ", v5, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "endSession");
}

id __57__MOEventManager__rehydrateEventsBySingleSource_handler___block_invoke_299(uint64_t a1)
{
  id os_log;
  NSObject *v3;
  uint8_t v5[16];

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v3 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)v5 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerRehydrateEventsMotionActivity", ", v5, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "endSession");
}

id __57__MOEventManager__rehydrateEventsBySingleSource_handler___block_invoke_302(uint64_t a1)
{
  id os_log;
  NSObject *v3;
  uint8_t v5[16];

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v3 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)v5 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerRehydrateEventsPhotoMemory", ", v5, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "endSession");
}

id __57__MOEventManager__rehydrateEventsBySingleSource_handler___block_invoke_305(uint64_t a1)
{
  id os_log;
  NSObject *v3;
  uint8_t v5[16];

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v3 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)v5 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerRehydrateEventsProximity", ", v5, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "endSession");
}

id __57__MOEventManager__rehydrateEventsBySingleSource_handler___block_invoke_308(uint64_t a1)
{
  id os_log;
  NSObject *v3;
  uint8_t v5[16];

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v3 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)v5 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerRehydrateEventsPeopleDensity", ", v5, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "endSession");
}

id __57__MOEventManager__rehydrateEventsBySingleSource_handler___block_invoke_311(uint64_t a1)
{
  id os_log;
  NSObject *v3;
  uint8_t v5[16];

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v3 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)v5 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerRehydrateEventsLifeEvent", ", v5, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "endSession");
}

id __57__MOEventManager__rehydrateEventsBySingleSource_handler___block_invoke_314(uint64_t a1)
{
  id os_log;
  NSObject *v3;
  uint8_t v5[16];

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v3 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)v5 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerRehydrateEventsStateOfMind", ", v5, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "endSession");
}

- (void)cleanUpEventsWithRefreshVariant:(unint64_t)a3 andHandler:(id)a4
{
  id v6;
  id os_log;
  NSObject *v8;
  MOPerformanceMeasurement *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  _QWORD v21[4];
  MOPerformanceMeasurement *v22;
  id v23;
  uint8_t buf[8];
  const __CFString *v25;
  void *v26;
  NSErrorUserInfoKey v27;
  const __CFString *v28;

  v6 = a4;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerCleanUpEvents", ", buf, 2u);
  }

  v9 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("Cleanup"), 0);
  -[MOPerformanceMeasurement startSession](v9, "startSession");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventManager eventStore](self, "eventStore"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "persistenceManager"));
  v12 = objc_msgSend(v11, "availability");

  v13 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  v15 = v14;
  if (v12 == (id)2)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "purge event since datastore is available", buf, 2u);
    }

    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = __61__MOEventManager_cleanUpEventsWithRefreshVariant_andHandler___block_invoke;
    v21[3] = &unk_1002B25B0;
    v23 = v6;
    v22 = v9;
    -[MOEventManager _cleanUpEventsWithRefreshVariant:andHandler:](self, "_cleanUpEventsWithRefreshVariant:andHandler:", a3, v21);

  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[MOEventManager cleanUpEventsWithRefreshVariant:andHandler:].cold.1();

    if (v6)
    {
      v27 = NSLocalizedDescriptionKey;
      v28 = CFSTR("[cleanUpEventsWithRefreshVariant] database is not available");
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1));
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("MOErrorDomain"), 16, v16));

      v25 = CFSTR("stateDatabaseAvailable");
      v26 = &__kCFBooleanFalse;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1));
      (*((void (**)(id, void *, void *))v6 + 2))(v6, v17, v18);

    }
    v19 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_signpost_enabled(v20))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v20, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerCleanUpEvents", ", buf, 2u);
    }

    -[MOPerformanceMeasurement endSession](v9, "endSession");
  }

}

void __61__MOEventManager_cleanUpEventsWithRefreshVariant_andHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id os_log;
  NSObject *v9;
  uint8_t v10[16];

  v5 = a2;
  v6 = objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v6, "setObject:forKey:", &__kCFBooleanTrue, CFSTR("stateDatabaseAvailable"));
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v9 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)v10 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerCleanUpEvents", ", v10, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "endSession");
}

- (void)_cleanUpEventsWithRefreshVariant:(unint64_t)a3 andHandler:(id)a4
{
  id v6;
  NSObject *v7;
  id os_log;
  NSObject *v9;
  NSObject *v10;
  unint64_t v11;
  MOPerformanceMeasurement *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  MOPerformanceMeasurement *v16;
  MOEventStore *eventStore;
  NSObject *v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  MOPerformanceMeasurement *v22;
  MOEventStore *v23;
  NSObject *v24;
  id v25;
  NSObject *v26;
  NSObject *v27;
  MOPerformanceMeasurement *v28;
  void *v29;
  id v30;
  MOEventStore *v31;
  NSObject *v32;
  MOPerformanceMeasurement *v33;
  id v34;
  NSObject *v35;
  NSObject *v36;
  MOPerformanceMeasurement *v37;
  void *v38;
  id v39;
  MOEventStore *v40;
  NSObject *v41;
  MOPerformanceMeasurement *v42;
  id v43;
  NSObject *v44;
  NSObject *v45;
  MOPerformanceMeasurement *v46;
  dispatch_semaphore_t v47;
  void *v48;
  NSObject *v49;
  NSObject *v50;
  MOPerformanceMeasurement *v51;
  void *v52;
  id v53;
  id v54;
  NSObject *v55;
  NSObject *v56;
  MOPerformanceMeasurement *v57;
  id v58;
  MOPerformanceMeasurement *v59;
  MOPerformanceMeasurement *v60;
  MOPerformanceMeasurement *v61;
  void *v62;
  _QWORD block[4];
  MOPerformanceMeasurement *v64;
  id v65;
  _QWORD *v66;
  _QWORD *v67;
  _QWORD *v68;
  unint64_t v69;
  id v70;
  _QWORD v71[4];
  NSObject *v72;
  NSObject *v73;
  MOPerformanceMeasurement *v74;
  MOEventManager *v75;
  _QWORD *v76;
  _QWORD *v77;
  unint64_t v78;
  _QWORD v79[4];
  NSObject *v80;
  MOPerformanceMeasurement *v81;
  _QWORD *v82;
  _QWORD *v83;
  unint64_t v84;
  _QWORD v85[4];
  NSObject *v86;
  MOPerformanceMeasurement *v87;
  _QWORD *v88;
  _QWORD *v89;
  unint64_t v90;
  _QWORD v91[4];
  NSObject *v92;
  MOPerformanceMeasurement *v93;
  _QWORD *v94;
  _QWORD *v95;
  unint64_t v96;
  _QWORD v97[4];
  NSObject *v98;
  MOPerformanceMeasurement *v99;
  _QWORD *v100;
  _QWORD *v101;
  unint64_t v102;
  uint8_t buf[8];
  _QWORD v104[5];
  id v105;
  _QWORD v106[3];
  int v107;
  _QWORD v108[5];
  id v109;

  v6 = a4;
  v108[0] = 0;
  v108[1] = v108;
  v108[2] = 0x3032000000;
  v108[3] = __Block_byref_object_copy__37;
  v108[4] = __Block_byref_object_dispose__37;
  v109 = objc_alloc_init((Class)NSMutableDictionary);
  v106[0] = 0;
  v106[1] = v106;
  v106[2] = 0x2020000000;
  v107 = 0;
  v104[0] = 0;
  v104[1] = v104;
  v104[2] = 0x3032000000;
  v104[3] = __Block_byref_object_copy__37;
  v104[4] = __Block_byref_object_dispose__37;
  v105 = 0;
  v7 = dispatch_group_create();
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v9 = objc_claimAutoreleasedReturnValue(os_log);
  v10 = v9;
  v62 = v6;
  v11 = a3 - 1;
  if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_BEGIN, a3, "EventManagerCleanUpEventsWrapper", ", buf, 2u);
  }

  v12 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("CleanupWrapper"), 0);
  -[MOPerformanceMeasurement startSession](v12, "startSession");
  v61 = v12;
  v13 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  v15 = v14;
  if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_INTERVAL_BEGIN, a3, "EventManagerCleanUpEventsExpiredEvents", ", buf, 2u);
  }

  v16 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("CleanupExpiredEvents"), 0);
  -[MOPerformanceMeasurement startSession](v16, "startSession");
  dispatch_group_enter(v7);
  eventStore = self->_eventStore;
  v97[0] = _NSConcreteStackBlock;
  v97[1] = 3221225472;
  v97[2] = __62__MOEventManager__cleanUpEventsWithRefreshVariant_andHandler___block_invoke;
  v97[3] = &unk_1002B59E8;
  v100 = v104;
  v101 = v106;
  v18 = v7;
  v98 = v18;
  v102 = a3;
  v60 = v16;
  v99 = v60;
  -[MOEventStore purgeExpiredEventsWithCompletionHandler:](eventStore, "purgeExpiredEventsWithCompletionHandler:", v97);
  v19 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v20 = objc_claimAutoreleasedReturnValue(v19);
  v21 = v20;
  if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v21, OS_SIGNPOST_INTERVAL_BEGIN, a3, "EventManagerCleanUpEventsUnknownEvents", ", buf, 2u);
  }

  v22 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("CleanupUnknownEvents"), 0);
  -[MOPerformanceMeasurement startSession](v22, "startSession");
  dispatch_group_enter(v18);
  v23 = self->_eventStore;
  v91[0] = _NSConcreteStackBlock;
  v91[1] = 3221225472;
  v91[2] = __62__MOEventManager__cleanUpEventsWithRefreshVariant_andHandler___block_invoke_325;
  v91[3] = &unk_1002B59E8;
  v94 = v104;
  v95 = v106;
  v24 = v18;
  v92 = v24;
  v96 = a3;
  v59 = v22;
  v93 = v59;
  -[MOEventStore purgeUnknownEventsWithCompletionHandler:](v23, "purgeUnknownEventsWithCompletionHandler:", v91);
  v25 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v26 = objc_claimAutoreleasedReturnValue(v25);
  v27 = v26;
  if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v27, OS_SIGNPOST_INTERVAL_BEGIN, a3, "EventManagerCleanUpEventsDeletedPatternEvents", ", buf, 2u);
  }

  v28 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("CleanupPatternDeletedEvents"), 0);
  -[MOPerformanceMeasurement startSession](v28, "startSession");
  dispatch_group_enter(v24);
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventManager configurationManager](self, "configurationManager"));
  v30 = objc_msgSend(v29, "getIntegerSettingForKey:withFallback:", CFSTR("EventManagerOverridePatternRehydrationFailureCountThreshold"), 10);

  v31 = self->_eventStore;
  v85[0] = _NSConcreteStackBlock;
  v85[1] = 3221225472;
  v85[2] = __62__MOEventManager__cleanUpEventsWithRefreshVariant_andHandler___block_invoke_330;
  v85[3] = &unk_1002B59E8;
  v88 = v104;
  v89 = v106;
  v32 = v24;
  v86 = v32;
  v90 = a3;
  v33 = v28;
  v87 = v33;
  -[MOEventStore purgeRehydrationFailedEventsForType:rehydrationFailCount:CompletionHandler:](v31, "purgeRehydrationFailedEventsForType:rehydrationFailCount:CompletionHandler:", CFSTR("Pattern_event"), v30, v85);
  v34 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v35 = objc_claimAutoreleasedReturnValue(v34);
  v36 = v35;
  if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v36, OS_SIGNPOST_INTERVAL_BEGIN, a3, "EventManagerCleanUpEventsDeletedEvents", ", buf, 2u);
  }

  v37 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("CleanupDeletedEvents"), 0);
  -[MOPerformanceMeasurement startSession](v37, "startSession");
  dispatch_group_enter(v32);
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventManager configurationManager](self, "configurationManager"));
  v39 = objc_msgSend(v38, "getIntegerSettingForKey:withFallback:", CFSTR("EventManagerOverrideEventsRehydrationFailureCountThreshold"), 10);

  v40 = self->_eventStore;
  v79[0] = _NSConcreteStackBlock;
  v79[1] = 3221225472;
  v79[2] = __62__MOEventManager__cleanUpEventsWithRefreshVariant_andHandler___block_invoke_335;
  v79[3] = &unk_1002B59E8;
  v82 = v104;
  v83 = v106;
  v41 = v32;
  v80 = v41;
  v84 = a3;
  v42 = v37;
  v81 = v42;
  -[MOEventStore purgeRehydrationFailedEventsForType:rehydrationFailCount:CompletionHandler:](v40, "purgeRehydrationFailedEventsForType:rehydrationFailCount:CompletionHandler:", CFSTR("Sensed_event"), v39, v79);
  v43 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v44 = objc_claimAutoreleasedReturnValue(v43);
  v45 = v44;
  if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v44))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v45, OS_SIGNPOST_INTERVAL_BEGIN, a3, "EventManagerCleanUpEventsRemoveVisitsClearedInRoutine", ", buf, 2u);
  }

  v46 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("CleanupVisitEventsClearedInRoutine"), 0);
  -[MOPerformanceMeasurement startSession](v46, "startSession");
  dispatch_group_enter(v41);
  v47 = dispatch_semaphore_create(0);
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventManager routineServiceManager](self, "routineServiceManager"));
  v71[0] = _NSConcreteStackBlock;
  v71[1] = 3221225472;
  v71[2] = __62__MOEventManager__cleanUpEventsWithRefreshVariant_andHandler___block_invoke_338;
  v71[3] = &unk_1002B5A38;
  v49 = v47;
  v72 = v49;
  v50 = v41;
  v73 = v50;
  v78 = a3;
  v51 = v46;
  v74 = v51;
  v75 = self;
  v76 = v104;
  v77 = v106;
  objc_msgSend(v48, "fetchEarliestVisitDateInRoutineWithHandler:", v71);

  v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ - [%s] - %d - %s"), CFSTR("MOSemaphoreWait"), "/Library/Caches/com.apple.xbs/Sources/Moments/momentsd/PromptEngine/PromptProvider/MOEventManager.m", 2181, "-[MOEventManager _cleanUpEventsWithRefreshVariant:andHandler:]"));
  v70 = 0;
  LOBYTE(v47) = MOSemaphoreWaitAndFaultIfTimeout_Internal(v49, &v70, v52, 120.0);
  v53 = v70;
  if ((v47 & 1) == 0)
  {
    v54 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    v55 = objc_claimAutoreleasedReturnValue(v54);
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_cold_3();

  }
  v56 = objc_claimAutoreleasedReturnValue(-[MOEventManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __62__MOEventManager__cleanUpEventsWithRefreshVariant_andHandler___block_invoke_341;
  block[3] = &unk_1002B5A60;
  v66 = v108;
  v67 = v106;
  v68 = v104;
  v69 = a3;
  v64 = v61;
  v65 = v62;
  v57 = v61;
  v58 = v62;
  dispatch_group_notify(v50, v56, block);

  _Block_object_dispose(v104, 8);
  _Block_object_dispose(v106, 8);
  _Block_object_dispose(v108, 8);

}

void __62__MOEventManager__cleanUpEventsWithRefreshVariant_andHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id os_log;
  NSObject *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  os_signpost_id_t v19;
  uint8_t v20[16];
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    v9 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __62__MOEventManager__cleanUpEventsWithRefreshVariant_andHandler___block_invoke_cold_1();

    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v11 = v5;
    v12 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v11;
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("resultNumberOfEvents")));
    v12 = v13;
    if (v13)
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) += objc_msgSend(v13, "intValue");
    v14 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "purge expired events succeeded", buf, 2u);
    }

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  v16 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  v18 = v17;
  v19 = *(_QWORD *)(a1 + 64);
  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)v20 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_INTERVAL_END, v19, "EventManagerCleanUpEventsExpiredEvents", ", v20, 2u);
  }

  objc_msgSend(*(id *)(a1 + 40), "endSession");
}

void __62__MOEventManager__cleanUpEventsWithRefreshVariant_andHandler___block_invoke_325(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id os_log;
  NSObject *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  os_signpost_id_t v19;
  uint8_t v20[16];
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    v9 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __62__MOEventManager__cleanUpEventsWithRefreshVariant_andHandler___block_invoke_325_cold_1();

    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v11 = v5;
    v12 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v11;
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("resultNumberOfEvents")));
    v12 = v13;
    if (v13)
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) += objc_msgSend(v13, "intValue");
    v14 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "purge unknown events succeeded", buf, 2u);
    }

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  v16 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  v18 = v17;
  v19 = *(_QWORD *)(a1 + 64);
  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)v20 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_INTERVAL_END, v19, "EventManagerCleanUpEventsUnknownEvents", ", v20, 2u);
  }

  objc_msgSend(*(id *)(a1 + 40), "endSession");
}

void __62__MOEventManager__cleanUpEventsWithRefreshVariant_andHandler___block_invoke_330(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id os_log;
  NSObject *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  os_signpost_id_t v19;
  uint8_t v20[16];
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    v9 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __62__MOEventManager__cleanUpEventsWithRefreshVariant_andHandler___block_invoke_330_cold_1();

    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v11 = v5;
    v12 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v11;
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("resultNumberOfEvents")));
    v12 = v13;
    if (v13)
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) += objc_msgSend(v13, "intValue");
    v14 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "purge pattern events which failed rehydration times succeeded", buf, 2u);
    }

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  v16 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  v18 = v17;
  v19 = *(_QWORD *)(a1 + 64);
  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)v20 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_INTERVAL_END, v19, "EventManagerCleanUpEventsDeletedPatternEvents", ", v20, 2u);
  }

  objc_msgSend(*(id *)(a1 + 40), "endSession");
}

void __62__MOEventManager__cleanUpEventsWithRefreshVariant_andHandler___block_invoke_335(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id os_log;
  NSObject *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  os_signpost_id_t v19;
  uint8_t v20[16];
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    v9 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __62__MOEventManager__cleanUpEventsWithRefreshVariant_andHandler___block_invoke_335_cold_1();

    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v11 = v5;
    v12 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v11;
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("resultNumberOfEvents")));
    v12 = v13;
    if (v13)
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) += objc_msgSend(v13, "intValue");
    v14 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "purge sensed events which failed rehydration multiple times succeeded", buf, 2u);
    }

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  v16 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  v18 = v17;
  v19 = *(_QWORD *)(a1 + 64);
  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)v20 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_INTERVAL_END, v19, "EventManagerCleanUpEventsDeletedEvents", ", v20, 2u);
  }

  objc_msgSend(*(id *)(a1 + 40), "endSession");
}

void __62__MOEventManager__cleanUpEventsWithRefreshVariant_andHandler___block_invoke_338(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id os_log;
  NSObject *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;
  __int128 v21;
  uint64_t v22;
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    v8 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __62__MOEventManager__cleanUpEventsWithRefreshVariant_andHandler___block_invoke_338_cold_1();

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
    v9 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    v11 = v10;
    v12 = *(_QWORD *)(a1 + 80);
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_END, v12, "EventManagerCleanUpEventsRemoveVisitsClearedInRoutine", ", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 48), "endSession");
  }
  else
  {
    v13 = *(void **)(*(_QWORD *)(a1 + 56) + 32);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = __62__MOEventManager__cleanUpEventsWithRefreshVariant_andHandler___block_invoke_339;
    v16[3] = &unk_1002B5A10;
    v17 = v5;
    v21 = *(_OWORD *)(a1 + 64);
    v18 = *(id *)(a1 + 32);
    v14 = *(id *)(a1 + 40);
    v15 = *(_QWORD *)(a1 + 80);
    v19 = v14;
    v22 = v15;
    v20 = *(id *)(a1 + 48);
    objc_msgSend(v13, "purgeVisitEventsBeforeDate:WithCompletionHandler:", v17, v16);

  }
}

void __62__MOEventManager__cleanUpEventsWithRefreshVariant_andHandler___block_invoke_339(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id os_log;
  NSObject *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  os_signpost_id_t v20;
  int v21;
  uint64_t v22;
  __int16 v23;
  void *v24;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    v9 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __62__MOEventManager__cleanUpEventsWithRefreshVariant_andHandler___block_invoke_339_cold_1();

    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v11 = v5;
    v12 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v11;
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("resultNumberOfEvents")));
    v12 = v13;
    if (v13)
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) += objc_msgSend(v13, "intValue");
    v14 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = *(_QWORD *)(a1 + 32);
      v21 = 138412546;
      v22 = v16;
      v23 = 2112;
      v24 = v12;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "purge visit events before date, %@,  succeeded with event count, %@", (uint8_t *)&v21, 0x16u);
    }

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  v17 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  v19 = v18;
  v20 = *(_QWORD *)(a1 + 80);
  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    LOWORD(v21) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_INTERVAL_END, v20, "EventManagerCleanUpEventsRemoveVisitsClearedInRoutine", ", (uint8_t *)&v21, 2u);
  }

  objc_msgSend(*(id *)(a1 + 56), "endSession");
}

id __62__MOEventManager__cleanUpEventsWithRefreshVariant_andHandler___block_invoke_341(uint64_t a1)
{
  void *v2;
  void *v3;
  id os_log;
  NSObject *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  uint8_t v12[16];
  uint8_t buf[16];

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24)));
  objc_msgSend(v2, "setObject:forKey:", v3, CFSTR("resultNumberOfEvents"));

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
  v5 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Purge event methods all completed", buf, 2u);
  }

  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v6 + 16))(v6, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  v7 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 72);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)v12 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, v10, "EventManagerCleanUpEventsWrapper", ", v12, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "endSession");
}

- (void)_updateEventsDeletedAtSources:(id)a3
{
  id v4;
  id os_log;
  NSObject *v6;
  MOPerformanceMeasurement *v7;
  MOEventStore *eventStore;
  id v9;
  MOPerformanceMeasurement *v10;
  _QWORD v11[5];
  MOPerformanceMeasurement *v12;
  id v13;
  _QWORD *v14;
  _QWORD *v15;
  uint8_t buf[16];
  _QWORD v17[3];
  int v18;
  _QWORD v19[5];
  id v20;

  v4 = a3;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__37;
  v19[4] = __Block_byref_object_dispose__37;
  v20 = objc_alloc_init((Class)NSMutableDictionary);
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v18 = 0;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v6 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerPurgeEvents", ", buf, 2u);
  }

  v7 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("PurgeEvents"), 0);
  -[MOPerformanceMeasurement startSession](v7, "startSession");
  eventStore = self->_eventStore;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __48__MOEventManager__updateEventsDeletedAtSources___block_invoke;
  v11[3] = &unk_1002B5AD8;
  v11[4] = self;
  v9 = v4;
  v13 = v9;
  v10 = v7;
  v12 = v10;
  v14 = v19;
  v15 = v17;
  -[MOEventStore fetchAllEventsWithCompletionHandler:](eventStore, "fetchAllEventsWithCompletionHandler:", v11);

  _Block_object_dispose(v17, 8);
  _Block_object_dispose(v19, 8);

}

void __48__MOEventManager__updateEventsDeletedAtSources___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  __int128 v16;

  v5 = a2;
  v6 = a3;
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __48__MOEventManager__updateEventsDeletedAtSources___block_invoke_2;
  block[3] = &unk_1002B5AB0;
  v11 = v6;
  v15 = *(id *)(a1 + 48);
  v12 = *(id *)(a1 + 40);
  v13 = v5;
  v14 = *(_QWORD *)(a1 + 32);
  v16 = *(_OWORD *)(a1 + 56);
  v8 = v5;
  v9 = v6;
  dispatch_async(v7, block);

}

void __48__MOEventManager__updateEventsDeletedAtSources___block_invoke_2(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  id os_log;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  __int128 v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  id v22;
  void *v23;
  id v24;
  NSObject *v25;
  __int128 v26;
  _QWORD block[4];
  id v28;
  id v29;
  __int128 v30;
  _QWORD v31[5];
  id v32;
  NSObject *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  id v40;
  __int16 v41;
  id v42;
  _BYTE v43[128];

  v2 = (_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 32);
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
  v5 = objc_claimAutoreleasedReturnValue(os_log);
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __48__MOEventManager__updateEventsDeletedAtSources___block_invoke_2_cold_1();

    v7 = *(_QWORD *)(a1 + 64);
    if (v7)
      (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, *v2, &__NSDictionary0__struct);
    v8 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerPurgeEvents", ", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 40), "endSession");
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v10 = objc_msgSend(*(id *)(a1 + 48), "count");
      *(_DWORD *)buf = 134217984;
      v40 = v10;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "fetched all events count to update events deleted at sources, %lu", buf, 0xCu);
    }

    v11 = dispatch_group_create();
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 56), "splitEventArrayByCategory:", *(_QWORD *)(a1 + 48)));
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    if (v13)
    {
      v15 = v13;
      v16 = *(_QWORD *)v36;
      *(_QWORD *)&v14 = 138412546;
      v26 = v14;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(_QWORD *)v36 != v16)
            objc_enumerationMutation(v12);
          v18 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i);
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", v18, v26));
          if (objc_msgSend(v19, "count"))
          {
            dispatch_group_enter(v11);
            v20 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
            v21 = objc_claimAutoreleasedReturnValue(v20);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
            {
              v22 = objc_msgSend(v19, "count");
              *(_DWORD *)buf = v26;
              v40 = v18;
              v41 = 2048;
              v42 = v22;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "_updateEventsDeletedAtSources, START, keyword, %@, count, %lu", buf, 0x16u);
            }

            v23 = *(void **)(a1 + 56);
            v31[0] = _NSConcreteStackBlock;
            v31[1] = 3221225472;
            v31[2] = __48__MOEventManager__updateEventsDeletedAtSources___block_invoke_344;
            v31[3] = &unk_1002B5858;
            v34 = *(_OWORD *)(a1 + 72);
            v31[4] = v18;
            v24 = v19;
            v32 = v24;
            v33 = v11;
            objc_msgSend(v23, "_updateEventsDeletedAtSingleSource:handler:", v24, v31);

          }
        }
        v15 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
      }
      while (v15);
    }
    v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 56), "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __48__MOEventManager__updateEventsDeletedAtSources___block_invoke_345;
    block[3] = &unk_1002B5A88;
    v29 = *(id *)(a1 + 64);
    v30 = *(_OWORD *)(a1 + 72);
    v28 = *(id *)(a1 + 40);
    dispatch_group_notify(v11, v25, block);

  }
}

void __48__MOEventManager__updateEventsDeletedAtSources___block_invoke_344(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id os_log;
  NSObject *v9;
  uint64_t v10;
  id v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  id v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("spiPurgeFailure")));
  if (v5)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setObject:forKey:", &__kCFBooleanFalse, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("resultNumberOfEvents")));
  v7 = v6;
  if (v6)
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) += objc_msgSend(v6, "intValue");
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
  v9 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = *(_QWORD *)(a1 + 32);
    v11 = objc_msgSend(*(id *)(a1 + 40), "count");
    v12 = 138412546;
    v13 = v10;
    v14 = 2048;
    v15 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "_updateEventsDeletedAtSources, DONE, keyword, %@, count, %lu", (uint8_t *)&v12, 0x16u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

id __48__MOEventManager__updateEventsDeletedAtSources___block_invoke_345(uint64_t a1)
{
  void *v2;
  void *v3;
  id os_log;
  NSObject *v5;
  uint8_t v7[16];

  if (*(_QWORD *)(a1 + 40))
  {
    v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24)));
    objc_msgSend(v2, "setObject:forKey:", v3, CFSTR("resultNumberOfEvents"));

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v5 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerPurgeEvents", ", v7, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "endSession");
}

- (void)_updateEventsDeletedAtSingleSource:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  MOPerformanceMeasurement *v18;
  void *v19;
  MOPerformanceMeasurement *v20;
  void *v21;
  id os_log;
  id v23;
  id v24;
  NSObject *v25;
  MOPerformanceMeasurement *v26;
  void *v27;
  id v28;
  NSObject *v29;
  MOPerformanceMeasurement *v30;
  void *v31;
  id v32;
  NSObject *v33;
  MOPerformanceMeasurement *v34;
  void *v35;
  id v36;
  NSObject *v37;
  MOPerformanceMeasurement *v38;
  void *v39;
  id v40;
  NSObject *v41;
  MOPerformanceMeasurement *v42;
  void *v43;
  id v44;
  NSObject *v45;
  MOPerformanceMeasurement *v46;
  void *v47;
  _QWORD v48[4];
  MOPerformanceMeasurement *v49;
  id v50;
  _QWORD v51[4];
  MOPerformanceMeasurement *v52;
  id v53;
  _QWORD v54[4];
  MOPerformanceMeasurement *v55;
  id v56;
  _QWORD v57[4];
  MOPerformanceMeasurement *v58;
  id v59;
  _QWORD v60[4];
  MOPerformanceMeasurement *v61;
  id v62;
  _QWORD v63[4];
  MOPerformanceMeasurement *v64;
  id v65;
  _QWORD v66[4];
  MOPerformanceMeasurement *v67;
  id v68;
  uint8_t buf[4];
  void *v70;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
    v9 = objc_msgSend(v8, "provider");

    if (v9 != (id)5)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
      v11 = objc_msgSend(v10, "category");

      switch((unint64_t)v11)
      {
        case 0uLL:
          os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
          v13 = objc_claimAutoreleasedReturnValue(os_log);
          if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            goto LABEL_6;
          goto LABEL_14;
        case 1uLL:
        case 5uLL:
        case 8uLL:
        case 0xBuLL:
        case 0xCuLL:
        case 0xFuLL:
        case 0x10uLL:
        case 0x12uLL:
        case 0x13uLL:
        case 0x14uLL:
        case 0x16uLL:
          v12 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
          v13 = objc_claimAutoreleasedReturnValue(v12);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "describeCategory"));
            *(_DWORD *)buf = 138412290;
            v70 = v15;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "No need to rehydrate and update event for category, %@.", buf, 0xCu);

          }
          goto LABEL_6;
        case 2uLL:
        case 0xDuLL:
          v16 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
          v17 = objc_claimAutoreleasedReturnValue(v16);
          if (os_signpost_enabled(v17))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerPurgeEventsHealthKit", ", buf, 2u);
          }

          v18 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("PurgeHealthKit"), 0);
          -[MOPerformanceMeasurement startSession](v18, "startSession");
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventManager healthKitManager](self, "healthKitManager"));
          v66[0] = _NSConcreteStackBlock;
          v66[1] = 3221225472;
          v66[2] = __61__MOEventManager__updateEventsDeletedAtSingleSource_handler___block_invoke;
          v66[3] = &unk_1002B25B0;
          v67 = v18;
          v68 = v7;
          v20 = v18;
          objc_msgSend(v19, "updateWorkoutsDeletedAtSource:handler:", v6, v66);

          v21 = v68;
          goto LABEL_35;
        case 4uLL:
          v24 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
          v25 = objc_claimAutoreleasedReturnValue(v24);
          if (os_signpost_enabled(v25))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v25, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerPurgeEventsLeisureMedia", ", buf, 2u);
          }

          v26 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("PurgeLeisureMedia"), 0);
          -[MOPerformanceMeasurement startSession](v26, "startSession");
          v27 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventManager nowPlayingMediaManager](self, "nowPlayingMediaManager"));
          v60[0] = _NSConcreteStackBlock;
          v60[1] = 3221225472;
          v60[2] = __61__MOEventManager__updateEventsDeletedAtSingleSource_handler___block_invoke_353;
          v60[3] = &unk_1002B25B0;
          v61 = v26;
          v62 = v7;
          v20 = v26;
          objc_msgSend(v27, "updateMediaPlayEventsDeletedAtSource:handler:", v6, v60);

          v21 = v62;
          goto LABEL_35;
        case 6uLL:
          v28 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
          v29 = objc_claimAutoreleasedReturnValue(v28);
          if (os_signpost_enabled(v29))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v29, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerPurgeEventsMediaPlaySessions", ", buf, 2u);
          }

          v30 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("PurgeMediaPlaySessions"), 0);
          -[MOPerformanceMeasurement startSession](v30, "startSession");
          v31 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventManager nowPlayingMediaManager](self, "nowPlayingMediaManager"));
          v63[0] = _NSConcreteStackBlock;
          v63[1] = 3221225472;
          v63[2] = __61__MOEventManager__updateEventsDeletedAtSingleSource_handler___block_invoke_350;
          v63[3] = &unk_1002B25B0;
          v64 = v30;
          v65 = v7;
          v20 = v30;
          objc_msgSend(v31, "updateMediaPlayEventsDeletedAtSource:handler:", v6, v63);

          v21 = v65;
          goto LABEL_35;
        case 9uLL:
          v32 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
          v33 = objc_claimAutoreleasedReturnValue(v32);
          if (os_signpost_enabled(v33))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v33, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerPurgeEventsSharedWithYouItems", ", buf, 2u);
          }

          v34 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("PurgeSharedWithYou"), 0);
          -[MOPerformanceMeasurement startSession](v34, "startSession");
          v35 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventManager sharedWithYouManager](self, "sharedWithYouManager"));
          v54[0] = _NSConcreteStackBlock;
          v54[1] = 3221225472;
          v54[2] = __61__MOEventManager__updateEventsDeletedAtSingleSource_handler___block_invoke_359;
          v54[3] = &unk_1002B25B0;
          v55 = v34;
          v56 = v7;
          v20 = v34;
          objc_msgSend(v35, "updateSharedContentsDeletedAtSource:handler:", v6, v54);

          v21 = v56;
          goto LABEL_35;
        case 0xAuLL:
          v36 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
          v37 = objc_claimAutoreleasedReturnValue(v36);
          if (os_signpost_enabled(v37))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v37, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerPurgeEventsSignificantContact", ", buf, 2u);
          }

          v38 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("PurgeSignificantContact"), 0);
          -[MOPerformanceMeasurement startSession](v38, "startSession");
          v39 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventManager significantContactManager](self, "significantContactManager"));
          v51[0] = _NSConcreteStackBlock;
          v51[1] = 3221225472;
          v51[2] = __61__MOEventManager__updateEventsDeletedAtSingleSource_handler___block_invoke_362;
          v51[3] = &unk_1002B25B0;
          v52 = v38;
          v53 = v7;
          v20 = v38;
          objc_msgSend(v39, "updateConversationsDeletedAtSource:handler:", v6, v51);

          v21 = v53;
          goto LABEL_35;
        case 0xEuLL:
          v40 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
          v41 = objc_claimAutoreleasedReturnValue(v40);
          if (os_signpost_enabled(v41))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v41, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerPurgeEventsSharedPhoto", ", buf, 2u);
          }

          v42 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("PurgeSharedPhoto"), 0);
          -[MOPerformanceMeasurement startSession](v42, "startSession");
          v43 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventManager photoManager](self, "photoManager"));
          v57[0] = _NSConcreteStackBlock;
          v57[1] = 3221225472;
          v57[2] = __61__MOEventManager__updateEventsDeletedAtSingleSource_handler___block_invoke_356;
          v57[3] = &unk_1002B25B0;
          v58 = v42;
          v59 = v7;
          v20 = v42;
          objc_msgSend(v43, "updateSharedPhotoEventsDeletedAtSource:handler:", v6, v57);

          v21 = v59;
          goto LABEL_35;
        case 0x11uLL:
          v44 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
          v45 = objc_claimAutoreleasedReturnValue(v44);
          if (os_signpost_enabled(v45))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v45, OS_SIGNPOST_INTERVAL_BEGIN, 1uLL, "EventManagerPurgeEventsPhotoMemory", ", buf, 2u);
          }

          v46 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("PurgePhotoMemory"), 0);
          -[MOPerformanceMeasurement startSession](v46, "startSession");
          v47 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventManager photoManager](self, "photoManager"));
          v48[0] = _NSConcreteStackBlock;
          v48[1] = 3221225472;
          v48[2] = __61__MOEventManager__updateEventsDeletedAtSingleSource_handler___block_invoke_365;
          v48[3] = &unk_1002B25B0;
          v49 = v46;
          v50 = v7;
          v20 = v46;
          objc_msgSend(v47, "updatePhotoMemoriesEventsDeletedAtSource:handler:", v6, v48);

          v21 = v50;
LABEL_35:

          goto LABEL_9;
        default:
          v23 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
          v13 = objc_claimAutoreleasedReturnValue(v23);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
LABEL_14:
            -[MOEventManager _updateEventsDeletedAtSingleSource:handler:].cold.1();
LABEL_6:

          break;
      }
    }
  }
  if (v7)
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, &__NSDictionary0__struct);
LABEL_9:

}

void __61__MOEventManager__updateEventsDeletedAtSingleSource_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id os_log;
  NSObject *v12;
  uint8_t v13[16];

  v5 = a2;
  v6 = a3;
  v7 = objc_alloc_init((Class)NSMutableDictionary);
  v8 = v7;
  if (v5)
  {
    objc_msgSend(v7, "setObject:forKey:", CFSTR("resultWorkoutsSuccess"), CFSTR("spiPurgeFailure"));
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("resultNumberOfEvents")));
    if (v9)
      objc_msgSend(v8, "setObject:forKey:", v9, CFSTR("resultNumberOfEvents"));

  }
  v10 = *(_QWORD *)(a1 + 40);
  if (v10)
    (*(void (**)(uint64_t, id, void *))(v10 + 16))(v10, v5, v8);
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v12 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_signpost_enabled(v12))
  {
    *(_WORD *)v13 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerPurgeEventsHealthKit", ", v13, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "endSession");
}

void __61__MOEventManager__updateEventsDeletedAtSingleSource_handler___block_invoke_350(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id os_log;
  NSObject *v12;
  uint8_t v13[16];

  v5 = a2;
  v6 = a3;
  v7 = objc_alloc_init((Class)NSMutableDictionary);
  v8 = v7;
  if (v5)
  {
    objc_msgSend(v7, "setObject:forKey:", CFSTR("resultMusicSuccess"), CFSTR("spiPurgeFailure"));
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("resultNumberOfEvents")));
    if (v9)
      objc_msgSend(v8, "setObject:forKey:", v9, CFSTR("resultNumberOfEvents"));

  }
  v10 = *(_QWORD *)(a1 + 40);
  if (v10)
    (*(void (**)(uint64_t, id, void *))(v10 + 16))(v10, v5, v8);
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v12 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_signpost_enabled(v12))
  {
    *(_WORD *)v13 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerPurgeEventsMediaPlaySessions", ", v13, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "endSession");
}

void __61__MOEventManager__updateEventsDeletedAtSingleSource_handler___block_invoke_353(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id os_log;
  NSObject *v12;
  uint8_t v13[16];

  v5 = a2;
  v6 = a3;
  v7 = objc_alloc_init((Class)NSMutableDictionary);
  v8 = v7;
  if (v5)
  {
    objc_msgSend(v7, "setObject:forKey:", CFSTR("resultMusicSuccess"), CFSTR("spiPurgeFailure"));
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("resultNumberOfEvents")));
    if (v9)
      objc_msgSend(v8, "setObject:forKey:", v9, CFSTR("resultNumberOfEvents"));

  }
  v10 = *(_QWORD *)(a1 + 40);
  if (v10)
    (*(void (**)(uint64_t, id, void *))(v10 + 16))(v10, v5, v8);
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v12 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_signpost_enabled(v12))
  {
    *(_WORD *)v13 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerPurgeEventsLeisureMedia", ", v13, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "endSession");
}

void __61__MOEventManager__updateEventsDeletedAtSingleSource_handler___block_invoke_356(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id os_log;
  NSObject *v12;
  uint8_t v13[16];

  v5 = a2;
  v6 = a3;
  v7 = objc_alloc_init((Class)NSMutableDictionary);
  v8 = v7;
  if (v5)
  {
    objc_msgSend(v7, "setObject:forKey:", CFSTR("resultSharedPhotosSuccess"), CFSTR("spiPurgeFailure"));
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("resultNumberOfEvents")));
    if (v9)
      objc_msgSend(v8, "setObject:forKey:", v9, CFSTR("resultNumberOfEvents"));

  }
  v10 = *(_QWORD *)(a1 + 40);
  if (v10)
    (*(void (**)(uint64_t, id, void *))(v10 + 16))(v10, v5, v8);
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v12 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_signpost_enabled(v12))
  {
    *(_WORD *)v13 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerPurgeEventsSharedPhoto", ", v13, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "endSession");
}

void __61__MOEventManager__updateEventsDeletedAtSingleSource_handler___block_invoke_359(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id os_log;
  NSObject *v12;
  uint8_t v13[16];

  v5 = a2;
  v6 = a3;
  v7 = objc_alloc_init((Class)NSMutableDictionary);
  v8 = v7;
  if (v5)
  {
    objc_msgSend(v7, "setObject:forKey:", CFSTR("resultSharedSuccess"), CFSTR("spiPurgeFailure"));
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("resultNumberOfEvents")));
    if (v9)
      objc_msgSend(v8, "setObject:forKey:", v9, CFSTR("resultNumberOfEvents"));

  }
  v10 = *(_QWORD *)(a1 + 40);
  if (v10)
    (*(void (**)(uint64_t, id, void *))(v10 + 16))(v10, v5, v8);
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v12 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_signpost_enabled(v12))
  {
    *(_WORD *)v13 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerPurgeEventsSharedWithYouItems", ", v13, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "endSession");
}

void __61__MOEventManager__updateEventsDeletedAtSingleSource_handler___block_invoke_362(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id os_log;
  NSObject *v12;
  uint8_t v13[16];

  v5 = a2;
  v6 = a3;
  v7 = objc_alloc_init((Class)NSMutableDictionary);
  v8 = v7;
  if (v5)
  {
    objc_msgSend(v7, "setObject:forKey:", CFSTR("resultContactsSuccess"), CFSTR("spiPurgeFailure"));
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("resultNumberOfEvents")));
    if (v9)
      objc_msgSend(v8, "setObject:forKey:", v9, CFSTR("resultNumberOfEvents"));

  }
  v10 = *(_QWORD *)(a1 + 40);
  if (v10)
    (*(void (**)(uint64_t, id, void *))(v10 + 16))(v10, v5, v8);
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v12 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_signpost_enabled(v12))
  {
    *(_WORD *)v13 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerPurgeEventsSignificantContact", ", v13, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "endSession");
}

void __61__MOEventManager__updateEventsDeletedAtSingleSource_handler___block_invoke_365(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id os_log;
  NSObject *v12;
  uint8_t v13[16];

  v5 = a2;
  v6 = a3;
  v7 = objc_alloc_init((Class)NSMutableDictionary);
  v8 = v7;
  if (v5)
  {
    objc_msgSend(v7, "setObject:forKey:", CFSTR("resultPhotoMemorySuccess"), CFSTR("spiPurgeFailure"));
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("resultNumberOfEvents")));
    if (v9)
      objc_msgSend(v8, "setObject:forKey:", v9, CFSTR("resultNumberOfEvents"));

  }
  v10 = *(_QWORD *)(a1 + 40);
  if (v10)
    (*(void (**)(uint64_t, id, void *))(v10 + 16))(v10, v5, v8);
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v12 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_signpost_enabled(v12))
  {
    *(_WORD *)v13 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_END, 1uLL, "EventManagerPurgeEventsPhotoMemory", ", v13, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "endSession");
}

- (id)splitEventArrayByCategory:(id)a3
{
  id v3;
  NSMutableDictionary *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSMutableArray *v14;
  id v15;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v3 = a3;
  v4 = objc_opt_new(NSMutableDictionary);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "describeCategory"));
        v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "describeProvider"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@:%@"), v10, v11));

        v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v4, "allKeys"));
        LOBYTE(v11) = objc_msgSend(v13, "containsObject:", v12);

        if ((v11 & 1) != 0)
        {
          v14 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v4, "objectForKey:", v12));
          -[NSMutableArray addObject:](v14, "addObject:", v9);
        }
        else
        {
          v14 = objc_opt_new(NSMutableArray);
          -[NSMutableArray addObject:](v14, "addObject:", v9);
          -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v14, v12);
        }

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }

  v15 = -[NSMutableDictionary copy](v4, "copy");
  return v15;
}

- (id)mergeEventArraysFromDict:(id)a3
{
  id v3;
  NSMutableArray *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = a3;
  v4 = objc_opt_new(NSMutableArray);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allValues", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v10, "count"))
          -[NSMutableArray addObjectsFromArray:](v4, "addObjectsFromArray:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (void)runAnalyticsWithRefreshVariant:(unint64_t)a3 andHandler:(id)a4
{
  id v7;
  id os_log;
  NSObject *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  MOPerformanceMeasurement *v13;
  MOEventRefreshHelper *v14;
  id v15;
  NSObject *v16;
  NSString *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  MOEventFetchOptions *v22;
  id v23;
  id v24;
  MOEventFetchOptions *v25;
  void *v26;
  _QWORD v27[4];
  MOPerformanceMeasurement *v28;
  MOEventManager *v29;
  id v30;
  uint8_t *v31;
  uint64_t *v32;
  unint64_t v33;
  _QWORD v34[6];
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint8_t buf[8];
  uint8_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint8_t v47[4];
  id v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  void *v54;
  NSErrorUserInfoKey v55;
  const __CFString *v56;

  v7 = a4;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
  v9 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "run pattern detection", buf, 2u);
  }

  v10 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = v11;
  if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_BEGIN, a3, "EventManagerAnalytics", ", buf, 2u);
  }

  v13 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("Analytics"), 0);
  -[MOPerformanceMeasurement startSession](v13, "startSession");
  *(_QWORD *)buf = 0;
  v42 = buf;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__37;
  v45 = __Block_byref_object_dispose__37;
  v46 = 0;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__37;
  v39 = __Block_byref_object_dispose__37;
  v40 = 0;
  v14 = -[MOEventRefreshHelper initWithUniverse:]([MOEventRefreshHelper alloc], "initWithUniverse:", self->fUniverse);
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = __60__MOEventManager_runAnalyticsWithRefreshVariant_andHandler___block_invoke;
  v34[3] = &unk_1002B1E88;
  v34[4] = buf;
  v34[5] = &v35;
  -[MOEventRefreshHelper getPatternDetectorDatesForVariant:withHandler:](v14, "getPatternDetectorDatesForVariant:withHandler:", a3, v34);
  if (*((_QWORD *)v42 + 5) && v36[5])
  {
    v15 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = NSStringFromSelector(a2);
      v18 = (id)objc_claimAutoreleasedReturnValue(v17);
      v19 = *((_QWORD *)v42 + 5);
      v20 = v36[5];
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
      *(_DWORD *)v47 = 138413058;
      v48 = v18;
      v49 = 2112;
      v50 = v19;
      v51 = 2112;
      v52 = v20;
      v53 = 2112;
      v54 = v21;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%@, refresh startDate, %@, endDate, %@, refreshVariant, %@", v47, 0x2Au);

    }
    v22 = [MOEventFetchOptions alloc];
    v23 = objc_alloc((Class)NSDateInterval);
    v24 = objc_msgSend(v23, "initWithStartDate:endDate:", *((_QWORD *)v42 + 5), v36[5]);
    v25 = -[MOEventFetchOptions initWithDateInterval:ascending:category:limit:](v22, "initWithDateInterval:ascending:category:limit:", v24, 1, 0, 0);

    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = __60__MOEventManager_runAnalyticsWithRefreshVariant_andHandler___block_invoke_372;
    v27[3] = &unk_1002B5B28;
    v30 = v7;
    v33 = a3;
    v31 = buf;
    v32 = &v35;
    v28 = v13;
    v29 = self;
    -[MOEventManager fetchEventsWithOptions:CompletionHandler:](self, "fetchEventsWithOptions:CompletionHandler:", v25, v27);

  }
  else
  {
    v55 = NSLocalizedDescriptionKey;
    v56 = CFSTR("analytics start or end date cannot be nil");
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1));
    v25 = (MOEventFetchOptions *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("MOErrorDomain"), 7, v26));

    if (v7)
      (*((void (**)(id, MOEventFetchOptions *, void *))v7 + 2))(v7, v25, &__NSDictionary0__struct);
  }

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(buf, 8);

}

void __60__MOEventManager_runAnalyticsWithRefreshVariant_andHandler___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v8;
  id v9;

  v9 = a3;
  v8 = a4;
  if (a2)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a4);
  }

}

void __60__MOEventManager_runAnalyticsWithRefreshVariant_andHandler___block_invoke_372(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id os_log;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  void *v14;
  id v15;
  NSObject *v16;
  id v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  os_signpost_id_t v21;
  NSMutableArray *v22;
  void *i;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  unsigned int v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  unsigned int v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  int v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  unsigned int v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  _BOOL4 v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  unsigned int v65;
  void *v66;
  void *v67;
  int v68;
  void *v69;
  void *v70;
  void *v71;
  unsigned int v72;
  void *v73;
  void *v74;
  _BOOL4 v75;
  id v76;
  NSObject *v77;
  id v78;
  void *v79;
  void *v80;
  double v81;
  double v82;
  void *v83;
  void *v84;
  double v85;
  double v86;
  void *v87;
  void *v88;
  double v89;
  double v90;
  int v91;
  int v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  id v97;
  id v98;
  NSObject *v99;
  NSObject *v100;
  os_signpost_id_t v101;
  id v102;
  NSObject *v103;
  NSObject *v104;
  os_signpost_id_t v105;
  MOPerformanceMeasurement *v106;
  void *v107;
  id v108;
  uint64_t v109;
  NSMutableArray *v110;
  MOPerformanceMeasurement *v111;
  uint64_t v112;
  id v113;
  NSObject *v114;
  uint64_t v115;
  id v116;
  NSObject *v117;
  NSObject *v118;
  os_signpost_id_t v119;
  uint64_t v120;
  id v121;
  NSObject *v122;
  NSObject *v123;
  os_signpost_id_t v124;
  void *v125;
  MOPerformanceMeasurement *v126;
  id v127;
  id v128;
  void *v129;
  void *v130;
  id obj;
  NSMutableArray *v133;
  uint64_t v134;
  void *v135;
  id v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  int v152;
  void *v153;
  uint64_t v154;
  id v155;
  id v156;
  void *context;
  _QWORD v158[4];
  MOPerformanceMeasurement *v159;
  id v160;
  NSMutableArray *v161;
  id v162;
  uint64_t v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  _BYTE v172[128];
  uint8_t v173[128];
  uint8_t buf[4];
  id v175;

  v4 = a2;
  v5 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
  v7 = objc_claimAutoreleasedReturnValue(os_log);
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  v130 = v5;
  if (!v5)
  {
    if (v8)
    {
      *(_DWORD *)buf = 134217984;
      v175 = objc_msgSend(v4, "count");
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "fetched events count, %lu", buf, 0xCu);
    }

    if (!objc_msgSend(v4, "count"))
    {
      v112 = *(_QWORD *)(a1 + 48);
      if (v112)
        (*(void (**)(uint64_t, _QWORD, void *))(v112 + 16))(v112, 0, &__NSDictionary0__struct);
      v113 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
      v114 = objc_claimAutoreleasedReturnValue(v113);
      v12 = v114;
      v13 = *(_QWORD *)(a1 + 72);
      if (v13 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v114))
        goto LABEL_100;
      *(_WORD *)buf = 0;
      goto LABEL_9;
    }
    v127 = objc_msgSend(objc_alloc((Class)NSDateInterval), "initWithStartDate:endDate:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 168), "processEvents:withRefreshVariant:forDateInterval:", v4, *(_QWORD *)(a1 + 72)));
    v15 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = objc_msgSend(v14, "count");
      *(_DWORD *)buf = 134217984;
      v175 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "pattern events count, %lu", buf, 0xCu);
    }

    v129 = v14;
    if (objc_msgSend(v14, "count"))
    {
      v128 = v4;
      v18 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
      v19 = objc_claimAutoreleasedReturnValue(v18);
      v20 = v19;
      v21 = *(_QWORD *)(a1 + 72);
      if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v20, OS_SIGNPOST_INTERVAL_BEGIN, v21, "EventManagerAnalyticsDeduplication", ", buf, 2u);
      }

      v126 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("AnalyticsDedup"), 0);
      -[MOPerformanceMeasurement startSession](v126, "startSession");
      v125 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu AND %K = %@"), CFSTR("provider"), 5, CFSTR("trends"), 0));
      v135 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "filteredArrayUsingPredicate:"));
      v22 = objc_opt_new(NSMutableArray);
      v168 = 0u;
      v169 = 0u;
      v170 = 0u;
      v171 = 0u;
      obj = v14;
      v133 = v22;
      v136 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v168, v173, 16);
      if (v136)
      {
        v134 = *(_QWORD *)v169;
        do
        {
          for (i = 0; i != v136; i = (char *)i + 1)
          {
            if (*(_QWORD *)v169 != v134)
              objc_enumerationMutation(obj);
            v24 = *(void **)(*((_QWORD *)&v168 + 1) + 8 * (_QWORD)i);
            v164 = 0u;
            v165 = 0u;
            v166 = 0u;
            v167 = 0u;
            v25 = v135;
            v156 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v164, v172, 16);
            if (!v156)
            {

              goto LABEL_84;
            }
            v137 = i;
            v152 = 0;
            v153 = v24;
            v154 = *(_QWORD *)v165;
            v155 = v25;
            do
            {
              v26 = 0;
              do
              {
                if (*(_QWORD *)v165 != v154)
                  objc_enumerationMutation(v25);
                v27 = *(void **)(*((_QWORD *)&v164 + 1) + 8 * (_QWORD)v26);
                context = objc_autoreleasePoolPush();
                v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "patterns"));
                v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("kEventPatternType")));
                if (objc_msgSend(v29, "intValue"))
                {

                }
                else
                {
                  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "patterns"));
                  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("kEventPatternType")));
                  v32 = objc_msgSend(v31, "intValue");

                  v24 = v153;
                  if (!v32)
                  {
                    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v153, "patterns"));
                    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "objectForKeyedSubscript:", CFSTR("kEventPatternAnomalousEventIdentifier")));
                    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "patterns"));
                    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "objectForKeyedSubscript:", CFSTR("kEventPatternAnomalousEventIdentifier")));
                    if (objc_msgSend(v60, "isEqualToString:", v62))
                    {
                      v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v153, "patterns"));
                      v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "objectForKeyedSubscript:", CFSTR("kEventPatternAnomalyFeatureType")));
                      v65 = objc_msgSend(v64, "intValue");
                      v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "patterns"));
                      v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "objectForKeyedSubscript:", CFSTR("kEventPatternAnomalyFeatureType")));
                      v68 = v65 == objc_msgSend(v67, "intValue");

                    }
                    else
                    {
                      v68 = 0;
                    }
                    v25 = v155;
                    v58 = context;

                    v152 += v68;
                    v24 = v153;
                    goto LABEL_50;
                  }
                }
                v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "patterns"));
                v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("kEventPatternType")));
                if (objc_msgSend(v34, "intValue") == 1)
                {
                  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "patterns"));
                  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("kEventPatternType")));
                  v37 = objc_msgSend(v36, "intValue");

                  if (v37 == 1)
                  {
                    if (objc_msgSend(v24, "category") != (id)2
                      || (v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "patterns")),
                          v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "objectForKey:", CFSTR("kEventPatternOverallWorkoutType"))),
                          v39,
                          v38,
                          v39))
                    {
                      v40 = objc_msgSend(v24, "category");
                      if (v40 == (id)2)
                      {
                        v151 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "patterns"));
                        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v151, "objectForKeyedSubscript:", CFSTR("kEventPatternOverallWorkoutType")));
                        v149 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "patterns"));
                        v150 = v41;
                        v148 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v149, "objectForKeyedSubscript:", CFSTR("kEventPatternOverallWorkoutType")));
                        if ((objc_msgSend(v41, "isEqualToString:") & 1) != 0)
                        {
                          v42 = 0;
                          goto LABEL_57;
                        }
                      }
                      if (objc_msgSend(v24, "category") != (id)10)
                      {
                        v75 = 0;
                        goto LABEL_69;
                      }
                      v147 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "patterns"));
                      v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v147, "objectForKeyedSubscript:", CFSTR("kEventPatternInteractionScoredContactIdentifier")));
                      v145 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "patterns"));
                      v146 = v69;
                      v144 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v145, "objectForKeyedSubscript:", CFSTR("kEventPatternInteractionScoredContactIdentifier")));
                      if (objc_msgSend(v69, "isEqualToString:"))
                      {
                        v42 = 1;
LABEL_57:
                        v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v153, "patterns"));
                        v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "objectForKeyedSubscript:", CFSTR("kEventPatternTrendFeatureType")));
                        v72 = objc_msgSend(v71, "intValue");
                        v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "patterns"));
                        v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "objectForKeyedSubscript:", CFSTR("kEventPatternTrendFeatureType")));
                        v75 = v72 == objc_msgSend(v74, "intValue");

                        if (!v42)
                        {
LABEL_69:
                          if (v40 == (id)2)
                          {

                            v24 = v153;
                            if (v75)
                            {
LABEL_73:
                              v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "creationDate"));
                              v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "creationDate"));
                              objc_msgSend(v79, "timeIntervalSinceDate:", v80);
                              v82 = v81;

                              v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "patterns"));
                              v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "objectForKeyedSubscript:", CFSTR("kEventPatternTrendSlope")));
                              objc_msgSend(v84, "doubleValue");
                              v86 = v85;
                              v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "patterns"));
                              v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "objectForKeyedSubscript:", CFSTR("kEventPatternTrendSlope")));
                              objc_msgSend(v88, "doubleValue");
                              v90 = v86 * v89;

                              v91 = v82 <= 604800.0;
                              if (v90 > 0.0)
                                v91 = 1;
                              v152 += v91;
                            }
                          }
                          else
                          {
                            v24 = v153;
                            if (v75)
                              goto LABEL_73;
                          }
LABEL_49:
                          v25 = v155;
                          v58 = context;
                          goto LABEL_50;
                        }
                      }
                      else
                      {
                        v75 = 0;
                      }

                      goto LABEL_69;
                    }
                    v78 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
                    v43 = objc_claimAutoreleasedReturnValue(v78);
                    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "Work out type doesn't exist in database for trend", buf, 2u);
                    }
LABEL_48:

                    goto LABEL_49;
                  }
                }
                else
                {

                }
                v43 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "patterns"));
                v44 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v43, "objectForKeyedSubscript:", CFSTR("kEventPatternType")));
                if (objc_msgSend(v44, "intValue") != 2)
                {

                  goto LABEL_48;
                }
                v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "patterns"));
                v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("kEventPatternType")));
                v47 = objc_msgSend(v46, "intValue");

                if (v47 != 2)
                  goto LABEL_49;
                v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "patterns"));
                v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "objectForKey:", CFSTR("kEventPatternOverallWorkoutType")));

                if (v49)
                {
                  v50 = objc_msgSend(v24, "category");
                  if (v50 == objc_msgSend(v27, "category"))
                  {
                    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "patterns"));
                    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("kEventPatternOverallWorkoutType")));
                    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "patterns"));
                    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("kEventPatternOverallWorkoutType")));
                    if (objc_msgSend(v52, "isEqualToString:", v54))
                    {
                      v143 = v51;
                      v142 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "patterns"));
                      v141 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v142, "objectForKeyedSubscript:", CFSTR("kEventPatternRoutineDetectedWeeks")));
                      v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:"));
                      v140 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "patterns"));
                      v139 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v140, "objectForKeyedSubscript:", CFSTR("kEventPatternRoutineDetectedWeeks")));
                      v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:"));
                      if ((objc_msgSend(v55, "isEqualToSet:", v56) & 1) != 0)
                      {
                        v57 = 1;
                      }
                      else
                      {
                        v138 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "patterns"));
                        v93 = v55;
                        v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v138, "objectForKeyedSubscript:", CFSTR("kEventPatternRoutineStartingRoutine")));
                        v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "patterns"));
                        v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "objectForKeyedSubscript:", CFSTR("kEventPatternRoutineStartingRoutine")));
                        v57 = v94 == v96;

                        v55 = v93;
                      }
                      v92 = v152;

                      v51 = v143;
                    }
                    else
                    {
                      v57 = 0;
                      v92 = v152;
                    }

                    v152 = v92 + v57;
                    v24 = v153;
                  }
                  goto LABEL_49;
                }
                v76 = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
                v77 = objc_claimAutoreleasedReturnValue(v76);
                v25 = v155;
                v58 = context;
                if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_INFO, "Work out type  doesn't exist in database for routine", buf, 2u);
                }

LABEL_50:
                objc_autoreleasePoolPop(v58);
                v26 = (char *)v26 + 1;
              }
              while (v156 != v26);
              v97 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v164, v172, 16);
              v156 = v97;
            }
            while (v97);

            v22 = v133;
            i = v137;
            if (!v152)
LABEL_84:
              -[NSMutableArray addObject:](v22, "addObject:", v24);
          }
          v136 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v168, v173, 16);
        }
        while (v136);
      }

      v98 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
      v99 = objc_claimAutoreleasedReturnValue(v98);
      v100 = v99;
      v101 = *(_QWORD *)(a1 + 72);
      if (v101 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v99))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v100, OS_SIGNPOST_INTERVAL_END, v101, "EventManagerAnalyticsDeduplication", ", buf, 2u);
      }

      -[MOPerformanceMeasurement endSession](v126, "endSession");
      v4 = v128;
      if (-[NSMutableArray count](v133, "count"))
      {
        v102 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
        v103 = objc_claimAutoreleasedReturnValue(v102);
        v104 = v103;
        v105 = *(_QWORD *)(a1 + 72);
        if (v105 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v103))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v104, OS_SIGNPOST_INTERVAL_BEGIN, v105, "EventManagerAnalyticsStore", ", buf, 2u);
        }

        v106 = -[MOPerformanceMeasurement initWithName:measureRecentPeak:]([MOPerformanceMeasurement alloc], "initWithName:measureRecentPeak:", CFSTR("AnalyticsStore"), 0);
        -[MOPerformanceMeasurement startSession](v106, "startSession");
        v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "eventStore"));
        v158[0] = _NSConcreteStackBlock;
        v158[1] = 3221225472;
        v158[2] = __60__MOEventManager_runAnalyticsWithRefreshVariant_andHandler___block_invoke_383;
        v158[3] = &unk_1002B5B00;
        v108 = *(id *)(a1 + 48);
        v109 = *(_QWORD *)(a1 + 72);
        v162 = v108;
        v163 = v109;
        v159 = v106;
        v160 = *(id *)(a1 + 32);
        v110 = v133;
        v161 = v133;
        v111 = v106;
        objc_msgSend(v107, "storeEvents:CompletionHandler:", v161, v158);

        v4 = v128;
      }
      else
      {
        v120 = *(_QWORD *)(a1 + 48);
        if (v120)
          (*(void (**)(uint64_t, _QWORD, void *))(v120 + 16))(v120, 0, &__NSDictionary0__struct);
        v121 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
        v122 = objc_claimAutoreleasedReturnValue(v121);
        v123 = v122;
        v124 = *(_QWORD *)(a1 + 72);
        if (v124 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v122))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v123, OS_SIGNPOST_INTERVAL_END, v124, "EventManagerAnalytics", ", buf, 2u);
        }

        objc_msgSend(*(id *)(a1 + 32), "endSession");
        v110 = v133;
      }

    }
    else
    {
      v115 = *(_QWORD *)(a1 + 48);
      if (v115)
        (*(void (**)(uint64_t, _QWORD, void *))(v115 + 16))(v115, 0, &__NSDictionary0__struct);
      v116 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
      v117 = objc_claimAutoreleasedReturnValue(v116);
      v118 = v117;
      v119 = *(_QWORD *)(a1 + 72);
      if (v119 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v117))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v118, OS_SIGNPOST_INTERVAL_END, v119, "EventManagerAnalytics", ", buf, 2u);
      }

      objc_msgSend(*(id *)(a1 + 32), "endSession");
    }

    goto LABEL_115;
  }
  if (v8)
  {
    *(_DWORD *)buf = 138412290;
    v175 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "error, %@", buf, 0xCu);
  }

  v9 = *(_QWORD *)(a1 + 48);
  if (v9)
    (*(void (**)(uint64_t, id, void *))(v9 + 16))(v9, v5, &__NSDictionary0__struct);
  v10 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = v11;
  v13 = *(_QWORD *)(a1 + 72);
  if (v13 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v11))
    goto LABEL_100;
  *(_WORD *)buf = 0;
LABEL_9:
  _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_END, v13, "EventManagerAnalytics", ", buf, 2u);
LABEL_100:

  objc_msgSend(*(id *)(a1 + 32), "endSession");
LABEL_115:

}

void __60__MOEventManager_runAnalyticsWithRefreshVariant_andHandler___block_invoke_383(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id os_log;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  os_signpost_id_t v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  os_signpost_id_t v18;
  id v19;
  uint64_t v20;
  int v21;
  id v22;

  v5 = a2;
  v6 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventManager);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __60__MOEventManager_runAnalyticsWithRefreshVariant_andHandler___block_invoke_383_cold_1();

    v10 = *(_QWORD *)(a1 + 56);
    if (v10)
      (*(void (**)(uint64_t, id, void *))(v10 + 16))(v10, v5, &__NSDictionary0__struct);
    v11 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    v13 = v12;
    v14 = *(_QWORD *)(a1 + 64);
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      LOWORD(v21) = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_END, v14, "EventManagerAnalyticsStore", ", (uint8_t *)&v21, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "endSession");
    v15 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    v17 = v16;
    v18 = *(_QWORD *)(a1 + 64);
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      LOWORD(v21) = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_INTERVAL_END, v18, "EventManagerAnalytics", ", (uint8_t *)&v21, 2u);
    }

    objc_msgSend(*(id *)(a1 + 40), "endSession");
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v19 = objc_msgSend(*(id *)(a1 + 48), "count");
      v21 = 134217984;
      v22 = v19;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "saved patterns as events into database. %lu", (uint8_t *)&v21, 0xCu);
    }

    v20 = *(_QWORD *)(a1 + 56);
    if (v20)
      (*(void (**)(uint64_t, _QWORD, id))(v20 + 16))(v20, 0, v6);
  }

}

- (void)clearCache
{
  -[MOEventManager setCachedEvents:](self, "setCachedEvents:", 0);
  -[MOEventManager setCacheStartDate:](self, "setCacheStartDate:", 0);
  -[MOEventManager setCacheEndDate:](self, "setCacheEndDate:", 0);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (MODefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (MOEventStore)eventStore
{
  return self->_eventStore;
}

- (void)setEventStore:(id)a3
{
  objc_storeStrong((id *)&self->_eventStore, a3);
}

- (void)setPhotoManager:(id)a3
{
  objc_storeStrong((id *)&self->_photoManager, a3);
}

- (void)setRoutineServiceManager:(id)a3
{
  objc_storeStrong((id *)&self->_routineServiceManager, a3);
}

- (void)setHealthKitManager:(id)a3
{
  objc_storeStrong((id *)&self->_healthKitManager, a3);
}

- (void)setSharedWithYouManager:(id)a3
{
  objc_storeStrong((id *)&self->_sharedWithYouManager, a3);
}

- (void)setSuggestedEventManager:(id)a3
{
  objc_storeStrong((id *)&self->_suggestedEventManager, a3);
}

- (void)setProactiveTravelManager:(id)a3
{
  objc_storeStrong((id *)&self->_proactiveTravelManager, a3);
}

- (void)setNowPlayingMediaManager:(id)a3
{
  objc_storeStrong((id *)&self->_nowPlayingMediaManager, a3);
}

- (void)setSignificantContactManager:(id)a3
{
  objc_storeStrong((id *)&self->_significantContactManager, a3);
}

- (void)setPeopleDiscoveryManager:(id)a3
{
  objc_storeStrong((id *)&self->_peopleDiscoveryManager, a3);
}

- (void)setMotionManager:(id)a3
{
  objc_storeStrong((id *)&self->_motionManager, a3);
}

- (MOConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (void)setConfigurationManager:(id)a3
{
  objc_storeStrong((id *)&self->_configurationManager, a3);
}

- (void)setLifeEventManager:(id)a3
{
  objc_storeStrong((id *)&self->_lifeEventManager, a3);
}

- (void)setWeatherManager:(id)a3
{
  objc_storeStrong((id *)&self->_weatherManager, a3);
}

- (NSArray)cachedEvents
{
  return self->_cachedEvents;
}

- (void)setCachedEvents:(id)a3
{
  objc_storeStrong((id *)&self->_cachedEvents, a3);
}

- (NSDate)cacheStartDate
{
  return self->_cacheStartDate;
}

- (void)setCacheStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_cacheStartDate, a3);
}

- (NSDate)cacheEndDate
{
  return self->_cacheEndDate;
}

- (void)setCacheEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_cacheEndDate, a3);
}

- (MOEventPatternManager)patternManager
{
  return self->_patternManager;
}

- (void)setPatternManager:(id)a3
{
  objc_storeStrong((id *)&self->_patternManager, a3);
}

- (MOEventBundleStore)eventBundleStore
{
  return self->_eventBundleStore;
}

- (void)setEventBundleStore:(id)a3
{
  objc_storeStrong((id *)&self->_eventBundleStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventBundleStore, 0);
  objc_storeStrong((id *)&self->_patternManager, 0);
  objc_storeStrong((id *)&self->_cacheEndDate, 0);
  objc_storeStrong((id *)&self->_cacheStartDate, 0);
  objc_storeStrong((id *)&self->_cachedEvents, 0);
  objc_storeStrong((id *)&self->_weatherManager, 0);
  objc_storeStrong((id *)&self->_lifeEventManager, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_motionManager, 0);
  objc_storeStrong((id *)&self->_peopleDiscoveryManager, 0);
  objc_storeStrong((id *)&self->_significantContactManager, 0);
  objc_storeStrong((id *)&self->_nowPlayingMediaManager, 0);
  objc_storeStrong((id *)&self->_proactiveTravelManager, 0);
  objc_storeStrong((id *)&self->_suggestedEventManager, 0);
  objc_storeStrong((id *)&self->_sharedWithYouManager, 0);
  objc_storeStrong((id *)&self->_healthKitManager, 0);
  objc_storeStrong((id *)&self->_routineServiceManager, 0);
  objc_storeStrong((id *)&self->_photoManager, 0);
  objc_storeStrong((id *)&self->_eventStore, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->fUniverse, 0);
}

- (void)initWithUniverse:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: defaultsManager", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)initWithUniverse:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: patternManager", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)clearEventsWithRefreshVariant:andHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "unable to clear event since datastore is not available", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)collectEventsWithRefreshVariant:andHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "unable to collect event since datastore is not available", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

void __62__MOEventManager__collectEventsWithRefreshVariant_andHandler___block_invoke_134_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "fetching trip bundle failed with error: %@, so no updates to the collecting/caching events window", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_209_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7_2(__stack_chk_guard);
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "collecting new and unrehydrated events failed with error, %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_210_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "detected error when trying to remove old real time visits events, %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __105__MOEventManager__collectCompleteEventsBetweenStartDate_endDate_refreshVariant_withStoredEvents_handler___block_invoke_213_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "saving new and unrehydrated events into database failed with error, %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)storeEvents:handler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "unable to store event since datastore is not available", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)fetchEventsWithOptions:CompletionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "unable to fetch event since datastore is not available", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

void __60__MOEventManager__fetchEventsWithOptions_CompletionHandler___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7_2(__stack_chk_guard);
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "fetch events from store hit error, %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_fetchEventsFromCacheWithOptions:CompletionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "fetched events from cache hit error, %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_rehydrateEventsBySingleSource:handler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "rehydrateEvent at single source has no known category.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)cleanUpEventsWithRefreshVariant:andHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "purge to collect event since datastore is not available", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

void __62__MOEventManager__cleanUpEventsWithRefreshVariant_andHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "purge expired events hit error, %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __62__MOEventManager__cleanUpEventsWithRefreshVariant_andHandler___block_invoke_325_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "purge unknown events hit error, %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __62__MOEventManager__cleanUpEventsWithRefreshVariant_andHandler___block_invoke_330_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "purge pattern events which failed rehydration hit error, %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __62__MOEventManager__cleanUpEventsWithRefreshVariant_andHandler___block_invoke_335_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "purge sensed events which failed rehydration multiple times hit error, %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __62__MOEventManager__cleanUpEventsWithRefreshVariant_andHandler___block_invoke_338_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "fetch earliest visit failed, %@, skip purging visit events", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __62__MOEventManager__cleanUpEventsWithRefreshVariant_andHandler___block_invoke_339_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;

  OUTLINED_FUNCTION_10_0();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "purge visit events before date, %@,  failed with error, %@", v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

void __48__MOEventManager__updateEventsDeletedAtSources___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7_2(__stack_chk_guard);
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "fetch all events to update events deleted at sources hit error, %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_updateEventsDeletedAtSingleSource:handler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "update events at single source has no known category.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

void __60__MOEventManager_runAnalyticsWithRefreshVariant_andHandler___block_invoke_383_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "saving patterns as events into database failed with error, %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
