@implementation SMSuggestionsManager

- (void)_sendTipsSignal
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  uint64_t v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;

  if (qword_1EFC6EC50 != -1)
    swift_once();
  v0 = sub_1D1EC55C0();
  __swift_project_value_buffer(v0, (uint64_t)qword_1EFC6EC58);
  v1 = sub_1D1EC55A8();
  v2 = sub_1D1EC55E4();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    v4 = swift_slowAlloc();
    v11 = v4;
    *(_DWORD *)v3 = 136315138;
    sub_1D1A55030(0xD000000000000011, 0x80000001D1EEE8C0, &v11);
    sub_1D1EC55F0();
    _os_log_impl(&dword_1D1A22000, v1, v2, "%s", v3, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1D82323C4](v4, -1, -1);
    MEMORY[0x1D82323C4](v3, -1, -1);
  }

  v5 = objc_msgSend((id)BiomeLibrary(), sel_Discoverability);
  swift_unknownObjectRelease();
  v6 = objc_msgSend(v5, sel_Signals);
  swift_unknownObjectRelease();
  v7 = objc_msgSend(v6, sel_source);

  v8 = objc_allocWithZone(MEMORY[0x1E0D01FF0]);
  v9 = (void *)sub_1D1EC55CC();
  v10 = objc_msgSend(v8, sel_initWithContentIdentifier_context_osBuild_userInfo_, v9, 0, 0, 0);

  objc_msgSend(v7, sel_sendEvent_, v10);
}

- (SMSuggestionsManager)initWithAuthorizationManager:(id)a3 contactsManager:(id)a4 defaultsManager:(id)a5 deviceLocationPredictor:(id)a6 distanceCalculator:(id)a7 healthKitManager:(id)a8 learnedLocationStore:(id)a9 learnedLocationManager:(id)a10 locationManager:(id)a11 mapServiceManager:(id)a12 messagingService:(id)a13 motionActivityManager:(id)a14 navigationManager:(id)a15 platform:(id)a16 visitManager:(id)a17 sessionStore:(id)a18 suggestionsStore:(id)a19 suggestionsHelper:(id)a20
{
  id v25;
  id v26;
  SMSuggestionsManager *v27;
  SMSuggestionsManager *v28;
  uint64_t v29;
  RTDarwinNotificationHelper *notificationHelper;
  id v31;
  dispatch_queue_t v32;
  uint64_t v33;
  SMEligibilityChecker *eligibilityChecker;
  RTLocation *latestLocationOfTheDevice;
  uint64_t v36;
  NSMutableSet *pedometerUUIDs;
  RTMotionActivityPedometerData *previousPedometerData;
  RTLearnedLocationOfInterest *currentLOI;
  SMSuggestionsMetricsManager *v40;
  SMSuggestionsMetricsManager *suggestionsMetricsManager;
  SMSuggestionsManager *v42;
  SMSuggestionsManager *v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  const char *v48;
  NSObject *v50;
  id v52;
  id v54;
  id v55;
  void *v56;
  void *v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  objc_super v72;
  uint8_t buf[16];

  v71 = a3;
  v52 = a4;
  v25 = a4;
  v70 = a5;
  v69 = a6;
  v68 = a7;
  v67 = a8;
  v66 = a9;
  v65 = a10;
  v64 = a11;
  v63 = a12;
  v55 = a13;
  v54 = a14;
  v62 = a15;
  v61 = a16;
  v60 = a17;
  v59 = a18;
  v58 = a19;
  v26 = a20;
  v56 = v26;
  v57 = v25;
  if (!v71)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v47 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      goto LABEL_51;
    *(_WORD *)buf = 0;
    v48 = "Invalid parameter not satisfying: authorizationManager";
LABEL_50:
    _os_log_error_impl(&dword_1D1A22000, v47, OS_LOG_TYPE_ERROR, v48, buf, 2u);
    goto LABEL_51;
  }
  if (!v25)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v47 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      goto LABEL_51;
    *(_WORD *)buf = 0;
    v48 = "Invalid parameter not satisfying: contactsManager";
    goto LABEL_50;
  }
  if (!v70)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v47 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      goto LABEL_51;
    *(_WORD *)buf = 0;
    v48 = "Invalid parameter not satisfying: defaultsManager";
    goto LABEL_50;
  }
  if (!v69)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v47 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      goto LABEL_51;
    *(_WORD *)buf = 0;
    v48 = "Invalid parameter not satisfying: deviceLocationPredictor";
    goto LABEL_50;
  }
  if (!v68)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v47 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      goto LABEL_51;
    *(_WORD *)buf = 0;
    v48 = "Invalid parameter not satisfying: distanceCalculator";
    goto LABEL_50;
  }
  if (!v67)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v47 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      goto LABEL_51;
    *(_WORD *)buf = 0;
    v48 = "Invalid parameter not satisfying: healthKitManager";
    goto LABEL_50;
  }
  if (!v66)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v47 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      goto LABEL_51;
    *(_WORD *)buf = 0;
    v48 = "Invalid parameter not satisfying: learnedLocationStore";
    goto LABEL_50;
  }
  if (!v65)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v47 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      goto LABEL_51;
    *(_WORD *)buf = 0;
    v48 = "Invalid parameter not satisfying: learnedLocationManager";
    goto LABEL_50;
  }
  if (!v64)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v47 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      goto LABEL_51;
    *(_WORD *)buf = 0;
    v48 = "Invalid parameter not satisfying: locationManager";
    goto LABEL_50;
  }
  if (!v63)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v47 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      goto LABEL_51;
    *(_WORD *)buf = 0;
    v48 = "Invalid parameter not satisfying: mapServiceManager";
    goto LABEL_50;
  }
  if (!v62)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v47 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      goto LABEL_51;
    *(_WORD *)buf = 0;
    v48 = "Invalid parameter not satisfying: navigationManager";
    goto LABEL_50;
  }
  if (!v61)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v47 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      goto LABEL_51;
    *(_WORD *)buf = 0;
    v48 = "Invalid parameter not satisfying: platform";
    goto LABEL_50;
  }
  if (!v60)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v47 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      goto LABEL_51;
    *(_WORD *)buf = 0;
    v48 = "Invalid parameter not satisfying: visitManager";
    goto LABEL_50;
  }
  if (!v59)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v47 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      goto LABEL_51;
    *(_WORD *)buf = 0;
    v48 = "Invalid parameter not satisfying: sessionStore";
    goto LABEL_50;
  }
  if (!v58)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v48 = "Invalid parameter not satisfying: suggestionsStore";
      goto LABEL_50;
    }
LABEL_51:

    v43 = 0;
    v44 = v71;
    v46 = v54;
    v45 = v55;
LABEL_52:
    v42 = self;
    goto LABEL_53;
  }
  if (!v26)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v50 = objc_claimAutoreleasedReturnValue();
    v44 = v71;
    v46 = v54;
    v45 = v55;
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v50, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: suggestionsHelper", buf, 2u);
    }

    v43 = 0;
    goto LABEL_52;
  }
  v72.receiver = self;
  v72.super_class = (Class)SMSuggestionsManager;
  v27 = -[RTNotifier init](&v72, sel_init);
  v28 = v27;
  if (v27)
  {
    objc_storeStrong((id *)&v27->_authorizationManager, a3);
    objc_storeStrong((id *)&v28->_contactsManager, v52);
    objc_storeStrong((id *)&v28->_defaultsManager, a5);
    objc_storeStrong((id *)&v28->_deviceLocationPredictor, a6);
    objc_storeStrong((id *)&v28->_distanceCalculator, a7);
    objc_storeStrong((id *)&v28->_healthKitManager, a8);
    objc_storeStrong((id *)&v28->_learnedLocationStore, a9);
    objc_storeStrong((id *)&v28->_learnedLocationManager, a10);
    objc_storeStrong((id *)&v28->_locationManager, a11);
    objc_storeStrong((id *)&v28->_mapServiceManager, a12);
    objc_storeStrong((id *)&v28->_messagingService, a13);
    objc_storeStrong((id *)&v28->_motionActivityManager, a14);
    objc_storeStrong((id *)&v28->_navigationManager, a15);
    v29 = objc_opt_new();
    notificationHelper = v28->_notificationHelper;
    v28->_notificationHelper = (RTDarwinNotificationHelper *)v29;

    objc_storeStrong((id *)&v28->_platform, a16);
    v31 = objc_alloc(MEMORY[0x1E0D8B938]);
    v32 = dispatch_queue_create("com.apple.CoreRoutine.SuggestionsManager.EligibilityChecker", 0);
    v33 = objc_msgSend(v31, "initWithQueue:", v32);
    eligibilityChecker = v28->_eligibilityChecker;
    v28->_eligibilityChecker = (SMEligibilityChecker *)v33;

    objc_storeStrong((id *)&v28->_sessionStore, a18);
    objc_storeStrong((id *)&v28->_suggestionsStore, a19);
    objc_storeStrong((id *)&v28->_visitManager, a17);
    objc_storeStrong((id *)&v28->_suggestionsHelper, a20);
    latestLocationOfTheDevice = v28->_latestLocationOfTheDevice;
    v28->_latestLocationOfTheDevice = 0;

    v36 = objc_opt_new();
    pedometerUUIDs = v28->_pedometerUUIDs;
    v28->_pedometerUUIDs = (NSMutableSet *)v36;

    previousPedometerData = v28->_previousPedometerData;
    v28->_previousPedometerData = 0;

    currentLOI = v28->_currentLOI;
    v28->_currentLOI = 0;

    v28->_isPedometerNotificationsSetupAfterRoutineStarted = 0;
    v40 = -[SMSuggestionsMetricsManager initWithDefaultsManager:deviceLocationPredictor:sessionStore:suggestionsStore:]([SMSuggestionsMetricsManager alloc], "initWithDefaultsManager:deviceLocationPredictor:sessionStore:suggestionsStore:", v70, v69, v59, v58);
    suggestionsMetricsManager = v28->_suggestionsMetricsManager;
    v28->_suggestionsMetricsManager = v40;

    -[RTService setup](v28, "setup");
  }
  v42 = v28;
  v43 = v42;
  v44 = v71;
  v46 = v54;
  v45 = v55;
LABEL_53:

  return v43;
}

- (void)_setup
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

  if (-[SMSuggestionsManager isZelkovaSuggestionsFeatureEnabledWithError:](self, "isZelkovaSuggestionsFeatureEnabledWithError:", 0))
  {
    -[SMSuggestionsManager authorizationManager](self, "authorizationManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTNotification notificationName](RTAuthorizationManagerNotificationRoutineEnabled, "notificationName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:", self, sel_onAuthorizationNotification_, v4);

    -[SMSuggestionsManager visitManager](self, "visitManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTNotification notificationName](RTVisitManagerLowConfidenceVisitIncidentNotification, "notificationName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:", self, sel_onVisitManagerNotification_, v6);

    -[SMSuggestionsManager healthKitManager](self, "healthKitManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTNotification notificationName](RTHealthKitManagerWorkoutOngoingChangedNotification, "notificationName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:", self, sel_onHealthKitNotification_, v8);

    -[SMSuggestionsManager healthKitManager](self, "healthKitManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTNotification notificationName](RTHealthKitManagerNewWorkoutForSMSuggestionsNotification, "notificationName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:", self, sel_onHealthKitNotification_, v10);

    -[SMSuggestionsManager navigationManager](self, "navigationManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTNotification notificationName](RTNavigationManagerRouteSummaryNotification, "notificationName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:", self, sel_onNavigationNotification_, v12);

    -[SMSuggestionsManager motionActivityManager](self, "motionActivityManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTNotification notificationName](RTMotionActivityManagerNotificationVehicleConnected, "notificationName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:", self, sel_onVehicleConnectedNotification_, v14);

    -[SMSuggestionsManager learnedLocationManager](self, "learnedLocationManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTNotification notificationName](RTLearnedLocationManagerNotificationAvailabilityDidChange, "notificationName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:", self, sel_onLearnedLocationManagerNotification_, v16);

    -[SMSuggestionsManager _setupPedometerDataHandler](self, "_setupPedometerDataHandler");
    -[SMSuggestionsManager _updateSystemVersionInDefaults](self, "_updateSystemVersionInDefaults");
  }
}

- (void)_updateSystemVersionInDefaults
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  -[SMSuggestionsManager defaultsManager](self, "defaultsManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("RTDefaultsSuggestionsManagerSystemVersion"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SMSuggestionsManager defaultsManager](self, "defaultsManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("RTDefaultsSuggestionsManagerSystemVersionUpdateDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SMSuggestionsManager platform](self, "platform");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "systemVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v5, "isEqualToString:", v9);

  if (v10 && v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringFromDate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138413058;
      v26 = v13;
      v27 = 2112;
      v28 = v14;
      v29 = 2112;
      v30 = v5;
      v31 = 2112;
      v32 = v15;
      _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "%@, %@, skipping version update - current values, systemVersion, %@, systemVersionUpdateDate, %@", (uint8_t *)&v25, 0x2Au);

    }
    v16 = v7;
    v17 = v5;
  }
  else
  {
    -[SMSuggestionsManager platform](self, "platform");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "systemVersion");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[SMSuggestionsManager defaultsManager](self, "defaultsManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKey:", v17, CFSTR("RTDefaultsSuggestionsManagerSystemVersion"));

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[SMSuggestionsManager defaultsManager](self, "defaultsManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKey:", v16, CFSTR("RTDefaultsSuggestionsManagerSystemVersionUpdateDate"));

    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringFromDate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138413058;
      v26 = v22;
      v27 = 2112;
      v28 = v23;
      v29 = 2112;
      v30 = v17;
      v31 = 2112;
      v32 = v24;
      _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "%@, %@, setting RTDefaultsSuggestionsManagerSystemVersion, %@, RTDefaultsSuggestionsManagerSystemVersionUpdateDate, %@", (uint8_t *)&v25, 0x2Au);

    }
  }

}

- (id)_getSystemVersionUpdateDate
{
  void *v3;
  void *v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[SMSuggestionsManager defaultsManager](self, "defaultsManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("RTDefaultsSuggestionsManagerSystemVersionUpdateDate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringFromDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412802;
    v12 = v7;
    v13 = 2112;
    v14 = v8;
    v15 = 2112;
    v16 = v9;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%@, %@, RTDefaultsSuggestionsManagerSystemVersionUpdateDate, %@", (uint8_t *)&v11, 0x20u);

  }
  return v4;
}

- (void)onAuthorizationNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[RTNotifier queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__SMSuggestionsManager_onAuthorizationNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __52__SMSuggestionsManager_onAuthorizationNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onAuthorizationNotification:", *(_QWORD *)(a1 + 40));
}

- (void)_onAuthorizationNotification:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  _BOOL4 v10;
  const __CFString *v11;
  __CFString *v12;
  void *v13;
  int v14;
  const __CFString *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTAuthorizationManagerNotificationRoutineEnabled, "notificationName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if (v8)
  {
    -[SMSuggestionsManager setRoutineEnabled:](self, "setRoutineEnabled:", objc_msgSend(v5, "enabled"));
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = -[SMSuggestionsManager routineEnabled](self, "routineEnabled");
      v11 = CFSTR("NO");
      if (v10)
        v11 = CFSTR("YES");
      v14 = 138412290;
      v15 = v11;
      _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "Updated routine enabled %@", (uint8_t *)&v14, 0xCu);
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412546;
      v15 = v12;
      v16 = 2112;
      v17 = v13;
      _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "%@, unhandled notification, %@", (uint8_t *)&v14, 0x16u);

    }
  }

}

- (void)onLearnedLocationManagerNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[RTNotifier queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__SMSuggestionsManager_onLearnedLocationManagerNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __61__SMSuggestionsManager_onLearnedLocationManagerNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onLearnedLocationManagerNotification:", *(_QWORD *)(a1 + 40));
}

- (void)_onLearnedLocationManagerNotification:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  char *v13;
  const __CFString *v14;
  const __CFString *v15;
  uint64_t v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  const __CFString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTLearnedLocationManagerNotificationAvailabilityDidChange, "notificationName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if (v8)
  {
    v9 = v5;
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v13 = (char *)objc_claimAutoreleasedReturnValue();
      if (-[NSObject available](v9, "available"))
        v14 = CFSTR("YES");
      else
        v14 = CFSTR("NO");
      *(_DWORD *)buf = 138413058;
      if (-[SMSuggestionsManager isPedometerNotificationsSetupAfterRoutineStarted](self, "isPedometerNotificationsSetupAfterRoutineStarted"))
      {
        v15 = CFSTR("YES");
      }
      else
      {
        v15 = CFSTR("NO");
      }
      v18 = v12;
      v19 = 2112;
      v20 = v13;
      v21 = 2112;
      v22 = v14;
      v23 = 2112;
      v24 = v15;
      _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "%@, %@, learned location manager available, %@, isPedometerNotificationsSetupAfterRoutineStarted, %@", buf, 0x2Au);

    }
    if (-[NSObject available](v9, "available")
      && !-[SMSuggestionsManager isPedometerNotificationsSetupAfterRoutineStarted](self, "isPedometerNotificationsSetupAfterRoutineStarted"))
    {
      v16 = 0;
      -[SMSuggestionsManager _setupPedometerNotificationsIfExists:](self, "_setupPedometerNotificationsIfExists:", &v16);
      -[SMSuggestionsManager setIsPedometerNotificationsSetupAfterRoutineStarted:](self, "setIsPedometerNotificationsSetupAfterRoutineStarted:", 1);
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v18 = v5;
      v19 = 2080;
      v20 = "-[SMSuggestionsManager _onLearnedLocationManagerNotification:]";
      v21 = 1024;
      LODWORD(v22) = 375;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "unhandled notification, %@ (in %s:%d)", buf, 0x1Cu);
    }
  }

}

- (void)onVisitManagerNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[RTNotifier queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__SMSuggestionsManager_onVisitManagerNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __51__SMSuggestionsManager_onVisitManagerNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onVisitManagerNotification:", *(_QWORD *)(a1 + 40));
}

- (void)_onVisitManagerNotification:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  NSObject *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  NSObject *v17;
  NSObject *v18;
  objc_class *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  NSObject *v28;
  objc_class *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  objc_class *v33;
  void *v34;
  void *v35;
  dispatch_semaphore_t v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  dispatch_time_t v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  NSObject *v53;
  objc_class *v54;
  void *v55;
  void *v56;
  __CFString *v57;
  NSObject *v58;
  uint64_t v59;
  void *v60;
  _BOOL4 v61;
  objc_class *v62;
  id v63;
  uint64_t v64;
  void *v65;
  const __CFString *v66;
  objc_class *v67;
  id v68;
  void *v69;
  NSObject *v70;
  void *v71;
  void *v72;
  void *v73;
  NSObject *v74;
  id v75;
  id v76;
  _QWORD v77[4];
  NSObject *v78;
  _BYTE *v79;
  uint64_t *v80;
  uint64_t v81;
  uint64_t *v82;
  uint64_t v83;
  uint64_t (*v84)(uint64_t, uint64_t);
  void (*v85)(uint64_t);
  id v86;
  id v87;
  _BYTE v88[12];
  __int16 v89;
  uint64_t v90;
  __int16 v91;
  const __CFString *v92;
  __int16 v93;
  NSObject *v94;
  _BYTE buf[24];
  uint64_t (*v96)(uint64_t, uint64_t);
  __int128 v97;
  _QWORD v98[4];

  v98[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTVisitManagerLowConfidenceVisitIncidentNotification, "notificationName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if (v8)
  {
    v9 = v5;
    -[NSObject visitIncident](v9, "visitIncident");
    v10 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v13;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v14;
      *(_WORD *)&buf[22] = 2112;
      v96 = v10;
      _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "%@, %@, received visit notification, %@", buf, 0x20u);

    }
    if (objc_msgSend(v10, "type") == 1)
    {
      objc_msgSend(v10, "location");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v87 = 0;
      v16 = -[SMSuggestionsManager _deleteProactiveNotificationWithDestinationLocation:error:](self, "_deleteProactiveNotificationWithDestinationLocation:error:", v15, &v87);
      v17 = v87;

      if (v17)
      {
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          v19 = (objc_class *)objc_opt_class();
          NSStringFromClass(v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = (void *)v21;
          v23 = CFSTR("NO");
          *(_DWORD *)buf = 138413058;
          *(_QWORD *)&buf[4] = v20;
          *(_WORD *)&buf[12] = 2112;
          if (v16)
            v23 = CFSTR("YES");
          *(_QWORD *)&buf[14] = v21;
          *(_WORD *)&buf[22] = 2112;
          v96 = (uint64_t (*)(uint64_t, uint64_t))v23;
          LOWORD(v97) = 2112;
          *(_QWORD *)((char *)&v97 + 2) = v17;
          _os_log_error_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_ERROR, "%@, %@, delete proactive notification status, %@, error, %@,", buf, 0x2Au);

        }
      }
      else
      {
        v36 = dispatch_semaphore_create(0);
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        v96 = __Block_byref_object_copy__102;
        *(_QWORD *)&v97 = __Block_byref_object_dispose__102;
        *((_QWORD *)&v97 + 1) = 0;
        v81 = 0;
        v82 = &v81;
        v83 = 0x3032000000;
        v84 = __Block_byref_object_copy__102;
        v85 = __Block_byref_object_dispose__102;
        v86 = 0;
        -[SMSuggestionsManager learnedLocationManager](self, "learnedLocationManager");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "placeInference");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "loiIdentifier");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v77[0] = MEMORY[0x1E0C809B0];
        v77[1] = 3221225472;
        v77[2] = __52__SMSuggestionsManager__onVisitManagerNotification___block_invoke;
        v77[3] = &unk_1E9297478;
        v79 = buf;
        v80 = &v81;
        v40 = v36;
        v78 = v40;
        objc_msgSend(v37, "fetchLocationOfInterestWithIdentifier:handler:", v39, v77);

        v18 = v40;
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = dispatch_time(0, 3600000000000);
        if (!dispatch_semaphore_wait(v18, v41))
          goto LABEL_28;
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "timeIntervalSinceDate:", v73);
        v43 = v42;
        v71 = (void *)objc_opt_new();
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_607);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "filteredArrayUsingPredicate:", v44);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "firstObject");
        v47 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v71, "submitToCoreAnalytics:type:duration:", v47, 1, v43);
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v48 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v88 = 0;
          _os_log_fault_impl(&dword_1D1A22000, v48, OS_LOG_TYPE_FAULT, "Invalid parameter not satisfying: authorizationManager", v88, 2u);
        }

        v49 = (void *)MEMORY[0x1E0CB35C8];
        v98[0] = *MEMORY[0x1E0CB2D50];
        *(_QWORD *)v88 = CFSTR("semaphore wait timeout");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v88, v98, 1);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v50);
        v51 = (void *)objc_claimAutoreleasedReturnValue();

        if (v51)
        {
          v52 = objc_retainAutorelease(v51);

        }
        else
        {
LABEL_28:
          v52 = 0;
        }

        v57 = (__CFString *)v52;
        if (v57 || v82[5])
        {
          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          v58 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
          {
            v67 = (objc_class *)objc_opt_class();
            NSStringFromClass(v67);
            v68 = (id)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            v70 = v82[5];
            *(_DWORD *)v88 = 138413058;
            *(_QWORD *)&v88[4] = v68;
            v89 = 2112;
            v90 = (uint64_t)v69;
            v91 = 2112;
            v92 = v57;
            v93 = 2112;
            v94 = v70;
            _os_log_error_impl(&dword_1D1A22000, v58, OS_LOG_TYPE_ERROR, "%@, %@, sema error, %@, fetch loi error, %@", v88, 0x2Au);

          }
          v17 = 0;
        }
        else
        {
          v59 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
          objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 1800.0);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v76 = 0;
          v61 = -[SMSuggestionsManager _reRegisterForPedometerNotificationsForLearnedLocationOfInterest:startDate:error:](self, "_reRegisterForPedometerNotificationsForLearnedLocationOfInterest:startDate:error:", v59, v60, &v76);
          v17 = v76;

          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          v58 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
          {
            v62 = (objc_class *)objc_opt_class();
            NSStringFromClass(v62);
            v63 = (id)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v64 = objc_claimAutoreleasedReturnValue();
            v65 = (void *)v64;
            v66 = CFSTR("NO");
            *(_DWORD *)v88 = 138413058;
            *(_QWORD *)&v88[4] = v63;
            v89 = 2112;
            if (v61)
              v66 = CFSTR("YES");
            v90 = v64;
            v91 = 2112;
            v92 = v66;
            v93 = 2112;
            v94 = v17;
            _os_log_impl(&dword_1D1A22000, v58, OS_LOG_TYPE_INFO, "%@, %@, register for pedometer notifications status, %@, error, %@", v88, 0x2Au);

          }
        }

        _Block_object_dispose(&v81, 8);
        _Block_object_dispose(buf, 8);

      }
    }
    else
    {
      if (objc_msgSend(v10, "type") != 3)
      {
LABEL_36:

        goto LABEL_37;
      }
      objc_msgSend(v10, "exit");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "entry");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "timeIntervalSinceDate:", v25);
      v27 = v26;

      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        v29 = (objc_class *)objc_opt_class();
        NSStringFromClass(v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        *(_QWORD *)&buf[4] = v30;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v31;
        *(_WORD *)&buf[22] = 2048;
        v96 = *(uint64_t (**)(uint64_t, uint64_t))&v27;
        LOWORD(v97) = 2048;
        *(_QWORD *)((char *)&v97 + 2) = 0x408C200000000000;
        _os_log_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_INFO, "%@, %@, visit duration, %f, kSMSuggestionVisitExitTriggerMinDuration, %f", buf, 0x2Au);

      }
      if (v27 >= 900.0)
      {
        v75 = 0;
        -[SMSuggestionsManager _runProactiveSuggestionsEngineWithContext:shouldStoreSuggestions:error:](self, "_runProactiveSuggestionsEngineWithContext:shouldStoreSuggestions:error:", v10, 1, &v75);
        v32 = objc_claimAutoreleasedReturnValue();
        v18 = v75;
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v53 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
        {
          v54 = (objc_class *)objc_opt_class();
          NSStringFromClass(v54);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          *(_QWORD *)&buf[4] = v55;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v56;
          *(_WORD *)&buf[22] = 2112;
          v96 = (uint64_t (*)(uint64_t, uint64_t))v32;
          LOWORD(v97) = 2112;
          *(_QWORD *)((char *)&v97 + 2) = v18;
          _os_log_impl(&dword_1D1A22000, v53, OS_LOG_TYPE_INFO, "%@, %@, suggestion from suggestions engine, %@, error, %@", buf, 0x2Au);

        }
      }
      else
      {
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          v33 = (objc_class *)objc_opt_class();
          NSStringFromClass(v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v34;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v35;
          _os_log_impl(&dword_1D1A22000, v32, OS_LOG_TYPE_INFO, "%@, %@, proactive engine not triggered", buf, 0x16u);

        }
        v18 = 0;
      }

      v74 = v18;
      -[SMSuggestionsManager _unregisterForPedometerNotificationsWithError:](self, "_unregisterForPedometerNotificationsWithError:", &v74);
      v17 = v74;
    }

    goto LABEL_36;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v5;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = "-[SMSuggestionsManager _onVisitManagerNotification:]";
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v96) = 488;
    _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "unhandled notification, %@ (in %s:%d)", buf, 0x1Cu);
  }
LABEL_37:

}

void __52__SMSuggestionsManager__onVisitManagerNotification___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)onHealthKitNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[RTNotifier queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__SMSuggestionsManager_onHealthKitNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __48__SMSuggestionsManager_onHealthKitNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onHealthKitNotification:", *(_QWORD *)(a1 + 40));
}

- (void)_onHealthKitNotification:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  objc_class *v17;
  void *v18;
  char *v19;
  void *v20;
  id v21;
  NSObject *v22;
  objc_class *v23;
  void *v24;
  char *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  id v33;
  id v34;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTHealthKitManagerNewWorkoutForSMSuggestionsNotification, "notificationName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if (v8)
  {
    -[SMSuggestionsManager healthKitManager](self, "healthKitManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMSuggestionsManager healthKitManager](self, "healthKitManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_getWorkoutDefaultStartDateForRaceRoute");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMSuggestionsManager healthKitManager](self, "healthKitManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_getRTWorkoutDefaultTypesForSMSuggestions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0;
    objc_msgSend(v9, "getLatestWorkoutWithStartDate:nearLocation:distanceThreshold:onlySourcedFromFitnessApp:includePastureModeRoutes:workoutTypes:error:", v11, 0, 0, 0, v13, &v34, 1.79769313e308);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v34;

    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v19 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v36 = v18;
      v37 = 2112;
      v38 = v19;
      v39 = 2112;
      v40 = v14;
      _os_log_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_INFO, "%@, %@, received workout notification for new workout, %@", buf, 0x20u);

    }
    v33 = v15;
    -[SMSuggestionsManager _runProactiveSuggestionsEngineWithContext:shouldStoreSuggestions:error:](self, "_runProactiveSuggestionsEngineWithContext:shouldStoreSuggestions:error:", v14, 1, &v33);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v33;

    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = (objc_class *)objc_opt_class();
      NSStringFromClass(v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v25 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v36 = v24;
      v37 = 2112;
      v38 = v25;
      v39 = 2112;
      v40 = v20;
      v41 = 2112;
      v42 = v21;
      _os_log_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_INFO, "%@, %@, suggestion from suggestions engine, %@, error, %@", buf, 0x2Au);

    }
  }
  else
  {
    objc_msgSend(v5, "name");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTNotification notificationName](RTHealthKitManagerWorkoutOngoingChangedNotification, "notificationName");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v26, "isEqualToString:", v27);

    if (v28)
    {
      -[SMSuggestionsManager defaultsManager](self, "defaultsManager");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "objectForKey:", CFSTR("RTDefaultsWorkoutOngoing"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "BOOLValue");

      -[SMSuggestionsManager _triggerCheckInWorkoutURLUpdateWithShouldGenerateURL:](self, "_triggerCheckInWorkoutURLUpdateWithShouldGenerateURL:", v31);
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v36 = v5;
        v37 = 2080;
        v38 = "-[SMSuggestionsManager _onHealthKitNotification:]";
        v39 = 1024;
        LODWORD(v40) = 535;
        _os_log_error_impl(&dword_1D1A22000, v32, OS_LOG_TYPE_ERROR, "unhandled notification, %@ (in %s:%d)", buf, 0x1Cu);
      }

    }
  }

}

- (void)_triggerCheckInWorkoutURLUpdateWithShouldGenerateURL:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  _BOOL4 v17;
  uint64_t v18;

  v3 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v13 = v8;
    v14 = 2112;
    v15 = v9;
    v16 = 1024;
    v17 = v3;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%@, %@, shouldGenerateURL: %{Bool}d", buf, 0x1Cu);

  }
  if (v3)
  {
    -[SMSuggestionsManager healthKitManager](self, "healthKitManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __77__SMSuggestionsManager__triggerCheckInWorkoutURLUpdateWithShouldGenerateURL___block_invoke;
    v11[3] = &unk_1E92A1448;
    v11[4] = self;
    objc_msgSend(v10, "fetchCurrentWorkoutSnapshotWithHandler:", v11);

  }
  else
  {
    -[SMSuggestionsManager _updateSafetyMonitorWorkoutSuggestionWidget](self, "_updateSafetyMonitorWorkoutSuggestionWidget");
  }
}

void __77__SMSuggestionsManager__triggerCheckInWorkoutURLUpdateWithShouldGenerateURL___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __77__SMSuggestionsManager__triggerCheckInWorkoutURLUpdateWithShouldGenerateURL___block_invoke_2;
  v6[3] = &unk_1E9297540;
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, v6);

}

uint64_t __77__SMSuggestionsManager__triggerCheckInWorkoutURLUpdateWithShouldGenerateURL___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_generateSuggestionFromCurrentHealthKitWorkoutSnapshot:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_updateSafetyMonitorWorkoutSuggestionWidget");
}

- (void)_generateSuggestionFromCurrentHealthKitWorkoutSnapshot:(id)a3
{
  void *v4;
  id v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v10 = 0;
    -[SMSuggestionsManager _runProactiveSuggestionsEngineWithContext:shouldStoreSuggestions:error:](self, "_runProactiveSuggestionsEngineWithContext:shouldStoreSuggestions:error:", a3, 1, &v10);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v10;
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v12 = v8;
      v13 = 2112;
      v14 = v9;
      v15 = 2112;
      v16 = v4;
      v17 = 2112;
      v18 = v5;
      _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%@, %@, suggestion from suggestions engine, %@, error, %@", buf, 0x2Au);

    }
  }
}

- (void)onNavigationNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[RTNotifier queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__SMSuggestionsManager_onNavigationNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __49__SMSuggestionsManager_onNavigationNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onNavigationNotification:", *(_QWORD *)(a1 + 40));
}

- (void)_onNavigationNotification:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  __CFString *v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  char *v13;
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  NSObject *v22;
  NSObject *v23;
  objc_class *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  const __CFString *v28;
  id v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  const __CFString *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTNavigationManagerRouteSummaryNotification, "notificationName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if (v8)
  {
    v9 = (__CFString *)v5;
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v13 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v31 = v12;
      v32 = 2112;
      v33 = v13;
      v34 = 2112;
      v35 = v9;
      _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "%@, %@, received maps navigation start with notification, %@", buf, 0x20u);

    }
    v14 = objc_alloc(MEMORY[0x1E0D183B0]);
    -[__CFString destinationLatitude](v9, "destinationLatitude");
    v16 = v15;
    -[__CFString destinationLongitude](v9, "destinationLongitude");
    v18 = v17;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v14, "initWithLatitude:longitude:horizontalUncertainty:date:", v19, v16, v18, 0.0);

    v29 = 0;
    v21 = -[SMSuggestionsManager _deleteProactiveNotificationUponNavigationDestination:error:](self, "_deleteProactiveNotificationUponNavigationDestination:error:", v20, &v29);
    v22 = v29;
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      v24 = (objc_class *)objc_opt_class();
      NSStringFromClass(v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = (void *)v26;
      v28 = CFSTR("NO");
      *(_DWORD *)buf = 138412802;
      v31 = v25;
      v32 = 2112;
      if (v21)
        v28 = CFSTR("YES");
      v33 = (const char *)v26;
      v34 = 2112;
      v35 = v28;
      _os_log_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_INFO, "%@, %@, proactive notification deletion status, %@", buf, 0x20u);

    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v31 = v5;
      v32 = 2080;
      v33 = "-[SMSuggestionsManager _onNavigationNotification:]";
      v34 = 1024;
      LODWORD(v35) = 633;
      _os_log_error_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_ERROR, "unhandled notification, %@ (in %s:%d)", buf, 0x1Cu);
    }
  }

}

- (void)onVehicleConnectedNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[RTNotifier queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__SMSuggestionsManager_onVehicleConnectedNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __55__SMSuggestionsManager_onVehicleConnectedNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onVehicleConnectedNotification:", *(_QWORD *)(a1 + 40));
}

- (void)_onVehicleConnectedNotification:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  char *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  objc_class *v18;
  void *v19;
  char *v20;
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  NSObject *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTMotionActivityManagerNotificationVehicleConnected, "notificationName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if (v8)
  {
    v9 = v5;
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v13 = (char *)objc_claimAutoreleasedReturnValue();
      +[RTMotionActivityManager motionActivityVehicleConnectedStateToString:](RTMotionActivityManager, "motionActivityVehicleConnectedStateToString:", objc_msgSend(v9, "vehicleConnectedState"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v23 = v12;
      v24 = 2112;
      v25 = v13;
      v26 = 2112;
      v27 = v14;
      _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "%@, %@, received vehicle connected notification with state, %@", buf, 0x20u);

    }
    v21 = 0;
    -[SMSuggestionsManager _runProactiveSuggestionsEngineWithContext:shouldStoreSuggestions:error:](self, "_runProactiveSuggestionsEngineWithContext:shouldStoreSuggestions:error:", v9, 1, &v21);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v21;
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v20 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v23 = v19;
      v24 = 2112;
      v25 = v20;
      v26 = 2112;
      v27 = v15;
      v28 = 2112;
      v29 = v16;
      _os_log_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_INFO, "%@, %@, suggestion from suggestions engine, %@, error, %@", buf, 0x2Au);

    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v23 = v5;
      v24 = 2080;
      v25 = "-[SMSuggestionsManager _onVehicleConnectedNotification:]";
      v26 = 1024;
      LODWORD(v27) = 669;
      _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "unhandled notification, %@ (in %s:%d)", buf, 0x1Cu);
    }
  }

}

- (void)onSessionStartedWithConfiguration:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[RTNotifier queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__SMSuggestionsManager_onSessionStartedWithConfiguration___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __58__SMSuggestionsManager_onSessionStartedWithConfiguration___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onSessionStartedWithConfiguration:", *(_QWORD *)(a1 + 40));
}

- (void)_onSessionStartedWithConfiguration:(id)a3
{
  uint64_t v4;

  v4 = 0;
  -[SMSuggestionsManager _deleteProactiveNotificationWithError:](self, "_deleteProactiveNotificationWithError:", &v4);
  -[SMSuggestionsManager _triggerCheckInWorkoutURLUpdateWithShouldGenerateURL:](self, "_triggerCheckInWorkoutURLUpdateWithShouldGenerateURL:", 0);
  -[SMSuggestionsManager _sendTipsSignal](self, "_sendTipsSignal");
}

- (void)onSessionEndedForActiveDevice:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  -[RTNotifier queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__SMSuggestionsManager_onSessionEndedForActiveDevice___block_invoke;
  v6[3] = &unk_1E9297870;
  v6[4] = self;
  v7 = a3;
  dispatch_async(v5, v6);

}

uint64_t __54__SMSuggestionsManager_onSessionEndedForActiveDevice___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onSessionEndedForActiveDevice:", *(unsigned __int8 *)(a1 + 40));
}

- (void)_onSessionEndedForActiveDevice:(BOOL)a3
{
  -[SMSuggestionsManager _triggerCheckInWorkoutURLUpdateWithShouldGenerateURL:](self, "_triggerCheckInWorkoutURLUpdateWithShouldGenerateURL:", 1);
}

- (BOOL)_deleteProactiveNotificationWithError:(id *)a3
{
  void *v5;
  void *v6;
  RTUserNotification *v7;
  NSObject *v8;
  int v9;
  id v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  const __CFString *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  -[SMSuggestionsManager defaultsManager](self, "defaultsManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("RTDefaultsSuggestionsManagerLastSuggestionNotificationUUID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = [RTUserNotification alloc];
    v8 = -[RTUserNotification initWithBundleIdentifier:notificationUUIDString:](v7, "initWithBundleIdentifier:notificationUUIDString:", *MEMORY[0x1E0D8BBD0], v6);
    v21 = 0;
    v9 = -[NSObject deleteNotificationWithError:](v8, "deleteNotificationWithError:", &v21);
    v10 = v21;
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)v14;
      v16 = CFSTR("NO");
      *(_DWORD *)buf = 138413058;
      v23 = v13;
      if (v9)
        v16 = CFSTR("YES");
      v24 = 2112;
      v25 = v14;
      v26 = 2112;
      v27 = v16;
      v28 = 2112;
      v29 = v10;
      _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "%@, %@, scheduled clean up of notification status, %@, error, %@", buf, 0x2Au);

    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v8 = objc_claimAutoreleasedReturnValue();
    LOBYTE(v9) = 1;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v23 = v18;
      v24 = 2112;
      v25 = (uint64_t)v19;
      _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "%@, %@, notification UUID from defaults is nil", buf, 0x16u);

    }
    v10 = 0;
  }

  if (a3)
    *a3 = objc_retainAutorelease(v10);

  return v9;
}

- (BOOL)_deleteProactiveNotificationWithDestinationLocation:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  dispatch_semaphore_t v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  dispatch_time_t v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  NSObject *v34;
  BOOL v35;
  void *v36;
  NSObject *v37;
  NSObject *v38;
  NSObject *v39;
  objc_class *v40;
  id v41;
  id v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  id *v47;
  double v48;
  double v49;
  NSObject *v50;
  NSObject *v51;
  objc_class *v52;
  id v53;
  id v54;
  void *v55;
  void *v56;
  id *v57;
  objc_class *v59;
  id v60;
  void *v61;
  objc_class *v62;
  id v63;
  void *v64;
  double v65;
  objc_class *v66;
  id v67;
  void *v68;
  double v69;
  const char *aSelector;
  void *v71;
  void *v73;
  id v74;
  id obj;
  _QWORD v76[4];
  NSObject *v77;
  uint64_t *v78;
  uint64_t *v79;
  uint64_t v80;
  double *v81;
  uint64_t v82;
  uint64_t (*v83)(uint64_t, uint64_t);
  void (*v84)(uint64_t);
  id v85;
  uint64_t v86;
  uint64_t *v87;
  uint64_t v88;
  uint64_t (*v89)(uint64_t, uint64_t);
  void (*v90)(uint64_t);
  id v91;
  _BYTE buf[12];
  __int16 v93;
  id v94;
  __int16 v95;
  double v96;
  __int16 v97;
  uint64_t v98;
  __int16 v99;
  void *v100;
  __int16 v101;
  id v102;
  _QWORD v103[4];

  v103[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    aSelector = a2;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc(MEMORY[0x1E0D8BA98]);
    v8 = objc_alloc(MEMORY[0x1E0CB3588]);
    objc_msgSend(v73, "dateByAddingTimeInterval:", -600.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *MEMORY[0x1E0D8BD40];
    v11 = (void *)objc_msgSend(v8, "initWithStartDate:endDate:", v9, v73);
    v12 = objc_msgSend(v7, "initWithBatchSize:fetchLimit:offset:includeSuppressed:sortByCreationDate:ascending:dateInterval:filteredToSuggestionTriggers:filteredToSuggestionUserTypes:filteredToSessionTypes:", v10, 1, v10, 0, 1, 0, v11, 0, 0, 0);

    v86 = 0;
    v87 = &v86;
    v88 = 0x3032000000;
    v89 = __Block_byref_object_copy__102;
    v90 = __Block_byref_object_dispose__102;
    v91 = 0;
    v80 = 0;
    v81 = (double *)&v80;
    v82 = 0x3032000000;
    v83 = __Block_byref_object_copy__102;
    v84 = __Block_byref_object_dispose__102;
    v85 = 0;
    v13 = dispatch_semaphore_create(0);
    -[SMSuggestionsManager suggestionsStore](self, "suggestionsStore");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v76[0] = MEMORY[0x1E0C809B0];
    v76[1] = 3221225472;
    v76[2] = __82__SMSuggestionsManager__deleteProactiveNotificationWithDestinationLocation_error___block_invoke;
    v76[3] = &unk_1E9296EE0;
    v78 = &v86;
    v79 = &v80;
    v15 = v13;
    v77 = v15;
    objc_msgSend(v14, "fetchSuggestionsWithOptions:handler:", v12, v76);
    v71 = (void *)v12;

    v16 = v15;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v16, v18))
      goto LABEL_7;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "timeIntervalSinceDate:", v17);
    v21 = v20;
    v22 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_607);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "filteredArrayUsingPredicate:", v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "firstObject");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "submitToCoreAnalytics:type:duration:", v26, 1, v21);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_FAULT, "Invalid parameter not satisfying: authorizationManager", buf, 2u);
    }

    v28 = (void *)MEMORY[0x1E0CB35C8];
    v103[0] = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)buf = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v103, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      v31 = objc_retainAutorelease(v30);

    }
    else
    {
LABEL_7:
      v31 = 0;
    }

    v32 = v31;
    v33 = v32;
    if (a4 && v32)
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        v59 = (objc_class *)objc_opt_class();
        NSStringFromClass(v59);
        v60 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v60;
        v93 = 2112;
        v94 = v61;
        v95 = 2112;
        v96 = *(double *)&v33;
        _os_log_error_impl(&dword_1D1A22000, v34, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

      }
      v35 = 0;
      v36 = v33;
      goto LABEL_39;
    }
    if (a4 && *((_QWORD *)v81 + 5))
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        v62 = (objc_class *)objc_opt_class();
        NSStringFromClass(v62);
        v63 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = v81[5];
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v63;
        v93 = 2112;
        v94 = v64;
        v95 = 2112;
        v96 = v65;
        _os_log_error_impl(&dword_1D1A22000, v38, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

      }
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        v40 = (objc_class *)objc_opt_class();
        NSStringFromClass(v40);
        v41 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        v42 = (id)objc_claimAutoreleasedReturnValue();
        *(double *)&v43 = COERCE_DOUBLE(objc_msgSend((id)v87[5], "count"));
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v41;
        v93 = 2112;
        v94 = v42;
        v95 = 2048;
        v96 = *(double *)&v43;
        _os_log_impl(&dword_1D1A22000, v39, OS_LOG_TYPE_INFO, "%@, %@, suggestions count, %lu", buf, 0x20u);

      }
      if (!objc_msgSend((id)v87[5], "count"))
      {
        v35 = 1;
        goto LABEL_40;
      }
      -[SMSuggestionsManager distanceCalculator](self, "distanceCalculator");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v87[5], "firstObject");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "destinationLocation");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = (id *)(v81 + 5);
      obj = (id)*((_QWORD *)v81 + 5);
      objc_msgSend(v44, "distanceFromLocation:toLocation:error:", v46, v6, &obj);
      v49 = v48;
      objc_storeStrong(v47, obj);

      if (!a4 || !*((_QWORD *)v81 + 5))
      {
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v51 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
        {
          v52 = (objc_class *)objc_opt_class();
          NSStringFromClass(v52);
          v53 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(aSelector);
          v54 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v87[5], "firstObject");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "destinationLocation");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413570;
          *(_QWORD *)&buf[4] = v53;
          v93 = 2112;
          v94 = v54;
          v95 = 2048;
          v96 = v49;
          v97 = 2048;
          v98 = 0x408F400000000000;
          v99 = 2112;
          v100 = v56;
          v101 = 2112;
          v102 = v6;
          _os_log_impl(&dword_1D1A22000, v51, OS_LOG_TYPE_INFO, "%@, %@, distance, %.3f, kSMSuggestionMinimimDistanceBetweenSourceAndDestination, %.3f, suggestion location, %@, destinationLocation, %@", buf, 0x3Eu);

        }
        v35 = 1;
        if (v49 >= 0.0 && v49 < 1000.0)
        {
          v57 = (id *)(v81 + 5);
          v74 = (id)*((_QWORD *)v81 + 5);
          v35 = -[SMSuggestionsManager _deleteProactiveNotificationWithError:](self, "_deleteProactiveNotificationWithError:", &v74);
          objc_storeStrong(v57, v74);
        }
        if (!a4)
          goto LABEL_40;
        goto LABEL_38;
      }
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        v66 = (objc_class *)objc_opt_class();
        NSStringFromClass(v66);
        v67 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = v81[5];
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v67;
        v93 = 2112;
        v94 = v68;
        v95 = 2112;
        v96 = v69;
        _os_log_error_impl(&dword_1D1A22000, v50, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

      }
    }
    v35 = 0;
LABEL_38:
    v36 = (void *)*((_QWORD *)v81 + 5);
LABEL_39:
    *a4 = objc_retainAutorelease(v36);
LABEL_40:

    _Block_object_dispose(&v80, 8);
    _Block_object_dispose(&v86, 8);

    goto LABEL_41;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v37, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: destinationLocation", buf, 2u);
  }

  if (a4)
  {
    _RTErrorInvalidParameterCreate((uint64_t)CFSTR("destinationLocation"));
    v35 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v35 = 0;
  }
LABEL_41:

  return v35;
}

void __82__SMSuggestionsManager__deleteProactiveNotificationWithDestinationLocation_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)_deleteProactiveNotificationUponNavigationDestination:(id)a3 error:(id *)a4
{
  id v7;
  NSObject *v8;
  BOOL v9;
  void *v10;
  void *v11;
  id *v12;
  double v13;
  double v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  objc_class *v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  dispatch_semaphore_t v26;
  void *v27;
  NSObject *v28;
  void *v29;
  dispatch_time_t v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  double v44;
  NSObject *v46;
  double v47;
  NSObject *v48;
  NSObject *v49;
  objc_class *v50;
  id v51;
  id v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  id *v57;
  double v58;
  double v59;
  NSObject *v60;
  objc_class *v61;
  id v62;
  void *v63;
  double v64;
  NSObject *v65;
  objc_class *v66;
  id v67;
  id v68;
  void *v69;
  void *v70;
  id *v71;
  objc_class *v72;
  id v73;
  void *v74;
  double v75;
  objc_class *v77;
  id v78;
  void *v79;
  objc_class *v80;
  id v81;
  void *v82;
  double v83;
  objc_class *v84;
  id v85;
  void *v86;
  double v87;
  void *v88;
  NSObject *dsema;
  const char *aSelector;
  void *v91;
  id v92;
  id v93;
  _QWORD v94[4];
  NSObject *v95;
  uint64_t *v96;
  uint64_t *v97;
  uint64_t v98;
  uint64_t *v99;
  uint64_t v100;
  uint64_t (*v101)(uint64_t, uint64_t);
  void (*v102)(uint64_t);
  id v103;
  id v104;
  id obj;
  uint64_t v106;
  double *v107;
  uint64_t v108;
  uint64_t (*v109)(uint64_t, uint64_t);
  void (*v110)(uint64_t);
  id v111;
  _BYTE buf[12];
  __int16 v113;
  id v114;
  __int16 v115;
  double v116;
  __int16 v117;
  uint64_t v118;
  __int16 v119;
  void *v120;
  __int16 v121;
  id v122;
  _QWORD v123[4];

  v123[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (v7)
  {
    aSelector = a2;
    v106 = 0;
    v107 = (double *)&v106;
    v108 = 0x3032000000;
    v109 = __Block_byref_object_copy__102;
    v110 = __Block_byref_object_dispose__102;
    v111 = 0;
    obj = 0;
    -[SMSuggestionsManager _refreshCurrentLocationWithError:](self, "_refreshCurrentLocationWithError:", &obj);
    objc_storeStrong(&v111, obj);
    if (a4 && *((_QWORD *)v107 + 5))
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v61 = (objc_class *)objc_opt_class();
        NSStringFromClass(v61);
        v62 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = v107[5];
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v62;
        v113 = 2112;
        v114 = v63;
        v115 = 2112;
        v116 = v64;
        _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

      }
      v9 = 0;
      *a4 = objc_retainAutorelease(*((id *)v107 + 5));
      goto LABEL_59;
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMSuggestionsManager distanceCalculator](self, "distanceCalculator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMSuggestionsManager latestLocationOfTheDevice](self, "latestLocationOfTheDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id *)(v107 + 5);
    v104 = (id)*((_QWORD *)v107 + 5);
    objc_msgSend(v10, "distanceFromLocation:toLocation:error:", v11, v7, &v104);
    v14 = v13;
    objc_storeStrong(v12, v104);

    if (a4 && *((_QWORD *)v107 + 5))
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v72 = (objc_class *)objc_opt_class();
        NSStringFromClass(v72);
        v73 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v75 = v107[5];
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v73;
        v113 = 2112;
        v114 = v74;
        v115 = 2112;
        v116 = v75;
        _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

      }
      v9 = 0;
      *a4 = objc_retainAutorelease(*((id *)v107 + 5));
      goto LABEL_58;
    }
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(aSelector);
      v20 = (id)objc_claimAutoreleasedReturnValue();
      -[SMSuggestionsManager latestLocationOfTheDevice](self, "latestLocationOfTheDevice");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413570;
      *(_QWORD *)&buf[4] = v19;
      v113 = 2112;
      v114 = v20;
      v115 = 2048;
      v116 = v14;
      v117 = 2048;
      v118 = 0x407F400000000000;
      v119 = 2112;
      v120 = v21;
      v121 = 2112;
      v122 = v7;
      _os_log_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_INFO, "%@, %@, distanceBetweenCurrentLocationAndNavigationDestination, %.3f, kSMSuggestionProactiveNotificationTearDownDistanceCloseBy, %.3f, latestLocationOfTheDevice, %@, navigationDestination, %@", buf, 0x3Eu);

    }
    if (v14 < 500.0)
    {
      v9 = 1;
LABEL_58:

LABEL_59:
      _Block_object_dispose(&v106, 8);

      goto LABEL_60;
    }
    v22 = objc_alloc(MEMORY[0x1E0D8BA98]);
    v23 = objc_alloc(MEMORY[0x1E0CB3588]);
    objc_msgSend(v91, "dateByAddingTimeInterval:", -600.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v23, "initWithStartDate:endDate:", v24, v91);
    v88 = (void *)objc_msgSend(v22, "initWithBatchSize:fetchLimit:offset:includeSuppressed:sortByCreationDate:ascending:dateInterval:filteredToSuggestionTriggers:filteredToSuggestionUserTypes:filteredToSessionTypes:", *MEMORY[0x1E0D8BD40], 1, *MEMORY[0x1E0D8BD40], 0, 1, 0, v25, 0, 0, 0);

    v98 = 0;
    v99 = &v98;
    v100 = 0x3032000000;
    v101 = __Block_byref_object_copy__102;
    v102 = __Block_byref_object_dispose__102;
    v103 = 0;
    v26 = dispatch_semaphore_create(0);
    -[SMSuggestionsManager suggestionsStore](self, "suggestionsStore");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v94[0] = MEMORY[0x1E0C809B0];
    v94[1] = 3221225472;
    v94[2] = __84__SMSuggestionsManager__deleteProactiveNotificationUponNavigationDestination_error___block_invoke;
    v94[3] = &unk_1E9296EE0;
    v96 = &v98;
    v97 = &v106;
    v28 = v26;
    v95 = v28;
    objc_msgSend(v27, "fetchSuggestionsWithOptions:handler:", v88, v94);

    dsema = v28;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(dsema, v30))
      goto LABEL_26;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "timeIntervalSinceDate:", v29);
    v33 = v32;
    v34 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_607);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "filteredArrayUsingPredicate:", v35);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "firstObject");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v34, "submitToCoreAnalytics:type:duration:", v38, 1, v33);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D1A22000, v39, OS_LOG_TYPE_FAULT, "Invalid parameter not satisfying: authorizationManager", buf, 2u);
    }

    v40 = (void *)MEMORY[0x1E0CB35C8];
    v123[0] = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)buf = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v123, 1);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (v42)
    {
      v43 = objc_retainAutorelease(v42);

    }
    else
    {
LABEL_26:
      v43 = 0;
    }

    v44 = COERCE_DOUBLE(v43);
    if (v44 != 0.0 && a4 != 0)
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        v77 = (objc_class *)objc_opt_class();
        NSStringFromClass(v77);
        v78 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v78;
        v113 = 2112;
        v114 = v79;
        v115 = 2112;
        v116 = v44;
        _os_log_error_impl(&dword_1D1A22000, v46, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

      }
      v9 = 0;
      v47 = v44;
      goto LABEL_56;
    }
    if (a4 && *((_QWORD *)v107 + 5))
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        v80 = (objc_class *)objc_opt_class();
        NSStringFromClass(v80);
        v81 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        v83 = v107[5];
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v81;
        v113 = 2112;
        v114 = v82;
        v115 = 2112;
        v116 = v83;
        _os_log_error_impl(&dword_1D1A22000, v48, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

      }
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
      {
        v50 = (objc_class *)objc_opt_class();
        NSStringFromClass(v50);
        v51 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        v52 = (id)objc_claimAutoreleasedReturnValue();
        *(double *)&v53 = COERCE_DOUBLE(objc_msgSend((id)v99[5], "count"));
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v51;
        v113 = 2112;
        v114 = v52;
        v115 = 2048;
        v116 = *(double *)&v53;
        _os_log_impl(&dword_1D1A22000, v49, OS_LOG_TYPE_INFO, "%@, %@, suggestions count, %lu", buf, 0x20u);

      }
      if (!objc_msgSend((id)v99[5], "count"))
      {
        v9 = 1;
LABEL_57:

        _Block_object_dispose(&v98, 8);
        goto LABEL_58;
      }
      -[SMSuggestionsManager distanceCalculator](self, "distanceCalculator");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v99[5], "firstObject");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "destinationLocation");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = (id *)(v107 + 5);
      v93 = (id)*((_QWORD *)v107 + 5);
      objc_msgSend(v54, "distanceFromLocation:toLocation:error:", v56, v7, &v93);
      v59 = v58;
      objc_storeStrong(v57, v93);

      if (!a4 || !*((_QWORD *)v107 + 5))
      {
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v65 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
        {
          v66 = (objc_class *)objc_opt_class();
          NSStringFromClass(v66);
          v67 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(aSelector);
          v68 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v99[5], "firstObject");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "destinationLocation");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413570;
          *(_QWORD *)&buf[4] = v67;
          v113 = 2112;
          v114 = v68;
          v115 = 2048;
          v116 = v59;
          v117 = 2048;
          v118 = 0x407F400000000000;
          v119 = 2112;
          v120 = v70;
          v121 = 2112;
          v122 = v7;
          _os_log_impl(&dword_1D1A22000, v65, OS_LOG_TYPE_INFO, "%@, %@, distanceBetweenDestinations, %.3f, kSMSuggestionProactiveNotificationTearDownDistanceFromNavigationDestination, %.3f, suggestion location, %@, navigationDestination, %@", buf, 0x3Eu);

        }
        if (v59 <= 500.0)
        {
          v9 = 1;
        }
        else
        {
          v71 = (id *)(v107 + 5);
          v92 = (id)*((_QWORD *)v107 + 5);
          v9 = -[SMSuggestionsManager _deleteProactiveNotificationWithError:](self, "_deleteProactiveNotificationWithError:", &v92);
          objc_storeStrong(v71, v92);
        }
        if (!a4)
          goto LABEL_57;
        goto LABEL_55;
      }
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v60 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      {
        v84 = (objc_class *)objc_opt_class();
        NSStringFromClass(v84);
        v85 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        v87 = v107[5];
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v85;
        v113 = 2112;
        v114 = v86;
        v115 = 2112;
        v116 = v87;
        _os_log_error_impl(&dword_1D1A22000, v60, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

      }
    }
    v9 = 0;
LABEL_55:
    v47 = v107[5];
LABEL_56:
    *a4 = objc_retainAutorelease(*(id *)&v47);
    goto LABEL_57;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: navigationDestination", buf, 2u);
  }

  if (a4)
  {
    _RTErrorInvalidParameterCreate((uint64_t)CFSTR("navigationDestination"));
    v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
LABEL_60:

  return v9;
}

void __84__SMSuggestionsManager__deleteProactiveNotificationUponNavigationDestination_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_updateSafetyMonitorWorkoutSuggestionWidget
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412546;
    v8 = v5;
    v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "%@, %@, Suggestion widget not supported on this platform", (uint8_t *)&v7, 0x16u);

  }
}

- (BOOL)_setupPedometerDataHandler
{
  void *v4;
  NSObject *v5;
  NSObject *v6;
  objc_class *v7;
  char *v8;
  void *v9;
  _QWORD v11[4];
  id v12[2];
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[RTNotifier queue](self, "queue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[SMSuggestionsManager _setupPedometerDataHandler]";
      v15 = 1024;
      LODWORD(v16) = 972;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: self.queue (in %s:%d)", buf, 0x12u);
    }

  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (char *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v14 = v8;
    v15 = 2112;
    v16 = v9;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%@, %@, setting pedometer data handler", buf, 0x16u);

  }
  objc_initWeak((id *)buf, self);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __50__SMSuggestionsManager__setupPedometerDataHandler__block_invoke;
  v11[3] = &unk_1E92A1470;
  objc_copyWeak(v12, (id *)buf);
  v12[1] = (id)a2;
  -[SMSuggestionsManager setPedometerDataHandler:](self, "setPedometerDataHandler:", v11);
  objc_destroyWeak(v12);
  objc_destroyWeak((id *)buf);
  return 1;
}

void __50__SMSuggestionsManager__setupPedometerDataHandler__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  NSObject *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  _QWORD block[5];
  id v17;
  id v18;
  id v19;
  uint64_t v20;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__SMSuggestionsManager__setupPedometerDataHandler__block_invoke_2;
  block[3] = &unk_1E92978E8;
  v12 = *(_QWORD *)(a1 + 40);
  v19 = v9;
  v20 = v12;
  block[4] = WeakRetained;
  v17 = v7;
  v18 = v8;
  v13 = v9;
  v14 = v8;
  v15 = v7;
  dispatch_async(v11, block);

}

void __50__SMSuggestionsManager__setupPedometerDataHandler__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  NSObject *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "dateInterval");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "startDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringFromDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 48);
    v11 = *(_QWORD *)(a1 + 56);
    *(_DWORD *)buf = 138413570;
    v23 = v4;
    v24 = 2112;
    v25 = v5;
    v26 = 2112;
    v27 = v6;
    v28 = 2112;
    v29 = v9;
    v30 = 2112;
    v31 = v10;
    v32 = 2112;
    v33 = v11;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, %@, received pedometer data notification, subscriber UUID, %@, startDate, %@, with data, %@, error, %@", buf, 0x3Eu);

  }
  if (!*(_QWORD *)(a1 + 56))
  {
    if (*(_QWORD *)(a1 + 40))
    {
      if (*(_QWORD *)(a1 + 48))
      {
        objc_msgSend(*(id *)(a1 + 32), "pedometerUUIDs");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", *(_QWORD *)(a1 + 40));

        if (*(_QWORD *)(a1 + 48))
        {
          if (objc_msgSend(*(id *)(a1 + 32), "_isWalkingBoutDetectedByAppendingPedometerData:"))
          {
            v13 = *(void **)(a1 + 32);
            v14 = *(_QWORD *)(a1 + 48);
            v21 = 0;
            objc_msgSend(v13, "_runProactiveSuggestionsEngineWithContext:shouldStoreSuggestions:error:", v14, 1, &v21);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = v21;
            _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              v18 = (objc_class *)objc_opt_class();
              NSStringFromClass(v18);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(*(SEL *)(a1 + 64));
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413058;
              v23 = v19;
              v24 = 2112;
              v25 = v20;
              v26 = 2112;
              v27 = v15;
              v28 = 2112;
              v29 = v16;
              _os_log_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_INFO, "%@, %@, suggestion from suggestions engine, %@, error, %@", buf, 0x2Au);

            }
          }
        }
      }
    }
  }
}

- (BOOL)_setupPedometerNotificationsIfExists:(id *)a3
{
  void *v6;
  void *v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  _BOOL4 v13;
  id v14;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  const __CFString *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  -[SMSuggestionsManager defaultsManager](self, "defaultsManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("RTDefaultsSuggestionLastDateWalkingBoutTriggerIsScheduled"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringFromDate");
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v24 = v10;
    v25 = 2112;
    v26 = (uint64_t)v11;
    v27 = 2112;
    v28 = v12;
    _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "%@, %@, walkingBoutTriggerScheduledDate, %@,", buf, 0x20u);

  }
  v22 = 0;
  v13 = -[SMSuggestionsManager _reRegisterForPedometerNotificationsForLearnedLocationOfInterest:startDate:error:](self, "_reRegisterForPedometerNotificationsForLearnedLocationOfInterest:startDate:error:", 0, v7, &v22);
  v14 = v22;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v18;
    v20 = CFSTR("NO");
    *(_DWORD *)buf = 138413058;
    v24 = v17;
    if (v13)
      v20 = CFSTR("YES");
    v25 = 2112;
    v26 = v18;
    v27 = 2112;
    v28 = v20;
    v29 = 2112;
    v30 = v14;
    _os_log_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_INFO, "%@, %@, status, %@, error, %@", buf, 0x2Au);

  }
  if (a3)
    *a3 = objc_retainAutorelease(v14);

  return v13;
}

- (BOOL)_reRegisterForPedometerNotificationsForLearnedLocationOfInterest:(id)a3 startDate:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  id v17;
  void *v18;
  NSObject *v19;
  id v20;
  objc_class *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringFromDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v28 = v13;
    v29 = 2112;
    v30 = v14;
    v31 = 2112;
    v32 = v15;
    v33 = 2112;
    v34 = v9;
    _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "%@, %@, reRegistering for pedometer data, startDate, %@, locationOfInterest, %@", buf, 0x2Au);

  }
  v26 = 0;
  v16 = -[SMSuggestionsManager _unregisterForPedometerNotificationsWithError:](self, "_unregisterForPedometerNotificationsWithError:", &v26);
  v17 = v26;
  v18 = v17;
  if (a5 && v17)
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v28 = v23;
      v29 = 2112;
      v30 = v24;
      v31 = 2112;
      v32 = v18;
      _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

    }
    goto LABEL_9;
  }
  v25 = v17;
  v16 = -[SMSuggestionsManager _registerForPedometerNotificationsForLearnedLocationOfInterest:startDate:error:](self, "_registerForPedometerNotificationsForLearnedLocationOfInterest:startDate:error:", v9, v10, &v25);
  v20 = v25;

  v18 = v20;
  if (a5)
  {
LABEL_9:
    v20 = objc_retainAutorelease(v18);
    *a5 = v20;
  }

  return v16;
}

- (BOOL)_registerForPedometerNotificationsForLearnedLocationOfInterest:(id)a3 startDate:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  _BOOL4 v10;
  NSObject *v11;
  _BOOL4 v12;
  objc_class *v13;
  void *v14;
  void *v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void *v17;
  void *v18;
  void *v19;
  RTXPCTimerAlarm *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  RTXPCTimerAlarm *v25;
  void *v26;
  int v27;
  id v28;
  NSObject *v29;
  objc_class *v30;
  id v31;
  id v32;
  uint64_t v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  BOOL v37;
  NSObject *v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  uint64_t (*v40)(uint64_t, uint64_t);
  NSObject *v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  objc_class *v43;
  void *v44;
  void *v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  NSObject *v47;
  objc_class *v48;
  void *v49;
  void *v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void *v52;
  dispatch_semaphore_t v53;
  void *v54;
  void *v55;
  NSObject *v56;
  NSObject *v57;
  void *v58;
  dispatch_time_t v59;
  void *v60;
  double v61;
  double v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  NSObject *v68;
  void *v69;
  void *v70;
  id v71;
  id v72;
  _BOOL4 v73;
  NSObject *v74;
  id v75;
  NSObject *v76;
  char v77;
  objc_class *v79;
  void *v80;
  void *v81;
  objc_class *v82;
  id v83;
  void *v84;
  objc_class *v85;
  id v86;
  void *v87;
  id v88;
  uint64_t (*v89)(uint64_t, uint64_t);
  void *v91;
  id v93;
  _QWORD v94[4];
  id v95;
  id v96[2];
  _QWORD v97[4];
  NSObject *v98;
  _BYTE *v99;
  id *v100;
  id location;
  id *p_location;
  uint64_t v103;
  uint64_t (*v104)(uint64_t, uint64_t);
  void (*v105)(uint64_t);
  id v106;
  id v107;
  _BYTE buf[24];
  uint64_t (*v109)(uint64_t, uint64_t);
  _BYTE v110[20];
  _BYTE v111[12];
  __int16 v112;
  void *v113;
  __int16 v114;
  id v115;
  _QWORD v116[4];

  v116[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v91 = v7;
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v38, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: startDate", buf, 2u);
    }

    if (a5)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("startDate"));
      v37 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_52;
    }
LABEL_51:
    v37 = 0;
    goto LABEL_52;
  }
  -[SMSuggestionsManager _resetStatesForPedometerData](self, "_resetStatesForPedometerData");
  if (v7)
  {
    -[SMSuggestionsManager setCurrentLOI:](self, "setCurrentLOI:", v7);
    goto LABEL_4;
  }
  v107 = 0;
  -[SMSuggestionsManager _refreshCurrentLocationWithError:](self, "_refreshCurrentLocationWithError:", &v107);
  v39 = (uint64_t (*)(uint64_t, uint64_t))v107;
  if (a5 && v39)
  {
    v40 = v39;
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      v79 = (objc_class *)objc_opt_class();
      NSStringFromClass(v79);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v80;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v81;
      *(_WORD *)&buf[22] = 2112;
      v109 = v40;
      _os_log_error_impl(&dword_1D1A22000, v41, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

    }
    v42 = objc_retainAutorelease(v40);
    *a5 = v42;

    goto LABEL_51;
  }
  v89 = v39;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v47 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
  {
    v48 = (objc_class *)objc_opt_class();
    NSStringFromClass(v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringFromDate", v89);
    v51 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    -[SMSuggestionsManager latestLocationOfTheDevice](self, "latestLocationOfTheDevice");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)&buf[4] = v49;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v50;
    *(_WORD *)&buf[22] = 2112;
    v109 = v51;
    *(_WORD *)v110 = 2112;
    *(_QWORD *)&v110[2] = v52;
    _os_log_impl(&dword_1D1A22000, v47, OS_LOG_TYPE_INFO, "%@, %@, registering for pedometer notifications using startDate, %@, location, %@", buf, 0x2Au);

  }
  v53 = dispatch_semaphore_create(0);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v109 = __Block_byref_object_copy__102;
  *(_QWORD *)v110 = __Block_byref_object_dispose__102;
  *(_QWORD *)&v110[8] = 0;
  location = 0;
  p_location = &location;
  v103 = 0x3032000000;
  v104 = __Block_byref_object_copy__102;
  v105 = __Block_byref_object_dispose__102;
  v106 = 0;
  -[SMSuggestionsManager learnedLocationManager](self, "learnedLocationManager");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSuggestionsManager latestLocationOfTheDevice](self, "latestLocationOfTheDevice");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v97[0] = MEMORY[0x1E0C809B0];
  v97[1] = 3221225472;
  v97[2] = __103__SMSuggestionsManager__registerForPedometerNotificationsForLearnedLocationOfInterest_startDate_error___block_invoke;
  v97[3] = &unk_1E9297478;
  v99 = buf;
  v100 = &location;
  v56 = v53;
  v98 = v56;
  objc_msgSend(v54, "fetchLocationOfInterestAtLocation:handler:", v55, v97);

  v57 = v56;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = dispatch_time(0, 3600000000000);
  if (dispatch_semaphore_wait(v57, v59))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "timeIntervalSinceDate:", v58);
    v62 = v61;
    v63 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_607);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "filteredArrayUsingPredicate:", v64);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "firstObject");
    v67 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v63, "submitToCoreAnalytics:type:duration:", v67, 1, v62);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v68 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v111 = 0;
      _os_log_fault_impl(&dword_1D1A22000, v68, OS_LOG_TYPE_FAULT, "Invalid parameter not satisfying: authorizationManager", v111, 2u);
    }

    v69 = (void *)MEMORY[0x1E0CB35C8];
    v116[0] = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)v111 = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v111, v116, 1);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v70);
    v71 = (id)objc_claimAutoreleasedReturnValue();

    if (v71)
    {
      v71 = objc_retainAutorelease(v71);

    }
  }
  else
  {
    v71 = 0;
  }

  v72 = v71;
  if (v72)
    v73 = a5 != 0;
  else
    v73 = 0;
  if (v73)
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v74 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
    {
      v82 = (objc_class *)objc_opt_class();
      NSStringFromClass(v82);
      v83 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v111 = 138412802;
      *(_QWORD *)&v111[4] = v83;
      v112 = 2112;
      v113 = v84;
      v114 = 2112;
      v115 = v72;
      _os_log_error_impl(&dword_1D1A22000, v74, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v111, 0x20u);

    }
    v75 = v72;
LABEL_48:
    v77 = 0;
    *a5 = objc_retainAutorelease(v75);
    goto LABEL_50;
  }
  if (a5 && p_location[5])
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v76 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
    {
      v85 = (objc_class *)objc_opt_class();
      NSStringFromClass(v85);
      v86 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      v88 = p_location[5];
      *(_DWORD *)v111 = 138412802;
      *(_QWORD *)&v111[4] = v86;
      v112 = 2112;
      v113 = v87;
      v114 = 2112;
      v115 = v88;
      _os_log_error_impl(&dword_1D1A22000, v76, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v111, 0x20u);

    }
    v75 = p_location[5];
    goto LABEL_48;
  }
  -[SMSuggestionsManager setCurrentLOI:](self, "setCurrentLOI:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40), v89);
  v77 = 1;
LABEL_50:

  _Block_object_dispose(&location, 8);
  _Block_object_dispose(buf, 8);

  if ((v77 & 1) == 0)
    goto LABEL_51;
LABEL_4:
  -[SMSuggestionsManager currentLOI](self, "currentLOI", v89);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9 == 0;

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
  if (v10)
  {
    if (v12)
    {
      v43 = (objc_class *)objc_opt_class();
      NSStringFromClass(v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMSuggestionsManager latestLocationOfTheDevice](self, "latestLocationOfTheDevice");
      v46 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v44;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v45;
      *(_WORD *)&buf[22] = 2112;
      v109 = v46;
      _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "%@, %@, no corresponding LOI at this location, %@", buf, 0x20u);

    }
    goto LABEL_51;
  }
  if (v12)
  {
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringFromDate");
    v16 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    -[SMSuggestionsManager currentLOI](self, "currentLOI");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)&buf[4] = v14;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v15;
    *(_WORD *)&buf[22] = 2112;
    v109 = v16;
    *(_WORD *)v110 = 2112;
    *(_QWORD *)&v110[2] = v17;
    _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "%@, %@, registering for pedometer data, startDate, %@, current LOI, %@", buf, 0x2Au);

  }
  -[SMSuggestionsManager _logStatesForPedometerData](self, "_logStatesForPedometerData");
  -[SMSuggestionsManager walkingTriggerAlarm](self, "walkingTriggerAlarm");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[SMSuggestionsManager walkingTriggerAlarm](self, "walkingTriggerAlarm");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "invalidate");

  }
  objc_initWeak(&location, self);
  v20 = [RTXPCTimerAlarm alloc];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "UUIDString");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTNotifier queue](self, "queue");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v94[0] = MEMORY[0x1E0C809B0];
  v94[1] = 3221225472;
  v94[2] = __103__SMSuggestionsManager__registerForPedometerNotificationsForLearnedLocationOfInterest_startDate_error___block_invoke_93;
  v94[3] = &unk_1E92A1498;
  objc_copyWeak(v96, &location);
  v24 = v8;
  v95 = v24;
  v96[1] = (id)a2;
  v25 = -[RTXPCTimerAlarm initWithIdentifier:queue:handler:](v20, "initWithIdentifier:queue:handler:", v22, v23, v94);
  -[SMSuggestionsManager setWalkingTriggerAlarm:](self, "setWalkingTriggerAlarm:", v25);

  -[SMSuggestionsManager walkingTriggerAlarm](self, "walkingTriggerAlarm");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = 0;
  v27 = objc_msgSend(v26, "fireWithDate:error:", v24, &v93);
  v28 = v93;

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    v30 = (objc_class *)objc_opt_class();
    NSStringFromClass(v30);
    v31 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v32 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stringFromDate");
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = (void *)v33;
    v35 = CFSTR("NO");
    *(_DWORD *)buf = 138413314;
    *(_QWORD *)&buf[4] = v31;
    *(_WORD *)&buf[12] = 2112;
    if (v27)
      v35 = CFSTR("YES");
    *(_QWORD *)&buf[14] = v32;
    *(_WORD *)&buf[22] = 2112;
    v109 = (uint64_t (*)(uint64_t, uint64_t))v33;
    *(_WORD *)v110 = 2112;
    *(_QWORD *)&v110[2] = v35;
    *(_WORD *)&v110[10] = 2112;
    *(_QWORD *)&v110[12] = v28;
    _os_log_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_INFO, "%@, %@, timer set for pedometer notifications to fire at startDate, %@, status, %@, error, %@", buf, 0x34u);

  }
  -[SMSuggestionsManager defaultsManager](self, "defaultsManager");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setObject:forKey:", v24, CFSTR("RTDefaultsSuggestionLastDateWalkingBoutTriggerIsScheduled"));

  if (a5)
    *a5 = objc_retainAutorelease(v28);
  v37 = v28 == 0;

  objc_destroyWeak(v96);
  objc_destroyWeak(&location);
LABEL_52:

  return v37;
}

void __103__SMSuggestionsManager__registerForPedometerNotificationsForLearnedLocationOfInterest_startDate_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __103__SMSuggestionsManager__registerForPedometerNotificationsForLearnedLocationOfInterest_startDate_error___block_invoke_93(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "motionActivityManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(WeakRetained, "pedometerDataHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subscribeForPedometerDataWithStartDate:handler:", v4, v5);

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "stringFromDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412802;
    v12 = v8;
    v13 = 2112;
    v14 = v9;
    v15 = 2112;
    v16 = v10;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%@, %@, added walking trigger, startDate, %@", (uint8_t *)&v11, 0x20u);

  }
}

- (BOOL)_unregisterForPedometerNotificationsWithError:(id *)a3
{
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMSuggestionsManager pedometerUUIDs](self, "pedometerUUIDs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v27 = v7;
    v28 = 2112;
    v29 = v8;
    v30 = 2112;
    v31 = v9;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%@, %@, unregistering for pedometer data for pedometer uuids, %@", buf, 0x20u);

  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[SMSuggestionsManager pedometerUUIDs](self, "pedometerUUIDs", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v22;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v22 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v14);
        v16 = (void *)MEMORY[0x1D8231EA8]();
        -[SMSuggestionsManager motionActivityManager](self, "motionActivityManager");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "unsubscribeForPedometerData:", v15);

        objc_autoreleasePoolPop(v16);
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v12);
  }

  -[SMSuggestionsManager _resetStatesForPedometerData](self, "_resetStatesForPedometerData");
  -[SMSuggestionsManager defaultsManager](self, "defaultsManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKey:", v19, CFSTR("RTDefaultsSuggestionLastDateWalkingBoutTriggerIsScheduled"));

  return 1;
}

- (BOOL)_resetStatesForPedometerData
{
  void *v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[SMSuggestionsManager setCurrentLOI:](self, "setCurrentLOI:", 0);
  -[SMSuggestionsManager setPreviousPedometerData:](self, "setPreviousPedometerData:", 0);
  v4 = (void *)objc_opt_new();
  -[SMSuggestionsManager setPedometerUUIDs:](self, "setPedometerUUIDs:", v4);

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412546;
    v11 = v7;
    v12 = 2112;
    v13 = v8;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%@, %@, reset states for pedometer data", (uint8_t *)&v10, 0x16u);

  }
  -[SMSuggestionsManager _logStatesForPedometerData](self, "_logStatesForPedometerData");
  return 1;
}

- (void)_logStatesForPedometerData
{
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMSuggestionsManager currentLOI](self, "currentLOI");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMSuggestionsManager previousPedometerData](self, "previousPedometerData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138413058;
    v11 = v6;
    v12 = 2112;
    v13 = v7;
    v14 = 2112;
    v15 = v8;
    v16 = 2112;
    v17 = v9;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "%@, %@, states for pedometer data, currentLOI, %@, previousPedometerDataEndDate, %@,", (uint8_t *)&v10, 0x2Au);

  }
}

- (BOOL)_isWalkingBoutDetectedByAppendingPedometerData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  NSObject *v33;
  void *v34;
  void *v35;
  id v36;
  NSObject *v37;
  uint64_t v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  uint64_t v45;
  void *v46;
  double v47;
  double v48;
  BOOL v49;
  objc_class *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  objc_class *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  id v67;
  id v69;
  uint8_t buf[4];
  void *v71;
  __int16 v72;
  void *v73;
  __int16 v74;
  void *v75;
  __int16 v76;
  uint64_t v77;
  __int16 v78;
  uint64_t v79;
  __int16 v80;
  void *v81;
  __int16 v82;
  uint64_t v83;
  __int16 v84;
  uint64_t v85;
  __int16 v86;
  uint64_t v87;
  __int16 v88;
  double v89;
  __int16 v90;
  id v91;
  __int16 v92;
  void *v93;
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SMSuggestionsManager currentLOI](self, "currentLOI");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "location");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "location");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "horizontalUncertainty");
  v9 = v8 * 2.0 + 40.0;

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dateInterval");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "startDate");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "stringFromDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMSuggestionsManager previousPedometerData](self, "previousPedometerData");
    v66 = v4;
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMSuggestionsManager currentLOI](self, "currentLOI");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "location");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "location");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "horizontalUncertainty");
    v20 = v19;
    -[SMSuggestionsManager currentLOI](self, "currentLOI");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138415106;
    v71 = v12;
    v72 = 2112;
    v73 = v13;
    v74 = 2112;
    v75 = v14;
    v76 = 2048;
    v77 = 0x4044000000000000;
    v78 = 2048;
    v79 = 0x4000000000000000;
    v80 = 2112;
    v81 = v15;
    v82 = 2048;
    v83 = v20;
    v84 = 2048;
    v85 = 0x4000000000000000;
    v86 = 2048;
    v87 = 0x4044000000000000;
    v88 = 2048;
    v89 = v9;
    v90 = 2112;
    v91 = v66;
    v92 = 2112;
    v93 = v21;
    _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "%@, %@, startDate, %@, kSMWalkingBoutMaxBreakTime, %.3f, kSMWalkingBoutMultiplierForLOIUncertainty, %.3f, previousPedometerData, %@, loi uncertainty, %.3f, multiplier, %.3f, sigma, %.3f, threshold, %.3f, pedometerData, %@, currentLOI, %@", buf, 0x7Au);

    v4 = v66;
  }

  -[SMSuggestionsManager previousPedometerData](self, "previousPedometerData");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "dateInterval");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "endDate");
  v24 = objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    v25 = (void *)v24;
    objc_msgSend(v4, "dateInterval");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "endDate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMSuggestionsManager previousPedometerData](self, "previousPedometerData");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "dateInterval");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "endDate");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "timeIntervalSinceDate:", v30);
    v32 = v31;

    if (v32 > 40.0)
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        v51 = (objc_class *)objc_opt_class();
        NSStringFromClass(v51);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "dateInterval");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "startDate");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "stringFromDate");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "dateInterval");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "endDate");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "stringFromDate");
        v67 = v4;
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v71 = v52;
        v72 = 2112;
        v73 = v53;
        v74 = 2112;
        v75 = v56;
        v76 = 2112;
        v77 = (uint64_t)v59;
        _os_log_error_impl(&dword_1D1A22000, v33, OS_LOG_TYPE_ERROR, "%@, %@, max gap threshold exceeded for pedometer data, startDate, %@, endDate, %@", buf, 0x2Au);

        v4 = v67;
      }

      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMSuggestionsManager currentLOI](self, "currentLOI");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = 0;
      -[SMSuggestionsManager _reRegisterForPedometerNotificationsForLearnedLocationOfInterest:startDate:error:](self, "_reRegisterForPedometerNotificationsForLearnedLocationOfInterest:startDate:error:", v35, v34, &v69);
      v36 = v69;

      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        v60 = (objc_class *)objc_opt_class();
        NSStringFromClass(v60);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "stringFromDate");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v71 = v61;
        v72 = 2112;
        v73 = v62;
        v74 = 2112;
        v75 = v63;
        v76 = 2112;
        v77 = (uint64_t)v36;
        _os_log_error_impl(&dword_1D1A22000, v37, OS_LOG_TYPE_ERROR, "%@, %@, reRegistered again for pedometer data, startDate, %@, error, %@", buf, 0x2Au);

      }
LABEL_17:
      v49 = 0;
      goto LABEL_18;
    }
  }
  else
  {

  }
  -[SMSuggestionsManager previousPedometerData](self, "previousPedometerData");
  v38 = objc_claimAutoreleasedReturnValue();
  if (!v38)
    goto LABEL_13;
  v39 = (void *)v38;
  objc_msgSend(v4, "distance");
  v41 = v40;
  -[SMSuggestionsManager previousPedometerData](self, "previousPedometerData");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "distance");
  v44 = v43;

  if (v41 != v44)
LABEL_13:
    -[SMSuggestionsManager setPreviousPedometerData:](self, "setPreviousPedometerData:", v4);
  -[SMSuggestionsManager currentLOI](self, "currentLOI");
  v45 = objc_claimAutoreleasedReturnValue();
  if (!v45)
    goto LABEL_17;
  v46 = (void *)v45;
  objc_msgSend(v4, "distance");
  v48 = v47;

  if (v48 <= v9)
    goto LABEL_17;
  v49 = 1;
LABEL_18:

  return v49;
}

- (void)runProactiveSuggestionsEngineWithContext:(id)a3 shouldStoreSuggestions:(BOOL)a4 handler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  BOOL v16;

  v8 = a3;
  v9 = a5;
  -[RTNotifier queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __96__SMSuggestionsManager_runProactiveSuggestionsEngineWithContext_shouldStoreSuggestions_handler___block_invoke;
  v13[3] = &unk_1E92970B0;
  v13[4] = self;
  v14 = v8;
  v16 = a4;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

void __96__SMSuggestionsManager_runProactiveSuggestionsEngineWithContext_shouldStoreSuggestions_handler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(unsigned __int8 *)(a1 + 56);
  v9 = 0;
  objc_msgSend(v2, "_runProactiveSuggestionsEngineWithContext:shouldStoreSuggestions:error:", v3, v4, &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v9;
  v7 = *(_QWORD *)(a1 + 48);
  if (v5)
  {
    v10[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, id))(v7 + 16))(v7, v8, v6);

  }
  else
  {
    (*(void (**)(uint64_t, _QWORD, id))(v7 + 16))(v7, MEMORY[0x1E0C9AA60], v6);
  }

}

- (id)_runProactiveSuggestionsEngineWithContext:(id)a3 shouldStoreSuggestions:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v9;
  unint64_t v10;
  NSObject *v11;
  id v12;
  id *v13;
  BOOL v14;
  NSObject *v15;
  __CFString *v16;
  __CFString *v17;
  NSObject *v18;
  id *v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  objc_class *v23;
  id v24;
  void *v25;
  NSObject *v26;
  objc_class *v27;
  id v28;
  void *v29;
  id *v31;
  unint64_t v32;
  NSObject *v33;
  NSObject *v34;
  objc_class *v35;
  id v36;
  id v37;
  int v38;
  const __CFString *v39;
  dispatch_semaphore_t v40;
  void *v41;
  void *v42;
  NSObject *v43;
  NSObject *v44;
  dispatch_time_t v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  NSObject *v56;
  objc_class *v57;
  id v58;
  void *v59;
  objc_class *v60;
  id v61;
  void *v62;
  const __CFString *v63;
  objc_class *v64;
  id v65;
  void *v66;
  const __CFString *v67;
  _BOOL4 v68;
  __CFString *v69;
  NSObject *v70;
  int v71;
  NSObject *v72;
  _BOOL4 v73;
  objc_class *v74;
  id v75;
  void *v76;
  objc_class *v77;
  id v78;
  void *v79;
  id *v80;
  _BOOL4 v81;
  objc_class *v82;
  id v83;
  uint64_t v84;
  void *v85;
  const __CFString *v86;
  objc_class *v87;
  id v88;
  void *v89;
  const __CFString *v90;
  objc_class *v91;
  id v92;
  void *v93;
  const __CFString *v94;
  objc_class *v95;
  uint64_t v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  id v102;
  id v103;
  _QWORD v104[4];
  NSObject *v105;
  uint8_t *v106;
  id v107;
  id v108;
  id v109;
  id obj;
  uint8_t v111[8];
  uint8_t *v112;
  uint64_t v113;
  uint64_t (*v114)(uint64_t, uint64_t);
  void (*v115)(uint64_t);
  id v116;
  __CFString *v117;
  _BYTE buf[12];
  __int16 v119;
  uint64_t v120;
  __int16 v121;
  const __CFString *v122;
  _QWORD v123[4];

  v6 = a4;
  v123[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if (v9)
  {
    *(_QWORD *)v111 = 0;
    v112 = v111;
    v113 = 0x3032000000;
    v114 = __Block_byref_object_copy__102;
    v115 = __Block_byref_object_dispose__102;
    v116 = 0;
    obj = 0;
    v10 = -[SMSuggestionsManager _getSuggestionTriggerFromContext:error:](self, "_getSuggestionTriggerFromContext:error:", v9, &obj);
    objc_storeStrong(&v116, obj);
    if (a5 && *((_QWORD *)v112 + 5))
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v60 = (objc_class *)objc_opt_class();
        NSStringFromClass(v60);
        v61 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = (const __CFString *)*((_QWORD *)v112 + 5);
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v61;
        v119 = 2112;
        v120 = (uint64_t)v62;
        v121 = 2112;
        v122 = v63;
        _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

      }
      v12 = objc_retainAutorelease(*((id *)v112 + 5));
LABEL_13:
      v16 = 0;
      v17 = 0;
      *a5 = v12;
LABEL_32:

      _Block_object_dispose(v111, 8);
      goto LABEL_33;
    }
    if (v10)
    {
      v13 = (id *)(v112 + 40);
      v109 = (id)*((_QWORD *)v112 + 5);
      v14 = -[SMSuggestionsManager _checkInitiatorEligibilityWithError:](self, "_checkInitiatorEligibilityWithError:", &v109);
      objc_storeStrong(v13, v109);
      if (a5 && *((_QWORD *)v112 + 5))
      {
        _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          v64 = (objc_class *)objc_opt_class();
          NSStringFromClass(v64);
          v65 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          v67 = (const __CFString *)*((_QWORD *)v112 + 5);
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)&buf[4] = v65;
          v119 = 2112;
          v120 = (uint64_t)v66;
          v121 = 2112;
          v122 = v67;
          _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

        }
        v12 = objc_retainAutorelease(*((id *)v112 + 5));
        goto LABEL_13;
      }
      if (v14)
      {
        v19 = (id *)(v112 + 40);
        v108 = (id)*((_QWORD *)v112 + 5);
        -[SMSuggestionsManager _generatePersonalizedSuggestionFromContext:error:](self, "_generatePersonalizedSuggestionFromContext:error:", v9, &v108);
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_storeStrong(v19, v108);
        if (a5 && *((_QWORD *)v112 + 5))
        {
          _rt_log_facility_get_os_log(RTLogFacilityWorkout);
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            v87 = (objc_class *)objc_opt_class();
            NSStringFromClass(v87);
            v88 = (id)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            v90 = (const __CFString *)*((_QWORD *)v112 + 5);
            *(_DWORD *)buf = 138412802;
            *(_QWORD *)&buf[4] = v88;
            v119 = 2112;
            v120 = (uint64_t)v89;
            v121 = 2112;
            v122 = v90;
            _os_log_error_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

          }
          v21 = objc_retainAutorelease(*((id *)v112 + 5));
          goto LABEL_73;
        }
        if (v16)
        {
          v31 = (id *)(v112 + 40);
          v107 = (id)*((_QWORD *)v112 + 5);
          v32 = -[SMSuggestionsManager _suppressSuggestion:context:error:](self, "_suppressSuggestion:context:error:", v16, v9, &v107);
          objc_storeStrong(v31, v107);
          if (a5 && *((_QWORD *)v112 + 5))
          {
            _rt_log_facility_get_os_log(RTLogFacilityWorkout);
            v33 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            {
              v91 = (objc_class *)objc_opt_class();
              NSStringFromClass(v91);
              v92 = (id)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              v93 = (void *)objc_claimAutoreleasedReturnValue();
              v94 = (const __CFString *)*((_QWORD *)v112 + 5);
              *(_DWORD *)buf = 138412802;
              *(_QWORD *)&buf[4] = v92;
              v119 = 2112;
              v120 = (uint64_t)v93;
              v121 = 2112;
              v122 = v94;
              _os_log_error_impl(&dword_1D1A22000, v33, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

            }
            v21 = objc_retainAutorelease(*((id *)v112 + 5));
          }
          else
          {
            -[__CFString setSuppressionReason:](v16, "setSuppressionReason:", v32);
            _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
            v34 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
            {
              v35 = (objc_class *)objc_opt_class();
              NSStringFromClass(v35);
              v36 = (id)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              v37 = (id)objc_claimAutoreleasedReturnValue();
              v38 = -[__CFString isSuppressed](v16, "isSuppressed");
              v39 = CFSTR("NO");
              *(_DWORD *)buf = 138412802;
              *(_QWORD *)&buf[4] = v36;
              v119 = 2112;
              if (v38)
                v39 = CFSTR("YES");
              v120 = (uint64_t)v37;
              v121 = 2112;
              v122 = v39;
              _os_log_impl(&dword_1D1A22000, v34, OS_LOG_TYPE_INFO, "%@, %@, is suggestion suppressed, %@", buf, 0x20u);

            }
            if (v6)
            {
              v40 = dispatch_semaphore_create(0);
              -[SMSuggestionsManager suggestionsStore](self, "suggestionsStore");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              v117 = v16;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v117, 1);
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              v104[0] = MEMORY[0x1E0C809B0];
              v104[1] = 3221225472;
              v104[2] = __95__SMSuggestionsManager__runProactiveSuggestionsEngineWithContext_shouldStoreSuggestions_error___block_invoke;
              v104[3] = &unk_1E9297038;
              v106 = v111;
              v43 = v40;
              v105 = v43;
              objc_msgSend(v41, "storeSuggestions:handler:", v42, v104);

              v44 = v43;
              objc_msgSend(MEMORY[0x1E0C99D68], "now");
              v101 = (void *)objc_claimAutoreleasedReturnValue();
              v45 = dispatch_time(0, 3600000000000);
              if (!dispatch_semaphore_wait(v44, v45))
                goto LABEL_53;
              objc_msgSend(MEMORY[0x1E0C99D68], "now");
              v99 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v99, "timeIntervalSinceDate:", v101);
              v47 = v46;
              v97 = (void *)objc_opt_new();
              objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_607);
              v98 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "filteredArrayUsingPredicate:", v98);
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v49, "firstObject");
              v50 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v97, "submitToCoreAnalytics:type:duration:", v50, 1, v47);
              _rt_log_facility_get_os_log(RTLogFacilityGeneral);
              v51 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_fault_impl(&dword_1D1A22000, v51, OS_LOG_TYPE_FAULT, "Invalid parameter not satisfying: authorizationManager", buf, 2u);
              }

              v52 = (void *)MEMORY[0x1E0CB35C8];
              v123[0] = *MEMORY[0x1E0CB2D50];
              *(_QWORD *)buf = CFSTR("semaphore wait timeout");
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v123, 1);
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v52, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v53);
              v54 = (void *)objc_claimAutoreleasedReturnValue();

              if (v54)
              {
                v55 = objc_retainAutorelease(v54);

              }
              else
              {
LABEL_53:
                v55 = 0;
              }
              v68 = a5 == 0;

              v69 = (__CFString *)v55;
              if (!v69)
                v68 = 1;
              if (v68)
              {
                v17 = 0;
              }
              else
              {
                _rt_log_facility_get_os_log(RTLogFacilityWorkout);
                v70 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
                {
                  v95 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v95);
                  v102 = (id)objc_claimAutoreleasedReturnValue();
                  NSStringFromSelector(a2);
                  v96 = objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412802;
                  *(_QWORD *)&buf[4] = v102;
                  v119 = 2112;
                  v100 = (void *)v96;
                  v120 = v96;
                  v121 = 2112;
                  v122 = v69;
                  _os_log_error_impl(&dword_1D1A22000, v70, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

                }
                *a5 = objc_retainAutorelease(v69);
                v17 = v16;
              }

              if (!v68)
                goto LABEL_32;
            }
            v71 = -[__CFString isSuppressed](v16, "isSuppressed");
            _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
            v72 = objc_claimAutoreleasedReturnValue();
            v73 = os_log_type_enabled(v72, OS_LOG_TYPE_INFO);
            if (v71)
            {
              if (v73)
              {
                v74 = (objc_class *)objc_opt_class();
                NSStringFromClass(v74);
                v75 = (id)objc_claimAutoreleasedReturnValue();
                NSStringFromSelector(a2);
                v76 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412802;
                *(_QWORD *)&buf[4] = v75;
                v119 = 2112;
                v120 = (uint64_t)v76;
                v121 = 2112;
                v122 = v16;
                _os_log_impl(&dword_1D1A22000, v72, OS_LOG_TYPE_INFO, "%@, %@, suggestion is not displayed because it is suppressed, %@", buf, 0x20u);

              }
            }
            else
            {
              if (v73)
              {
                v77 = (objc_class *)objc_opt_class();
                NSStringFromClass(v77);
                v78 = (id)objc_claimAutoreleasedReturnValue();
                NSStringFromSelector(a2);
                v79 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412802;
                *(_QWORD *)&buf[4] = v78;
                v119 = 2112;
                v120 = (uint64_t)v79;
                v121 = 2112;
                v122 = v16;
                _os_log_impl(&dword_1D1A22000, v72, OS_LOG_TYPE_INFO, "%@, %@, displaying suggestion, %@", buf, 0x20u);

              }
              v80 = (id *)(v112 + 40);
              v103 = (id)*((_QWORD *)v112 + 5);
              v81 = -[SMSuggestionsManager _showSuggestionsDetectionUIWithSuggestion:error:](self, "_showSuggestionsDetectionUIWithSuggestion:error:", v16, &v103);
              objc_storeStrong(v80, v103);
              _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
              v72 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
              {
                v82 = (objc_class *)objc_opt_class();
                NSStringFromClass(v82);
                v83 = (id)objc_claimAutoreleasedReturnValue();
                NSStringFromSelector(a2);
                v84 = objc_claimAutoreleasedReturnValue();
                v85 = (void *)v84;
                v86 = CFSTR("NO");
                *(_DWORD *)buf = 138412802;
                *(_QWORD *)&buf[4] = v83;
                v119 = 2112;
                if (v81)
                  v86 = CFSTR("YES");
                v120 = v84;
                v121 = 2112;
                v122 = v86;
                _os_log_impl(&dword_1D1A22000, v72, OS_LOG_TYPE_INFO, "%@, %@, displaying suggestion status, %@", buf, 0x20u);

              }
            }

            if (!a5)
              goto LABEL_74;
            v21 = objc_retainAutorelease(*((id *)v112 + 5));
          }
LABEL_73:
          *a5 = v21;
LABEL_74:
          v16 = v16;
          v17 = v16;
          goto LABEL_32;
        }
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v56 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
        {
          v57 = (objc_class *)objc_opt_class();
          NSStringFromClass(v57);
          v58 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v58;
          v119 = 2112;
          v120 = (uint64_t)v59;
          _os_log_impl(&dword_1D1A22000, v56, OS_LOG_TYPE_INFO, "%@, %@, No Suggestion created!", buf, 0x16u);

        }
      }
      else
      {
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          v27 = (objc_class *)objc_opt_class();
          NSStringFromClass(v27);
          v28 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v28;
          v119 = 2112;
          v120 = (uint64_t)v29;
          _os_log_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_INFO, "%@, %@, initiator is not eligible, skipping suggestions engine", buf, 0x16u);

        }
      }
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        v23 = (objc_class *)objc_opt_class();
        NSStringFromClass(v23);
        v24 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v24;
        v119 = 2112;
        v120 = (uint64_t)v25;
        _os_log_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_INFO, "%@, %@, no valid triggers found", buf, 0x16u);

      }
    }
    v16 = 0;
    v17 = 0;
    goto LABEL_32;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v111 = 0;
    _os_log_error_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", v111, 2u);
  }

  if (a5)
  {
    _RTErrorInvalidParameterCreate((uint64_t)CFSTR("context"));
    v17 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }
LABEL_33:

  return v17;
}

void __95__SMSuggestionsManager__runProactiveSuggestionsEngineWithContext_shouldStoreSuggestions_error___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (id)_generatePersonalizedSuggestionFromContext:(id)a3 error:(id *)a4
{
  id v7;
  unint64_t v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  NSObject *v23;
  objc_class *v24;
  void *v25;
  void *v26;
  objc_class *v27;
  void *v28;
  void *v29;
  objc_class *v30;
  objc_class *v31;
  void *v32;
  void *v33;
  objc_class *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (v7)
  {
    v39 = 0;
    v8 = -[SMSuggestionsManager _getSuggestionTriggerFromContext:error:](self, "_getSuggestionTriggerFromContext:error:", v7, &v39);
    v9 = v39;
    v10 = v9;
    if (a4 && v9)
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v24 = (objc_class *)objc_opt_class();
        NSStringFromClass(v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v41 = v25;
        v42 = 2112;
        v43 = v26;
        v44 = 2112;
        v45 = v10;
        _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

      }
      v12 = objc_retainAutorelease(v10);
      v10 = v12;
      v13 = 0;
      goto LABEL_17;
    }
    if (!v8)
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v19 = (objc_class *)objc_opt_class();
        NSStringFromClass(v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v41 = v20;
        v42 = 2112;
        v43 = v21;
        _os_log_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_INFO, "%@, %@, no valid triggers found", buf, 0x16u);

      }
      v13 = 0;
      goto LABEL_24;
    }
    v38 = v9;
    -[SMSuggestionsManager _generatePersonalizedSuggestionForWorkoutUserFromContext:error:](self, "_generatePersonalizedSuggestionForWorkoutUserFromContext:error:", v7, &v38);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v38;

    if (a4 && v15)
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v16 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
LABEL_15:

        v17 = v15;
LABEL_16:
        v12 = objc_retainAutorelease(v17);
        v10 = v12;
LABEL_17:
        *a4 = v12;
LABEL_24:

        goto LABEL_25;
      }
      v30 = (objc_class *)objc_opt_class();
      NSStringFromClass(v30);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v41 = v28;
      v42 = 2112;
      v43 = v29;
      v44 = 2112;
      v45 = v15;
LABEL_37:
      _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

      goto LABEL_15;
    }
    if (v13)
    {
LABEL_23:
      v10 = v15;
      goto LABEL_24;
    }
    v37 = v15;
    -[SMSuggestionsManager _generatePersonalizedSuggestionForRegularUserFromContext:error:](self, "_generatePersonalizedSuggestionForRegularUserFromContext:error:", v7, &v37);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v37;

    if (a4 && v10)
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v23 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        goto LABEL_29;
      v34 = (objc_class *)objc_opt_class();
      NSStringFromClass(v34);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v41 = v32;
      v42 = 2112;
      v43 = v33;
      v44 = 2112;
      v45 = v10;
    }
    else
    {
      if (v13)
        goto LABEL_24;
      v36 = v10;
      -[SMSuggestionsManager _generatePersonalizedSuggestionForOccasionalUserFromContext:error:](self, "_generatePersonalizedSuggestionForOccasionalUserFromContext:error:", v7, &v36);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v36;

      if (a4 && v15)
      {
        _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        v16 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          goto LABEL_15;
        v27 = (objc_class *)objc_opt_class();
        NSStringFromClass(v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v41 = v28;
        v42 = 2112;
        v43 = v29;
        v44 = 2112;
        v45 = v15;
        goto LABEL_37;
      }
      if (v13)
        goto LABEL_23;
      v35 = v15;
      -[SMSuggestionsManager _generatePersonalizedSuggestionForFirstTimeUserFromContext:error:](self, "_generatePersonalizedSuggestionForFirstTimeUserFromContext:error:", v7, &v35);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v35;

      if (!a4 || !v10)
      {
        if (!a4 || v13)
          goto LABEL_24;
        goto LABEL_30;
      }
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v23 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
LABEL_29:

LABEL_30:
        v17 = v10;
        goto LABEL_16;
      }
      v31 = (objc_class *)objc_opt_class();
      NSStringFromClass(v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v41 = v32;
      v42 = 2112;
      v43 = v33;
      v44 = 2112;
      v45 = v10;
    }
    _os_log_error_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

    goto LABEL_29;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", buf, 2u);
  }

  if (a4)
  {
    _RTErrorInvalidParameterCreate((uint64_t)CFSTR("context"));
    v13 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
LABEL_25:

  return v13;
}

- (id)_generatePersonalizedSuggestionForRegularUserFromContext:(id)a3 error:(id *)a4
{
  id v5;
  NSObject *v6;
  id v7;
  id *v8;
  id *v9;
  SMSuggestionsManager *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  objc_class *v14;
  id v15;
  void *v16;
  void *v17;
  id *v18;
  SMSuggestionsManager *v19;
  NSObject *v20;
  NSObject *v21;
  id *v22;
  NSObject *v23;
  NSObject *v24;
  objc_class *v25;
  id v26;
  id v27;
  void *v28;
  objc_class *v29;
  id v30;
  void *v31;
  id v32;
  NSObject *v33;
  objc_class *v34;
  id v35;
  id v36;
  void *v37;
  double v38;
  id *v39;
  NSObject *v40;
  NSObject *v41;
  id v42;
  objc_class *v43;
  id v44;
  void *v45;
  id v46;
  NSObject *v47;
  objc_class *v48;
  id v49;
  id v50;
  void *v51;
  uint64_t v52;
  id v53;
  id v54;
  void *v55;
  void *v56;
  id v57;
  id v58;
  double v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  void *v68;
  dispatch_semaphore_t v69;
  void *v70;
  NSObject *v71;
  NSObject *v72;
  void *v73;
  dispatch_time_t v74;
  id v75;
  void *v76;
  double v77;
  double v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  NSObject *v84;
  void *v85;
  void *v86;
  void *v87;
  _BOOL4 v88;
  NSObject *v89;
  objc_class *v90;
  id v91;
  id v92;
  id v93;
  uint64_t v94;
  objc_class *v95;
  id v96;
  void *v97;
  id v98;
  objc_class *v99;
  id v100;
  void *v101;
  id v102;
  NSObject *v103;
  void *v104;
  NSObject *v105;
  objc_class *v106;
  id v107;
  id v108;
  id v109;
  uint64_t v110;
  id v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t i;
  void *v115;
  NSObject *v116;
  objc_class *v117;
  id v118;
  void *v119;
  uint64_t v120;
  id *v121;
  id *v122;
  SMSuggestionsManager *v123;
  NSObject *v124;
  objc_class *v125;
  id v126;
  void *v127;
  id v128;
  void *v129;
  NSObject *v130;
  NSObject *v131;
  _BOOL4 v132;
  objc_class *v133;
  id v134;
  id v135;
  void *v136;
  void *v137;
  void *v138;
  double v139;
  double v140;
  void *v141;
  void *v142;
  void *v143;
  id v144;
  id v145;
  void *v146;
  void *v147;
  void *v148;
  id v149;
  void *v150;
  void *v151;
  void *v152;
  NSObject *v153;
  objc_class *v154;
  id v155;
  void *v156;
  objc_class *v157;
  id v158;
  void *v159;
  id v160;
  objc_class *v161;
  id v162;
  void *v163;
  id v164;
  objc_class *v165;
  id v166;
  id v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  objc_class *v173;
  id v174;
  void *v175;
  id v176;
  objc_class *v177;
  id v178;
  void *v179;
  id v180;
  objc_class *v181;
  id v182;
  void *v183;
  id v184;
  uint64_t v185;
  id v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  void *v192;
  void *v193;
  void *v194;
  void *context;
  void *v196;
  void *v197;
  uint64_t v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  unint64_t v205;
  SMSuggestionsManager *v207;
  void *v208;
  id v210;
  id v211;
  id v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  _QWORD v217[4];
  NSObject *v218;
  uint64_t *v219;
  uint64_t *v220;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  __int128 v224;
  id v225;
  uint64_t v226;
  uint64_t *v227;
  uint64_t v228;
  uint64_t (*v229)(uint64_t, uint64_t);
  void (*v230)(uint64_t);
  id v231;
  id v232;
  id v233;
  id v234;
  id v235;
  id obj;
  uint64_t v237;
  id *v238;
  uint64_t v239;
  uint64_t (*v240)(uint64_t, uint64_t);
  void (*v241)(uint64_t);
  id v242;
  _BYTE v243[128];
  _BYTE buf[12];
  __int16 v245;
  id v246;
  __int16 v247;
  id v248;
  __int16 v249;
  uint64_t v250;
  __int16 v251;
  uint64_t v252;
  __int16 v253;
  uint64_t v254;
  _BYTE v255[128];
  _QWORD v256[4];

  v256[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v208 = v5;
  if (v5)
  {
    v237 = 0;
    v238 = (id *)&v237;
    v239 = 0x3032000000;
    v240 = __Block_byref_object_copy__102;
    v241 = __Block_byref_object_dispose__102;
    v242 = 0;
    obj = 0;
    v207 = self;
    v205 = -[SMSuggestionsManager _getSuggestionTriggerFromContext:error:](self, "_getSuggestionTriggerFromContext:error:", v5, &obj);
    objc_storeStrong(&v242, obj);
    if (a4 && v238[5])
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v29 = (objc_class *)objc_opt_class();
        NSStringFromClass(v29);
        v30 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = v238[5];
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v30;
        v245 = 2112;
        v246 = v31;
        v247 = 2112;
        v248 = v32;
        _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

      }
      v7 = 0;
      *a4 = objc_retainAutorelease(v238[5]);
      goto LABEL_131;
    }
    if (!v205)
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = (objc_class *)objc_opt_class();
        NSStringFromClass(v14);
        v15 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v15;
        v245 = 2112;
        v246 = v16;
        _os_log_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_INFO, "%@, %@, no valid triggers found", buf, 0x16u);

      }
      v7 = 0;
      goto LABEL_131;
    }
    v8 = v238 + 5;
    v235 = v238[5];
    -[SMSuggestionsManager _getSourceLocationFromContext:error:](v207, "_getSourceLocationFromContext:error:", v208, &v235);
    v204 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v8, v235);
    v9 = v238 + 5;
    if (a4)
    {
      v10 = v207;
      if (v238[5])
      {
        _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          v43 = (objc_class *)objc_opt_class();
          NSStringFromClass(v43);
          v44 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = v238[5];
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)&buf[4] = v44;
          v245 = 2112;
          v246 = v45;
          v247 = 2112;
          v248 = v46;
          _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

        }
        v7 = 0;
        *a4 = objc_retainAutorelease(v238[5]);
        goto LABEL_130;
      }
      v17 = v208;
    }
    else
    {
      v10 = v207;
      v17 = v208;
    }
    v234 = v238[5];
    -[SMSuggestionsManager _getCurrentDateFromContext:error:](v10, "_getCurrentDateFromContext:error:", v17, &v234);
    v203 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v9, v234);
    v18 = v238 + 5;
    if (a4)
    {
      v19 = v207;
      if (v238[5])
      {
        _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          v95 = (objc_class *)objc_opt_class();
          NSStringFromClass(v95);
          v96 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          v98 = v238[5];
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)&buf[4] = v96;
          v245 = 2112;
          v246 = v97;
          v247 = 2112;
          v248 = v98;
          _os_log_error_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

        }
        v7 = 0;
        *a4 = objc_retainAutorelease(v238[5]);
        goto LABEL_129;
      }
    }
    else
    {
      v19 = v207;
    }
    v233 = v238[5];
    -[SMSuggestionsManager _getNPLOIsWithOnlyHighConfidence:location:date:error:](v19, "_getNPLOIsWithOnlyHighConfidence:location:date:error:", 1, v204, v203, &v233);
    v196 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v18, v233);
    if (a4 && v238[5])
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v99 = (objc_class *)objc_opt_class();
        NSStringFromClass(v99);
        v100 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        v102 = v238[5];
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v100;
        v245 = 2112;
        v246 = v101;
        v247 = 2112;
        v248 = v102;
        _os_log_error_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

      }
      v7 = 0;
      *a4 = objc_retainAutorelease(v238[5]);
      goto LABEL_128;
    }
    if (!v196 || !objc_msgSend(v196, "count"))
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        v25 = (objc_class *)objc_opt_class();
        NSStringFromClass(v25);
        v26 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v27 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D8BA90], "stringFromSMSuggestionTrigger:", v205);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v26;
        v245 = 2112;
        v246 = v27;
        v247 = 2112;
        v248 = v28;
        _os_log_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_INFO, "%@, %@, trigger type, %@, suggestion skipped because nploi with High confidence is not found", buf, 0x20u);

      }
      v7 = 0;
      goto LABEL_128;
    }
    v22 = v238 + 5;
    v232 = v238[5];
    -[SMSuggestionsManager _getValuesFromDefaultsIfExists:error:](v207, "_getValuesFromDefaultsIfExists:error:", CFSTR("RTDefaultsSuggestionTimeIntervalBuffer"), &v232);
    v194 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v22, v232);
    if (a4 && v238[5])
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v125 = (objc_class *)objc_opt_class();
        NSStringFromClass(v125);
        v126 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        v128 = v238[5];
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v126;
        v245 = 2112;
        v246 = v127;
        v247 = 2112;
        v248 = v128;
        _os_log_error_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

      }
      v7 = 0;
      *a4 = objc_retainAutorelease(v238[5]);
      goto LABEL_127;
    }
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      v34 = (objc_class *)objc_opt_class();
      NSStringFromClass(v34);
      v35 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v36 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v194, "doubleValue");
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v35;
      v245 = 2112;
      v246 = v36;
      v247 = 2048;
      v248 = v37;
      _os_log_impl(&dword_1D1A22000, v33, OS_LOG_TYPE_INFO, "%@, %@, using time interval buffer, %.3f", buf, 0x20u);

    }
    objc_msgSend(v194, "doubleValue");
    objc_msgSend(v203, "dateByAddingTimeInterval:", -v38);
    v193 = (void *)objc_claimAutoreleasedReturnValue();
    v226 = 0;
    v227 = &v226;
    v228 = 0x3032000000;
    v229 = __Block_byref_object_copy__102;
    v230 = __Block_byref_object_dispose__102;
    v231 = 0;
    v39 = v238 + 5;
    if (a4 && v238[5])
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        v157 = (objc_class *)objc_opt_class();
        NSStringFromClass(v157);
        v158 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v159 = (void *)objc_claimAutoreleasedReturnValue();
        v160 = v238[5];
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v158;
        v245 = 2112;
        v246 = v159;
        v247 = 2112;
        v248 = v160;
        _os_log_error_impl(&dword_1D1A22000, v40, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

      }
      v7 = 0;
      *a4 = objc_retainAutorelease(v238[5]);
      goto LABEL_126;
    }
    v225 = v238[5];
    -[SMSuggestionsManager _getValuesFromDefaultsIfExists:error:](v207, "_getValuesFromDefaultsIfExists:error:", CFSTR("RTDefaultsSuggestionBoundingBoxRadius"), &v225);
    v192 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v39, v225);
    if (a4 && v238[5])
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        v161 = (objc_class *)objc_opt_class();
        NSStringFromClass(v161);
        v162 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v163 = (void *)objc_claimAutoreleasedReturnValue();
        v164 = v238[5];
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v162;
        v245 = 2112;
        v246 = v163;
        v247 = 2112;
        v248 = v164;
        _os_log_error_impl(&dword_1D1A22000, v41, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

      }
      v42 = objc_retainAutorelease(v238[5]);
      v197 = 0;
      v199 = 0;
LABEL_83:
      v7 = 0;
      *a4 = v42;
LABEL_125:

LABEL_126:
      _Block_object_dispose(&v226, 8);

LABEL_127:
LABEL_128:

LABEL_129:
LABEL_130:

LABEL_131:
      _Block_object_dispose(&v237, 8);

      goto LABEL_132;
    }
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
    {
      v48 = (objc_class *)objc_opt_class();
      NSStringFromClass(v48);
      v49 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v50 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v192, "doubleValue");
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v49;
      v245 = 2112;
      v246 = v50;
      v247 = 2048;
      v248 = v51;
      _os_log_impl(&dword_1D1A22000, v47, OS_LOG_TYPE_INFO, "%@, %@, using bounding box radius, %.3f", buf, 0x20u);

    }
    v223 = 0u;
    v224 = 0u;
    v221 = 0u;
    v222 = 0u;
    v186 = v196;
    v52 = objc_msgSend(v186, "countByEnumeratingWithState:objects:count:", &v221, v255, 16);
    if (v52)
    {
      v189 = v52;
      v53 = 0;
      v54 = 0;
      v190 = *MEMORY[0x1E0D8BD30];
      v191 = *(_QWORD *)v222;
      v187 = *MEMORY[0x1E0D18598];
      v188 = *MEMORY[0x1E0CB2D50];
LABEL_60:
      v198 = 0;
      v55 = v53;
      v201 = v54;
      while (1)
      {
        if (*(_QWORD *)v222 != v191)
          objc_enumerationMutation(v186);
        v56 = *(void **)(*((_QWORD *)&v221 + 1) + 8 * v198);
        context = (void *)MEMORY[0x1D8231EA8]();
        v53 = v56;

        v57 = objc_alloc(MEMORY[0x1E0D8B9F8]);
        v58 = objc_alloc(MEMORY[0x1E0CB3588]);
        objc_msgSend(v194, "doubleValue");
        v60 = (void *)objc_msgSend(v58, "initWithStartDate:duration:", v193, v59 + v59);
        v61 = objc_alloc(MEMORY[0x1E0CB3588]);
        objc_msgSend(v203, "dateByAddingTimeInterval:", -2419200.0);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = (void *)objc_msgSend(v61, "initWithStartDate:duration:", v62, 2419200.0);
        v64 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E3B8]), "initWithRTLocation:", v204);
        v65 = objc_alloc(MEMORY[0x1E0C9E3B8]);
        objc_msgSend(v53, "locationOfInterest");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "location");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = (void *)objc_msgSend(v65, "initWithRTLocation:", v67);
        LOBYTE(v185) = 1;
        v200 = (void *)objc_msgSend(v57, "initWithBatchSize:fetchLimit:sortBySessionStartDate:ascending:sessionTypes:timeInADayInterval:pickOneConfigInTimeInADayInterval:dateInterval:startBoundingBoxLocation:destinationBoundingBoxLocation:boundingBoxRadius:sessionIdentifier:", v190, v190, 1, 0, &unk_1E932C868, v60, v185, v63, v64, v68, v192, 0);

        v69 = dispatch_semaphore_create(0);
        -[SMSuggestionsManager sessionStore](v207, "sessionStore");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v217[0] = MEMORY[0x1E0C809B0];
        v217[1] = 3221225472;
        v217[2] = __87__SMSuggestionsManager__generatePersonalizedSuggestionForRegularUserFromContext_error___block_invoke;
        v217[3] = &unk_1E9296EE0;
        v219 = &v226;
        v220 = &v237;
        v71 = v69;
        v218 = v71;
        objc_msgSend(v70, "fetchSessionConfigurationsWithOptions:handler:", v200, v217);

        v72 = v71;
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v74 = dispatch_time(0, 3600000000000);
        v75 = v201;
        if (dispatch_semaphore_wait(v72, v74))
        {
          objc_msgSend(MEMORY[0x1E0C99D68], "now");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "timeIntervalSinceDate:", v73);
          v78 = v77;
          v79 = (void *)objc_opt_new();
          objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_607);
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "filteredArrayUsingPredicate:", v80);
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v82, "firstObject");
          v83 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v79, "submitToCoreAnalytics:type:duration:", v83, 1, v78);
          _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          v84 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v84, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_1D1A22000, v84, OS_LOG_TYPE_FAULT, "Invalid parameter not satisfying: authorizationManager", buf, 2u);
          }

          v85 = (void *)MEMORY[0x1E0CB35C8];
          v256[0] = v188;
          *(_QWORD *)buf = CFSTR("semaphore wait timeout");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v256, 1);
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v85, "errorWithDomain:code:userInfo:", v187, 15, v86);
          v87 = (void *)objc_claimAutoreleasedReturnValue();

          v75 = v201;
          if (v87)
          {
            v75 = objc_retainAutorelease(v87);

          }
        }

        v54 = v75;
        if (v54)
        {
          objc_storeStrong(v238 + 5, v75);
          v88 = 0;
        }
        else
        {
          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          v89 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v89, OS_LOG_TYPE_INFO))
          {
            v90 = (objc_class *)objc_opt_class();
            NSStringFromClass(v90);
            v91 = (id)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v92 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0D8BA90], "stringFromSMSuggestionTrigger:", v205);
            v93 = (id)objc_claimAutoreleasedReturnValue();
            v94 = objc_msgSend((id)v227[5], "count");
            *(_DWORD *)buf = 138413570;
            *(_QWORD *)&buf[4] = v91;
            v245 = 2112;
            v246 = v92;
            v247 = 2112;
            v248 = v93;
            v249 = 2112;
            v250 = (uint64_t)v53;
            v251 = 2048;
            v252 = v94;
            v253 = 2048;
            v254 = 3;
            _os_log_impl(&dword_1D1A22000, v89, OS_LOG_TYPE_INFO, "%@, %@, trigger type, %@, nploi, %@, sessionConfiguration count, %lu, kSMSuggestionRegularUserSessionConfigurationCount, %lu", buf, 0x3Eu);

          }
          v88 = (unint64_t)objc_msgSend((id)v227[5], "count") < 3;
        }

        objc_autoreleasePoolPop(context);
        if (!v88)
          break;
        v55 = v53;
        v201 = v54;
        if (v189 == ++v198)
        {
          v189 = objc_msgSend(v186, "countByEnumeratingWithState:objects:count:", &v221, v255, 16);
          if (v189)
            goto LABEL_60;
          break;
        }
      }
    }
    else
    {
      v53 = 0;
      v54 = 0;
    }
    v197 = v54;
    v199 = v53;

    if (a4 && v238[5])
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v103 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
      {
        v173 = (objc_class *)objc_opt_class();
        NSStringFromClass(v173);
        v174 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v175 = (void *)objc_claimAutoreleasedReturnValue();
        v176 = v238[5];
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v174;
        v245 = 2112;
        v246 = v175;
        v247 = 2112;
        v248 = v176;
        _os_log_error_impl(&dword_1D1A22000, v103, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

      }
      v42 = objc_retainAutorelease(v238[5]);
      goto LABEL_83;
    }
    v104 = (void *)v227[5];
    if (!v104 || (unint64_t)objc_msgSend(v104, "count") <= 2)
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v105 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v105, OS_LOG_TYPE_INFO))
      {
        v106 = (objc_class *)objc_opt_class();
        NSStringFromClass(v106);
        v107 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v108 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D8BA90], "stringFromSMSuggestionTrigger:", v205);
        v109 = (id)objc_claimAutoreleasedReturnValue();
        v110 = objc_msgSend((id)v227[5], "count");
        *(_DWORD *)buf = 138413314;
        *(_QWORD *)&buf[4] = v107;
        v245 = 2112;
        v246 = v108;
        v247 = 2112;
        v248 = v109;
        v249 = 2048;
        v250 = v110;
        v251 = 2048;
        v252 = 3;
        _os_log_impl(&dword_1D1A22000, v105, OS_LOG_TYPE_INFO, "%@, %@, trigger type, %@, suggestion skipped because sessionConfiguration count doesn't meet threshold, sessionConfiguration count, %lu, kSMSuggestionRegularUserSessionConfigurationCount, %lu", buf, 0x34u);

      }
      v7 = 0;
      goto LABEL_125;
    }
    v215 = 0u;
    v216 = 0u;
    v213 = 0u;
    v214 = 0u;
    v111 = (id)v227[5];
    v112 = objc_msgSend(v111, "countByEnumeratingWithState:objects:count:", &v213, v243, 16);
    if (v112)
    {
      v113 = *(_QWORD *)v214;
      do
      {
        for (i = 0; i != v112; ++i)
        {
          if (*(_QWORD *)v214 != v113)
            objc_enumerationMutation(v111);
          v115 = *(void **)(*((_QWORD *)&v213 + 1) + 8 * i);
          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          v116 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v116, OS_LOG_TYPE_INFO))
          {
            v117 = (objc_class *)objc_opt_class();
            NSStringFromClass(v117);
            v118 = (id)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v119 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            *(_QWORD *)&buf[4] = v118;
            v245 = 2112;
            v246 = v119;
            v247 = 2112;
            v248 = v115;
            _os_log_impl(&dword_1D1A22000, v116, OS_LOG_TYPE_INFO, "%@, %@, session, %@", buf, 0x20u);

          }
        }
        v112 = objc_msgSend(v111, "countByEnumeratingWithState:objects:count:", &v213, v243, 16);
      }
      while (v112);
    }

    v120 = v227[5];
    v121 = v238 + 5;
    v212 = v238[5];
    -[SMSuggestionsManager _getFirstEligibleHandleFromSessionConfigurations:error:](v207, "_getFirstEligibleHandleFromSessionConfigurations:error:", v120, &v212);
    v202 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v121, v212);
    v122 = v238 + 5;
    if (a4)
    {
      v123 = v207;
      if (v238[5])
      {
        _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        v124 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v124, OS_LOG_TYPE_ERROR))
        {
          v177 = (objc_class *)objc_opt_class();
          NSStringFromClass(v177);
          v178 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v179 = (void *)objc_claimAutoreleasedReturnValue();
          v180 = v238[5];
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)&buf[4] = v178;
          v245 = 2112;
          v246 = v179;
          v247 = 2112;
          v248 = v180;
          _os_log_error_impl(&dword_1D1A22000, v124, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

        }
        v7 = 0;
        *a4 = objc_retainAutorelease(v238[5]);
        goto LABEL_124;
      }
    }
    else
    {
      v123 = v207;
    }
    v211 = v238[5];
    -[SMSuggestionsManager _getSMContactInformationFromSMHandle:error:](v123, "_getSMContactInformationFromSMHandle:error:", v202, &v211);
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v122, v211);
    if (a4 && v238[5])
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v130 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v130, OS_LOG_TYPE_ERROR))
      {
        v181 = (objc_class *)objc_opt_class();
        NSStringFromClass(v181);
        v182 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v183 = (void *)objc_claimAutoreleasedReturnValue();
        v184 = v238[5];
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v182;
        v245 = 2112;
        v246 = v183;
        v247 = 2112;
        v248 = v184;
        _os_log_error_impl(&dword_1D1A22000, v130, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

      }
      *a4 = objc_retainAutorelease(v238[5]);

    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v131 = objc_claimAutoreleasedReturnValue();
      v132 = os_log_type_enabled(v131, OS_LOG_TYPE_INFO);
      if (v129)
      {
        if (v132)
        {
          v133 = (objc_class *)objc_opt_class();
          NSStringFromClass(v133);
          v134 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v135 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v227[5], "firstObject");
          v136 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)&buf[4] = v134;
          v245 = 2112;
          v246 = v135;
          v247 = 2112;
          v248 = v136;
          _os_log_impl(&dword_1D1A22000, v131, OS_LOG_TYPE_INFO, "%@, %@, first obj session info, %@", buf, 0x20u);

        }
        objc_msgSend((id)v227[5], "firstObject");
        v137 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v137, "destination");
        v138 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v138, "radius");
        v140 = v139;
        objc_msgSend(v199, "locationOfInterest");
        v141 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v141, "location");
        v142 = (void *)objc_claimAutoreleasedReturnValue();
        v210 = 0;
        +[SMSuggestionsHelper createMasqueradingReferenceLocationFromFenceRadius:location:error:](SMSuggestionsHelper, "createMasqueradingReferenceLocationFromFenceRadius:location:error:", v142, &v210, v140);
        v143 = (void *)objc_claimAutoreleasedReturnValue();
        v144 = v210;

        v145 = v143;
        v146 = v145;
        if (v144 || (v147 = v145) == 0)
        {
          objc_msgSend(v199, "locationOfInterest");
          v148 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v148, "location");
          v147 = (void *)objc_claimAutoreleasedReturnValue();

        }
        v149 = objc_alloc(MEMORY[0x1E0D8BA90]);
        v150 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:duration:", v203, 3600.0);
        objc_msgSend(v199, "locationOfInterest");
        v151 = (void *)objc_claimAutoreleasedReturnValue();
        v152 = (void *)objc_msgSend(v149, "initWithSuggestionTrigger:suggestionUserType:suppressionReason:sessionType:sourceLocation:destinationLocation:buddy:dateInterval:creationDate:locationOfInterest:", v205, 1, 1, 2, v204, v147, v129, v150, v203, v151);

        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v153 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v153, OS_LOG_TYPE_INFO))
        {
          v154 = (objc_class *)objc_opt_class();
          NSStringFromClass(v154);
          v155 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v156 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)&buf[4] = v155;
          v245 = 2112;
          v246 = v156;
          v247 = 2112;
          v248 = v152;
          _os_log_impl(&dword_1D1A22000, v153, OS_LOG_TYPE_INFO, "%@, %@, suggestion created, %@", buf, 0x20u);

        }
        if (a4)
          *a4 = objc_retainAutorelease(v144);
        v7 = v152;

        goto LABEL_124;
      }
      if (v132)
      {
        v165 = (objc_class *)objc_opt_class();
        NSStringFromClass(v165);
        v166 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v167 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v227[5], "firstObject");
        v168 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v168, "conversation");
        v169 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v169, "receiverHandles");
        v170 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v170, "firstObject");
        v171 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        *(_QWORD *)&buf[4] = v166;
        v245 = 2112;
        v246 = v167;
        v247 = 2112;
        v248 = 0;
        v249 = 2112;
        v250 = (uint64_t)v171;
        _os_log_impl(&dword_1D1A22000, v131, OS_LOG_TYPE_INFO, "%@, %@, invalid contact information, %@, handle, %@", buf, 0x2Au);

      }
    }
    v7 = 0;
LABEL_124:

    goto LABEL_125;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", buf, 2u);
  }

  if (a4)
  {
    _RTErrorInvalidParameterCreate((uint64_t)CFSTR("context"));
    v7 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
LABEL_132:

  return v7;
}

void __87__SMSuggestionsManager__generatePersonalizedSuggestionForRegularUserFromContext_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_generatePersonalizedSuggestionForOccasionalUserFromContext:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  id v8;
  id *v9;
  id *v10;
  NSObject *v11;
  NSObject *v12;
  id *v13;
  NSObject *v14;
  NSObject *v15;
  objc_class *v16;
  id v17;
  void *v18;
  NSObject *v19;
  id *v20;
  NSObject *v21;
  NSObject *v22;
  objc_class *v23;
  id v24;
  id v25;
  void *v26;
  objc_class *v27;
  id v28;
  void *v29;
  id v30;
  NSObject *v31;
  objc_class *v32;
  id v33;
  id v34;
  void *v35;
  double v36;
  id *v37;
  NSObject *v38;
  id v39;
  void *v40;
  id v41;
  NSObject *v42;
  objc_class *v43;
  id v44;
  id v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  double v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  dispatch_semaphore_t v64;
  void *v65;
  NSObject *v66;
  NSObject *v67;
  void *v68;
  dispatch_time_t v69;
  id v70;
  void *v71;
  double v72;
  double v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  NSObject *v79;
  void *v80;
  void *v81;
  void *v82;
  _BOOL4 v83;
  NSObject *v84;
  objc_class *v85;
  id v86;
  id v87;
  id v88;
  uint64_t v89;
  NSObject *v90;
  objc_class *v91;
  id v92;
  void *v93;
  id v94;
  void *v95;
  uint64_t v96;
  void *v97;
  uint64_t v98;
  id *v99;
  id *v100;
  NSObject *v101;
  objc_class *v102;
  id v103;
  void *v104;
  id v105;
  NSObject *v106;
  objc_class *v107;
  id v108;
  id v109;
  id v110;
  uint64_t v111;
  objc_class *v112;
  id v113;
  void *v114;
  id v115;
  void *v116;
  NSObject *v117;
  void *v118;
  void *v119;
  double v120;
  double v121;
  void *v122;
  void *v123;
  void *v124;
  id v125;
  id v126;
  void *v127;
  void *v128;
  NSObject *v129;
  void *v130;
  id v131;
  void *v132;
  void *v133;
  void *v134;
  NSObject *v135;
  objc_class *v136;
  id v137;
  void *v138;
  objc_class *v139;
  id v140;
  void *v141;
  id v142;
  objc_class *v143;
  id v144;
  void *v145;
  id v146;
  NSObject *v147;
  objc_class *v148;
  id v149;
  id v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  objc_class *v156;
  id v157;
  void *v158;
  id v159;
  objc_class *v160;
  id v161;
  void *v162;
  id v163;
  objc_class *v164;
  id v165;
  void *v166;
  id v167;
  objc_class *v168;
  id v169;
  void *v170;
  uint64_t v171;
  id v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *context;
  uint64_t v183;
  id v184;
  void *v185;
  void *v186;
  void *v187;
  const char *aSelector;
  unint64_t v189;
  SMSuggestionsManager *v190;
  void *v191;
  id v193;
  id v194;
  id v195;
  _QWORD v196[4];
  NSObject *v197;
  uint64_t *v198;
  uint64_t *v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  id v204;
  uint64_t v205;
  uint64_t *v206;
  uint64_t v207;
  uint64_t (*v208)(uint64_t, uint64_t);
  void (*v209)(uint64_t);
  id v210;
  id v211;
  id v212;
  id v213;
  id v214;
  id obj;
  uint64_t v216;
  id *v217;
  uint64_t v218;
  uint64_t (*v219)(uint64_t, uint64_t);
  void (*v220)(uint64_t);
  id v221;
  _BYTE buf[12];
  __int16 v223;
  id v224;
  __int16 v225;
  id v226;
  __int16 v227;
  uint64_t v228;
  __int16 v229;
  uint64_t v230;
  __int16 v231;
  uint64_t v232;
  _BYTE v233[128];
  _QWORD v234[4];

  v234[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v191 = v6;
  if (v6)
  {
    aSelector = a2;
    v216 = 0;
    v217 = (id *)&v216;
    v218 = 0x3032000000;
    v219 = __Block_byref_object_copy__102;
    v220 = __Block_byref_object_dispose__102;
    v221 = 0;
    obj = 0;
    v190 = self;
    v189 = -[SMSuggestionsManager _getSuggestionTriggerFromContext:error:](self, "_getSuggestionTriggerFromContext:error:", v6, &obj);
    objc_storeStrong(&v221, obj);
    if (a4 && v217[5])
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v27 = (objc_class *)objc_opt_class();
        NSStringFromClass(v27);
        v28 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v217[5];
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v28;
        v223 = 2112;
        v224 = v29;
        v225 = 2112;
        v226 = v30;
        _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

      }
      v8 = 0;
      *a4 = objc_retainAutorelease(v217[5]);
      goto LABEL_110;
    }
    if (!v189)
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v16 = (objc_class *)objc_opt_class();
        NSStringFromClass(v16);
        v17 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v17;
        v223 = 2112;
        v224 = v18;
        _os_log_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_INFO, "%@, %@, no valid triggers found", buf, 0x16u);

      }
      v8 = 0;
      goto LABEL_110;
    }
    v9 = v217 + 5;
    v214 = v217[5];
    -[SMSuggestionsManager _getSourceLocationFromContext:error:](self, "_getSourceLocationFromContext:error:", v191, &v214);
    v187 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v9, v214);
    v10 = v217 + 5;
    if (a4 && v217[5])
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v91 = (objc_class *)objc_opt_class();
        NSStringFromClass(v91);
        v92 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        v94 = v217[5];
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v92;
        v223 = 2112;
        v224 = v93;
        v225 = 2112;
        v226 = v94;
        _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

      }
      v8 = 0;
      *a4 = objc_retainAutorelease(v217[5]);
      goto LABEL_109;
    }
    v213 = v217[5];
    -[SMSuggestionsManager _getCurrentDateFromContext:error:](self, "_getCurrentDateFromContext:error:", v191, &v213);
    v186 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v10, v213);
    v13 = v217 + 5;
    if (a4 && v217[5])
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v102 = (objc_class *)objc_opt_class();
        NSStringFromClass(v102);
        v103 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        v105 = v217[5];
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v103;
        v223 = 2112;
        v224 = v104;
        v225 = 2112;
        v226 = v105;
        _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

      }
      v8 = 0;
      *a4 = objc_retainAutorelease(v217[5]);
      goto LABEL_108;
    }
    v212 = v217[5];
    -[SMSuggestionsManager _getNPLOIsWithOnlyHighConfidence:location:date:error:](self, "_getNPLOIsWithOnlyHighConfidence:location:date:error:", 1, v187, v186, &v212);
    v181 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v13, v212);
    if (a4 && v217[5])
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v112 = (objc_class *)objc_opt_class();
        NSStringFromClass(v112);
        v113 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        v115 = v217[5];
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v113;
        v223 = 2112;
        v224 = v114;
        v225 = 2112;
        v226 = v115;
        _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

      }
      v8 = 0;
      *a4 = objc_retainAutorelease(v217[5]);
      goto LABEL_107;
    }
    if (!v181 || !objc_msgSend(v181, "count"))
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        v23 = (objc_class *)objc_opt_class();
        NSStringFromClass(v23);
        v24 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        v25 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D8BA90], "stringFromSMSuggestionTrigger:", v189);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v24;
        v223 = 2112;
        v224 = v25;
        v225 = 2112;
        v226 = v26;
        _os_log_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_INFO, "%@, %@, trigger type, %@, suggestion skipped because nploi with High confidence is not found", buf, 0x20u);

      }
      v8 = 0;
      goto LABEL_107;
    }
    v20 = v217 + 5;
    v211 = v217[5];
    -[SMSuggestionsManager _getValuesFromDefaultsIfExists:error:](self, "_getValuesFromDefaultsIfExists:error:", CFSTR("RTDefaultsSuggestionTimeIntervalBuffer"), &v211);
    v180 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v20, v211);
    if (a4 && v217[5])
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v139 = (objc_class *)objc_opt_class();
        NSStringFromClass(v139);
        v140 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        v141 = (void *)objc_claimAutoreleasedReturnValue();
        v142 = v217[5];
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v140;
        v223 = 2112;
        v224 = v141;
        v225 = 2112;
        v226 = v142;
        _os_log_error_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

      }
      v8 = 0;
      *a4 = objc_retainAutorelease(v217[5]);
      goto LABEL_106;
    }
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      v32 = (objc_class *)objc_opt_class();
      NSStringFromClass(v32);
      v33 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(aSelector);
      v34 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v180, "doubleValue");
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v33;
      v223 = 2112;
      v224 = v34;
      v225 = 2048;
      v226 = v35;
      _os_log_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_INFO, "%@, %@, using time interval buffer, %.3f", buf, 0x20u);

    }
    objc_msgSend(v180, "doubleValue");
    objc_msgSend(v186, "dateByAddingTimeInterval:", -v36);
    v178 = (void *)objc_claimAutoreleasedReturnValue();
    v205 = 0;
    v206 = &v205;
    v207 = 0x3032000000;
    v208 = __Block_byref_object_copy__102;
    v209 = __Block_byref_object_dispose__102;
    v210 = 0;
    v37 = v217 + 5;
    v204 = v217[5];
    -[SMSuggestionsManager _getValuesFromDefaultsIfExists:error:](v190, "_getValuesFromDefaultsIfExists:error:", CFSTR("RTDefaultsSuggestionBoundingBoxRadius"), &v204);
    v179 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v37, v204);
    if (a4 && v217[5])
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        v143 = (objc_class *)objc_opt_class();
        NSStringFromClass(v143);
        v144 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        v145 = (void *)objc_claimAutoreleasedReturnValue();
        v146 = v217[5];
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v144;
        v223 = 2112;
        v224 = v145;
        v225 = 2112;
        v226 = v146;
        _os_log_error_impl(&dword_1D1A22000, v38, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

      }
      v39 = objc_retainAutorelease(v217[5]);
      v40 = 0;
      v41 = 0;
LABEL_73:
      v8 = 0;
      *a4 = v39;
LABEL_105:

      _Block_object_dispose(&v205, 8);
LABEL_106:

LABEL_107:
LABEL_108:

LABEL_109:
LABEL_110:
      _Block_object_dispose(&v216, 8);

      goto LABEL_111;
    }
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      v43 = (objc_class *)objc_opt_class();
      NSStringFromClass(v43);
      v44 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(aSelector);
      v45 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v179, "doubleValue");
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v44;
      v223 = 2112;
      v224 = v45;
      v225 = 2048;
      v226 = v46;
      _os_log_impl(&dword_1D1A22000, v42, OS_LOG_TYPE_INFO, "%@, %@, using bounding box radius, %.3f", buf, 0x20u);

    }
    v202 = 0u;
    v203 = 0u;
    v200 = 0u;
    v201 = 0u;
    v172 = v181;
    v47 = objc_msgSend(v172, "countByEnumeratingWithState:objects:count:", &v200, v233, 16);
    v40 = 0;
    v41 = 0;
    if (v47)
    {
      v176 = *MEMORY[0x1E0D8BD30];
      v177 = *(_QWORD *)v201;
      v173 = *MEMORY[0x1E0D18598];
      v174 = *MEMORY[0x1E0CB2D50];
LABEL_52:
      v175 = v47;
      v48 = 0;
      v49 = v40;
      v50 = v41;
      while (1)
      {
        if (*(_QWORD *)v201 != v177)
          objc_enumerationMutation(v172);
        v183 = v48;
        v51 = *(void **)(*((_QWORD *)&v200 + 1) + 8 * v48);
        context = (void *)MEMORY[0x1D8231EA8]();
        v184 = v51;

        v52 = objc_alloc(MEMORY[0x1E0D8B9F8]);
        v53 = objc_alloc(MEMORY[0x1E0CB3588]);
        objc_msgSend(v180, "doubleValue");
        v55 = (void *)objc_msgSend(v53, "initWithStartDate:duration:", v178, v54 + v54);
        v56 = objc_alloc(MEMORY[0x1E0CB3588]);
        objc_msgSend(v186, "dateByAddingTimeInterval:", -2419200.0);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = (void *)objc_msgSend(v56, "initWithStartDate:duration:", v57, 2419200.0);
        v59 = objc_alloc(MEMORY[0x1E0C9E3B8]);
        objc_msgSend(v184, "locationOfInterest");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "location");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = (void *)objc_msgSend(v59, "initWithRTLocation:", v61);
        LOBYTE(v171) = 1;
        v63 = (void *)objc_msgSend(v52, "initWithBatchSize:fetchLimit:sortBySessionStartDate:ascending:sessionTypes:timeInADayInterval:pickOneConfigInTimeInADayInterval:dateInterval:startBoundingBoxLocation:destinationBoundingBoxLocation:boundingBoxRadius:sessionIdentifier:", v176, v176, 1, 0, &unk_1E932C880, v55, v171, v58, 0, v62, v179, 0);

        v64 = dispatch_semaphore_create(0);
        -[SMSuggestionsManager sessionStore](v190, "sessionStore");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v196[0] = MEMORY[0x1E0C809B0];
        v196[1] = 3221225472;
        v196[2] = __90__SMSuggestionsManager__generatePersonalizedSuggestionForOccasionalUserFromContext_error___block_invoke;
        v196[3] = &unk_1E9296EE0;
        v198 = &v205;
        v199 = &v216;
        v66 = v64;
        v197 = v66;
        objc_msgSend(v65, "fetchSessionConfigurationsWithOptions:handler:", v63, v196);

        v67 = v66;
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = dispatch_time(0, 3600000000000);
        v70 = v50;
        if (dispatch_semaphore_wait(v67, v69))
        {
          objc_msgSend(MEMORY[0x1E0C99D68], "now");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "timeIntervalSinceDate:", v68);
          v73 = v72;
          v74 = (void *)objc_opt_new();
          objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_607);
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "filteredArrayUsingPredicate:", v75);
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v77, "firstObject");
          v78 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v74, "submitToCoreAnalytics:type:duration:", v78, 1, v73);
          _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          v79 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v79, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_1D1A22000, v79, OS_LOG_TYPE_FAULT, "Invalid parameter not satisfying: authorizationManager", buf, 2u);
          }

          v80 = (void *)MEMORY[0x1E0CB35C8];
          v234[0] = v174;
          *(_QWORD *)buf = CFSTR("semaphore wait timeout");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v234, 1);
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v80, "errorWithDomain:code:userInfo:", v173, 15, v81);
          v82 = (void *)objc_claimAutoreleasedReturnValue();

          v70 = v50;
          if (v82)
          {
            v70 = objc_retainAutorelease(v82);

          }
        }

        v41 = v70;
        if (v41)
        {
          objc_storeStrong(v217 + 5, v70);
          v83 = 0;
        }
        else
        {
          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          v84 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
          {
            v85 = (objc_class *)objc_opt_class();
            NSStringFromClass(v85);
            v86 = (id)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(aSelector);
            v87 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0D8BA90], "stringFromSMSuggestionTrigger:", v189);
            v88 = (id)objc_claimAutoreleasedReturnValue();
            v89 = objc_msgSend((id)v206[5], "count");
            *(_DWORD *)buf = 138413570;
            *(_QWORD *)&buf[4] = v86;
            v223 = 2112;
            v224 = v87;
            v225 = 2112;
            v226 = v184;
            v227 = 2112;
            v228 = (uint64_t)v88;
            v229 = 2048;
            v230 = v89;
            v231 = 2048;
            v232 = 1;
            _os_log_impl(&dword_1D1A22000, v84, OS_LOG_TYPE_INFO, "%@, %@, trigger type, %@, nploi, %@, sessionConfiguration count, %lu, kSMSuggestionOccasionalUserSessionConfigurationCount, %lu", buf, 0x3Eu);

          }
          v83 = (unint64_t)objc_msgSend((id)v206[5], "count") < 2;
        }

        objc_autoreleasePoolPop(context);
        v40 = v184;
        if (!v83)
          break;
        v48 = v183 + 1;
        v49 = v184;
        v50 = v41;
        if (v175 == v183 + 1)
        {
          v47 = objc_msgSend(v172, "countByEnumeratingWithState:objects:count:", &v200, v233, 16);
          if (v47)
            goto LABEL_52;
          break;
        }
      }
    }

    if (a4 && v217[5])
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v90 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
      {
        v156 = (objc_class *)objc_opt_class();
        NSStringFromClass(v156);
        v157 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        v158 = (void *)objc_claimAutoreleasedReturnValue();
        v159 = v217[5];
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v157;
        v223 = 2112;
        v224 = v158;
        v225 = 2112;
        v226 = v159;
        _os_log_error_impl(&dword_1D1A22000, v90, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

      }
      v39 = objc_retainAutorelease(v217[5]);
      goto LABEL_73;
    }
    v95 = (void *)v206[5];
    if (!v95 || !objc_msgSend(v95, "count"))
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v106 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v106, OS_LOG_TYPE_INFO))
      {
        v107 = (objc_class *)objc_opt_class();
        NSStringFromClass(v107);
        v108 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        v109 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D8BA90], "stringFromSMSuggestionTrigger:", v189);
        v110 = (id)objc_claimAutoreleasedReturnValue();
        v111 = objc_msgSend((id)v206[5], "count");
        *(_DWORD *)buf = 138413314;
        *(_QWORD *)&buf[4] = v108;
        v223 = 2112;
        v224 = v109;
        v225 = 2112;
        v226 = v110;
        v227 = 2048;
        v228 = v111;
        v229 = 2048;
        v230 = 1;
        _os_log_impl(&dword_1D1A22000, v106, OS_LOG_TYPE_INFO, "%@, %@, trigger type, %@, suggestion skipped because sessionConfiguration count doesn't meet threshold, sessionConfiguration count, %lu, kSMSuggestionOccasionalUserSessionConfigurationCount, %lu", buf, 0x34u);

      }
      v8 = 0;
      goto LABEL_105;
    }
    +[SMSuggestionsHelper dedupeSessionConfigurations:](SMSuggestionsHelper, "dedupeSessionConfigurations:", v206[5]);
    v96 = objc_claimAutoreleasedReturnValue();
    v97 = (void *)v206[5];
    v206[5] = v96;

    v98 = v206[5];
    v99 = v217 + 5;
    v195 = v217[5];
    -[SMSuggestionsManager _getFirstEligibleHandleFromSessionConfigurations:error:](v190, "_getFirstEligibleHandleFromSessionConfigurations:error:", v98, &v195);
    v185 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v99, v195);
    v100 = v217 + 5;
    if (a4 && v217[5])
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v101 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
      {
        v160 = (objc_class *)objc_opt_class();
        NSStringFromClass(v160);
        v161 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        v162 = (void *)objc_claimAutoreleasedReturnValue();
        v163 = v217[5];
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v161;
        v223 = 2112;
        v224 = v162;
        v225 = 2112;
        v226 = v163;
        _os_log_error_impl(&dword_1D1A22000, v101, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

      }
      v8 = 0;
      *a4 = objc_retainAutorelease(v217[5]);
    }
    else
    {
      v194 = v217[5];
      -[SMSuggestionsManager _getSMContactInformationFromSMHandle:error:](v190, "_getSMContactInformationFromSMHandle:error:", v185, &v194);
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong(v100, v194);
      if (a4 && v217[5])
      {
        _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        v117 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v117, OS_LOG_TYPE_ERROR))
        {
          v164 = (objc_class *)objc_opt_class();
          NSStringFromClass(v164);
          v165 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(aSelector);
          v166 = (void *)objc_claimAutoreleasedReturnValue();
          v167 = v217[5];
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)&buf[4] = v165;
          v223 = 2112;
          v224 = v166;
          v225 = 2112;
          v226 = v167;
          _os_log_error_impl(&dword_1D1A22000, v117, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

        }
        *a4 = objc_retainAutorelease(v217[5]);

      }
      else
      {
        if (v116)
        {
          objc_msgSend((id)v206[5], "firstObject");
          v118 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v118, "destination");
          v119 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v119, "radius");
          v121 = v120;
          objc_msgSend(v40, "locationOfInterest");
          v122 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v122, "location");
          v123 = (void *)objc_claimAutoreleasedReturnValue();
          v193 = 0;
          +[SMSuggestionsHelper createMasqueradingReferenceLocationFromFenceRadius:location:error:](SMSuggestionsHelper, "createMasqueradingReferenceLocationFromFenceRadius:location:error:", v123, &v193, v121);
          v124 = (void *)objc_claimAutoreleasedReturnValue();
          v125 = v193;

          v126 = v124;
          v127 = v126;
          if (v125 || (v128 = v126) == 0)
          {
            _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
            v129 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v129, OS_LOG_TYPE_ERROR))
            {
              v168 = (objc_class *)objc_opt_class();
              NSStringFromClass(v168);
              v169 = (id)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(aSelector);
              v170 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413058;
              *(_QWORD *)&buf[4] = v169;
              v223 = 2112;
              v224 = v170;
              v225 = 2112;
              v226 = v127;
              v227 = 2112;
              v228 = (uint64_t)v125;
              _os_log_error_impl(&dword_1D1A22000, v129, OS_LOG_TYPE_ERROR, "%@, %@, masqueradingLocation, %@, error, %@", buf, 0x2Au);

            }
            objc_msgSend(v40, "locationOfInterest");
            v130 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v130, "location");
            v128 = (void *)objc_claimAutoreleasedReturnValue();

          }
          v131 = objc_alloc(MEMORY[0x1E0D8BA90]);
          v132 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:duration:", v186, 3600.0);
          objc_msgSend(v40, "locationOfInterest");
          v133 = (void *)objc_claimAutoreleasedReturnValue();
          v134 = (void *)objc_msgSend(v131, "initWithSuggestionTrigger:suggestionUserType:suppressionReason:sessionType:sourceLocation:destinationLocation:buddy:dateInterval:creationDate:locationOfInterest:", v189, 2, 1, 2, v187, v128, v116, v132, v186, v133);

          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          v135 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v135, OS_LOG_TYPE_INFO))
          {
            v136 = (objc_class *)objc_opt_class();
            NSStringFromClass(v136);
            v137 = (id)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(aSelector);
            v138 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            *(_QWORD *)&buf[4] = v137;
            v223 = 2112;
            v224 = v138;
            v225 = 2112;
            v226 = v134;
            _os_log_impl(&dword_1D1A22000, v135, OS_LOG_TYPE_INFO, "%@, %@, suggestion created, %@", buf, 0x20u);

          }
          if (a4)
            *a4 = objc_retainAutorelease(v125);
          v8 = v134;

          goto LABEL_104;
        }
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v147 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v147, OS_LOG_TYPE_INFO))
        {
          v148 = (objc_class *)objc_opt_class();
          NSStringFromClass(v148);
          v149 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(aSelector);
          v150 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v206[5], "firstObject");
          v151 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v151, "conversation");
          v152 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v152, "receiverHandles");
          v153 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v153, "firstObject");
          v154 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          *(_QWORD *)&buf[4] = v149;
          v223 = 2112;
          v224 = v150;
          v225 = 2112;
          v226 = 0;
          v227 = 2112;
          v228 = (uint64_t)v154;
          _os_log_impl(&dword_1D1A22000, v147, OS_LOG_TYPE_INFO, "%@, %@, invalid contact information, %@, handle, %@", buf, 0x2Au);

        }
      }
      v8 = 0;
    }
LABEL_104:

    goto LABEL_105;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", buf, 2u);
  }

  if (a4)
  {
    _RTErrorInvalidParameterCreate((uint64_t)CFSTR("context"));
    v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
LABEL_111:

  return v8;
}

void __90__SMSuggestionsManager__generatePersonalizedSuggestionForOccasionalUserFromContext_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_generatePersonalizedSuggestionForFirstTimeUserFromContext:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  id v8;
  id *v9;
  id *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  objc_class *v15;
  id v16;
  void *v17;
  double v18;
  double v19;
  NSObject *v20;
  objc_class *v21;
  id v22;
  id v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  id *v25;
  NSObject *v26;
  id v27;
  id *v28;
  BOOL v29;
  NSObject *v30;
  NSObject *v31;
  objc_class *v32;
  id v33;
  id v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  objc_class *v37;
  id v38;
  void *v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  id v41;
  void *v42;
  NSObject *v43;
  float v44;
  float v45;
  float v46;
  objc_class *v47;
  id v48;
  id v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  objc_class *v51;
  id v52;
  void *v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  objc_class *v55;
  id v56;
  void *v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  NSObject *v59;
  objc_class *v60;
  id v61;
  void *v62;
  dispatch_semaphore_t v63;
  void *v64;
  NSObject *v65;
  void *v66;
  dispatch_time_t v67;
  void *v68;
  double v69;
  double v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  NSObject *v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  id v81;
  void *v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  void *v86;
  NSObject *v87;
  objc_class *v88;
  id v89;
  void *v90;
  id *v91;
  BOOL v92;
  uint64_t v93;
  id *v94;
  BOOL v95;
  BOOL v96;
  int v97;
  _BOOL4 v98;
  NSObject *v99;
  objc_class *v100;
  id v101;
  uint64_t v102;
  void *v103;
  const __CFString *v104;
  NSObject *v106;
  objc_class *v107;
  id v108;
  void *v109;
  objc_class *v110;
  id v111;
  void *v112;
  uint64_t (*v113)(uint64_t, uint64_t);
  NSObject *v114;
  id v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  NSObject *v123;
  objc_class *v124;
  id v125;
  void *v126;
  NSObject *v127;
  objc_class *v128;
  id v129;
  void *v130;
  void *v131;
  objc_class *v132;
  id v133;
  void *v134;
  uint64_t (*v135)(uint64_t, uint64_t);
  objc_class *v136;
  id v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  char v143;
  NSObject *log;
  id v145;
  uint64_t v146;
  uint64_t v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  unint64_t v152;
  id v154;
  id v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  _QWORD v160[4];
  NSObject *v161;
  _BYTE *v162;
  uint64_t *v163;
  id v164;
  id v165;
  id v166;
  id v167;
  id obj;
  uint64_t v169;
  uint64_t *v170;
  uint64_t v171;
  uint64_t (*v172)(uint64_t, uint64_t);
  void (*v173)(uint64_t);
  id v174;
  _BYTE v175[12];
  __int16 v176;
  uint64_t v177;
  __int16 v178;
  void *v179;
  __int16 v180;
  const __CFString *v181;
  uint8_t v182[128];
  _BYTE buf[24];
  uint64_t (*v184)(uint64_t, uint64_t);
  _BYTE v185[20];
  _QWORD v186[4];

  v186[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    v169 = 0;
    v170 = &v169;
    v171 = 0x3032000000;
    v172 = __Block_byref_object_copy__102;
    v173 = __Block_byref_object_dispose__102;
    v174 = 0;
    obj = 0;
    v152 = -[SMSuggestionsManager _getSuggestionTriggerFromContext:error:](self, "_getSuggestionTriggerFromContext:error:", v6, &obj);
    objc_storeStrong(&v174, obj);
    if (a4 && v170[5])
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v37 = (objc_class *)objc_opt_class();
        NSStringFromClass(v37);
        v38 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = (uint64_t (*)(uint64_t, uint64_t))v170[5];
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v38;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v39;
        *(_WORD *)&buf[22] = 2112;
        v184 = v40;
        _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

      }
      v8 = 0;
      *a4 = objc_retainAutorelease((id)v170[5]);
      goto LABEL_51;
    }
    if (!v152)
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v15 = (objc_class *)objc_opt_class();
        NSStringFromClass(v15);
        v16 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v16;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v17;
        _os_log_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_INFO, "%@, %@, no valid triggers found", buf, 0x16u);

      }
      v8 = 0;
      goto LABEL_51;
    }
    v9 = (id *)(v170 + 5);
    v167 = (id)v170[5];
    -[SMSuggestionsManager _getSourceLocationFromContext:error:](self, "_getSourceLocationFromContext:error:", v6, &v167);
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v9, v167);
    v10 = (id *)(v170 + 5);
    if (a4 && v170[5])
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v51 = (objc_class *)objc_opt_class();
        NSStringFromClass(v51);
        v52 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = (uint64_t (*)(uint64_t, uint64_t))v170[5];
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v52;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v53;
        *(_WORD *)&buf[22] = 2112;
        v184 = v54;
        _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

      }
      v8 = 0;
      *a4 = objc_retainAutorelease((id)v170[5]);
      goto LABEL_50;
    }
    v166 = (id)v170[5];
    -[SMSuggestionsManager _getCurrentDateFromContext:error:](self, "_getCurrentDateFromContext:error:", v6, &v166);
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v10, v166);
    if (a4 && v170[5])
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v55 = (objc_class *)objc_opt_class();
        NSStringFromClass(v55);
        v56 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = (uint64_t (*)(uint64_t, uint64_t))v170[5];
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v56;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v57;
        *(_WORD *)&buf[22] = 2112;
        v184 = v58;
        _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

      }
      v8 = 0;
      *a4 = objc_retainAutorelease((id)v170[5]);
      goto LABEL_49;
    }
    -[SMSuggestionsManager _getSystemVersionUpdateDate](self, "_getSystemVersionUpdateDate");
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v150, "timeIntervalSinceDate:");
    v19 = v18;
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v22 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v23 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v149, "stringFromDate");
      v24 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      *(_QWORD *)&buf[4] = v22;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v23;
      *(_WORD *)&buf[22] = 2112;
      v184 = v24;
      *(_WORD *)v185 = 2048;
      *(_QWORD *)&v185[2] = (unint64_t)v19;
      *(_WORD *)&v185[10] = 2048;
      *(_QWORD *)&v185[12] = 0x4122750000000000;
      _os_log_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_INFO, "%@, %@, systemVersionUpdateDate, %@, timeIntervalSinceLastVersionUpdate, %lu, kSMSuggestionFirstTimeUserMinimumVersionUpdateTimeInterval, %.3f", buf, 0x34u);

    }
    v8 = 0;
    if (!v149 || v19 < 604800.0)
    {
LABEL_48:

LABEL_49:
LABEL_50:

LABEL_51:
      _Block_object_dispose(&v169, 8);

      goto LABEL_52;
    }
    v25 = (id *)(v170 + 5);
    v165 = (id)v170[5];
    -[SMSuggestionsManager _getNPLOIsToHomeWithOnlyHighConfidence:location:date:error:](self, "_getNPLOIsToHomeWithOnlyHighConfidence:location:date:error:", 1, v151, v150, &v165);
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v25, v165);
    if (a4 && v170[5])
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v110 = (objc_class *)objc_opt_class();
        NSStringFromClass(v110);
        v111 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        v113 = (uint64_t (*)(uint64_t, uint64_t))v170[5];
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v111;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v112;
        *(_WORD *)&buf[22] = 2112;
        v184 = v113;
        _os_log_error_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

      }
      v27 = objc_retainAutorelease((id)v170[5]);
LABEL_35:
      v8 = 0;
      *a4 = v27;
LABEL_47:

      goto LABEL_48;
    }
    if (v148 && objc_msgSend(v148, "count"))
    {
      v28 = (id *)(v170 + 5);
      v164 = (id)v170[5];
      v29 = -[SMSuggestionsManager _isFirstTimeUserOfZelkovaWithError:](self, "_isFirstTimeUserOfZelkovaWithError:", &v164);
      objc_storeStrong(v28, v164);
      if (a4 && v170[5])
      {
        _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          v132 = (objc_class *)objc_opt_class();
          NSStringFromClass(v132);
          v133 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v134 = (void *)objc_claimAutoreleasedReturnValue();
          v135 = (uint64_t (*)(uint64_t, uint64_t))v170[5];
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)&buf[4] = v133;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v134;
          *(_WORD *)&buf[22] = 2112;
          v184 = v135;
          _os_log_error_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

        }
        v27 = objc_retainAutorelease((id)v170[5]);
        goto LABEL_35;
      }
      if (v29)
      {
        v41 = objc_alloc_init(MEMORY[0x1E0CB3578]);
        objc_msgSend(v41, "setDateFormat:", CFSTR("HH.mm"));
        v141 = v41;
        objc_msgSend(v41, "stringFromDate:", v150);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v42, "floatValue");
          *(_DWORD *)buf = 134217984;
          *(double *)&buf[4] = v44;
          _os_log_impl(&dword_1D1A22000, v43, OS_LOG_TYPE_INFO, "Time of the day logged from user context: %f", buf, 0xCu);
        }
        v142 = v42;

        objc_msgSend(v42, "floatValue");
        if (v45 > 10.0)
        {
          objc_msgSend(v42, "floatValue");
          if (v46 < 16.0)
          {
            _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
            log = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
            {
              v47 = (objc_class *)objc_opt_class();
              NSStringFromClass(v47);
              v48 = (id)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              v49 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v150, "stringFromDate");
              v50 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413314;
              *(_QWORD *)&buf[4] = v48;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v49;
              *(_WORD *)&buf[22] = 2112;
              v184 = v50;
              *(_WORD *)v185 = 2048;
              *(_QWORD *)&v185[2] = 0x4024000000000000;
              *(_WORD *)&v185[10] = 2048;
              *(_QWORD *)&v185[12] = 0x4030000000000000;
              _os_log_impl(&dword_1D1A22000, log, OS_LOG_TYPE_INFO, "%@, %@, date check failed, current date, %@, suggestion skipped because time of day is between %f AM to %f PM", buf, 0x34u);

            }
            v8 = 0;
            goto LABEL_108;
          }
        }
        v63 = dispatch_semaphore_create(0);
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        v184 = __Block_byref_object_copy__102;
        *(_QWORD *)v185 = __Block_byref_object_dispose__102;
        *(_QWORD *)&v185[8] = 0;
        -[SMSuggestionsManager suggestionsHelper](self, "suggestionsHelper");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v160[0] = MEMORY[0x1E0C809B0];
        v160[1] = 3221225472;
        v160[2] = __89__SMSuggestionsManager__generatePersonalizedSuggestionForFirstTimeUserFromContext_error___block_invoke;
        v160[3] = &unk_1E9296EE0;
        v162 = buf;
        v163 = &v169;
        v65 = v63;
        v161 = v65;
        objc_msgSend(v64, "fetchMostLikelyReceiverHandlesWithHandler:", v160);

        log = v65;
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = dispatch_time(0, 3600000000000);
        if (!dispatch_semaphore_wait(log, v67))
          goto LABEL_69;
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "timeIntervalSinceDate:", v66);
        v70 = v69;
        v71 = (void *)objc_opt_new();
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_607);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "filteredArrayUsingPredicate:", v72);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "firstObject");
        v75 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v71, "submitToCoreAnalytics:type:duration:", v75, 1, v70);
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v76 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v76, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v175 = 0;
          _os_log_fault_impl(&dword_1D1A22000, v76, OS_LOG_TYPE_FAULT, "Invalid parameter not satisfying: authorizationManager", v175, 2u);
        }

        v77 = (void *)MEMORY[0x1E0CB35C8];
        v186[0] = *MEMORY[0x1E0CB2D50];
        *(_QWORD *)v175 = CFSTR("semaphore wait timeout");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v175, v186, 1);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v78);
        v79 = (void *)objc_claimAutoreleasedReturnValue();

        if (v79)
        {
          v80 = objc_retainAutorelease(v79);

        }
        else
        {
LABEL_69:
          v80 = 0;
        }

        v81 = v80;
        v82 = *(void **)(*(_QWORD *)&buf[8] + 40);
        v140 = v81;
        if (v82 && objc_msgSend(v82, "count"))
        {
          v158 = 0u;
          v159 = 0u;
          v156 = 0u;
          v157 = 0u;
          v145 = *(id *)(*(_QWORD *)&buf[8] + 40);
          v83 = objc_msgSend(v145, "countByEnumeratingWithState:objects:count:", &v156, v182, 16);
          if (v83)
          {
            v143 = 0;
            v146 = *(_QWORD *)v157;
LABEL_74:
            v84 = 0;
            v147 = v83;
            while (1)
            {
              if (*(_QWORD *)v157 != v146)
                objc_enumerationMutation(v145);
              v85 = *(void **)(*((_QWORD *)&v156 + 1) + 8 * v84);
              v86 = (void *)MEMORY[0x1D8231EA8]();
              _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
              v87 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
              {
                v88 = (objc_class *)objc_opt_class();
                NSStringFromClass(v88);
                v89 = (id)objc_claimAutoreleasedReturnValue();
                NSStringFromSelector(a2);
                v90 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)v175 = 138412802;
                *(_QWORD *)&v175[4] = v89;
                v176 = 2112;
                v177 = (uint64_t)v90;
                v178 = 2112;
                v179 = v85;
                _os_log_impl(&dword_1D1A22000, v87, OS_LOG_TYPE_INFO, "%@, %@, handle, %@", v175, 0x20u);

              }
              v91 = (id *)(v170 + 5);
              v155 = (id)v170[5];
              v92 = -[SMSuggestionsManager _checkReceiverEligibilityForHandle:error:](self, "_checkReceiverEligibilityForHandle:error:", v85, &v155);
              objc_storeStrong(v91, v155);
              v94 = (id *)(v170 + 5);
              v93 = v170[5];
              v95 = v93 == 0;
              if (v93)
                v96 = 0;
              else
                v96 = v92;
              if (v95)
                v97 = 7;
              else
                v97 = 6;
              if (v96)
              {
                v154 = 0;
                v98 = -[SMSuggestionsManager _didInteractInPastWithHandle:timeInterval:error:](self, "_didInteractInPastWithHandle:timeInterval:error:", v85, &v154, 604800.0);
                objc_storeStrong(v94, v154);
                _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
                v99 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v99, OS_LOG_TYPE_INFO))
                {
                  v100 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v100);
                  v101 = (id)objc_claimAutoreleasedReturnValue();
                  NSStringFromSelector(a2);
                  v102 = objc_claimAutoreleasedReturnValue();
                  v103 = (void *)v102;
                  *(_DWORD *)v175 = 138413058;
                  v104 = CFSTR("NO");
                  if (v98)
                    v104 = CFSTR("YES");
                  *(_QWORD *)&v175[4] = v101;
                  v176 = 2112;
                  v177 = v102;
                  v178 = 2112;
                  v179 = v85;
                  v180 = 2112;
                  v181 = v104;
                  _os_log_impl(&dword_1D1A22000, v99, OS_LOG_TYPE_INFO, "%@, %@, handle, %@, interactedWithHandle, %@", v175, 0x2Au);

                }
                if (v170[5])
                {
                  v97 = 6;
                }
                else
                {
                  v143 |= v98;
                  if (v98)
                    v97 = 6;
                  else
                    v97 = 0;
                }
              }
              objc_autoreleasePoolPop(v86);
              if (v97 != 7 && v97 != 0)
                break;
              if (v147 == ++v84)
              {
                v83 = objc_msgSend(v145, "countByEnumeratingWithState:objects:count:", &v156, v182, 16);
                if (v83)
                  goto LABEL_74;
                break;
              }
            }
          }
          else
          {
            v143 = 0;
          }

          if (a4 && v170[5])
          {
            _rt_log_facility_get_os_log(RTLogFacilityWorkout);
            v114 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v114, OS_LOG_TYPE_ERROR))
            {
              v136 = (objc_class *)objc_opt_class();
              NSStringFromClass(v136);
              v137 = (id)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              v138 = (void *)objc_claimAutoreleasedReturnValue();
              v139 = (void *)v170[5];
              *(_DWORD *)v175 = 138412802;
              *(_QWORD *)&v175[4] = v137;
              v176 = 2112;
              v177 = (uint64_t)v138;
              v178 = 2112;
              v179 = v139;
              _os_log_error_impl(&dword_1D1A22000, v114, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v175, 0x20u);

            }
            v8 = 0;
            *a4 = objc_retainAutorelease((id)v170[5]);
            goto LABEL_107;
          }
          if ((v143 & 1) != 0)
          {
            v115 = objc_alloc(MEMORY[0x1E0D8BA90]);
            objc_msgSend(v148, "firstObject");
            v116 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v116, "locationOfInterest");
            v117 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v117, "location");
            v118 = (void *)objc_claimAutoreleasedReturnValue();
            v119 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:duration:", v150, 3600.0);
            objc_msgSend(v148, "firstObject");
            v120 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v120, "locationOfInterest");
            v121 = (void *)objc_claimAutoreleasedReturnValue();
            v122 = (void *)objc_msgSend(v115, "initWithSuggestionTrigger:suggestionUserType:suppressionReason:sessionType:sourceLocation:destinationLocation:buddy:dateInterval:creationDate:locationOfInterest:", v152, 3, 1, 2, v151, v118, 0, v119, v150, v121, v140);

            _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
            v123 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v123, OS_LOG_TYPE_INFO))
            {
              v124 = (objc_class *)objc_opt_class();
              NSStringFromClass(v124);
              v125 = (id)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              v126 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)v175 = 138412802;
              *(_QWORD *)&v175[4] = v125;
              v176 = 2112;
              v177 = (uint64_t)v126;
              v178 = 2112;
              v179 = v122;
              _os_log_impl(&dword_1D1A22000, v123, OS_LOG_TYPE_INFO, "%@, %@, suggestion created, %@", v175, 0x20u);

            }
            v8 = v122;
            goto LABEL_107;
          }
          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          v127 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v127, OS_LOG_TYPE_INFO))
          {
            v128 = (objc_class *)objc_opt_class();
            NSStringFromClass(v128);
            v129 = (id)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v130 = (void *)objc_claimAutoreleasedReturnValue();
            v131 = *(void **)(*(_QWORD *)&buf[8] + 40);
            *(_DWORD *)v175 = 138412802;
            *(_QWORD *)&v175[4] = v129;
            v176 = 2112;
            v177 = (uint64_t)v130;
            v178 = 2112;
            v179 = v131;
            _os_log_impl(&dword_1D1A22000, v127, OS_LOG_TYPE_INFO, "%@, %@, no eligible buddy for first time user, handles, %@", v175, 0x20u);

          }
        }
        else
        {
          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          v106 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v106, OS_LOG_TYPE_INFO))
          {
            v107 = (objc_class *)objc_opt_class();
            NSStringFromClass(v107);
            v108 = (id)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v109 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v175 = 138412546;
            *(_QWORD *)&v175[4] = v108;
            v176 = 2112;
            v177 = (uint64_t)v109;
            _os_log_impl(&dword_1D1A22000, v106, OS_LOG_TYPE_INFO, "%@, %@, likely receivers don't exist", v175, 0x16u);

          }
        }
        v8 = 0;
LABEL_107:

        _Block_object_dispose(buf, 8);
LABEL_108:

        goto LABEL_47;
      }
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v59 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
      {
        v60 = (objc_class *)objc_opt_class();
        NSStringFromClass(v60);
        v61 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v61;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v62;
        _os_log_impl(&dword_1D1A22000, v59, OS_LOG_TYPE_INFO, "%@, %@, not a first time user, user already used zelkova before,", buf, 0x16u);

      }
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        v32 = (objc_class *)objc_opt_class();
        NSStringFromClass(v32);
        v33 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v34 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D8BA90], "stringFromSMSuggestionTrigger:", v152);
        v35 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v33;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v34;
        *(_WORD *)&buf[22] = 2112;
        v184 = v35;
        _os_log_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_INFO, "%@, %@, trigger type, %@, suggestion skipped because nploi to Home with High confidence is not found", buf, 0x20u);

      }
    }
    v8 = 0;
    goto LABEL_47;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", buf, 2u);
  }

  if (a4)
  {
    _RTErrorInvalidParameterCreate((uint64_t)CFSTR("context"));
    v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
LABEL_52:

  return v8;
}

void __89__SMSuggestionsManager__generatePersonalizedSuggestionForFirstTimeUserFromContext_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_generatePersonalizedSuggestionForWorkoutUserFromContext:(id)a3 error:(id *)a4
{
  id v5;
  unint64_t v6;
  NSObject *v7;
  id v8;
  id *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  objc_class *v13;
  id v14;
  void *v15;
  dispatch_semaphore_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  dispatch_time_t v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  NSObject *v40;
  objc_class *v41;
  id v42;
  void *v43;
  id *v44;
  BOOL v45;
  uint64_t v46;
  id *v47;
  BOOL v48;
  BOOL v49;
  int v50;
  _BOOL4 v51;
  NSObject *v52;
  objc_class *v53;
  id v54;
  uint64_t v55;
  void *v56;
  const __CFString *v57;
  uint64_t v58;
  id *v59;
  BOOL v60;
  _BOOL4 v61;
  uint64_t v62;
  NSObject *v64;
  objc_class *v65;
  id v66;
  void *v67;
  NSObject *v68;
  id v69;
  void *v70;
  void *v71;
  NSObject *v72;
  objc_class *v73;
  id v74;
  void *v75;
  objc_class *v76;
  id v77;
  void *v78;
  uint64_t (*v79)(uint64_t, uint64_t);
  NSObject *v80;
  objc_class *v81;
  id v82;
  id v83;
  __CFString *v84;
  objc_class *v86;
  id v87;
  void *v88;
  uint64_t (*v89)(uint64_t, uint64_t);
  objc_class *v90;
  id v91;
  void *v92;
  void *v93;
  id v94;
  void *v95;
  NSObject *dsema;
  NSObject *v97;
  id v98;
  void *v99;
  id v102;
  id v103;
  id v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  _QWORD v109[4];
  NSObject *v110;
  _BYTE *v111;
  uint8_t *v112;
  id v113;
  id obj;
  uint8_t v115[8];
  uint8_t *v116;
  uint64_t v117;
  uint64_t (*v118)(uint64_t, uint64_t);
  void (*v119)(uint64_t);
  id v120;
  _BYTE v121[12];
  __int16 v122;
  uint64_t v123;
  __int16 v124;
  void *v125;
  __int16 v126;
  const __CFString *v127;
  uint8_t v128[128];
  _BYTE buf[24];
  uint64_t (*v130)(uint64_t, uint64_t);
  void (*v131)(uint64_t);
  id v132;
  _QWORD v133[4];

  v133[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v99 = v5;
  if (v5)
  {
    *(_QWORD *)v115 = 0;
    v116 = v115;
    v117 = 0x3032000000;
    v118 = __Block_byref_object_copy__102;
    v119 = __Block_byref_object_dispose__102;
    v120 = 0;
    obj = 0;
    v6 = -[SMSuggestionsManager _getSuggestionTriggerFromContext:error:](self, "_getSuggestionTriggerFromContext:error:", v5, &obj);
    objc_storeStrong(&v120, obj);
    if (a4 && *((_QWORD *)v116 + 5))
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v76 = (objc_class *)objc_opt_class();
        NSStringFromClass(v76);
        v77 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        v79 = (uint64_t (*)(uint64_t, uint64_t))*((_QWORD *)v116 + 5);
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v77;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v78;
        *(_WORD *)&buf[22] = 2112;
        v130 = v79;
        _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

      }
      v8 = 0;
      *a4 = objc_retainAutorelease(*((id *)v116 + 5));
      goto LABEL_82;
    }
    if (v6 != 4)
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = (objc_class *)objc_opt_class();
        NSStringFromClass(v13);
        v14 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v14;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v15;
        _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_INFO, "%@, %@, no valid triggers found", buf, 0x16u);

      }
      v8 = 0;
      goto LABEL_82;
    }
    v9 = (id *)(v116 + 40);
    v113 = (id)*((_QWORD *)v116 + 5);
    -[SMSuggestionsManager _getCurrentDateFromContext:error:](self, "_getCurrentDateFromContext:error:", v99, &v113);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v9, v113);
    if (a4 && *((_QWORD *)v116 + 5))
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v86 = (objc_class *)objc_opt_class();
        NSStringFromClass(v86);
        v87 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        v89 = (uint64_t (*)(uint64_t, uint64_t))*((_QWORD *)v116 + 5);
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v87;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v88;
        *(_WORD *)&buf[22] = 2112;
        v130 = v89;
        _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

      }
      v8 = 0;
      *a4 = objc_retainAutorelease(*((id *)v116 + 5));
      goto LABEL_81;
    }
    v16 = dispatch_semaphore_create(0);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v130 = __Block_byref_object_copy__102;
    v131 = __Block_byref_object_dispose__102;
    v132 = 0;
    -[SMSuggestionsManager suggestionsHelper](self, "suggestionsHelper");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v109[0] = MEMORY[0x1E0C809B0];
    v109[1] = 3221225472;
    v109[2] = __87__SMSuggestionsManager__generatePersonalizedSuggestionForWorkoutUserFromContext_error___block_invoke;
    v109[3] = &unk_1E9296EE0;
    v111 = buf;
    v112 = v115;
    v18 = v16;
    v110 = v18;
    objc_msgSend(v17, "fetchMostLikelyReceiverHandlesWithHandler:", v109);

    dsema = v18;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(dsema, v20))
      goto LABEL_26;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "timeIntervalSinceDate:", v19);
    v23 = v22;
    v24 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_607);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "filteredArrayUsingPredicate:", v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "firstObject");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "submitToCoreAnalytics:type:duration:", v28, 1, v23);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v121 = 0;
      _os_log_fault_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_FAULT, "Invalid parameter not satisfying: authorizationManager", v121, 2u);
    }

    v30 = (void *)MEMORY[0x1E0CB35C8];
    v133[0] = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)v121 = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v121, v133, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      v33 = objc_retainAutorelease(v32);

    }
    else
    {
LABEL_26:
      v33 = 0;
    }

    v94 = v33;
    v34 = *(void **)(*(_QWORD *)&buf[8] + 40);
    if (v34 && objc_msgSend(v34, "count"))
    {
      v107 = 0u;
      v108 = 0u;
      v105 = 0u;
      v106 = 0u;
      v98 = *(id *)(*(_QWORD *)&buf[8] + 40);
      v35 = objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v105, v128, 16);
      if (v35)
      {
        v97 = 0;
        v36 = *(_QWORD *)v106;
LABEL_31:
        v37 = 0;
        while (1)
        {
          if (*(_QWORD *)v106 != v36)
            objc_enumerationMutation(v98);
          v38 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * v37);
          v39 = (void *)MEMORY[0x1D8231EA8]();
          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          v40 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
          {
            v41 = (objc_class *)objc_opt_class();
            NSStringFromClass(v41);
            v42 = (id)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v121 = 138412802;
            *(_QWORD *)&v121[4] = v42;
            v122 = 2112;
            v123 = (uint64_t)v43;
            v124 = 2112;
            v125 = v38;
            _os_log_impl(&dword_1D1A22000, v40, OS_LOG_TYPE_INFO, "%@, %@, handle, %@", v121, 0x20u);

          }
          v44 = (id *)(v116 + 40);
          v104 = (id)*((_QWORD *)v116 + 5);
          v45 = -[SMSuggestionsManager _checkReceiverEligibilityForHandle:error:](self, "_checkReceiverEligibilityForHandle:error:", v38, &v104);
          objc_storeStrong(v44, v104);
          v47 = (id *)(v116 + 40);
          v46 = *((_QWORD *)v116 + 5);
          v48 = v46 == 0;
          if (v46)
            v49 = 0;
          else
            v49 = v45;
          if (v48)
            v50 = 7;
          else
            v50 = 6;
          if (v49)
          {
            v103 = 0;
            v51 = -[SMSuggestionsManager _didInteractInPastWithHandle:timeInterval:error:](self, "_didInteractInPastWithHandle:timeInterval:error:", v38, &v103, 604800.0);
            objc_storeStrong(v47, v103);
            _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
            v52 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
            {
              v53 = (objc_class *)objc_opt_class();
              NSStringFromClass(v53);
              v54 = (id)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              v55 = objc_claimAutoreleasedReturnValue();
              v56 = (void *)v55;
              *(_DWORD *)v121 = 138413058;
              v57 = CFSTR("NO");
              if (v51)
                v57 = CFSTR("YES");
              *(_QWORD *)&v121[4] = v54;
              v122 = 2112;
              v123 = v55;
              v124 = 2112;
              v125 = v38;
              v126 = 2112;
              v127 = v57;
              _os_log_impl(&dword_1D1A22000, v52, OS_LOG_TYPE_INFO, "%@, %@, handle, %@, interactedWithHandle, %@", v121, 0x2Au);

            }
            v59 = (id *)(v116 + 40);
            v58 = *((_QWORD *)v116 + 5);
            v60 = v58 == 0;
            if (v58)
              v61 = 0;
            else
              v61 = v51;
            if (v60)
              v50 = 0;
            else
              v50 = 6;
            if (v61)
            {
              v102 = 0;
              -[SMSuggestionsManager _getSMContactInformationFromSMHandle:error:](self, "_getSMContactInformationFromSMHandle:error:", v38, &v102);
              v62 = objc_claimAutoreleasedReturnValue();
              objc_storeStrong(v59, v102);

              v50 = 6;
              v97 = v62;
            }
          }
          objc_autoreleasePoolPop(v39);
          if (v50 != 7 && v50 != 0)
            break;
          if (v35 == ++v37)
          {
            v35 = objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v105, v128, 16);
            if (v35)
              goto LABEL_31;
            break;
          }
        }
      }
      else
      {
        v97 = 0;
      }

      if (a4 && *((_QWORD *)v116 + 5))
      {
        _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        v68 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
        {
          v90 = (objc_class *)objc_opt_class();
          NSStringFromClass(v90);
          v91 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          v93 = (void *)*((_QWORD *)v116 + 5);
          *(_DWORD *)v121 = 138412802;
          *(_QWORD *)&v121[4] = v91;
          v122 = 2112;
          v123 = (uint64_t)v92;
          v124 = 2112;
          v125 = v93;
          _os_log_error_impl(&dword_1D1A22000, v68, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v121, 0x20u);

        }
        v8 = 0;
        *a4 = objc_retainAutorelease(*((id *)v116 + 5));
LABEL_75:
        v64 = v97;
        goto LABEL_80;
      }
      if (v97)
      {
        v69 = objc_alloc(MEMORY[0x1E0D8BA90]);
        v70 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:duration:", v95, 3600.0);
        v71 = (void *)objc_msgSend(v69, "initWithSuggestionTrigger:suggestionUserType:suppressionReason:sessionType:sourceLocation:destinationLocation:buddy:dateInterval:creationDate:locationOfInterest:", 4, 4, 1, 4, 0, 0, v97, v70, v95, 0, v94);

        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v72 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
        {
          v73 = (objc_class *)objc_opt_class();
          NSStringFromClass(v73);
          v74 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v121 = 138412802;
          *(_QWORD *)&v121[4] = v74;
          v122 = 2112;
          v123 = (uint64_t)v75;
          v124 = 2112;
          v125 = v71;
          _os_log_impl(&dword_1D1A22000, v72, OS_LOG_TYPE_INFO, "%@, %@, suggestion created, %@", v121, 0x20u);

        }
        v8 = v71;
        goto LABEL_75;
      }
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v80 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
      {
        v81 = (objc_class *)objc_opt_class();
        NSStringFromClass(v81);
        v82 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v83 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "firstObject");
        v84 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v121 = 138413058;
        *(_QWORD *)&v121[4] = v82;
        v122 = 2112;
        v123 = (uint64_t)v83;
        v124 = 2112;
        v125 = 0;
        v126 = 2112;
        v127 = v84;
        _os_log_impl(&dword_1D1A22000, v80, OS_LOG_TYPE_INFO, "%@, %@, invalid contact information, %@, handle, %@", v121, 0x2Au);

      }
      v64 = 0;
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v64 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
      {
        v65 = (objc_class *)objc_opt_class();
        NSStringFromClass(v65);
        v66 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v121 = 138412546;
        *(_QWORD *)&v121[4] = v66;
        v122 = 2112;
        v123 = (uint64_t)v67;
        _os_log_impl(&dword_1D1A22000, v64, OS_LOG_TYPE_INFO, "%@, %@, likely receivers don't exist", v121, 0x16u);

        v8 = 0;
LABEL_80:

        _Block_object_dispose(buf, 8);
LABEL_81:

LABEL_82:
        _Block_object_dispose(v115, 8);

        goto LABEL_83;
      }
    }
    v8 = 0;
    goto LABEL_80;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v115 = 0;
    _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", v115, 2u);
  }

  if (a4)
  {
    _RTErrorInvalidParameterCreate((uint64_t)CFSTR("context"));
    v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
LABEL_83:

  return v8;
}

void __87__SMSuggestionsManager__generatePersonalizedSuggestionForWorkoutUserFromContext_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)_showSuggestionsDetectionUIWithSuggestion:(id)a3 error:(id *)a4
{
  uint64_t (*v5)(uint64_t, uint64_t);
  void *v6;
  NSObject *v7;
  BOOL v8;
  void *v9;
  char v10;
  NSObject *v11;
  objc_class *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  NSObject *v25;
  id v26;
  void *v27;
  NSObject *v28;
  objc_class *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  dispatch_semaphore_t v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  NSObject *v39;
  void *v40;
  dispatch_time_t v41;
  void *v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  BOOL v55;
  dispatch_semaphore_t v56;
  void *v57;
  void *v58;
  NSObject *v59;
  void *v60;
  dispatch_time_t v61;
  void *v62;
  double v63;
  double v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  NSObject *v70;
  void *v71;
  void *v72;
  id v73;
  void *v74;
  void *v75;
  objc_class *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  void *v82;
  uint64_t (*v83)(uint64_t, uint64_t);
  uint64_t (*v84)(uint64_t, uint64_t);
  NSObject *v85;
  uint64_t (*v86)(uint64_t, uint64_t);
  NSObject *v87;
  uint64_t (*v88)(uint64_t, uint64_t);
  uint64_t (*v89)(uint64_t, uint64_t);
  NSObject *v90;
  uint64_t (*v91)(uint64_t, uint64_t);
  NSObject *v92;
  void *v93;
  void *v94;
  void *v95;
  BOOL v96;
  void *v97;
  void *v98;
  unint64_t v99;
  void *v100;
  unint64_t v101;
  void *v102;
  void *v103;
  void *v104;
  double v105;
  double v106;
  void *v107;
  void *v108;
  void *v109;
  unint64_t v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  uint64_t v116;
  void *v117;
  void *v118;
  uint64_t v119;
  void *v120;
  _BOOL4 v121;
  id v122;
  void *v123;
  void *v124;
  double v125;
  double v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  dispatch_semaphore_t v131;
  id v132;
  objc_class *v133;
  void *v134;
  void *v135;
  void *v136;
  NSObject *v137;
  void *v138;
  dispatch_time_t v139;
  void *v140;
  double v141;
  double v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  NSObject *v148;
  void *v149;
  void *v150;
  char v151;
  id v152;
  void *v153;
  NSObject *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  uint64_t v161;
  void *v162;
  NSObject *v163;
  NSObject *v164;
  id v165;
  id v166;
  void *v167;
  id v168;
  void *v169;
  void *v170;
  void *v171;
  NSObject *v172;
  objc_class *v173;
  id v174;
  id v175;
  uint64_t v176;
  NSObject *v177;
  void *v178;
  void *v179;
  void *v180;
  id *v181;
  NSObject *v182;
  uint64_t v183;
  NSObject *v184;
  NSObject *v185;
  objc_class *v186;
  id v187;
  id v188;
  uint64_t (*v189)(uint64_t, uint64_t);
  uint64_t v190;
  NSObject *v191;
  objc_class *v192;
  id v193;
  id v194;
  uint64_t (*v195)(uint64_t, uint64_t);
  uint64_t v196;
  void *v197;
  void *v198;
  id v199;
  objc_class *v200;
  id v201;
  void *v202;
  uint64_t (*v203)(uint64_t, uint64_t);
  objc_class *v204;
  id v205;
  void *v206;
  void *v207;
  NSObject *v208;
  objc_class *v209;
  id v210;
  id v211;
  RTUserNotification *v212;
  RTUserNotification *v213;
  RTUserNotificationAction *v214;
  void *v215;
  RTUserNotificationAction *v216;
  void *v217;
  void *v218;
  uint64_t v219;
  void *v220;
  objc_class *v222;
  id v223;
  void *v224;
  objc_class *v225;
  id v226;
  void *v227;
  uint64_t (*v228)(uint64_t, uint64_t);
  objc_class *v229;
  id v230;
  void *v231;
  uint64_t (*v232)(uint64_t, uint64_t);
  objc_class *v233;
  id v234;
  void *v235;
  objc_class *v236;
  id v237;
  void *v238;
  uint64_t (*v239)(uint64_t, uint64_t);
  objc_class *v240;
  id v241;
  id v242;
  void *v243;
  objc_class *v244;
  id v245;
  void *v246;
  uint64_t (*v247)(uint64_t, uint64_t);
  objc_class *v248;
  id v249;
  void *v250;
  uint64_t (*v251)(uint64_t, uint64_t);
  objc_class *v252;
  id v253;
  void *v254;
  void *v255;
  uint64_t v256;
  uint64_t v257;
  void *v258;
  void *v259;
  void *v260;
  void *v261;
  void *v262;
  void *v263;
  id v264;
  uint64_t v265;
  void *v266;
  dispatch_semaphore_t dsemab;
  NSObject *dsema;
  dispatch_semaphore_t dsemaa;
  char v270;
  uint64_t (*v271)(uint64_t, uint64_t);
  void *v273;
  SMSuggestionsManager *v274;
  _QWORD v276[7];
  id v277;
  id v278;
  id v279;
  _QWORD v280[4];
  NSObject *v281;
  _BYTE *v282;
  _BYTE *v283;
  _QWORD v284[4];
  NSObject *v285;
  _BYTE *v286;
  _BYTE *v287;
  _QWORD v288[4];
  NSObject *v289;
  _BYTE *v290;
  _BYTE *v291;
  id obj;
  RTUserNotificationAction *v293;
  void *v294;
  uint64_t v295;
  void *v296;
  uint64_t v297;
  void *v298;
  _BYTE v299[12];
  __int16 v300;
  id v301;
  __int16 v302;
  void *v303;
  _BYTE v304[24];
  uint64_t (*v305)(uint64_t, uint64_t);
  void (*v306)(uint64_t);
  id v307;
  _BYTE v308[24];
  uint64_t (*v309)(uint64_t, uint64_t);
  __int128 v310;
  _BYTE v311[24];
  uint64_t (*v312)(uint64_t, uint64_t);
  void (*v313)(uint64_t);
  id v314;
  uint64_t v315;
  void *v316;
  _BYTE buf[24];
  uint64_t (*v318)(uint64_t, uint64_t);
  void (*v319)(uint64_t);
  id v320;
  _QWORD v321[4];

  v321[1] = *MEMORY[0x1E0C80C00];
  v5 = (uint64_t (*)(uint64_t, uint64_t))a3;
  if (v5)
  {
    v274 = self;
    -[SMSuggestionsManager platform](self, "platform");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "iPhoneDevice"))
    {

      goto LABEL_9;
    }
    -[SMSuggestionsManager platform](v274, "platform");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "watchPlatform");

    if ((v10 & 1) != 0)
    {
LABEL_9:
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = (objc_class *)objc_opt_class();
        NSStringFromClass(v12);
        v13 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v14 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v13;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v14;
        *(_WORD *)&buf[22] = 2112;
        v318 = v5;
        _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "%@, %@, trying to show suggestion detection UI, suggestion, %@", buf, 0x20u);

      }
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v318 = __Block_byref_object_copy__102;
      v319 = __Block_byref_object_dispose__102;
      v320 = 0;
      objc_msgSend(v5, "buddy");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "email");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        v17 = objc_alloc(MEMORY[0x1E0D8B960]);
        objc_msgSend(v5, "buddy");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "email");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v17, "initWithPrimaryHandle:secondaryHandles:", v19, MEMORY[0x1E0C9AA60]);
      }
      else
      {
        objc_msgSend(v5, "buddy");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "phoneNumber");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v22)
          goto LABEL_21;
        v23 = objc_alloc(MEMORY[0x1E0D8B960]);
        objc_msgSend(v5, "buddy");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "phoneNumber");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v23, "initWithPrimaryHandle:secondaryHandles:", v19, MEMORY[0x1E0C9AA60]);
      }
      v273 = (void *)v20;

      if (v273)
      {
        v24 = *(_QWORD *)&buf[8];
        obj = *(id *)(*(_QWORD *)&buf[8] + 40);
        v8 = -[SMSuggestionsManager _checkReceiverEligibilityForHandle:error:](v274, "_checkReceiverEligibilityForHandle:error:", v273, &obj);
        objc_storeStrong((id *)(v24 + 40), obj);
        if (a4 && *(_QWORD *)(*(_QWORD *)&buf[8] + 40))
        {
          _rt_log_facility_get_os_log(RTLogFacilityWorkout);
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            v200 = (objc_class *)objc_opt_class();
            NSStringFromClass(v200);
            v201 = (id)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v202 = (void *)objc_claimAutoreleasedReturnValue();
            v203 = *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)&buf[8] + 40);
            *(_DWORD *)v311 = 138412802;
            *(_QWORD *)&v311[4] = v201;
            *(_WORD *)&v311[12] = 2112;
            *(_QWORD *)&v311[14] = v202;
            *(_WORD *)&v311[22] = 2112;
            v312 = v203;
            _os_log_error_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v311, 0x20u);

          }
          v26 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
          goto LABEL_44;
        }
        if (!v8)
        {
          v74 = (void *)MEMORY[0x1E0CB35C8];
          v315 = *MEMORY[0x1E0CB2D50];
          v75 = (void *)MEMORY[0x1E0CB3940];
          v76 = (objc_class *)objc_opt_class();
          NSStringFromClass(v76);
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v75, "stringWithFormat:", CFSTR("%@, %@, suggestion has buddy handle that is not an eligible receiver, %@"), v77, v78, v273);
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          v316 = v79;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v316, &v315, 1);
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v80);
          v81 = objc_claimAutoreleasedReturnValue();
          v82 = *(void **)(*(_QWORD *)&buf[8] + 40);
          *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v81;

          if (!a4)
          {
            v8 = 0;
            goto LABEL_156;
          }
          v26 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
          v8 = 0;
LABEL_44:
          *a4 = v26;
LABEL_156:
          _Block_object_dispose(buf, 8);

          goto LABEL_157;
        }
        v270 = 0;
        v27 = v273;
LABEL_28:
        *(_QWORD *)v311 = 0;
        *(_QWORD *)&v311[8] = v311;
        *(_QWORD *)&v311[16] = 0x3032000000;
        v312 = __Block_byref_object_copy__102;
        v313 = __Block_byref_object_dispose__102;
        v314 = 0;
        objc_msgSend(v5, "locationOfInterest");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v273 = v27;
        if (v32)
        {

        }
        else
        {
          objc_msgSend(v5, "destinationLocation");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = v54 == 0;

          if (!v55)
          {
            v56 = dispatch_semaphore_create(0);
            *(_QWORD *)v308 = 0;
            *(_QWORD *)&v308[8] = v308;
            *(_QWORD *)&v308[16] = 0x3032000000;
            v309 = __Block_byref_object_copy__102;
            *(_QWORD *)&v310 = __Block_byref_object_dispose__102;
            *((_QWORD *)&v310 + 1) = 0;
            -[SMSuggestionsManager learnedLocationManager](v274, "learnedLocationManager");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "destinationLocation");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            v288[0] = MEMORY[0x1E0C809B0];
            v288[1] = 3221225472;
            v288[2] = __72__SMSuggestionsManager__showSuggestionsDetectionUIWithSuggestion_error___block_invoke;
            v288[3] = &unk_1E9297478;
            v290 = v311;
            v291 = v308;
            v59 = v56;
            v289 = v59;
            objc_msgSend(v57, "fetchLocationOfInterestAtLocation:handler:", v58, v288);

            v39 = v59;
            objc_msgSend(MEMORY[0x1E0C99D68], "now");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            v61 = dispatch_time(0, 3600000000000);
            if (dispatch_semaphore_wait(v39, v61))
            {
              objc_msgSend(MEMORY[0x1E0C99D68], "now");
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v62, "timeIntervalSinceDate:", v60);
              v64 = v63;
              v65 = (void *)objc_opt_new();
              objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_607);
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v67, "filteredArrayUsingPredicate:", v66);
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v68, "firstObject");
              v69 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v65, "submitToCoreAnalytics:type:duration:", v69, 1, v64);
              _rt_log_facility_get_os_log(RTLogFacilityGeneral);
              v70 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v70, OS_LOG_TYPE_FAULT))
              {
                *(_WORD *)v304 = 0;
                _os_log_fault_impl(&dword_1D1A22000, v70, OS_LOG_TYPE_FAULT, "Invalid parameter not satisfying: authorizationManager", v304, 2u);
              }

              v71 = (void *)MEMORY[0x1E0CB35C8];
              *(_QWORD *)v299 = *MEMORY[0x1E0CB2D50];
              *(_QWORD *)v304 = CFSTR("semaphore wait timeout");
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v304, v299, 1);
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v71, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v72);
              v73 = (id)objc_claimAutoreleasedReturnValue();

              if (v73)
              {
                v73 = objc_retainAutorelease(v73);

              }
            }
            else
            {
              v73 = 0;
            }

            v88 = (uint64_t (*)(uint64_t, uint64_t))v73;
            v89 = v88;
            if (a4 && v88)
            {
              _rt_log_facility_get_os_log(RTLogFacilityWorkout);
              v90 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
              {
                v222 = (objc_class *)objc_opt_class();
                NSStringFromClass(v222);
                v223 = (id)objc_claimAutoreleasedReturnValue();
                NSStringFromSelector(a2);
                v224 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)v304 = 138412802;
                *(_QWORD *)&v304[4] = v223;
                *(_WORD *)&v304[12] = 2112;
                *(_QWORD *)&v304[14] = v224;
                *(_WORD *)&v304[22] = 2112;
                v305 = v89;
                _os_log_error_impl(&dword_1D1A22000, v90, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v304, 0x20u);

              }
              v91 = v89;
            }
            else
            {
              if (!a4 || !*(_QWORD *)(*(_QWORD *)&v308[8] + 40))
              {

                _Block_object_dispose(v308, 8);
                goto LABEL_73;
              }
              _rt_log_facility_get_os_log(RTLogFacilityWorkout);
              v92 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
              {
                v236 = (objc_class *)objc_opt_class();
                NSStringFromClass(v236);
                v237 = (id)objc_claimAutoreleasedReturnValue();
                NSStringFromSelector(a2);
                v238 = (void *)objc_claimAutoreleasedReturnValue();
                v239 = *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)&v308[8] + 40);
                *(_DWORD *)v304 = 138412802;
                *(_QWORD *)&v304[4] = v237;
                *(_WORD *)&v304[12] = 2112;
                *(_QWORD *)&v304[14] = v238;
                *(_WORD *)&v304[22] = 2112;
                v305 = v239;
                _os_log_error_impl(&dword_1D1A22000, v92, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v304, 0x20u);

              }
              v91 = *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)&v308[8] + 40);
            }
            *a4 = objc_retainAutorelease(v91);

            _Block_object_dispose(v308, 8);
            goto LABEL_71;
          }
        }
        objc_msgSend(v5, "locationOfInterest");
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v33)
        {
LABEL_74:
          v93 = *(void **)(*(_QWORD *)&v311[8] + 40);
          if (!v93
            || (objc_msgSend(v93, "location"),
                v94 = (void *)objc_claimAutoreleasedReturnValue(),
                objc_msgSend(v94, "location"),
                v95 = (void *)objc_claimAutoreleasedReturnValue(),
                v96 = v95 == 0,
                v95,
                v94,
                v96))
          {
            v39 = 0;
          }
          else
          {
            v264 = objc_alloc(MEMORY[0x1E0D18420]);
            objc_msgSend(*(id *)(*(_QWORD *)&v311[8] + 40), "place");
            dsemab = (dispatch_semaphore_t)objc_claimAutoreleasedReturnValue();
            -[NSObject mapItem](dsemab, "mapItem");
            v97 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(*(_QWORD *)&v311[8] + 40), "place");
            v98 = (void *)objc_claimAutoreleasedReturnValue();
            v99 = +[RTPlaceInferenceManager userSpecificPlaceTypeFromLearnedPlaceType:](RTPlaceInferenceManager, "userSpecificPlaceTypeFromLearnedPlaceType:", objc_msgSend(v98, "type"));
            objc_msgSend(*(id *)(*(_QWORD *)&v311[8] + 40), "place");
            v100 = (void *)objc_claimAutoreleasedReturnValue();
            v101 = +[RTPlaceInferenceManager userSpecificPlaceTypeSourceFromLearnedPlaceTypeSource:](RTPlaceInferenceManager, "userSpecificPlaceTypeSourceFromLearnedPlaceTypeSource:", objc_msgSend(v100, "typeSource"));
            objc_msgSend(*(id *)(*(_QWORD *)&v311[8] + 40), "location");
            v102 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v102, "location");
            v103 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(*(_QWORD *)&v311[8] + 40), "location");
            v104 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v104, "confidence");
            v106 = v105;
            objc_msgSend(*(id *)(*(_QWORD *)&v311[8] + 40), "identifier");
            v107 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = objc_msgSend(v264, "initWithMapItem:userType:userTypeSource:placeType:referenceLocation:confidence:loiIdentifier:", v97, v99, v101, 0, v103, v107, v106);

          }
          objc_msgSend(v5, "destinationLocation");
          v108 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v108)
          {
            v111 = (void *)MEMORY[0x1E0CB35C8];
            v295 = *MEMORY[0x1E0CB2D50];
            v112 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v5, "destinationLocation");
            v113 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v112, "stringWithFormat:", CFSTR("suggestion has invalid destination information, %@"), v113);
            v114 = (void *)objc_claimAutoreleasedReturnValue();
            v296 = v114;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v296, &v295, 1);
            v115 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v111, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v115);
            v116 = objc_claimAutoreleasedReturnValue();
            v117 = *(void **)(*(_QWORD *)&buf[8] + 40);
            *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v116;

            if (a4)
            {
              v118 = 0;
              v8 = 0;
              *a4 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
LABEL_154:

              goto LABEL_155;
            }
            v118 = 0;
LABEL_116:
            v8 = 0;
            goto LABEL_154;
          }
          objc_msgSend(*(id *)(*(_QWORD *)&v311[8] + 40), "place");
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          v110 = objc_msgSend(v109, "type");

          if (v110 >= 5)
            v265 = 0;
          else
            v265 = qword_1D1EEDA00[v110];
          *(_QWORD *)v308 = 0;
          *(_QWORD *)&v308[8] = v308;
          *(_QWORD *)&v308[16] = 0x3032000000;
          v309 = __Block_byref_object_copy__102;
          *(_QWORD *)&v310 = __Block_byref_object_dispose__102;
          *((_QWORD *)&v310 + 1) = 0;
          objc_msgSend(*(id *)(*(_QWORD *)&v311[8] + 40), "place");
          v119 = objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v119, "mapItem");
          v120 = (void *)objc_claimAutoreleasedReturnValue();
          v121 = v120 == 0;

          if (!v121)
            goto LABEL_85;
          *(_QWORD *)v304 = 0;
          *(_QWORD *)&v304[8] = v304;
          *(_QWORD *)&v304[16] = 0x3032000000;
          v305 = __Block_byref_object_copy__102;
          v306 = __Block_byref_object_dispose__102;
          v307 = 0;
          v131 = dispatch_semaphore_create(0);
          v132 = objc_alloc(MEMORY[0x1E0D183F8]);
          v133 = (objc_class *)objc_opt_class();
          NSStringFromClass(v133);
          v134 = (void *)objc_claimAutoreleasedReturnValue();
          v262 = (void *)objc_msgSend(v132, "initWithUseBackgroundTraits:analyticsIdentifier:clientIdentifier:", 1, v134, *MEMORY[0x1E0D8BCB8]);

          -[SMSuggestionsManager mapServiceManager](v274, "mapServiceManager");
          v135 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "destinationLocation");
          v136 = (void *)objc_claimAutoreleasedReturnValue();
          v280[0] = MEMORY[0x1E0C809B0];
          v280[1] = 3221225472;
          v280[2] = __72__SMSuggestionsManager__showSuggestionsDetectionUIWithSuggestion_error___block_invoke_124;
          v280[3] = &unk_1E9296EE0;
          v282 = v308;
          v283 = v304;
          v137 = v131;
          v281 = v137;
          objc_msgSend(v135, "fetchMapItemsFromLocation:options:handler:", v136, v262, v280);

          dsema = v137;
          objc_msgSend(MEMORY[0x1E0C99D68], "now");
          v138 = (void *)objc_claimAutoreleasedReturnValue();
          v139 = dispatch_time(0, 3600000000000);
          if (dispatch_semaphore_wait(dsema, v139))
          {
            objc_msgSend(MEMORY[0x1E0C99D68], "now");
            v140 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v140, "timeIntervalSinceDate:", v138);
            v142 = v141;
            v143 = (void *)objc_opt_new();
            objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_607);
            v144 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
            v145 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v145, "filteredArrayUsingPredicate:", v144);
            v146 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v146, "firstObject");
            v147 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v143, "submitToCoreAnalytics:type:duration:", v147, 1, v142);
            _rt_log_facility_get_os_log(RTLogFacilityGeneral);
            v148 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v148, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)v299 = 0;
              _os_log_fault_impl(&dword_1D1A22000, v148, OS_LOG_TYPE_FAULT, "Invalid parameter not satisfying: authorizationManager", v299, 2u);
            }

            v149 = (void *)MEMORY[0x1E0CB35C8];
            v321[0] = *MEMORY[0x1E0CB2D50];
            *(_QWORD *)v299 = CFSTR("semaphore wait timeout");
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v299, v321, 1);
            v150 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v149, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v150);
            v119 = objc_claimAutoreleasedReturnValue();

            if (v119)
            {
              v119 = (uint64_t)objc_retainAutorelease((id)v119);

            }
          }
          else
          {
            v119 = 0;
          }

          v152 = (id)v119;
          v153 = v152;
          if (a4 && v152)
          {
            _rt_log_facility_get_os_log(RTLogFacilityWorkout);
            v154 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v154, OS_LOG_TYPE_ERROR))
            {
              v233 = (objc_class *)objc_opt_class();
              NSStringFromClass(v233);
              v234 = (id)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              v235 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)v299 = 138412802;
              *(_QWORD *)&v299[4] = v234;
              v300 = 2112;
              v301 = v235;
              v302 = 2112;
              v303 = v153;
              _os_log_error_impl(&dword_1D1A22000, v154, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v299, 0x20u);

            }
            v155 = v153;
          }
          else
          {
            if (*(_QWORD *)(*(_QWORD *)&v308[8] + 40) && !*(_QWORD *)(*(_QWORD *)&v304[8] + 40))
              goto LABEL_138;
            v156 = (void *)MEMORY[0x1E0CB35C8];
            v297 = *MEMORY[0x1E0CB2D50];
            v157 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v5, "destinationLocation");
            v158 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v157, "stringWithFormat:", CFSTR("Failed to reverse geocode for the location, %@, reverseGeocodedMapItem, %@, reverseGeocodeError, %@"), v158, *(_QWORD *)(*(_QWORD *)&v308[8] + 40), *(_QWORD *)(*(_QWORD *)&v304[8] + 40));
            v159 = (void *)objc_claimAutoreleasedReturnValue();
            v298 = v159;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v298, &v297, 1);
            v160 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v156, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v160);
            v161 = objc_claimAutoreleasedReturnValue();
            v162 = *(void **)(*(_QWORD *)&buf[8] + 40);
            *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v161;

            _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
            v163 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v163, OS_LOG_TYPE_ERROR))
            {
              v240 = (objc_class *)objc_opt_class();
              NSStringFromClass(v240);
              v241 = (id)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              v242 = (id)objc_claimAutoreleasedReturnValue();
              v243 = *(void **)(*(_QWORD *)&buf[8] + 40);
              *(_DWORD *)v299 = 138412802;
              *(_QWORD *)&v299[4] = v241;
              v300 = 2112;
              v301 = v242;
              v302 = 2112;
              v303 = v243;
              _os_log_error_impl(&dword_1D1A22000, v163, OS_LOG_TYPE_ERROR, "%@, %@, error, %@", v299, 0x20u);

            }
            v119 = a4 != 0;

            if (!a4 || !*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
            {
LABEL_138:

              _Block_object_dispose(v304, 8);
LABEL_85:
              v122 = objc_alloc(MEMORY[0x1E0D8BA00]);
              objc_msgSend(v5, "destinationLocation");
              v123 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "destinationLocation");
              v124 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v124, "horizontalUncertainty");
              v126 = v125;
              objc_msgSend(*(id *)(*(_QWORD *)&v311[8] + 40), "place");
              v127 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v127, "mapItem");
              v128 = (void *)objc_claimAutoreleasedReturnValue();
              if (v128)
              {
                objc_msgSend(*(id *)(*(_QWORD *)&v311[8] + 40), "place");
                v129 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v129, "mapItem");
                v119 = objc_claimAutoreleasedReturnValue();
                objc_msgSend((id)v119, "geoMapItemHandle");
                v130 = (void *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                objc_msgSend(*(id *)(*(_QWORD *)&v308[8] + 40), "geoMapItemHandle");
                v130 = (void *)objc_claimAutoreleasedReturnValue();
                v129 = v130;
              }
              v118 = (void *)objc_msgSend(v122, "initWithLocation:eta:radius:destinationType:destinationMapItem:", v123, 0, v265, v130, v126);
              if (v128)
              {

              }
              v151 = 1;
LABEL_113:
              _Block_object_dispose(v308, 8);

              if ((v151 & 1) != 0)
              {
                if ((v270 & 1) != 0)
                {
                  v165 = 0;
                }
                else
                {
                  v166 = objc_alloc(MEMORY[0x1E0D8B918]);
                  v294 = v273;
                  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v294, 1);
                  v167 = (void *)objc_claimAutoreleasedReturnValue();
                  v165 = (id)objc_msgSend(v166, "initWithReceiverHandles:identifier:displayName:", v167, 0, 0);

                }
                v168 = objc_alloc(MEMORY[0x1E0D8B9F0]);
                objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
                v169 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "dateInterval");
                v170 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v170, "startDate");
                v171 = (void *)objc_claimAutoreleasedReturnValue();
                LOBYTE(v256) = objc_msgSend(MEMORY[0x1E0D8B958], "zelkovaHandoffEnabled");
                v271 = (uint64_t (*)(uint64_t, uint64_t))objc_msgSend(v168, "initWithConversation:sessionID:sessionStartDate:sessionType:time:destination:userResponseSafeDate:sessionSupportsHandoff:sosReceivers:sessionWorkoutType:", v165, v169, v171, 2, 0, v118, 0, v256, v165, 0);
                v266 = v165;

                _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
                v172 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v172, OS_LOG_TYPE_INFO))
                {
                  v173 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v173);
                  v174 = (id)objc_claimAutoreleasedReturnValue();
                  NSStringFromSelector(a2);
                  v175 = (id)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)v308 = 138412802;
                  *(_QWORD *)&v308[4] = v174;
                  *(_WORD *)&v308[12] = 2112;
                  *(_QWORD *)&v308[14] = v175;
                  *(_WORD *)&v308[22] = 2112;
                  v309 = v271;
                  _os_log_impl(&dword_1D1A22000, v172, OS_LOG_TYPE_INFO, "%@, %@, config from suggestion, %@", v308, 0x20u);

                }
                v176 = *(_QWORD *)&buf[8];
                v279 = *(id *)(*(_QWORD *)&buf[8] + 40);
                -[SMSuggestionsManager _getMessagesURLFromSessionConfig:payloadType:error:](v274, "_getMessagesURLFromSessionConfig:payloadType:error:", v271, 2, &v279);
                dsemaa = (dispatch_semaphore_t)objc_claimAutoreleasedReturnValue();
                objc_storeStrong((id *)(v176 + 40), v279);
                if (a4 && *(_QWORD *)(*(_QWORD *)&buf[8] + 40))
                {
                  _rt_log_facility_get_os_log(RTLogFacilityWorkout);
                  v177 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v177, OS_LOG_TYPE_ERROR))
                  {
                    v229 = (objc_class *)objc_opt_class();
                    NSStringFromClass(v229);
                    v230 = (id)objc_claimAutoreleasedReturnValue();
                    NSStringFromSelector(a2);
                    v231 = (void *)objc_claimAutoreleasedReturnValue();
                    v232 = *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)&buf[8] + 40);
                    *(_DWORD *)v308 = 138412802;
                    *(_QWORD *)&v308[4] = v230;
                    *(_WORD *)&v308[12] = 2112;
                    *(_QWORD *)&v308[14] = v231;
                    *(_WORD *)&v308[22] = 2112;
                    v309 = v232;
                    _os_log_error_impl(&dword_1D1A22000, v177, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v308, 0x20u);

                  }
                  v8 = 0;
                  *a4 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
                }
                else
                {
                  objc_msgSend(v271, "conversation");
                  v178 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v178, "receiverHandles");
                  v179 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v179, "firstObject");
                  v180 = (void *)objc_claimAutoreleasedReturnValue();
                  v181 = (id *)(*(_QWORD *)&buf[8] + 40);
                  v278 = *(id *)(*(_QWORD *)&buf[8] + 40);
                  -[SMSuggestionsManager _getSuggestionTitleWithHandle:error:](v274, "_getSuggestionTitleWithHandle:error:", v180, &v278);
                  v263 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_storeStrong(v181, v278);

                  if (a4 && *(_QWORD *)(*(_QWORD *)&buf[8] + 40))
                  {
                    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
                    v182 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v182, OS_LOG_TYPE_ERROR))
                    {
                      v244 = (objc_class *)objc_opt_class();
                      NSStringFromClass(v244);
                      v245 = (id)objc_claimAutoreleasedReturnValue();
                      NSStringFromSelector(a2);
                      v246 = (void *)objc_claimAutoreleasedReturnValue();
                      v247 = *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)&buf[8] + 40);
                      *(_DWORD *)v308 = 138412802;
                      *(_QWORD *)&v308[4] = v245;
                      *(_WORD *)&v308[12] = 2112;
                      *(_QWORD *)&v308[14] = v246;
                      *(_WORD *)&v308[22] = 2112;
                      v309 = v247;
                      _os_log_error_impl(&dword_1D1A22000, v182, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v308, 0x20u);

                    }
                    v8 = 0;
                    *a4 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
                  }
                  else
                  {
                    -[SMSuggestionsManager _getSuggestionBodyWithPlaceInference:](v274, "_getSuggestionBodyWithPlaceInference:", v39);
                    v261 = (void *)objc_claimAutoreleasedReturnValue();
                    -[SMSuggestionsManager _getSuggestionsFooter:](v274, "_getSuggestionsFooter:", v5);
                    v260 = (void *)objc_claimAutoreleasedReturnValue();
                    if (objc_msgSend(v5, "suggestionUserType") == 1)
                      v183 = 2;
                    else
                      v183 = 1;
                    if (a4 && *(_QWORD *)(*(_QWORD *)&buf[8] + 40))
                    {
                      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
                      v184 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v184, OS_LOG_TYPE_ERROR))
                      {
                        v248 = (objc_class *)objc_opt_class();
                        NSStringFromClass(v248);
                        v249 = (id)objc_claimAutoreleasedReturnValue();
                        NSStringFromSelector(a2);
                        v250 = (void *)objc_claimAutoreleasedReturnValue();
                        v251 = *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)&buf[8] + 40);
                        *(_DWORD *)v308 = 138412802;
                        *(_QWORD *)&v308[4] = v249;
                        *(_WORD *)&v308[12] = 2112;
                        *(_QWORD *)&v308[14] = v250;
                        *(_WORD *)&v308[22] = 2112;
                        v309 = v251;
                        _os_log_error_impl(&dword_1D1A22000, v184, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v308, 0x20u);

                      }
                      v8 = 0;
                      *a4 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
                    }
                    else
                    {
                      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
                      v185 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v185, OS_LOG_TYPE_INFO))
                      {
                        v186 = (objc_class *)objc_opt_class();
                        NSStringFromClass(v186);
                        v187 = (id)objc_claimAutoreleasedReturnValue();
                        NSStringFromSelector(a2);
                        v188 = (id)objc_claimAutoreleasedReturnValue();
                        +[RTUserNotification interruptionLevelToString:](RTUserNotification, "interruptionLevelToString:", v183);
                        v189 = (uint64_t (*)(uint64_t, uint64_t))(id)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)v308 = 138412802;
                        *(_QWORD *)&v308[4] = v187;
                        *(_WORD *)&v308[12] = 2112;
                        *(_QWORD *)&v308[14] = v188;
                        *(_WORD *)&v308[22] = 2112;
                        v309 = v189;
                        _os_log_impl(&dword_1D1A22000, v185, OS_LOG_TYPE_INFO, "%@, %@, interruption level, %@", v308, 0x20u);

                      }
                      v190 = *(_QWORD *)&buf[8];
                      v277 = *(id *)(*(_QWORD *)&buf[8] + 40);
                      -[SMSuggestionsManager _getNotificationExpirationDateForSuggestion:error:](v274, "_getNotificationExpirationDateForSuggestion:error:", v5, &v277);
                      v259 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_storeStrong((id *)(v190 + 40), v277);
                      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
                      v191 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v191, OS_LOG_TYPE_INFO))
                      {
                        v192 = (objc_class *)objc_opt_class();
                        NSStringFromClass(v192);
                        v193 = (id)objc_claimAutoreleasedReturnValue();
                        NSStringFromSelector(a2);
                        v194 = (id)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v259, "stringFromDate");
                        v195 = (uint64_t (*)(uint64_t, uint64_t))(id)objc_claimAutoreleasedReturnValue();
                        v196 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
                        *(_DWORD *)v308 = 138413058;
                        *(_QWORD *)&v308[4] = v193;
                        *(_WORD *)&v308[12] = 2112;
                        *(_QWORD *)&v308[14] = v194;
                        *(_WORD *)&v308[22] = 2112;
                        v309 = v195;
                        LOWORD(v310) = 2112;
                        *(_QWORD *)((char *)&v310 + 2) = v196;
                        _os_log_impl(&dword_1D1A22000, v191, OS_LOG_TYPE_INFO, "%@, %@, notificationExpirationDate, %@, error, %@", v308, 0x2Au);

                      }
                      v197 = *(void **)(*(_QWORD *)&buf[8] + 40);
                      *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = 0;

                      -[SMSuggestionsManager defaultsManager](v274, "defaultsManager");
                      v198 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v198, "objectForKey:", CFSTR("RTDefaultsSuggestionsManagerLastSuggestionNotificationUUID"));
                      v258 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v258)
                      {
                        v199 = v258;
                      }
                      else
                      {
                        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
                        v207 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v207, "UUIDString");
                        v199 = (id)objc_claimAutoreleasedReturnValue();

                      }
                      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
                      v208 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v208, OS_LOG_TYPE_INFO))
                      {
                        v209 = (objc_class *)objc_opt_class();
                        NSStringFromClass(v209);
                        v210 = (id)objc_claimAutoreleasedReturnValue();
                        NSStringFromSelector(a2);
                        v211 = (id)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)v308 = 138413058;
                        *(_QWORD *)&v308[4] = v210;
                        *(_WORD *)&v308[12] = 2112;
                        *(_QWORD *)&v308[14] = v211;
                        *(_WORD *)&v308[22] = 2112;
                        v309 = (uint64_t (*)(uint64_t, uint64_t))v258;
                        LOWORD(v310) = 2112;
                        *(_QWORD *)((char *)&v310 + 2) = v199;
                        _os_log_impl(&dword_1D1A22000, v208, OS_LOG_TYPE_INFO, "%@, %@, notificationUUIDStringFromDefaults, %@, notificationUUIDString, %@", v308, 0x2Au);

                      }
                      v212 = [RTUserNotification alloc];
                      v213 = -[RTUserNotification initWithBundleIdentifier:notificationUUIDString:](v212, "initWithBundleIdentifier:notificationUUIDString:", *MEMORY[0x1E0D8BBD0], v199);
                      v214 = [RTUserNotificationAction alloc];
                      objc_msgSend(MEMORY[0x1E0D8B9E0], "checkInActionTitle");
                      v215 = (void *)objc_claimAutoreleasedReturnValue();
                      v216 = -[RTUserNotificationAction initWithActionIdentifier:title:url:iconWithSystemImageName:handler:](v214, "initWithActionIdentifier:title:url:iconWithSystemImageName:handler:", CFSTR("zelkova.checkin"), v215, dsemaa, 0, 0);

                      -[NSObject absoluteString](dsemaa, "absoluteString");
                      v217 = (void *)objc_claimAutoreleasedReturnValue();
                      v293 = v216;
                      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v293, 1);
                      v218 = (void *)objc_claimAutoreleasedReturnValue();
                      v219 = *MEMORY[0x1E0D8BCB8];
                      v276[0] = MEMORY[0x1E0C809B0];
                      v276[1] = 3221225472;
                      v276[2] = __72__SMSuggestionsManager__showSuggestionsDetectionUIWithSuggestion_error___block_invoke_137;
                      v276[3] = &unk_1E929BC98;
                      v276[5] = buf;
                      v276[4] = v274;
                      v276[6] = a2;
                      LOWORD(v257) = 256;
                      -[RTUserNotification postNotificationWithTitle:subtitle:body:footer:defaultActionUrl:categoryIdentifier:interruptionLevel:destination:actions:suppressDismissActionInCarPlay:preventAutomaticRemoval:expirationDate:userInfo:handler:](v213, "postNotificationWithTitle:subtitle:body:footer:defaultActionUrl:categoryIdentifier:interruptionLevel:destination:actions:suppressDismissActionInCarPlay:preventAutomaticRemoval:expirationDate:userInfo:handler:", v263, 0, v261, v260, v217, v219, v183, 7, v218, v257, v259, 0, v276);

                      -[SMSuggestionsManager defaultsManager](v274, "defaultsManager");
                      v220 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v220, "setObject:forKey:", v199, CFSTR("RTDefaultsSuggestionsManagerLastSuggestionNotificationUUID"));

                      if (a4)
                        *a4 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
                      v8 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40) == 0;

                    }
                  }

                }
                goto LABEL_154;
              }
              goto LABEL_116;
            }
            _rt_log_facility_get_os_log(RTLogFacilityWorkout);
            v164 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v164, OS_LOG_TYPE_ERROR))
            {
              v252 = (objc_class *)objc_opt_class();
              NSStringFromClass(v252);
              v253 = (id)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              v254 = (void *)objc_claimAutoreleasedReturnValue();
              v255 = *(void **)(*(_QWORD *)&buf[8] + 40);
              *(_DWORD *)v299 = 138412802;
              *(_QWORD *)&v299[4] = v253;
              v300 = 2112;
              v301 = v254;
              v302 = 2112;
              v303 = v255;
              _os_log_error_impl(&dword_1D1A22000, v164, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v299, 0x20u);

            }
            v155 = *(void **)(*(_QWORD *)&buf[8] + 40);
          }
          *a4 = objc_retainAutorelease(v155);

          _Block_object_dispose(v304, 8);
          v118 = 0;
          v151 = 0;
          goto LABEL_113;
        }
        v34 = dispatch_semaphore_create(0);
        *(_QWORD *)v308 = 0;
        *(_QWORD *)&v308[8] = v308;
        *(_QWORD *)&v308[16] = 0x3032000000;
        v309 = __Block_byref_object_copy__102;
        *(_QWORD *)&v310 = __Block_byref_object_dispose__102;
        *((_QWORD *)&v310 + 1) = 0;
        -[SMSuggestionsManager learnedLocationManager](v274, "learnedLocationManager");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "locationOfInterest");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "identifier");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v284[0] = MEMORY[0x1E0C809B0];
        v284[1] = 3221225472;
        v284[2] = __72__SMSuggestionsManager__showSuggestionsDetectionUIWithSuggestion_error___block_invoke_120;
        v284[3] = &unk_1E9297478;
        v286 = v311;
        v287 = v308;
        v38 = v34;
        v285 = v38;
        objc_msgSend(v35, "fetchLocationOfInterestWithIdentifier:handler:", v37, v284);

        v39 = v38;
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = dispatch_time(0, 3600000000000);
        if (dispatch_semaphore_wait(v39, v41))
        {
          objc_msgSend(MEMORY[0x1E0C99D68], "now");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "timeIntervalSinceDate:", v40);
          v44 = v43;
          v45 = (void *)objc_opt_new();
          objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_607);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "filteredArrayUsingPredicate:", v46);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "firstObject");
          v49 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v45, "submitToCoreAnalytics:type:duration:", v49, 1, v44);
          _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          v50 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)v304 = 0;
            _os_log_fault_impl(&dword_1D1A22000, v50, OS_LOG_TYPE_FAULT, "Invalid parameter not satisfying: authorizationManager", v304, 2u);
          }

          v51 = (void *)MEMORY[0x1E0CB35C8];
          *(_QWORD *)v299 = *MEMORY[0x1E0CB2D50];
          *(_QWORD *)v304 = CFSTR("semaphore wait timeout");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v304, v299, 1);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v52);
          v53 = (id)objc_claimAutoreleasedReturnValue();

          if (v53)
          {
            v53 = objc_retainAutorelease(v53);

          }
        }
        else
        {
          v53 = 0;
        }

        v83 = (uint64_t (*)(uint64_t, uint64_t))v53;
        v84 = v83;
        if (a4 && v83)
        {
          _rt_log_facility_get_os_log(RTLogFacilityWorkout);
          v85 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
          {
            v204 = (objc_class *)objc_opt_class();
            NSStringFromClass(v204);
            v205 = (id)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v206 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v304 = 138412802;
            *(_QWORD *)&v304[4] = v205;
            *(_WORD *)&v304[12] = 2112;
            *(_QWORD *)&v304[14] = v206;
            *(_WORD *)&v304[22] = 2112;
            v305 = v84;
            _os_log_error_impl(&dword_1D1A22000, v85, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v304, 0x20u);

          }
          v86 = v84;
LABEL_56:
          *a4 = objc_retainAutorelease(v86);

          _Block_object_dispose(v308, 8);
LABEL_71:
          v8 = 0;
LABEL_155:

          _Block_object_dispose(v311, 8);
          goto LABEL_156;
        }
        if (a4 && *(_QWORD *)(*(_QWORD *)&v308[8] + 40))
        {
          _rt_log_facility_get_os_log(RTLogFacilityWorkout);
          v87 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
          {
            v225 = (objc_class *)objc_opt_class();
            NSStringFromClass(v225);
            v226 = (id)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v227 = (void *)objc_claimAutoreleasedReturnValue();
            v228 = *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)&v308[8] + 40);
            *(_DWORD *)v304 = 138412802;
            *(_QWORD *)&v304[4] = v226;
            *(_WORD *)&v304[12] = 2112;
            *(_QWORD *)&v304[14] = v227;
            *(_WORD *)&v304[22] = 2112;
            v305 = v228;
            _os_log_error_impl(&dword_1D1A22000, v87, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v304, 0x20u);

          }
          v86 = *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)&v308[8] + 40);
          goto LABEL_56;
        }

        _Block_object_dispose(v308, 8);
LABEL_73:

        goto LABEL_74;
      }
LABEL_21:
      v27 = 0;
      v270 = 1;
      goto LABEL_28;
    }
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      v29 = (objc_class *)objc_opt_class();
      NSStringFromClass(v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v30;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v31;
      _os_log_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_INFO, "%@, %@, suggestion UI skipped, reason, neither iPhone nor watch platform", buf, 0x16u);

    }
    goto LABEL_25;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: suggestion", buf, 2u);
  }

  if (!a4)
  {
LABEL_25:
    v8 = 0;
    goto LABEL_157;
  }
  _RTErrorInvalidParameterCreate((uint64_t)CFSTR("suggestion"));
  v8 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_157:

  return v8;
}

void __72__SMSuggestionsManager__showSuggestionsDetectionUIWithSuggestion_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __72__SMSuggestionsManager__showSuggestionsDetectionUIWithSuggestion_error___block_invoke_120(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __72__SMSuggestionsManager__showSuggestionsDetectionUIWithSuggestion_error___block_invoke_124(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a3;
  objc_msgSend(a2, "firstObject");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v5;
  v11 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __72__SMSuggestionsManager__showSuggestionsDetectionUIWithSuggestion_error___block_invoke_137(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id obj;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "localizedDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v17 = v6;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "Failed to post suggestion notifications: %@", buf, 0xCu);

    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v17 = v9;
      v18 = 2112;
      v19 = v10;
      _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%@, %@, successfully posted notification", buf, 0x16u);

    }
    v11 = *(void **)(a1 + 32);
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    obj = *(id *)(v12 + 40);
    objc_msgSend(v11, "_getValuesFromDefaultsIfExists:error:", CFSTR("RTDefaultsSuggestionDisplayedCount"), &obj);
    v5 = objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v12 + 40), obj);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSObject unsignedIntegerValue](v5, "unsignedIntegerValue") + 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "defaultsManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v13, CFSTR("RTDefaultsSuggestionDisplayedCount"));

  }
}

- (id)_getNotificationExpirationDateForSuggestion:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  id v9;
  double v10;
  dispatch_semaphore_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  dispatch_time_t v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  id v32;
  NSObject *v33;
  id v34;
  void *v35;
  NSObject *v36;
  id v37;
  NSObject *v38;
  void *v39;
  double v40;
  NSObject *v41;
  objc_class *v42;
  id v43;
  id v44;
  void *v45;
  void *v46;
  objc_class *v48;
  id v49;
  void *v50;
  objc_class *v51;
  id v52;
  void *v53;
  void *v54;
  dispatch_queue_t v55;
  void *v56;
  NSObject *dsema;
  void *v59;
  id v60;
  _QWORD v61[4];
  NSObject *v62;
  uint64_t *v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t (*v68)(uint64_t, uint64_t);
  void (*v69)(uint64_t);
  id v70;
  uint64_t v71;
  double *v72;
  uint64_t v73;
  uint64_t v74;
  id v75;
  _BYTE buf[12];
  __int16 v77;
  id v78;
  __int16 v79;
  void *v80;
  __int16 v81;
  uint64_t v82;
  __int16 v83;
  uint64_t v84;
  __int16 v85;
  uint64_t v86;
  __int16 v87;
  double v88;
  __int16 v89;
  void *v90;
  _QWORD v91[4];

  v91[1] = *MEMORY[0x1E0C80C00];
  v60 = a3;
  v75 = 0;
  -[SMSuggestionsManager _getValuesFromDefaultsIfExists:error:](self, "_getValuesFromDefaultsIfExists:error:", CFSTR("RTDefaultsSuggestionNotificationExpirationTimeInterval"), &v75);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v75;
  v59 = v7;
  if (!v6 || v7)
  {
    v10 = 600.0;
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 600.0);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v60)
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D1A22000, v33, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: suggestion", buf, 2u);
      }

      if (a4)
      {
        _RTErrorInvalidParameterCreate((uint64_t)CFSTR("suggestion"));
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      v9 = v56;
      goto LABEL_35;
    }
    v71 = 0;
    v72 = (double *)&v71;
    v73 = 0x2020000000;
    v74 = 0;
    v65 = 0;
    v66 = &v65;
    v67 = 0x3032000000;
    v68 = __Block_byref_object_copy__102;
    v69 = __Block_byref_object_dispose__102;
    v70 = 0;
    v11 = dispatch_semaphore_create(0);
    v55 = dispatch_queue_create("SMSuggestionsManager-ETA-Queue", 0);
    v12 = objc_alloc(MEMORY[0x1E0C9E3B8]);
    objc_msgSend(v60, "destinationLocation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithRTLocation:", v13);
    -[SMSuggestionsManager locationManager](self, "locationManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMSuggestionsManager defaultsManager](self, "defaultsManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMSuggestionsManager distanceCalculator](self, "distanceCalculator");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v61[0] = MEMORY[0x1E0C809B0];
    v61[1] = 3221225472;
    v61[2] = __74__SMSuggestionsManager__getNotificationExpirationDateForSuggestion_error___block_invoke;
    v61[3] = &unk_1E92A14C0;
    v63 = &v71;
    v64 = &v65;
    v18 = v11;
    v62 = v18;
    +[SMTriggerDestination estimateEtaToDestination:transportType:locationManager:defaultsManager:distanceCalculator:queue:handler:](SMTriggerDestination, "estimateEtaToDestination:transportType:locationManager:defaultsManager:distanceCalculator:queue:handler:", v14, 1, v15, v16, v17, v55, v61);

    dsema = v18;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = dispatch_time(0, 3600000000000);
    if (dispatch_semaphore_wait(dsema, v20))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "timeIntervalSinceDate:", v19);
      v23 = v22;
      v24 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_607);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "filteredArrayUsingPredicate:", v25);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "firstObject");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v24, "submitToCoreAnalytics:type:duration:", v28, 1, v23);
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_FAULT, "Invalid parameter not satisfying: authorizationManager", buf, 2u);
      }

      v30 = (void *)MEMORY[0x1E0CB35C8];
      v91[0] = *MEMORY[0x1E0CB2D50];
      *(_QWORD *)buf = CFSTR("semaphore wait timeout");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v91, 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v31);
      v32 = (id)objc_claimAutoreleasedReturnValue();

      if (v32)
      {
        v32 = objc_retainAutorelease(v32);

      }
    }
    else
    {
      v32 = 0;
    }

    v34 = v32;
    v35 = v34;
    if (a4 && v34)
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        v48 = (objc_class *)objc_opt_class();
        NSStringFromClass(v48);
        v49 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v49;
        v77 = 2112;
        v78 = v50;
        v79 = 2112;
        v80 = v35;
        _os_log_error_impl(&dword_1D1A22000, v36, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

      }
      v37 = objc_retainAutorelease(v35);
    }
    else
    {
      if (!a4 || !v66[5])
      {
        v40 = fmin(v72[3] * 0.25, 7200.0);
        if (v40 >= 600.0)
          v10 = v40;
        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", v10);
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          v42 = (objc_class *)objc_opt_class();
          NSStringFromClass(v42);
          v43 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v44 = (id)objc_claimAutoreleasedReturnValue();
          v45 = (void *)*((_QWORD *)v72 + 3);
          objc_msgSend(v39, "stringFromDate");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138414082;
          *(_QWORD *)&buf[4] = v43;
          v77 = 2112;
          v78 = v44;
          v79 = 2048;
          v80 = v45;
          v81 = 2048;
          v82 = 0x3FD0000000000000;
          v83 = 2048;
          v84 = 0x4082C00000000000;
          v85 = 2048;
          v86 = 0x40AC200000000000;
          v87 = 2048;
          v88 = v10;
          v89 = 2112;
          v90 = v46;
          _os_log_impl(&dword_1D1A22000, v41, OS_LOG_TYPE_INFO, "%@, %@, eta to destination, %.3f, kSMSuggestionNotificationETAFactor, %.3f, kSMSuggestionNotificationExpirationTimeInterval, %.3f, kSMSuggestionTimeIntervalBuffer, %.3f, notificationExpirationTimeInterval, %.3f, notificationExpirationDate, %@", buf, 0x52u);

        }
        goto LABEL_34;
      }
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        v51 = (objc_class *)objc_opt_class();
        NSStringFromClass(v51);
        v52 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = (void *)v66[5];
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v52;
        v77 = 2112;
        v78 = v53;
        v79 = 2112;
        v80 = v54;
        _os_log_error_impl(&dword_1D1A22000, v38, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

      }
      v37 = objc_retainAutorelease((id)v66[5]);
    }
    *a4 = v37;
    v39 = v56;
LABEL_34:
    v9 = v39;

    _Block_object_dispose(&v65, 8);
    _Block_object_dispose(&v71, 8);
LABEL_35:

    goto LABEL_36;
  }
  if (a4)
    *a4 = 0;
  v8 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v6, "doubleValue");
  objc_msgSend(v8, "dateWithTimeIntervalSinceNow:");
  v9 = (id)objc_claimAutoreleasedReturnValue();
LABEL_36:

  return v9;
}

void __74__SMSuggestionsManager__getNotificationExpirationDateForSuggestion_error___block_invoke(uint64_t a1, int a2, int a3, id obj, double a5)
{
  id v7;

  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a5;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), obj);
  v7 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (unint64_t)_suppressSuggestion:(id)a3 context:(id)a4 error:(id *)a5
{
  id v8;
  NSObject *v9;
  id v10;
  unint64_t v11;
  NSObject *v12;
  NSObject *v13;
  const char *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  NSObject *v20;
  objc_class *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  dispatch_semaphore_t v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  dispatch_time_t v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  _BOOL4 v48;
  NSObject *v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  NSObject *v51;
  void *v52;
  id *v53;
  _BOOL4 v54;
  NSObject *v55;
  dispatch_semaphore_t v56;
  void *v57;
  NSObject *v58;
  void *v59;
  dispatch_time_t v60;
  void *v61;
  double v62;
  double v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  NSObject *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  id *v77;
  double v78;
  double v79;
  NSObject *v80;
  uint64_t (*v81)(uint64_t, uint64_t);
  _BOOL4 v82;
  NSObject *v83;
  NSObject *v84;
  objc_class *v85;
  id v86;
  void *v87;
  NSObject *v88;
  void *v89;
  double v90;
  double v91;
  NSObject *v92;
  objc_class *v93;
  id v94;
  id v95;
  uint64_t (*v96)(uint64_t, uint64_t);
  id *v97;
  _BOOL4 v98;
  NSObject *v99;
  objc_class *v100;
  id v101;
  uint64_t v102;
  void *v103;
  const __CFString *v104;
  objc_class *v105;
  id v106;
  void *v107;
  uint64_t (*v108)(uint64_t, uint64_t);
  NSObject *v109;
  objc_class *v110;
  id v111;
  id v112;
  uint64_t (*v113)(uint64_t, uint64_t);
  NSObject *v114;
  objc_class *v115;
  id v116;
  id v117;
  uint64_t (*v118)(uint64_t, uint64_t);
  objc_class *v120;
  id v121;
  void *v122;
  uint64_t v123;
  id *v124;
  id *v125;
  objc_class *v126;
  id v127;
  void *v128;
  objc_class *v129;
  id v130;
  void *v131;
  uint64_t (*v132)(uint64_t, uint64_t);
  objc_class *v133;
  id v134;
  void *v135;
  uint64_t (*v136)(uint64_t, uint64_t);
  id v137;
  unsigned int v138;
  id v139;
  void *v140;
  void *v141;
  void *v142;
  dispatch_semaphore_t v143;
  void *v144;
  NSObject *v145;
  void *v146;
  dispatch_time_t v147;
  uint64_t (*v148)(uint64_t, uint64_t);
  double v149;
  double v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  NSObject *v156;
  void *v157;
  void *v158;
  void *v159;
  _BOOL4 v160;
  NSObject *v161;
  uint64_t (*v162)(uint64_t, uint64_t);
  NSObject *v163;
  objc_class *v164;
  id v165;
  void *v166;
  uint64_t (*v167)(uint64_t, uint64_t);
  id *v168;
  NSObject *v169;
  objc_class *v170;
  id v171;
  id v172;
  uint64_t v173;
  NSObject *v174;
  objc_class *v175;
  id v176;
  id v177;
  uint64_t v178;
  id v179;
  unsigned int v180;
  unint64_t v181;
  objc_class *v182;
  id v183;
  void *v184;
  uint64_t (*v185)(uint64_t, uint64_t);
  unint64_t v186;
  dispatch_semaphore_t v187;
  id v188;
  id v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  NSObject *v194;
  NSObject *v195;
  void *v196;
  dispatch_time_t v197;
  void *v198;
  double v199;
  double v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  NSObject *v206;
  void *v207;
  void *v208;
  void *v209;
  id v210;
  id v211;
  id *v212;
  BOOL v213;
  uint64_t v214;
  NSObject *v215;
  NSObject *v216;
  objc_class *v217;
  id v218;
  uint64_t v219;
  void *v220;
  const __CFString *v221;
  id v222;
  dispatch_semaphore_t v223;
  void *v224;
  NSObject *v225;
  dispatch_time_t v226;
  uint64_t (*v227)(uint64_t, uint64_t);
  double v228;
  double v229;
  void *v230;
  void *v231;
  void *v232;
  void *v233;
  void *v234;
  NSObject *v235;
  void *v236;
  void *v237;
  void *v238;
  _BOOL4 v239;
  NSObject *v240;
  uint64_t (*v241)(uint64_t, uint64_t);
  NSObject *v242;
  char v243;
  objc_class *v244;
  id v245;
  void *v246;
  NSObject *v247;
  objc_class *v248;
  id v249;
  id v250;
  uint64_t v251;
  void *v252;
  void *v253;
  void *v254;
  double v255;
  double v256;
  NSObject *v257;
  objc_class *v258;
  id v259;
  void *v260;
  objc_class *v261;
  id v262;
  void *v263;
  uint64_t (*v264)(uint64_t, uint64_t);
  objc_class *v265;
  id v266;
  void *v267;
  uint64_t (*v268)(uint64_t, uint64_t);
  objc_class *v269;
  id v270;
  void *v271;
  objc_class *v272;
  id v273;
  void *v274;
  uint64_t (*v275)(uint64_t, uint64_t);
  uint64_t v276;
  BOOL v277;
  uint64_t v278;
  uint64_t v279;
  uint64_t v280;
  void *context;
  void *v282;
  void *v283;
  void *v284;
  void *v285;
  uint64_t (*v286)(uint64_t, uint64_t);
  id v287;
  void *v288;
  void *v289;
  unint64_t v290;
  void *v291;
  dispatch_semaphore_t dsema;
  NSObject *dsemaa;
  const char *aSelector;
  void *v295;
  id v296;
  _QWORD v298[4];
  NSObject *v299;
  _BYTE *v300;
  uint64_t *v301;
  id v302;
  id v303;
  _QWORD v304[4];
  NSObject *v305;
  _BYTE *v306;
  uint64_t *v307;
  _QWORD v308[4];
  NSObject *v309;
  _BYTE *v310;
  uint64_t *v311;
  id v312;
  id v313;
  id v314;
  _QWORD v315[4];
  NSObject *v316;
  _BYTE *v317;
  uint64_t *v318;
  id v319;
  id v320;
  _QWORD v321[4];
  NSObject *v322;
  _BYTE *v323;
  uint64_t *v324;
  id obj;
  uint64_t v326;
  id *v327;
  uint64_t v328;
  uint64_t (*v329)(uint64_t, uint64_t);
  void (*v330)(uint64_t);
  id v331;
  _BYTE v332[24];
  uint64_t (*v333)(uint64_t, uint64_t);
  __int128 v334;
  _BYTE buf[24];
  uint64_t (*v336)(uint64_t, uint64_t);
  _BYTE v337[20];
  _BYTE v338[24];
  uint64_t (*v339)(uint64_t, uint64_t);
  void (*v340)(uint64_t);
  id v341;
  uint64_t v342;
  uint8_t v343[8];
  uint64_t v344;

  v344 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v296 = a4;
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: suggestion", buf, 2u);
    }

    if (a5)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("suggestion"));
      v11 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
    goto LABEL_108;
  }
  if (!-[SMSuggestionsManager _shouldShowProactiveSuggestions](self, "_shouldShowProactiveSuggestions"))
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = a2;
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v16;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v17;
      _os_log_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_INFO, "%@, %@, user disabled proactive suggestions", buf, 0x16u);

    }
    v11 = 7;
    goto LABEL_108;
  }
  aSelector = a2;
  obj = 0;
  v326 = 0;
  v327 = (id *)&v326;
  v328 = 0x3032000000;
  v329 = __Block_byref_object_copy__102;
  v330 = __Block_byref_object_dispose__102;
  v331 = 0;
  -[SMSuggestionsManager _getCurrentDateFromContext:error:](self, "_getCurrentDateFromContext:error:", v296, &obj);
  v295 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(&v331, obj);
  if (a5 && v327[5])
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v105 = (objc_class *)objc_opt_class();
      NSStringFromClass(v105);
      v106 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      v108 = (uint64_t (*)(uint64_t, uint64_t))v327[5];
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v106;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v107;
      *(_WORD *)&buf[22] = 2112;
      v336 = v108;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

    }
    v10 = objc_retainAutorelease(v327[5]);
LABEL_8:
    v11 = 0;
    *a5 = v10;
    goto LABEL_107;
  }
  -[SMSuggestionsManager platform](self, "platform");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "watchPlatform");

  if (v19 && -[SMSuggestionsManager _isEffectivePairedDeviceNearby](self, "_isEffectivePairedDeviceNearby"))
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v22 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(aSelector);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v22;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v23;
      _os_log_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_INFO, "%@, %@, watch has a nearby paired phone; suggestions on the watch should be supressed",
        buf,
        0x16u);

    }
    v11 = 11;
    goto LABEL_107;
  }
  objc_msgSend(v8, "buddy");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v24)
  {
    v11 = 0;
    goto LABEL_53;
  }
  objc_msgSend(v8, "buddy");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "email");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "buddy");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
    objc_msgSend(v27, "email");
  else
    objc_msgSend(v27, "phoneNumber");
  dsema = (dispatch_semaphore_t)objc_claimAutoreleasedReturnValue();

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v336 = __Block_byref_object_copy__102;
  *(_QWORD *)v337 = __Block_byref_object_dispose__102;
  *(_QWORD *)&v337[8] = 0;
  v28 = dispatch_semaphore_create(0);
  -[SMSuggestionsManager contactsManager](self, "contactsManager");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v321[0] = MEMORY[0x1E0C809B0];
  v321[1] = 3221225472;
  v321[2] = __58__SMSuggestionsManager__suppressSuggestion_context_error___block_invoke;
  v321[3] = &unk_1E9296EE0;
  v323 = buf;
  v324 = &v326;
  v30 = v28;
  v322 = v30;
  objc_msgSend(v29, "fetchContactsFromEmailOrPhoneNumberString:handler:", dsema, v321);

  v31 = v30;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v31, v33))
    goto LABEL_32;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "timeIntervalSinceDate:", v32);
  v36 = v35;
  v37 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_607);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "filteredArrayUsingPredicate:", v38);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "firstObject");
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v37, "submitToCoreAnalytics:type:duration:", v41, 1, v36);
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v42 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v338 = 0;
    _os_log_fault_impl(&dword_1D1A22000, v42, OS_LOG_TYPE_FAULT, "Invalid parameter not satisfying: authorizationManager", v338, 2u);
  }

  v43 = (void *)MEMORY[0x1E0CB35C8];
  *(_QWORD *)v332 = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)v338 = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v338, v332, 1);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (v45)
  {
    v46 = objc_retainAutorelease(v45);

  }
  else
  {
LABEL_32:
    v46 = 0;
  }

  v47 = (uint64_t (*)(uint64_t, uint64_t))v46;
  if (v47)
    v48 = a5 != 0;
  else
    v48 = 0;
  if (v48)
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      v120 = (objc_class *)objc_opt_class();
      NSStringFromClass(v120);
      v121 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(aSelector);
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v338 = 138412802;
      *(_QWORD *)&v338[4] = v121;
      *(_WORD *)&v338[12] = 2112;
      *(_QWORD *)&v338[14] = v122;
      *(_WORD *)&v338[22] = 2112;
      v339 = v47;
      _os_log_error_impl(&dword_1D1A22000, v49, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v338, 0x20u);

    }
    v50 = objc_retainAutorelease(v47);
LABEL_51:
    v11 = 0;
    *a5 = v50;
    v54 = 1;
    goto LABEL_52;
  }
  if (a5 && v327[5])
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      v129 = (objc_class *)objc_opt_class();
      NSStringFromClass(v129);
      v130 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(aSelector);
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      v132 = (uint64_t (*)(uint64_t, uint64_t))v327[5];
      *(_DWORD *)v338 = 138412802;
      *(_QWORD *)&v338[4] = v130;
      *(_WORD *)&v338[12] = 2112;
      *(_QWORD *)&v338[14] = v131;
      *(_WORD *)&v338[22] = 2112;
      v339 = v132;
      _os_log_error_impl(&dword_1D1A22000, v51, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v338, 0x20u);

    }
    v50 = (uint64_t (*)(uint64_t, uint64_t))objc_retainAutorelease(v327[5]);
    goto LABEL_51;
  }
  if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
  {
    objc_msgSend(v8, "buddy");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = v327 + 5;
    v320 = v327[5];
    v54 = -[SMSuggestionsManager _isContactBlocked:error:](self, "_isContactBlocked:error:", v52, &v320);
    objc_storeStrong(v53, v320);

    if (a5 && v327[5])
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      {
        v182 = (objc_class *)objc_opt_class();
        NSStringFromClass(v182);
        v183 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        v184 = (void *)objc_claimAutoreleasedReturnValue();
        v185 = (uint64_t (*)(uint64_t, uint64_t))v327[5];
        *(_DWORD *)v338 = 138412802;
        *(_QWORD *)&v338[4] = v183;
        *(_WORD *)&v338[12] = 2112;
        *(_QWORD *)&v338[14] = v184;
        *(_WORD *)&v338[22] = 2112;
        v339 = v185;
        _os_log_error_impl(&dword_1D1A22000, v55, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v338, 0x20u);

      }
      v50 = (uint64_t (*)(uint64_t, uint64_t))objc_retainAutorelease(v327[5]);
      goto LABEL_51;
    }
    if (v54)
      v11 = 10;
    else
      v11 = 0;
  }
  else
  {
    v54 = 1;
    v11 = 9;
  }
LABEL_52:

  _Block_object_dispose(buf, 8);
  if (v54)
    goto LABEL_107;
LABEL_53:
  if (objc_msgSend(v8, "suggestionTrigger") != 4)
  {
    -[SMSuggestionsManager distanceCalculator](self, "distanceCalculator");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sourceLocation");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "destinationLocation");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = v327 + 5;
    v319 = v327[5];
    objc_msgSend(v74, "distanceFromLocation:toLocation:error:", v75, v76, &v319);
    v79 = v78;
    objc_storeStrong(v77, v319);

    if (a5 && v327[5])
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v80 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
      {
        v133 = (objc_class *)objc_opt_class();
        NSStringFromClass(v133);
        v134 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        v135 = (void *)objc_claimAutoreleasedReturnValue();
        v136 = (uint64_t (*)(uint64_t, uint64_t))v327[5];
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v134;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v135;
        *(_WORD *)&buf[22] = 2112;
        v336 = v136;
        _os_log_error_impl(&dword_1D1A22000, v80, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

      }
      v10 = objc_retainAutorelease(v327[5]);
      goto LABEL_8;
    }
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v84 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
    {
      v85 = (objc_class *)objc_opt_class();
      NSStringFromClass(v85);
      v86 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(aSelector);
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v86;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v87;
      *(_WORD *)&buf[22] = 2048;
      v336 = *(uint64_t (**)(uint64_t, uint64_t))&v79;
      _os_log_impl(&dword_1D1A22000, v84, OS_LOG_TYPE_INFO, "%@, %@, distance between source and destination locations, %.5f", buf, 0x20u);

    }
    if (v79 == 1.79769313e308)
    {
      v11 = 0;
      goto LABEL_107;
    }
    if (v79 < 1000.0)
    {
      v11 = 8;
      goto LABEL_107;
    }
  }
  objc_msgSend(MEMORY[0x1E0D8BA98], "getEnumerationOptionsForLatestSuggestionSortedByCreationDateIncludeSuppressed:filteredToSuggestionTriggers:filteredToSuggestionUserTypes:filteredToSessionTypes:", 0, 0, 0, 0);
  v288 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)v338 = 0;
  *(_QWORD *)&v338[8] = v338;
  *(_QWORD *)&v338[16] = 0x3032000000;
  v339 = __Block_byref_object_copy__102;
  v340 = __Block_byref_object_dispose__102;
  v341 = 0;
  v56 = dispatch_semaphore_create(0);
  -[SMSuggestionsManager suggestionsStore](self, "suggestionsStore");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v315[0] = MEMORY[0x1E0C809B0];
  v315[1] = 3221225472;
  v315[2] = __58__SMSuggestionsManager__suppressSuggestion_context_error___block_invoke_146;
  v315[3] = &unk_1E9296EE0;
  v317 = v338;
  v318 = &v326;
  v58 = v56;
  v316 = v58;
  objc_msgSend(v57, "fetchSuggestionsWithOptions:handler:", v288, v315);

  dsemaa = v58;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(dsemaa, v60))
    goto LABEL_64;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "timeIntervalSinceDate:", v59);
  v63 = v62;
  v64 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_607);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "filteredArrayUsingPredicate:", v65);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "firstObject");
  v68 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v64, "submitToCoreAnalytics:type:duration:", v68, 1, v63);
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v69 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v69, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D1A22000, v69, OS_LOG_TYPE_FAULT, "Invalid parameter not satisfying: authorizationManager", buf, 2u);
  }

  v70 = (void *)MEMORY[0x1E0CB35C8];
  *(_QWORD *)v332 = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)buf = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v332, 1);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v71);
  v72 = (void *)objc_claimAutoreleasedReturnValue();

  if (v72)
  {
    v73 = objc_retainAutorelease(v72);

  }
  else
  {
LABEL_64:
    v73 = 0;
  }

  v81 = (uint64_t (*)(uint64_t, uint64_t))v73;
  if (v81)
    v82 = a5 != 0;
  else
    v82 = 0;
  if (v82)
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v83 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
    {
      v126 = (objc_class *)objc_opt_class();
      NSStringFromClass(v126);
      v127 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(aSelector);
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v127;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v128;
      *(_WORD *)&buf[22] = 2112;
      v336 = v81;
      _os_log_error_impl(&dword_1D1A22000, v83, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

    }
    v286 = objc_retainAutorelease(v81);
    v11 = 0;
    *a5 = v286;
    goto LABEL_105;
  }
  if (a5 && v327[5])
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v88 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
    {
      v164 = (objc_class *)objc_opt_class();
      NSStringFromClass(v164);
      v165 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(aSelector);
      v166 = (void *)objc_claimAutoreleasedReturnValue();
      v167 = (uint64_t (*)(uint64_t, uint64_t))v327[5];
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v165;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v166;
      *(_WORD *)&buf[22] = 2112;
      v336 = v167;
      _os_log_error_impl(&dword_1D1A22000, v88, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

    }
    v11 = 0;
    *a5 = objc_retainAutorelease(v327[5]);
    goto LABEL_104;
  }
  objc_msgSend(v8, "creationDate");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "timeIntervalSinceDate:", *(_QWORD *)(*(_QWORD *)&v338[8] + 40));
  v91 = v90;

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v92 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v92, OS_LOG_TYPE_INFO))
  {
    v93 = (objc_class *)objc_opt_class();
    NSStringFromClass(v93);
    v94 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(aSelector);
    v95 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)&v338[8] + 40), "stringFromDate");
    v96 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    *(_QWORD *)&buf[4] = v94;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v95;
    *(_WORD *)&buf[22] = 2112;
    v336 = v96;
    *(_WORD *)v337 = 2048;
    *(_QWORD *)&v337[2] = (unint64_t)v91;
    *(_WORD *)&v337[10] = 2048;
    *(_QWORD *)&v337[12] = 0x40AC200000000000;
    _os_log_impl(&dword_1D1A22000, v92, OS_LOG_TYPE_INFO, "%@, %@, last suggestion date, %@, hours since last suggestion shown, %lu, kSMSuggestionMinimimTimeIntervalSinceLastSuggestion, %.3f", buf, 0x34u);

  }
  if (*(_QWORD *)(*(_QWORD *)&v338[8] + 40) && (unint64_t)v91 < 0xE10)
  {
    v11 = 3;
LABEL_104:
    v286 = v81;
LABEL_105:
    v285 = v288;
    goto LABEL_106;
  }
  v97 = v327 + 5;
  v314 = v327[5];
  v98 = -[SMSuggestionsManager _isUserInActiveSessionWithError:](self, "_isUserInActiveSessionWithError:", &v314);
  objc_storeStrong(v97, v314);
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v99 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v99, OS_LOG_TYPE_INFO))
  {
    v100 = (objc_class *)objc_opt_class();
    NSStringFromClass(v100);
    v101 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(aSelector);
    v102 = objc_claimAutoreleasedReturnValue();
    v103 = (void *)v102;
    v104 = CFSTR("NO");
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v101;
    *(_WORD *)&buf[12] = 2112;
    if (v98)
      v104 = CFSTR("YES");
    *(_QWORD *)&buf[14] = v102;
    *(_WORD *)&buf[22] = 2112;
    v336 = (uint64_t (*)(uint64_t, uint64_t))v104;
    _os_log_impl(&dword_1D1A22000, v99, OS_LOG_TYPE_INFO, "%@, %@, isUserInActiveSession, %@", buf, 0x20u);

  }
  if (v98)
  {
    v11 = 2;
    goto LABEL_104;
  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v109 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v109, OS_LOG_TYPE_INFO))
  {
    v110 = (objc_class *)objc_opt_class();
    NSStringFromClass(v110);
    v111 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(aSelector);
    v112 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D8BA90], "stringFromSMSuggestionUserType:", objc_msgSend(v8, "suggestionUserType"));
    v113 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v111;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v112;
    *(_WORD *)&buf[22] = 2112;
    v336 = v113;
    _os_log_impl(&dword_1D1A22000, v109, OS_LOG_TYPE_INFO, "%@, %@, suggestion user type, %@,", buf, 0x20u);

  }
  if (objc_msgSend(v8, "suggestionTrigger") == 4)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v114 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v114, OS_LOG_TYPE_INFO))
    {
      v115 = (objc_class *)objc_opt_class();
      NSStringFromClass(v115);
      v116 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(aSelector);
      v117 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D8BA90], "stringFromSMSuggestionTrigger:", objc_msgSend(v8, "suggestionTrigger"));
      v118 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v116;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v117;
      *(_WORD *)&buf[22] = 2112;
      v336 = v118;
      _os_log_impl(&dword_1D1A22000, v114, OS_LOG_TYPE_INFO, "%@, %@, suggestion.suggestionTrigger, %@, suprressed for notification output", buf, 0x20u);

    }
    v11 = 12;
    goto LABEL_104;
  }
  if (objc_msgSend(v8, "suggestionUserType") != 1 && objc_msgSend(v8, "suggestionUserType") != 2)
  {
    if (objc_msgSend(v8, "suggestionUserType") != 3)
    {
      v285 = v288;
      v286 = v81;
      goto LABEL_141;
    }
    v168 = v327 + 5;
    v302 = v327[5];
    -[SMSuggestionsManager _getValuesFromDefaultsIfExists:error:](self, "_getValuesFromDefaultsIfExists:error:", CFSTR("RTDefaultsSuggestionDisplayedCount"), &v302);
    v284 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v168, v302);
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v169 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v169, OS_LOG_TYPE_INFO))
    {
      v170 = (objc_class *)objc_opt_class();
      NSStringFromClass(v170);
      v171 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(aSelector);
      v172 = (id)objc_claimAutoreleasedReturnValue();
      v173 = objc_msgSend(v284, "unsignedIntegerValue");
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v171;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v172;
      *(_WORD *)&buf[22] = 2048;
      v336 = (uint64_t (*)(uint64_t, uint64_t))v173;
      _os_log_impl(&dword_1D1A22000, v169, OS_LOG_TYPE_INFO, "%@, %@, fetched displayed suggestion count, %lu", buf, 0x20u);

    }
    if ((unint64_t)objc_msgSend(v284, "unsignedIntegerValue") >= 5)
    {

      v11 = 6;
      goto LABEL_104;
    }
    v222 = objc_alloc(MEMORY[0x1E0D8BA98]);
    v285 = (void *)objc_msgSend(v222, "initWithBatchSize:fetchLimit:offset:includeSuppressed:sortByCreationDate:ascending:dateInterval:filteredToSuggestionTriggers:filteredToSuggestionUserTypes:filteredToSessionTypes:", *MEMORY[0x1E0D8BD40], *MEMORY[0x1E0D8BD40], *MEMORY[0x1E0D8BD40], 0, 1, 0, 0, 0, 0, 0);

    v223 = dispatch_semaphore_create(0);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v336 = __Block_byref_object_copy__102;
    *(_QWORD *)v337 = __Block_byref_object_dispose__102;
    *(_QWORD *)&v337[8] = 0;
    -[SMSuggestionsManager suggestionsStore](self, "suggestionsStore");
    v224 = (void *)objc_claimAutoreleasedReturnValue();
    v298[0] = MEMORY[0x1E0C809B0];
    v298[1] = 3221225472;
    v298[2] = __58__SMSuggestionsManager__suppressSuggestion_context_error___block_invoke_155;
    v298[3] = &unk_1E9296EE0;
    v300 = buf;
    v301 = &v326;
    v225 = v223;
    v299 = v225;
    objc_msgSend(v224, "fetchSuggestionsWithOptions:handler:", v285, v298);

    dsemaa = v225;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v291 = (void *)objc_claimAutoreleasedReturnValue();
    v226 = dispatch_time(0, 3600000000000);
    v227 = v81;
    if (dispatch_semaphore_wait(dsemaa, v226))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v287 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v287, "timeIntervalSinceDate:", v291);
      v229 = v228;
      v230 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_607);
      v231 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v232 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v232, "filteredArrayUsingPredicate:", v231);
      v233 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v233, "firstObject");
      v234 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v230, "submitToCoreAnalytics:type:duration:", v234, 1, v229);
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v235 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v235, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v332 = 0;
        _os_log_fault_impl(&dword_1D1A22000, v235, OS_LOG_TYPE_FAULT, "Invalid parameter not satisfying: authorizationManager", v332, 2u);
      }

      v236 = (void *)MEMORY[0x1E0CB35C8];
      *(_QWORD *)v343 = *MEMORY[0x1E0CB2D50];
      *(_QWORD *)v332 = CFSTR("semaphore wait timeout");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v332, v343, 1);
      v237 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v236, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v237);
      v238 = (void *)objc_claimAutoreleasedReturnValue();

      v227 = v81;
      if (v238)
      {
        v227 = objc_retainAutorelease(v238);

      }
    }

    v286 = v227;
    if (v286)
      v239 = a5 != 0;
    else
      v239 = 0;
    if (v239)
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v240 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v240, OS_LOG_TYPE_ERROR))
      {
        v269 = (objc_class *)objc_opt_class();
        NSStringFromClass(v269);
        v270 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        v271 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v332 = 138412802;
        *(_QWORD *)&v332[4] = v270;
        *(_WORD *)&v332[12] = 2112;
        *(_QWORD *)&v332[14] = v271;
        *(_WORD *)&v332[22] = 2112;
        v333 = v286;
        _os_log_error_impl(&dword_1D1A22000, v240, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v332, 0x20u);

      }
      v241 = objc_retainAutorelease(v286);
    }
    else
    {
      if (!a5 || !v327[5])
      {
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v247 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v247, OS_LOG_TYPE_INFO))
        {
          v248 = (objc_class *)objc_opt_class();
          NSStringFromClass(v248);
          v249 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(aSelector);
          v250 = (id)objc_claimAutoreleasedReturnValue();
          v251 = objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "count");
          *(_DWORD *)v332 = 138412802;
          *(_QWORD *)&v332[4] = v249;
          *(_WORD *)&v332[12] = 2112;
          *(_QWORD *)&v332[14] = v250;
          *(_WORD *)&v332[22] = 2048;
          v333 = (uint64_t (*)(uint64_t, uint64_t))v251;
          _os_log_impl(&dword_1D1A22000, v247, OS_LOG_TYPE_INFO, "%@, %@, fetched suggestion count, %lu", v332, 0x20u);

        }
        if (objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "count"))
        {
          if ((unint64_t)objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "count") > 4)
          {
            v243 = 1;
          }
          else
          {
            objc_msgSend(v8, "creationDate");
            v252 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "firstObject");
            v253 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v253, "creationDate");
            v254 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v252, "timeIntervalSinceDate:", v254);
            v256 = v255;

            _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
            v257 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v257, OS_LOG_TYPE_INFO))
            {
              v258 = (objc_class *)objc_opt_class();
              NSStringFromClass(v258);
              v259 = (id)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(aSelector);
              v260 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)v332 = 138413058;
              *(_QWORD *)&v332[4] = v259;
              *(_WORD *)&v332[12] = 2112;
              *(_QWORD *)&v332[14] = v260;
              *(_WORD *)&v332[22] = 2048;
              v333 = (uint64_t (*)(uint64_t, uint64_t))v256;
              LOWORD(v334) = 2048;
              *(_QWORD *)((char *)&v334 + 2) = 0x4122750000000000;
              _os_log_impl(&dword_1D1A22000, v257, OS_LOG_TYPE_INFO, "%@, %@, hoursSinceLastSuggestion, %lu, kSMSuggestionFirstTimeUserSuppressionMinimumGap, %.3f", v332, 0x2Au);

            }
            v243 = 0;
            if ((unint64_t)v256 >= 0x93A80)
              v11 = 1;
            else
              v11 = 5;
          }
        }
        else
        {
          v243 = 0;
          v11 = 1;
        }
LABEL_192:

        _Block_object_dispose(buf, 8);
        if ((v243 & 1) == 0)
          goto LABEL_106;
LABEL_141:
        v11 = 0;
        goto LABEL_106;
      }
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v242 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v242, OS_LOG_TYPE_ERROR))
      {
        v272 = (objc_class *)objc_opt_class();
        NSStringFromClass(v272);
        v273 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        v274 = (void *)objc_claimAutoreleasedReturnValue();
        v275 = (uint64_t (*)(uint64_t, uint64_t))v327[5];
        *(_DWORD *)v332 = 138412802;
        *(_QWORD *)&v332[4] = v273;
        *(_WORD *)&v332[12] = 2112;
        *(_QWORD *)&v332[14] = v274;
        *(_WORD *)&v332[22] = 2112;
        v333 = v275;
        _os_log_error_impl(&dword_1D1A22000, v242, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v332, 0x20u);

      }
      v241 = (uint64_t (*)(uint64_t, uint64_t))objc_retainAutorelease(v327[5]);
    }
    v243 = 0;
    v11 = 0;
    *a5 = v241;
    goto LABEL_192;
  }
  v123 = objc_msgSend(v8, "suggestionUserType");
  v124 = v327 + 5;
  if (v123 == 1)
  {
    v313 = v327[5];
    v125 = &v313;
    -[SMSuggestionsManager _getValuesFromDefaultsIfExists:error:](self, "_getValuesFromDefaultsIfExists:error:", CFSTR("RTDefaultsSuggestionRegularUserSuppressionSessionConfigurationCount"), &v313);
    v283 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v312 = v327[5];
    v125 = &v312;
    -[SMSuggestionsManager _getValuesFromDefaultsIfExists:error:](self, "_getValuesFromDefaultsIfExists:error:", CFSTR("RTDefaultsSuggestionOccasionalUserSuppressionSessionConfigurationCount"), &v312);
    v283 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_storeStrong(v124, *v125);
  v137 = objc_alloc(MEMORY[0x1E0D8BA98]);
  v138 = objc_msgSend(v283, "unsignedIntValue");
  v139 = objc_alloc(MEMORY[0x1E0CB3588]);
  objc_msgSend(v295, "dateByAddingTimeInterval:", -604800.0);
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  v141 = (void *)objc_msgSend(v139, "initWithStartDate:duration:", v140, 604800.0);
  v280 = *MEMORY[0x1E0D8BD40];
  v285 = (void *)objc_msgSend(v137, "initWithBatchSize:fetchLimit:offset:includeSuppressed:sortByCreationDate:ascending:dateInterval:filteredToSuggestionTriggers:filteredToSuggestionUserTypes:filteredToSessionTypes:", *MEMORY[0x1E0D8BD40], v138, *MEMORY[0x1E0D8BD40], 0, 1, 0, v141, 0, 0, 0);

  v142 = *(void **)(*(_QWORD *)&v338[8] + 40);
  *(_QWORD *)(*(_QWORD *)&v338[8] + 40) = 0;

  *(_QWORD *)v332 = 0;
  *(_QWORD *)&v332[8] = v332;
  *(_QWORD *)&v332[16] = 0x3032000000;
  v333 = __Block_byref_object_copy__102;
  *(_QWORD *)&v334 = __Block_byref_object_dispose__102;
  *((_QWORD *)&v334 + 1) = 0;
  v143 = dispatch_semaphore_create(0);

  -[SMSuggestionsManager suggestionsStore](self, "suggestionsStore");
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  v308[0] = MEMORY[0x1E0C809B0];
  v308[1] = 3221225472;
  v308[2] = __58__SMSuggestionsManager__suppressSuggestion_context_error___block_invoke_151;
  v308[3] = &unk_1E9296EE0;
  v310 = v332;
  v311 = &v326;
  v145 = v143;
  v309 = v145;
  objc_msgSend(v144, "fetchSuggestionsWithOptions:handler:", v285, v308);

  dsemaa = v145;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  v147 = dispatch_time(0, 3600000000000);
  v148 = v81;
  if (dispatch_semaphore_wait(dsemaa, v147))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v289 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v289, "timeIntervalSinceDate:", v146);
    v150 = v149;
    v151 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_607);
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v153, "filteredArrayUsingPredicate:", v152);
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v154, "firstObject");
    v155 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v151, "submitToCoreAnalytics:type:duration:", v155, 1, v150);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v156 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v156, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D1A22000, v156, OS_LOG_TYPE_FAULT, "Invalid parameter not satisfying: authorizationManager", buf, 2u);
    }

    v157 = (void *)MEMORY[0x1E0CB35C8];
    *(_QWORD *)v343 = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)buf = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v343, 1);
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v157, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v158);
    v159 = (void *)objc_claimAutoreleasedReturnValue();

    v148 = v81;
    if (v159)
    {
      v148 = objc_retainAutorelease(v159);

    }
  }

  v286 = v148;
  if (v286)
    v160 = a5 != 0;
  else
    v160 = 0;
  if (v160)
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v161 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v161, OS_LOG_TYPE_ERROR))
    {
      v244 = (objc_class *)objc_opt_class();
      NSStringFromClass(v244);
      v245 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(aSelector);
      v246 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v245;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v246;
      *(_WORD *)&buf[22] = 2112;
      v336 = v286;
      _os_log_error_impl(&dword_1D1A22000, v161, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

    }
    v162 = objc_retainAutorelease(v286);
    goto LABEL_165;
  }
  if (a5 && v327[5])
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v163 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v163, OS_LOG_TYPE_ERROR))
    {
      v261 = (objc_class *)objc_opt_class();
      NSStringFromClass(v261);
      v262 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(aSelector);
      v263 = (void *)objc_claimAutoreleasedReturnValue();
      v264 = (uint64_t (*)(uint64_t, uint64_t))v327[5];
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v262;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v263;
      *(_WORD *)&buf[22] = 2112;
      v336 = v264;
      _os_log_error_impl(&dword_1D1A22000, v163, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

    }
    v162 = (uint64_t (*)(uint64_t, uint64_t))objc_retainAutorelease(v327[5]);
    goto LABEL_165;
  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v174 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v174, OS_LOG_TYPE_INFO))
  {
    v175 = (objc_class *)objc_opt_class();
    NSStringFromClass(v175);
    v176 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(aSelector);
    v177 = (id)objc_claimAutoreleasedReturnValue();
    v178 = objc_msgSend(*(id *)(*(_QWORD *)&v332[8] + 40), "count");
    objc_msgSend(MEMORY[0x1E0D8BA90], "stringFromSMSuggestionUserType:", objc_msgSend(v8, "suggestionUserType"));
    v179 = (id)objc_claimAutoreleasedReturnValue();
    v180 = objc_msgSend(v283, "unsignedIntValue");
    *(_DWORD *)buf = 138413314;
    *(_QWORD *)&buf[4] = v176;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v177;
    *(_WORD *)&buf[22] = 2048;
    v336 = (uint64_t (*)(uint64_t, uint64_t))v178;
    *(_WORD *)v337 = 2112;
    *(_QWORD *)&v337[2] = v179;
    *(_WORD *)&v337[10] = 2048;
    *(_QWORD *)&v337[12] = v180;
    _os_log_impl(&dword_1D1A22000, v174, OS_LOG_TYPE_INFO, "%@, %@, previous suggestion count, %lu, suggestion user type, %@, suggestionUserSuppressionSessionConfigurationCount, %lu", buf, 0x34u);

  }
  v181 = objc_msgSend(*(id *)(*(_QWORD *)&v332[8] + 40), "count");
  if (v181 < objc_msgSend(v283, "unsignedIntValue"))
  {
    v11 = 1;
    goto LABEL_166;
  }
  v186 = 0;
  v277 = 1;
  v278 = *MEMORY[0x1E0D18598];
  v279 = *MEMORY[0x1E0CB2D50];
  do
  {
    if (v186 >= objc_msgSend(v283, "unsignedIntValue"))
      break;
    v290 = v186;
    if (objc_msgSend(*(id *)(*(_QWORD *)&v332[8] + 40), "count") <= v186)
      break;
    context = (void *)MEMORY[0x1D8231EA8]();
    v187 = dispatch_semaphore_create(0);
    v188 = objc_alloc(MEMORY[0x1E0D8B9F8]);
    v189 = objc_alloc(MEMORY[0x1E0CB3588]);
    objc_msgSend(*(id *)(*(_QWORD *)&v332[8] + 40), "objectAtIndexedSubscript:", v290);
    v190 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v190, "creationDate");
    v191 = (void *)objc_claimAutoreleasedReturnValue();
    v192 = (void *)objc_msgSend(v189, "initWithStartDate:duration:", v191, 7200.0);
    LOBYTE(v276) = 0;
    v282 = (void *)objc_msgSend(v188, "initWithBatchSize:fetchLimit:sortBySessionStartDate:ascending:sessionTypes:timeInADayInterval:pickOneConfigInTimeInADayInterval:dateInterval:startBoundingBoxLocation:destinationBoundingBoxLocation:boundingBoxRadius:sessionIdentifier:", v280, 1, 1, 1, &unk_1E932C898, 0, v276, v192, 0, 0, 0, 0);

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v336 = __Block_byref_object_copy__102;
    *(_QWORD *)v337 = __Block_byref_object_dispose__102;
    *(_QWORD *)&v337[8] = 0;
    -[SMSuggestionsManager sessionStore](self, "sessionStore");
    v193 = (void *)objc_claimAutoreleasedReturnValue();
    v304[0] = MEMORY[0x1E0C809B0];
    v304[1] = 3221225472;
    v304[2] = __58__SMSuggestionsManager__suppressSuggestion_context_error___block_invoke_154;
    v304[3] = &unk_1E9296EE0;
    v306 = buf;
    v307 = &v326;
    v194 = v187;
    v305 = v194;
    objc_msgSend(v193, "fetchSessionConfigurationsWithOptions:handler:", v282, v304);

    v195 = v194;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v196 = (void *)objc_claimAutoreleasedReturnValue();
    v197 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v195, v197))
      goto LABEL_150;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v198 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v198, "timeIntervalSinceDate:", v196);
    v200 = v199;
    v201 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_607);
    v202 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v203 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v203, "filteredArrayUsingPredicate:", v202);
    v204 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v204, "firstObject");
    v205 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v201, "submitToCoreAnalytics:type:duration:", v205, 1, v200);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v206 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v206, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v343 = 0;
      _os_log_fault_impl(&dword_1D1A22000, v206, OS_LOG_TYPE_FAULT, "Invalid parameter not satisfying: authorizationManager", v343, 2u);
    }

    v207 = (void *)MEMORY[0x1E0CB35C8];
    v342 = v279;
    *(_QWORD *)v343 = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v343, &v342, 1);
    v208 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v207, "errorWithDomain:code:userInfo:", v278, 15, v208);
    v209 = (void *)objc_claimAutoreleasedReturnValue();

    if (v209)
    {
      v210 = objc_retainAutorelease(v209);

    }
    else
    {
LABEL_150:
      v210 = 0;
    }

    v211 = v210;
    v212 = v327 + 5;
    if (v211)
    {
      objc_storeStrong(v327 + 5, v210);
    }
    else if (!*v212)
    {
      v214 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
      v303 = 0;
      v277 = -[SMSuggestionsManager _isSessionConfigurationSimilarToTheSuggestion:sessionConfiguration:error:](self, "_isSessionConfigurationSimilarToTheSuggestion:sessionConfiguration:error:", v8, v214, &v303);
      objc_storeStrong(v212, v303);
      if (v327[5])
        v213 = 0;
      else
        v213 = !v277;
      goto LABEL_155;
    }
    v213 = 0;
LABEL_155:

    _Block_object_dispose(buf, 8);
    objc_autoreleasePoolPop(context);
    v186 = v290 + 1;
  }
  while (v213);
  if (a5 && v327[5])
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v215 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v215, OS_LOG_TYPE_ERROR))
    {
      v265 = (objc_class *)objc_opt_class();
      NSStringFromClass(v265);
      v266 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(aSelector);
      v267 = (void *)objc_claimAutoreleasedReturnValue();
      v268 = (uint64_t (*)(uint64_t, uint64_t))v327[5];
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v266;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v267;
      *(_WORD *)&buf[22] = 2112;
      v336 = v268;
      _os_log_error_impl(&dword_1D1A22000, v215, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

    }
    v162 = (uint64_t (*)(uint64_t, uint64_t))objc_retainAutorelease(v327[5]);
LABEL_165:
    v11 = 0;
    *a5 = v162;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v216 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v216, OS_LOG_TYPE_INFO))
    {
      v217 = (objc_class *)objc_opt_class();
      NSStringFromClass(v217);
      v218 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(aSelector);
      v219 = objc_claimAutoreleasedReturnValue();
      v220 = (void *)v219;
      v221 = CFSTR("NO");
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v218;
      *(_WORD *)&buf[12] = 2112;
      if (v277)
        v221 = CFSTR("YES");
      *(_QWORD *)&buf[14] = v219;
      *(_WORD *)&buf[22] = 2112;
      v336 = (uint64_t (*)(uint64_t, uint64_t))v221;
      _os_log_impl(&dword_1D1A22000, v216, OS_LOG_TYPE_INFO, "%@, %@, atleast one previous suggestions is used, %@, ", buf, 0x20u);

    }
    if (v277)
      v11 = 1;
    else
      v11 = 4;
  }
LABEL_166:

  _Block_object_dispose(v332, 8);
LABEL_106:

  _Block_object_dispose(v338, 8);
LABEL_107:

  _Block_object_dispose(&v326, 8);
LABEL_108:

  return v11;
}

void __58__SMSuggestionsManager__suppressSuggestion_context_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a3;
  objc_msgSend(a2, "firstObject");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v5;
  v11 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __58__SMSuggestionsManager__suppressSuggestion_context_error___block_invoke_146(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v5 = a3;
  objc_msgSend(a2, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "creationDate");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v5;
  v12 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __58__SMSuggestionsManager__suppressSuggestion_context_error___block_invoke_151(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __58__SMSuggestionsManager__suppressSuggestion_context_error___block_invoke_154(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a3;
  objc_msgSend(a2, "firstObject");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v5;
  v11 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __58__SMSuggestionsManager__suppressSuggestion_context_error___block_invoke_155(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)_isSessionConfigurationSimilarToTheSuggestion:(id)a3 sessionConfiguration:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
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
  int v33;
  const __CFString *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  NSObject *v38;
  NSObject *v39;
  BOOL v40;
  const char *v41;
  NSObject *v42;
  objc_class *v43;
  void *v44;
  id v45;
  __CFString *v46;
  NSObject *v47;
  objc_class *v48;
  void *v49;
  void *v50;
  void *v51;
  const __CFString *v52;
  double v53;
  void *v55;
  void *v56;
  __CFString *v57;
  objc_class *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  const __CFString *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  id *v72;
  id *v73;
  id v75;
  id v76;
  uint8_t buf[4];
  void *v78;
  __int16 v79;
  id v80;
  __int16 v81;
  double v82;
  __int16 v83;
  void *v84;
  __int16 v85;
  const __CFString *v86;
  __int16 v87;
  void *v88;
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      goto LABEL_39;
    *(_WORD *)buf = 0;
    v41 = "Invalid parameter not satisfying: suggestion";
LABEL_18:
    _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, v41, buf, 2u);
    goto LABEL_39;
  }
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      goto LABEL_39;
    *(_WORD *)buf = 0;
    v41 = "Invalid parameter not satisfying: sessionConfiguration";
    goto LABEL_18;
  }
  -[SMSuggestionsManager distanceCalculator](self, "distanceCalculator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "destinationLocation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "destination");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "location");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = 0;
  objc_msgSend(v11, "distanceFromLocation:toLocation:error:", v12, v14, &v76);
  v16 = v15;
  v17 = v76;

  if (v17 || v16 == 1.79769313e308)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      v43 = (objc_class *)objc_opt_class();
      NSStringFromClass(v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v45 = (id)objc_claimAutoreleasedReturnValue();
      v73 = a5;
      if (v16 == 1.79769313e308)
      {
        v46 = CFSTR("DBL_MAX");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.3f"), *(_QWORD *)&v16);
        v46 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v8, "destinationLocation");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "destination");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "location");
      v57 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413570;
      v78 = v44;
      v79 = 2112;
      v80 = v45;
      v81 = 2112;
      v82 = *(double *)&v46;
      v83 = 2112;
      v84 = v55;
      v85 = 2112;
      v86 = v57;
      v87 = 2112;
      v88 = v17;
      _os_log_impl(&dword_1D1A22000, v42, OS_LOG_TYPE_INFO, "%@, %@, distance, %@, suggestion.destinationLocation, %@, sessionConfiguration.destination.location, %@, error, %@", buf, 0x3Eu);

      if (v16 != 1.79769313e308)
      a5 = v73;
    }

    if (a5)
    {
      v17 = objc_retainAutorelease(v17);
      v40 = 0;
      *a5 = v17;
      goto LABEL_40;
    }
LABEL_39:
    v40 = 0;
    goto LABEL_40;
  }
  v18 = (void *)MEMORY[0x1E0D397A8];
  objc_msgSend(v8, "buddy");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "phoneNumber");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "validateAndCleanupID:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)MEMORY[0x1E0D397A8];
  objc_msgSend(v10, "conversation");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "receiverHandles");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "firstObject");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "primaryHandle");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "validateAndCleanupID:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = v21;
  v67 = CFSTR("YES");
  if ((objc_msgSend(v21, "isEqualToString:", v24) & 1) == 0)
  {
    v66 = v19;
    v25 = (void *)MEMORY[0x1E0D397A8];
    objc_msgSend(v8, "buddy");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "email");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "validateAndCleanupID:", v63);
    v62 = v23;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = v20;
    v27 = (void *)MEMORY[0x1E0D397A8];
    objc_msgSend(v10, "conversation");
    v72 = a5;
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "receiverHandles");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "firstObject");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "primaryHandle");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "validateAndCleanupID:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v26, "isEqualToString:", v32);
    v34 = CFSTR("NO");
    if (v33)
      v34 = CFSTR("YES");
    v67 = v34;

    v20 = v65;
    v19 = v66;

    a5 = v72;
    v23 = v62;

  }
  v35 = objc_msgSend(v8, "sessionType");
  v36 = objc_msgSend(v10, "sessionType");
  v75 = 0;
  -[SMSuggestionsManager _getValuesFromDefaultsIfExists:error:](self, "_getValuesFromDefaultsIfExists:error:", CFSTR("RTDefaultsSuggestionDestinationSimilarityRadiusToSessionConfiguration"), &v75);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v75;
  v17 = v38;
  if (a5 && v38)
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      v59 = (objc_class *)objc_opt_class();
      NSStringFromClass(v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v78 = v60;
      v79 = 2112;
      v80 = v61;
      v81 = 2112;
      v82 = *(double *)&v17;
      _os_log_error_impl(&dword_1D1A22000, v39, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

    }
    v40 = 0;
    *a5 = objc_retainAutorelease(v17);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
    {
      v48 = (objc_class *)objc_opt_class();
      NSStringFromClass(v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "doubleValue");
      *(_DWORD *)buf = 138413570;
      v52 = CFSTR("NO");
      v78 = v49;
      if (v35 == v36)
        v52 = CFSTR("YES");
      v79 = 2112;
      v80 = v50;
      v81 = 2048;
      v82 = v16;
      v83 = 2048;
      v84 = v51;
      v85 = 2112;
      v86 = v67;
      v87 = 2112;
      v88 = (void *)v52;
      _os_log_impl(&dword_1D1A22000, v47, OS_LOG_TYPE_INFO, "%@, %@, distance between destinations, %.3f, threshold, %.3f, are buddies equal, %@, are session types equal, %@", buf, 0x3Eu);

    }
    objc_msgSend(v37, "doubleValue");
    v40 = v16 <= v53 && v35 == v36;
  }

LABEL_40:
  return v40;
}

- (BOOL)_isEffectivePairedDeviceNearby
{
  NSObject *v4;
  void *v5;
  void *v6;
  char v7;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMSuggestionsManager messagingService](self, "messagingService");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "effectivePairedDevice");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412802;
    v15 = v10;
    v16 = 2112;
    v17 = v11;
    v18 = 1024;
    v19 = objc_msgSend(v13, "isNearby");
    _os_log_debug_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_DEBUG, "%@, %@, self.messagingService.effectivePairedDevice.nearby %d", (uint8_t *)&v14, 0x1Cu);

  }
  -[SMSuggestionsManager messagingService](self, "messagingService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "effectivePairedDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isNearby");

  return v7;
}

- (void)fetchSuggestedSessionConfigurationWithHandler:(id)a3
{
  id v4;
  BOOL v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD block[5];
  id v9;
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v10 = 0;
    v5 = -[SMSuggestionsManager isZelkovaSuggestionsFeatureEnabledWithError:](self, "isZelkovaSuggestionsFeatureEnabledWithError:", &v10);
    v6 = v10;
    if (v5)
    {
      -[RTNotifier queue](self, "queue");
      v7 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __70__SMSuggestionsManager_fetchSuggestedSessionConfigurationWithHandler___block_invoke;
      block[3] = &unk_1E9297650;
      block[4] = self;
      v9 = v4;
      dispatch_async(v7, block);

    }
    else
    {
      (*((void (**)(id, _QWORD, NSObject *))v4 + 2))(v4, 0, v6);
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v12 = "-[SMSuggestionsManager fetchSuggestedSessionConfigurationWithHandler:]";
      v13 = 1024;
      v14 = 2876;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }

}

uint64_t __70__SMSuggestionsManager_fetchSuggestedSessionConfigurationWithHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchSuggestedSessionConfigurationWithHandler:", *(_QWORD *)(a1 + 40));
}

- (void)_fetchSuggestedSessionConfigurationWithHandler:(id)a3
{
  void (**v5)(id, _QWORD);
  id *v6;
  NSObject *v7;
  NSObject *v8;
  objc_class *v9;
  id v10;
  id v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  double v13;
  NSObject *v14;
  objc_class *v15;
  id v16;
  id v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  double v19;
  double v20;
  void *v21;
  id *v22;
  void *v23;
  NSObject *v24;
  objc_class *v25;
  id v26;
  id v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  id v29;
  id v30;
  double v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  id *v36;
  NSObject *v37;
  objc_class *v38;
  id v39;
  id v40;
  uint64_t v41;
  NSObject *v42;
  objc_class *v43;
  id v44;
  void *v45;
  NSObject *v46;
  objc_class *v47;
  id v48;
  void *v49;
  dispatch_semaphore_t v50;
  void *v51;
  uint64_t v52;
  NSObject *v53;
  dispatch_time_t v54;
  double v55;
  double v56;
  void *v57;
  void *v58;
  void *v59;
  NSObject *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  id v65;
  void *v66;
  NSObject *v67;
  objc_class *v68;
  id v69;
  id v70;
  uint64_t v71;
  dispatch_semaphore_t v72;
  void *v73;
  NSObject *v74;
  void *v75;
  dispatch_time_t v76;
  void *v77;
  double v78;
  double v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  NSObject *v84;
  void *v85;
  void *v86;
  void *v87;
  id v88;
  id v89;
  NSObject *v90;
  objc_class *v91;
  id v92;
  id v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  void *v99;
  id *v100;
  _BOOL4 v101;
  int v102;
  int v103;
  id v104;
  NSObject *v105;
  NSObject *v106;
  objc_class *v107;
  id v108;
  id v109;
  void *v110;
  id v111;
  void *v112;
  void *v113;
  id v114;
  void *v115;
  void *v116;
  void *v117;
  id v118;
  void *v119;
  void *v120;
  id v121;
  void *v122;
  objc_class *v123;
  id v124;
  id v125;
  uint64_t v126;
  uint64_t v127;
  NSObject *v128;
  objc_class *v129;
  id v130;
  void *v131;
  uint64_t v132;
  uint64_t v133;
  void *v134;
  void *v135;
  void *v136;
  id v137;
  id v138;
  void *v139;
  void *v140;
  id v141;
  NSObject *dsema;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  const char *aSelector;
  id v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  _QWORD v154[4];
  NSObject *v155;
  _BYTE *v156;
  uint64_t *v157;
  _QWORD v158[4];
  NSObject *v159;
  _BYTE *v160;
  uint64_t *v161;
  uint64_t *v162;
  uint64_t v163;
  uint64_t *v164;
  uint64_t v165;
  uint64_t (*v166)(uint64_t, uint64_t);
  void (*v167)(uint64_t);
  id v168;
  id v169;
  id v170;
  id v171;
  id obj;
  uint64_t v173;
  uint64_t *v174;
  uint64_t v175;
  uint64_t (*v176)(uint64_t, uint64_t);
  void (*v177)(uint64_t);
  id v178;
  void *v179;
  _BYTE v180[12];
  __int16 v181;
  id v182;
  __int16 v183;
  uint64_t v184;
  __int16 v185;
  uint64_t v186;
  uint8_t v187[128];
  _BYTE v188[24];
  uint64_t (*v189)(uint64_t, uint64_t);
  void (*v190)(uint64_t);
  id v191;
  _BYTE buf[24];
  uint64_t (*v193)(uint64_t, uint64_t);
  _BYTE v194[20];
  _QWORD v195[4];

  v195[1] = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, _QWORD))a3;
  if (v5)
  {
    aSelector = a2;
    v173 = 0;
    v174 = &v173;
    v175 = 0x3032000000;
    v176 = __Block_byref_object_copy__102;
    v177 = __Block_byref_object_dispose__102;
    v178 = 0;
    obj = 0;
    -[SMSuggestionsManager _refreshCurrentLocationWithError:](self, "_refreshCurrentLocationWithError:", &obj);
    objc_storeStrong(&v178, obj);
    v6 = (id *)(v174 + 5);
    if (v174[5])
    {
      v5[2](v5, 0);
      v7 = 0;
    }
    else
    {
      v171 = 0;
      -[SMSuggestionsManager _getValuesFromDefaultsIfExists:error:](self, "_getValuesFromDefaultsIfExists:error:", CFSTR("RTDefaultsSuggestionTimeIntervalBuffer"), &v171);
      v147 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong(v6, v171);
      if (v174[5])
      {
        v5[2](v5, 0);
        v7 = 0;
      }
      else
      {
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          v9 = (objc_class *)objc_opt_class();
          NSStringFromClass(v9);
          v10 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v11 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v147, "doubleValue");
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)&buf[4] = v10;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v11;
          *(_WORD *)&buf[22] = 2048;
          v193 = v12;
          _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "%@, %@, using time interval buffer, %.3f", buf, 0x20u);

        }
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v146 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v147, "doubleValue");
        objc_msgSend(v146, "dateByAddingTimeInterval:", -v13);
        v145 = (void *)objc_claimAutoreleasedReturnValue();
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          v15 = (objc_class *)objc_opt_class();
          NSStringFromClass(v15);
          v16 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v17 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v145, "stringFromDate");
          v18 = (uint64_t (*)(uint64_t, uint64_t))(id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v147, "doubleValue");
          v20 = v19;
          -[SMSuggestionsManager latestLocationOfTheDevice](self, "latestLocationOfTheDevice");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413314;
          *(_QWORD *)&buf[4] = v16;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v17;
          *(_WORD *)&buf[22] = 2112;
          v193 = v18;
          *(_WORD *)v194 = 2048;
          *(double *)&v194[2] = v20 + v20;
          *(_WORD *)&v194[10] = 2112;
          *(_QWORD *)&v194[12] = v21;
          _os_log_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_INFO, "%@, %@, fetching config from last session around currentDateMinusBufferTime, %@, timeIntervalWindow, %.3f, location, %@", buf, 0x34u);

        }
        v22 = (id *)(v174 + 5);
        v170 = (id)v174[5];
        -[SMSuggestionsManager _getValuesFromDefaultsIfExists:error:](self, "_getValuesFromDefaultsIfExists:error:", CFSTR("RTDefaultsSuggestionBoundingBoxRadius"), &v170);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_storeStrong(v22, v170);
        if (v174[5])
        {
          v5[2](v5, 0);
          v7 = 0;
        }
        else
        {
          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            v25 = (objc_class *)objc_opt_class();
            NSStringFromClass(v25);
            v26 = (id)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v27 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "doubleValue");
            *(_DWORD *)buf = 138412802;
            *(_QWORD *)&buf[4] = v26;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v27;
            *(_WORD *)&buf[22] = 2048;
            v193 = v28;
            _os_log_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_INFO, "%@, %@, using bounding box radius, %.3f", buf, 0x20u);

          }
          v29 = objc_alloc(MEMORY[0x1E0D8B9F8]);
          v30 = objc_alloc(MEMORY[0x1E0CB3588]);
          objc_msgSend(v147, "doubleValue");
          v32 = (void *)objc_msgSend(v30, "initWithStartDate:duration:", v145, v31 + v31);
          v33 = objc_alloc(MEMORY[0x1E0C9E3B8]);
          -[SMSuggestionsManager latestLocationOfTheDevice](self, "latestLocationOfTheDevice");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = (void *)objc_msgSend(v33, "initWithRTLocation:", v34);
          LOBYTE(v132) = 1;
          v144 = (void *)objc_msgSend(v29, "initWithBatchSize:fetchLimit:sortBySessionStartDate:ascending:sessionTypes:timeInADayInterval:pickOneConfigInTimeInADayInterval:dateInterval:startBoundingBoxLocation:destinationBoundingBoxLocation:boundingBoxRadius:sessionIdentifier:", *MEMORY[0x1E0D8BD30], 1, 1, 0, 0, v32, v132, 0, v35, 0, v23, 0);

          v36 = (id *)(v174 + 5);
          v169 = (id)v174[5];
          -[SMSuggestionsManager _getSessionConfigurationsWithOptions:error:](self, "_getSessionConfigurationsWithOptions:error:", v144, &v169);
          v143 = (void *)objc_claimAutoreleasedReturnValue();
          objc_storeStrong(v36, v169);
          if (v174[5])
          {
            v5[2](v5, 0);
            v7 = 0;
          }
          else
          {
            _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
            v37 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
            {
              v38 = (objc_class *)objc_opt_class();
              NSStringFromClass(v38);
              v39 = (id)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              v40 = (id)objc_claimAutoreleasedReturnValue();
              v41 = objc_msgSend(v143, "count");
              *(_DWORD *)buf = 138412802;
              *(_QWORD *)&buf[4] = v39;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v40;
              *(_WORD *)&buf[22] = 2048;
              v193 = (uint64_t (*)(uint64_t, uint64_t))v41;
              _os_log_impl(&dword_1D1A22000, v37, OS_LOG_TYPE_INFO, "%@, %@, configs count, %lu", buf, 0x20u);

            }
            if (objc_msgSend(v143, "count"))
            {
              objc_msgSend(v143, "firstObject");
              v7 = objc_claimAutoreleasedReturnValue();
              _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
              v42 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
              {
                v43 = (objc_class *)objc_opt_class();
                NSStringFromClass(v43);
                v44 = (id)objc_claimAutoreleasedReturnValue();
                NSStringFromSelector(a2);
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412802;
                *(_QWORD *)&buf[4] = v44;
                *(_WORD *)&buf[12] = 2112;
                *(_QWORD *)&buf[14] = v45;
                *(_WORD *)&buf[22] = 2112;
                v193 = (uint64_t (*)(uint64_t, uint64_t))v7;
                _os_log_impl(&dword_1D1A22000, v42, OS_LOG_TYPE_INFO, "%@, %@, suggested config, %@", buf, 0x20u);

              }
              ((void (*)(void (**)(id, _QWORD), NSObject *, _QWORD))v5[2])(v5, v7, 0);
            }
            else
            {
              _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
              v46 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
              {
                v47 = (objc_class *)objc_opt_class();
                NSStringFromClass(v47);
                v48 = (id)objc_claimAutoreleasedReturnValue();
                NSStringFromSelector(a2);
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                *(_QWORD *)&buf[4] = v48;
                *(_WORD *)&buf[12] = 2112;
                *(_QWORD *)&buf[14] = v49;
                _os_log_impl(&dword_1D1A22000, v46, OS_LOG_TYPE_INFO, "%@, %@, since configs are zero, trying to fetch likely handles and destinations", buf, 0x16u);

              }
              v50 = dispatch_semaphore_create(0);
              *(_QWORD *)buf = 0;
              *(_QWORD *)&buf[8] = buf;
              *(_QWORD *)&buf[16] = 0x3032000000;
              v193 = __Block_byref_object_copy__102;
              *(_QWORD *)v194 = __Block_byref_object_dispose__102;
              *(_QWORD *)&v194[8] = 0;
              v163 = 0;
              v164 = &v163;
              v165 = 0x3032000000;
              v166 = __Block_byref_object_copy__102;
              v167 = __Block_byref_object_dispose__102;
              v168 = 0;
              -[SMSuggestionsManager suggestionsHelper](self, "suggestionsHelper");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = MEMORY[0x1E0C809B0];
              v158[0] = MEMORY[0x1E0C809B0];
              v158[1] = 3221225472;
              v158[2] = __71__SMSuggestionsManager__fetchSuggestedSessionConfigurationWithHandler___block_invoke;
              v158[3] = &unk_1E92A14E8;
              v160 = buf;
              v161 = &v163;
              v162 = &v173;
              v53 = v50;
              v159 = v53;
              objc_msgSend(v51, "fetchMostLikelySessionDestinationsWithHandler:", v158);

              dsema = v53;
              objc_msgSend(MEMORY[0x1E0C99D68], "now");
              v139 = (void *)objc_claimAutoreleasedReturnValue();
              v54 = dispatch_time(0, 3600000000000);
              if (!dispatch_semaphore_wait(dsema, v54))
                goto LABEL_31;
              objc_msgSend(MEMORY[0x1E0C99D68], "now");
              v137 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v137, "timeIntervalSinceDate:", v139);
              v56 = v55;
              v134 = (void *)objc_opt_new();
              objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_607);
              v135 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v57, "filteredArrayUsingPredicate:", v135);
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v58, "firstObject");
              v59 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v134, "submitToCoreAnalytics:type:duration:", v59, 1, v56);
              _rt_log_facility_get_os_log(RTLogFacilityGeneral);
              v60 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v60, OS_LOG_TYPE_FAULT))
              {
                *(_WORD *)v188 = 0;
                _os_log_fault_impl(&dword_1D1A22000, v60, OS_LOG_TYPE_FAULT, "Invalid parameter not satisfying: authorizationManager", v188, 2u);
              }

              v61 = (void *)MEMORY[0x1E0CB35C8];
              *(_QWORD *)v180 = *MEMORY[0x1E0CB2D50];
              *(_QWORD *)v188 = CFSTR("semaphore wait timeout");
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v188, v180, 1);
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v61, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v62);
              v63 = (void *)objc_claimAutoreleasedReturnValue();

              if (v63)
              {
                v64 = objc_retainAutorelease(v63);

              }
              else
              {
LABEL_31:
                v64 = 0;
              }

              v65 = v64;
              if (v65)
              {
                v66 = v65;
                ((void (*)(void (**)(id, _QWORD), _QWORD, id))v5[2])(v5, 0, v65);
                v7 = 0;
              }
              else if (v174[5])
              {
                v5[2](v5, 0);
                v66 = 0;
                v7 = 0;
              }
              else
              {
                _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
                v67 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
                {
                  v68 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v68);
                  v69 = (id)objc_claimAutoreleasedReturnValue();
                  NSStringFromSelector(a2);
                  v70 = (id)objc_claimAutoreleasedReturnValue();
                  v71 = objc_msgSend((id)v164[5], "count");
                  *(_DWORD *)v188 = 138412802;
                  *(_QWORD *)&v188[4] = v69;
                  *(_WORD *)&v188[12] = 2112;
                  *(_QWORD *)&v188[14] = v70;
                  *(_WORD *)&v188[22] = 2048;
                  v189 = (uint64_t (*)(uint64_t, uint64_t))v71;
                  _os_log_impl(&dword_1D1A22000, v67, OS_LOG_TYPE_INFO, "%@, %@, session destinations count, %lu", v188, 0x20u);

                }
                v72 = dispatch_semaphore_create(0);

                *(_QWORD *)v188 = 0;
                *(_QWORD *)&v188[8] = v188;
                *(_QWORD *)&v188[16] = 0x3032000000;
                v189 = __Block_byref_object_copy__102;
                v190 = __Block_byref_object_dispose__102;
                v191 = 0;
                -[SMSuggestionsManager suggestionsHelper](self, "suggestionsHelper");
                v73 = (void *)objc_claimAutoreleasedReturnValue();
                v154[0] = v52;
                v154[1] = 3221225472;
                v154[2] = __71__SMSuggestionsManager__fetchSuggestedSessionConfigurationWithHandler___block_invoke_164;
                v154[3] = &unk_1E9296EE0;
                v156 = v188;
                v157 = &v173;
                v74 = v72;
                v155 = v74;
                objc_msgSend(v73, "fetchMostLikelyReceiverHandlesWithHandler:", v154);

                dsema = v74;
                objc_msgSend(MEMORY[0x1E0C99D68], "now");
                v75 = (void *)objc_claimAutoreleasedReturnValue();
                v76 = dispatch_time(0, 3600000000000);
                if (!dispatch_semaphore_wait(dsema, v76))
                  goto LABEL_43;
                objc_msgSend(MEMORY[0x1E0C99D68], "now");
                v77 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v77, "timeIntervalSinceDate:", v75);
                v79 = v78;
                v80 = (void *)objc_opt_new();
                objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_607);
                v140 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
                v81 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v81, "filteredArrayUsingPredicate:", v140);
                v82 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v82, "firstObject");
                v83 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v80, "submitToCoreAnalytics:type:duration:", v83, 1, v79);
                _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                v84 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v84, OS_LOG_TYPE_FAULT))
                {
                  *(_WORD *)v180 = 0;
                  _os_log_fault_impl(&dword_1D1A22000, v84, OS_LOG_TYPE_FAULT, "Invalid parameter not satisfying: authorizationManager", v180, 2u);
                }

                v85 = (void *)MEMORY[0x1E0CB35C8];
                v195[0] = *MEMORY[0x1E0CB2D50];
                *(_QWORD *)v180 = CFSTR("semaphore wait timeout");
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v180, v195, 1);
                v86 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v85, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v86);
                v87 = (void *)objc_claimAutoreleasedReturnValue();

                if (v87)
                {
                  v88 = objc_retainAutorelease(v87);

                }
                else
                {
LABEL_43:
                  v88 = 0;
                }

                v89 = v88;
                v141 = v89;
                if (v89 || (v89 = (id)v174[5]) != 0)
                {
                  ((void (*)(void (**)(id, _QWORD), _QWORD, id))v5[2])(v5, 0, v89);
                  v7 = 0;
                }
                else
                {
                  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
                  v90 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v90, OS_LOG_TYPE_INFO))
                  {
                    v91 = (objc_class *)objc_opt_class();
                    NSStringFromClass(v91);
                    v92 = (id)objc_claimAutoreleasedReturnValue();
                    NSStringFromSelector(aSelector);
                    v93 = (id)objc_claimAutoreleasedReturnValue();
                    v94 = objc_msgSend(*(id *)(*(_QWORD *)&v188[8] + 40), "count");
                    *(_DWORD *)v180 = 138412802;
                    *(_QWORD *)&v180[4] = v92;
                    v181 = 2112;
                    v182 = v93;
                    v183 = 2048;
                    v184 = v94;
                    _os_log_impl(&dword_1D1A22000, v90, OS_LOG_TYPE_INFO, "%@, %@, receiver handles count, %lu", v180, 0x20u);

                  }
                  v152 = 0u;
                  v153 = 0u;
                  v150 = 0u;
                  v151 = 0u;
                  v138 = *(id *)(*(_QWORD *)&v188[8] + 40);
                  v95 = objc_msgSend(v138, "countByEnumeratingWithState:objects:count:", &v150, v187, 16);
                  if (v95)
                  {
                    v136 = 0;
                    v96 = *(_QWORD *)v151;
LABEL_58:
                    v97 = 0;
                    while (1)
                    {
                      if (*(_QWORD *)v151 != v96)
                        objc_enumerationMutation(v138);
                      v98 = *(void **)(*((_QWORD *)&v150 + 1) + 8 * v97);
                      v99 = (void *)MEMORY[0x1D8231EA8]();
                      v100 = (id *)(v174 + 5);
                      v149 = (id)v174[5];
                      v101 = -[SMSuggestionsManager _checkReceiverEligibilityForHandle:error:](self, "_checkReceiverEligibilityForHandle:error:", v98, &v149);
                      objc_storeStrong(v100, v149);
                      if (v174[5])
                      {
                        v5[2](v5, 0);
                        v102 = 0;
                        v103 = 1;
                      }
                      else if (v101)
                      {
                        v104 = v98;

                        v102 = 0;
                        v103 = 6;
                        v136 = v104;
                      }
                      else
                      {
                        v103 = 0;
                        v102 = 1;
                      }
                      objc_autoreleasePoolPop(v99);
                      if (!v102)
                        break;
                      if (v95 == ++v97)
                      {
                        v95 = objc_msgSend(v138, "countByEnumeratingWithState:objects:count:", &v150, v187, 16);
                        if (v95)
                          goto LABEL_58;
                        goto LABEL_74;
                      }
                    }

                    if (v103 != 6 && v103)
                    {
                      v7 = 0;
                      goto LABEL_86;
                    }
                  }
                  else
                  {
                    v136 = 0;
LABEL_74:

                  }
                  if (v136 && objc_msgSend((id)v164[5], "count"))
                  {
                    objc_msgSend((id)v164[5], "firstObject");
                    v105 = objc_claimAutoreleasedReturnValue();
                    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
                    v106 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v106, OS_LOG_TYPE_INFO))
                    {
                      v107 = (objc_class *)objc_opt_class();
                      NSStringFromClass(v107);
                      v108 = (id)objc_claimAutoreleasedReturnValue();
                      NSStringFromSelector(aSelector);
                      v109 = (id)objc_claimAutoreleasedReturnValue();
                      -[NSObject referenceLocation](v105, "referenceLocation");
                      v110 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)v180 = 138413058;
                      *(_QWORD *)&v180[4] = v108;
                      v181 = 2112;
                      v182 = v109;
                      v183 = 2112;
                      v184 = (uint64_t)v136;
                      v185 = 2112;
                      v186 = (uint64_t)v110;
                      _os_log_impl(&dword_1D1A22000, v106, OS_LOG_TYPE_INFO, "%@, %@, creating session config using handle, %@, destination location, %@", v180, 0x2Au);

                    }
                    v111 = objc_alloc(MEMORY[0x1E0C9E3B8]);
                    -[NSObject referenceLocation](v105, "referenceLocation");
                    v112 = (void *)objc_claimAutoreleasedReturnValue();
                    v113 = (void *)objc_msgSend(v111, "initWithRTLocation:", v112);

                    v114 = objc_alloc(MEMORY[0x1E0D8BA00]);
                    -[NSObject mapItem](v105, "mapItem");
                    v115 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v115, "geoMapItemHandle");
                    v116 = (void *)objc_claimAutoreleasedReturnValue();
                    v117 = (void *)objc_msgSend(v114, "initWithCLLocation:eta:radius:destinationType:destinationMapItem:", v113, 0, 0, v116, -1.0);

                    v118 = objc_alloc(MEMORY[0x1E0D8B918]);
                    v179 = v136;
                    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v179, 1);
                    v119 = (void *)objc_claimAutoreleasedReturnValue();
                    v120 = (void *)objc_msgSend(v118, "initWithReceiverHandles:identifier:displayName:", v119, 0, 0);

                    v121 = objc_alloc(MEMORY[0x1E0D8B9F0]);
                    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
                    v122 = (void *)objc_claimAutoreleasedReturnValue();
                    LOBYTE(v133) = objc_msgSend(MEMORY[0x1E0D8B958], "zelkovaHandoffEnabled");
                    v7 = objc_msgSend(v121, "initWithConversation:sessionID:sessionStartDate:sessionType:time:destination:userResponseSafeDate:sessionSupportsHandoff:sosReceivers:sessionWorkoutType:", v120, v122, 0, 2, 0, v117, 0, v133, v120, 0);

                  }
                  else
                  {
                    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
                    v105 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v105, OS_LOG_TYPE_INFO))
                    {
                      v123 = (objc_class *)objc_opt_class();
                      NSStringFromClass(v123);
                      v124 = (id)objc_claimAutoreleasedReturnValue();
                      NSStringFromSelector(aSelector);
                      v125 = (id)objc_claimAutoreleasedReturnValue();
                      v126 = objc_msgSend(*(id *)(*(_QWORD *)&v188[8] + 40), "count");
                      v127 = objc_msgSend((id)v164[5], "count");
                      *(_DWORD *)v180 = 138413058;
                      *(_QWORD *)&v180[4] = v124;
                      v181 = 2112;
                      v182 = v125;
                      v183 = 2048;
                      v184 = v126;
                      v185 = 2048;
                      v186 = v127;
                      _os_log_impl(&dword_1D1A22000, v105, OS_LOG_TYPE_INFO, "%@, %@, session config could not be created, likely handles count, %lu, likely destinations count, %lu", v180, 0x2Au);

                    }
                    v7 = 0;
                  }

                  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
                  v128 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v128, OS_LOG_TYPE_INFO))
                  {
                    v129 = (objc_class *)objc_opt_class();
                    NSStringFromClass(v129);
                    v130 = (id)objc_claimAutoreleasedReturnValue();
                    NSStringFromSelector(aSelector);
                    v131 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)v180 = 138412802;
                    *(_QWORD *)&v180[4] = v130;
                    v181 = 2112;
                    v182 = v131;
                    v183 = 2112;
                    v184 = (uint64_t)v7;
                    _os_log_impl(&dword_1D1A22000, v128, OS_LOG_TYPE_INFO, "%@, %@, suggested config, %@", v180, 0x20u);

                  }
                  ((void (*)(void (**)(id, _QWORD), NSObject *, _QWORD))v5[2])(v5, v7, 0);
LABEL_86:

                }
                _Block_object_dispose(v188, 8);

                v66 = v141;
              }

              _Block_object_dispose(&v163, 8);
              _Block_object_dispose(buf, 8);

            }
          }

        }
      }

    }
    _Block_object_dispose(&v173, 8);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[SMSuggestionsManager _fetchSuggestedSessionConfigurationWithHandler:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2896;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }

}

void __71__SMSuggestionsManager__fetchSuggestedSessionConfigurationWithHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v7;
  v18 = v7;

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v8;
  v14 = v8;

  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v9;
  v17 = v9;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __71__SMSuggestionsManager__fetchSuggestedSessionConfigurationWithHandler___block_invoke_164(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)fetchSuggestedCheckInURLForWorkoutSuggestionWithHandler:(id)a3
{
  void (**v4)(id, _QWORD, NSObject *);
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  _QWORD block[5];
  void (**v15)(id, _QWORD, NSObject *);
  uint64_t v16;
  void *v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD, NSObject *))a3;
  if (!v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[SMSuggestionsManager fetchSuggestedCheckInURLForWorkoutSuggestionWithHandler:]";
      v20 = 1024;
      v21 = 3116;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
    goto LABEL_9;
  }
  if ((objc_msgSend(MEMORY[0x1E0D8B958], "zelkovaWorkoutEnabled") & 1) == 0)
  {
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v8 = *MEMORY[0x1E0D8BB70];
    v16 = *MEMORY[0x1E0CB2D50];
    v9 = (void *)MEMORY[0x1E0CB3940];
    v10 = objc_msgSend(MEMORY[0x1E0D8B958], "zelkovaWorkoutEnabled");
    v11 = CFSTR("NO");
    if (v10)
      v11 = CFSTR("YES");
    objc_msgSend(v9, "stringWithFormat:", CFSTR("Feature not enabled, is ZelkovaWorkout enabled, %@"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, 13, v13);
    v6 = objc_claimAutoreleasedReturnValue();

    v4[2](v4, 0, v6);
LABEL_9:

    goto LABEL_10;
  }
  -[RTNotifier queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__SMSuggestionsManager_fetchSuggestedCheckInURLForWorkoutSuggestionWithHandler___block_invoke;
  block[3] = &unk_1E9297650;
  block[4] = self;
  v15 = v4;
  dispatch_async(v5, block);

LABEL_10:
}

uint64_t __80__SMSuggestionsManager_fetchSuggestedCheckInURLForWorkoutSuggestionWithHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchSuggestedCheckInURLForWorkoutSuggestionWithHandler:", *(_QWORD *)(a1 + 40));
}

- (void)_fetchSuggestedCheckInURLForWorkoutSuggestionWithHandler:(id)a3
{
  void (**v5)(id, _QWORD, void *);
  void *v6;
  void *v7;
  char v8;
  _BOOL4 v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  dispatch_semaphore_t v22;
  void *v23;
  NSObject *v24;
  void *v25;
  dispatch_time_t v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  objc_class *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  NSObject *dsema;
  _QWORD v74[5];
  id v75;
  id v76;
  void (**v77)(id, _QWORD, void *);
  uint64_t *v78;
  _QWORD v79[4];
  NSObject *v80;
  uint64_t *v81;
  uint64_t *v82;
  uint64_t v83;
  uint64_t *v84;
  uint64_t v85;
  uint64_t (*v86)(uint64_t, uint64_t);
  void (*v87)(uint64_t);
  id v88;
  uint64_t v89;
  uint64_t *v90;
  uint64_t v91;
  uint64_t (*v92)(uint64_t, uint64_t);
  void (*v93)(uint64_t);
  id v94;
  id v95;
  void *v96;
  uint64_t v97;
  void *v98;
  uint64_t v99;
  void *v100;
  uint64_t v101;
  const __CFString *v102;
  uint64_t v103;
  const __CFString *v104;
  uint64_t v105;
  uint8_t buf[16];
  uint64_t v107;

  v107 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, _QWORD, void *))a3;
  -[SMSuggestionsManager defaultsManager](self, "defaultsManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("RTDefaultsWorkoutOngoing"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  if ((v8 & 1) == 0)
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v103 = *MEMORY[0x1E0CB2D50];
    v104 = CFSTR("User not in an active workout, ineligible to generate suggestion URL");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v104, &v103, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D8BB70], 11, v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v5[2](v5, 0, v11);
    goto LABEL_18;
  }
  v95 = 0;
  v9 = -[SMSuggestionsManager _isUserInActiveSessionWithError:](self, "_isUserInActiveSessionWithError:", &v95);
  v10 = v95;
  if (!v10)
  {
    if (v9)
    {
      v14 = (void *)MEMORY[0x1E0CB35C8];
      v101 = *MEMORY[0x1E0CB2D50];
      v102 = CFSTR("User is already in an active session, ineligible to generate suggestion URL");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v102, &v101, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D8BB70], 11, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v5[2](v5, 0, v16);
LABEL_17:
      v11 = 0;
      goto LABEL_18;
    }
    v17 = objc_alloc(MEMORY[0x1E0D8BA98]);
    v18 = objc_alloc(MEMORY[0x1E0CB3588]);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dateByAddingTimeInterval:", -604800.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v18, "initWithStartDate:duration:", v20, 604800.0);
    v72 = (void *)objc_msgSend(v17, "initWithBatchSize:fetchLimit:offset:includeSuppressed:sortByCreationDate:ascending:dateInterval:filteredToSuggestionTriggers:filteredToSuggestionUserTypes:filteredToSessionTypes:", *MEMORY[0x1E0D8BD40], 1, *MEMORY[0x1E0D8BD40], 1, 1, 0, v21, &unk_1E932C8B0, &unk_1E932C8C8, 0);

    v89 = 0;
    v90 = &v89;
    v91 = 0x3032000000;
    v92 = __Block_byref_object_copy__102;
    v93 = __Block_byref_object_dispose__102;
    v94 = 0;
    v83 = 0;
    v84 = &v83;
    v85 = 0x3032000000;
    v86 = __Block_byref_object_copy__102;
    v87 = __Block_byref_object_dispose__102;
    v88 = 0;
    v22 = dispatch_semaphore_create(0);
    -[SMSuggestionsManager suggestionsStore](self, "suggestionsStore");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v79[0] = MEMORY[0x1E0C809B0];
    v79[1] = 3221225472;
    v79[2] = __81__SMSuggestionsManager__fetchSuggestedCheckInURLForWorkoutSuggestionWithHandler___block_invoke;
    v79[3] = &unk_1E9296EE0;
    v81 = &v89;
    v82 = &v83;
    v24 = v22;
    v80 = v24;
    objc_msgSend(v23, "fetchSuggestionsWithOptions:handler:", v72, v79);

    dsema = v24;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(dsema, v26))
      goto LABEL_12;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "timeIntervalSinceDate:", v25);
    v29 = v28;
    v30 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_607);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "filteredArrayUsingPredicate:", v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "firstObject");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v30, "submitToCoreAnalytics:type:duration:", v34, 1, v29);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D1A22000, v35, OS_LOG_TYPE_FAULT, "Invalid parameter not satisfying: authorizationManager", buf, 2u);
    }

    v36 = (void *)MEMORY[0x1E0CB35C8];
    v105 = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)buf = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v105, 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      v39 = objc_retainAutorelease(v38);

    }
    else
    {
LABEL_12:
      v39 = 0;
    }

    v40 = v39;
    v41 = v40;
    if (v40 || (v41 = (id)v84[5]) != 0)
    {
      v5[2](v5, 0, v41);
LABEL_16:

      _Block_object_dispose(&v83, 8);
      _Block_object_dispose(&v89, 8);

      goto LABEL_17;
    }
    objc_msgSend((id)v90[5], "firstObject");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v42, "isSuppressed")
      || objc_msgSend(v42, "suppressionReason") == 12
      || objc_msgSend(v42, "suppressionReason") == 11)
    {
      objc_msgSend(v42, "buddy");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "email");
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      if (v44)
      {
        v45 = objc_alloc(MEMORY[0x1E0D8B960]);
        objc_msgSend(v42, "buddy");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "email");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = objc_msgSend(v45, "initWithPrimaryHandle:secondaryHandles:", v47, MEMORY[0x1E0C9AA60]);
      }
      else
      {
        objc_msgSend(v42, "buddy");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "phoneNumber");
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v50)
        {
          v64 = (void *)MEMORY[0x1E0CB35C8];
          v97 = *MEMORY[0x1E0CB2D50];
          v65 = (void *)MEMORY[0x1E0CB3940];
          v66 = (objc_class *)objc_opt_class();
          NSStringFromClass(v66);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "buddy");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "stringWithFormat:", CFSTR("%@, %@, suggestion has invalid buddy contact information , %@"), v67, v68, v69);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          v98 = v70;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v98, &v97, 1);
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v71);
          v58 = (void *)objc_claimAutoreleasedReturnValue();

          v5[2](v5, 0, v58);
          goto LABEL_27;
        }
        v51 = objc_alloc(MEMORY[0x1E0D8B960]);
        objc_msgSend(v42, "buddy");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "phoneNumber");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = objc_msgSend(v51, "initWithPrimaryHandle:secondaryHandles:", v47, MEMORY[0x1E0C9AA60]);
      }
      v52 = (void *)v48;

      v53 = objc_alloc(MEMORY[0x1E0D8B918]);
      v96 = v52;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v96, 1);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = (void *)objc_msgSend(v53, "initWithReceiverHandles:identifier:displayName:", v54, 0, 0);

      -[SMSuggestionsManager healthKitManager](self, "healthKitManager");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v74[0] = MEMORY[0x1E0C809B0];
      v74[1] = 3221225472;
      v74[2] = __81__SMSuggestionsManager__fetchSuggestedCheckInURLForWorkoutSuggestionWithHandler___block_invoke_2;
      v74[3] = &unk_1E92A1510;
      v74[4] = self;
      v57 = v55;
      v75 = v57;
      v76 = v42;
      v78 = &v83;
      v77 = v5;
      objc_msgSend(v56, "fetchMostRecentWorkoutActivityTypeWithHandler:", v74);

      v58 = 0;
    }
    else
    {
      v59 = (void *)MEMORY[0x1E0CB35C8];
      v99 = *MEMORY[0x1E0CB2D50];
      v60 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0D8BA90], "stringFromSMSuggestionSuppressionReason:", objc_msgSend(v42, "suppressionReason"));
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "stringWithFormat:", CFSTR("Suggestion is not eligible to be shown due to %@"), v61);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v100 = v62;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v100, &v99, 1);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D8BB70], 1, v63);
      v58 = (void *)objc_claimAutoreleasedReturnValue();

      v5[2](v5, 0, v58);
    }
LABEL_27:

    goto LABEL_16;
  }
  v11 = v10;
  v5[2](v5, 0, v10);
LABEL_18:

}

void __81__SMSuggestionsManager__fetchSuggestedCheckInURLForWorkoutSuggestionWithHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __81__SMSuggestionsManager__fetchSuggestedCheckInURLForWorkoutSuggestionWithHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  id v5;
  uint64_t v6;
  id v7;
  __int128 v8;
  _QWORD block[4];
  id v10;
  id v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__SMSuggestionsManager__fetchSuggestedCheckInURLForWorkoutSuggestionWithHandler___block_invoke_3;
  block[3] = &unk_1E9298690;
  v10 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  v14 = a2;
  v6 = *(_QWORD *)(a1 + 32);
  v11 = v5;
  v12 = v6;
  v8 = *(_OWORD *)(a1 + 56);
  v7 = (id)v8;
  v13 = v8;
  dispatch_async(v4, block);

}

void __81__SMSuggestionsManager__fetchSuggestedCheckInURLForWorkoutSuggestionWithHandler___block_invoke_3(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id obj;

  v2 = objc_alloc(MEMORY[0x1E0D8B9F0]);
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "dateInterval");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v11) = 0;
  v7 = (void *)objc_msgSend(v2, "initWithConversation:sessionID:sessionStartDate:sessionType:time:destination:userResponseSafeDate:sessionSupportsHandoff:sosReceivers:sessionWorkoutType:", v3, v4, v6, 4, 0, 0, 0, v11, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 72));

  v8 = *(void **)(a1 + 48);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  obj = *(id *)(v9 + 40);
  objc_msgSend(v8, "_getMessagesURLFromSessionConfig:payloadType:error:", v7, 3, &obj);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v9 + 40), obj);
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

- (void)launchSessionInitiationUIWithConfiguration:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD);
  BOOL v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  _QWORD v13[5];
  id v14;
  void (**v15)(_QWORD, _QWORD);
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void (**)(_QWORD, _QWORD))v7;
  if (v6)
  {
    if (v7)
    {
LABEL_3:
      v16 = 0;
      v9 = -[SMSuggestionsManager isZelkovaSuggestionsFeatureEnabledWithError:](self, "isZelkovaSuggestionsFeatureEnabledWithError:", &v16);
      v10 = v16;
      if (v9)
      {
        -[RTNotifier queue](self, "queue");
        v11 = objc_claimAutoreleasedReturnValue();
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __75__SMSuggestionsManager_launchSessionInitiationUIWithConfiguration_handler___block_invoke;
        v13[3] = &unk_1E9296F70;
        v13[4] = self;
        v14 = v6;
        v15 = v8;
        dispatch_async(v11, v13);

      }
      else
      {
        ((void (**)(_QWORD, NSObject *))v8)[2](v8, v10);
      }
      goto LABEL_11;
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[SMSuggestionsManager launchSessionInitiationUIWithConfiguration:handler:]";
      v19 = 1024;
      v20 = 3276;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: configuration (in %s:%d)", buf, 0x12u);
    }

    if (v8)
      goto LABEL_3;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[SMSuggestionsManager launchSessionInitiationUIWithConfiguration:handler:]";
    v19 = 1024;
    v20 = 3277;
    _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
  }
LABEL_11:

}

uint64_t __75__SMSuggestionsManager_launchSessionInitiationUIWithConfiguration_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_launchSessionInitiationUIWithConfiguration:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_launchSessionInitiationUIWithConfiguration:(id)a3 handler:(id)a4
{
  id v7;
  void (**v8)(id, id);
  NSObject *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  dispatch_time_t v21;
  double v22;
  double v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  NSObject *v36;
  objc_class *v37;
  void *v38;
  void *v39;
  const char *aSelector;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  _QWORD v47[4];
  NSObject *v48;
  id v49;
  _BYTE buf[12];
  __int16 v51;
  void *v52;
  __int16 v53;
  id v54;
  _QWORD v55[3];

  v55[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, id))a4;
  if (v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v11;
      v51 = 2112;
      v52 = v12;
      v53 = 2112;
      v54 = v7;
      _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "%@, %@, launching message extension with configuration, %@", buf, 0x20u);

    }
    v13 = dispatch_semaphore_create(0);
    v49 = 0;
    -[SMSuggestionsManager _getMessagesURLFromSessionConfig:payloadType:error:](self, "_getMessagesURLFromSessionConfig:payloadType:error:", v7, 2, &v49);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v49;
    if (v15)
    {
      v8[2](v8, v15);
    }
    else
    {
      aSelector = a2;
      objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "operationToOpenResource:usingApplication:userInfo:", v14, *MEMORY[0x1E0D8BC28], 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v47[0] = MEMORY[0x1E0C809B0];
      v47[1] = 3221225472;
      v47[2] = __76__SMSuggestionsManager__launchSessionInitiationUIWithConfiguration_handler___block_invoke;
      v47[3] = &unk_1E92977B8;
      v18 = v13;
      v48 = v18;
      objc_msgSend(v17, "setCompletionBlock:", v47);
      objc_msgSend(v17, "start");
      v19 = v18;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = dispatch_time(0, 3600000000000);
      v46 = (void *)v20;
      if (dispatch_semaphore_wait(v19, v21))
      {
        v44 = v19;
        v45 = v17;
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "timeIntervalSinceDate:", v20);
        v23 = v22;
        v24 = (void *)objc_opt_new();
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_607);
        v25 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = (void *)v25;
        objc_msgSend(v26, "filteredArrayUsingPredicate:", v25);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "firstObject");
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        v42 = v24;
        objc_msgSend(v24, "submitToCoreAnalytics:type:duration:", v28, 1, v23);
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_FAULT, "Invalid parameter not satisfying: authorizationManager", buf, 2u);
        }

        v30 = (void *)MEMORY[0x1E0CB35C8];
        v31 = *MEMORY[0x1E0D18598];
        v55[0] = *MEMORY[0x1E0CB2D50];
        *(_QWORD *)buf = CFSTR("semaphore wait timeout");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v55, 1);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "errorWithDomain:code:userInfo:", v31, 15, v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        if (v33)
        {
          v34 = objc_retainAutorelease(v33);

        }
        else
        {
          v34 = 0;
        }
        v19 = v44;
        v17 = v45;
      }
      else
      {
        v34 = 0;
      }

      v35 = v34;
      if (v35)
      {
        v8[2](v8, v35);
      }
      else
      {
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          v37 = (objc_class *)objc_opt_class();
          NSStringFromClass(v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(aSelector);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v38;
          v51 = 2112;
          v52 = v39;
          _os_log_impl(&dword_1D1A22000, v36, OS_LOG_TYPE_INFO, "%@, %@, message extension launched", buf, 0x16u);

        }
        v8[2](v8, 0);
      }

    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[SMSuggestionsManager _launchSessionInitiationUIWithConfiguration:handler:]";
      v51 = 1024;
      LODWORD(v52) = 3299;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }

}

intptr_t __76__SMSuggestionsManager__launchSessionInitiationUIWithConfiguration_handler___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)fetchShouldShowProactiveSuggestionsWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[RTNotifier queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__SMSuggestionsManager_fetchShouldShowProactiveSuggestionsWithHandler___block_invoke;
  v7[3] = &unk_1E9297650;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __71__SMSuggestionsManager_fetchShouldShowProactiveSuggestionsWithHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_shouldShowProactiveSuggestions");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (BOOL)_shouldShowProactiveSuggestions
{
  NSObject *v4;
  const char *v5;
  uint8_t *v6;
  __int16 v7;
  __int16 v8;

  if ((objc_msgSend(MEMORY[0x1E0D8B9B0], "isLockScreenSuggestionsAllowed") & 1) != 0)
  {
    if (-[SMSuggestionsManager routineEnabled](self, "routineEnabled"))
      return 1;
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v7 = 0;
      v5 = "Significant Locations disabled, not showing proactive suggestions";
      v6 = (uint8_t *)&v7;
      goto LABEL_8;
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v8 = 0;
      v5 = "LockScreenSuggestions disabled, not showing proactive suggestions";
      v6 = (uint8_t *)&v8;
LABEL_8:
      _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, v5, v6, 2u);
    }
  }

  return 0;
}

- (void)showSuggestionsDetectionUIWithSuggestion:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  NSObject *v9;
  _QWORD block[5];
  id v11;
  id v12;
  uint64_t *v13;
  id obj;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__102;
    v19 = __Block_byref_object_dispose__102;
    v20 = 0;
    obj = 0;
    v8 = -[SMSuggestionsManager isZelkovaSuggestionsFeatureEnabledWithError:](self, "isZelkovaSuggestionsFeatureEnabledWithError:", &obj);
    objc_storeStrong(&v20, obj);
    if (v8)
    {
      -[RTNotifier queue](self, "queue");
      v9 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __73__SMSuggestionsManager_showSuggestionsDetectionUIWithSuggestion_handler___block_invoke;
      block[3] = &unk_1E92A0DE0;
      block[4] = self;
      v11 = v6;
      v13 = &v15;
      v12 = v7;
      dispatch_async(v9, block);

    }
    else
    {
      (*((void (**)(id, _QWORD, uint64_t))v7 + 2))(v7, 0, v16[5]);
    }
    _Block_object_dispose(&v15, 8);

  }
}

uint64_t __73__SMSuggestionsManager_showSuggestionsDetectionUIWithSuggestion_handler___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v2, "_showSuggestionsDetectionUIWithSuggestion:error:", v3, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

- (void)shouldShowKeyboardSuggestionsForInitiator:(id)a3 receiver:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  BOOL v14;
  id v15;
  NSObject *v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v23 = "-[SMSuggestionsManager shouldShowKeyboardSuggestionsForInitiator:receiver:handler:]";
      v24 = 1024;
      v25 = 3404;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: initiator (in %s:%d)", buf, 0x12u);
    }

    if (v9)
    {
LABEL_3:
      if (v10)
        goto LABEL_14;
      goto LABEL_11;
    }
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v23 = "-[SMSuggestionsManager shouldShowKeyboardSuggestionsForInitiator:receiver:handler:]";
    v24 = 1024;
    v25 = 3405;
    _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: receiver (in %s:%d)", buf, 0x12u);
  }

  if (!v10)
  {
LABEL_11:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v23 = "-[SMSuggestionsManager shouldShowKeyboardSuggestionsForInitiator:receiver:handler:]";
      v24 = 1024;
      v25 = 3406;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
LABEL_14:
  v21 = 0;
  v14 = -[SMSuggestionsManager isZelkovaSuggestionsFeatureEnabledWithError:](self, "isZelkovaSuggestionsFeatureEnabledWithError:", &v21);
  v15 = v21;
  if (v14)
  {
    -[RTNotifier queue](self, "queue");
    v16 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __83__SMSuggestionsManager_shouldShowKeyboardSuggestionsForInitiator_receiver_handler___block_invoke;
    block[3] = &unk_1E9297EB8;
    block[4] = self;
    v18 = v8;
    v19 = v9;
    v20 = v10;
    dispatch_async(v16, block);

  }
  else
  {
    (*((void (**)(id, _QWORD, id))v10 + 2))(v10, 0, v15);
  }

}

uint64_t __83__SMSuggestionsManager_shouldShowKeyboardSuggestionsForInitiator_receiver_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_shouldShowKeyboardSuggestionsForInitiator:receiver:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_shouldShowKeyboardSuggestionsForInitiator:(id)a3 receiver:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  NSObject *v11;
  NSObject *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  _BOOL4 v16;
  BOOL v17;
  id *v18;
  BOOL v19;
  BOOL v20;
  id *v21;
  BOOL v22;
  _BOOL4 v23;
  int v24;
  NSObject *v25;
  objc_class *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  dispatch_semaphore_t v36;
  void *v37;
  NSObject *v38;
  dispatch_time_t v39;
  void *v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  id v54;
  NSObject *v55;
  objc_class *v56;
  id v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  NSObject *v63;
  objc_class *v64;
  id v65;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  objc_class *v75;
  id v76;
  void *v77;
  uint64_t v78;
  NSObject *v79;
  uint64_t v80;
  uint64_t v81;
  NSObject *log;
  void *context;
  void *contexta;
  NSObject *dsema;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  _QWORD v91[4];
  NSObject *v92;
  _BYTE *v93;
  _BYTE *v94;
  id v95;
  id v96;
  id obj;
  _BYTE v98[12];
  __int16 v99;
  id v100;
  __int16 v101;
  uint64_t v102;
  __int16 v103;
  void *v104;
  uint8_t v105[128];
  _BYTE buf[24];
  uint64_t (*v107)(uint64_t, uint64_t);
  void (*v108)(uint64_t);
  id v109;
  _BYTE v110[24];
  uint64_t (*v111)(uint64_t, uint64_t);
  void (*v112)(uint64_t);
  id v113;
  uint64_t v114;
  const __CFString *v115;
  uint64_t v116;
  const __CFString *v117;
  _QWORD v118[4];

  v118[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, void *))a5;
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v110 = 136315394;
      *(_QWORD *)&v110[4] = "-[SMSuggestionsManager _shouldShowKeyboardSuggestionsForInitiator:receiver:handler:]";
      *(_WORD *)&v110[12] = 1024;
      *(_DWORD *)&v110[14] = 3426;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: initiator (in %s:%d)", v110, 0x12u);
    }

  }
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v110 = 136315394;
      *(_QWORD *)&v110[4] = "-[SMSuggestionsManager _shouldShowKeyboardSuggestionsForInitiator:receiver:handler:]";
      *(_WORD *)&v110[12] = 1024;
      *(_DWORD *)&v110[14] = 3427;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: receiver (in %s:%d)", v110, 0x12u);
    }

  }
  if (v10)
  {
    if (!v8
      || (objc_msgSend(v8, "primaryHandle"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          v14 = v13 == 0,
          v13,
          v14))
    {
      v29 = (void *)MEMORY[0x1E0CB35C8];
      v116 = *MEMORY[0x1E0CB2D50];
      v117 = CFSTR("initiator handle is required");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v117, &v116, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v10[2](v10, 0, v31);

    }
    else if (!v9
           || (objc_msgSend(v9, "primaryHandle"),
               v15 = (void *)objc_claimAutoreleasedReturnValue(),
               v16 = v15 == 0,
               v15,
               v16))
    {
      v33 = (void *)MEMORY[0x1E0CB35C8];
      v114 = *MEMORY[0x1E0CB2D50];
      v115 = CFSTR("receiver handle is required");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v115, &v114, 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v10[2](v10, 0, v35);

    }
    else
    {
      *(_QWORD *)v110 = 0;
      *(_QWORD *)&v110[8] = v110;
      *(_QWORD *)&v110[16] = 0x3032000000;
      v111 = __Block_byref_object_copy__102;
      v112 = __Block_byref_object_dispose__102;
      v113 = 0;
      obj = 0;
      v17 = -[SMSuggestionsManager _checkInitiatorEligibilityWithError:](self, "_checkInitiatorEligibilityWithError:", &obj);
      objc_storeStrong(&v113, obj);
      v18 = (id *)(*(_QWORD *)&v110[8] + 40);
      if (*(_QWORD *)(*(_QWORD *)&v110[8] + 40))
        v19 = 0;
      else
        v19 = v17;
      if (v19)
      {
        v96 = 0;
        v20 = -[SMSuggestionsManager _checkReceiverEligibilityForHandle:error:](self, "_checkReceiverEligibilityForHandle:error:", v9, &v96);
        objc_storeStrong(v18, v96);
        v21 = (id *)(*(_QWORD *)&v110[8] + 40);
        if (*(_QWORD *)(*(_QWORD *)&v110[8] + 40))
          v22 = 0;
        else
          v22 = v20;
        if (v22)
        {
          v95 = 0;
          v23 = -[SMSuggestionsManager _isUserInActiveSessionWithError:](self, "_isUserInActiveSessionWithError:", &v95);
          objc_storeStrong(v21, v95);
          if (*(_QWORD *)(*(_QWORD *)&v110[8] + 40))
            v24 = 1;
          else
            v24 = v23;
          if (v24 == 1)
          {
            _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              v26 = (objc_class *)objc_opt_class();
              NSStringFromClass(v26);
              v27 = (id)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)&buf[4] = v27;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v28;
              _os_log_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_INFO, "%@, %@, user is in active session", buf, 0x16u);

            }
            v10[2](v10, 0, *(void **)(*(_QWORD *)&v110[8] + 40));
          }
          else
          {
            *(_QWORD *)buf = 0;
            *(_QWORD *)&buf[8] = buf;
            *(_QWORD *)&buf[16] = 0x3032000000;
            v107 = __Block_byref_object_copy__102;
            v108 = __Block_byref_object_dispose__102;
            v109 = 0;
            v36 = dispatch_semaphore_create(0);
            -[SMSuggestionsManager suggestionsHelper](self, "suggestionsHelper");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v91[0] = MEMORY[0x1E0C809B0];
            v91[1] = 3221225472;
            v91[2] = __84__SMSuggestionsManager__shouldShowKeyboardSuggestionsForInitiator_receiver_handler___block_invoke;
            v91[3] = &unk_1E9296EE0;
            v93 = buf;
            v94 = v110;
            v38 = v36;
            v92 = v38;
            objc_msgSend(v37, "fetchMostLikelyReceiverHandlesWithHandler:", v91);

            dsema = v38;
            objc_msgSend(MEMORY[0x1E0C99D68], "now");
            context = (void *)objc_claimAutoreleasedReturnValue();
            v39 = dispatch_time(0, 3600000000000);
            if (!dispatch_semaphore_wait(dsema, v39))
              goto LABEL_41;
            objc_msgSend(MEMORY[0x1E0C99D68], "now");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "timeIntervalSinceDate:", context);
            v42 = v41;
            v43 = (void *)objc_opt_new();
            objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_607);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "filteredArrayUsingPredicate:", v44);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "firstObject");
            v47 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v43, "submitToCoreAnalytics:type:duration:", v47, 1, v42);
            _rt_log_facility_get_os_log(RTLogFacilityGeneral);
            v48 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)v98 = 0;
              _os_log_fault_impl(&dword_1D1A22000, v48, OS_LOG_TYPE_FAULT, "Invalid parameter not satisfying: authorizationManager", v98, 2u);
            }

            v49 = (void *)MEMORY[0x1E0CB35C8];
            v118[0] = *MEMORY[0x1E0CB2D50];
            *(_QWORD *)v98 = CFSTR("semaphore wait timeout");
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v98, v118, 1);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v50);
            v51 = (void *)objc_claimAutoreleasedReturnValue();

            if (v51)
            {
              v52 = objc_retainAutorelease(v51);

            }
            else
            {
LABEL_41:
              v52 = 0;
            }

            v53 = v52;
            v54 = v53;
            if (v53 || (v54 = *(id *)(*(_QWORD *)&v110[8] + 40)) != 0)
            {
              v10[2](v10, 0, v54);
            }
            else
            {
              _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
              v55 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
              {
                v56 = (objc_class *)objc_opt_class();
                NSStringFromClass(v56);
                v57 = (id)objc_claimAutoreleasedReturnValue();
                NSStringFromSelector(a2);
                v58 = (id)objc_claimAutoreleasedReturnValue();
                v59 = objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "count");
                *(_DWORD *)v98 = 138412802;
                *(_QWORD *)&v98[4] = v57;
                v99 = 2112;
                v100 = v58;
                v101 = 2048;
                v102 = v59;
                _os_log_impl(&dword_1D1A22000, v55, OS_LOG_TYPE_INFO, "%@, %@, likelyReceivers count, %lu", v98, 0x20u);

              }
              v89 = 0u;
              v90 = 0u;
              v87 = 0u;
              v88 = 0u;
              v79 = *(id *)(*(_QWORD *)&buf[8] + 40);
              v60 = -[NSObject countByEnumeratingWithState:objects:count:](v79, "countByEnumeratingWithState:objects:count:", &v87, v105, 16);
              if (v60)
              {
                v81 = *(_QWORD *)v88;
                while (2)
                {
                  v61 = 0;
                  v80 = v60;
                  do
                  {
                    if (*(_QWORD *)v88 != v81)
                      objc_enumerationMutation(v79);
                    v62 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * v61);
                    contexta = (void *)MEMORY[0x1D8231EA8]();
                    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
                    v63 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
                    {
                      log = v63;
                      v64 = (objc_class *)objc_opt_class();
                      NSStringFromClass(v64);
                      v65 = (id)objc_claimAutoreleasedReturnValue();
                      NSStringFromSelector(a2);
                      v66 = (id)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v62, "primaryHandle");
                      v67 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v9, "primaryHandle");
                      v68 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)v98 = 138413058;
                      *(_QWORD *)&v98[4] = v65;
                      v99 = 2112;
                      v100 = v66;
                      v101 = 2112;
                      v102 = (uint64_t)v67;
                      v103 = 2112;
                      v104 = v68;
                      _os_log_impl(&dword_1D1A22000, log, OS_LOG_TYPE_INFO, "%@, %@, likelyReceiver.primaryHandle, %@, receiver.primaryHandle, %@", v98, 0x2Au);

                      v63 = log;
                    }

                    v69 = (void *)MEMORY[0x1E0D397A8];
                    objc_msgSend(v62, "primaryHandle");
                    v70 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v69, "validateAndCleanupID:", v70);
                    v71 = (void *)objc_claimAutoreleasedReturnValue();
                    v72 = (void *)MEMORY[0x1E0D397A8];
                    objc_msgSend(v9, "primaryHandle");
                    v73 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v72, "validateAndCleanupID:", v73);
                    v74 = (void *)objc_claimAutoreleasedReturnValue();
                    LOBYTE(v72) = objc_msgSend(v71, "isEqualToString:", v74);

                    objc_autoreleasePoolPop(contexta);
                    if ((v72 & 1) != 0)
                    {
                      v78 = 1;
                      goto LABEL_64;
                    }
                    ++v61;
                  }
                  while (v80 != v61);
                  v60 = -[NSObject countByEnumeratingWithState:objects:count:](v79, "countByEnumeratingWithState:objects:count:", &v87, v105, 16);
                  if (v60)
                    continue;
                  break;
                }
              }

              _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
              v79 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
              {
                v75 = (objc_class *)objc_opt_class();
                NSStringFromClass(v75);
                v76 = (id)objc_claimAutoreleasedReturnValue();
                NSStringFromSelector(a2);
                v77 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)v98 = 138412546;
                *(_QWORD *)&v98[4] = v76;
                v99 = 2112;
                v100 = v77;
                _os_log_impl(&dword_1D1A22000, v79, OS_LOG_TYPE_INFO, "%@, %@, receiver is not a likely receiver", v98, 0x16u);

              }
              v78 = 0;
LABEL_64:

              v10[2](v10, v78, 0);
              v53 = 0;
            }

            _Block_object_dispose(buf, 8);
          }
        }
        else
        {
          ((void (*)(void (**)(id, _QWORD, void *), _QWORD))v10[2])(v10, 0);
        }
      }
      else
      {
        ((void (*)(void (**)(id, _QWORD, void *), _QWORD))v10[2])(v10, 0);
      }
      _Block_object_dispose(v110, 8);

    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v110 = 136315394;
      *(_QWORD *)&v110[4] = "-[SMSuggestionsManager _shouldShowKeyboardSuggestionsForInitiator:receiver:handler:]";
      *(_WORD *)&v110[12] = 1024;
      *(_DWORD *)&v110[14] = 3428;
      _os_log_error_impl(&dword_1D1A22000, v32, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", v110, 0x12u);
    }

  }
}

void __84__SMSuggestionsManager__shouldShowKeyboardSuggestionsForInitiator_receiver_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)shouldShowTipKitSuggestionsForInitiator:(id)a3 receiver:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  BOOL v14;
  id v15;
  NSObject *v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v23 = "-[SMSuggestionsManager shouldShowTipKitSuggestionsForInitiator:receiver:handler:]";
      v24 = 1024;
      v25 = 3539;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: initiator (in %s:%d)", buf, 0x12u);
    }

    if (v9)
    {
LABEL_3:
      if (v10)
        goto LABEL_14;
      goto LABEL_11;
    }
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v23 = "-[SMSuggestionsManager shouldShowTipKitSuggestionsForInitiator:receiver:handler:]";
    v24 = 1024;
    v25 = 3540;
    _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: receiver (in %s:%d)", buf, 0x12u);
  }

  if (!v10)
  {
LABEL_11:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v23 = "-[SMSuggestionsManager shouldShowTipKitSuggestionsForInitiator:receiver:handler:]";
      v24 = 1024;
      v25 = 3541;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
LABEL_14:
  v21 = 0;
  v14 = -[SMSuggestionsManager isZelkovaSuggestionsFeatureEnabledWithError:](self, "isZelkovaSuggestionsFeatureEnabledWithError:", &v21);
  v15 = v21;
  if (v14)
  {
    -[RTNotifier queue](self, "queue");
    v16 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __81__SMSuggestionsManager_shouldShowTipKitSuggestionsForInitiator_receiver_handler___block_invoke;
    block[3] = &unk_1E9297EB8;
    block[4] = self;
    v18 = v8;
    v19 = v9;
    v20 = v10;
    dispatch_async(v16, block);

  }
  else
  {
    (*((void (**)(id, _QWORD, id))v10 + 2))(v10, 0, v15);
  }

}

uint64_t __81__SMSuggestionsManager_shouldShowTipKitSuggestionsForInitiator_receiver_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_shouldShowTipKitSuggestionsForInitiator:receiver:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_shouldShowTipKitSuggestionsForInitiator:(id)a3 receiver:(id)a4 handler:(id)a5
{
  id v7;
  id v8;
  void (**v9)(id, _QWORD, void *);
  NSObject *v10;
  NSObject *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  _BOOL4 v15;
  BOOL v16;
  id *v17;
  BOOL v18;
  BOOL v19;
  BOOL v20;
  dispatch_semaphore_t v21;
  void *v22;
  NSObject *v23;
  void *v24;
  dispatch_time_t v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  NSObject *v47;
  objc_class *v48;
  id v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  NSObject *v55;
  objc_class *v56;
  id v57;
  char *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  char v67;
  NSObject *v68;
  objc_class *v69;
  id v70;
  char *v71;
  id *v72;
  void *v73;
  void *v74;
  id *v75;
  void *v76;
  void *v77;
  id *v78;
  void *v79;
  NSObject *v80;
  objc_class *v81;
  id v82;
  id v83;
  void *v84;
  void *v85;
  id *v86;
  void *v87;
  void *v88;
  void *v89;
  id *v90;
  double v91;
  double v92;
  id *v93;
  _BOOL8 v94;
  NSObject *v95;
  objc_class *v96;
  id v97;
  char *v98;
  objc_class *v99;
  objc_class *v100;
  id v101;
  char *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  uint64_t v108;
  NSObject *v109;
  objc_class *v110;
  id v111;
  char *v112;
  id v113;
  __CFString *v114;
  uint64_t v115;
  void *v116;
  id v117;
  os_log_t log;
  os_log_t logb;
  NSObject *loga;
  void *context;
  void *contexta;
  id contextc;
  void *contextb;
  NSObject *dsema;
  char *aSelectorb;
  char *aSelectora;
  char *v130;
  id v131;
  id v132;
  id v133;
  id v134;
  id v135;
  id v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  _QWORD v141[4];
  NSObject *v142;
  uint64_t *v143;
  uint64_t *v144;
  uint64_t v145;
  uint64_t *v146;
  uint64_t v147;
  uint64_t (*v148)(uint64_t, uint64_t);
  void (*v149)(uint64_t);
  id v150;
  id v151;
  id obj;
  uint64_t v153;
  uint64_t *v154;
  uint64_t v155;
  uint64_t (*v156)(uint64_t, uint64_t);
  void (*v157)(uint64_t);
  id v158;
  _BYTE buf[12];
  __int16 v160;
  char *v161;
  __int16 v162;
  uint64_t v163;
  __int16 v164;
  id v165;
  __int16 v166;
  void *v167;
  __int16 v168;
  uint64_t v169;
  _BYTE v170[128];
  uint64_t v171;
  const __CFString *v172;
  uint64_t v173;
  const __CFString *v174;
  _QWORD v175[4];

  v175[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void (**)(id, _QWORD, void *))a5;
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[SMSuggestionsManager _shouldShowTipKitSuggestionsForInitiator:receiver:handler:]";
      v160 = 1024;
      LODWORD(v161) = 3561;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: initiator (in %s:%d)", buf, 0x12u);
    }

  }
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[SMSuggestionsManager _shouldShowTipKitSuggestionsForInitiator:receiver:handler:]";
      v160 = 1024;
      LODWORD(v161) = 3562;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: receiver (in %s:%d)", buf, 0x12u);
    }

  }
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[SMSuggestionsManager _shouldShowTipKitSuggestionsForInitiator:receiver:handler:]";
      v160 = 1024;
      LODWORD(v161) = 3563;
      _os_log_error_impl(&dword_1D1A22000, v41, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

    goto LABEL_40;
  }
  if (!v7
    || (objc_msgSend(v7, "primaryHandle"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = v12 == 0,
        v12,
        v13))
  {
    v38 = (void *)MEMORY[0x1E0CB35C8];
    v173 = *MEMORY[0x1E0CB2D50];
    v174 = CFSTR("initiator handle is required");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v174, &v173, 1);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, 0, v40);

    goto LABEL_40;
  }
  if (!v8
    || (objc_msgSend(v8, "primaryHandle"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = v14 == 0,
        v14,
        v15))
  {
    v42 = (void *)MEMORY[0x1E0CB35C8];
    v171 = *MEMORY[0x1E0CB2D50];
    v172 = CFSTR("receiver handle is required");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v172, &v171, 1);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, 0, v44);

    goto LABEL_40;
  }
  v153 = 0;
  v154 = &v153;
  v155 = 0x3032000000;
  v156 = __Block_byref_object_copy__102;
  v157 = __Block_byref_object_dispose__102;
  v158 = 0;
  obj = 0;
  v16 = -[SMSuggestionsManager _checkInitiatorEligibilityWithError:](self, "_checkInitiatorEligibilityWithError:", &obj);
  objc_storeStrong(&v158, obj);
  v17 = (id *)(v154 + 5);
  if (v154[5])
    v18 = 0;
  else
    v18 = v16;
  if (!v18)
  {
    ((void (*)(void (**)(id, _QWORD, void *), _QWORD))v9[2])(v9, 0);
    goto LABEL_39;
  }
  v151 = 0;
  v19 = -[SMSuggestionsManager _checkReceiverEligibilityForHandle:error:](self, "_checkReceiverEligibilityForHandle:error:", v8, &v151);
  objc_storeStrong(v17, v151);
  if (v154[5])
    v20 = 0;
  else
    v20 = v19;
  if (!v20)
  {
    ((void (*)(void (**)(id, _QWORD, void *), _QWORD))v9[2])(v9, 0);
    goto LABEL_39;
  }
  v145 = 0;
  v146 = &v145;
  v147 = 0x3032000000;
  v148 = __Block_byref_object_copy__102;
  v149 = __Block_byref_object_dispose__102;
  v150 = 0;
  v21 = dispatch_semaphore_create(0);
  -[SMSuggestionsManager suggestionsHelper](self, "suggestionsHelper");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v141[0] = MEMORY[0x1E0C809B0];
  v141[1] = 3221225472;
  v141[2] = __82__SMSuggestionsManager__shouldShowTipKitSuggestionsForInitiator_receiver_handler___block_invoke;
  v141[3] = &unk_1E9296EE0;
  v143 = &v145;
  v144 = &v153;
  v23 = v21;
  v142 = v23;
  objc_msgSend(v22, "fetchMostLikelyReceiverHandlesWithHandler:", v141);

  dsema = v23;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(dsema, v25))
    goto LABEL_34;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  context = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(context, "timeIntervalSinceDate:", v24);
  v27 = v26;
  v28 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_607);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "filteredArrayUsingPredicate:", v29);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "firstObject");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v28, "submitToCoreAnalytics:type:duration:", v32, 1, v27);
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D1A22000, v33, OS_LOG_TYPE_FAULT, "Invalid parameter not satisfying: authorizationManager", buf, 2u);
  }

  v34 = (void *)MEMORY[0x1E0CB35C8];
  v175[0] = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)buf = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v175, 1);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    v37 = objc_retainAutorelease(v36);

  }
  else
  {
LABEL_34:
    v37 = 0;
  }

  v45 = v37;
  v46 = v45;
  if (v45 || (v46 = (id)v154[5]) != 0)
  {
LABEL_37:
    v9[2](v9, 0, v46);
    goto LABEL_38;
  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v47 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
  {
    v48 = (objc_class *)objc_opt_class();
    NSStringFromClass(v48);
    v49 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v50 = (char *)(id)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend((id)v146[5], "count");
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v49;
    v160 = 2112;
    v161 = v50;
    v162 = 2048;
    v163 = v51;
    _os_log_impl(&dword_1D1A22000, v47, OS_LOG_TYPE_INFO, "%@, %@, likelyReceivers count, %lu", buf, 0x20u);

  }
  v139 = 0u;
  v140 = 0u;
  v137 = 0u;
  v138 = 0u;
  v113 = (id)v146[5];
  v52 = objc_msgSend(v113, "countByEnumeratingWithState:objects:count:", &v137, v170, 16);
  if (!v52)
    goto LABEL_53;
  log = *(os_log_t *)v138;
  while (2)
  {
    v53 = 0;
    v115 = v52;
    do
    {
      if (*(os_log_t *)v138 != log)
        objc_enumerationMutation(v113);
      v54 = *(void **)(*((_QWORD *)&v137 + 1) + 8 * v53);
      contexta = (void *)MEMORY[0x1D8231EA8]();
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
      {
        v56 = (objc_class *)objc_opt_class();
        NSStringFromClass(v56);
        v57 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v58 = (char *)(id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "primaryHandle");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "primaryHandle");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        *(_QWORD *)&buf[4] = v57;
        v160 = 2112;
        v161 = v58;
        v162 = 2112;
        v163 = (uint64_t)v59;
        v164 = 2112;
        v165 = v60;
        _os_log_impl(&dword_1D1A22000, v55, OS_LOG_TYPE_INFO, "%@, %@, likelyReceiver.primaryHandle, %@, receiver.primaryHandle, %@", buf, 0x2Au);

      }
      v61 = (void *)MEMORY[0x1E0D397A8];
      objc_msgSend(v54, "primaryHandle");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "validateAndCleanupID:", v62);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = (void *)MEMORY[0x1E0D397A8];
      objc_msgSend(v8, "primaryHandle");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "validateAndCleanupID:", v65);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = objc_msgSend(v63, "isEqualToString:", v66);

      objc_autoreleasePoolPop(contexta);
      if ((v67 & 1) != 0)
      {

        v72 = (id *)(v154 + 5);
        v136 = (id)v154[5];
        -[SMSuggestionsManager _refreshCurrentLocationWithError:](self, "_refreshCurrentLocationWithError:", &v136);
        objc_storeStrong(v72, v136);
        v46 = (id)v154[5];
        v45 = 0;
        if (v46)
          goto LABEL_37;
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        -[SMSuggestionsManager latestLocationOfTheDevice](self, "latestLocationOfTheDevice");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v75 = (id *)(v154 + 5);
        v135 = (id)v154[5];
        -[SMSuggestionsManager _getSunriseDateAtLocation:date:error:](self, "_getSunriseDateAtLocation:date:error:", v74, v73, &v135);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_storeStrong(v75, v135);

        if (v154[5])
        {
          ((void (*)(void (**)(id, _QWORD, void *), _QWORD))v9[2])(v9, 0);
LABEL_91:

          v45 = 0;
          goto LABEL_38;
        }
        -[SMSuggestionsManager latestLocationOfTheDevice](self, "latestLocationOfTheDevice");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v78 = (id *)(v154 + 5);
        v134 = (id)v154[5];
        -[SMSuggestionsManager _getSunsetDateAtLocation:date:error:](self, "_getSunsetDateAtLocation:date:error:", v77, v73, &v134);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_storeStrong(v78, v134);

        if (v154[5])
        {
          ((void (*)(void (**)(id, _QWORD, void *), _QWORD))v9[2])(v9, 0);
LABEL_90:

          goto LABEL_91;
        }
        if (objc_msgSend(v79, "compare:", v73) == 1 && objc_msgSend(v73, "compare:", v76) == 1)
        {
          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          v80 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
          {
            v81 = (objc_class *)objc_opt_class();
            NSStringFromClass(v81);
            contextc = (id)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v130 = (char *)(id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99D68], "date");
            aSelectorb = (char *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(aSelectorb, "stringFromDate");
            v82 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v76, "stringFromDate");
            v83 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v79, "stringFromDate");
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413314;
            *(_QWORD *)&buf[4] = contextc;
            v160 = 2112;
            v161 = v130;
            v162 = 2112;
            v163 = (uint64_t)v82;
            v164 = 2112;
            v165 = v83;
            v166 = 2112;
            v167 = v84;
            _os_log_impl(&dword_1D1A22000, v80, OS_LOG_TYPE_INFO, "%@, %@, time is not after sunset or before sunrise, current time, %@, sunrise time, %@, sunset time, %@", buf, 0x34u);

          }
          v9[2](v9, 0, 0);
          goto LABEL_90;
        }
        -[SMSuggestionsManager latestLocationOfTheDevice](self, "latestLocationOfTheDevice");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        v86 = (id *)(v154 + 5);
        v133 = (id)v154[5];
        -[SMSuggestionsManager _getNPLOIsToHomeWithOnlyHighConfidence:location:date:error:](self, "_getNPLOIsToHomeWithOnlyHighConfidence:location:date:error:", 0, v85, v73, &v133);
        contextb = (void *)objc_claimAutoreleasedReturnValue();
        objc_storeStrong(v86, v133);

        if (v154[5])
        {
          ((void (*)(void (**)(id, _QWORD, void *), _QWORD))v9[2])(v9, 0);
        }
        else
        {
          if (!objc_msgSend(contextb, "count"))
          {
            _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
            v95 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v95, OS_LOG_TYPE_INFO))
            {
              v96 = (objc_class *)objc_opt_class();
              NSStringFromClass(v96);
              v97 = (id)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              v98 = (char *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)&buf[4] = v97;
              v160 = 2112;
              v161 = v98;
              _os_log_impl(&dword_1D1A22000, v95, OS_LOG_TYPE_INFO, "%@, %@, no nplois to home", buf, 0x16u);

            }
            v9[2](v9, 0, (void *)v154[5]);
            goto LABEL_89;
          }
          -[SMSuggestionsManager distanceCalculator](self, "distanceCalculator");
          logb = (os_log_t)objc_claimAutoreleasedReturnValue();
          -[SMSuggestionsManager latestLocationOfTheDevice](self, "latestLocationOfTheDevice");
          v116 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(contextb, "firstObject");
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v87, "locationOfInterest");
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v88, "location");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          v90 = (id *)(v154 + 5);
          v132 = (id)v154[5];
          -[NSObject distanceFromLocation:toLocation:error:](logb, "distanceFromLocation:toLocation:error:", v116, v89, &v132);
          v92 = v91;
          objc_storeStrong(v90, v132);

          v93 = (id *)(v154 + 5);
          if (v154[5] || v92 == 1.79769313e308)
          {
            _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
            loga = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(loga, OS_LOG_TYPE_INFO))
            {
              v99 = (objc_class *)objc_opt_class();
              NSStringFromClass(v99);
              v117 = (id)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              aSelectora = (char *)(id)objc_claimAutoreleasedReturnValue();
              if (v92 == 1.79769313e308)
              {
                v114 = CFSTR("DBL_MAX");
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.3f"), *(_QWORD *)&v92);
                v114 = (__CFString *)objc_claimAutoreleasedReturnValue();
              }
              -[SMSuggestionsManager latestLocationOfTheDevice](self, "latestLocationOfTheDevice");
              v104 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(contextb, "firstObject");
              v105 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v105, "locationOfInterest");
              v106 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v106, "location");
              v107 = (void *)objc_claimAutoreleasedReturnValue();
              v108 = v154[5];
              *(_DWORD *)buf = 138413570;
              *(_QWORD *)&buf[4] = v117;
              v160 = 2112;
              v161 = aSelectora;
              v162 = 2112;
              v163 = (uint64_t)v114;
              v164 = 2112;
              v165 = v104;
              v166 = 2112;
              v167 = v107;
              v168 = 2112;
              v169 = v108;
              _os_log_impl(&dword_1D1A22000, loga, OS_LOG_TYPE_INFO, "%@, %@, distance, %@, latestLocationOfTheDevice, %@, nploisToHome.firstObject.locationOfInterest.location, %@, error, %@", buf, 0x3Eu);

              if (v92 != 1.79769313e308)
            }
          }
          else
          {
            if (v92 > 500.0)
            {
              v131 = 0;
              v94 = -[SMSuggestionsManager _isFirstTimeUserOfZelkovaWithError:](self, "_isFirstTimeUserOfZelkovaWithError:", &v131);
              objc_storeStrong(v93, v131);
              if (v154[5])
              {
                ((void (*)(void (**)(id, _QWORD, void *), _QWORD))v9[2])(v9, 0);
              }
              else
              {
                if (v94)
                {
                  v103 = 0;
                }
                else
                {
                  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
                  v109 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v109, OS_LOG_TYPE_INFO))
                  {
                    v110 = (objc_class *)objc_opt_class();
                    NSStringFromClass(v110);
                    v111 = (id)objc_claimAutoreleasedReturnValue();
                    NSStringFromSelector(a2);
                    v112 = (char *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412546;
                    *(_QWORD *)&buf[4] = v111;
                    v160 = 2112;
                    v161 = v112;
                    _os_log_impl(&dword_1D1A22000, v109, OS_LOG_TYPE_INFO, "%@, %@, originator has started a safety session before", buf, 0x16u);

                  }
                  v103 = (void *)v154[5];
                }
                v9[2](v9, v94, v103);
              }
              goto LABEL_89;
            }
            _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
            loga = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(loga, OS_LOG_TYPE_INFO))
            {
              v100 = (objc_class *)objc_opt_class();
              NSStringFromClass(v100);
              v101 = (id)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              v102 = (char *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)&buf[4] = v101;
              v160 = 2112;
              v161 = v102;
              _os_log_impl(&dword_1D1A22000, loga, OS_LOG_TYPE_INFO, "%@, %@, originator seems to be at home", buf, 0x16u);

            }
          }

          v9[2](v9, 0, (void *)v154[5]);
        }
LABEL_89:

        goto LABEL_90;
      }
      ++v53;
    }
    while (v115 != v53);
    v52 = objc_msgSend(v113, "countByEnumeratingWithState:objects:count:", &v137, v170, 16);
    if (v52)
      continue;
    break;
  }
LABEL_53:

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v68 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
  {
    v69 = (objc_class *)objc_opt_class();
    NSStringFromClass(v69);
    v70 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v71 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v70;
    v160 = 2112;
    v161 = v71;
    _os_log_impl(&dword_1D1A22000, v68, OS_LOG_TYPE_INFO, "%@, %@, receiver is not a likely receiver", buf, 0x16u);

  }
  v9[2](v9, 0, 0);
  v45 = 0;
LABEL_38:

  _Block_object_dispose(&v145, 8);
LABEL_39:
  _Block_object_dispose(&v153, 8);

LABEL_40:
}

void __82__SMSuggestionsManager__shouldShowTipKitSuggestionsForInitiator_receiver_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)showAlwaysOnPromptWithConfiguration:(id)a3 handler:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB35C8];
  v6 = *MEMORY[0x1E0D18598];
  v11 = *MEMORY[0x1E0CB2D50];
  v12[0] = CFSTR("only supported on watchOS");
  v7 = (void *)MEMORY[0x1E0C99D80];
  v8 = a4;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", v6, 1, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))a4 + 2))(v8, v10);

}

- (BOOL)_isContactBlocked:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int IsItemBlocked;
  void *v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  const void *v18;
  NSObject *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  const void *v24;
  int v25;
  NSObject *v26;
  objc_class *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  const __CFString *v31;
  int v33;
  void *v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  const __CFString *v40;
  __int16 v41;
  const __CFString *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "email");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v7, "email");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = CMFItemCreateWithEmailAddress();

      IsItemBlocked = CMFBlockListIsItemBlocked();
      LOBYTE(v11) = IsItemBlocked != 0;
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = (objc_class *)objc_opt_class();
        NSStringFromClass(v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = (void *)v15;
        v17 = CFSTR("NO");
        v33 = 138413058;
        v34 = v14;
        v35 = 2112;
        if (IsItemBlocked)
          v17 = CFSTR("YES");
        v36 = v15;
        v37 = 2112;
        v38 = v9;
        v39 = 2112;
        v40 = v17;
        _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_INFO, "%@, %@, email, %@, isBlocked, %@", (uint8_t *)&v33, 0x2Au);

      }
      v18 = (const void *)v9;
LABEL_18:
      CFRelease(v18);
      goto LABEL_20;
    }
    objc_msgSend(v7, "phoneNumber");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v20 = (const __CFString *)CPPhoneNumberCopyHomeCountryCode();
      objc_msgSend(v7, "phoneNumber");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "phoneNumber");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "containsString:", CFSTR("+"));
      v23 = CFPhoneNumberCreate();

      v24 = (const void *)CMFItemCreateWithPhoneNumber();
      v25 = CMFBlockListIsItemBlocked();
      LOBYTE(v11) = v25 != 0;
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        v27 = (objc_class *)objc_opt_class();
        NSStringFromClass(v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v29 = objc_claimAutoreleasedReturnValue();
        v30 = (void *)v29;
        v33 = 138413314;
        v31 = CFSTR("NO");
        v34 = v28;
        v35 = 2112;
        if (v25)
          v31 = CFSTR("YES");
        v36 = v29;
        v37 = 2112;
        v38 = (uint64_t)v24;
        v39 = 2112;
        v40 = v20;
        v41 = 2112;
        v42 = v31;
        _os_log_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_INFO, "%@, %@, phoneNumber, %@, countryCode, %@, isBlocked, %@", (uint8_t *)&v33, 0x34u);

      }
      CFRelease(v20);
      CFRelease(v24);
      v18 = (const void *)v23;
      goto LABEL_18;
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v33) = 0;
      _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: contactInformation", (uint8_t *)&v33, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("contactInformation"));
      LOBYTE(v11) = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      LOBYTE(v11) = 0;
    }
  }
LABEL_20:

  return (char)v11;
}

- (BOOL)_didInteractInPastWithHandle:(id)a3 timeInterval:(double)a4 error:(id *)a5
{
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void *v11;
  void *v12;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  dispatch_semaphore_t v29;
  id v30;
  NSObject *v31;
  void *v32;
  dispatch_time_t v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  uint64_t (*v48)(uint64_t, uint64_t);
  _BOOL4 v49;
  NSObject *v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  char v52;
  NSObject *v53;
  NSObject *v54;
  dispatch_semaphore_t v55;
  void *v56;
  id v57;
  NSObject *v58;
  char v59;
  void *v60;
  dispatch_time_t v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  void *v63;
  double v64;
  double v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  NSObject *v71;
  void *v72;
  void *v73;
  void *v74;
  _BOOL4 v75;
  NSObject *v76;
  NSObject *v77;
  objc_class *v78;
  id v79;
  id v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t j;
  void *v85;
  void *v86;
  void *v87;
  _BOOL4 v88;
  void *v89;
  void *v90;
  double v91;
  double v92;
  int v93;
  NSObject *v94;
  objc_class *v95;
  id v96;
  id v97;
  uint64_t v98;
  void *v99;
  const __CFString *v100;
  NSObject *v101;
  objc_class *v102;
  id v103;
  void *v104;
  objc_class *v106;
  void *v107;
  void *v108;
  objc_class *v109;
  void *v110;
  void *v111;
  objc_class *v112;
  void *v113;
  void *v114;
  objc_class *v115;
  id v116;
  void *v117;
  uint64_t v119;
  void *v122;
  id v123;
  id v124;
  uint64_t (*v125)(uint64_t, uint64_t);
  dispatch_semaphore_t dsema;
  NSObject *dsemaa;
  id v128;
  uint64_t v129;
  void *v130;
  id v131;
  id v132;
  id obj;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  uint64_t v138;
  uint64_t v139;
  void (*v140)(uint64_t, void *);
  void *v141;
  SMSuggestionsManager *v142;
  NSObject *v143;
  uint8_t *v144;
  SEL v145;
  uint64_t v146;
  uint64_t v147;
  intptr_t (*v148)(uint64_t, void *);
  void *v149;
  NSObject *v150;
  _BYTE *v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  _BYTE buf[24];
  uint64_t (*v161)(uint64_t, uint64_t);
  _BYTE v162[20];
  __int16 v163;
  const __CFString *v164;
  uint8_t v165[128];
  uint8_t v166[8];
  uint8_t *v167;
  uint64_t v168;
  uint64_t (*v169)(uint64_t, uint64_t);
  void (*v170)(uint64_t);
  id v171;
  _BYTE v172[128];
  _BYTE v173[128];
  _QWORD v174[4];

  v174[1] = *MEMORY[0x1E0C80C00];
  v123 = a3;
  if (v123)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v123, "primaryHandle");
      v10 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v8;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v9;
      *(_WORD *)&buf[22] = 2112;
      v161 = v10;
      _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%@, %@, handle, %@,", buf, 0x20u);

    }
    objc_msgSend(v123, "primaryHandle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    IMSPIGetAllChatsContainingParticipantWithHandle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v12, "count");
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v15;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v16;
      *(_WORD *)&buf[22] = 2048;
      v161 = (uint64_t (*)(uint64_t, uint64_t))v17;
      _os_log_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_INFO, "%@, %@, chats count, %lu", buf, 0x20u);

    }
    v18 = (void *)objc_opt_new();
    v158 = 0u;
    v159 = 0u;
    v156 = 0u;
    v157 = 0u;
    obj = v12;
    v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v156, v173, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v157;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v157 != v20)
            objc_enumerationMutation(obj);
          v22 = *(void **)(*((_QWORD *)&v156 + 1) + 8 * i);
          v23 = (void *)MEMORY[0x1D8231EA8]();
          objc_msgSend(v22, "chatGUID");
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (v24)
          {
            objc_msgSend(v22, "chatGUID");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "addObject:", v25);

          }
          objc_autoreleasePoolPop(v23);
        }
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v156, v173, 16);
      }
      while (v19);
    }

    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      v106 = (objc_class *)objc_opt_class();
      NSStringFromClass(v106);
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v107;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v108;
      *(_WORD *)&buf[22] = 2112;
      v161 = (uint64_t (*)(uint64_t, uint64_t))v18;
      _os_log_debug_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_DEBUG, "%@, %@, chat guids, %@", buf, 0x20u);

    }
    v130 = (void *)objc_opt_new();
    v122 = (void *)objc_opt_new();
    v154 = 0u;
    v155 = 0u;
    v152 = 0u;
    v153 = 0u;
    v128 = v18;
    v131 = (id)objc_msgSend(v128, "countByEnumeratingWithState:objects:count:", &v152, v172, 16);
    if (v131)
    {
      v129 = *(_QWORD *)v153;
      v124 = (id)*MEMORY[0x1E0D18598];
      dsema = (dispatch_semaphore_t)*MEMORY[0x1E0CB2D50];
      v119 = *MEMORY[0x1E0D35700];
LABEL_19:
      v27 = 0;
      while (1)
      {
        if (*(_QWORD *)v153 != v129)
          objc_enumerationMutation(v128);
        v28 = (void *)MEMORY[0x1D8231EA8]();
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        v161 = __Block_byref_object_copy__102;
        *(_QWORD *)v162 = __Block_byref_object_dispose__102;
        *(_QWORD *)&v162[8] = 0;
        v29 = dispatch_semaphore_create(0);
        v30 = MEMORY[0x1E0C80D38];
        v146 = MEMORY[0x1E0C809B0];
        v147 = 3221225472;
        v148 = __72__SMSuggestionsManager__didInteractInPastWithHandle_timeInterval_error___block_invoke;
        v149 = &unk_1E92A1538;
        v151 = buf;
        v150 = v29;
        IMSPIQueryChatWithGuid();

        v31 = v150;
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = dispatch_time(0, 3600000000000);
        if (!dispatch_semaphore_wait(v31, v33))
          goto LABEL_27;
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "timeIntervalSinceDate:", v32);
        v36 = v35;
        v37 = (void *)objc_opt_new();
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_607);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "filteredArrayUsingPredicate:", v38);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "firstObject");
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v37, "submitToCoreAnalytics:type:duration:", v41, 1, v36);
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v166 = 0;
          _os_log_fault_impl(&dword_1D1A22000, v42, OS_LOG_TYPE_FAULT, "Invalid parameter not satisfying: authorizationManager", v166, 2u);
        }

        v43 = (void *)MEMORY[0x1E0CB35C8];
        v174[0] = dsema;
        *(_QWORD *)v166 = CFSTR("semaphore wait timeout");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v166, v174, 1);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "errorWithDomain:code:userInfo:", v124, 15, v44);
        v45 = (void *)objc_claimAutoreleasedReturnValue();

        if (v45)
        {
          v46 = objc_retainAutorelease(v45);

        }
        else
        {
LABEL_27:
          v46 = 0;
        }

        v47 = (uint64_t (*)(uint64_t, uint64_t))v46;
        if (v47)
          break;
        if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40) && (objc_msgSend(v130, "containsObject:") & 1) == 0)
        {
          objc_msgSend(v130, "addObject:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
          objc_msgSend(v122, "addObject:", v119);
        }

        _Block_object_dispose(buf, 8);
        objc_autoreleasePoolPop(v28);
        if (v131 == (id)++v27)
        {
          v131 = (id)objc_msgSend(v128, "countByEnumeratingWithState:objects:count:", &v152, v172, 16);
          if (v131)
            goto LABEL_19;
          goto LABEL_34;
        }
      }
      v48 = v47;

      _Block_object_dispose(buf, 8);
      objc_autoreleasePoolPop(v28);

      if (!a5)
      {
        v49 = 0;
        goto LABEL_44;
      }
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        v112 = (objc_class *)objc_opt_class();
        NSStringFromClass(v112);
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v113;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v114;
        *(_WORD *)&buf[22] = 2112;
        v161 = v48;
        _os_log_error_impl(&dword_1D1A22000, v50, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

      }
      v51 = objc_retainAutorelease(v48);
      v52 = 0;
      *a5 = v51;
    }
    else
    {
LABEL_34:

      v48 = 0;
      v49 = a5 != 0;
LABEL_44:
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v54 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
      {
        v109 = (objc_class *)objc_opt_class();
        NSStringFromClass(v109);
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        *(_QWORD *)&buf[4] = v110;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v111;
        *(_WORD *)&buf[22] = 2112;
        v161 = (uint64_t (*)(uint64_t, uint64_t))v122;
        *(_WORD *)v162 = 2112;
        *(_QWORD *)&v162[2] = v130;
        _os_log_debug_impl(&dword_1D1A22000, v54, OS_LOG_TYPE_DEBUG, "%@, %@, services, %@, chat identifiers, %@", buf, 0x2Au);

      }
      *(_QWORD *)v166 = 0;
      v167 = v166;
      v168 = 0x3032000000;
      v169 = __Block_byref_object_copy__102;
      v170 = __Block_byref_object_dispose__102;
      v171 = 0;
      v55 = dispatch_semaphore_create(0);
      objc_msgSend(v130, "allObjects");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = MEMORY[0x1E0C80D38];
      v138 = MEMORY[0x1E0C809B0];
      v139 = 3221225472;
      v140 = __72__SMSuggestionsManager__didInteractInPastWithHandle_timeInterval_error___block_invoke_197;
      v141 = &unk_1E92A1560;
      v142 = self;
      v144 = v166;
      v145 = a2;
      v58 = v55;
      v143 = v58;
      v59 = IMSPIQueryMessagesWithChatIdentifiersAndQOS();

      if ((v59 & 1) == 0)
        dispatch_semaphore_signal(v58);
      dsemaa = v58;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = dispatch_time(0, 3600000000000);
      v62 = v48;
      if (dispatch_semaphore_wait(dsemaa, v61))
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "timeIntervalSinceDate:", v60);
        v65 = v64;
        v66 = (void *)objc_opt_new();
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_607);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "filteredArrayUsingPredicate:", v67);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "firstObject");
        v70 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v66, "submitToCoreAnalytics:type:duration:", v70, 1, v65);
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v71 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v71, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1D1A22000, v71, OS_LOG_TYPE_FAULT, "Invalid parameter not satisfying: authorizationManager", buf, 2u);
        }

        v72 = (void *)MEMORY[0x1E0CB35C8];
        v174[0] = *MEMORY[0x1E0CB2D50];
        *(_QWORD *)buf = CFSTR("semaphore wait timeout");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v174, 1);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v73);
        v74 = (void *)objc_claimAutoreleasedReturnValue();

        v62 = v48;
        if (v74)
        {
          v62 = objc_retainAutorelease(v74);

        }
      }

      v125 = v62;
      if (v125)
        v75 = v49;
      else
        v75 = 0;
      if (v75)
      {
        _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        v76 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
        {
          v115 = (objc_class *)objc_opt_class();
          NSStringFromClass(v115);
          v116 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v117 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)&buf[4] = v116;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v117;
          *(_WORD *)&buf[22] = 2112;
          v161 = v125;
          _os_log_error_impl(&dword_1D1A22000, v76, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

        }
        v52 = 0;
        *a5 = objc_retainAutorelease(v125);
      }
      else
      {
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v77 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
        {
          v78 = (objc_class *)objc_opt_class();
          NSStringFromClass(v78);
          v79 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v80 = (id)objc_claimAutoreleasedReturnValue();
          v81 = objc_msgSend(*((id *)v167 + 5), "count");
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)&buf[4] = v79;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v80;
          *(_WORD *)&buf[22] = 2048;
          v161 = (uint64_t (*)(uint64_t, uint64_t))v81;
          _os_log_impl(&dword_1D1A22000, v77, OS_LOG_TYPE_INFO, "%@, %@, messages count, %lu", buf, 0x20u);

        }
        v136 = 0u;
        v137 = 0u;
        v134 = 0u;
        v135 = 0u;
        v132 = *((id *)v167 + 5);
        v82 = objc_msgSend(v132, "countByEnumeratingWithState:objects:count:", &v134, v165, 16);
        if (v82)
        {
          v52 = 0;
          v83 = *(_QWORD *)v135;
          while (2)
          {
            for (j = 0; j != v82; ++j)
            {
              if (*(_QWORD *)v135 != v83)
                objc_enumerationMutation(v132);
              v85 = *(void **)(*((_QWORD *)&v134 + 1) + 8 * j);
              v86 = (void *)MEMORY[0x1D8231EA8]();
              objc_msgSend(v85, "date");
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              v88 = v87 == 0;

              if (v88)
              {
                _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
                v101 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
                {
                  v102 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v102);
                  v103 = (id)objc_claimAutoreleasedReturnValue();
                  NSStringFromSelector(a2);
                  v104 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138413058;
                  *(_QWORD *)&buf[4] = v103;
                  *(_WORD *)&buf[12] = 2112;
                  *(_QWORD *)&buf[14] = v104;
                  *(_WORD *)&buf[22] = 2112;
                  v161 = (uint64_t (*)(uint64_t, uint64_t))v123;
                  *(_WORD *)v162 = 2112;
                  *(_QWORD *)&v162[2] = v85;
                  _os_log_error_impl(&dword_1D1A22000, v101, OS_LOG_TYPE_ERROR, "%@, %@, handle, %@, no message date for message, %@", buf, 0x2Au);

                }
                v93 = 11;
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0C99D68], "now");
                v89 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v85, "date");
                v90 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v89, "timeIntervalSinceDate:", v90);
                v92 = v91;

                v93 = v92 <= a4 && v92 >= 0.0;
                _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
                v94 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v94, OS_LOG_TYPE_INFO))
                {
                  v95 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v95);
                  v96 = (id)objc_claimAutoreleasedReturnValue();
                  NSStringFromSelector(a2);
                  v97 = (id)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v85, "chatIdentifier");
                  v98 = objc_claimAutoreleasedReturnValue();
                  v99 = (void *)v98;
                  *(_DWORD *)buf = 138413570;
                  v100 = CFSTR("NO");
                  if (v93)
                    v100 = CFSTR("YES");
                  *(_QWORD *)&buf[4] = v96;
                  *(_WORD *)&buf[12] = 2112;
                  *(_QWORD *)&buf[14] = v97;
                  *(_WORD *)&buf[22] = 2112;
                  v161 = (uint64_t (*)(uint64_t, uint64_t))v123;
                  *(_WORD *)v162 = 2112;
                  *(_QWORD *)&v162[2] = v98;
                  *(_WORD *)&v162[10] = 2048;
                  *(double *)&v162[12] = v92;
                  v163 = 2112;
                  v164 = v100;
                  _os_log_impl(&dword_1D1A22000, v94, OS_LOG_TYPE_INFO, "%@, %@, handle, %@, chat identifier, %@, timeIntervalSinceMessage, %f, didInteract, %@", buf, 0x3Eu);

                }
                v52 |= v93;
              }
              objc_autoreleasePoolPop(v86);
              if (v93 != 11 && v93)
              {

                goto LABEL_86;
              }
            }
            v82 = objc_msgSend(v132, "countByEnumeratingWithState:objects:count:", &v134, v165, 16);
            if (v82)
              continue;
            break;
          }
        }

        v52 = 0;
      }
LABEL_86:

      _Block_object_dispose(v166, 8);
      v51 = v125;
    }

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v53, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handle", buf, 2u);
    }

    if (a5)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("handle"));
      v52 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v52 = 0;
    }
  }

  return v52 & 1;
}

intptr_t __72__SMSuggestionsManager__didInteractInPastWithHandle_timeInterval_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "chatIdentifier");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __72__SMSuggestionsManager__didInteractInPastWithHandle_timeInterval_error___block_invoke_197(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412802;
    v10 = v7;
    v11 = 2112;
    v12 = v8;
    v13 = 2048;
    v14 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%@, %@, fetched messages count, %lu", (uint8_t *)&v9, 0x20u);

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

- (id)_getValuesFromDefaultsIfExists:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  objc_class *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint8_t buf[8];
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = v7;
  if (v7)
  {
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("RTDefaultsSuggestionTimeIntervalBuffer")))
    {
      -[SMSuggestionsManager defaultsManager](self, "defaultsManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKey:", v8);
      v10 = objc_claimAutoreleasedReturnValue();

      v11 = 0;
      v12 = &unk_1E932D130;
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("RTDefaultsSuggestionRegularUserSuppressionSessionConfigurationCount")))
    {
      -[SMSuggestionsManager defaultsManager](self, "defaultsManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKey:", v8);
      v10 = objc_claimAutoreleasedReturnValue();

      v11 = 0;
      v12 = &unk_1E93289D0;
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("RTDefaultsSuggestionOccasionalUserSuppressionSessionConfigurationCount")))
    {
      -[SMSuggestionsManager defaultsManager](self, "defaultsManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKey:", v8);
      v10 = objc_claimAutoreleasedReturnValue();

      v11 = 0;
      v12 = &unk_1E93289E8;
    }
    else
    {
      if (!objc_msgSend(v8, "isEqualToString:", CFSTR("RTDefaultsSuggestionBoundingBoxRadius"))
        && !objc_msgSend(v8, "isEqualToString:", CFSTR("RTDefaultsSuggestionDestinationSimilarityRadiusToSessionConfiguration")))
      {
        if (objc_msgSend(v8, "isEqualToString:", CFSTR("RTDefaultsSuggestionNotificationExpirationTimeInterval"))|| objc_msgSend(v8, "isEqualToString:", CFSTR("RTDefaultsSuggestionShowTriggerTypeAsFooter"))|| objc_msgSend(v8, "isEqualToString:", CFSTR("RTDefaultsSuggestionDisplayedCount")))
        {
          -[SMSuggestionsManager defaultsManager](self, "defaultsManager");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "objectForKey:", v8);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          v11 = 0;
        }
        else
        {
          v20 = (void *)MEMORY[0x1E0CB35C8];
          v21 = *MEMORY[0x1E0D18598];
          v29 = *MEMORY[0x1E0CB2D50];
          v22 = (void *)MEMORY[0x1E0CB3940];
          v23 = (objc_class *)objc_opt_class();
          NSStringFromClass(v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "stringWithFormat:", CFSTR("%@, %@, string, %@, not found"), v24, v25, v8);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v30[0] = v26;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "errorWithDomain:code:userInfo:", v21, 7, v27);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          v14 = 0;
        }
LABEL_19:
        if (a4)
          *a4 = objc_retainAutorelease(v11);

        goto LABEL_22;
      }
      -[SMSuggestionsManager defaultsManager](self, "defaultsManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKey:", v8);
      v10 = objc_claimAutoreleasedReturnValue();

      v11 = 0;
      v12 = &unk_1E932D140;
    }
    if (v10)
      v14 = (void *)v10;
    else
      v14 = v12;
    goto LABEL_19;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: string", buf, 2u);
  }

  if (a4)
  {
    _RTErrorInvalidParameterCreate((uint64_t)CFSTR("string"));
    v14 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }
LABEL_22:

  return v14;
}

- (BOOL)isZelkovaSuggestionsFeatureEnabledWithError:(id *)a3
{
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (_os_feature_enabled_impl() && (_os_feature_enabled_impl() & 1) != 0)
    return 1;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v21 = v16;
    v22 = 2112;
    v23 = v17;
    _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "%@, %@, feature not enabled", buf, 0x16u);

  }
  v7 = (void *)MEMORY[0x1E0CB35C8];
  v8 = *MEMORY[0x1E0D18598];
  v18 = *MEMORY[0x1E0CB2D50];
  v9 = (void *)MEMORY[0x1E0CB3940];
  if (_os_feature_enabled_impl())
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  if (_os_feature_enabled_impl())
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  objc_msgSend(v9, "stringWithFormat:", CFSTR("Feature not enabled, is Zelkova enabled, %@, is Zelkova_Suggestions enabled, %@"), v10, v11, v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, 7, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3)
    *a3 = objc_retainAutorelease(v14);

  return 0;
}

- (unint64_t)_getSuggestionTriggerFromContext:(id)a3 error:(id *)a4
{
  id v6;
  unint64_t v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const char *v16;
  objc_class *v17;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend(v6, "type") == 3)
      {
        v7 = 1;
        if (!a4)
          goto LABEL_31;
        goto LABEL_29;
      }
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        goto LABEL_23;
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D18578], "stringFromVisitIncidentType:", objc_msgSend(v6, "type"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D8BA90], "stringFromSMSuggestionTrigger:", 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138413058;
      v20 = v12;
      v21 = 2112;
      v22 = v13;
      v23 = 2112;
      v24 = v14;
      v25 = 2112;
      v26 = v15;
      v16 = "%@, %@, visit type, %@, returning suggestionTrigger, %@";
LABEL_22:
      _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, v16, (uint8_t *)&v19, 0x2Au);

LABEL_23:
      v7 = 0;
      if (!a4)
        goto LABEL_31;
      goto LABEL_29;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend(v6, "vehicleConnectedState") == 2)
      {
        v7 = 2;
        if (!a4)
          goto LABEL_31;
        goto LABEL_29;
      }
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        goto LABEL_23;
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[RTMotionActivityManager motionActivityVehicleConnectedStateToString:](RTMotionActivityManager, "motionActivityVehicleConnectedStateToString:", objc_msgSend(v6, "vehicleConnectedState"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D8BA90], "stringFromSMSuggestionTrigger:", 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138413058;
      v20 = v12;
      v21 = 2112;
      v22 = v13;
      v23 = 2112;
      v24 = v14;
      v25 = 2112;
      v26 = v15;
      v16 = "%@, %@, vehicle connection state, %@, returning suggestionTrigger, %@";
      goto LABEL_22;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = 3;
      if (!a4)
        goto LABEL_31;
      goto LABEL_29;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = 4;
    else
      v7 = 0;
    if (a4)
    {
LABEL_29:
      v9 = 0;
      goto LABEL_30;
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v19) = 0;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", (uint8_t *)&v19, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("context"));
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v7 = 0;
LABEL_30:
      *a4 = v9;
      goto LABEL_31;
    }
    v7 = 0;
  }
LABEL_31:

  return v7;
}

- (id)_getSourceLocationFromContext:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  id v13;
  objc_class *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v7, "type") == 3)
    {
      objc_msgSend(v7, "location");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v10 = (objc_class *)objc_opt_class();
        NSStringFromClass(v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v21 = v11;
        v22 = 2112;
        v23 = v12;
        v24 = 2112;
        v25 = v8;
        _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "%@, %@, source location is set to visit exit location, %@", buf, 0x20u);

      }
      v13 = 0;
    }
    else
    {
      v19 = 0;
      -[SMSuggestionsManager _refreshCurrentLocationWithError:](self, "_refreshCurrentLocationWithError:", &v19);
      v13 = v19;
      -[SMSuggestionsManager latestLocationOfTheDevice](self, "latestLocationOfTheDevice");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v14 = (objc_class *)objc_opt_class();
        NSStringFromClass(v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v21 = v15;
        v22 = 2112;
        v23 = v16;
        v24 = 2112;
        v25 = v8;
        _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "%@, %@, source location is set to latest location of the device, %@", buf, 0x20u);

      }
    }

    if (a4)
      *a4 = objc_retainAutorelease(v13);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", buf, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("context"));
      v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (id)_getCurrentDateFromContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  const char *v13;
  objc_class *v14;
  id v15;
  NSObject *v16;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v18) = 0;
      _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", (uint8_t *)&v18, 2u);
    }

    if (!a4)
    {
      v7 = 0;
      goto LABEL_16;
    }
    _RTErrorInvalidParameterCreate((uint64_t)CFSTR("context"));
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v7 = 0;
    goto LABEL_15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v6, "type") == 3)
  {
    objc_msgSend(v6, "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      goto LABEL_9;
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringFromDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138412802;
    v19 = v10;
    v20 = 2112;
    v21 = v11;
    v22 = 2112;
    v23 = v12;
    v13 = "%@, %@, current date is set to visit exit date, %@";
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      goto LABEL_9;
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringFromDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138412802;
    v19 = v10;
    v20 = 2112;
    v21 = v11;
    v22 = 2112;
    v23 = v12;
    v13 = "%@, %@, current date is set to present date of the device, %@";
  }
  _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, v13, (uint8_t *)&v18, 0x20u);

LABEL_9:
  if (a4)
  {
    v15 = 0;
LABEL_15:
    *a4 = v15;
  }
LABEL_16:

  return v7;
}

- (BOOL)_isUserInActiveSessionWithError:(id *)a3
{
  id v5;
  uint64_t v6;
  dispatch_semaphore_t v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  dispatch_time_t v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  __CFString *v26;
  __CFString *v27;
  NSObject *v28;
  __CFString *v29;
  NSObject *v30;
  char v31;
  NSObject *v32;
  objc_class *v33;
  id v34;
  id v35;
  int v36;
  const __CFString *v37;
  uint64_t v38;
  objc_class *v40;
  id v41;
  void *v42;
  objc_class *v43;
  id v44;
  void *v45;
  const __CFString *v46;
  void *v48;
  _QWORD v49[4];
  NSObject *v50;
  uint64_t *v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;
  _BYTE buf[12];
  __int16 v66;
  id v67;
  __int16 v68;
  const __CFString *v69;
  __int16 v70;
  uint64_t v71;
  _QWORD v72[4];

  v72[1] = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc(MEMORY[0x1E0D8BA70]);
  v6 = objc_msgSend(v5, "initWithBatchSize:fetchLimit:sortByCreationDate:ascending:dateInterval:", *MEMORY[0x1E0D8BD38], 1, 1, 0, 0);
  v7 = dispatch_semaphore_create(0);
  v59 = 0;
  v60 = &v59;
  v61 = 0x3032000000;
  v62 = __Block_byref_object_copy__102;
  v63 = __Block_byref_object_dispose__102;
  v64 = 0;
  v53 = 0;
  v54 = &v53;
  v55 = 0x3032000000;
  v56 = __Block_byref_object_copy__102;
  v57 = __Block_byref_object_dispose__102;
  v58 = 0;
  -[SMSuggestionsManager sessionStore](self, "sessionStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = __56__SMSuggestionsManager__isUserInActiveSessionWithError___block_invoke;
  v49[3] = &unk_1E9296EE0;
  v51 = &v59;
  v52 = &v53;
  v9 = v7;
  v50 = v9;
  objc_msgSend(v8, "fetchSessionManagerStatesWithOptions:handler:", v6, v49);
  v48 = (void *)v6;

  v10 = v9;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v10, v12))
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "timeIntervalSinceDate:", v11);
  v15 = v14;
  v16 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_607);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "filteredArrayUsingPredicate:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "firstObject");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "submitToCoreAnalytics:type:duration:", v20, 1, v15);
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_FAULT, "Invalid parameter not satisfying: authorizationManager", buf, 2u);
  }

  v22 = (void *)MEMORY[0x1E0CB35C8];
  v72[0] = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)buf = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v72, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    v25 = objc_retainAutorelease(v24);

  }
  else
  {
LABEL_6:
    v25 = 0;
  }

  v26 = (__CFString *)v25;
  v27 = v26;
  if (a3 && v26)
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v40 = (objc_class *)objc_opt_class();
      NSStringFromClass(v40);
      v41 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v41;
      v66 = 2112;
      v67 = v42;
      v68 = 2112;
      v69 = v27;
      _os_log_error_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

    }
    v29 = v27;
LABEL_17:
    *a3 = objc_retainAutorelease(v29);
    v31 = 1;
    goto LABEL_25;
  }
  if (a3 && v54[5])
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      v43 = (objc_class *)objc_opt_class();
      NSStringFromClass(v43);
      v44 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = (const __CFString *)v54[5];
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v44;
      v66 = 2112;
      v67 = v45;
      v68 = 2112;
      v69 = v46;
      _os_log_error_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

    }
    v29 = (__CFString *)v54[5];
    goto LABEL_17;
  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
  {
    v33 = (objc_class *)objc_opt_class();
    NSStringFromClass(v33);
    v34 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v35 = (id)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend((id)v60[5], "isActiveState");
    v37 = CFSTR("NO");
    v38 = v60[5];
    if (v36)
      v37 = CFSTR("YES");
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)&buf[4] = v34;
    v66 = 2112;
    v67 = v35;
    v68 = 2112;
    v69 = v37;
    v70 = 2112;
    v71 = v38;
    _os_log_impl(&dword_1D1A22000, v32, OS_LOG_TYPE_INFO, "%@, %@, isUserInActiveSession, %@, recent session state, %@", buf, 0x2Au);

  }
  if (a3)
    *a3 = objc_retainAutorelease((id)v54[5]);
  v31 = objc_msgSend((id)v60[5], "isActiveState");
LABEL_25:

  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(&v59, 8);

  return v31;
}

void __56__SMSuggestionsManager__isUserInActiveSessionWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a3;
  objc_msgSend(a2, "firstObject");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v5;
  v11 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)_isFirstTimeUserOfZelkovaWithError:(id *)a3
{
  id v5;
  dispatch_semaphore_t v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  dispatch_time_t v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  NSObject *v34;
  objc_class *v35;
  id v36;
  id v37;
  uint64_t v38;
  const __CFString *v39;
  objc_class *v41;
  id v42;
  void *v43;
  objc_class *v44;
  id v45;
  void *v46;
  uint64_t v47;
  void *v49;
  _QWORD v50[4];
  NSObject *v51;
  uint64_t *v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t (*v63)(uint64_t, uint64_t);
  void (*v64)(uint64_t);
  id v65;
  _BYTE buf[12];
  __int16 v67;
  id v68;
  __int16 v69;
  uint64_t v70;
  __int16 v71;
  const __CFString *v72;
  _QWORD v73[4];

  v73[1] = *MEMORY[0x1E0C80C00];
  v60 = 0;
  v61 = &v60;
  v62 = 0x3032000000;
  v63 = __Block_byref_object_copy__102;
  v64 = __Block_byref_object_dispose__102;
  v65 = 0;
  v54 = 0;
  v55 = &v54;
  v56 = 0x3032000000;
  v57 = __Block_byref_object_copy__102;
  v58 = __Block_byref_object_dispose__102;
  v59 = 0;
  v5 = objc_alloc_init(MEMORY[0x1E0D8BA70]);
  v6 = dispatch_semaphore_create(0);
  -[SMSuggestionsManager sessionStore](self, "sessionStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = __59__SMSuggestionsManager__isFirstTimeUserOfZelkovaWithError___block_invoke;
  v50[3] = &unk_1E9296EE0;
  v52 = &v60;
  v53 = &v54;
  v8 = v6;
  v51 = v8;
  objc_msgSend(v7, "fetchSessionManagerStatesWithOptions:handler:", v5, v50);
  v49 = v5;

  v9 = v8;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v9, v11))
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "timeIntervalSinceDate:", v10);
  v14 = v13;
  v15 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_607);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "filteredArrayUsingPredicate:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "firstObject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "submitToCoreAnalytics:type:duration:", v19, 1, v14);
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_FAULT, "Invalid parameter not satisfying: authorizationManager", buf, 2u);
  }

  v21 = (void *)MEMORY[0x1E0CB35C8];
  v73[0] = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)buf = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v73, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    v24 = objc_retainAutorelease(v23);

  }
  else
  {
LABEL_6:
    v24 = 0;
  }

  v25 = v24;
  v26 = v25;
  if (a3 && v25)
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v41 = (objc_class *)objc_opt_class();
      NSStringFromClass(v41);
      v42 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v42;
      v67 = 2112;
      v68 = v43;
      v69 = 2112;
      v70 = (uint64_t)v26;
      _os_log_error_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

    }
    LOBYTE(v27) = 0;
    v28 = v26;
    goto LABEL_26;
  }
  if (a3 && v55[5])
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v44 = (objc_class *)objc_opt_class();
      NSStringFromClass(v44);
      v45 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = v55[5];
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v45;
      v67 = 2112;
      v68 = v46;
      v69 = 2112;
      v70 = v47;
      _os_log_error_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

    }
    LOBYTE(v27) = 0;
LABEL_25:
    v28 = (void *)v55[5];
LABEL_26:
    *a3 = objc_retainAutorelease(v28);
    goto LABEL_27;
  }
  v29 = (void *)v61[5];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_80);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "filteredArrayUsingPredicate:", v30);
  v31 = objc_claimAutoreleasedReturnValue();
  v32 = (void *)v61[5];
  v61[5] = v31;

  v33 = (void *)v61[5];
  if (v33)
    LODWORD(v27) = objc_msgSend(v33, "count") == 0;
  else
    LODWORD(v27) = 1;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    v35 = (objc_class *)objc_opt_class();
    NSStringFromClass(v35);
    v36 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v37 = (id)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend((id)v61[5], "count");
    v39 = CFSTR("NO");
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)&buf[4] = v36;
    v67 = 2112;
    if ((_DWORD)v27)
      v39 = CFSTR("YES");
    v68 = v37;
    v69 = 2048;
    v70 = v38;
    v71 = 2112;
    v72 = v39;
    _os_log_impl(&dword_1D1A22000, v34, OS_LOG_TYPE_INFO, "%@, %@, active session states count, %lu, result, %@", buf, 0x2Au);

  }
  if (a3)
    goto LABEL_25;
LABEL_27:

  _Block_object_dispose(&v54, 8);
  _Block_object_dispose(&v60, 8);

  return (char)v27;
}

void __59__SMSuggestionsManager__isFirstTimeUserOfZelkovaWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __59__SMSuggestionsManager__isFirstTimeUserOfZelkovaWithError___block_invoke_217(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isActiveState");
}

- (id)_getSuggestionTitleWithHandle:(id)a3 error:(id *)a4
{
  id v7;
  dispatch_semaphore_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  dispatch_time_t v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  NSObject *v30;
  id v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  objc_class *v43;
  id v44;
  void *v45;
  objc_class *v46;
  id v47;
  void *v48;
  void *v49;
  const char *aSelector;
  _QWORD v51[4];
  NSObject *v52;
  uint64_t *v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t (*v64)(uint64_t, uint64_t);
  void (*v65)(uint64_t);
  id v66;
  _BYTE buf[12];
  __int16 v68;
  void *v69;
  __int16 v70;
  void *v71;
  _QWORD v72[4];

  v72[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (v7)
  {
    aSelector = a2;
    v61 = 0;
    v62 = &v61;
    v63 = 0x3032000000;
    v64 = __Block_byref_object_copy__102;
    v65 = __Block_byref_object_dispose__102;
    v66 = 0;
    v55 = 0;
    v56 = &v55;
    v57 = 0x3032000000;
    v58 = __Block_byref_object_copy__102;
    v59 = __Block_byref_object_dispose__102;
    v60 = 0;
    v8 = dispatch_semaphore_create(0);
    -[SMSuggestionsManager contactsManager](self, "contactsManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "primaryHandle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v51[0] = MEMORY[0x1E0C809B0];
    v51[1] = 3221225472;
    v51[2] = __60__SMSuggestionsManager__getSuggestionTitleWithHandle_error___block_invoke;
    v51[3] = &unk_1E9296EE0;
    v53 = &v61;
    v54 = &v55;
    v11 = v8;
    v52 = v11;
    objc_msgSend(v9, "fetchContactsFromEmailOrPhoneNumberString:handler:", v10, v51);

    v12 = v11;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v12, v14))
      goto LABEL_7;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "timeIntervalSinceDate:", v13);
    v17 = v16;
    v18 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_607);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "filteredArrayUsingPredicate:", v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "firstObject");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "submitToCoreAnalytics:type:duration:", v22, 1, v17);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_FAULT, "Invalid parameter not satisfying: authorizationManager", buf, 2u);
    }

    v24 = (void *)MEMORY[0x1E0CB35C8];
    v72[0] = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)buf = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v72, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      v27 = objc_retainAutorelease(v26);

    }
    else
    {
LABEL_7:
      v27 = 0;
    }

    v28 = v27;
    v29 = v28;
    if (a4 && v28)
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v43 = (objc_class *)objc_opt_class();
        NSStringFromClass(v43);
        v44 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v44;
        v68 = 2112;
        v69 = v45;
        v70 = 2112;
        v71 = v29;
        _os_log_error_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

      }
      v31 = objc_retainAutorelease(v29);
    }
    else
    {
      if (!a4 || !v56[5])
      {
        if (objc_msgSend((id)v62[5], "count"))
        {
          objc_msgSend(MEMORY[0x1E0CB3850], "sharedNameComponents");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v62[5], "firstObject");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "givenName");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "setGivenName:", v36);

          objc_msgSend((id)v62[5], "firstObject");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "familyName");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "setFamilyName:", v38);

          objc_msgSend(MEMORY[0x1E0CB3858], "localizedStringFromPersonNameComponents:style:options:", v34, 1, 0);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v39, "length"))
          {
            objc_msgSend(MEMORY[0x1E0D8B9E0], "getSuggestionTitleWithContactName:", v39);
            v32 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_25;
          }

        }
        v40 = (void *)MEMORY[0x1E0D8B9E0];
        objc_msgSend(v7, "primaryHandle");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "getSuggestionTitleWithContactName:", v41);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_25;
      }
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        v46 = (objc_class *)objc_opt_class();
        NSStringFromClass(v46);
        v47 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = (void *)v56[5];
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v47;
        v68 = 2112;
        v69 = v48;
        v70 = 2112;
        v71 = v49;
        _os_log_error_impl(&dword_1D1A22000, v33, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

      }
      v31 = objc_retainAutorelease((id)v56[5]);
    }
    v32 = 0;
    *a4 = v31;
LABEL_25:

    _Block_object_dispose(&v55, 8);
    _Block_object_dispose(&v61, 8);

    goto LABEL_26;
  }
  objc_msgSend(MEMORY[0x1E0D8B9E0], "getSuggestionTitleWithoutContactName");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_26:

  return v32;
}

void __60__SMSuggestionsManager__getSuggestionTitleWithHandle_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_getSuggestionBodyWithPlaceInference:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0D8B9E0];
  objc_msgSend(a3, "preferredName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getSuggestionBodyWithPlaceInference:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_getSuggestionsFooter:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;

  v4 = a3;
  v14 = 0;
  -[SMSuggestionsManager _getValuesFromDefaultsIfExists:error:](self, "_getValuesFromDefaultsIfExists:error:", CFSTR("RTDefaultsSuggestionShowTriggerTypeAsFooter"), &v14);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && ((v7 = v14, objc_msgSend(v5, "unsignedIntValue") == 1) ? (v8 = v7 == 0) : (v8 = 0), v8))
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0D8BA90], "stringFromSMSuggestionTrigger:", objc_msgSend(v4, "suggestionTrigger"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D8BA90], "stringFromSMSuggestionUserType:", objc_msgSend(v4, "suggestionUserType"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("Trigger: %@, User: %@"), v11, v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D8B9E0], "getSuggestionFooter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (BOOL)_checkInitiatorEligibilityWithError:(id *)a3
{
  dispatch_semaphore_t v5;
  dispatch_queue_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  dispatch_time_t v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  NSObject *v31;
  void *v32;
  BOOL v33;
  objc_class *v35;
  id v36;
  void *v37;
  _QWORD v39[4];
  NSObject *v40;
  uint64_t *v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  char v52;
  _BYTE buf[12];
  __int16 v54;
  void *v55;
  __int16 v56;
  void *v57;
  _QWORD v58[4];

  v58[1] = *MEMORY[0x1E0C80C00];
  v49 = 0;
  v50 = &v49;
  v51 = 0x2020000000;
  v52 = 0;
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__102;
  v47 = __Block_byref_object_dispose__102;
  v48 = 0;
  v5 = dispatch_semaphore_create(0);
  v6 = dispatch_queue_create("com.apple.CoreRoutine.SuggestionsManager.InitiatorEligibilityChecker", 0);
  -[SMSuggestionsManager authorizationManager](self, "authorizationManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSuggestionsManager messagingService](self, "messagingService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "effectivePairedDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSuggestionsManager defaultsManager](self, "defaultsManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSuggestionsManager platform](self, "platform");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __60__SMSuggestionsManager__checkInitiatorEligibilityWithError___block_invoke;
  v39[3] = &unk_1E92A15C8;
  v41 = &v49;
  v42 = &v43;
  v12 = v5;
  v40 = v12;
  +[SMInitiatorEligibility checkInitiatorEligibilityWithQueue:authorizationManager:effectivePairedDevice:isHandoff:defaultsManager:platform:handler:](SMInitiatorEligibility, "checkInitiatorEligibilityWithQueue:authorizationManager:effectivePairedDevice:isHandoff:defaultsManager:platform:handler:", v6, v7, v9, 0, v10, v11, v39);

  v13 = v12;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v13, v15))
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "timeIntervalSinceDate:", v14);
  v18 = v17;
  v19 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_607);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "filteredArrayUsingPredicate:", v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "firstObject");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "submitToCoreAnalytics:type:duration:", v23, 1, v18);
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_FAULT, "Invalid parameter not satisfying: authorizationManager", buf, 2u);
  }

  v25 = (void *)MEMORY[0x1E0CB35C8];
  v58[0] = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)buf = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v58, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    v28 = objc_retainAutorelease(v27);

  }
  else
  {
LABEL_6:
    v28 = 0;
  }

  v29 = v28;
  v30 = v29;
  if (a3 && v29)
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      v35 = (objc_class *)objc_opt_class();
      NSStringFromClass(v35);
      v36 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v36;
      v54 = 2112;
      v55 = v37;
      v56 = 2112;
      v57 = v30;
      _os_log_error_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

    }
    v32 = v30;
    goto LABEL_14;
  }
  if (a3)
  {
    v32 = (void *)v44[5];
LABEL_14:
    *a3 = objc_retainAutorelease(v32);
  }
  v33 = *((_BYTE *)v50 + 24) != 0;

  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v49, 8);
  return v33;
}

void __60__SMSuggestionsManager__checkInitiatorEligibilityWithError___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a3;
  if (a2 == 1)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;
  v8 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)_checkReceiverEligibilityForHandle:(id)a3 error:(id *)a4
{
  id v7;
  SMSuggestionsManager *v8;
  dispatch_semaphore_t v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  dispatch_time_t v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  BOOL v33;
  objc_class *v35;
  id v36;
  void *v37;
  const char *aSelector;
  _QWORD v39[4];
  NSObject *v40;
  uint64_t *v41;
  uint8_t *v42;
  uint8_t v43[8];
  uint8_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  char v52;
  _BYTE buf[12];
  __int16 v54;
  void *v55;
  __int16 v56;
  void *v57;
  _QWORD v58[4];

  v58[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (v7)
  {
    aSelector = a2;
    v49 = 0;
    v50 = &v49;
    v51 = 0x2020000000;
    v52 = 0;
    v8 = self;
    *(_QWORD *)v43 = 0;
    v44 = v43;
    v45 = 0x3032000000;
    v46 = __Block_byref_object_copy__102;
    v47 = __Block_byref_object_dispose__102;
    v48 = 0;
    v9 = dispatch_semaphore_create(0);
    -[SMSuggestionsManager eligibilityChecker](v8, "eligibilityChecker");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __65__SMSuggestionsManager__checkReceiverEligibilityForHandle_error___block_invoke;
    v39[3] = &unk_1E92A15F0;
    v41 = &v49;
    v11 = v9;
    v40 = v11;
    v42 = v43;
    objc_msgSend(v10, "checkReceiverEligibility:handler:", v7, v39);

    v12 = v11;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v12, v14))
      goto LABEL_7;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "timeIntervalSinceDate:", v13);
    v17 = v16;
    v18 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_607);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "filteredArrayUsingPredicate:", v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "firstObject");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "submitToCoreAnalytics:type:duration:", v22, 1, v17);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_FAULT, "Invalid parameter not satisfying: authorizationManager", buf, 2u);
    }

    v24 = (void *)MEMORY[0x1E0CB35C8];
    v58[0] = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)buf = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v58, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      v27 = objc_retainAutorelease(v26);

    }
    else
    {
LABEL_7:
      v27 = 0;
    }

    v28 = v27;
    v29 = v28;
    if (a4 && v28)
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v35 = (objc_class *)objc_opt_class();
        NSStringFromClass(v35);
        v36 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v36;
        v54 = 2112;
        v55 = v37;
        v56 = 2112;
        v57 = v29;
        _os_log_error_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

      }
      v31 = v29;
    }
    else
    {
      if (!a4)
      {
LABEL_20:
        v33 = *((_BYTE *)v50 + 24) != 0;

        _Block_object_dispose(v43, 8);
        _Block_object_dispose(&v49, 8);
        goto LABEL_21;
      }
      v31 = (void *)*((_QWORD *)v44 + 5);
    }
    *a4 = objc_retainAutorelease(v31);
    goto LABEL_20;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v43 = 0;
    _os_log_error_impl(&dword_1D1A22000, v32, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handle", v43, 2u);
  }

  if (a4)
  {
    _RTErrorInvalidParameterCreate((uint64_t)CFSTR("handle"));
    v33 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v33 = 0;
  }
LABEL_21:

  return v33;
}

void __65__SMSuggestionsManager__checkReceiverEligibilityForHandle_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;
  uint64_t v7;
  void *v8;

  v6 = a4;
  if (a2 == 1)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

- (id)_getFirstEligibleHandleFromSessionConfigurations:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  id v24;
  void *v25;
  NSObject *v26;
  id v27;
  void *v28;
  void *v29;
  id *v31;
  id v32;
  void *v34;
  id obj;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[16];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: sessionConfigurations", buf, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("sessionConfigurations"));
      v27 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v27 = 0;
    }
    goto LABEL_26;
  }
  v6 = (void *)objc_opt_new();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  v34 = v6;
  if (!v7)
  {
    v25 = 0;
    v24 = 0;
    goto LABEL_23;
  }
  v8 = v7;
  v31 = a4;
  v32 = v5;
  v9 = *(_QWORD *)v38;
  while (2)
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v38 != v9)
        objc_enumerationMutation(obj);
      v11 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
      v12 = (void *)MEMORY[0x1D8231EA8]();
      objc_msgSend(v11, "conversation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "receiverHandles");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "count");

      if (v15 <= 1)
      {
        objc_msgSend(v11, "conversation");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "receiverHandles");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "firstObject");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v6, "containsObject:", v18);

        if ((v19 & 1) == 0)
        {
          objc_msgSend(v11, "conversation");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "receiverHandles");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "firstObject");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = 0;
          v23 = -[SMSuggestionsManager _checkReceiverEligibilityForHandle:error:](self, "_checkReceiverEligibilityForHandle:error:", v22, &v36);
          v24 = v36;

          if (v23)
          {
            objc_msgSend(v11, "conversation");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "receiverHandles");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "firstObject");
            v25 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v6 = v34;
            if (!v24)
              goto LABEL_11;
            v25 = 0;
          }
          objc_autoreleasePoolPop(v12);
          goto LABEL_22;
        }
      }
LABEL_11:
      objc_autoreleasePoolPop(v12);
    }
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    if (v8)
      continue;
    break;
  }
  v25 = 0;
  v24 = 0;
LABEL_22:
  a4 = v31;
  v5 = v32;
LABEL_23:

  if (a4)
    *a4 = objc_retainAutorelease(v24);
  v27 = v25;

LABEL_26:
  return v27;
}

- (id)_getMessagesURLFromSessionConfig:(id)a3 payloadType:(int64_t)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  uint64_t (*v18)(uint64_t, uint64_t);
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  _BOOL4 v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
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
  void *v50;
  BOOL v51;
  dispatch_semaphore_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  NSObject *v58;
  NSObject *v59;
  void *v60;
  dispatch_time_t v61;
  void *v62;
  double v63;
  double v64;
  void *v65;
  void *v66;
  void *v67;
  NSObject *v68;
  void *v69;
  void *v70;
  id v71;
  id v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  NSObject *v78;
  objc_class *v79;
  void *v80;
  void *v81;
  void *v82;
  uint64_t (*v83)(uint64_t, uint64_t);
  objc_class *v85;
  void *v86;
  void *v87;
  objc_class *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  uint64_t (*v94)(uint64_t, uint64_t);
  void *v95;
  void *v96;
  const char *aSelector;
  void *v98;
  void *v99;
  _QWORD v102[4];
  NSObject *v103;
  _BYTE *v104;
  _QWORD *v105;
  _QWORD v106[5];
  id v107;
  id v108;
  id v109;
  _BYTE buf[24];
  uint64_t (*v111)(uint64_t, uint64_t);
  void (*v112)(uint64_t);
  id v113;
  _QWORD v114[2];
  _QWORD v115[2];
  uint64_t v116;
  void *v117;
  uint64_t v118;
  uint8_t v119[8];
  uint64_t v120;

  v120 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = v7;
  if (v7)
  {
    aSelector = a2;
    objc_msgSend(v7, "conversation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
      goto LABEL_5;
    objc_msgSend(v8, "conversation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "receiverHandles");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v8, "conversation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "receiverHandles");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "firstObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "primaryHandle");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
LABEL_5:
        v109 = 0;
        objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v8, 1, &v109);
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (uint64_t (*)(uint64_t, uint64_t))v109;
        v18 = v17;
        if (a5 && v17)
        {
          _rt_log_facility_get_os_log(RTLogFacilityWorkout);
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            v85 = (objc_class *)objc_opt_class();
            NSStringFromClass(v85);
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(aSelector);
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            *(_QWORD *)&buf[4] = v86;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v87;
            *(_WORD *)&buf[22] = 2112;
            v111 = v18;
            _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

          }
          v20 = 0;
          *a5 = objc_retainAutorelease(v18);
        }
        else
        {
          objc_msgSend(v99, "base64EncodedStringWithOptions:", 0);
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          v114[0] = CFSTR("payloadType");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v114[1] = CFSTR("data");
          v115[0] = v22;
          v115[1] = v96;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v115, v114, 2);
          v95 = (void *)objc_claimAutoreleasedReturnValue();

          v108 = 0;
          objc_msgSend(MEMORY[0x1E0CB36D8], "JSONStringFromNSDictionary:error:", v95, &v108);
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          v94 = (uint64_t (*)(uint64_t, uint64_t))v108;
          if (v94)
            v23 = a5 != 0;
          else
            v23 = 0;
          if (v23)
          {
            _rt_log_facility_get_os_log(RTLogFacilityWorkout);
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              v88 = (objc_class *)objc_opt_class();
              NSStringFromClass(v88);
              v89 = (void *)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(aSelector);
              v90 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              *(_QWORD *)&buf[4] = v89;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v90;
              *(_WORD *)&buf[22] = 2112;
              v111 = v94;
              _os_log_error_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

            }
            v20 = 0;
            *a5 = objc_retainAutorelease(v94);
          }
          else
          {
            v98 = (void *)objc_opt_new();
            objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("service"), CFSTR("iMessage"));
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v98, "addObject:", v33);

            objc_msgSend(v8, "conversation");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "receiverHandles");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "firstObject");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "primaryHandle");
            v37 = (void *)objc_claimAutoreleasedReturnValue();

            if (v37)
            {
              v38 = (void *)MEMORY[0x1E0CB39D8];
              objc_msgSend(v8, "conversation");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "receiverHandles");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "firstObject");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "primaryHandle");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "queryItemWithName:value:", CFSTR("recipient"), v42);
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v98, "addObject:", v43);

            }
            objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("appBundleID"), *MEMORY[0x1E0D8BBC8]);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v98, "addObject:", v44);

            objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("launchApp"), CFSTR("yes"));
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v98, "addObject:", v45);

            objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("appPayload"), v93);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v98, "addObject:", v46);

            if (objc_msgSend(v8, "sessionWorkoutType"))
            {
              objc_msgSend(v8, "conversation");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "receiverHandles");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "firstObject");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v49, "primaryHandle");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              v51 = v50 == 0;

              if (!v51)
              {
                *(_QWORD *)buf = 0;
                *(_QWORD *)&buf[8] = buf;
                *(_QWORD *)&buf[16] = 0x3032000000;
                v111 = __Block_byref_object_copy__102;
                v112 = __Block_byref_object_dispose__102;
                v113 = 0;
                v106[0] = 0;
                v106[1] = v106;
                v106[2] = 0x3032000000;
                v106[3] = __Block_byref_object_copy__102;
                v106[4] = __Block_byref_object_dispose__102;
                v107 = 0;
                v52 = dispatch_semaphore_create(0);
                -[SMSuggestionsManager contactsManager](self, "contactsManager");
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "conversation");
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v54, "receiverHandles");
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v55, "firstObject");
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v56, "primaryHandle");
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                v102[0] = MEMORY[0x1E0C809B0];
                v102[1] = 3221225472;
                v102[2] = __75__SMSuggestionsManager__getMessagesURLFromSessionConfig_payloadType_error___block_invoke;
                v102[3] = &unk_1E9296EE0;
                v104 = buf;
                v105 = v106;
                v58 = v52;
                v103 = v58;
                objc_msgSend(v53, "fetchContactsFromEmailOrPhoneNumberString:handler:", v57, v102);

                v59 = v58;
                objc_msgSend(MEMORY[0x1E0C99D68], "now");
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                v61 = dispatch_time(0, 3600000000000);
                if (dispatch_semaphore_wait(v59, v61))
                {
                  objc_msgSend(MEMORY[0x1E0C99D68], "now");
                  v62 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v62, "timeIntervalSinceDate:", v60);
                  v64 = v63;
                  v91 = (void *)objc_opt_new();
                  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_607);
                  v92 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
                  v65 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v65, "filteredArrayUsingPredicate:", v92);
                  v66 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v66, "firstObject");
                  v67 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v91, "submitToCoreAnalytics:type:duration:", v67, 1, v64);
                  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                  v68 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v68, OS_LOG_TYPE_FAULT))
                  {
                    *(_WORD *)v119 = 0;
                    _os_log_fault_impl(&dword_1D1A22000, v68, OS_LOG_TYPE_FAULT, "Invalid parameter not satisfying: authorizationManager", v119, 2u);
                  }

                  v69 = (void *)MEMORY[0x1E0CB35C8];
                  v118 = *MEMORY[0x1E0CB2D50];
                  *(_QWORD *)v119 = CFSTR("semaphore wait timeout");
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v119, &v118, 1);
                  v70 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v69, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v70);
                  v71 = (id)objc_claimAutoreleasedReturnValue();

                  if (v71)
                  {
                    v71 = objc_retainAutorelease(v71);

                  }
                }
                else
                {
                  v71 = 0;
                }

                v72 = v71;
                if (objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "count"))
                {
                  v73 = (void *)MEMORY[0x1E0CB39D8];
                  objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "firstObject");
                  v74 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v74, "givenName");
                  v75 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v73, "queryItemWithName:value:", CFSTR("givenName"), v75);
                  v76 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v98, "addObject:", v76);

                }
                _Block_object_dispose(v106, 8);

                _Block_object_dispose(buf, 8);
              }
            }
            v77 = objc_alloc_init(MEMORY[0x1E0CB3998]);
            objc_msgSend(v77, "setScheme:", CFSTR("sms-private"));
            objc_msgSend(v77, "setPath:", CFSTR("open"));
            objc_msgSend(v77, "setQueryItems:", v98);
            _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
            v78 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
            {
              v79 = (objc_class *)objc_opt_class();
              NSStringFromClass(v79);
              v80 = (void *)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(aSelector);
              v81 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v77, "URL");
              v82 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v82, "absoluteString");
              v83 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              *(_QWORD *)&buf[4] = v80;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v81;
              *(_WORD *)&buf[22] = 2112;
              v111 = v83;
              _os_log_impl(&dword_1D1A22000, v78, OS_LOG_TYPE_INFO, "%@, %@, url, %@", buf, 0x20u);

            }
            if (a5)
              *a5 = 0;
            objc_msgSend(v77, "URL");
            v20 = (void *)objc_claimAutoreleasedReturnValue();

          }
        }

        v32 = 0;
        goto LABEL_46;
      }
    }
    else
    {

    }
    v25 = (void *)MEMORY[0x1E0CB35C8];
    v116 = *MEMORY[0x1E0CB2D50];
    v26 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v8, "conversation");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "receiverHandles");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "firstObject");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "stringWithFormat:", CFSTR("config has invalid handle information , %@"), v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v117 = v30;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v117, &v116, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v31);
    v32 = (id)objc_claimAutoreleasedReturnValue();

    if (a5)
    {
      v32 = objc_retainAutorelease(v32);
      v20 = 0;
      *a5 = v32;
    }
    else
    {
      v20 = 0;
    }
LABEL_46:

    goto LABEL_47;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: sessionConfig", buf, 2u);
  }

  if (a5)
  {
    _RTErrorInvalidParameterCreate((uint64_t)CFSTR("sessionConfig"));
    v20 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0;
  }
LABEL_47:

  return v20;
}

void __75__SMSuggestionsManager__getMessagesURLFromSessionConfig_payloadType_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_getSMContactInformationFromSMHandle:(id)a3 error:(id *)a4
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  int v17;
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v17 = 136315394;
      v18 = "-[SMSuggestionsManager _getSMContactInformationFromSMHandle:error:]";
      v19 = 1024;
      v20 = 4541;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handle (in %s:%d)", (uint8_t *)&v17, 0x12u);
    }

  }
  v6 = (void *)MEMORY[0x1E0D8B960];
  objc_msgSend(v4, "primaryHandle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "getSMHandleTypeWithHandle:", v7);

  if (v8 == 1)
  {
    v14 = objc_alloc(MEMORY[0x1E0D8B910]);
    objc_msgSend(v4, "primaryHandle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v14;
    v12 = 0;
    v13 = v10;
  }
  else
  {
    if (v8 != 2)
    {
      v15 = 0;
      goto LABEL_11;
    }
    v9 = objc_alloc(MEMORY[0x1E0D8B910]);
    objc_msgSend(v4, "primaryHandle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v9;
    v12 = v10;
    v13 = 0;
  }
  v15 = (void *)objc_msgSend(v11, "initWithEmail:phoneNumber:", v12, v13);

LABEL_11:
  return v15;
}

- (id)_getSessionConfigurationsWithOptions:(id)a3 error:(id *)a4
{
  id v7;
  dispatch_semaphore_t v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  dispatch_time_t v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  NSObject *v28;
  objc_class *v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  id v36;
  NSObject *v37;
  void *v38;
  objc_class *v40;
  id v41;
  void *v42;
  const char *aSelector;
  _QWORD v44[4];
  NSObject *v45;
  uint64_t *v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;
  _BYTE buf[12];
  __int16 v61;
  id v62;
  __int16 v63;
  id v64;
  __int16 v65;
  uint64_t v66;
  __int16 v67;
  uint64_t v68;
  __int16 v69;
  uint64_t v70;
  _QWORD v71[4];

  v71[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (v7)
  {
    aSelector = a2;
    v54 = 0;
    v55 = &v54;
    v56 = 0x3032000000;
    v57 = __Block_byref_object_copy__102;
    v58 = __Block_byref_object_dispose__102;
    v59 = 0;
    v48 = 0;
    v49 = &v48;
    v50 = 0x3032000000;
    v51 = __Block_byref_object_copy__102;
    v52 = __Block_byref_object_dispose__102;
    v53 = 0;
    v8 = dispatch_semaphore_create(0);
    -[SMSuggestionsManager suggestionsHelper](self, "suggestionsHelper");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __67__SMSuggestionsManager__getSessionConfigurationsWithOptions_error___block_invoke;
    v44[3] = &unk_1E9296EE0;
    v46 = &v54;
    v47 = &v48;
    v10 = v8;
    v45 = v10;
    objc_msgSend(v9, "getSessionConfigurationsWithOptions:handler:", v7, v44);

    v11 = v10;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v11, v13))
      goto LABEL_7;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSinceDate:", v12);
    v16 = v15;
    v17 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_607);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "filteredArrayUsingPredicate:", v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "firstObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "submitToCoreAnalytics:type:duration:", v21, 1, v16);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_FAULT, "Invalid parameter not satisfying: authorizationManager", buf, 2u);
    }

    v23 = (void *)MEMORY[0x1E0CB35C8];
    v71[0] = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)buf = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v71, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      v26 = objc_retainAutorelease(v25);

    }
    else
    {
LABEL_7:
      v26 = 0;
    }

    v27 = v26;
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      v29 = (objc_class *)objc_opt_class();
      NSStringFromClass(v29);
      v30 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(aSelector);
      v31 = (id)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend((id)v55[5], "count");
      v33 = v55[5];
      v34 = v49[5];
      *(_DWORD *)buf = 138413570;
      *(_QWORD *)&buf[4] = v30;
      v61 = 2112;
      v62 = v31;
      v63 = 2112;
      v64 = v7;
      v65 = 2048;
      v66 = v32;
      v67 = 2112;
      v68 = v33;
      v69 = 2112;
      v70 = v34;
      _os_log_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_INFO, "%@, %@, options, %@, session configurations count, %lu, fetched session configurations, %@, fetch error, %@", buf, 0x3Eu);

    }
    if (a4 && v27)
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        v40 = (objc_class *)objc_opt_class();
        NSStringFromClass(v40);
        v41 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v41;
        v61 = 2112;
        v62 = v42;
        v63 = 2112;
        v64 = v27;
        _os_log_error_impl(&dword_1D1A22000, v35, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

      }
      *a4 = objc_retainAutorelease(v27);
      objc_msgSend(MEMORY[0x1E0C99D20], "array");
      v36 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (a4)
        *a4 = objc_retainAutorelease((id)v49[5]);
      v36 = (id)v55[5];
    }
    v38 = v36;

    _Block_object_dispose(&v48, 8);
    _Block_object_dispose(&v54, 8);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[SMSuggestionsManager _getSessionConfigurationsWithOptions:error:]";
      v61 = 1024;
      LODWORD(v62) = 4561;
      _os_log_error_impl(&dword_1D1A22000, v37, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: options (in %s:%d)", buf, 0x12u);
    }

    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v38;
}

void __67__SMSuggestionsManager__getSessionConfigurationsWithOptions_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)_refreshCurrentLocationWithError:(id *)a3
{
  dispatch_semaphore_t v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  dispatch_time_t v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  BOOL v25;
  void *context;
  _QWORD v28[4];
  NSObject *v29;
  uint64_t *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;
  id *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;
  uint8_t buf[16];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v38 = 0;
  v39 = (id *)&v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__102;
  v42 = __Block_byref_object_dispose__102;
  v43 = 0;
  context = (void *)MEMORY[0x1D8231EA8](self, a2);
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__102;
  v36 = __Block_byref_object_dispose__102;
  v37 = 0;
  v5 = dispatch_semaphore_create(0);
  -[SMSuggestionsManager suggestionsHelper](self, "suggestionsHelper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __57__SMSuggestionsManager__refreshCurrentLocationWithError___block_invoke;
  v28[3] = &unk_1E92A1618;
  v30 = &v38;
  v31 = &v32;
  v7 = v5;
  v29 = v7;
  objc_msgSend(v6, "refreshCurrentLocationWithHandler:", v28);

  v8 = v7;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v8, v10))
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeIntervalSinceDate:", v9);
  v13 = v12;
  v14 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_607);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "filteredArrayUsingPredicate:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "firstObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "submitToCoreAnalytics:type:duration:", v18, 1, v13);
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_FAULT, "Invalid parameter not satisfying: authorizationManager", buf, 2u);
  }

  v20 = (void *)MEMORY[0x1E0CB35C8];
  v44 = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)buf = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v44, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    v23 = objc_retainAutorelease(v22);

  }
  else
  {
LABEL_6:
    v23 = 0;
  }

  v24 = v23;
  -[SMSuggestionsManager setLatestLocationOfTheDevice:](self, "setLatestLocationOfTheDevice:", v33[5]);

  _Block_object_dispose(&v32, 8);
  objc_autoreleasePoolPop(context);
  if (v24)
    objc_storeStrong(v39 + 5, v23);
  if (a3)
    *a3 = objc_retainAutorelease(v39[5]);
  v25 = v39[5] == 0;

  _Block_object_dispose(&v38, 8);
  return v25;
}

void __57__SMSuggestionsManager__refreshCurrentLocationWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  v9 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;
  v8 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_getNPLOIsToHomeWithOnlyHighConfidence:(BOOL)a3 location:(id)a4 date:(id)a5 error:(id *)a6
{
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  objc_class *v17;
  void *v18;
  void *v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v20 = 0;
  -[SMSuggestionsManager _getNPLOIsWithOnlyHighConfidence:location:date:error:](self, "_getNPLOIsWithOnlyHighConfidence:location:date:error:", a3, a4, a5, &v20);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v20;
  v10 = v9;
  if (a6 && v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v22 = v18;
      v23 = 2112;
      v24 = v19;
      v25 = 2112;
      v26 = v10;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

    }
    *a6 = objc_retainAutorelease(v10);
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_264);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "filteredArrayUsingPredicate:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (a6)
      *a6 = objc_retainAutorelease(v10);
    v12 = v14;
    v8 = v12;
  }
  v15 = v12;

  return v15;
}

BOOL __83__SMSuggestionsManager__getNPLOIsToHomeWithOnlyHighConfidence_location_date_error___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "locationOfInterest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "type") == 0;

  return v3;
}

- (id)_getNPLOIsWithOnlyHighConfidence:(BOOL)a3 location:(id)a4 date:(id)a5 error:(id *)a6
{
  id v8;
  dispatch_semaphore_t v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  dispatch_time_t v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  objc_class *v40;
  id v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const __CFString *v46;
  void *v47;
  objc_class *v49;
  id v50;
  void *v51;
  uint64_t v52;
  objc_class *v53;
  id v54;
  void *v55;
  const char *aSelector;
  const char *aSelectora;
  _BOOL4 v58;
  void *v59;
  id v60;
  _QWORD v62[4];
  NSObject *v63;
  uint64_t *v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t (*v69)(uint64_t, uint64_t);
  void (*v70)(uint64_t);
  id v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t (*v75)(uint64_t, uint64_t);
  void (*v76)(uint64_t);
  id v77;
  _BYTE buf[12];
  __int16 v79;
  id v80;
  __int16 v81;
  uint64_t v82;
  __int16 v83;
  uint64_t v84;
  __int16 v85;
  const __CFString *v86;
  __int16 v87;
  uint64_t v88;
  __int16 v89;
  void *v90;
  _QWORD v91[4];

  v58 = a3;
  aSelector = a2;
  v91[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v60 = a5;
  v72 = 0;
  v73 = &v72;
  v74 = 0x3032000000;
  v75 = __Block_byref_object_copy__102;
  v76 = __Block_byref_object_dispose__102;
  v77 = 0;
  v9 = dispatch_semaphore_create(0);
  v66 = 0;
  v67 = &v66;
  v68 = 0x3032000000;
  v69 = __Block_byref_object_copy__102;
  v70 = __Block_byref_object_dispose__102;
  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v71 = (id)objc_claimAutoreleasedReturnValue();
  -[SMSuggestionsManager deviceLocationPredictor](self, "deviceLocationPredictor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v62[0] = MEMORY[0x1E0C809B0];
  v62[1] = 3221225472;
  v62[2] = __77__SMSuggestionsManager__getNPLOIsWithOnlyHighConfidence_location_date_error___block_invoke;
  v62[3] = &unk_1E9296EE0;
  v64 = &v66;
  v65 = &v72;
  v11 = v9;
  v63 = v11;
  objc_msgSend(v10, "fetchNextPredictedLocationsOfInterestFromLocation:startDate:timeInterval:handler:", v8, v60, v62, 3600.0);
  v59 = v8;

  v12 = v11;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v12, v14))
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0C99D68], "now", aSelector);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "timeIntervalSinceDate:", v13);
  v17 = v16;
  v18 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_607);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "filteredArrayUsingPredicate:", v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "firstObject");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "submitToCoreAnalytics:type:duration:", v22, 1, v17);
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_FAULT, "Invalid parameter not satisfying: authorizationManager", buf, 2u);
  }

  v24 = (void *)MEMORY[0x1E0CB35C8];
  v91[0] = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)buf = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v91, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    v27 = objc_retainAutorelease(v26);

  }
  else
  {
LABEL_6:
    v27 = 0;
  }

  v28 = v27;
  v29 = v28;
  if (a6)
  {
    if (v73[5])
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v49 = (objc_class *)objc_opt_class();
        NSStringFromClass(v49);
        v50 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = v73[5];
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v50;
        v79 = 2112;
        v80 = v51;
        v81 = 2112;
        v82 = v52;
        _os_log_error_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

      }
      v31 = (void *)v73[5];
LABEL_16:
      *a6 = objc_retainAutorelease(v31);
      objc_msgSend(MEMORY[0x1E0C99D20], "array");
      v33 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_27;
    }
    if (v28)
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        v53 = (objc_class *)objc_opt_class();
        NSStringFromClass(v53);
        v54 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v54;
        v79 = 2112;
        v80 = v55;
        v81 = 2112;
        v82 = (uint64_t)v29;
        _os_log_error_impl(&dword_1D1A22000, v32, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

      }
      v31 = v29;
      goto LABEL_16;
    }
  }
  v34 = (void *)v67[5];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_266, aSelector);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "filteredArrayUsingPredicate:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_268);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "filteredArrayUsingPredicate:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v39 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
  {
    v40 = (objc_class *)objc_opt_class();
    NSStringFromClass(v40);
    v41 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(aSelectora);
    v42 = (id)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend((id)v67[5], "count");
    v44 = objc_msgSend(v36, "count");
    v45 = objc_msgSend(v38, "count");
    v46 = CFSTR("NO");
    *(_DWORD *)buf = 138413826;
    *(_QWORD *)&buf[4] = v41;
    v79 = 2112;
    if (v58)
      v46 = CFSTR("YES");
    v80 = v42;
    v81 = 2048;
    v82 = v43;
    v83 = 2048;
    v84 = v44;
    v85 = 2112;
    v86 = v46;
    v87 = 2048;
    v88 = v45;
    v89 = 2112;
    v90 = v59;
    _os_log_impl(&dword_1D1A22000, v39, OS_LOG_TYPE_INFO, "%@, %@, nplois fetched count, %lu, nploisWithoutOnlyVehicleSource count, %lu, only high confidence, %@, nploisWithOnlyHighConfidenceAndWithoutOnlyVehicleSource, %lu, w.r.t the location, %@", buf, 0x48u);

  }
  if (v58)
    v47 = v38;
  else
    v47 = v36;
  if (a6)
    *a6 = objc_retainAutorelease((id)v73[5]);
  v33 = v47;

LABEL_27:
  _Block_object_dispose(&v66, 8);

  _Block_object_dispose(&v72, 8);
  return v33;
}

void __77__SMSuggestionsManager__getNPLOIsWithOnlyHighConfidence_location_date_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __77__SMSuggestionsManager__getNPLOIsWithOnlyHighConfidence_location_date_error___block_invoke_265(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;

  v2 = a2;
  objc_msgSend(v2, "sources");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") == 1)
  {
    objc_msgSend(v2, "sources");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v6 = objc_opt_isKindOfClass() ^ 1;

  }
  else
  {
    v6 = 1;
  }

  return v6 & 1;
}

BOOL __77__SMSuggestionsManager__getNPLOIsWithOnlyHighConfidence_location_date_error___block_invoke_2(uint64_t a1, void *a2)
{
  double v2;

  objc_msgSend(a2, "confidence");
  return v2 == 1.0;
}

- (id)_getSunriseDateAtLocation:(id)a3 date:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  NSObject *v22;
  objc_class *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: location", buf, 2u);
    }

    if (a5)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("location"));
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  v11 = (void *)MEMORY[0x1D8231EA8]();
  v12 = objc_alloc_init(MEMORY[0x1E0D26ED0]);
  objc_msgSend(v8, "latitude");
  v14 = v13;
  objc_msgSend(v8, "longitude");
  v16 = v15;
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "components:fromDate:", 60, v9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setHour:", 3);
  objc_msgSend(v17, "dateFromComponents:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "timeIntervalSinceReferenceDate");
  objc_msgSend(v12, "calculateAstronomicalTimeForLocation:time:", v14, v16, v20);
  objc_msgSend(v12, "sunrise");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (id)objc_msgSend(v21, "copy");

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringFromDate");
    v30 = v11;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "stringFromDate");
    v27 = v9;
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v33 = v24;
    v34 = 2112;
    v35 = v25;
    v36 = 2112;
    v37 = v8;
    v38 = 2112;
    v39 = v26;
    v40 = 2112;
    v41 = v28;
    _os_log_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_INFO, "%@, %@, location, %@, third hour of today, %@, sunrise date, %@", buf, 0x34u);

    v9 = v27;
    v11 = v30;

  }
  objc_autoreleasePoolPop(v11);

  return v31;
}

- (id)_getSunsetDateAtLocation:(id)a3 date:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  NSObject *v22;
  objc_class *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: location", buf, 2u);
    }

    if (a5)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("location"));
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  v11 = (void *)MEMORY[0x1D8231EA8]();
  v12 = objc_alloc_init(MEMORY[0x1E0D26ED0]);
  objc_msgSend(v8, "latitude");
  v14 = v13;
  objc_msgSend(v8, "longitude");
  v16 = v15;
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "components:fromDate:", 60, v9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setHour:", 5);
  objc_msgSend(v17, "dateFromComponents:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "timeIntervalSinceReferenceDate");
  objc_msgSend(v12, "calculateAstronomicalTimeForLocation:time:", v14, v16, v20);
  objc_msgSend(v12, "sunset");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (id)objc_msgSend(v21, "copy");

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringFromDate");
    v30 = v11;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "stringFromDate");
    v27 = v9;
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v33 = v24;
    v34 = 2112;
    v35 = v25;
    v36 = 2112;
    v37 = v8;
    v38 = 2112;
    v39 = v26;
    v40 = 2112;
    v41 = v28;
    _os_log_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_INFO, "%@, %@, location, %@, fifth hour of today, %@, sunset date, %@", buf, 0x34u);

    v9 = v27;
    v11 = v30;

  }
  objc_autoreleasePoolPop(v11);

  return v31;
}

- (BOOL)_isValidForNextTimePrompt
{
  return 0;
}

+ (int64_t)periodicPurgePolicy
{
  return 2;
}

- (void)performPurgeOfType:(int64_t)a3 referenceDate:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  int64_t v16;

  v8 = a4;
  v9 = a5;
  -[RTNotifier queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __68__SMSuggestionsManager_performPurgeOfType_referenceDate_completion___block_invoke;
  v13[3] = &unk_1E9297590;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a3;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

void __68__SMSuggestionsManager_performPurgeOfType_referenceDate_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;

  if (*(_QWORD *)(a1 + 56))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "suggestionsStore");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = *(void **)(a1 + 40);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __68__SMSuggestionsManager_performPurgeOfType_referenceDate_completion___block_invoke_2;
    v4[3] = &unk_1E9299358;
    v5 = v3;
    v6 = *(id *)(a1 + 48);
    objc_msgSend(v2, "deleteSuggestionsPredating:handler:", v5, v4);

  }
}

void __68__SMSuggestionsManager_performPurgeOfType_referenceDate_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138412546;
    v7 = v5;
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "purge entries from the suggestion store predating, %@, error, %@", (uint8_t *)&v6, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (SMSuggestionsMetricsManager)suggestionsMetricsManager
{
  return self->_suggestionsMetricsManager;
}

- (void)setSuggestionsMetricsManager:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionsMetricsManager, a3);
}

- (RTXPCTimerAlarm)walkingTriggerAlarm
{
  return self->_walkingTriggerAlarm;
}

- (void)setWalkingTriggerAlarm:(id)a3
{
  objc_storeStrong((id *)&self->_walkingTriggerAlarm, a3);
}

- (id)pedometerDataHandler
{
  return self->_pedometerDataHandler;
}

- (void)setPedometerDataHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDate)pedometerStartDate
{
  return self->_pedometerStartDate;
}

- (void)setPedometerStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_pedometerStartDate, a3);
}

- (NSMutableSet)pedometerUUIDs
{
  return self->_pedometerUUIDs;
}

- (void)setPedometerUUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_pedometerUUIDs, a3);
}

- (RTMotionActivityPedometerData)previousPedometerData
{
  return self->_previousPedometerData;
}

- (void)setPreviousPedometerData:(id)a3
{
  objc_storeStrong((id *)&self->_previousPedometerData, a3);
}

- (BOOL)isPedometerNotificationsSetupAfterRoutineStarted
{
  return self->_isPedometerNotificationsSetupAfterRoutineStarted;
}

- (void)setIsPedometerNotificationsSetupAfterRoutineStarted:(BOOL)a3
{
  self->_isPedometerNotificationsSetupAfterRoutineStarted = a3;
}

- (RTAuthorizationManager)authorizationManager
{
  return self->_authorizationManager;
}

- (RTContactsManager)contactsManager
{
  return self->_contactsManager;
}

- (RTDarwinNotificationHelper)notificationHelper
{
  return self->_notificationHelper;
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (RTDeviceLocationPredictor)deviceLocationPredictor
{
  return self->_deviceLocationPredictor;
}

- (RTDistanceCalculator)distanceCalculator
{
  return self->_distanceCalculator;
}

- (RTHealthKitManager)healthKitManager
{
  return self->_healthKitManager;
}

- (RTLearnedLocationStore)learnedLocationStore
{
  return self->_learnedLocationStore;
}

- (RTLearnedLocationManager)learnedLocationManager
{
  return self->_learnedLocationManager;
}

- (RTLocationManager)locationManager
{
  return self->_locationManager;
}

- (RTMapServiceManager)mapServiceManager
{
  return self->_mapServiceManager;
}

- (SMMessagingService)messagingService
{
  return self->_messagingService;
}

- (RTMotionActivityManager)motionActivityManager
{
  return self->_motionActivityManager;
}

- (RTNavigationManager)navigationManager
{
  return self->_navigationManager;
}

- (RTPlatform)platform
{
  return self->_platform;
}

- (SMEligibilityChecker)eligibilityChecker
{
  return self->_eligibilityChecker;
}

- (SMSessionStore)sessionStore
{
  return self->_sessionStore;
}

- (SMSuggestionsStore)suggestionsStore
{
  return self->_suggestionsStore;
}

- (RTVisitManager)visitManager
{
  return self->_visitManager;
}

- (RTLocation)latestLocationOfTheDevice
{
  return self->_latestLocationOfTheDevice;
}

- (void)setLatestLocationOfTheDevice:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (RTLearnedLocationOfInterest)currentLOI
{
  return self->_currentLOI;
}

- (void)setCurrentLOI:(id)a3
{
  objc_storeStrong((id *)&self->_currentLOI, a3);
}

- (SMSuggestionsHelper)suggestionsHelper
{
  return self->_suggestionsHelper;
}

- (BOOL)routineEnabled
{
  return self->_routineEnabled;
}

- (void)setRoutineEnabled:(BOOL)a3
{
  self->_routineEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionsHelper, 0);
  objc_storeStrong((id *)&self->_currentLOI, 0);
  objc_storeStrong((id *)&self->_latestLocationOfTheDevice, 0);
  objc_storeStrong((id *)&self->_visitManager, 0);
  objc_storeStrong((id *)&self->_suggestionsStore, 0);
  objc_storeStrong((id *)&self->_sessionStore, 0);
  objc_storeStrong((id *)&self->_eligibilityChecker, 0);
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_navigationManager, 0);
  objc_storeStrong((id *)&self->_motionActivityManager, 0);
  objc_storeStrong((id *)&self->_messagingService, 0);
  objc_storeStrong((id *)&self->_mapServiceManager, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_learnedLocationManager, 0);
  objc_storeStrong((id *)&self->_learnedLocationStore, 0);
  objc_storeStrong((id *)&self->_healthKitManager, 0);
  objc_storeStrong((id *)&self->_distanceCalculator, 0);
  objc_storeStrong((id *)&self->_deviceLocationPredictor, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_notificationHelper, 0);
  objc_storeStrong((id *)&self->_contactsManager, 0);
  objc_storeStrong((id *)&self->_authorizationManager, 0);
  objc_storeStrong((id *)&self->_previousPedometerData, 0);
  objc_storeStrong((id *)&self->_pedometerUUIDs, 0);
  objc_storeStrong((id *)&self->_pedometerStartDate, 0);
  objc_storeStrong(&self->_pedometerDataHandler, 0);
  objc_storeStrong((id *)&self->_walkingTriggerAlarm, 0);
  objc_storeStrong((id *)&self->_suggestionsMetricsManager, 0);
}

@end
