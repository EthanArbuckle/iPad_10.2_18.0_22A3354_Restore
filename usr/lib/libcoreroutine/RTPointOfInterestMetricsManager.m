@implementation RTPointOfInterestMetricsManager

uint64_t __65__RTPointOfInterestMetricsManager_onLeechedLocationNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onLeechedLocationNotification:", *(_QWORD *)(a1 + 40));
}

- (void)_onLeechedLocationNotification:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  __int16 v16;
  unint64_t v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTLocationManagerNotificationLocationsLeeched, "notificationName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if (v8)
  {
    objc_msgSend(v5, "leechedLocations");
    v9 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject count](v9, "count"))
    {
      _rt_log_facility_get_os_log(RTLogFacilityMetric);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(a2);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject lastObject](v9, "lastObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138412546;
        v15 = v11;
        v16 = 2048;
        v17 = objc_msgSend(v12, "signalEnvironmentType");
        _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "%@, update current signal environment type, %lu", (uint8_t *)&v14, 0x16u);

      }
      -[NSObject lastObject](v9, "lastObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTPointOfInterestMetricsManager setCurrentSignalEnvironmentType:](self, "setCurrentSignalEnvironmentType:", objc_msgSend(v13, "signalEnvironmentType"));

    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v14 = 138412802;
      v15 = v5;
      v16 = 2080;
      v17 = (unint64_t)"-[RTPointOfInterestMetricsManager _onLeechedLocationNotification:]";
      v18 = 1024;
      v19 = 629;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "unhandled notification, %@ (in %s:%d)", (uint8_t *)&v14, 0x1Cu);
    }
  }

}

- (void)setCurrentSignalEnvironmentType:(int)a3
{
  self->_currentSignalEnvironmentType = a3;
}

- (void)onLeechedLocationNotification:(id)a3
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
  v7[2] = __65__RTPointOfInterestMetricsManager_onLeechedLocationNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (RTPointOfInterestMetricsManager)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithBatteryManager_defaultsManager_distanceCalculator_learnedLocationStore_locationManager_mapServiceManager_navigationManager_placeInferenceQueryStore_pointOfInterestSampler_scenarioTriggerManager_timerManager_visitManager_);
}

- (RTPointOfInterestMetricsManager)initWithBatteryManager:(id)a3 defaultsManager:(id)a4 distanceCalculator:(id)a5 learnedLocationStore:(id)a6 locationManager:(id)a7 mapServiceManager:(id)a8 navigationManager:(id)a9 placeInferenceQueryStore:(id)a10 pointOfInterestSampler:(id)a11 scenarioTriggerManager:(id)a12 timerManager:(id)a13 visitManager:(id)a14
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  RTPointOfInterestMetricsManager *v29;
  RTPointOfInterestMetricsManager *v30;
  uint64_t v31;
  NSMutableArray *locationDenyList;
  RTTimer *samplingTimer;
  RTMapItem *navigationDestination;
  RTPointOfInterestMetricsManager *v35;
  NSObject *v36;
  void *v37;
  NSObject *v38;
  const char *v39;
  NSObject *v41;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  void *v50;
  id v52;
  id v53;
  id v54;
  objc_super v55;
  uint8_t buf[16];

  v54 = a3;
  v43 = a4;
  v19 = a4;
  v44 = a5;
  v49 = a5;
  v45 = a6;
  v48 = a6;
  v46 = a7;
  v20 = a7;
  v47 = a8;
  v21 = a8;
  v22 = a9;
  v23 = a10;
  v24 = a11;
  v53 = a12;
  v52 = a13;
  v25 = a14;
  v50 = v25;
  if (!v54)
  {
    v26 = v19;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v36, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: batteryManager", buf, 2u);
    }

    v35 = 0;
    v37 = 0;
    v27 = v48;
    v28 = v49;
    goto LABEL_42;
  }
  v26 = v19;
  if (!v19)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v38 = objc_claimAutoreleasedReturnValue();
    v27 = v48;
    v28 = v49;
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      goto LABEL_40;
    *(_WORD *)buf = 0;
    v39 = "Invalid parameter not satisfying: defaultsManager";
LABEL_39:
    _os_log_error_impl(&dword_1D1A22000, v38, OS_LOG_TYPE_ERROR, v39, buf, 2u);
    goto LABEL_40;
  }
  v27 = v48;
  v28 = v49;
  if (!v49)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v38 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      goto LABEL_40;
    *(_WORD *)buf = 0;
    v39 = "Invalid parameter not satisfying: distanceCalculator";
    goto LABEL_39;
  }
  if (!v48)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v38 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      goto LABEL_40;
    *(_WORD *)buf = 0;
    v39 = "Invalid parameter not satisfying: learnedLocationStore";
    goto LABEL_39;
  }
  if (!v20)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v38 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      goto LABEL_40;
    *(_WORD *)buf = 0;
    v39 = "Invalid parameter not satisfying: locationManager";
    goto LABEL_39;
  }
  if (!v21)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v38 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      goto LABEL_40;
    *(_WORD *)buf = 0;
    v39 = "Invalid parameter not satisfying: mapServiceManager";
    goto LABEL_39;
  }
  if (!v22)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v38 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      goto LABEL_40;
    *(_WORD *)buf = 0;
    v39 = "Invalid parameter not satisfying: navigationManager";
    goto LABEL_39;
  }
  if (!v23)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v38 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      goto LABEL_40;
    *(_WORD *)buf = 0;
    v39 = "Invalid parameter not satisfying: placeInferenceQueryStore";
    goto LABEL_39;
  }
  if (!v24)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v38 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      goto LABEL_40;
    *(_WORD *)buf = 0;
    v39 = "Invalid parameter not satisfying: pointOfInterestSampler";
    goto LABEL_39;
  }
  if (!v53)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v38 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      goto LABEL_40;
    *(_WORD *)buf = 0;
    v39 = "Invalid parameter not satisfying: scenarioTriggerManager";
    goto LABEL_39;
  }
  if (!v52)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v39 = "Invalid parameter not satisfying: timerManger";
      goto LABEL_39;
    }
LABEL_40:

    v35 = 0;
LABEL_41:
    v37 = v54;
    goto LABEL_42;
  }
  if (v25)
  {
    v55.receiver = self;
    v55.super_class = (Class)RTPointOfInterestMetricsManager;
    v29 = -[RTNotifier init](&v55, sel_init);
    v30 = v29;
    if (v29)
    {
      objc_storeStrong((id *)&v29->_batteryManager, a3);
      objc_storeStrong((id *)&v30->_defaultsManager, v43);
      objc_storeStrong((id *)&v30->_distanceCalculator, v44);
      objc_storeStrong((id *)&v30->_learnedLocationStore, v45);
      objc_storeStrong((id *)&v30->_locationManager, v46);
      objc_storeStrong((id *)&v30->_mapServiceManager, v47);
      objc_storeStrong((id *)&v30->_navigationManager, a9);
      objc_storeStrong((id *)&v30->_placeInferenceQueryStore, a10);
      objc_storeStrong((id *)&v30->_pointOfInterestSampler, a11);
      objc_storeStrong((id *)&v30->_scenarioTriggerManager, a12);
      objc_storeStrong((id *)&v30->_timerManager, a13);
      objc_storeStrong((id *)&v30->_visitManager, a14);
      v31 = objc_opt_new();
      locationDenyList = v30->_locationDenyList;
      v30->_locationDenyList = (NSMutableArray *)v31;

      v30->_samplingPointOfInterest = 0;
      v30->_settledState = 0;
      samplingTimer = v30->_samplingTimer;
      v30->_samplingTimer = 0;

      v30->_currentSignalEnvironmentType = 0;
      navigationDestination = v30->_navigationDestination;
      v30->_navigationDestination = 0;

    }
    -[RTService setup](v30, "setup");
    v35 = v30;
    self = v35;
    goto LABEL_41;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v41 = objc_claimAutoreleasedReturnValue();
  v37 = v54;
  if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v41, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: visitManager", buf, 2u);
  }

  v35 = 0;
LABEL_42:

  return v35;
}

- (void)_setup
{
  void *v4;
  int v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  int IsEventUsed;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  const __CFString *v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D64EE0], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "optInApple");

  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = objc_alloc(MEMORY[0x1E0CB3940]);
  v8 = (void *)objc_msgSend(v7, "initWithCString:encoding:", RTAnalyticsEventBluePoiMetrics, 1);
  objc_msgSend(v6, "stringWithFormat:", CFSTR("com.apple.%@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  IsEventUsed = AnalyticsIsEventUsed();

  _rt_log_facility_get_os_log(RTLogFacilityMetric);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    v14 = CFSTR("NO");
    if (v5)
      v15 = CFSTR("YES");
    else
      v15 = CFSTR("NO");
    *(_DWORD *)buf = 138412802;
    v17 = v12;
    v19 = v15;
    v18 = 2112;
    if (IsEventUsed)
      v14 = CFSTR("YES");
    v20 = 2112;
    v21 = v14;
    _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "%@, optInApple, %@, sampled, %@", buf, 0x20u);

  }
  if ((v5 & IsEventUsed) == 1)
    -[RTPointOfInterestMetricsManager _registerForNotifications](self, "_registerForNotifications");
}

- (void)_registerForNotifications
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[RTPointOfInterestMetricsManager navigationManager](self, "navigationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTNavigationManagerNavigationStateNotification, "notificationName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:", self, sel_onNavigationNotification_, v4);

  -[RTPointOfInterestMetricsManager navigationManager](self, "navigationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTNavigationManagerRouteSummaryNotification, "notificationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:", self, sel_onNavigationNotification_, v6);

  -[RTPointOfInterestMetricsManager learnedLocationStore](self, "learnedLocationStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTStoreNotificationAvailabilityDidChange, "notificationName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:", self, sel_onLearnedLocationStoreNotification_, v8);

  -[RTPointOfInterestMetricsManager locationManager](self, "locationManager");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTLocationManagerNotificationLocationsLeeched, "notificationName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObserver:selector:name:", self, sel_onLeechedLocationNotification_, v9);

}

- (void)shutdownWithHandler:(id)a3
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
  v7[2] = __55__RTPointOfInterestMetricsManager_shutdownWithHandler___block_invoke;
  v7[3] = &unk_1E9297650;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __55__RTPointOfInterestMetricsManager_shutdownWithHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_shutdown");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

- (void)_shutdown
{
  NSObject *v4;
  void *v5;
  RTTimer *samplingTimer;
  int v7;
  void *v8;
  __int16 v9;
  RTPointOfInterestMetricsManager *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityMetric);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412546;
    v8 = v5;
    v9 = 2112;
    v10 = self;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "%@ %@", (uint8_t *)&v7, 0x16u);

  }
  -[RTTimer invalidate](self->_samplingTimer, "invalidate");
  samplingTimer = self->_samplingTimer;
  self->_samplingTimer = 0;

  -[RTPointOfInterestMetricsManager _unRegisterForNotifications](self, "_unRegisterForNotifications");
}

- (void)_unRegisterForNotifications
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
  id v12;

  -[RTPointOfInterestMetricsManager navigationManager](self, "navigationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTNavigationManagerNavigationStateNotification, "notificationName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:fromNotification:", self, v4);

  -[RTPointOfInterestMetricsManager scenarioTriggerManager](self, "scenarioTriggerManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTScenarioTriggerManagerNotificationSettled, "notificationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:fromNotification:", self, v6);

  -[RTPointOfInterestMetricsManager scenarioTriggerManager](self, "scenarioTriggerManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTScenarioTriggerManagerNotificationUnsettled, "notificationName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:fromNotification:", self, v8);

  -[RTPointOfInterestMetricsManager visitManager](self, "visitManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTVisitManagerVisitIncidentNotification, "notificationName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObserver:fromNotification:", self, v10);

  -[RTPointOfInterestMetricsManager locationManager](self, "locationManager");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTLocationManagerNotificationLocationsLeeched, "notificationName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeObserver:fromNotification:", self, v11);

}

- (void)setSamplingPointOfInterest:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
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
  objc_class *v38;
  void *v39;
  _QWORD v40[6];
  uint8_t buf[4];
  uint64_t v42;
  __int16 v43;
  const __CFString *v44;
  __int16 v45;
  const __CFString *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  if (self->_samplingPointOfInterest != a3)
  {
    v3 = a3;
    _rt_log_facility_get_os_log(RTLogFacilityMetric);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)v7;
      v9 = CFSTR("YES");
      if (self->_samplingPointOfInterest)
        v10 = CFSTR("YES");
      else
        v10 = CFSTR("NO");
      *(_DWORD *)buf = 138412802;
      v42 = v7;
      v44 = v10;
      v43 = 2112;
      if (!v3)
        v9 = CFSTR("NO");
      v45 = 2112;
      v46 = v9;
      _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%@, samplingPointOfInterest transitioned from, %@, to, %@", buf, 0x20u);

    }
    self->_samplingPointOfInterest = v3;
    if (v3)
    {
      -[RTPointOfInterestMetricsManager setSettledState:](self, "setSettledState:", 0);
      -[RTPointOfInterestMetricsManager pointOfInterestSampler](self, "pointOfInterestSampler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "startSamplingPointOfInterestFromRequester:samplingInterval:", v13, 30.0);

      -[RTPointOfInterestMetricsManager scenarioTriggerManager](self, "scenarioTriggerManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[RTNotification notificationName](RTScenarioTriggerManagerNotificationSettled, "notificationName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObserver:selector:name:", self, sel_onSettledNotification_, v15);

      -[RTPointOfInterestMetricsManager scenarioTriggerManager](self, "scenarioTriggerManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[RTNotification notificationName](RTScenarioTriggerManagerNotificationUnsettled, "notificationName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObserver:selector:name:", self, sel_onUnsettledNotification_, v17);

      -[RTPointOfInterestMetricsManager visitManager](self, "visitManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[RTNotification notificationName](RTVisitManagerVisitIncidentNotification, "notificationName");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addObserver:selector:name:", self, sel_onVisitManagerVisitIncidentNotification_, v19);

      -[RTPointOfInterestMetricsManager timerManager](self, "timerManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)MEMORY[0x1E0CB3940];
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stringWithFormat:", CFSTR("%@.samplingTimer"), v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTNotifier queue](self, "queue");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = __62__RTPointOfInterestMetricsManager_setSamplingPointOfInterest___block_invoke;
      v40[3] = &unk_1E9297BF0;
      v40[4] = self;
      v40[5] = a2;
      objc_msgSend(v20, "timerWithIdentifier:queue:handler:", v24, v25, v40);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTPointOfInterestMetricsManager setSamplingTimer:](self, "setSamplingTimer:", v26);

      _rt_log_facility_get_os_log(RTLogFacilityMetric);
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(a2);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v42 = (uint64_t)v28;
        _os_log_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_INFO, "%@, samplingTimer start", buf, 0xCu);

      }
      -[RTPointOfInterestMetricsManager samplingTimer](self, "samplingTimer");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "fireAfterDelay:interval:", 7200.0, INFINITY);

      -[RTPointOfInterestMetricsManager samplingTimer](self, "samplingTimer");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "resume");

    }
    else
    {
      -[RTPointOfInterestMetricsManager scenarioTriggerManager](self, "scenarioTriggerManager");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      +[RTNotification notificationName](RTScenarioTriggerManagerNotificationSettled, "notificationName");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "removeObserver:fromNotification:", self, v32);

      -[RTPointOfInterestMetricsManager scenarioTriggerManager](self, "scenarioTriggerManager");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      +[RTNotification notificationName](RTScenarioTriggerManagerNotificationUnsettled, "notificationName");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "removeObserver:fromNotification:", self, v34);

      -[RTPointOfInterestMetricsManager visitManager](self, "visitManager");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      +[RTNotification notificationName](RTVisitManagerVisitIncidentNotification, "notificationName");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "removeObserver:fromNotification:", self, v36);

      -[RTPointOfInterestMetricsManager pointOfInterestSampler](self, "pointOfInterestSampler");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = (objc_class *)objc_opt_class();
      NSStringFromClass(v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "stopSamplingPointOfInterestFromRequester:", v39);

    }
  }
}

uint64_t __62__RTPointOfInterestMetricsManager_setSamplingPointOfInterest___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityMetric);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, samplingTimer expiry", (uint8_t *)&v6, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "samplingTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  objc_msgSend(*(id *)(a1 + 32), "setSamplingTimer:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setSamplingPointOfInterest:", 0);
}

- (BOOL)_shouldCollectQueriesForMapItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  BOOL v9;
  void *v10;
  dispatch_semaphore_t v11;
  void *v12;
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
  char v29;
  id v30;
  NSObject *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  NSObject *v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  id v44;
  void *v45;
  NSObject *v46;
  id v47;
  void *v48;
  void *v50;
  void *v51;
  void *v52;
  NSObject *log;
  NSObject *dsema;
  os_log_t v56;
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _QWORD v62[4];
  NSObject *v63;
  uint64_t *v64;
  uint64_t v65;
  int *v66;
  uint64_t v67;
  int v68;
  _BYTE buf[12];
  __int16 v70;
  id v71;
  __int16 v72;
  NSObject *v73;
  __int16 v74;
  double v75;
  _BYTE v76[128];
  _QWORD v77[4];

  v77[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "validMUID") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v56 = (os_log_t)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeInterval:sinceDate:", v56, -2592000.0);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTPointOfInterestMetricsManager defaultsManager](self, "defaultsManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", CFSTR("PointOfInterestMetricsManagerQueryCollectionDate"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    if (v52 && objc_msgSend(v52, "isAfterDate:", v51))
    {
      _rt_log_facility_get_os_log(RTLogFacilityMetric);
      log = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(a2);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "stringFromDate");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject stringFromDate](v56, "stringFromDate");
        v8 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v6;
        v70 = 2112;
        v71 = v7;
        v72 = 2112;
        v73 = v8;
        _os_log_impl(&dword_1D1A22000, log, OS_LOG_TYPE_INFO, "%@, skip collect queries, last query collection date, %@, current date, %@", buf, 0x20u);

      }
      v9 = 0;
    }
    else
    {
      v11 = dispatch_semaphore_create(0);
      v65 = 0;
      v66 = (int *)&v65;
      v67 = 0x2020000000;
      v68 = 0;
      -[RTPointOfInterestMetricsManager batteryManager](self, "batteryManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v62[0] = MEMORY[0x1E0C809B0];
      v62[1] = 3221225472;
      v62[2] = __67__RTPointOfInterestMetricsManager__shouldCollectQueriesForMapItem___block_invoke;
      v62[3] = &unk_1E9299948;
      v64 = &v65;
      v13 = v11;
      v63 = v13;
      objc_msgSend(v12, "fetchCurrentBatteryPercent:", v62);

      dsema = v13;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = dispatch_time(0, 3600000000000);
      if (!dispatch_semaphore_wait(dsema, v15))
        goto LABEL_15;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "timeIntervalSinceDate:", v14);
      v18 = v17;
      v19 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_18);
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
        _os_log_fault_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
      }

      v25 = (void *)MEMORY[0x1E0CB35C8];
      v77[0] = *MEMORY[0x1E0CB2D50];
      *(_QWORD *)buf = CFSTR("semaphore wait timeout");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v77, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
      {
        v28 = objc_retainAutorelease(v27);

        v29 = 0;
      }
      else
      {
LABEL_15:
        v28 = 0;
        v29 = 1;
      }

      v30 = v28;
      v50 = v30;
      if ((v29 & 1) != 0)
        log = 0;
      else
        log = v30;
      _rt_log_facility_get_os_log(RTLogFacilityMetric);
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(a2);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = (void *)v66[6];
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v32;
        v70 = 2048;
        v71 = v33;
        v72 = 2112;
        v73 = log;
        _os_log_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_INFO, "%@, battery percent, %lu, error, %@", buf, 0x20u);

      }
      if (log || v66[6] <= 19)
      {
        _rt_log_facility_get_os_log(RTLogFacilityMetric);
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          NSStringFromSelector(a2);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v35;
          _os_log_impl(&dword_1D1A22000, v34, OS_LOG_TYPE_INFO, "%@, skip collect queries due to low battery", buf, 0xCu);

        }
LABEL_39:
        v9 = 0;
      }
      else
      {
        v60 = 0u;
        v61 = 0u;
        v58 = 0u;
        v59 = 0u;
        -[RTPointOfInterestMetricsManager locationDenyList](self, "locationDenyList", v50);
        v34 = objc_claimAutoreleasedReturnValue();
        v36 = -[NSObject countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v58, v76, 16);
        if (v36)
        {
          v37 = *(_QWORD *)v59;
          while (2)
          {
            for (i = 0; i != v36; ++i)
            {
              if (*(_QWORD *)v59 != v37)
                objc_enumerationMutation(v34);
              v39 = *(NSObject **)(*((_QWORD *)&v58 + 1) + 8 * i);
              -[RTPointOfInterestMetricsManager distanceCalculator](self, "distanceCalculator");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "location");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              v57 = 0;
              objc_msgSend(v40, "distanceFromLocation:toLocation:error:", v41, v39, &v57);
              v43 = v42;
              v44 = v57;

              if (!v44 && v43 < 1000.0)
              {
                _rt_log_facility_get_os_log(RTLogFacilityMetric);
                v46 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
                {
                  NSStringFromSelector(a2);
                  v47 = (id)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v4, "location");
                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138413058;
                  *(_QWORD *)&buf[4] = v47;
                  v70 = 2112;
                  v71 = v48;
                  v72 = 2112;
                  v73 = v39;
                  v74 = 2048;
                  v75 = v43;
                  _os_log_impl(&dword_1D1A22000, v46, OS_LOG_TYPE_INFO, "%@, skip collect queries, current location, %@, denied location, %@, distance, %.2f", buf, 0x2Au);

                }
                goto LABEL_39;
              }

            }
            v36 = -[NSObject countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v58, v76, 16);
            if (v36)
              continue;
            break;
          }
        }

        _rt_log_facility_get_os_log(RTLogFacilityMetric);
        v34 = objc_claimAutoreleasedReturnValue();
        v9 = 1;
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          NSStringFromSelector(a2);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v45;
          v70 = 2112;
          v71 = v4;
          _os_log_impl(&dword_1D1A22000, v34, OS_LOG_TYPE_INFO, "%@, should collect queries, YES, mapItem, %@", buf, 0x16u);

          v9 = 1;
        }
      }

      _Block_object_dispose(&v65, 8);
    }

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityMetric);
    v56 = (os_log_t)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v10;
      _os_log_impl(&dword_1D1A22000, v56, OS_LOG_TYPE_INFO, "%@, skip collect queries due to invalid MUID", buf, 0xCu);

    }
    v9 = 0;
  }

  return v9;
}

intptr_t __67__RTPointOfInterestMetricsManager__shouldCollectQueriesForMapItem___block_invoke(uint64_t a1, int a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)setSettledState:(unint64_t)a3
{
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  const __CFString *v11;
  unint64_t settledState;
  void *v13;
  objc_class *v14;
  void *v15;
  double v16;
  _BYTE v17[22];
  __int16 v18;
  void *v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (self->_settledState != a3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityMetric);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[RTScenarioTriggerManager settledStateName:](RTScenarioTriggerManager, "settledStateName:", self->_settledState);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[RTScenarioTriggerManager settledStateName:](RTScenarioTriggerManager, "settledStateName:", a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[RTPointOfInterestMetricsManager samplingPointOfInterest](self, "samplingPointOfInterest");
      v11 = CFSTR("NO");
      *(_DWORD *)v17 = 138413058;
      *(_QWORD *)&v17[4] = v7;
      *(_WORD *)&v17[12] = 2112;
      if (v10)
        v11 = CFSTR("YES");
      *(_QWORD *)&v17[14] = v8;
      v18 = 2112;
      v19 = v9;
      v20 = 2112;
      v21 = v11;
      _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%@, settled state transitioned from, %@, to, %@, samplingPointOfInterest, %@", v17, 0x2Au);

    }
    self->_settledState = a3;
    if (-[RTPointOfInterestMetricsManager samplingPointOfInterest](self, "samplingPointOfInterest"))
    {
      settledState = self->_settledState;
      -[RTPointOfInterestMetricsManager pointOfInterestSampler](self, "pointOfInterestSampler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 300.0;
      if (settledState != 1)
        v16 = 30.0;
      objc_msgSend(v13, "startSamplingPointOfInterestFromRequester:samplingInterval:", v15, v16, *(_OWORD *)v17);

    }
  }
}

- (void)_updateLocationDenyList
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *, void *);
  void *v24;
  id v25;
  NSObject *v26;
  SEL v27;
  _QWORD v28[4];
  id v29;
  NSObject *v30;
  SEL v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  -[RTPointOfInterestMetricsManager locationDenyList](self, "locationDenyList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  v7 = dispatch_group_create();
  dispatch_group_enter(v7);
  -[RTPointOfInterestMetricsManager learnedLocationStore](self, "learnedLocationStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __58__RTPointOfInterestMetricsManager__updateLocationDenyList__block_invoke;
  v28[3] = &unk_1E9297BA0;
  v31 = a2;
  v10 = v5;
  v29 = v10;
  v11 = v7;
  v30 = v11;
  objc_msgSend(v8, "fetchLocationsOfInterestWithPlaceType:handler:", 1, v28);

  dispatch_group_enter(v11);
  -[RTPointOfInterestMetricsManager learnedLocationStore](self, "learnedLocationStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v9;
  v22 = 3221225472;
  v23 = __58__RTPointOfInterestMetricsManager__updateLocationDenyList__block_invoke_234;
  v24 = &unk_1E9297BA0;
  v27 = a2;
  v13 = v6;
  v25 = v13;
  v14 = v11;
  v26 = v14;
  objc_msgSend(v12, "fetchLocationsOfInterestWithPlaceType:handler:", 2, &v21);

  dispatch_group_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
  -[RTPointOfInterestMetricsManager locationDenyList](self, "locationDenyList", v21, v22, v23, v24);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObjectsFromArray:", v10);

  -[RTPointOfInterestMetricsManager locationDenyList](self, "locationDenyList");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObjectsFromArray:", v13);

  _rt_log_facility_get_os_log(RTLogFacilityMetric);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTPointOfInterestMetricsManager locationDenyList](self, "locationDenyList");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "count");
    *(_DWORD *)buf = 138412546;
    v33 = v18;
    v34 = 2048;
    v35 = v20;
    _os_log_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_INFO, "%@, locationDenyList size, %lu", buf, 0x16u);

  }
}

void __58__RTPointOfInterestMetricsManager__updateLocationDenyList__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityMetric);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v32 = v8;
    v33 = 2048;
    v34 = objc_msgSend(v5, "count");
    v35 = 2112;
    v36 = v6;
    _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%@, fetched home loi count, %lu, error, %@", buf, 0x20u);

  }
  if (!v6 && objc_msgSend(v5, "count"))
  {
    v24 = 0;
    v25 = v5;
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v9 = v5;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v27 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_msgSend(v14, "location", v24, v25);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "location");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            _rt_log_facility_get_os_log(RTLogFacilityMetric);
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              NSStringFromSelector(*(SEL *)(a1 + 48));
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "location");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "location");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v32 = v18;
              v33 = 2112;
              v34 = (uint64_t)v20;
              _os_log_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_INFO, "%@, add home loi location, %@", buf, 0x16u);

            }
            v21 = *(void **)(a1 + 32);
            objc_msgSend(v14, "location");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "location");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "addObject:", v23);

          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v11);
    }

    v6 = v24;
    v5 = v25;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __58__RTPointOfInterestMetricsManager__updateLocationDenyList__block_invoke_234(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityMetric);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v32 = v8;
    v33 = 2048;
    v34 = objc_msgSend(v5, "count");
    v35 = 2112;
    v36 = v6;
    _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%@, fetched work loi count, %lu, error, %@", buf, 0x20u);

  }
  if (!v6 && objc_msgSend(v5, "count"))
  {
    v24 = 0;
    v25 = v5;
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v9 = v5;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v27 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_msgSend(v14, "location", v24, v25);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "location");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            _rt_log_facility_get_os_log(RTLogFacilityMetric);
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              NSStringFromSelector(*(SEL *)(a1 + 48));
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "location");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "location");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v32 = v18;
              v33 = 2112;
              v34 = (uint64_t)v20;
              _os_log_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_INFO, "%@, add work loi location, %@", buf, 0x16u);

            }
            v21 = *(void **)(a1 + 32);
            objc_msgSend(v14, "location");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "location");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "addObject:", v23);

          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v11);
    }

    v6 = v24;
    v5 = v25;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

- (void)onSettledNotification:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[RTNotifier queue](self, "queue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__RTPointOfInterestMetricsManager_onSettledNotification___block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_async(v4, block);

}

uint64_t __57__RTPointOfInterestMetricsManager_onSettledNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setSettledState:", 2);
}

- (void)onUnsettledNotification:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[RTNotifier queue](self, "queue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__RTPointOfInterestMetricsManager_onUnsettledNotification___block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_async(v4, block);

}

uint64_t __59__RTPointOfInterestMetricsManager_onUnsettledNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setSettledState:", 1);
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
  v7[2] = __60__RTPointOfInterestMetricsManager_onNavigationNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __60__RTPointOfInterestMetricsManager_onNavigationNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onNavigationNotification:", *(_QWORD *)(a1 + 40));
}

- (void)_onNavigationNotification:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  _QWORD v17[6];
  uint8_t buf[4];
  id v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTNavigationManagerNavigationStateNotification, "notificationName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if (v8)
  {
    v9 = v5;
    _rt_log_facility_get_os_log(RTLogFacilityMetric);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v19 = v11;
      v20 = 2112;
      v21 = (const char *)v9;
      v22 = 2048;
      v23 = (int)-[NSObject state](v9, "state");
      _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "%@, received navigation notification, %@, state, %lu", buf, 0x20u);

    }
    if (-[NSObject state](v9, "state") == 6
      && !-[RTPointOfInterestMetricsManager samplingPointOfInterest](self, "samplingPointOfInterest"))
    {
      -[RTPointOfInterestMetricsManager navigationManager](self, "navigationManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __61__RTPointOfInterestMetricsManager__onNavigationNotification___block_invoke;
      v17[3] = &unk_1E9299970;
      v17[4] = self;
      v17[5] = a2;
      objc_msgSend(v12, "fetchNavigationRouteSummaryWithHandler:", v17);

    }
  }
  else
  {
    objc_msgSend(v5, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTNotification notificationName](RTNavigationManagerRouteSummaryNotification, "notificationName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "isEqualToString:", v14);

    if (v15)
    {
      _rt_log_facility_get_os_log(RTLogFacilityMetric);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(a2);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v19 = v16;
        _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "%@, received route summary, no op", buf, 0xCu);

      }
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v19 = v5;
        v20 = 2080;
        v21 = "-[RTPointOfInterestMetricsManager _onNavigationNotification:]";
        v22 = 1024;
        LODWORD(v23) = 553;
        _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "unhandled notification, %@ (in %s:%d)", buf, 0x1Cu);
      }
    }
  }

}

void __61__RTPointOfInterestMetricsManager__onNavigationNotification___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;
  __int128 v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__RTPointOfInterestMetricsManager__onNavigationNotification___block_invoke_2;
  block[3] = &unk_1E9297BC8;
  v7 = v3;
  v8 = *(_OWORD *)(a1 + 32);
  v5 = v3;
  dispatch_async(v4, block);

}

void __61__RTPointOfInterestMetricsManager__onNavigationNotification___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
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
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "firstObject");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "destinationMapItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "setNavigationDestination:", v3);
    _rt_log_facility_get_os_log(RTLogFacilityMetric);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412546;
      v15 = v5;
      v16 = 2112;
      v17 = v3;
      _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "%@, navigation destination, %@", (uint8_t *)&v14, 0x16u);

    }
    if (objc_msgSend(*(id *)(a1 + 40), "_shouldCollectQueriesForMapItem:", v3))
    {
      objc_msgSend(*(id *)(a1 + 40), "defaultsManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "muid"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("PointOfInterestMetricsManagerTruthLabelIdentifier"));

      objc_msgSend(*(id *)(a1 + 40), "defaultsManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKey:", v9, CFSTR("PointOfInterestMetricsManagerNavSessionEndDate"));

      objc_msgSend(*(id *)(a1 + 40), "defaultsManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(*(id *)(a1 + 40), "currentSignalEnvironmentType"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKey:", v11, CFSTR("PointOfInterestMetricsManagerSignalEnvironment"));

      objc_msgSend(*(id *)(a1 + 40), "defaultsManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKey:", v13, CFSTR("PointOfInterestMetricsManagerQueryCollectionDate"));

      objc_msgSend(*(id *)(a1 + 40), "setSamplingPointOfInterest:", 1);
    }

  }
}

- (void)onLearnedLocationStoreNotification:(id)a3
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
  v7[2] = __70__RTPointOfInterestMetricsManager_onLearnedLocationStoreNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __70__RTPointOfInterestMetricsManager_onLearnedLocationStoreNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onLearnedLocationStoreNotification:", *(_QWORD *)(a1 + 40));
}

- (void)_onLearnedLocationStoreNotification:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  const __CFString *v13;
  int v14;
  id v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTStoreNotificationAvailabilityDidChange, "notificationName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if (v8)
  {
    v9 = v5;
    _rt_log_facility_get_os_log(RTLogFacilityMetric);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[NSObject availability](v9, "availability");
      v13 = CFSTR("YES");
      if (!v12)
        v13 = CFSTR("NO");
      v14 = 138412546;
      v15 = v11;
      v16 = 2112;
      v17 = (const char *)v13;
      _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "%@, learned store available, %@", (uint8_t *)&v14, 0x16u);

    }
    if (-[NSObject availability](v9, "availability") == 2)
      -[RTPointOfInterestMetricsManager _updateLocationDenyList](self, "_updateLocationDenyList");
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v14 = 138412802;
      v15 = v5;
      v16 = 2080;
      v17 = "-[RTPointOfInterestMetricsManager _onLearnedLocationStoreNotification:]";
      v18 = 1024;
      v19 = 578;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "unhandled notification, %@ (in %s:%d)", (uint8_t *)&v14, 0x1Cu);
    }
  }

}

- (void)_onVisitManagerVisitIncidentNotification:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  char *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTVisitManagerVisitIncidentNotification, "notificationName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if (v8)
  {
    v9 = v5;
    -[NSObject visitIncident](v9, "visitIncident");
    v10 = (char *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "type") == 3)
    {
      _rt_log_facility_get_os_log(RTLogFacilityMetric);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(a2);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v22 = v12;
        v23 = 2112;
        v24 = v10;
        _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "%@, received visit exit, %@", buf, 0x16u);

      }
      -[RTPointOfInterestMetricsManager distanceCalculator](self, "distanceCalculator");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTPointOfInterestMetricsManager navigationDestination](self, "navigationDestination");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "location");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "location");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 0;
      objc_msgSend(v13, "distanceFromLocation:toLocation:error:", v15, v16, &v20);
      v18 = v17;
      v19 = v20;

      if (!v19 && v18 < 1000.0)
      {
        -[RTPointOfInterestMetricsManager setSamplingPointOfInterest:](self, "setSamplingPointOfInterest:", 0);
        -[RTPointOfInterestMetricsManager setNavigationDestination:](self, "setNavigationDestination:", 0);
      }
    }

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v22 = v5;
      v23 = 2080;
      v24 = "-[RTPointOfInterestMetricsManager _onVisitManagerVisitIncidentNotification:]";
      v25 = 1024;
      v26 = 604;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "unhandled notification, %@ (in %s:%d)", buf, 0x1Cu);
    }
  }

}

- (void)onVisitManagerVisitIncidentNotification:(id)a3
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
  v7[2] = __75__RTPointOfInterestMetricsManager_onVisitManagerVisitIncidentNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __75__RTPointOfInterestMetricsManager_onVisitManagerVisitIncidentNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onVisitManagerVisitIncidentNotification:", *(_QWORD *)(a1 + 40));
}

- (id)collectMetricsWithError:(id *)a3
{
  NSObject *v4;
  void *v5;
  dispatch_semaphore_t v6;
  id v7;
  objc_class *v8;
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
  char v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  id v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  dispatch_semaphore_t v51;
  void *v52;
  void *v53;
  NSObject *v54;
  void *v55;
  dispatch_time_t v56;
  void *v57;
  double v58;
  double v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  NSObject *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  char v70;
  NSObject *v71;
  void *v72;
  uint64_t v73;
  id v74;
  id v75;
  void *v76;
  double v77;
  void *v78;
  void *v79;
  void *v80;
  double v81;
  void *v82;
  void *v83;
  id v84;
  void *v85;
  id v86;
  id v87;
  void *v88;
  void *v89;
  id v90;
  dispatch_semaphore_t v91;
  void *v92;
  NSObject *v93;
  void *v94;
  dispatch_time_t v95;
  void *v96;
  double v97;
  double v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  NSObject *v104;
  void *v105;
  void *v106;
  void *v107;
  id v108;
  char v109;
  NSObject *v110;
  void *v111;
  uint64_t v112;
  id v113;
  id v114;
  void *v115;
  void *v116;
  void *v117;
  double v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  double v123;
  void *v124;
  void *v125;
  id v126;
  void *v127;
  void *v128;
  NSObject *v129;
  dispatch_semaphore_t v130;
  id v131;
  uint64_t (*v132)(uint64_t, uint64_t);
  void *v133;
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
  void *v151;
  id v152;
  char v153;
  NSObject *v154;
  id v155;
  uint64_t v156;
  id v157;
  id v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  double v166;
  double v167;
  id v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  double v175;
  double v176;
  id v177;
  void *v178;
  uint64_t v179;
  void *v180;
  void *v181;
  id v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t i;
  uint64_t v186;
  void *v187;
  NSObject *v188;
  void *v189;
  void *v191;
  dispatch_semaphore_t v192;
  NSObject *v193;
  dispatch_semaphore_t v194;
  id v195;
  void *v196;
  id v197;
  id v198;
  void *v199;
  void *v200;
  id v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  id v207;
  NSObject *dsema;
  void *v209;
  NSObject *v212;
  unint64_t v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  id v218;
  id v219;
  _QWORD v220[4];
  NSObject *v221;
  _BYTE *v222;
  uint64_t *v223;
  _QWORD v224[4];
  id v225;
  id v226;
  NSObject *v227;
  uint64_t *v228;
  _BYTE *v229;
  _QWORD v230[4];
  NSObject *v231;
  _BYTE *v232;
  uint64_t *v233;
  _QWORD v234[4];
  NSObject *v235;
  uint64_t *v236;
  uint64_t *v237;
  uint64_t v238;
  uint64_t *v239;
  uint64_t v240;
  uint64_t (*v241)(uint64_t, uint64_t);
  void (*v242)(uint64_t);
  id v243;
  uint64_t v244;
  id *v245;
  uint64_t v246;
  uint64_t (*v247)(uint64_t, uint64_t);
  void (*v248)(uint64_t);
  id v249;
  _BYTE v250[128];
  _BYTE v251[12];
  __int16 v252;
  uint64_t v253;
  __int16 v254;
  void *v255;
  uint64_t v256;
  void *v257;
  uint64_t v258;
  id *v259;
  uint64_t v260;
  uint64_t (*v261)(uint64_t, uint64_t);
  void (*v262)(uint64_t);
  id v263;
  _BYTE v264[24];
  uint64_t (*v265)(uint64_t, uint64_t);
  __int128 v266;
  _BYTE v267[24];
  uint64_t (*v268)(uint64_t, uint64_t);
  __int128 v269;
  uint64_t v270;
  id *v271;
  uint64_t v272;
  uint64_t (*v273)(uint64_t, uint64_t);
  void (*v274)(uint64_t);
  id v275;
  _BYTE buf[24];
  uint64_t (*v277)(uint64_t, uint64_t);
  _BYTE v278[20];
  __int16 v279;
  void *v280;
  _QWORD v281[4];

  v281[1] = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityMetric);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v5;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "%@, collecting point of interest metrics", buf, 0xCu);

  }
  v213 = -[RTPointOfInterestMetricsManager getTruthPointOfInterestIdentifier](self, "getTruthPointOfInterestIdentifier");
  if (v213)
  {
    v212 = objc_opt_new();
    v244 = 0;
    v245 = (id *)&v244;
    v246 = 0x3032000000;
    v247 = __Block_byref_object_copy__23;
    v248 = __Block_byref_object_dispose__23;
    v249 = 0;
    v6 = dispatch_semaphore_create(0);
    v238 = 0;
    v239 = &v238;
    v240 = 0x3032000000;
    v241 = __Block_byref_object_copy__23;
    v242 = __Block_byref_object_dispose__23;
    v243 = 0;
    v7 = objc_alloc(MEMORY[0x1E0D183F8]);
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v209 = (void *)objc_msgSend(v7, "initWithUseBackgroundTraits:analyticsIdentifier:clientIdentifier:", 1, v9, CFSTR("com.apple.CoreRoutine.PoiMetrics"));

    -[RTPointOfInterestMetricsManager mapServiceManager](self, "mapServiceManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v234[0] = MEMORY[0x1E0C809B0];
    v234[1] = 3221225472;
    v234[2] = __59__RTPointOfInterestMetricsManager_collectMetricsWithError___block_invoke;
    v234[3] = &unk_1E9299998;
    v236 = &v238;
    v237 = &v244;
    v11 = v6;
    v235 = v11;
    objc_msgSend(v10, "fetchPointOfInterestAttributesWithIdentifier:options:handler:", v213, v209, v234);

    v12 = v11;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v12, v14))
      goto LABEL_9;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "timeIntervalSinceDate:", v13);
    v17 = v16;
    v18 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_18);
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
      _os_log_fault_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    v24 = (void *)MEMORY[0x1E0CB35C8];
    v270 = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)buf = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v270, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      v27 = objc_retainAutorelease(v26);

      v28 = 0;
    }
    else
    {
LABEL_9:
      v27 = 0;
      v28 = 1;
    }

    v207 = v27;
    if ((v28 & 1) == 0)
      objc_storeStrong(v245 + 5, v27);
    _rt_log_facility_get_os_log(RTLogFacilityMetric);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v239[5];
      v32 = (uint64_t (*)(uint64_t, uint64_t))v245[5];
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v30;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v31;
      *(_WORD *)&buf[22] = 2112;
      v277 = v32;
      _os_log_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_INFO, "%@, fetched POI attributes, %@, error, %@", buf, 0x20u);

    }
    v33 = v245[5];
    if (v33)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v33);
      v34 = MEMORY[0x1E0C9AA70];
    }
    else
    {
      -[NSObject setObject:forKeyedSubscript:](v212, "setObject:forKeyedSubscript:", &unk_1E9326F78, CFSTR("poiCategory"));
      objc_msgSend((id)v239[5], "category");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(&unk_1E932D690, "objectForKey:", v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      if (v38)
      {
        objc_msgSend((id)v239[5], "category");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(&unk_1E932D6B8, "objectForKey:", v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKeyedSubscript:](v212, "setObject:forKeyedSubscript:", v40, CFSTR("poiCategory"));

      }
      v41 = (void *)MEMORY[0x1E0CB37E8];
      if (objc_msgSend((id)v239[5], "applePaySupport"))
        v42 = 1;
      else
        v42 = 2;
      objc_msgSend(v41, "numberWithInt:", v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKeyedSubscript:](v212, "setObject:forKeyedSubscript:", v43, CFSTR("applePaySupport"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", ceil((double)(unint64_t)objc_msgSend((id)v239[5], "nearbyPoiCount") / 10.0));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKeyedSubscript:](v212, "setObject:forKeyedSubscript:", v44, CFSTR("nearbyPoiCountBucketed"));

      -[RTPointOfInterestMetricsManager defaultsManager](self, "defaultsManager");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "objectForKey:", CFSTR("PointOfInterestMetricsManagerSignalEnvironment"));
      v46 = objc_claimAutoreleasedReturnValue();
      v47 = (void *)v46;
      if (v46)
        v48 = (void *)v46;
      else
        v48 = &unk_1E9326F90;
      -[NSObject setObject:forKeyedSubscript:](v212, "setObject:forKeyedSubscript:", v48, CFSTR("signalEnvironment"));

      _rt_log_facility_get_os_log(RTLogFacilityMetric);
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        v131 = (id)objc_claimAutoreleasedReturnValue();
        -[NSObject objectForKeyedSubscript:](v212, "objectForKeyedSubscript:", CFSTR("poiCategory"));
        v132 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
        -[NSObject objectForKeyedSubscript:](v212, "objectForKeyedSubscript:", CFSTR("applePaySupport"));
        v133 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject objectForKeyedSubscript:](v212, "objectForKeyedSubscript:", CFSTR("nearbyPoiCountBucketed"));
        v134 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject objectForKeyedSubscript:](v212, "objectForKeyedSubscript:", CFSTR("signalEnvironment"));
        v135 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413570;
        *(_QWORD *)&buf[4] = v131;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v213;
        *(_WORD *)&buf[22] = 2112;
        v277 = v132;
        *(_WORD *)v278 = 2112;
        *(_QWORD *)&v278[2] = v133;
        *(_WORD *)&v278[10] = 2112;
        *(_QWORD *)&v278[12] = v134;
        v279 = 2112;
        v280 = v135;
        _os_log_debug_impl(&dword_1D1A22000, v49, OS_LOG_TYPE_DEBUG, "%@, muid, %lu, poi category, %@, applePay support, %@, bucketed nearby point count, %@, signal enviroment, %@", buf, 0x3Eu);

      }
      -[RTPointOfInterestMetricsManager defaultsManager](self, "defaultsManager");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "objectForKey:", CFSTR("PointOfInterestMetricsManagerNavSessionEndDate"));
      v206 = (void *)objc_claimAutoreleasedReturnValue();

      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v277 = __Block_byref_object_copy__23;
      *(_QWORD *)v278 = __Block_byref_object_dispose__23;
      *(_QWORD *)&v278[8] = 0;
      v270 = 0;
      v271 = (id *)&v270;
      v272 = 0x3032000000;
      v273 = __Block_byref_object_copy__23;
      v274 = __Block_byref_object_dispose__23;
      v275 = 0;
      v51 = dispatch_semaphore_create(0);
      -[RTPointOfInterestMetricsManager learnedLocationStore](self, "learnedLocationStore");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "predicateForObjectsFromCurrentDevice");
      v203 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v206, "dateByAddingTimeInterval:", -300.0);
      v204 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v205 = (void *)objc_claimAutoreleasedReturnValue();
      v202 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v204, v205);
      -[RTPointOfInterestMetricsManager learnedLocationStore](self, "learnedLocationStore");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v230[0] = MEMORY[0x1E0C809B0];
      v230[1] = 3221225472;
      v230[2] = __59__RTPointOfInterestMetricsManager_collectMetricsWithError___block_invoke_256;
      v230[3] = &unk_1E9296EE0;
      v232 = buf;
      v233 = &v270;
      v54 = v51;
      v231 = v54;
      objc_msgSend(v53, "fetchVisitsWithPredicate:ascending:dateInterval:limit:handler:", v203, 1, v202, &unk_1E9326FA8, v230);

      dsema = v54;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = dispatch_time(0, 3600000000000);
      if (!dispatch_semaphore_wait(dsema, v56))
        goto LABEL_36;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "timeIntervalSinceDate:", v55);
      v59 = v58;
      v60 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_18);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "filteredArrayUsingPredicate:", v61);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "firstObject");
      v64 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v60, "submitToCoreAnalytics:type:duration:", v64, 1, v59);
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v65 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v267 = 0;
        _os_log_fault_impl(&dword_1D1A22000, v65, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v267, 2u);
      }

      v66 = (void *)MEMORY[0x1E0CB35C8];
      *(_QWORD *)v264 = *MEMORY[0x1E0CB2D50];
      *(_QWORD *)v267 = CFSTR("semaphore wait timeout");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v267, v264, 1);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v67);
      v68 = (void *)objc_claimAutoreleasedReturnValue();

      if (v68)
      {
        v69 = objc_retainAutorelease(v68);

        v70 = 0;
      }
      else
      {
LABEL_36:
        v69 = 0;
        v70 = 1;
      }

      v201 = v69;
      if ((v70 & 1) == 0)
        objc_storeStrong(v271 + 5, v69);
      _rt_log_facility_get_os_log(RTLogFacilityMetric);
      v71 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(a2);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        v73 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
        v74 = v271[5];
        *(_DWORD *)v267 = 138413058;
        *(_QWORD *)&v267[4] = v72;
        *(_WORD *)&v267[12] = 2112;
        *(_QWORD *)&v267[14] = v73;
        *(_WORD *)&v267[22] = 2112;
        v268 = (uint64_t (*)(uint64_t, uint64_t))v206;
        LOWORD(v269) = 2112;
        *(_QWORD *)((char *)&v269 + 2) = v74;
        _os_log_impl(&dword_1D1A22000, v71, OS_LOG_TYPE_INFO, "%@, fetched learned visit, %@, nav session end date, %@, error, %@", v267, 0x2Au);

      }
      v75 = v271[5];
      if (v75 || !*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
      {
        if (a3)
          *a3 = objc_retainAutorelease(v75);
        v34 = MEMORY[0x1E0C9AA70];
      }
      else
      {
        v76 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "duration");
        objc_msgSend(v76, "numberWithDouble:", round(v77));
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKeyedSubscript:](v212, "setObject:forKeyedSubscript:", v78, CFSTR("visitDuration"));

        v79 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "entryDate");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v206, "timeIntervalSinceDate:", v80);
        objc_msgSend(v79, "numberWithDouble:", round(v81));
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKeyedSubscript:](v212, "setObject:forKeyedSubscript:", v82, CFSTR("navigationTimeOffset"));

        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v206, "isBeforeDate:", v83))
        {
          objc_msgSend(v206, "dateByAddingTimeInterval:", -300.0);
          v84 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v84 = v83;
        }
        v85 = v84;
        v86 = v83;
        v200 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v85, v86);
        v87 = objc_alloc(MEMORY[0x1E0D18508]);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0D185C8]);
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", &unk_1E9326FC0);
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        v199 = (void *)objc_msgSend(v87, "initWithAscending:confidence:dateInterval:labelVisit:limit:sources:", 1, v88, v200, 0, 0, v89);

        *(_QWORD *)v267 = 0;
        *(_QWORD *)&v267[8] = v267;
        *(_QWORD *)&v267[16] = 0x3032000000;
        v268 = __Block_byref_object_copy__23;
        *(_QWORD *)&v269 = __Block_byref_object_dispose__23;
        *((_QWORD *)&v269 + 1) = 0;
        v90 = v271[5];
        v271[5] = 0;

        v91 = dispatch_semaphore_create(0);
        -[RTPointOfInterestMetricsManager visitManager](self, "visitManager");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        v224[0] = MEMORY[0x1E0C809B0];
        v224[1] = 3221225472;
        v224[2] = __59__RTPointOfInterestMetricsManager_collectMetricsWithError___block_invoke_261;
        v224[3] = &unk_1E92999C0;
        v228 = &v270;
        v197 = v85;
        v225 = v197;
        v198 = v86;
        v226 = v198;
        v229 = v267;
        v93 = v91;
        v227 = v93;
        objc_msgSend(v92, "fetchStoredVisitsWithOptions:handler:", v199, v224);

        dsema = v93;
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        v95 = dispatch_time(0, 3600000000000);
        if (!dispatch_semaphore_wait(dsema, v95))
          goto LABEL_54;
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v96, "timeIntervalSinceDate:", v94);
        v98 = v97;
        v99 = (void *)objc_opt_new();
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_18);
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v101, "filteredArrayUsingPredicate:", v100);
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v102, "firstObject");
        v103 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v99, "submitToCoreAnalytics:type:duration:", v103, 1, v98);
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v104 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v104, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v264 = 0;
          _os_log_fault_impl(&dword_1D1A22000, v104, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v264, 2u);
        }

        v105 = (void *)MEMORY[0x1E0CB35C8];
        v258 = *MEMORY[0x1E0CB2D50];
        *(_QWORD *)v264 = CFSTR("semaphore wait timeout");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v264, &v258, 1);
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v105, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v106);
        v107 = (void *)objc_claimAutoreleasedReturnValue();

        if (v107)
        {
          v108 = objc_retainAutorelease(v107);

          v109 = 0;
        }
        else
        {
LABEL_54:
          v108 = 0;
          v109 = 1;
        }

        v201 = v108;
        if ((v109 & 1) == 0)
          objc_storeStrong(v271 + 5, v108);
        _rt_log_facility_get_os_log(RTLogFacilityMetric);
        v110 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v110, OS_LOG_TYPE_INFO))
        {
          NSStringFromSelector(a2);
          v111 = (void *)objc_claimAutoreleasedReturnValue();
          v112 = *(_QWORD *)(*(_QWORD *)&v267[8] + 40);
          v113 = v271[5];
          *(_DWORD *)v264 = 138413058;
          *(_QWORD *)&v264[4] = v111;
          *(_WORD *)&v264[12] = 2112;
          *(_QWORD *)&v264[14] = v112;
          *(_WORD *)&v264[22] = 2112;
          v265 = (uint64_t (*)(uint64_t, uint64_t))v206;
          LOWORD(v266) = 2112;
          *(_QWORD *)((char *)&v266 + 2) = v113;
          _os_log_impl(&dword_1D1A22000, v110, OS_LOG_TYPE_INFO, "%@, fetched realtime visit, %@, nav session end date, %@, error, %@", v264, 0x2Au);

        }
        v114 = v271[5];
        if (v114 || !*(_QWORD *)(*(_QWORD *)&v267[8] + 40))
        {
          if (a3)
            *a3 = objc_retainAutorelease(v114);
          v34 = MEMORY[0x1E0C9AA70];
        }
        else
        {
          v115 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(*(id *)(*(_QWORD *)&v267[8] + 40), "entry");
          v116 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "entryDate");
          v117 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v116, "timeIntervalSinceDate:", v117);
          objc_msgSend(v115, "numberWithDouble:", round(v118));
          v119 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setObject:forKeyedSubscript:](v212, "setObject:forKeyedSubscript:", v119, CFSTR("realtimeVisitEntryTimeOffset"));

          v120 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(*(id *)(*(_QWORD *)&v267[8] + 40), "exit");
          v121 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "entryDate");
          v122 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v121, "timeIntervalSinceDate:", v122);
          objc_msgSend(v120, "numberWithDouble:", round(v123));
          v124 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setObject:forKeyedSubscript:](v212, "setObject:forKeyedSubscript:", v124, CFSTR("realtimeVisitExitTimeOffset"));

          *(_QWORD *)v264 = 0;
          *(_QWORD *)&v264[8] = v264;
          *(_QWORD *)&v264[16] = 0x3032000000;
          v265 = __Block_byref_object_copy__23;
          *(_QWORD *)&v266 = __Block_byref_object_dispose__23;
          *((_QWORD *)&v266 + 1) = 0;
          v258 = 0;
          v259 = (id *)&v258;
          v260 = 0x3032000000;
          v261 = __Block_byref_object_copy__23;
          v262 = __Block_byref_object_dispose__23;
          v263 = 0;
          v192 = dispatch_semaphore_create(0);
          v195 = v206;
          objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "exitDate");
          v125 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v125, "dateByAddingTimeInterval:", 300.0);
          v196 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v195, "isAfterDate:", v196))
          {
            v126 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v256 = *MEMORY[0x1E0CB2D50];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("placeInferenceQueryStartDate cannot be after placeInferenceQueryEndDate"));
            v127 = (void *)objc_claimAutoreleasedReturnValue();
            v257 = v127;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v257, &v256, 1);
            v128 = (void *)objc_claimAutoreleasedReturnValue();
            v129 = objc_msgSend(v126, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v128);

            if (a3)
            {
              v130 = objc_retainAutorelease(v129);
              *a3 = v130;
              v34 = MEMORY[0x1E0C9AA70];
            }
            else
            {
              v34 = MEMORY[0x1E0C9AA70];
              v130 = v129;
            }
          }
          else
          {
            v191 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v195, v196);
            -[RTPointOfInterestMetricsManager placeInferenceQueryStore](self, "placeInferenceQueryStore");
            v136 = (void *)objc_claimAutoreleasedReturnValue();
            v220[0] = MEMORY[0x1E0C809B0];
            v220[1] = 3221225472;
            v220[2] = __59__RTPointOfInterestMetricsManager_collectMetricsWithError___block_invoke_266;
            v220[3] = &unk_1E9296EE0;
            v222 = v264;
            v223 = &v258;
            v137 = v192;
            v221 = v137;
            objc_msgSend(v136, "fetchPlaceInferenceQueriesWithDateInterval:ascending:handler:", v191, 1, v220);

            v193 = v137;
            objc_msgSend(MEMORY[0x1E0C99D68], "now");
            v138 = (void *)objc_claimAutoreleasedReturnValue();
            v139 = dispatch_time(0, 3600000000000);
            if (!dispatch_semaphore_wait(v193, v139))
              goto LABEL_72;
            objc_msgSend(MEMORY[0x1E0C99D68], "now");
            v140 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v140, "timeIntervalSinceDate:", v138);
            v142 = v141;
            v143 = (void *)objc_opt_new();
            objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_18);
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
              *(_WORD *)v251 = 0;
              _os_log_fault_impl(&dword_1D1A22000, v148, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v251, 2u);
            }

            v149 = (void *)MEMORY[0x1E0CB35C8];
            v281[0] = *MEMORY[0x1E0CB2D50];
            *(_QWORD *)v251 = CFSTR("semaphore wait timeout");
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v251, v281, 1);
            v150 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v149, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v150);
            v151 = (void *)objc_claimAutoreleasedReturnValue();

            if (v151)
            {
              v152 = objc_retainAutorelease(v151);

              v153 = 0;
            }
            else
            {
LABEL_72:
              v152 = 0;
              v153 = 1;
            }

            v194 = (dispatch_semaphore_t)v152;
            if ((v153 & 1) == 0)
              objc_storeStrong(v259 + 5, v152);
            _rt_log_facility_get_os_log(RTLogFacilityMetric);
            v154 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v154, OS_LOG_TYPE_INFO))
            {
              NSStringFromSelector(a2);
              v155 = (id)objc_claimAutoreleasedReturnValue();
              v156 = objc_msgSend(*(id *)(*(_QWORD *)&v264[8] + 40), "count");
              v157 = v259[5];
              *(_DWORD *)v251 = 138412802;
              *(_QWORD *)&v251[4] = v155;
              v252 = 2048;
              v253 = v156;
              v254 = 2112;
              v255 = v157;
              _os_log_impl(&dword_1D1A22000, v154, OS_LOG_TYPE_INFO, "%@, fetched place inference queries, %lu, error, %@", v251, 0x20u);

            }
            v158 = v259[5];
            if (v158)
            {
              if (a3)
                *a3 = objc_retainAutorelease(v158);
              v34 = MEMORY[0x1E0C9AA70];
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", -1.0);
              v159 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject setObject:forKeyedSubscript:](v212, "setObject:forKeyedSubscript:", v159, CFSTR("distanceBetweenQueryAndRealtimeVisit"));

              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", -1.0);
              v160 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject setObject:forKeyedSubscript:](v212, "setObject:forKeyedSubscript:", v160, CFSTR("distanceBetweenQueryAndLearnedVisit"));

              if (objc_msgSend(*(id *)(*(_QWORD *)&v264[8] + 40), "count"))
              {
                objc_msgSend(*(id *)(*(_QWORD *)&v264[8] + 40), "firstObject");
                v161 = (void *)objc_claimAutoreleasedReturnValue();
                -[RTPointOfInterestMetricsManager distanceCalculator](self, "distanceCalculator");
                v162 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v161, "placeInference");
                v163 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v163, "referenceLocation");
                v164 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(*(_QWORD *)&v267[8] + 40), "location");
                v165 = (void *)objc_claimAutoreleasedReturnValue();
                v219 = 0;
                objc_msgSend(v162, "distanceFromLocation:toLocation:error:", v164, v165, &v219);
                v167 = v166;
                v168 = v219;

                if (!v168)
                {
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", round(v167));
                  v169 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NSObject setObject:forKeyedSubscript:](v212, "setObject:forKeyedSubscript:", v169, CFSTR("distanceBetweenQueryAndRealtimeVisit"));

                }
                -[RTPointOfInterestMetricsManager distanceCalculator](self, "distanceCalculator");
                v170 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v161, "placeInference");
                v171 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v171, "referenceLocation");
                v172 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "location");
                v173 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v173, "location");
                v174 = (void *)objc_claimAutoreleasedReturnValue();
                v218 = 0;
                objc_msgSend(v170, "distanceFromLocation:toLocation:error:", v172, v174, &v218);
                v176 = v175;
                v177 = v218;

                if (!v177)
                {
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", round(v176));
                  v178 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NSObject setObject:forKeyedSubscript:](v212, "setObject:forKeyedSubscript:", v178, CFSTR("distanceBetweenQueryAndLearnedVisit"));

                }
              }
              v179 = *(_QWORD *)(*(_QWORD *)&v264[8] + 40);
              objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "entryDate");
              v180 = (void *)objc_claimAutoreleasedReturnValue();
              -[RTPointOfInterestMetricsManager processQueries:visitEntryDate:poiIdentifier:](self, "processQueries:visitEntryDate:poiIdentifier:", v179, v180, v213);
              v181 = (void *)objc_claimAutoreleasedReturnValue();

              v216 = 0u;
              v217 = 0u;
              v214 = 0u;
              v215 = 0u;
              v182 = v181;
              v183 = objc_msgSend(v182, "countByEnumeratingWithState:objects:count:", &v214, v250, 16);
              if (v183)
              {
                v184 = *(_QWORD *)v215;
                do
                {
                  for (i = 0; i != v183; ++i)
                  {
                    if (*(_QWORD *)v215 != v184)
                      objc_enumerationMutation(v182);
                    v186 = *(_QWORD *)(*((_QWORD *)&v214 + 1) + 8 * i);
                    objc_msgSend(v182, "objectForKeyedSubscript:", v186);
                    v187 = (void *)objc_claimAutoreleasedReturnValue();
                    _rt_log_facility_get_os_log(RTLogFacilityMetric);
                    v188 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v188, OS_LOG_TYPE_DEBUG))
                    {
                      NSStringFromSelector(a2);
                      v189 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)v251 = 138412802;
                      *(_QWORD *)&v251[4] = v189;
                      v252 = 2112;
                      v253 = v186;
                      v254 = 2112;
                      v255 = v187;
                      _os_log_debug_impl(&dword_1D1A22000, v188, OS_LOG_TYPE_DEBUG, "%@, Key: %@, Value: %@", v251, 0x20u);

                    }
                  }
                  v183 = objc_msgSend(v182, "countByEnumeratingWithState:objects:count:", &v214, v250, 16);
                }
                while (v183);
              }

              -[NSObject addEntriesFromDictionary:](v212, "addEntriesFromDictionary:", v182);
              v34 = v212;

            }
            v130 = v194;
          }

          _Block_object_dispose(&v258, 8);
          _Block_object_dispose(v264, 8);

        }
        _Block_object_dispose(v267, 8);

      }
      _Block_object_dispose(&v270, 8);

      _Block_object_dispose(buf, 8);
    }

    _Block_object_dispose(&v238, 8);
    _Block_object_dispose(&v244, 8);

    v35 = v212;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityMetric);
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v36;
      _os_log_impl(&dword_1D1A22000, v35, OS_LOG_TYPE_INFO, "%@, invalid truth POI identifier, skip metrics collection", buf, 0xCu);

    }
    v34 = MEMORY[0x1E0C9AA70];
  }

  return v34;
}

void __59__RTPointOfInterestMetricsManager_collectMetricsWithError___block_invoke(uint64_t a1, void *a2, void *a3)
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

void __59__RTPointOfInterestMetricsManager_collectMetricsWithError___block_invoke_256(uint64_t a1, void *a2, void *a3)
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

void __59__RTPointOfInterestMetricsManager_collectMetricsWithError___block_invoke_261(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v17 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v11, "exit");
        v12 = objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          v13 = (void *)v12;
          objc_msgSend(v11, "exit");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v14, "isAfterDate:", *(_QWORD *)(a1 + 32)) & 1) != 0)
          {
            objc_msgSend(v11, "exit");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "isBeforeDate:", *(_QWORD *)(a1 + 40));

            if (v16)
            {
              objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v11);
              goto LABEL_13;
            }
          }
          else
          {

          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }
LABEL_13:

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

void __59__RTPointOfInterestMetricsManager_collectMetricsWithError___block_invoke_266(uint64_t a1, void *a2, void *a3)
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

- (BOOL)submitMetricsWithError:(id *)a3
{
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  id v10;
  BOOL v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[RTPointOfInterestMetricsManager collectMetricsWithError:](self, "collectMetricsWithError:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _rt_log_facility_get_os_log(RTLogFacilityMetric);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "count");
    v10 = *a3;
    *(_DWORD *)buf = 138412802;
    v20 = v8;
    v21 = 2048;
    v22 = v9;
    v23 = 2112;
    v24 = v10;
    _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%@, metric count, %lu, error, %@", buf, 0x20u);

  }
  if (*a3 || !objc_msgSend(v6, "count"))
  {
    v11 = 0;
  }
  else
  {
    v12 = objc_alloc(MEMORY[0x1E0CB3940]);
    v11 = 1;
    v13 = (void *)objc_msgSend(v12, "initWithCString:encoding:", RTAnalyticsEventBluePoiMetrics, 1);
    log_analytics_submission(v13, v6);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.%@"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    AnalyticsSendEvent();

    -[RTPointOfInterestMetricsManager defaultsManager](self, "defaultsManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", &unk_1E9326F78, CFSTR("PointOfInterestMetricsManagerTruthLabelIdentifier"));

    -[RTPointOfInterestMetricsManager defaultsManager](self, "defaultsManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKey:", 0, CFSTR("PointOfInterestMetricsManagerNavSessionEndDate"));

    -[RTPointOfInterestMetricsManager defaultsManager](self, "defaultsManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKey:", 0, CFSTR("PointOfInterestMetricsManagerSignalEnvironment"));

  }
  return v11;
}

- (id)processQueries:(id)a3 visitEntryDate:(id)a4 poiIdentifier:(unint64_t)a5
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t j;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  double v62;
  unint64_t v63;
  uint64_t v64;
  unint64_t v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  unint64_t v73;
  uint64_t v74;
  unint64_t v75;
  NSObject *v76;
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
  uint64_t v88;
  void *v89;
  void *v90;
  void *v91;
  double v92;
  double v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  uint64_t v100;
  void *v101;
  void *v102;
  uint64_t v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  uint64_t v112;
  void *v113;
  void *v114;
  void *v115;
  uint64_t v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  unint64_t v131;
  unint64_t v132;
  unint64_t v133;
  unint64_t v134;
  unint64_t v135;
  uint64_t v136;
  unint64_t v137;
  unint64_t v138;
  unint64_t v139;
  unint64_t v140;
  void *v141;
  uint64_t v142;
  void *v143;
  void *v144;
  void *v145;
  double v146;
  unint64_t v147;
  uint64_t v148;
  unint64_t v149;
  void *v150;
  uint64_t v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  unint64_t v157;
  uint64_t v158;
  char *v159;
  NSObject *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  char *v172;
  id v173;
  void *v174;
  uint64_t v175;
  void *v176;
  void *v177;
  void *v178;
  double v179;
  double v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  uint64_t v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  uint64_t v197;
  void *v198;
  void *v199;
  void *v200;
  uint64_t v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  uint64_t v206;
  unint64_t v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  unint64_t v216;
  unint64_t v217;
  id v218;
  uint64_t v219;
  uint64_t v220;
  unint64_t v221;
  uint64_t v222;
  uint64_t k;
  void *v224;
  void *v225;
  unint64_t v226;
  NSObject *v227;
  void *v228;
  NSObject *v229;
  void *v230;
  uint64_t v231;
  uint64_t v232;
  void *v233;
  id v234;
  uint64_t v235;
  uint64_t v236;
  unint64_t v237;
  uint64_t v238;
  uint64_t m;
  void *v240;
  void *v241;
  unint64_t v242;
  NSObject *v243;
  void *v244;
  NSObject *v245;
  void *v246;
  uint64_t v247;
  uint64_t v248;
  void *v249;
  id v250;
  void *v252;
  unint64_t v253;
  unint64_t v254;
  void *v255;
  id v256;
  void *v257;
  void *v258;
  void *v259;
  void *v260;
  uint64_t v261;
  void *v262;
  unint64_t v263;
  void *v264;
  void *v265;
  unint64_t v267;
  uint64_t v268;
  id obj;
  void *v271;
  uint64_t v272;
  unint64_t v273;
  void *v274;
  void *v275;
  uint64_t v276;
  uint64_t v277;
  void *v278;
  uint64_t v279;
  unint64_t v280;
  unint64_t v281;
  void *v282;
  uint64_t v283;
  uint64_t v284;
  uint64_t v285;
  void *v286;
  __int128 v287;
  __int128 v288;
  __int128 v289;
  __int128 v290;
  __int128 v291;
  __int128 v292;
  __int128 v293;
  __int128 v294;
  _QWORD v295[4];
  id v296;
  __int128 v297;
  __int128 v298;
  __int128 v299;
  __int128 v300;
  __int128 v301;
  __int128 v302;
  __int128 v303;
  __int128 v304;
  _QWORD v305[5];
  _BYTE v306[128];
  _BYTE v307[128];
  _BYTE v308[128];
  uint8_t v309[128];
  uint8_t buf[4];
  void *v311;
  __int16 v312;
  uint64_t v313;
  __int16 v314;
  unint64_t v315;
  __int16 v316;
  unint64_t v317;
  uint64_t v318;

  v318 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v256 = a4;
  _rt_log_facility_get_os_log(RTLogFacilityMetric);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v311 = v8;
    v312 = 2048;
    v313 = objc_msgSend(v6, "count");
    v314 = 2112;
    v315 = (unint64_t)v256;
    v316 = 2048;
    v317 = a5;
    _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%@, query count, %lu, visit entry date, %@, poi muid, %lu", buf, 0x2Au);

  }
  v9 = (void *)objc_opt_new();
  v259 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 3);
  v10 = (void *)objc_opt_new();
  v252 = v6;
  if (objc_msgSend(v6, "count"))
  {
    v11 = 0;
    v12 = 1;
    do
    {
      if ((v11 & 1) == 0)
      {
        objc_msgSend(v6, "objectAtIndexedSubscript:", v12 - 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "placeInference");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "mapItem");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v15)
        {
          objc_msgSend(v6, "objectAtIndexedSubscript:", v12 - 1);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v23);
          goto LABEL_13;
        }
        v11 = 1;
      }
      objc_msgSend(v6, "objectAtIndexedSubscript:", v12 - 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v259, "addObject:", v16);

      if ((v11 & 1) == 0)
        continue;
      if (v12 - 1 != objc_msgSend(v6, "count") - 1)
      {
        objc_msgSend(v6, "objectAtIndexedSubscript:", v12);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "date");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectAtIndexedSubscript:", v12 - 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "date");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "timeIntervalSinceDate:", v20);
        v22 = v21;

        v6 = v252;
        if (v22 <= 1.0)
          continue;
      }
      v23 = v259;
      objc_msgSend(v9, "addObject:", v259);
      v259 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 3);
LABEL_13:

    }
    while (v12++ < objc_msgSend(v6, "count"));
  }
  _rt_log_facility_get_os_log(RTLogFacilityMetric);
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v9, "count");
    *(_DWORD *)buf = 138412546;
    v311 = v26;
    v312 = 2048;
    v313 = v27;
    _os_log_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_INFO, "%@, query group count, %lu", buf, 0x16u);

  }
  v28 = MEMORY[0x1E0C809B0];
  v305[0] = MEMORY[0x1E0C809B0];
  v305[1] = 3221225472;
  v305[2] = __79__RTPointOfInterestMetricsManager_processQueries_visitEntryDate_poiIdentifier___block_invoke;
  v305[3] = &__block_descriptor_40_e24_v32__0__NSArray_8Q16_B24l;
  v305[4] = a2;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v305);
  v29 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setObject:forKeyedSubscript:", v30, CFSTR("queryCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v10, "count") + objc_msgSend(v9, "count"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setObject:forKeyedSubscript:", v31, CFSTR("queryTotalCount"));

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), a5);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v271 = v29;
  objc_msgSend(v29, "setObject:forKeyedSubscript:", v32, CFSTR("muid"));

  v303 = 0u;
  v304 = 0u;
  v301 = 0u;
  v302 = 0u;
  obj = v10;
  v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v301, v309, 16);
  if (v33)
  {
    v34 = v33;
    v35 = 0;
    v36 = 0;
    v37 = *(_QWORD *)v302;
    do
    {
      for (i = 0; i != v34; ++i)
      {
        if (*(_QWORD *)v302 != v37)
          objc_enumerationMutation(obj);
        v39 = *(void **)(*((_QWORD *)&v301 + 1) + 8 * i);
        if (objc_msgSend(v39, "errorCode") != -1)
        {
          if (objc_msgSend(v39, "errorCode") == 7)
            ++v35;
          ++v36;
        }
      }
      v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v301, v309, 16);
    }
    while (v34);
  }
  else
  {
    v35 = 0;
    v36 = 0;
  }

  v299 = 0u;
  v300 = 0u;
  v297 = 0u;
  v298 = 0u;
  v40 = v9;
  v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v297, v308, 16);
  v286 = v40;
  if (v41)
  {
    v42 = v41;
    v43 = *(_QWORD *)v298;
    do
    {
      for (j = 0; j != v42; ++j)
      {
        if (*(_QWORD *)v298 != v43)
          objc_enumerationMutation(v40);
        v45 = *(void **)(*((_QWORD *)&v297 + 1) + 8 * j);
        if (objc_msgSend(v45, "count"))
        {
          objc_msgSend(v45, "firstObject");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = objc_msgSend(v46, "errorCode");

          if (v47 != -1)
          {
            objc_msgSend(v45, "firstObject");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = objc_msgSend(v48, "errorCode");

            if (v49 == 7)
              ++v35;
            ++v36;
          }
          v40 = v286;
        }
      }
      v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v297, v308, 16);
    }
    while (v42);
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v36);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v271, "setObject:forKeyedSubscript:", v50, CFSTR("queryErrorCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v35);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v271, "setObject:forKeyedSubscript:", v51, CFSTR("emptyWiFiScanCount"));

  if (!objc_msgSend(v40, "count"))
  {
    v295[0] = v28;
    v295[1] = 3221225472;
    v295[2] = __79__RTPointOfInterestMetricsManager_processQueries_visitEntryDate_poiIdentifier___block_invoke_270;
    v295[3] = &unk_1E9299A08;
    v296 = v40;
    objc_msgSend(obj, "enumerateObjectsUsingBlock:", v295);

  }
  v264 = (void *)objc_opt_new();
  v52 = (void *)objc_opt_new();
  v262 = (void *)objc_opt_new();
  v53 = objc_msgSend(v40, "count");
  v54 = 10;
  if (v53 < 0xA)
    v54 = v53;
  v265 = v52;
  if (v54)
  {
    v55 = 0;
    v261 = 1;
    v56 = 0x1E0CB3000uLL;
    while (1)
    {
      objc_msgSend(v40, "objectAtIndexedSubscript:", v55);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = objc_msgSend(v57, "count");

      if (v58)
      {
        objc_msgSend(v40, "objectAtIndexedSubscript:", v55);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "firstObject");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "date");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "timeIntervalSinceDate:", v256);
        v63 = llround(v62);

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%lu%@"), CFSTR("visitEntryQuery"), v55 + 1, CFSTR("TimeOffset"));
        v64 = objc_claimAutoreleasedReturnValue();
        v65 = v63;
        v40 = v286;
        objc_msgSend(*(id *)(v56 + 2024), "numberWithInteger:", v65);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v260 = (void *)v64;
        objc_msgSend(v271, "setObject:forKeyedSubscript:", v66, v64);

        v267 = v55 + 1;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%lu%@"), CFSTR("visitEntryQuery"), v55 + 1, CFSTR("ErrorCode"));
        v67 = objc_claimAutoreleasedReturnValue();
        v68 = *(void **)(v56 + 2024);
        objc_msgSend(v286, "objectAtIndexedSubscript:", v55);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "firstObject");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "numberWithInteger:", objc_msgSend(v70, "errorCode"));
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v257 = (void *)v67;
        objc_msgSend(v271, "setObject:forKeyedSubscript:", v71, v67);

        objc_msgSend(v286, "objectAtIndexedSubscript:", v55);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        v73 = objc_msgSend(v72, "count");

        v74 = 3;
        if (v73 < 3)
          v74 = v73;
        if (v74)
        {
          v75 = 0;
          v272 = v55;
          while (1)
          {
            _rt_log_facility_get_os_log(RTLogFacilityMetric);
            v76 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v76, OS_LOG_TYPE_INFO))
            {
              NSStringFromSelector(a2);
              v77 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "objectAtIndexedSubscript:", v55);
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v78, "objectAtIndexedSubscript:", v75);
              v79 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413058;
              v311 = v77;
              v312 = 2048;
              v313 = v55;
              v314 = 2048;
              v315 = v75;
              v316 = 2112;
              v317 = (unint64_t)v79;
              _os_log_impl(&dword_1D1A22000, v76, OS_LOG_TYPE_INFO, "%@, group idx, %lu, result idx, %lu, query, %@", buf, 0x2Au);

              v40 = v286;
            }

            objc_msgSend(v40, "objectAtIndexedSubscript:", v55);
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v80, "objectAtIndexedSubscript:", v75);
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v81, "placeInference");
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v82, "mapItem");
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            if (v83)
            {
              objc_msgSend(v40, "objectAtIndexedSubscript:", v55);
              v84 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v84, "objectAtIndexedSubscript:", v75);
              v85 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v85, "placeInference");
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v86, "mapItem");
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              v88 = objc_msgSend(v87, "muid");

              v55 = v272;
              v56 = 0x1E0CB3000;

              v40 = v286;
            }
            else
            {
              v88 = 0;
            }

            objc_msgSend(v40, "objectAtIndexedSubscript:", v55);
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v89, "objectAtIndexedSubscript:", v75);
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v90, "placeInference");
            v91 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v91, "confidence");
            v93 = v92;

            if (v88 == a5)
            {
              v276 = 1;
              goto LABEL_67;
            }
            objc_msgSend(*(id *)(v56 + 2024), "numberWithUnsignedInteger:", v88);
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v264, "objectForKey:", v94);
            v95 = (void *)objc_claimAutoreleasedReturnValue();

            if (v95)
              break;
            if (v88)
            {
              objc_msgSend(*(id *)(v56 + 2024), "numberWithUnsignedInteger:", v261 + 1);
              v96 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(v56 + 2024), "numberWithUnsignedInteger:", v88);
              v97 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v264, "setObject:forKey:", v96, v97);
              v276 = ++v261;
              goto LABEL_66;
            }
            v276 = 0;
LABEL_67:
            v281 = vcvtad_u64_f64(v93 * 10000.0);
            objc_msgSend(v40, "objectAtIndexedSubscript:", v55);
            v98 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v98, "objectAtIndexedSubscript:", v75);
            v99 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v99, "placeInference");
            v100 = v55;
            v101 = v40;
            v102 = (void *)objc_claimAutoreleasedReturnValue();
            v103 = objc_msgSend(v102, "placeType");

            if (v103 == 3)
            {
              objc_msgSend(*(id *)(v56 + 2024), "numberWithUnsignedInteger:", v88);
              v104 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v265, "objectForKey:", v104);
              v105 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v105)
              {
                objc_msgSend(*(id *)(v56 + 2024), "numberWithUnsignedInteger:", v88);
                v106 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v265, "setObject:forKey:", &unk_1E9326F90, v106);

              }
              v107 = *(void **)(v56 + 2024);
              objc_msgSend(v107, "numberWithUnsignedInteger:", v88);
              v108 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v265, "objectForKeyedSubscript:", v108);
              v109 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v107, "numberWithUnsignedInteger:", objc_msgSend(v109, "unsignedIntegerValue") + 1);
              v110 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(v56 + 2024), "numberWithUnsignedInteger:", v88);
              v111 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v265, "setObject:forKey:", v110, v111);
              v112 = 1;
            }
            else
            {
              objc_msgSend(v101, "objectAtIndexedSubscript:", v100);
              v113 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v113, "objectAtIndexedSubscript:", v75);
              v114 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v114, "placeInference");
              v115 = (void *)objc_claimAutoreleasedReturnValue();
              v116 = objc_msgSend(v115, "placeType");

              if (v116 != 2)
              {
                v121 = v88;
                v279 = 0;
                v122 = v56;
                goto LABEL_77;
              }
              objc_msgSend(*(id *)(v56 + 2024), "numberWithUnsignedInteger:", v88);
              v117 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v262, "objectForKey:", v117);
              v118 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v118)
              {
                objc_msgSend(*(id *)(v56 + 2024), "numberWithUnsignedInteger:", v88);
                v119 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v262, "setObject:forKey:", &unk_1E9326F90, v119);

              }
              v120 = *(void **)(v56 + 2024);
              objc_msgSend(v120, "numberWithUnsignedInteger:", v88);
              v108 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v262, "objectForKeyedSubscript:", v108);
              v109 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v120, "numberWithUnsignedInteger:", objc_msgSend(v109, "unsignedIntegerValue") + 1);
              v110 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(v56 + 2024), "numberWithUnsignedInteger:", v88);
              v111 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v262, "setObject:forKey:", v110, v111);
              v112 = 2;
            }
            v279 = v112;
            v121 = v88;

            v122 = 0x1E0CB3000;
LABEL_77:
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%lu%@%lu%@"), CFSTR("visitEntryQuery"), v267, CFSTR("Result"), v75 + 1, CFSTR("Muid"));
            v274 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), v121);
            v123 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v271, "setObject:forKeyedSubscript:", v123, v274);

            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%lu%@%lu%@"), CFSTR("visitEntryQuery"), v267, CFSTR("Result"), v75 + 1, CFSTR("Match"));
            v124 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(v122 + 2024), "numberWithUnsignedInteger:", v276);
            v125 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v271, "setObject:forKeyedSubscript:", v125, v124);

            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%lu%@%lu%@"), CFSTR("visitEntryQuery"), v267, CFSTR("Result"), v75 + 1, CFSTR("Confidence"));
            v126 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(v122 + 2024), "numberWithUnsignedInteger:", v281);
            v127 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v271, "setObject:forKeyedSubscript:", v127, v126);

            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%lu%@%lu%@"), CFSTR("visitEntryQuery"), v267, CFSTR("Result"), ++v75, CFSTR("PoiSize"));
            v128 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(v122 + 2024), "numberWithUnsignedInteger:", v279);
            v129 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v271, "setObject:forKeyedSubscript:", v129, v128);

            v40 = v286;
            objc_msgSend(v286, "objectAtIndexedSubscript:", v272);
            v130 = (void *)objc_claimAutoreleasedReturnValue();
            v131 = objc_msgSend(v130, "count");

            v132 = 3;
            if (v131 < 3)
              v132 = v131;
            v56 = v122;
            v55 = v272;
            if (v75 >= v132)
              goto LABEL_82;
          }
          objc_msgSend(*(id *)(v56 + 2024), "numberWithUnsignedInteger:", v88);
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v264, "objectForKey:", v96);
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          v276 = objc_msgSend(v97, "unsignedIntegerValue");
LABEL_66:

          goto LABEL_67;
        }
LABEL_82:

        v52 = v265;
        v133 = v267;
      }
      else
      {
        v133 = v55 + 1;
      }
      v134 = objc_msgSend(v40, "count");
      v135 = 10;
      if (v134 < 0xA)
        v135 = v134;
      v55 = v133;
      if (v133 >= v135)
        goto LABEL_89;
    }
  }
  v261 = 1;
  v56 = 0x1E0CB3000uLL;
LABEL_89:
  if ((unint64_t)objc_msgSend(v40, "count") > 0xA)
  {
    v136 = objc_msgSend(v40, "count");
    if ((v136 - 10) / 0xAuLL <= 1)
      v137 = 1;
    else
      v137 = (v136 - 10) / 0xAuLL;
    v138 = objc_msgSend(v40, "count");
    v139 = 10 * v137 + 10;
    if (v138 < v139)
      v139 = v138;
    v253 = v139;
    v254 = v137;
    if (v139 >= 0xB)
    {
      v268 = 1;
      v140 = 10;
      do
      {
        objc_msgSend(v40, "objectAtIndexedSubscript:", v140);
        v141 = (void *)objc_claimAutoreleasedReturnValue();
        v142 = objc_msgSend(v141, "count");

        if (v142)
        {
          objc_msgSend(v40, "objectAtIndexedSubscript:", v140);
          v143 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v143, "firstObject");
          v144 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v144, "date");
          v145 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v145, "timeIntervalSinceDate:", v256);
          v147 = llround(v146);

          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%lu%@"), CFSTR("visitDwellQuery"), v268, CFSTR("TimeOffset"));
          v148 = objc_claimAutoreleasedReturnValue();
          v149 = v147;
          v40 = v286;
          objc_msgSend(*(id *)(v56 + 2024), "numberWithInteger:", v149);
          v150 = (void *)objc_claimAutoreleasedReturnValue();
          v258 = (void *)v148;
          objc_msgSend(v271, "setObject:forKeyedSubscript:", v150, v148);

          v263 = v140 + 1;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%lu%@"), CFSTR("visitDwellQuery"), v140 + 1, CFSTR("ErrorCode"));
          v151 = objc_claimAutoreleasedReturnValue();
          v152 = *(void **)(v56 + 2024);
          objc_msgSend(v286, "objectAtIndexedSubscript:", v140);
          v153 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v153, "firstObject");
          v154 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v152, "numberWithInteger:", objc_msgSend(v154, "errorCode"));
          v155 = (void *)objc_claimAutoreleasedReturnValue();
          v255 = (void *)v151;
          objc_msgSend(v271, "setObject:forKeyedSubscript:", v155, v151);

          objc_msgSend(v286, "objectAtIndexedSubscript:", v140);
          v156 = (void *)objc_claimAutoreleasedReturnValue();
          v157 = objc_msgSend(v156, "count");

          v158 = 3;
          if (v157 < 3)
            v158 = v157;
          if (v158)
          {
            v159 = 0;
            v273 = v140;
            while (1)
            {
              _rt_log_facility_get_os_log(RTLogFacilityMetric);
              v160 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v160, OS_LOG_TYPE_INFO))
              {
                NSStringFromSelector(a2);
                v161 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v40, "objectAtIndexedSubscript:", v140);
                v162 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v162, "objectAtIndexedSubscript:", v159);
                v163 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138413058;
                v311 = v161;
                v312 = 2048;
                v313 = v140;
                v314 = 2048;
                v315 = (unint64_t)v159;
                v316 = 2112;
                v317 = (unint64_t)v163;
                _os_log_impl(&dword_1D1A22000, v160, OS_LOG_TYPE_INFO, "%@, group idx, %lu, result idx, %lu, query, %@", buf, 0x2Au);

                v40 = v286;
              }

              objc_msgSend(v40, "objectAtIndexedSubscript:", v140);
              v164 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v164, "objectAtIndexedSubscript:", v159);
              v165 = v40;
              v166 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v166, "placeInference");
              v167 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v167, "mapItem");
              v168 = (void *)objc_claimAutoreleasedReturnValue();
              if (v168)
              {
                objc_msgSend(v40, "objectAtIndexedSubscript:", v140);
                v282 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v282, "objectAtIndexedSubscript:", v159);
                v169 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v169, "placeInference");
                v170 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v170, "mapItem");
                v171 = v164;
                v172 = v159;
                v173 = v40;
                v174 = (void *)objc_claimAutoreleasedReturnValue();
                v175 = objc_msgSend(v174, "muid");

                v165 = v173;
                v159 = v172;
                v164 = v171;

                v140 = v273;
                v56 = 0x1E0CB3000;

              }
              else
              {
                v175 = 0;
              }

              objc_msgSend(v165, "objectAtIndexedSubscript:", v140);
              v176 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v176, "objectAtIndexedSubscript:", v159);
              v177 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v177, "placeInference");
              v178 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v178, "confidence");
              v180 = v179;

              if (v175 == a5)
              {
                v283 = 1;
                goto LABEL_114;
              }
              objc_msgSend(*(id *)(v56 + 2024), "numberWithUnsignedInteger:", v175);
              v181 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v264, "objectForKey:", v181);
              v182 = (void *)objc_claimAutoreleasedReturnValue();

              if (v182)
                break;
              if (v175)
              {
                objc_msgSend(*(id *)(v56 + 2024), "numberWithUnsignedInteger:", v261 + 1);
                v183 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(v56 + 2024), "numberWithUnsignedInteger:", v175);
                v184 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v264, "setObject:forKey:", v183, v184);
                v283 = ++v261;
                goto LABEL_113;
              }
              v283 = 0;
LABEL_114:
              objc_msgSend(v286, "objectAtIndexedSubscript:", v140);
              v185 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v185, "objectAtIndexedSubscript:", v159);
              v186 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v186, "placeInference");
              v187 = (void *)objc_claimAutoreleasedReturnValue();
              v188 = objc_msgSend(v187, "placeType");

              v280 = vcvtad_u64_f64(v180 * 10000.0);
              if (v188 == 3)
              {
                objc_msgSend(*(id *)(v56 + 2024), "numberWithUnsignedInteger:", v175);
                v189 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v265, "objectForKey:", v189);
                v190 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v190)
                {
                  objc_msgSend(*(id *)(v56 + 2024), "numberWithUnsignedInteger:", v175);
                  v191 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v265, "setObject:forKey:", &unk_1E9326F90, v191);

                }
                v192 = *(void **)(v56 + 2024);
                objc_msgSend(v192, "numberWithUnsignedInteger:", v175);
                v193 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v265, "objectForKeyedSubscript:", v193);
                v194 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v192, "numberWithUnsignedInteger:", objc_msgSend(v194, "unsignedIntegerValue") + 1);
                v195 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(v56 + 2024), "numberWithUnsignedInteger:", v175);
                v196 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v265, "setObject:forKey:", v195, v196);
                v197 = 1;
              }
              else
              {
                objc_msgSend(v286, "objectAtIndexedSubscript:", v140);
                v198 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v198, "objectAtIndexedSubscript:", v159);
                v199 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v199, "placeInference");
                v200 = (void *)objc_claimAutoreleasedReturnValue();
                v201 = objc_msgSend(v200, "placeType");

                if (v201 != 2)
                {
                  v277 = 0;
                  v206 = v56;
                  goto LABEL_124;
                }
                objc_msgSend(*(id *)(v56 + 2024), "numberWithUnsignedInteger:", v175);
                v202 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v262, "objectForKey:", v202);
                v203 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v203)
                {
                  objc_msgSend(*(id *)(v56 + 2024), "numberWithUnsignedInteger:", v175);
                  v204 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v262, "setObject:forKey:", &unk_1E9326F90, v204);

                }
                v205 = *(void **)(v56 + 2024);
                objc_msgSend(v205, "numberWithUnsignedInteger:", v175);
                v193 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v262, "objectForKeyedSubscript:", v193);
                v194 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v205, "numberWithUnsignedInteger:", objc_msgSend(v194, "unsignedIntegerValue") + 1);
                v195 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(v56 + 2024), "numberWithUnsignedInteger:", v175);
                v196 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v262, "setObject:forKey:", v195, v196);
                v197 = 2;
              }
              v277 = v197;

              v206 = 0x1E0CB3000;
LABEL_124:
              v207 = (unint64_t)(v159 + 1);
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%lu%@%lu%@"), CFSTR("visitDwellQuery"), v263, CFSTR("Result"), v159 + 1, CFSTR("Muid"));
              v275 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), v175);
              v208 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v271, "setObject:forKeyedSubscript:", v208, v275);

              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%lu%@%lu%@"), CFSTR("visitDwellQuery"), v268, CFSTR("Result"), v159 + 1, CFSTR("Match"));
              v209 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(v206 + 2024), "numberWithUnsignedInteger:", v283);
              v210 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v271, "setObject:forKeyedSubscript:", v210, v209);

              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%lu%@%lu%@"), CFSTR("visitDwellQuery"), v268, CFSTR("Result"), v207, CFSTR("Confidence"));
              v56 = v206;
              v211 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(v56 + 2024), "numberWithUnsignedInteger:", v280);
              v212 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v271, "setObject:forKeyedSubscript:", v212, v211);

              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%lu%@%lu%@"), CFSTR("visitDwellQuery"), v268, CFSTR("Result"), v207, CFSTR("PoiSize"));
              v213 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(v56 + 2024), "numberWithUnsignedInteger:", v277);
              v214 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v271, "setObject:forKeyedSubscript:", v214, v213);

              v40 = v286;
              v140 = v273;
              objc_msgSend(v286, "objectAtIndexedSubscript:", v273);
              v215 = (void *)objc_claimAutoreleasedReturnValue();
              v216 = objc_msgSend(v215, "count");

              v217 = 3;
              if (v216 < 3)
                v217 = v216;
              v159 = (char *)v207;
              if (v207 >= v217)
                goto LABEL_129;
            }
            objc_msgSend(*(id *)(v56 + 2024), "numberWithUnsignedInteger:", v175);
            v183 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v264, "objectForKey:", v183);
            v184 = (void *)objc_claimAutoreleasedReturnValue();
            v283 = objc_msgSend(v184, "unsignedIntegerValue");
LABEL_113:

            goto LABEL_114;
          }
LABEL_129:
          ++v268;

          v52 = v265;
        }
        v140 += v254;
      }
      while (v140 < v253);
    }
  }
  v293 = 0u;
  v294 = 0u;
  v291 = 0u;
  v292 = 0u;
  v218 = v52;
  v219 = objc_msgSend(v218, "countByEnumeratingWithState:objects:count:", &v291, v307, 16);
  if (v219)
  {
    v220 = v219;
    v284 = 0;
    v221 = 0;
    v222 = *(_QWORD *)v292;
    do
    {
      for (k = 0; k != v220; ++k)
      {
        if (*(_QWORD *)v292 != v222)
          objc_enumerationMutation(v218);
        v224 = *(void **)(*((_QWORD *)&v291 + 1) + 8 * k);
        objc_msgSend(v218, "objectForKeyedSubscript:", v224);
        v225 = (void *)objc_claimAutoreleasedReturnValue();
        v226 = objc_msgSend(v225, "unsignedIntegerValue");

        if (v226 > v221)
        {
          v284 = objc_msgSend(v224, "unsignedIntegerValue");
          v221 = v226;
        }
        _rt_log_facility_get_os_log(RTLogFacilityMetric);
        v227 = objc_claimAutoreleasedReturnValue();
        v56 = 0x1E0CB3000;
        if (os_log_type_enabled(v227, OS_LOG_TYPE_DEBUG))
        {
          NSStringFromSelector(a2);
          v228 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          v311 = v228;
          v312 = 2112;
          v313 = (uint64_t)v224;
          v314 = 2048;
          v315 = v226;
          v316 = 2048;
          v317 = v221;
          _os_log_debug_impl(&dword_1D1A22000, v227, OS_LOG_TYPE_DEBUG, "%@, POI label, %@, count, %lu, max count, %lu", buf, 0x2Au);

          v56 = 0x1E0CB3000;
        }

      }
      v220 = objc_msgSend(v218, "countByEnumeratingWithState:objects:count:", &v291, v307, 16);
    }
    while (v220);
  }
  else
  {
    v284 = 0;
    v221 = 0;
  }
  v278 = v218;

  _rt_log_facility_get_os_log(RTLogFacilityMetric);
  v229 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v229, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v230 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v311 = v230;
    v312 = 2048;
    v313 = v284;
    v314 = 2048;
    v315 = v221;
    _os_log_impl(&dword_1D1A22000, v229, OS_LOG_TYPE_INFO, "%@, aggregated POI label, %lu, count, %lu", buf, 0x20u);

  }
  v231 = 1;
  if (v284 != a5)
    v231 = 2;
  if (v284)
    v232 = v231;
  else
    v232 = 0;
  objc_msgSend(*(id *)(v56 + 2024), "numberWithUnsignedInteger:", v232);
  v233 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v271, "setObject:forKeyedSubscript:", v233, CFSTR("aggregatedResult1Match"));

  objc_msgSend(v271, "setObject:forKeyedSubscript:", &unk_1E9326FA8, CFSTR("aggregatedResult1PoiSize"));
  v289 = 0u;
  v290 = 0u;
  v287 = 0u;
  v288 = 0u;
  v234 = v262;
  v235 = objc_msgSend(v234, "countByEnumeratingWithState:objects:count:", &v287, v306, 16);
  if (v235)
  {
    v236 = v235;
    v285 = 0;
    v237 = 0;
    v238 = *(_QWORD *)v288;
    do
    {
      for (m = 0; m != v236; ++m)
      {
        if (*(_QWORD *)v288 != v238)
          objc_enumerationMutation(v234);
        v240 = *(void **)(*((_QWORD *)&v287 + 1) + 8 * m);
        objc_msgSend(v234, "objectForKeyedSubscript:", v240);
        v241 = (void *)objc_claimAutoreleasedReturnValue();
        v242 = objc_msgSend(v241, "unsignedIntegerValue");

        if (v242 > v237)
        {
          v285 = objc_msgSend(v240, "unsignedIntegerValue");
          v237 = v242;
        }
        _rt_log_facility_get_os_log(RTLogFacilityMetric);
        v243 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v243, OS_LOG_TYPE_DEBUG))
        {
          NSStringFromSelector(a2);
          v244 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          v311 = v244;
          v312 = 2112;
          v313 = (uint64_t)v240;
          v314 = 2048;
          v315 = v242;
          v316 = 2048;
          v317 = v237;
          _os_log_debug_impl(&dword_1D1A22000, v243, OS_LOG_TYPE_DEBUG, "%@, AOI label, %@, count, %lu, max count, %lu", buf, 0x2Au);

          v56 = 0x1E0CB3000;
        }

      }
      v236 = objc_msgSend(v234, "countByEnumeratingWithState:objects:count:", &v287, v306, 16);
    }
    while (v236);
  }
  else
  {
    v285 = 0;
    v237 = 0;
  }

  _rt_log_facility_get_os_log(RTLogFacilityMetric);
  v245 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v245, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v246 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v311 = v246;
    v312 = 2048;
    v313 = v285;
    v314 = 2048;
    v315 = v237;
    _os_log_impl(&dword_1D1A22000, v245, OS_LOG_TYPE_INFO, "%@, aggregated AOI label, %lu, count, %lu", buf, 0x20u);

  }
  v247 = 1;
  if (v285 != a5)
    v247 = 2;
  if (v285)
    v248 = v247;
  else
    v248 = 0;
  objc_msgSend(*(id *)(v56 + 2024), "numberWithUnsignedInteger:", v248);
  v249 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v271, "setObject:forKeyedSubscript:", v249, CFSTR("aggregatedResult2Match"));

  objc_msgSend(v271, "setObject:forKeyedSubscript:", &unk_1E9326FD8, CFSTR("aggregatedResult2PoiSize"));
  v250 = v271;

  return v250;
}

void __79__RTPointOfInterestMetricsManager_processQueries_visitEntryDate_poiIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityMetric);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(a1 + 32));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412802;
    v9 = v7;
    v10 = 2048;
    v11 = a3;
    v12 = 2048;
    v13 = objc_msgSend(v5, "count");
    _os_log_debug_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_DEBUG, "%@, group idx, %lu, query count, %lu", (uint8_t *)&v8, 0x20u);

  }
}

void __79__RTPointOfInterestMetricsManager_processQueries_visitEntryDate_poiIdentifier___block_invoke_270(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v6 = a2;
  v3 = (void *)MEMORY[0x1E0C99D20];
  v4 = a2;
  objc_msgSend(v3, "arrayWithObjects:count:", &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v5, v6, v7);

}

- (unint64_t)getTruthPointOfInterestIdentifier
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[RTPointOfInterestMetricsManager defaultsManager](self, "defaultsManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("PointOfInterestMetricsManagerTruthLabelIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "unsignedIntegerValue");
  else
    v4 = 0;

  return v4;
}

- (RTBatteryManager)batteryManager
{
  return self->_batteryManager;
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (RTDistanceCalculator)distanceCalculator
{
  return self->_distanceCalculator;
}

- (RTLearnedLocationStore)learnedLocationStore
{
  return self->_learnedLocationStore;
}

- (RTLocationManager)locationManager
{
  return self->_locationManager;
}

- (RTMapServiceManager)mapServiceManager
{
  return self->_mapServiceManager;
}

- (RTNavigationManager)navigationManager
{
  return self->_navigationManager;
}

- (RTPlaceInferenceQueryStore)placeInferenceQueryStore
{
  return self->_placeInferenceQueryStore;
}

- (RTPointOfInterestSampler)pointOfInterestSampler
{
  return self->_pointOfInterestSampler;
}

- (RTScenarioTriggerManager)scenarioTriggerManager
{
  return self->_scenarioTriggerManager;
}

- (RTTimerManager)timerManager
{
  return self->_timerManager;
}

- (RTVisitManager)visitManager
{
  return self->_visitManager;
}

- (NSMutableArray)locationDenyList
{
  return self->_locationDenyList;
}

- (BOOL)samplingPointOfInterest
{
  return self->_samplingPointOfInterest;
}

- (unint64_t)settledState
{
  return self->_settledState;
}

- (RTTimer)samplingTimer
{
  return self->_samplingTimer;
}

- (void)setSamplingTimer:(id)a3
{
  objc_storeStrong((id *)&self->_samplingTimer, a3);
}

- (int)currentSignalEnvironmentType
{
  return self->_currentSignalEnvironmentType;
}

- (RTMapItem)navigationDestination
{
  return self->_navigationDestination;
}

- (void)setNavigationDestination:(id)a3
{
  objc_storeStrong((id *)&self->_navigationDestination, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationDestination, 0);
  objc_storeStrong((id *)&self->_samplingTimer, 0);
  objc_storeStrong((id *)&self->_locationDenyList, 0);
  objc_storeStrong((id *)&self->_visitManager, 0);
  objc_storeStrong((id *)&self->_timerManager, 0);
  objc_storeStrong((id *)&self->_scenarioTriggerManager, 0);
  objc_storeStrong((id *)&self->_pointOfInterestSampler, 0);
  objc_storeStrong((id *)&self->_placeInferenceQueryStore, 0);
  objc_storeStrong((id *)&self->_navigationManager, 0);
  objc_storeStrong((id *)&self->_mapServiceManager, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_learnedLocationStore, 0);
  objc_storeStrong((id *)&self->_distanceCalculator, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_batteryManager, 0);
}

@end
