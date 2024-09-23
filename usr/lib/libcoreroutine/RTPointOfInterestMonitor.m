@implementation RTPointOfInterestMonitor

- (RTPointOfInterestMonitor)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithAppClipManager_buildingPolygonManager_dailyMetrics_defaultsManager_distanceCalculator_eventMetrics_learnedLocationManager_locationManager_mapServiceManager_motionActivityManager_navigationManager_platform_timerManager_vehicleLocationProvider_visitLabeler_visitStore_);
}

- (RTPointOfInterestMonitor)initWithAppClipManager:(id)a3 buildingPolygonManager:(id)a4 defaultsManager:(id)a5 distanceCalculator:(id)a6 learnedLocationManager:(id)a7 locationManager:(id)a8 mapServiceManager:(id)a9 motionActivityManager:(id)a10 navigationManager:(id)a11 platform:(id)a12 vehicleLocationProvider:(id)a13 visitLabeler:(id)a14 visitStore:(id)a15
{
  id v19;
  id v20;
  RTPointOfInterestMonitorEventMetrics *v21;
  id v23;
  RTPointOfInterestMonitorDailyMetrics *v24;
  id v25;
  Class v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  RTPointOfInterestMonitor *v33;
  id v35;
  id v37;
  id v38;
  id v39;

  v31 = a15;
  v30 = a14;
  v29 = a13;
  v19 = a12;
  v28 = a11;
  v27 = a10;
  v25 = a9;
  v39 = a8;
  v38 = a7;
  v20 = a6;
  v23 = a5;
  v37 = a4;
  v35 = a3;
  v24 = -[RTPointOfInterestMonitorDailyMetrics initWithDefaultsManager:]([RTPointOfInterestMonitorDailyMetrics alloc], "initWithDefaultsManager:", v23);
  v21 = -[RTPointOfInterestMonitorEventMetrics initWithDistanceCalculator:]([RTPointOfInterestMonitorEventMetrics alloc], "initWithDistanceCalculator:", v20);
  v26 = (Class)objc_opt_new();
  v33 = -[RTPointOfInterestMonitor initWithAppClipManager:buildingPolygonManager:dailyMetrics:defaultsManager:distanceCalculator:eventMetrics:learnedLocationManager:locationManager:mapServiceManager:motionActivityManager:navigationManager:platform:timerManager:vehicleLocationProvider:visitLabeler:visitStore:](self, "initWithAppClipManager:buildingPolygonManager:dailyMetrics:defaultsManager:distanceCalculator:eventMetrics:learnedLocationManager:locationManager:mapServiceManager:motionActivityManager:navigationManager:platform:timerManager:vehicleLocationProvider:visitLabeler:visitStore:", v35, v37, v24, v23, v20, v21, v38, v39, v25, v27, v28, v19, v26, v29, v30,
          v31);

  return v33;
}

- (RTPointOfInterestMonitor)initWithAppClipManager:(id)a3 buildingPolygonManager:(id)a4 dailyMetrics:(id)a5 defaultsManager:(id)a6 distanceCalculator:(id)a7 eventMetrics:(id)a8 learnedLocationManager:(id)a9 locationManager:(id)a10 mapServiceManager:(id)a11 motionActivityManager:(id)a12 navigationManager:(id)a13 platform:(id)a14 timerManager:(id)a15 vehicleLocationProvider:(id)a16 visitLabeler:(id)a17 visitStore:(id)a18
{
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  RTPointOfInterestMonitor *v31;
  RTPointOfInterestMonitor *v32;
  objc_class *v33;
  uint64_t v34;
  NSString *regionMonitoringClientIdentifer;
  NSDate *lastMonitoringDate;
  RTTimer *locationRequestTimer;
  RTTimer *metricsSubmissionTimer;
  RTTimer *regionMonitorTimer;
  RTLocation *navigationDestination;
  uint64_t v41;
  NSMutableArray *monitoringLocationDenyList;
  RTPointOfInterestMonitor *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  NSObject *v49;
  NSObject *v50;
  const char *v51;
  NSObject *v53;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  void *v61;
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
  v55 = a4;
  v23 = a4;
  v60 = a5;
  v70 = a6;
  v56 = a7;
  v59 = a7;
  v58 = a8;
  v57 = a9;
  v69 = a10;
  v24 = a11;
  v68 = a12;
  v67 = a13;
  v66 = a14;
  v65 = a15;
  v64 = a16;
  v63 = a17;
  v25 = a18;
  v61 = v25;
  if (!v71)
  {
    v26 = v23;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v44, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: appClipManager", buf, 2u);
    }

    v43 = 0;
    v46 = v70;
    v45 = 0;
    v27 = v59;
    v28 = v60;
    v30 = v57;
    v29 = v58;
    goto LABEL_56;
  }
  v26 = v23;
  if (!v23)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v47 = objc_claimAutoreleasedReturnValue();
    v27 = v59;
    v28 = v60;
    v48 = v69;
    v46 = v70;
    v30 = v57;
    v29 = v58;
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v47, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: buildingPolygonManager", buf, 2u);
    }

    v43 = 0;
    v45 = v71;
    goto LABEL_57;
  }
  v27 = v59;
  v28 = v60;
  v30 = v57;
  v29 = v58;
  if (!v60)
  {
    v46 = v70;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v49, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dailyMetrics", buf, 2u);
    }

    v43 = 0;
    v45 = v71;
    goto LABEL_56;
  }
  if (!v70)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v50 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      goto LABEL_54;
    *(_WORD *)buf = 0;
    v51 = "Invalid parameter not satisfying: defaultsManager";
LABEL_53:
    _os_log_error_impl(&dword_1D1A22000, v50, OS_LOG_TYPE_ERROR, v51, buf, 2u);
    goto LABEL_54;
  }
  if (!v59)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v50 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      goto LABEL_54;
    *(_WORD *)buf = 0;
    v51 = "Invalid parameter not satisfying: distanceCalculator";
    goto LABEL_53;
  }
  if (!v58)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v50 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      goto LABEL_54;
    *(_WORD *)buf = 0;
    v51 = "Invalid parameter not satisfying: eventMetrics";
    goto LABEL_53;
  }
  if (!v57)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v50 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      goto LABEL_54;
    *(_WORD *)buf = 0;
    v51 = "Invalid parameter not satisfying: learnedLocationManager";
    goto LABEL_53;
  }
  if (!v69)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v50 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      goto LABEL_54;
    *(_WORD *)buf = 0;
    v51 = "Invalid parameter not satisfying: locationManager";
    goto LABEL_53;
  }
  if (!v24)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v50 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      goto LABEL_54;
    *(_WORD *)buf = 0;
    v51 = "Invalid parameter not satisfying: mapServiceManager";
    goto LABEL_53;
  }
  if (!v68)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v50 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      goto LABEL_54;
    *(_WORD *)buf = 0;
    v51 = "Invalid parameter not satisfying: motionActivityManager";
    goto LABEL_53;
  }
  if (!v67)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v50 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      goto LABEL_54;
    *(_WORD *)buf = 0;
    v51 = "Invalid parameter not satisfying: navigationManager";
    goto LABEL_53;
  }
  if (!v66)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v50 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      goto LABEL_54;
    *(_WORD *)buf = 0;
    v51 = "Invalid parameter not satisfying: platform";
    goto LABEL_53;
  }
  if (!v65)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v50 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      goto LABEL_54;
    *(_WORD *)buf = 0;
    v51 = "Invalid parameter not satisfying: timerManager";
    goto LABEL_53;
  }
  if (!v64)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v50 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      goto LABEL_54;
    *(_WORD *)buf = 0;
    v51 = "Invalid parameter not satisfying: vehicleLocationProvider";
    goto LABEL_53;
  }
  if (!v63)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v51 = "Invalid parameter not satisfying: visitLabeler";
      goto LABEL_53;
    }
LABEL_54:

    v43 = 0;
LABEL_55:
    v46 = v70;
    v45 = v71;
LABEL_56:
    v48 = v69;
    goto LABEL_57;
  }
  if (v25)
  {
    v72.receiver = self;
    v72.super_class = (Class)RTPointOfInterestMonitor;
    v31 = -[RTNotifier init](&v72, sel_init);
    v32 = v31;
    if (v31)
    {
      objc_storeStrong((id *)&v31->_appClipManager, a3);
      objc_storeStrong((id *)&v32->_buildingPolygonManager, v55);
      objc_storeStrong((id *)&v32->_defaultsManager, a6);
      objc_storeStrong((id *)&v32->_dailyMetrics, a5);
      objc_storeStrong((id *)&v32->_distanceCalculator, v56);
      objc_storeStrong((id *)&v32->_eventMetrics, a8);
      objc_storeStrong((id *)&v32->_learnedLocationManager, a9);
      objc_storeStrong((id *)&v32->_locationManager, a10);
      objc_storeStrong((id *)&v32->_motionActivityManager, a12);
      objc_storeStrong((id *)&v32->_mapServiceManager, a11);
      objc_storeStrong((id *)&v32->_navigationManager, a13);
      objc_storeStrong((id *)&v32->_platform, a14);
      objc_storeStrong((id *)&v32->_vehicleLocationProvider, a16);
      objc_storeStrong((id *)&v32->_timerManager, a15);
      objc_storeStrong((id *)&v32->_visitLabeler, a17);
      objc_storeStrong((id *)&v32->_visitStore, a18);
      v33 = (objc_class *)objc_opt_class();
      NSStringFromClass(v33);
      v34 = objc_claimAutoreleasedReturnValue();
      regionMonitoringClientIdentifer = v32->_regionMonitoringClientIdentifer;
      v32->_regionMonitoringClientIdentifer = (NSString *)v34;

      lastMonitoringDate = v32->_lastMonitoringDate;
      v32->_lastMonitoringDate = 0;

      locationRequestTimer = v32->_locationRequestTimer;
      v32->_locationRequestTimer = 0;

      metricsSubmissionTimer = v32->_metricsSubmissionTimer;
      v32->_metricsSubmissionTimer = 0;

      regionMonitorTimer = v32->_regionMonitorTimer;
      v32->_regionMonitorTimer = 0;

      v32->_requestingHighAccuracyLocation = 0;
      navigationDestination = v32->_navigationDestination;
      v32->_navigationDestination = 0;

      v32->_registeredForRegionEvents = 0;
      v41 = objc_opt_new();
      monitoringLocationDenyList = v32->_monitoringLocationDenyList;
      v32->_monitoringLocationDenyList = (NSMutableArray *)v41;

    }
    -[RTService setup](v32, "setup");
    v43 = v32;
    self = v43;
    goto LABEL_55;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v53 = objc_claimAutoreleasedReturnValue();
  v46 = v70;
  v45 = v71;
  v48 = v69;
  if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v53, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: visitStore", buf, 2u);
  }

  v43 = 0;
LABEL_57:

  return v43;
}

- (void)_setup
{
  void *v3;
  int v4;
  void *v5;

  if (_os_feature_enabled_impl())
  {
    -[RTPointOfInterestMonitor platform](self, "platform");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "iPhoneDevice");

    if (v4)
    {
      -[RTPointOfInterestMonitor eventMetrics](self, "eventMetrics");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "reset");

      -[RTPointOfInterestMonitor _registerForNotifications](self, "_registerForNotifications");
      -[RTPointOfInterestMonitor _registerForPolygonalRegionEvents](self, "_registerForPolygonalRegionEvents");
      -[RTPointOfInterestMonitor _stopMonitoringAllRegionsIfNeeded](self, "_stopMonitoringAllRegionsIfNeeded");
    }
  }
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
  void *v10;
  void *v11;
  void *v12;
  id v13;

  -[RTPointOfInterestMonitor navigationManager](self, "navigationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTNavigationManagerNavigationStateNotification, "notificationName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:", self, sel_onNavigationNotification_, v4);

  -[RTPointOfInterestMonitor navigationManager](self, "navigationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTNavigationManagerRouteSummaryNotification, "notificationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:", self, sel_onNavigationNotification_, v6);

  -[RTPointOfInterestMonitor vehicleLocationProvider](self, "vehicleLocationProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTVehicleEventNotification, "notificationName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:", self, sel_onVehicleEventNotification_, v8);

  -[RTPointOfInterestMonitor motionActivityManager](self, "motionActivityManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTMotionActivityManagerNotificationActivityAlarm, "notificationName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserver:selector:name:", self, sel_onActivityAlarmNotification_, v10);

  -[RTPointOfInterestMonitor learnedLocationManager](self, "learnedLocationManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTLearnedLocationManagerNotificationAvailabilityDidChange, "notificationName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObserver:selector:name:", self, sel_onLearnedLocationManagerNotification_, v12);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObserver:selector:name:object:", self, sel_onDailyMetricsNotification_, CFSTR("RTMetricManagerDailyMetricNotification"), 0);

}

- (void)_registerForPolygonalRegionEvents
{
  void *v4;
  NSString *regionMonitoringClientIdentifer;
  _QWORD v6[6];

  -[RTPointOfInterestMonitor locationManager](self, "locationManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  regionMonitoringClientIdentifer = self->_regionMonitoringClientIdentifer;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__RTPointOfInterestMonitor__registerForPolygonalRegionEvents__block_invoke;
  v6[3] = &unk_1E9297B78;
  v6[4] = self;
  v6[5] = a2;
  objc_msgSend(v4, "registerForRegionEventsWithClientIdentifier:handler:", regionMonitoringClientIdentifer, v6);

  -[RTPointOfInterestMonitor setRegisteredForRegionEvents:](self, "setRegisteredForRegionEvents:", 1);
}

void __61__RTPointOfInterestMonitor__registerForPolygonalRegionEvents__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  const char *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  v9 = v8;
  if (a3 == 4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[RTLocationManager stringForRegionCallbackType:](RTLocationManager, "stringForRegionCallbackType:", 4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412802;
      v18 = v11;
      v19 = 2112;
      v20 = v12;
      v21 = 2112;
      v22 = v9;
      v13 = "%@, regionMonitoring failure, %@, error, %@";
      goto LABEL_14;
    }
LABEL_6:

    goto LABEL_12;
  }
  if (a3 == 3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[RTLocationManager stringForRegionCallbackType:](RTLocationManager, "stringForRegionCallbackType:", 3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412802;
      v18 = v11;
      v19 = 2112;
      v20 = v12;
      v21 = 2112;
      v22 = v9;
      v13 = "%@, regionMonitoring client registration failure, %@, error, %@";
LABEL_14:
      _os_log_fault_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_FAULT, v13, (uint8_t *)&v17, 0x20u);

      goto LABEL_6;
    }
    goto LABEL_6;
  }
  if (v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[RTLocationManager stringForRegionCallbackType:](RTLocationManager, "stringForRegionCallbackType:", a3);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412802;
      v18 = v15;
      v19 = 2112;
      v20 = v16;
      v21 = 2112;
      v22 = v9;
      _os_log_fault_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_FAULT, "%@, regionMonitoring %@, error, %@", (uint8_t *)&v17, 0x20u);

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "handlePolygonalRegionCallback:region:clientIdentifier:", a3, v7, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168));
  }
LABEL_12:

}

- (void)_stopMonitoringAllRegionsIfNeeded
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  const __CFString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[RTPointOfInterestMonitor defaultsManager](self, "defaultsManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("InstantPOILastFenceSetupDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -1800.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isBeforeDate:", v6);

  }
  else
  {
    v7 = 0;
  }
  _rt_log_facility_get_os_log(RTLogFacilityVisit);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringFromDate");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    v12 = CFSTR("NO");
    *(_DWORD *)buf = 138412802;
    v20 = v9;
    v21 = 2112;
    if (v7)
      v12 = CFSTR("YES");
    v22 = v10;
    v23 = 2112;
    v24 = v12;
    _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "%@, last fence setup date, %@, shouldStopMonitoringAllRegions, %@", buf, 0x20u);

  }
  if (v7)
  {
    -[RTPointOfInterestMonitor locationManager](self, "locationManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTPointOfInterestMonitor regionMonitoringClientIdentifer](self, "regionMonitoringClientIdentifer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    objc_msgSend(v13, "stopMonitoringAllRegionsForClientIdentifier:error:", v14, &v18);
    v15 = v18;

    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v20 = v17;
      v21 = 2112;
      v22 = (uint64_t)v15;
      _os_log_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_INFO, "%@, stop monitoring all regions, error, %@", buf, 0x16u);

    }
  }

}

- (void)_updateMonitoringLocationDenyList
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
  -[RTPointOfInterestMonitor monitoringLocationDenyList](self, "monitoringLocationDenyList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  v7 = dispatch_group_create();
  dispatch_group_enter(v7);
  -[RTPointOfInterestMonitor learnedLocationManager](self, "learnedLocationManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __61__RTPointOfInterestMonitor__updateMonitoringLocationDenyList__block_invoke;
  v28[3] = &unk_1E9297BA0;
  v31 = a2;
  v10 = v5;
  v29 = v10;
  v11 = v7;
  v30 = v11;
  objc_msgSend(v8, "fetchLocationsOfInterestWithPlaceType:handler:", 1, v28);

  dispatch_group_enter(v11);
  -[RTPointOfInterestMonitor learnedLocationManager](self, "learnedLocationManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v9;
  v22 = 3221225472;
  v23 = __61__RTPointOfInterestMonitor__updateMonitoringLocationDenyList__block_invoke_53;
  v24 = &unk_1E9297BA0;
  v27 = a2;
  v13 = v6;
  v25 = v13;
  v14 = v11;
  v26 = v14;
  objc_msgSend(v12, "fetchLocationsOfInterestWithPlaceType:handler:", 2, &v21);

  dispatch_group_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
  -[RTPointOfInterestMonitor monitoringLocationDenyList](self, "monitoringLocationDenyList", v21, v22, v23, v24);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObjectsFromArray:", v10);

  -[RTPointOfInterestMonitor monitoringLocationDenyList](self, "monitoringLocationDenyList");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObjectsFromArray:", v13);

  _rt_log_facility_get_os_log(RTLogFacilityVisit);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTPointOfInterestMonitor monitoringLocationDenyList](self, "monitoringLocationDenyList");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "count");
    *(_DWORD *)buf = 138412546;
    v33 = v18;
    v34 = 2048;
    v35 = v20;
    _os_log_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_INFO, "%@, monitoringLocationDenyList size, %lu", buf, 0x16u);

  }
}

void __61__RTPointOfInterestMonitor__updateMonitoringLocationDenyList__block_invoke(uint64_t a1, void *a2, void *a3)
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
  _rt_log_facility_get_os_log(RTLogFacilityVisit);
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
            _rt_log_facility_get_os_log(RTLogFacilityVisit);
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

void __61__RTPointOfInterestMonitor__updateMonitoringLocationDenyList__block_invoke_53(uint64_t a1, void *a2, void *a3)
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
  _rt_log_facility_get_os_log(RTLogFacilityVisit);
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
            _rt_log_facility_get_os_log(RTLogFacilityVisit);
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
  v7[2] = __48__RTPointOfInterestMonitor_shutdownWithHandler___block_invoke;
  v7[3] = &unk_1E9297650;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __48__RTPointOfInterestMonitor_shutdownWithHandler___block_invoke(uint64_t a1)
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
  RTTimer *locationRequestTimer;
  RTTimer *regionMonitorTimer;
  RTTimer *metricsSubmissionTimer;
  int v9;
  void *v10;
  __int16 v11;
  RTPointOfInterestMonitor *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityVisit);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = v5;
    v11 = 2112;
    v12 = self;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "%@ %@", (uint8_t *)&v9, 0x16u);

  }
  -[RTTimer invalidate](self->_locationRequestTimer, "invalidate");
  locationRequestTimer = self->_locationRequestTimer;
  self->_locationRequestTimer = 0;

  -[RTTimer invalidate](self->_regionMonitorTimer, "invalidate");
  regionMonitorTimer = self->_regionMonitorTimer;
  self->_regionMonitorTimer = 0;

  -[RTTimer invalidate](self->_metricsSubmissionTimer, "invalidate");
  metricsSubmissionTimer = self->_metricsSubmissionTimer;
  self->_metricsSubmissionTimer = 0;

  -[RTPointOfInterestMonitor _unRegisterForNotifications](self, "_unRegisterForNotifications");
  if (-[RTPointOfInterestMonitor registeredForRegionEvents](self, "registeredForRegionEvents"))
    -[RTPointOfInterestMonitor _unRegisterForPolygonalRegionEvents](self, "_unRegisterForPolygonalRegionEvents");
}

- (void)_unRegisterForNotifications
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[RTPointOfInterestMonitor navigationManager](self, "navigationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTNavigationManagerNavigationStateNotification, "notificationName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:fromNotification:", self, v4);

  -[RTPointOfInterestMonitor vehicleLocationProvider](self, "vehicleLocationProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTVehicleEventNotification, "notificationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:fromNotification:", self, v6);

  -[RTPointOfInterestMonitor locationManager](self, "locationManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTLocationManagerNotificationLocationsAccuracyBest, "notificationName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObserver:fromNotification:", self, v7);

}

- (void)_unRegisterForPolygonalRegionEvents
{
  void *v4;
  NSString *regionMonitoringClientIdentifer;
  _QWORD v6[6];

  -[RTPointOfInterestMonitor locationManager](self, "locationManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  regionMonitoringClientIdentifer = self->_regionMonitoringClientIdentifer;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63__RTPointOfInterestMonitor__unRegisterForPolygonalRegionEvents__block_invoke;
  v6[3] = &unk_1E9297628;
  v6[4] = self;
  v6[5] = a2;
  objc_msgSend(v4, "unregisterForRegionEventsWithClientIdentifier:handler:", regionMonitoringClientIdentifer, v6);

}

void __63__RTPointOfInterestMonitor__unRegisterForPolygonalRegionEvents__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityVisit);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168);
      v9 = 138412802;
      v10 = v6;
      v11 = 2112;
      v12 = v7;
      v13 = 2112;
      v14 = v3;
      _os_log_fault_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_FAULT, "%@, regionMonitoring unregistration failure, client, %@, error, %@", (uint8_t *)&v9, 0x20u);
LABEL_6:

    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168);
    v9 = 138412802;
    v10 = v6;
    v11 = 2112;
    v12 = v8;
    v13 = 2112;
    v14 = 0;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%@, client, %@, error, %@", (uint8_t *)&v9, 0x20u);
    goto LABEL_6;
  }

}

- (void)handlePolygonalRegionCallback:(int64_t)a3 region:(id)a4 clientIdentifier:(id)a5
{
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  char *v15;
  void *v16;
  NSObject *v17;
  _QWORD block[5];
  id v19;
  SEL v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v9)
  {
    if (v10)
      goto LABEL_10;
    goto LABEL_7;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v22 = "-[RTPointOfInterestMonitor handlePolygonalRegionCallback:region:clientIdentifier:]";
    v23 = 1024;
    LODWORD(v24) = 426;
    _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: region (in %s:%d)", buf, 0x12u);
  }

  if (!v11)
  {
LABEL_7:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v22 = "-[RTPointOfInterestMonitor handlePolygonalRegionCallback:region:clientIdentifier:]";
      v23 = 1024;
      LODWORD(v24) = 427;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: clientIdentifier (in %s:%d)", buf, 0x12u);
    }

  }
LABEL_10:
  _rt_log_facility_get_os_log(RTLogFacilityVisit);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v15 = (char *)objc_claimAutoreleasedReturnValue();
    +[RTLocationManager stringForRegionCallbackType:](RTLocationManager, "stringForRegionCallbackType:", a3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v22 = v15;
    v23 = 2112;
    v24 = v16;
    v25 = 2112;
    v26 = v9;
    v27 = 2112;
    v28 = v11;
    _os_log_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_INFO, "%@, callbackType, %@, region, %@, clientIdentifier, %@", buf, 0x2Au);

  }
  if (a3 == 1)
  {
    -[RTNotifier queue](self, "queue");
    v17 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __82__RTPointOfInterestMonitor_handlePolygonalRegionCallback_region_clientIdentifier___block_invoke;
    block[3] = &unk_1E9297BC8;
    block[4] = self;
    v19 = v9;
    v20 = a2;
    dispatch_async(v17, block);

  }
}

void __82__RTPointOfInterestMonitor_handlePolygonalRegionCallback_region_clientIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
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
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  id v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  RTPointOfInterestMonitorVisitNotification *v46;
  void *v47;
  double v48;
  double v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  double v57;
  double v58;
  void *v59;
  void *v60;
  unint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  NSObject *v72;
  void *v73;
  void *v74;
  id v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  double v80;
  void *v81;
  void *v82;
  id v83;
  objc_class *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  uint64_t v90;
  void *v91;
  id v92;
  _QWORD v93[5];
  id v94;
  uint64_t v95;
  _QWORD v96[4];
  id v97;
  uint64_t v98;
  id v99;
  id v100;
  uint8_t buf[4];
  void *v102;
  __int16 v103;
  id v104;
  __int16 v105;
  id v106;
  uint64_t v107;

  v107 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "eventMetrics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("isFenceBreak"));

  objc_msgSend(*(id *)(a1 + 32), "eventMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "highAccuracyLocationRequestStartDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "eventMetrics");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "highAccuracyLocationRequestStartDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSinceDate:", v7);
    v9 = v8;

    if (v9 <= 60.0)
    {
      objc_msgSend(*(id *)(a1 + 32), "eventMetrics");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("isGPSRunningWhenFenceBreak"));

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "eventMetrics");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "updateBuildingPolygonMetricsForRegionIdentifer:", v12);

  objc_msgSend(*(id *)(a1 + 32), "eventMetrics");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "arrivalEventDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(*(id *)(a1 + 32), "eventMetrics");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "eventMetrics");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "arrivalEventDate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "timeIntervalSinceDate:", v19);
    objc_msgSend(v16, "numberWithUnsignedInteger:", vcvtad_u64_f64(v20));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v21, CFSTR("fenceBreakLatency"));

  }
  objc_msgSend(*(id *)(a1 + 32), "locationRequestTimer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "invalidate");

  objc_msgSend(*(id *)(a1 + 32), "setLocationRequestTimer:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_stopHighAccuracyLocationRequest");
  objc_msgSend(*(id *)(a1 + 32), "locationManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "lastLocation");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "eventMetrics");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v24, "signalEnvironmentType"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setObject:forKey:", v26, CFSTR("signalEnvironment"));

  v27 = objc_alloc(MEMORY[0x1E0D183B0]);
  objc_msgSend(v24, "coordinate");
  v29 = v28;
  objc_msgSend(v24, "coordinate");
  v31 = v30;
  objc_msgSend(v24, "horizontalAccuracy");
  v33 = v32;
  objc_msgSend(v24, "timestamp");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)objc_msgSend(v27, "initWithLatitude:longitude:horizontalUncertainty:date:", v34, v29, v31, v33);

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_alloc(MEMORY[0x1E0D18578]);
  v38 = (void *)objc_msgSend(v37, "initWithDate:type:location:entry:exit:dataPointCount:confidence:placeInference:source:", v36, 1, v35, v36, 0, 0, *MEMORY[0x1E0D185C8], 0, 2);
  objc_msgSend(*(id *)(a1 + 32), "visitLabeler");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v100 = 0;
  objc_msgSend(v39, "labelVisit:clientIdentifier:error:", v38, CFSTR("com.apple.CoreRoutine.instantPOI"), &v100);
  v40 = v100;

  _rt_log_facility_get_os_log(RTLogFacilityVisit);
  v41 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v102 = v42;
    v103 = 2112;
    v104 = v38;
    v105 = 2112;
    v106 = v40;
    _os_log_impl(&dword_1D1A22000, v41, OS_LOG_TYPE_INFO, "%@, labeled visit, %@, error, %@", buf, 0x20u);

  }
  v92 = v40;

  objc_msgSend(*(id *)(a1 + 32), "defaultsManager");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "objectForKey:", CFSTR("InstantPOIEvalMode"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v44, "BOOLValue");

  if (v45)
  {
    v46 = -[RTPointOfInterestMonitorVisitNotification initWithVisit:]([RTPointOfInterestMonitorVisitNotification alloc], "initWithVisit:", v38);
    objc_msgSend(*(id *)(a1 + 32), "postNotification:", v46);

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "timeIntervalSinceDate:", v36);
  v49 = v48;

  objc_msgSend(*(id *)(a1 + 32), "eventMetrics");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", vcvtad_u64_f64(v49));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setObject:forKey:", v51, CFSTR("bluePOILatency"));

  objc_msgSend(*(id *)(a1 + 32), "eventMetrics");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "arrivalEventDate");
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  if (v53)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "eventMetrics");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "arrivalEventDate");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "timeIntervalSinceDate:", v56);
    v58 = v57;

    objc_msgSend(*(id *)(a1 + 32), "eventMetrics");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", vcvtad_u64_f64(v58));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "setObject:forKey:", v60, CFSTR("pOIVisitDetectionLatency"));

  }
  v61 = vcvtad_u64_f64(v49 / 5.0);
  if (v61 >= 2)
    v62 = 2;
  else
    v62 = v61;
  objc_msgSend(*(id *)(a1 + 32), "eventMetrics");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v62);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "setObject:forKey:", v64, CFSTR("BluePOIQueryCount"));

  for (; v62; --v62)
  {
    objc_msgSend(*(id *)(a1 + 32), "dailyMetrics");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "increaseCountForKey:", CFSTR("InstantPOIMetricsBluePOIQueryCount"));

  }
  v66 = v92;
  if (v92
    || (objc_msgSend(v38, "placeInference"), v68 = (void *)objc_claimAutoreleasedReturnValue(), v68, !v68))
  {
    objc_msgSend(*(id *)(a1 + 32), "eventMetrics");
    v67 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "submit");
  }
  else
  {
    v91 = v35;
    objc_msgSend(*(id *)(a1 + 32), "regionMonitorTimer");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "invalidate");

    objc_msgSend(*(id *)(a1 + 32), "setRegionMonitorTimer:", 0);
    objc_msgSend(*(id *)(a1 + 32), "locationManager");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168);
    v99 = 0;
    objc_msgSend(v70, "stopMonitoringAllRegionsForClientIdentifier:error:", v71, &v99);
    v67 = v99;

    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v72 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v102 = v73;
      v103 = 2112;
      v104 = v67;
      _os_log_impl(&dword_1D1A22000, v72, OS_LOG_TYPE_INFO, "%@, stop monitor all regions, error, %@", buf, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "visitStore");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v96[0] = MEMORY[0x1E0C809B0];
    v96[1] = 3221225472;
    v96[2] = __82__RTPointOfInterestMonitor_handlePolygonalRegionCallback_region_clientIdentifier___block_invoke_65;
    v96[3] = &unk_1E9297628;
    v98 = *(_QWORD *)(a1 + 48);
    v75 = v38;
    v97 = v75;
    objc_msgSend(v74, "storeVisit:handler:", v75, v96);

    objc_msgSend(*(id *)(a1 + 32), "eventMetrics");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("bluePOIHasResult"));

    objc_msgSend(*(id *)(a1 + 32), "eventMetrics");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v75, "placeInference");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "confidence");
    objc_msgSend(v78, "numberWithUnsignedInteger:", (unint64_t)(v80 * 100.0));
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "setObject:forKey:", v81, CFSTR("bluePOIConfidenceScore"));

    objc_msgSend(*(id *)(a1 + 32), "dailyMetrics");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "increaseCountForKey:", CFSTR("InstantPOIMetricsVisitCount"));

    v83 = objc_alloc(MEMORY[0x1E0D183F8]);
    v84 = (objc_class *)objc_opt_class();
    NSStringFromClass(v84);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = (void *)objc_msgSend(v83, "initWithUseBackgroundTraits:analyticsIdentifier:clientIdentifier:", 1, v85, CFSTR("com.apple.CoreRoutine.instantPOI"));

    objc_msgSend(*(id *)(a1 + 32), "mapServiceManager");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "placeInference");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "mapItem");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v93[0] = MEMORY[0x1E0C809B0];
    v93[1] = 3221225472;
    v93[2] = __82__RTPointOfInterestMonitor_handlePolygonalRegionCallback_region_clientIdentifier___block_invoke_69;
    v93[3] = &unk_1E9297BA0;
    v90 = *(_QWORD *)(a1 + 48);
    v93[4] = *(_QWORD *)(a1 + 32);
    v95 = v90;
    v94 = v75;
    objc_msgSend(v87, "fetchAppClipURLsForMapItem:options:handler:", v89, v86, v93);

    v35 = v91;
    v66 = 0;
  }

}

void __82__RTPointOfInterestMonitor_handlePolygonalRegionCallback_region_clientIdentifier___block_invoke_65(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 138412802;
      v8 = v5;
      v9 = 2112;
      v10 = v6;
      v11 = 2112;
      v12 = v3;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "%@, visit, %@, error, %@", (uint8_t *)&v7, 0x20u);

    }
  }

}

void __82__RTPointOfInterestMonitor_handlePolygonalRegionCallback_region_clientIdentifier___block_invoke_69(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__RTPointOfInterestMonitor_handlePolygonalRegionCallback_region_clientIdentifier___block_invoke_2;
  block[3] = &unk_1E92978E8;
  v8 = *(void **)(a1 + 40);
  v16 = *(_QWORD *)(a1 + 48);
  v12 = v5;
  v13 = v8;
  v14 = v6;
  v15 = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

void __82__RTPointOfInterestMonitor_handlePolygonalRegionCallback_region_clientIdentifier___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityVisit);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(*(id *)(a1 + 32), "count");
    objc_msgSend(*(id *)(a1 + 40), "placeInference");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mapItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 48);
    v10 = 138413058;
    v11 = v3;
    v12 = 2048;
    v13 = v4;
    v14 = 2112;
    v15 = v6;
    v16 = 2112;
    v17 = v7;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, app clip count, %lu, mapItem, %@, error, %@", (uint8_t *)&v10, 0x2Au);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    objc_msgSend(*(id *)(a1 + 56), "eventMetrics");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("pOIHasAppClip"));

  }
  objc_msgSend(*(id *)(a1 + 56), "eventMetrics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "submit");

}

- (id)_polygonalRegionWithRegionIdentifier:(id)a3 polygon:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  NSObject *v10;
  const char *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  NSObject *v22;
  void *v23;
  id v24;
  double v25;
  CLLocationDegrees v26;
  CLLocationDegrees v27;
  CLLocationCoordinate2D v28;
  void *v29;
  void *v30;
  uint64_t v32;
  id obj;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t v39[128];
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  id v43;
  __int16 v44;
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v11 = "Invalid parameter not satisfying: regionIdentifier";
      goto LABEL_21;
    }
LABEL_6:
    v12 = 0;
    goto LABEL_19;
  }
  objc_msgSend(v6, "vertices");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9 <= 2)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v11 = "Invalid parameter not satisfying: polygon.vertices.count >= kRTBuildingPolygonManagerMinimumNumberOfVertices";
LABEL_21:
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, v11, buf, 2u);
      goto LABEL_6;
    }
    goto LABEL_6;
  }
  v32 = objc_opt_new();
  _rt_log_facility_get_os_log(RTLogFacilityVisit);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "vertices");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v41 = v14;
    v42 = 2112;
    v43 = v5;
    v44 = 2048;
    v45 = objc_msgSend(v15, "count");
    _os_log_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_INFO, "%@, region identifier, %@, polygon vertices count, %lu", buf, 0x20u);

  }
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  objc_msgSend(v7, "vertices");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  v10 = v32;
  if (v16)
  {
    v17 = v16;
    v18 = 0;
    v19 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v36 != v19)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        _rt_log_facility_get_os_log(RTLogFacilityVisit);
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          NSStringFromSelector(a2);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v41 = v23;
          v42 = 2048;
          v43 = (id)(v18 + i);
          v10 = v32;
          v44 = 2112;
          v45 = (uint64_t)v21;
          _os_log_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_INFO, "%@, vertex idx, %lu, coordinate, %@", buf, 0x20u);

        }
        v24 = objc_alloc(MEMORY[0x1E0C9E478]);
        objc_msgSend(v21, "latitude");
        v26 = v25;
        objc_msgSend(v21, "longitude");
        v28 = CLLocationCoordinate2DMake(v26, v27);
        v29 = (void *)objc_msgSend(v24, "initWithCoordinate:", v28.latitude, v28.longitude);
        -[NSObject addObject:](v10, "addObject:", v29);

      }
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      v18 += i;
    }
    while (v17);
  }

  -[NSObject firstObject](v10, "firstObject");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject addObject:](v10, "addObject:", v30);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E458]), "initWithVertices:identifier:", v10, v5);
  objc_msgSend(v12, "setNotifyOnEntry:", 1);
  objc_msgSend(v12, "setNotifyOnExit:", 0);
LABEL_19:

  return v12;
}

- (void)_startHighAccuracyLocationRequest
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[6];
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (!-[RTPointOfInterestMonitor requestingHighAccuracyLocation](self, "requestingHighAccuracyLocation"))
  {
    -[RTPointOfInterestMonitor setRequestingHighAccuracyLocation:](self, "setRequestingHighAccuracyLocation:", 1);
    -[RTPointOfInterestMonitor defaultsManager](self, "defaultsManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("InstantPOIHighAccuracyLocationRequestCount"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "unsignedIntValue");

    -[RTPointOfInterestMonitor defaultsManager](self, "defaultsManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6 + 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v8, CFSTR("InstantPOIHighAccuracyLocationRequestCount"));

    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v29 = v10;
      _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "%@, start high accuracy location request", buf, 0xCu);

    }
    -[RTPointOfInterestMonitor locationManager](self, "locationManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTNotification notificationName](RTLocationManagerNotificationLocationsAccuracyBest, "notificationName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:", self, sel__onNoOpLocationNotification_, v12);

    -[RTPointOfInterestMonitor timerManager](self, "timerManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1E0CB3940];
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("%@.locationRequestTimer"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTNotifier queue](self, "queue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __61__RTPointOfInterestMonitor__startHighAccuracyLocationRequest__block_invoke;
    v27[3] = &unk_1E9297BF0;
    v27[4] = self;
    v27[5] = a2;
    objc_msgSend(v13, "timerWithIdentifier:queue:handler:", v17, v18, v27);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTPointOfInterestMonitor setLocationRequestTimer:](self, "setLocationRequestTimer:", v19);

    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v29 = v21;
      _os_log_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_INFO, "%@, locationRequestTimer start", buf, 0xCu);

    }
    -[RTPointOfInterestMonitor locationRequestTimer](self, "locationRequestTimer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "fireAfterDelay:interval:leeway:", 60.0, INFINITY, 1.0);

    -[RTPointOfInterestMonitor locationRequestTimer](self, "locationRequestTimer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "resume");

    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTPointOfInterestMonitor eventMetrics](self, "eventMetrics");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setHighAccuracyLocationRequestStartDate:", v24);

    -[RTPointOfInterestMonitor dailyMetrics](self, "dailyMetrics");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "increaseCountForKey:", CFSTR("InstantPOIMetricsHighAccuracyLocationRequestCount"));

  }
}

uint64_t __61__RTPointOfInterestMonitor__startHighAccuracyLocationRequest__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityVisit);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, locationRequestTimer expiry", (uint8_t *)&v6, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "locationRequestTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  objc_msgSend(*(id *)(a1 + 32), "setLocationRequestTimer:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "_stopHighAccuracyLocationRequest");
}

- (void)_stopHighAccuracyLocationRequest
{
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
  double v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (-[RTPointOfInterestMonitor requestingHighAccuracyLocation](self, "requestingHighAccuracyLocation"))
  {
    -[RTPointOfInterestMonitor setRequestingHighAccuracyLocation:](self, "setRequestingHighAccuracyLocation:", 0);
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412290;
      v18 = v5;
      _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "%@, stop high accuracy location request", (uint8_t *)&v17, 0xCu);

    }
    -[RTPointOfInterestMonitor locationManager](self, "locationManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTNotification notificationName](RTLocationManagerNotificationLocationsAccuracyBest, "notificationName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:fromNotification:", self, v7);

    -[RTPointOfInterestMonitor eventMetrics](self, "eventMetrics");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "highAccuracyLocationRequestStartDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[RTPointOfInterestMonitor eventMetrics](self, "eventMetrics");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTPointOfInterestMonitor eventMetrics](self, "eventMetrics");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "highAccuracyLocationRequestStartDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "timeIntervalSinceDate:", v14);
      objc_msgSend(v11, "numberWithUnsignedInteger:", vcvtad_u64_f64(v15));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKey:", v16, CFSTR("highAccuracyLocationRequestDuration"));

    }
  }
}

- (BOOL)_shouldMonitorLocation:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  double v22;
  double v23;
  id v24;
  NSObject *v25;
  void *v26;
  const char *aSelector;
  void *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  double v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeInterval:sinceDate:", v6, -300.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPointOfInterestMonitor lastMonitoringDate](self, "lastMonitoringDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isAfterDate:", v7);

  if (v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTPointOfInterestMonitor lastMonitoringDate](self, "lastMonitoringDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringFromDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringFromDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v36 = v11;
      v37 = 2112;
      v38 = v13;
      v39 = 2112;
      v40 = v14;
      _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "%@, skip monitor location, last monitor date, %@, current date, %@", buf, 0x20u);

    }
    v15 = 0;
  }
  else
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    -[RTPointOfInterestMonitor monitoringLocationDenyList](self, "monitoringLocationDenyList");
    v10 = objc_claimAutoreleasedReturnValue();
    v16 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
    if (v16)
    {
      v17 = v16;
      aSelector = a2;
      v29 = v7;
      v18 = *(_QWORD *)v32;
      while (2)
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v32 != v18)
            objc_enumerationMutation(v10);
          v20 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          -[RTPointOfInterestMonitor distanceCalculator](self, "distanceCalculator");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = 0;
          objc_msgSend(v21, "distanceFromLocation:toLocation:error:", v5, v20, &v30);
          v23 = v22;
          v24 = v30;

          if (!v24 && v23 < 250.0)
          {
            _rt_log_facility_get_os_log(RTLogFacilityVisit);
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              NSStringFromSelector(aSelector);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413058;
              v36 = v26;
              v37 = 2112;
              v38 = v5;
              v39 = 2112;
              v40 = v20;
              v41 = 2048;
              v42 = v23;
              _os_log_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_INFO, "%@, skip monitor location, current location, %@, denied location, %@, distance, %.2f", buf, 0x2Au);

            }
            v15 = 0;
            goto LABEL_18;
          }

        }
        v17 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
        v15 = 1;
        if (v17)
          continue;
        break;
      }
LABEL_18:
      v7 = v29;
    }
    else
    {
      v15 = 1;
    }
  }

  return v15;
}

- (BOOL)_startMonitoringLocation:(id)a3 error:(id *)a4
{
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  BOOL v15;
  id v16;
  void *v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  void *v22;
  void *v23;
  uint64_t v24;
  _QWORD v25[5];
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityVisit);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v29 = v9;
    v30 = 2112;
    v31 = (uint64_t)v7;
    _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "%@, start monitor location, %@", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPointOfInterestMonitor setLastMonitoringDate:](self, "setLastMonitoringDate:", v10);

  v27 = 0;
  -[RTPointOfInterestMonitor _regionMonitoringLocationsForLocation:error:](self, "_regionMonitoringLocationsForLocation:error:", v7, &v27);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v27;
  if (v12 || !objc_msgSend(v11, "count"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v11, "count");
      *(_DWORD *)buf = 138412802;
      v29 = v17;
      v30 = 2048;
      v31 = v24;
      v32 = 2112;
      v33 = v12;
      v18 = "%@, monitor location count, %lu, error, %@";
      v19 = v13;
      v20 = 32;
      goto LABEL_17;
    }
  }
  else
  {
    v26 = 0;
    -[RTPointOfInterestMonitor _setupPolygonalRegionsForLocations:error:](self, "_setupPolygonalRegionsForLocations:error:", v11, &v26);
    v16 = v26;
    if (!v16)
    {
      -[RTPointOfInterestMonitor defaultsManager](self, "defaultsManager");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTPointOfInterestMonitor lastMonitoringDate](self, "lastMonitoringDate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setObject:forKey:", v23, CFSTR("InstantPOILastFenceSetupDate"));

      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __59__RTPointOfInterestMonitor__startMonitoringLocation_error___block_invoke;
      v25[3] = &__block_descriptor_40_e27_v32__0__RTLocation_8Q16_B24l;
      v25[4] = a2;
      objc_msgSend(v11, "enumerateObjectsUsingBlock:", v25);
      v14 = 0;
      v12 = 0;
      v15 = 1;
      if (!a4)
        goto LABEL_13;
      goto LABEL_7;
    }
    v12 = v16;
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v29 = v17;
      v30 = 2112;
      v31 = (uint64_t)v12;
      v18 = "%@, error, %@";
      v19 = v13;
      v20 = 22;
LABEL_17:
      _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, v18, buf, v20);

    }
  }

  if (!a4)
  {
    v15 = 0;
    goto LABEL_13;
  }
  v14 = objc_retainAutorelease(v12);
  v15 = 0;
LABEL_7:
  *a4 = v14;
  v12 = v14;
LABEL_13:

  return v15;
}

void __59__RTPointOfInterestMonitor__startMonitoringLocation_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityVisit);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 32));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412802;
    v9 = v7;
    v10 = 2048;
    v11 = a3;
    v12 = 2112;
    v13 = v5;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%@, region monitoring location idx, %lu, location, %@", (uint8_t *)&v8, 0x20u);

  }
}

- (id)_regionMonitoringLocationsForLocation:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  dispatch_semaphore_t v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  dispatch_time_t v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v43;
  id v44;
  _QWORD v45[4];
  id v46;
  NSObject *v47;
  uint64_t *v48;
  uint64_t v49;
  id *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  id v55;
  uint64_t v56;
  const __CFString *v57;
  uint64_t v58;
  uint8_t buf[16];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    -[RTPointOfInterestMonitor defaultsManager](self, "defaultsManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", CFSTR("InstantPOIPowerMode"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "BOOLValue");

    if (v9)
    {
      if (a4)
        *a4 = 0;
      v55 = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v55, 1);
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = (void *)objc_opt_new();
      v49 = 0;
      v50 = (id *)&v49;
      v51 = 0x3032000000;
      v52 = __Block_byref_object_copy__7;
      v53 = __Block_byref_object_dispose__7;
      v54 = 0;
      v15 = dispatch_semaphore_create(0);
      -[RTPointOfInterestMonitor appClipManager](self, "appClipManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v45[0] = MEMORY[0x1E0C809B0];
      v45[1] = 3221225472;
      v45[2] = __72__RTPointOfInterestMonitor__regionMonitoringLocationsForLocation_error___block_invoke;
      v45[3] = &unk_1E9297C38;
      v44 = v14;
      v46 = v44;
      v48 = &v49;
      v17 = v15;
      v47 = v17;
      objc_msgSend(v16, "fetchNearbyAppClipLocationsFromLocation:radius:limit:handler:", v6, 10, v45, 300.0);

      v18 = v17;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = dispatch_time(0, 3600000000000);
      if (!dispatch_semaphore_wait(v18, v20))
        goto LABEL_14;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "timeIntervalSinceDate:", v19);
      v22 = v21;
      v23 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_5);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "filteredArrayUsingPredicate:", v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "firstObject");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v23, "submitToCoreAnalytics:type:duration:", v27, 1, v22);
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
      }

      v29 = (void *)MEMORY[0x1E0CB35C8];
      v58 = *MEMORY[0x1E0CB2D50];
      *(_QWORD *)buf = CFSTR("semaphore wait timeout");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v58, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (v31)
      {
        v32 = objc_retainAutorelease(v31);

      }
      else
      {
LABEL_14:
        v32 = 0;
      }

      v33 = v32;
      if (v33)
        objc_storeStrong(v50 + 5, v32);
      if (!v50[5])
      {
        -[RTPointOfInterestMonitor eventMetrics](self, "eventMetrics");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v44, "count"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setObject:forKey:", v35, CFSTR("nearbyAppClipCount"));

        -[RTPointOfInterestMonitor eventMetrics](self, "eventMetrics");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "calculateMinimumDistanceFromLocation:toLocations:", v6, v44);
        v38 = v37;

        if (v38 != 1.79769313e308)
        {
          -[RTPointOfInterestMonitor eventMetrics](self, "eventMetrics");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", vcvtad_u64_f64(v38));
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "setObject:forKey:", v40, CFSTR("distanceFromArrivalLocationToClosestAppClipLocation"));

        }
      }
      if (_os_feature_enabled_impl() && !objc_msgSend(v44, "count"))
        objc_msgSend(v44, "addObject:", v6);
      if (a4)
        *a4 = objc_retainAutorelease(v50[5]);
      v41 = v47;
      v10 = v44;

      _Block_object_dispose(&v49, 8);
    }
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v56 = *MEMORY[0x1E0CB2D50];
    v57 = CFSTR("location cannot be nil");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (a4)
      *a4 = objc_retainAutorelease(v13);

    v10 = 0;
  }

  return v10;
}

void __72__RTPointOfInterestMonitor__regionMonitoringLocationsForLocation_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v9 = a2;
  v5 = a3;
  if (!v5 && objc_msgSend(v9, "count"))
    objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", v9);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;
  v8 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (BOOL)_exceedPowerBudget
{
  void *v4;
  void *v5;
  char v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  int v24;
  void *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  const __CFString *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  -[RTPointOfInterestMonitor defaultsManager](self, "defaultsManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("InstantPOIPowerMode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if ((v6 & 1) != 0)
  {
    LOBYTE(v7) = 0;
  }
  else
  {
    -[RTPointOfInterestMonitor defaultsManager](self, "defaultsManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", CFSTR("InstantPOILastPowerBudgetResetDate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[RTPointOfInterestMonitor defaultsManager](self, "defaultsManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", CFSTR("InstantPOIHighAccuracyLocationRequestCount"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "unsignedIntValue");

    if (v9
      && (objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -86400.0),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          v14 = objc_msgSend(v9, "isBeforeDate:", v13),
          v13,
          !v14))
    {
      v7 = v12 > 1;
    }
    else
    {
      -[RTPointOfInterestMonitor defaultsManager](self, "defaultsManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKey:", v16, CFSTR("InstantPOILastPowerBudgetResetDate"));

      -[RTPointOfInterestMonitor defaultsManager](self, "defaultsManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKey:", &unk_1E93268E8, CFSTR("InstantPOIHighAccuracyLocationRequestCount"));

      v7 = 0;
    }
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringFromDate");
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = (void *)v20;
      v22 = CFSTR("NO");
      v24 = 138413058;
      v26 = 2048;
      v25 = v19;
      if (v7)
        v22 = CFSTR("YES");
      v27 = v12;
      v28 = 2112;
      v29 = v20;
      v30 = 2112;
      v31 = v22;
      _os_log_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_INFO, "%@, high accuracy request count, %lu, last power budget reset date, %@, exceed power budget, %@", (uint8_t *)&v24, 0x2Au);

    }
  }
  return v7;
}

- (BOOL)_shouldRequestHighAccuracyLocationsForMonitoringRegionLocations:(id)a3
{
  _BOOL8 v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  const __CFString *v11;
  BOOL v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  dispatch_semaphore_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  dispatch_time_t v24;
  id v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  _BOOL4 v38;
  NSObject *v39;
  uint64_t v40;
  void *v41;
  const __CFString *v42;
  void *v43;
  void *v44;
  id v47;
  uint64_t v48;
  uint64_t v49;
  id obj;
  uint64_t v51;
  uint64_t v52;
  RTPointOfInterestMonitor *v53;
  void *v54;
  void *v55;
  _QWORD v56[4];
  NSObject *v57;
  _BYTE *v58;
  uint64_t *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  char v67;
  _BYTE v68[12];
  __int16 v69;
  const __CFString *v70;
  void *v71;
  uint8_t v72[128];
  _BYTE buf[24];
  uint64_t (*v74)(uint64_t, uint64_t);
  void (*v75)(uint64_t);
  id v76;
  _QWORD v77[4];

  v77[1] = *MEMORY[0x1E0C80C00];
  v47 = a3;
  v4 = -[RTPointOfInterestMonitor _exceedPowerBudget](self, "_exceedPowerBudget");
  v53 = self;
  -[RTPointOfInterestMonitor eventMetrics](self, "eventMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("exceedDailyPowerBudget"));

  if (objc_msgSend(v47, "count"))
    v7 = v4;
  else
    v7 = 1;
  if (v7 == 1)
  {
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v47, "count");
      v11 = CFSTR("NO");
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v9;
      if (v4)
        v11 = CFSTR("YES");
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v10;
      *(_WORD *)&buf[22] = 2112;
      v74 = (uint64_t (*)(uint64_t, uint64_t))v11;
      _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "%@, should request high accuracy locations, NO, location count, %lu, exceed power budget, %@", buf, 0x20u);

    }
    v12 = 0;
  }
  else
  {
    v64 = 0;
    v65 = &v64;
    v66 = 0x2020000000;
    v67 = 0;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v74 = __Block_byref_object_copy__7;
    v75 = __Block_byref_object_dispose__7;
    v76 = 0;
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    obj = v47;
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v72, 16);
    v14 = 0;
    v8 = 0;
    if (v13)
    {
      v52 = *(_QWORD *)v61;
      v48 = *MEMORY[0x1E0D18598];
      v49 = *MEMORY[0x1E0CB2D50];
      while (2)
      {
        v51 = v13;
        v15 = 0;
        v16 = v14;
        do
        {
          if (*(_QWORD *)v61 != v52)
            objc_enumerationMutation(obj);
          v55 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E3B8]), "initWithRTLocation:", *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * v15));
          v17 = objc_alloc(MEMORY[0x1E0D18428]);
          v71 = v55;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v71, 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = (void *)objc_msgSend(v17, "initWithFidelityPolicy:locations:accessPoints:clientIdentifier:", 0, v18, MEMORY[0x1E0C9AA60], CFSTR("com.apple.CoreRoutine.instantPOI"));

          v19 = dispatch_semaphore_create(0);
          -[RTPointOfInterestMonitor visitLabeler](v53, "visitLabeler");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "placeInferenceManager");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v56[0] = MEMORY[0x1E0C809B0];
          v56[1] = 3221225472;
          v56[2] = __92__RTPointOfInterestMonitor__shouldRequestHighAccuracyLocationsForMonitoringRegionLocations___block_invoke;
          v56[3] = &unk_1E9296EE0;
          v58 = buf;
          v59 = &v64;
          v22 = v19;
          v57 = v22;
          objc_msgSend(v21, "fetchPlaceInferencesForOptions:handler:", v54, v56);

          v8 = v22;
          objc_msgSend(MEMORY[0x1E0C99D68], "now");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = dispatch_time(0, 3600000000000);
          v25 = v16;
          if (dispatch_semaphore_wait(v8, v24))
          {
            objc_msgSend(MEMORY[0x1E0C99D68], "now");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "timeIntervalSinceDate:", v23);
            v28 = v27;
            v29 = (void *)objc_opt_new();
            objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_5);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "filteredArrayUsingPredicate:", v30);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "firstObject");
            v33 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v29, "submitToCoreAnalytics:type:duration:", v33, 1, v28);
            _rt_log_facility_get_os_log(RTLogFacilityGeneral);
            v34 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)v68 = 0;
              _os_log_fault_impl(&dword_1D1A22000, v34, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v68, 2u);
            }

            v35 = (void *)MEMORY[0x1E0CB35C8];
            v77[0] = v49;
            *(_QWORD *)v68 = CFSTR("semaphore wait timeout");
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v68, v77, 1);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "errorWithDomain:code:userInfo:", v48, 15, v36);
            v37 = (void *)objc_claimAutoreleasedReturnValue();

            v25 = v16;
            if (v37)
            {
              v25 = objc_retainAutorelease(v37);

            }
          }

          v14 = v25;
          if (v14)
            objc_storeStrong((id *)(*(_QWORD *)&buf[8] + 40), v25);
          if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
          {

            goto LABEL_28;
          }
          v38 = *((_BYTE *)v65 + 24) == 0;

          if (!v38)
            goto LABEL_28;
          ++v15;
          v16 = v14;
        }
        while (v51 != v15);
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v72, 16);
        if (v13)
          continue;
        break;
      }
    }
LABEL_28:

    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v40 = objc_claimAutoreleasedReturnValue();
      v41 = (void *)v40;
      if (*((_BYTE *)v65 + 24))
        v42 = CFSTR("YES");
      else
        v42 = CFSTR("NO");
      *(_DWORD *)v68 = 138412546;
      *(_QWORD *)&v68[4] = v40;
      v69 = 2112;
      v70 = v42;
      _os_log_impl(&dword_1D1A22000, v39, OS_LOG_TYPE_INFO, "%@, should request high accuracy locations, %@", v68, 0x16u);

    }
    -[RTPointOfInterestMonitor eventMetrics](v53, "eventMetrics");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)v65 + 24));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setObject:forKey:", v44, CFSTR("shouldRequestGPS"));

    v12 = *((_BYTE *)v65 + 24) != 0;
    _Block_object_dispose(buf, 8);

    _Block_object_dispose(&v64, 8);
  }

  return v12;
}

void __92__RTPointOfInterestMonitor__shouldRequestHighAccuracyLocationsForMonitoringRegionLocations___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;

  v6 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  }
  else if (!objc_msgSend(a2, "count"))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (BOOL)_setupPolygonalRegionsForLocations:(id)a3 error:(id *)a4
{
  dispatch_semaphore_t v6;
  void *v7;
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
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSString *regionMonitoringClientIdentifer;
  id v39;
  NSObject *v40;
  id v41;
  NSString *v42;
  void *v43;
  void *v44;
  objc_class *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  objc_class *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  NSObject *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  BOOL v69;
  NSObject *log;
  id v71;
  NSObject *dsema;
  id obj;
  uint64_t v75;
  RTPointOfInterestMonitor *v76;
  _QWORD v77[6];
  _QWORD v78[6];
  id v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _QWORD v84[4];
  NSObject *v85;
  uint64_t *v86;
  uint64_t *v87;
  uint64_t v88;
  id *v89;
  uint64_t v90;
  uint64_t (*v91)(uint64_t, uint64_t);
  void (*v92)(uint64_t);
  id v93;
  uint64_t v94;
  uint64_t *v95;
  uint64_t v96;
  uint64_t (*v97)(uint64_t, uint64_t);
  void (*v98)(uint64_t);
  id v99;
  _BYTE buf[12];
  __int16 v101;
  NSString *v102;
  __int16 v103;
  void *v104;
  __int16 v105;
  void *v106;
  __int16 v107;
  id v108;
  _BYTE v109[128];
  _QWORD v110[4];

  v110[1] = *MEMORY[0x1E0C80C00];
  v71 = a3;
  if (objc_msgSend(v71, "count"))
  {
    v6 = dispatch_semaphore_create(0);
    v94 = 0;
    v95 = &v94;
    v96 = 0x3032000000;
    v97 = __Block_byref_object_copy__7;
    v98 = __Block_byref_object_dispose__7;
    v99 = 0;
    v88 = 0;
    v89 = (id *)&v88;
    v90 = 0x3032000000;
    v91 = __Block_byref_object_copy__7;
    v92 = __Block_byref_object_dispose__7;
    v93 = 0;
    v76 = self;
    -[RTPointOfInterestMonitor buildingPolygonManager](self, "buildingPolygonManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v84[0] = MEMORY[0x1E0C809B0];
    v84[1] = 3221225472;
    v84[2] = __69__RTPointOfInterestMonitor__setupPolygonalRegionsForLocations_error___block_invoke;
    v84[3] = &unk_1E9296EE0;
    v86 = &v94;
    v87 = &v88;
    v8 = v6;
    v85 = v8;
    objc_msgSend(v7, "fetchClosestBuildingPolygonsFromLocations:radius:limit:handler:", v71, 10, v84, 200.0);

    dsema = v8;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(dsema, v10))
      goto LABEL_7;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSinceDate:", v9);
    v13 = v12;
    v14 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_5);
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
      _os_log_fault_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    v20 = (void *)MEMORY[0x1E0CB35C8];
    v110[0] = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)buf = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v110, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      v23 = objc_retainAutorelease(v22);

    }
    else
    {
LABEL_7:
      v23 = 0;
    }

    log = v23;
    if (log)
      objc_storeStrong(v89 + 5, v23);
    v24 = v89[5];
    v69 = v24 == 0;
    if (v24)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v24);
    }
    else
    {
      -[RTPointOfInterestMonitor eventMetrics](v76, "eventMetrics");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend((id)v95[5], "count"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setObject:forKey:", v26, CFSTR("buildingFenceCount"));

      -[RTPointOfInterestMonitor eventMetrics](v76, "eventMetrics");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "saveBuildingPolygons:", v95[5]);

      -[RTPointOfInterestMonitor eventMetrics](v76, "eventMetrics");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "updateBuildingPolygonMetricsForRegionIdentifer:", CFSTR("POIEntry-0"));

      -[RTPointOfInterestMonitor dailyMetrics](v76, "dailyMetrics");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "increaseCountForKey:", CFSTR("InstantPOIMetricsBuildingFenceSetupCount"));

      v82 = 0u;
      v83 = 0u;
      v80 = 0u;
      v81 = 0u;
      obj = (id)v95[5];
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v109, 16);
      if (v30)
      {
        v31 = 0;
        v32 = 0;
        v75 = *(_QWORD *)v81;
        do
        {
          for (i = 0; i != v30; ++i)
          {
            if (*(_QWORD *)v81 != v75)
              objc_enumerationMutation(obj);
            v34 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * i);
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%lu"), CFSTR("POIEntry"), v32 + i);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            -[RTPointOfInterestMonitor _polygonalRegionWithRegionIdentifier:polygon:](v76, "_polygonalRegionWithRegionIdentifier:polygon:", v35, v34);
            v36 = (void *)objc_claimAutoreleasedReturnValue();

            -[RTPointOfInterestMonitor locationManager](v76, "locationManager");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            regionMonitoringClientIdentifer = v76->_regionMonitoringClientIdentifer;
            v79 = 0;
            objc_msgSend(v37, "startMonitoringForRegion:clientIdentifier:error:", v36, regionMonitoringClientIdentifer, &v79);
            v39 = v79;

            _rt_log_facility_get_os_log(RTLogFacilityVisit);
            v40 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
            {
              NSStringFromSelector(a2);
              v41 = (id)objc_claimAutoreleasedReturnValue();
              v42 = v76->_regionMonitoringClientIdentifer;
              objc_msgSend(v34, "centroid");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413314;
              *(_QWORD *)&buf[4] = v41;
              v101 = 2112;
              v102 = v42;
              v103 = 2112;
              v104 = v36;
              v105 = 2112;
              v106 = v43;
              v107 = 2112;
              v108 = v39;
              _os_log_impl(&dword_1D1A22000, v40, OS_LOG_TYPE_INFO, "%@, clientIdentifier, %@, start monitoring for region, %@, polygon centroid, %@, error, %@", buf, 0x34u);

            }
            if (!v39)
              ++v31;

          }
          v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v109, 16);
          v32 += i;
        }
        while (v30);

        if (v31)
        {
          v44 = (void *)MEMORY[0x1E0CB3940];
          v45 = (objc_class *)objc_opt_class();
          NSStringFromClass(v45);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "stringWithFormat:", CFSTR("%@.regionMonitorTimer"), v46);
          v47 = (void *)objc_claimAutoreleasedReturnValue();

          -[RTPointOfInterestMonitor timerManager](v76, "timerManager");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTNotifier queue](v76, "queue");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v78[0] = MEMORY[0x1E0C809B0];
          v78[1] = 3221225472;
          v78[2] = __69__RTPointOfInterestMonitor__setupPolygonalRegionsForLocations_error___block_invoke_102;
          v78[3] = &unk_1E9297BF0;
          v78[4] = v76;
          v78[5] = a2;
          objc_msgSend(v48, "timerWithIdentifier:queue:handler:", v47, v49, v78);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTPointOfInterestMonitor setRegionMonitorTimer:](v76, "setRegionMonitorTimer:", v50);

          _rt_log_facility_get_os_log(RTLogFacilityVisit);
          v51 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
          {
            NSStringFromSelector(a2);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v52;
            _os_log_impl(&dword_1D1A22000, v51, OS_LOG_TYPE_INFO, "%@, regionMonitorTimer start", buf, 0xCu);

          }
          -[RTPointOfInterestMonitor regionMonitorTimer](v76, "regionMonitorTimer");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "fireAfterDelay:interval:leeway:", 1800.0, INFINITY, 60.0);

          -[RTPointOfInterestMonitor regionMonitorTimer](v76, "regionMonitorTimer");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "resume");

          if (-[RTPointOfInterestMonitor _shouldRequestHighAccuracyLocationsForMonitoringRegionLocations:](v76, "_shouldRequestHighAccuracyLocationsForMonitoringRegionLocations:", v71))
          {
            -[RTPointOfInterestMonitor timerManager](v76, "timerManager");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            v56 = (void *)MEMORY[0x1E0CB3940];
            v57 = (objc_class *)objc_opt_class();
            NSStringFromClass(v57);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "stringWithFormat:", CFSTR("%@.locationRequestTimer"), v58);
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            -[RTNotifier queue](v76, "queue");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            v77[0] = MEMORY[0x1E0C809B0];
            v77[1] = 3221225472;
            v77[2] = __69__RTPointOfInterestMonitor__setupPolygonalRegionsForLocations_error___block_invoke_103;
            v77[3] = &unk_1E9297BF0;
            v77[4] = v76;
            v77[5] = a2;
            objc_msgSend(v55, "timerWithIdentifier:queue:handler:", v59, v60, v77);
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            -[RTPointOfInterestMonitor setLocationRequestTimer:](v76, "setLocationRequestTimer:", v61);

            _rt_log_facility_get_os_log(RTLogFacilityVisit);
            v62 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
            {
              NSStringFromSelector(a2);
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v63;
              _os_log_impl(&dword_1D1A22000, v62, OS_LOG_TYPE_INFO, "%@, locationRequestTimer start", buf, 0xCu);

            }
            -[RTPointOfInterestMonitor locationRequestTimer](v76, "locationRequestTimer");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v64, "fireAfterDelay:interval:leeway:", 60.0, INFINITY, 1.0);

            -[RTPointOfInterestMonitor locationRequestTimer](v76, "locationRequestTimer");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "resume");

            objc_msgSend(MEMORY[0x1E0C99D68], "now");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            -[RTPointOfInterestMonitor eventMetrics](v76, "eventMetrics");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v67, "setLocationRequestTimerStartDate:", v66);

          }
        }
      }
      else
      {

      }
    }

    _Block_object_dispose(&v88, 8);
    _Block_object_dispose(&v94, 8);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    log = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, log, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: locations.count>0", buf, 2u);
    }
    v69 = 0;
  }

  return v69;
}

void __69__RTPointOfInterestMonitor__setupPolygonalRegionsForLocations_error___block_invoke(uint64_t a1, void *a2, void *a3)
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

void __69__RTPointOfInterestMonitor__setupPolygonalRegionsForLocations_error___block_invoke_102(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityVisit);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v13 = v3;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, regionMonitorTimer expiry", buf, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "regionMonitorTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  objc_msgSend(*(id *)(a1 + 32), "setRegionMonitorTimer:", 0);
  objc_msgSend(*(id *)(a1 + 32), "locationRequestTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");

  objc_msgSend(*(id *)(a1 + 32), "setLocationRequestTimer:", 0);
  objc_msgSend(*(id *)(a1 + 32), "locationManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168);
  v11 = 0;
  objc_msgSend(v6, "stopMonitoringAllRegionsForClientIdentifier:error:", v7, &v11);
  v8 = v11;

  if (v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v13 = v10;
      v14 = 2112;
      v15 = v8;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "%@, failed to stop monitoring all regions, error, %@", buf, 0x16u);

    }
  }

}

void __69__RTPointOfInterestMonitor__setupPolygonalRegionsForLocations_error___block_invoke_103(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityVisit);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412290;
    v13 = v3;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, locationRequestTimer expiry", (uint8_t *)&v12, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "locationRequestTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  objc_msgSend(*(id *)(a1 + 32), "setLocationRequestTimer:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_startHighAccuracyLocationRequest");
  objc_msgSend(*(id *)(a1 + 32), "eventMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "eventMetrics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "locationRequestTimerStartDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceDate:", v9);
  objc_msgSend(v6, "numberWithUnsignedInteger:", vcvtad_u64_f64(v10));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v11, CFSTR("highAccuracyLocationRequestLatency"));

}

- (void)_startEventMetricsSubmissionTimer
{
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[6];
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[RTPointOfInterestMonitor metricsSubmissionTimer](self, "metricsSubmissionTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[RTPointOfInterestMonitor metricsSubmissionTimer](self, "metricsSubmissionTimer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invalidate");

    -[RTPointOfInterestMonitor setMetricsSubmissionTimer:](self, "setMetricsSubmissionTimer:", 0);
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v21 = v7;
      _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%@, stop running metricsSubmissionTimer", buf, 0xCu);

    }
  }
  -[RTPointOfInterestMonitor timerManager](self, "timerManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB3940];
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("%@.metricsSubmissionTimer"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTNotifier queue](self, "queue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __61__RTPointOfInterestMonitor__startEventMetricsSubmissionTimer__block_invoke;
  v19[3] = &unk_1E9297BF0;
  v19[4] = self;
  v19[5] = a2;
  objc_msgSend(v8, "timerWithIdentifier:queue:handler:", v12, v13, v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPointOfInterestMonitor setMetricsSubmissionTimer:](self, "setMetricsSubmissionTimer:", v14);

  _rt_log_facility_get_os_log(RTLogFacilityVisit);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v21 = v16;
    _os_log_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_INFO, "%@, start metricsSubmissionTimer", buf, 0xCu);

  }
  -[RTPointOfInterestMonitor metricsSubmissionTimer](self, "metricsSubmissionTimer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "fireAfterDelay:interval:leeway:", 1800.0, INFINITY, 60.0);

  -[RTPointOfInterestMonitor metricsSubmissionTimer](self, "metricsSubmissionTimer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "resume");

}

void __61__RTPointOfInterestMonitor__startEventMetricsSubmissionTimer__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityVisit);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, metricsSubmissionTimer expiry", (uint8_t *)&v6, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "metricsSubmissionTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  objc_msgSend(*(id *)(a1 + 32), "setMetricsSubmissionTimer:", 0);
  objc_msgSend(*(id *)(a1 + 32), "eventMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "submit");

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
  const char *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSString *regionMonitoringClientIdentifer;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  id v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  char *v42;
  void *v43;
  void *v44;
  char *v45;
  id v46;
  id v47;
  uint8_t buf[4];
  id v49;
  __int16 v50;
  const char *v51;
  __int16 v52;
  NSObject *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTNavigationManagerNavigationStateNotification, "notificationName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if (v8)
  {
    v9 = v5;
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (const char *)(int)-[NSObject state](v9, "state");
      -[RTPointOfInterestMonitor navigationDestination](self, "navigationDestination");
      v13 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v49 = v11;
      v50 = 2048;
      v51 = v12;
      v52 = 2112;
      v53 = v13;
      _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "%@, received navigation state, %lu, destination, %@", buf, 0x20u);

    }
    if (-[NSObject state](v9, "state") == 6)
    {
      -[RTPointOfInterestMonitor navigationDestination](self, "navigationDestination");
      v14 = objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        v15 = (void *)v14;
        -[RTPointOfInterestMonitor navigationDestination](self, "navigationDestination");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = -[RTPointOfInterestMonitor _shouldMonitorLocation:](self, "_shouldMonitorLocation:", v16);

        if (v17)
        {
          -[RTPointOfInterestMonitor eventMetrics](self, "eventMetrics");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "reset");

          -[RTPointOfInterestMonitor eventMetrics](self, "eventMetrics");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setObject:forKey:", &unk_1E9326900, CFSTR("arrivalEvent"));

          objc_msgSend(MEMORY[0x1E0C99D68], "now");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTPointOfInterestMonitor eventMetrics](self, "eventMetrics");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setArrivalEventDate:", v20);

          -[RTPointOfInterestMonitor navigationDestination](self, "navigationDestination");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTPointOfInterestMonitor eventMetrics](self, "eventMetrics");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setArrivalEventLocation:", v22);

          -[RTPointOfInterestMonitor _startEventMetricsSubmissionTimer](self, "_startEventMetricsSubmissionTimer");
          -[RTPointOfInterestMonitor regionMonitorTimer](self, "regionMonitorTimer");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "invalidate");

          -[RTPointOfInterestMonitor setRegionMonitorTimer:](self, "setRegionMonitorTimer:", 0);
          -[RTPointOfInterestMonitor locationRequestTimer](self, "locationRequestTimer");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "invalidate");

          -[RTPointOfInterestMonitor setLocationRequestTimer:](self, "setLocationRequestTimer:", 0);
          -[RTPointOfInterestMonitor locationManager](self, "locationManager");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          regionMonitoringClientIdentifer = self->_regionMonitoringClientIdentifer;
          v47 = 0;
          objc_msgSend(v26, "stopMonitoringAllRegionsForClientIdentifier:error:", regionMonitoringClientIdentifer, &v47);
          v28 = v47;

          if (v28)
          {
            _rt_log_facility_get_os_log(RTLogFacilityVisit);
            v29 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
LABEL_17:

LABEL_18:
              goto LABEL_19;
            }
            NSStringFromSelector(a2);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v49 = v30;
            v50 = 2112;
            v51 = (const char *)v28;
            _os_log_error_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_ERROR, "%@, failed to stop monitoring all regions, error, %@", buf, 0x16u);
          }
          else
          {
            -[RTPointOfInterestMonitor navigationDestination](self, "navigationDestination");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = 0;
            -[RTPointOfInterestMonitor _startMonitoringLocation:error:](self, "_startMonitoringLocation:error:", v43, &v46);
            v28 = v46;

            if (!v28)
            {
              -[RTPointOfInterestMonitor dailyMetrics](self, "dailyMetrics");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "increaseCountForKey:", CFSTR("InstantPOIMetricsArrivalEventCount"));

              goto LABEL_19;
            }
            _rt_log_facility_get_os_log(RTLogFacilityVisit);
            v29 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
              goto LABEL_17;
            NSStringFromSelector(a2);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            -[RTPointOfInterestMonitor navigationDestination](self, "navigationDestination");
            v45 = (char *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v49 = v30;
            v50 = 2112;
            v51 = v45;
            v52 = 2112;
            v53 = v28;
            _os_log_error_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_ERROR, "%@, failed to monitor location, %@, error, %@", buf, 0x20u);

          }
          goto LABEL_17;
        }
      }
    }
  }
  else
  {
    objc_msgSend(v5, "name");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTNotification notificationName](RTNavigationManagerRouteSummaryNotification, "notificationName");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v31, "isEqualToString:", v32);

    if (v33)
    {
      v9 = v5;
      v34 = objc_alloc(MEMORY[0x1E0D183B0]);
      -[NSObject destinationLatitude](v9, "destinationLatitude");
      v36 = v35;
      -[NSObject destinationLongitude](v9, "destinationLongitude");
      v38 = v37;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = (void *)objc_msgSend(v34, "initWithLatitude:longitude:horizontalUncertainty:date:", v39, v36, v38, 0.0);
      -[RTPointOfInterestMonitor setNavigationDestination:](self, "setNavigationDestination:", v40);

      _rt_log_facility_get_os_log(RTLogFacilityVisit);
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(a2);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTPointOfInterestMonitor navigationDestination](self, "navigationDestination");
        v42 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v49 = v41;
        v50 = 2112;
        v51 = v42;
        _os_log_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_INFO, "%@, received navigation destination, %@", buf, 0x16u);

      }
      goto LABEL_18;
    }
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v49 = v5;
      v50 = 2080;
      v51 = "-[RTPointOfInterestMonitor _onNavigationNotification:]";
      v52 = 1024;
      LODWORD(v53) = 1056;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "unhandled notification, %@ (in %s:%d)", buf, 0x1Cu);
    }
  }
LABEL_19:

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
  v7[2] = __53__RTPointOfInterestMonitor_onNavigationNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __53__RTPointOfInterestMonitor_onNavigationNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onNavigationNotification:", *(_QWORD *)(a1 + 40));
}

- (void)_onVehicleEventNotification:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  char *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSString *regionMonitoringClientIdentifer;
  char *v24;
  NSObject *v25;
  void *v26;
  const char *v27;
  NSObject *v28;
  uint32_t v29;
  char *v30;
  id v31;
  id v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  char *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTVehicleEventNotification, "notificationName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if (v8)
  {
    v9 = v5;
    -[NSObject vehicleEvents](v9, "vehicleEvents");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "location");
    v12 = (char *)objc_claimAutoreleasedReturnValue();

    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v34 = v14;
      v35 = 2112;
      v36 = v12;
      _os_log_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_INFO, "%@, received vehicle location, %@", buf, 0x16u);

    }
    if (!v12 || !-[RTPointOfInterestMonitor _shouldMonitorLocation:](self, "_shouldMonitorLocation:", v12))
      goto LABEL_15;
    -[RTPointOfInterestMonitor eventMetrics](self, "eventMetrics");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "reset");

    -[RTPointOfInterestMonitor eventMetrics](self, "eventMetrics");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKey:", &unk_1E9326918, CFSTR("arrivalEvent"));

    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTPointOfInterestMonitor eventMetrics](self, "eventMetrics");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setArrivalEventDate:", v17);

    -[RTPointOfInterestMonitor eventMetrics](self, "eventMetrics");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setArrivalEventLocation:", v12);

    -[RTPointOfInterestMonitor _startEventMetricsSubmissionTimer](self, "_startEventMetricsSubmissionTimer");
    -[RTPointOfInterestMonitor regionMonitorTimer](self, "regionMonitorTimer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "invalidate");

    -[RTPointOfInterestMonitor setRegionMonitorTimer:](self, "setRegionMonitorTimer:", 0);
    -[RTPointOfInterestMonitor locationRequestTimer](self, "locationRequestTimer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "invalidate");

    -[RTPointOfInterestMonitor setLocationRequestTimer:](self, "setLocationRequestTimer:", 0);
    -[RTPointOfInterestMonitor locationManager](self, "locationManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    regionMonitoringClientIdentifer = self->_regionMonitoringClientIdentifer;
    v32 = 0;
    objc_msgSend(v22, "stopMonitoringAllRegionsForClientIdentifier:error:", regionMonitoringClientIdentifer, &v32);
    v24 = (char *)v32;

    if (v24)
    {
      _rt_log_facility_get_os_log(RTLogFacilityVisit);
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v34 = v26;
        v35 = 2112;
        v36 = v24;
        v27 = "%@, failed to stop monitoring all regions, error, %@";
        v28 = v25;
        v29 = 22;
LABEL_19:
        _os_log_error_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_ERROR, v27, buf, v29);

      }
    }
    else
    {
      v31 = 0;
      -[RTPointOfInterestMonitor _startMonitoringLocation:error:](self, "_startMonitoringLocation:error:", v12, &v31);
      v30 = (char *)v31;
      if (!v30)
      {
        -[RTPointOfInterestMonitor dailyMetrics](self, "dailyMetrics");
        v24 = (char *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "increaseCountForKey:", CFSTR("InstantPOIMetricsArrivalEventCount"));
        goto LABEL_14;
      }
      v24 = v30;
      _rt_log_facility_get_os_log(RTLogFacilityVisit);
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v34 = v26;
        v35 = 2112;
        v36 = v12;
        v37 = 2112;
        v38 = v24;
        v27 = "%@, failed to monitor location, %@, error, %@";
        v28 = v25;
        v29 = 32;
        goto LABEL_19;
      }
    }

LABEL_14:
LABEL_15:

    goto LABEL_16;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412802;
    v34 = v5;
    v35 = 2080;
    v36 = "-[RTPointOfInterestMonitor _onVehicleEventNotification:]";
    v37 = 1024;
    LODWORD(v38) = 1112;
    _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "unhandled notification, %@ (in %s:%d)", buf, 0x1Cu);
  }
LABEL_16:

}

- (void)onVehicleEventNotification:(id)a3
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
  v7[2] = __55__RTPointOfInterestMonitor_onVehicleEventNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __55__RTPointOfInterestMonitor_onVehicleEventNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onVehicleEventNotification:", *(_QWORD *)(a1 + 40));
}

- (void)_onActivityAlarmNotification:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[5];
  NSObject *v12;
  SEL v13;
  uint8_t buf[4];
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
  +[RTNotification notificationName](RTMotionActivityManagerNotificationActivityAlarm, "notificationName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if (v8)
  {
    v9 = v5;
    if (-[NSObject trigger](v9, "trigger") == 10)
    {
      -[RTPointOfInterestMonitor locationManager](self, "locationManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __57__RTPointOfInterestMonitor__onActivityAlarmNotification___block_invoke;
      v11[3] = &unk_1E9297C60;
      v11[4] = self;
      v13 = a2;
      v9 = v9;
      v12 = v9;
      objc_msgSend(v10, "fetchCurrentLocationWithHandler:", v11);

    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v15 = v5;
      v16 = 2080;
      v17 = "-[RTPointOfInterestMonitor _onActivityAlarmNotification:]";
      v18 = 1024;
      v19 = 1179;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "unhandled notification, %@ (in %s:%d)", buf, 0x1Cu);
    }
  }

}

void __57__RTPointOfInterestMonitor__onActivityAlarmNotification___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__RTPointOfInterestMonitor__onActivityAlarmNotification___block_invoke_2;
  block[3] = &unk_1E92978E8;
  v8 = *(void **)(a1 + 40);
  v17 = *(_QWORD *)(a1 + 48);
  v13 = v8;
  v14 = v5;
  v9 = *(_QWORD *)(a1 + 32);
  v15 = v6;
  v16 = v9;
  v10 = v6;
  v11 = v5;
  dispatch_async(v7, block);

}

void __57__RTPointOfInterestMonitor__onActivityAlarmNotification___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  void *v19;
  const char *v20;
  NSObject *v21;
  uint32_t v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityVisit);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTMotionActivityManager activityAlarmTriggerToString:](RTMotionActivityManager, "activityAlarmTriggerToString:", objc_msgSend(*(id *)(a1 + 32), "trigger"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138413058;
    v28 = v3;
    v29 = 2112;
    v30 = v4;
    v31 = 2112;
    v32 = v5;
    v33 = 2112;
    v34 = v6;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, received motion alarm, %@, location, %@, error, %@", buf, 0x2Au);

  }
  if (!*(_QWORD *)(a1 + 48))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D183B0]), "initWithCLLocation:", *(_QWORD *)(a1 + 40));
    if (!v7 || !objc_msgSend(*(id *)(a1 + 56), "_shouldMonitorLocation:", v7))
      goto LABEL_13;
    objc_msgSend(*(id *)(a1 + 56), "eventMetrics");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "reset");

    objc_msgSend(*(id *)(a1 + 56), "eventMetrics");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", &unk_1E9326930, CFSTR("arrivalEvent"));

    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "eventMetrics");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setArrivalEventDate:", v10);

    objc_msgSend(*(id *)(a1 + 56), "eventMetrics");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setArrivalEventLocation:", v7);

    objc_msgSend(*(id *)(a1 + 56), "_startEventMetricsSubmissionTimer");
    objc_msgSend(*(id *)(a1 + 56), "regionMonitorTimer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "invalidate");

    objc_msgSend(*(id *)(a1 + 56), "setRegionMonitorTimer:", 0);
    objc_msgSend(*(id *)(a1 + 56), "locationRequestTimer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "invalidate");

    objc_msgSend(*(id *)(a1 + 56), "setLocationRequestTimer:", 0);
    objc_msgSend(*(id *)(a1 + 56), "locationManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 168);
    v26 = 0;
    objc_msgSend(v15, "stopMonitoringAllRegionsForClientIdentifier:error:", v16, &v26);
    v17 = v26;

    if (v17)
    {
      _rt_log_facility_get_os_log(RTLogFacilityVisit);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(*(SEL *)(a1 + 64));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v28 = v19;
        v29 = 2112;
        v30 = v17;
        v20 = "%@, failed to stop monitoring all regions, error, %@";
        v21 = v18;
        v22 = 22;
LABEL_17:
        _os_log_error_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_ERROR, v20, buf, v22);

      }
    }
    else
    {
      v23 = *(void **)(a1 + 56);
      v25 = 0;
      objc_msgSend(v23, "_startMonitoringLocation:error:", v7, &v25);
      v24 = v25;
      if (!v24)
      {
        objc_msgSend(*(id *)(a1 + 56), "dailyMetrics");
        v17 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "increaseCountForKey:", CFSTR("InstantPOIMetricsArrivalEventCount"));
        goto LABEL_12;
      }
      v17 = v24;
      _rt_log_facility_get_os_log(RTLogFacilityVisit);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(*(SEL *)(a1 + 64));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v28 = v19;
        v29 = 2112;
        v30 = v7;
        v31 = 2112;
        v32 = v17;
        v20 = "%@, failed to monitor location, %@, error, %@";
        v21 = v18;
        v22 = 32;
        goto LABEL_17;
      }
    }

LABEL_12:
LABEL_13:

  }
}

- (void)onActivityAlarmNotification:(id)a3
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
  v7[2] = __56__RTPointOfInterestMonitor_onActivityAlarmNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __56__RTPointOfInterestMonitor_onActivityAlarmNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onActivityAlarmNotification:", *(_QWORD *)(a1 + 40));
}

- (void)_onLearnedLocationManagerNotification:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  int v12;
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
  +[RTNotification notificationName](RTLearnedLocationManagerNotificationAvailabilityDidChange, "notificationName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if (v8)
  {
    v9 = v5;
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[NSObject available](v9, "available");
      v13 = CFSTR("NO");
      if (v12)
        v13 = CFSTR("YES");
      v14 = 138412546;
      v15 = v11;
      v16 = 2112;
      v17 = (const char *)v13;
      _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "%@, learnedLocationManager available, %@", (uint8_t *)&v14, 0x16u);

    }
    if (-[NSObject available](v9, "available"))
      -[RTPointOfInterestMonitor _updateMonitoringLocationDenyList](self, "_updateMonitoringLocationDenyList");
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
      v17 = "-[RTPointOfInterestMonitor _onLearnedLocationManagerNotification:]";
      v18 = 1024;
      v19 = 1204;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "unhandled notification, %@ (in %s:%d)", (uint8_t *)&v14, 0x1Cu);
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
  v7[2] = __65__RTPointOfInterestMonitor_onLearnedLocationManagerNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __65__RTPointOfInterestMonitor_onLearnedLocationManagerNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onLearnedLocationManagerNotification:", *(_QWORD *)(a1 + 40));
}

- (void)_onDailyMetricsNotification:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityLocationAwareness);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = v7;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%@, received notification, %@", (uint8_t *)&v9, 0x16u);

  }
  -[RTPointOfInterestMonitor dailyMetrics](self, "dailyMetrics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "submit");

}

- (void)onDailyMetricsNotification:(id)a3
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
  v7[2] = __55__RTPointOfInterestMonitor_onDailyMetricsNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __55__RTPointOfInterestMonitor_onDailyMetricsNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onDailyMetricsNotification:", *(_QWORD *)(a1 + 40));
}

- (void)internalAddObserver:(id)a3 name:(id)a4
{
  id v5;
  void *v6;
  char v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  +[RTNotification notificationName](RTPointOfInterestMonitorVisitNotification, "notificationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if ((v7 & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412546;
      v11 = v9;
      v12 = 2112;
      v13 = v5;
      _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "%@, unsupported notification, %@", (uint8_t *)&v10, 0x16u);

    }
  }

}

- (void)internalRemoveObserver:(id)a3 name:(id)a4
{
  id v5;
  void *v6;
  char v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  +[RTNotification notificationName](RTPointOfInterestMonitorVisitNotification, "notificationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if ((v7 & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412546;
      v11 = v9;
      v12 = 2112;
      v13 = v5;
      _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "%@, unsupported notification, %@", (uint8_t *)&v10, 0x16u);

    }
  }

}

- (BOOL)requestingHighAccuracyLocation
{
  return self->_requestingHighAccuracyLocation;
}

- (void)setRequestingHighAccuracyLocation:(BOOL)a3
{
  self->_requestingHighAccuracyLocation = a3;
}

- (BOOL)registeredForRegionEvents
{
  return self->_registeredForRegionEvents;
}

- (void)setRegisteredForRegionEvents:(BOOL)a3
{
  self->_registeredForRegionEvents = a3;
}

- (RTAppClipManager)appClipManager
{
  return self->_appClipManager;
}

- (void)setAppClipManager:(id)a3
{
  objc_storeStrong((id *)&self->_appClipManager, a3);
}

- (RTBuildingPolygonManager)buildingPolygonManager
{
  return self->_buildingPolygonManager;
}

- (void)setBuildingPolygonManager:(id)a3
{
  objc_storeStrong((id *)&self->_buildingPolygonManager, a3);
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void)setDefaultsManager:(id)a3
{
  objc_storeStrong((id *)&self->_defaultsManager, a3);
}

- (RTPointOfInterestMonitorDailyMetrics)dailyMetrics
{
  return self->_dailyMetrics;
}

- (void)setDailyMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_dailyMetrics, a3);
}

- (RTDistanceCalculator)distanceCalculator
{
  return self->_distanceCalculator;
}

- (void)setDistanceCalculator:(id)a3
{
  objc_storeStrong((id *)&self->_distanceCalculator, a3);
}

- (RTPointOfInterestMonitorEventMetrics)eventMetrics
{
  return self->_eventMetrics;
}

- (void)setEventMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_eventMetrics, a3);
}

- (RTLearnedLocationManager)learnedLocationManager
{
  return self->_learnedLocationManager;
}

- (void)setLearnedLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_learnedLocationManager, a3);
}

- (NSDate)lastMonitoringDate
{
  return self->_lastMonitoringDate;
}

- (void)setLastMonitoringDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastMonitoringDate, a3);
}

- (RTLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_locationManager, a3);
}

- (RTTimer)locationRequestTimer
{
  return self->_locationRequestTimer;
}

- (void)setLocationRequestTimer:(id)a3
{
  objc_storeStrong((id *)&self->_locationRequestTimer, a3);
}

- (RTMapServiceManager)mapServiceManager
{
  return self->_mapServiceManager;
}

- (void)setMapServiceManager:(id)a3
{
  objc_storeStrong((id *)&self->_mapServiceManager, a3);
}

- (RTTimer)metricsSubmissionTimer
{
  return self->_metricsSubmissionTimer;
}

- (void)setMetricsSubmissionTimer:(id)a3
{
  objc_storeStrong((id *)&self->_metricsSubmissionTimer, a3);
}

- (RTMotionActivityManager)motionActivityManager
{
  return self->_motionActivityManager;
}

- (void)setMotionActivityManager:(id)a3
{
  objc_storeStrong((id *)&self->_motionActivityManager, a3);
}

- (RTLocation)navigationDestination
{
  return self->_navigationDestination;
}

- (void)setNavigationDestination:(id)a3
{
  objc_storeStrong((id *)&self->_navigationDestination, a3);
}

- (RTNavigationManager)navigationManager
{
  return self->_navigationManager;
}

- (void)setNavigationManager:(id)a3
{
  objc_storeStrong((id *)&self->_navigationManager, a3);
}

- (RTPlatform)platform
{
  return self->_platform;
}

- (void)setPlatform:(id)a3
{
  objc_storeStrong((id *)&self->_platform, a3);
}

- (NSString)regionMonitoringClientIdentifer
{
  return self->_regionMonitoringClientIdentifer;
}

- (void)setRegionMonitoringClientIdentifer:(id)a3
{
  objc_storeStrong((id *)&self->_regionMonitoringClientIdentifer, a3);
}

- (RTTimer)regionMonitorTimer
{
  return self->_regionMonitorTimer;
}

- (void)setRegionMonitorTimer:(id)a3
{
  objc_storeStrong((id *)&self->_regionMonitorTimer, a3);
}

- (RTTimerManager)timerManager
{
  return self->_timerManager;
}

- (void)setTimerManager:(id)a3
{
  objc_storeStrong((id *)&self->_timerManager, a3);
}

- (RTVehicleLocationProvider)vehicleLocationProvider
{
  return self->_vehicleLocationProvider;
}

- (void)setVehicleLocationProvider:(id)a3
{
  objc_storeStrong((id *)&self->_vehicleLocationProvider, a3);
}

- (RTVisitLabeler)visitLabeler
{
  return self->_visitLabeler;
}

- (void)setVisitLabeler:(id)a3
{
  objc_storeStrong((id *)&self->_visitLabeler, a3);
}

- (RTVisitStore)visitStore
{
  return self->_visitStore;
}

- (void)setVisitStore:(id)a3
{
  objc_storeStrong((id *)&self->_visitStore, a3);
}

- (NSMutableArray)monitoringLocationDenyList
{
  return self->_monitoringLocationDenyList;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monitoringLocationDenyList, 0);
  objc_storeStrong((id *)&self->_visitStore, 0);
  objc_storeStrong((id *)&self->_visitLabeler, 0);
  objc_storeStrong((id *)&self->_vehicleLocationProvider, 0);
  objc_storeStrong((id *)&self->_timerManager, 0);
  objc_storeStrong((id *)&self->_regionMonitorTimer, 0);
  objc_storeStrong((id *)&self->_regionMonitoringClientIdentifer, 0);
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_navigationManager, 0);
  objc_storeStrong((id *)&self->_navigationDestination, 0);
  objc_storeStrong((id *)&self->_motionActivityManager, 0);
  objc_storeStrong((id *)&self->_metricsSubmissionTimer, 0);
  objc_storeStrong((id *)&self->_mapServiceManager, 0);
  objc_storeStrong((id *)&self->_locationRequestTimer, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_lastMonitoringDate, 0);
  objc_storeStrong((id *)&self->_learnedLocationManager, 0);
  objc_storeStrong((id *)&self->_eventMetrics, 0);
  objc_storeStrong((id *)&self->_distanceCalculator, 0);
  objc_storeStrong((id *)&self->_dailyMetrics, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_buildingPolygonManager, 0);
  objc_storeStrong((id *)&self->_appClipManager, 0);
}

@end
