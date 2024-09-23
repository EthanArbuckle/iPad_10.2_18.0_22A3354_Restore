@implementation RTVehicleLocationProvider

void __47__RTVehicleLocationProvider_onLeechedLocation___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  if (objc_msgSend(v7, "type") == 1
    || objc_msgSend(v7, "type") == 3
    || objc_msgSend(v7, "type") == 2
    || objc_msgSend(v7, "type") == 10)
  {
    objc_msgSend(*(id *)(a1 + 32), "locationsCacheLeeched");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count");

    if (v4 >= 0xF)
    {
      objc_msgSend(*(id *)(a1 + 32), "locationsCacheLeeched");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeObjectAtIndex:", 0);

    }
    objc_msgSend(*(id *)(a1 + 32), "locationsCacheLeeched");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);

  }
}

void __47__RTVehicleLocationProvider_onLeechedLocation___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  id v5;
  _QWORD v6[5];

  objc_msgSend(*(id *)(a1 + 32), "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTLocationManagerNotificationLocationsLeeched, "notificationName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "leechedLocations");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __47__RTVehicleLocationProvider_onLeechedLocation___block_invoke_2;
    v6[3] = &unk_1E929A988;
    v6[4] = *(_QWORD *)(a1 + 40);
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v6);

  }
}

- (void)onLeechedLocation:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  RTVehicleLocationProvider *v9;

  v4 = a3;
  -[RTNotifier queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__RTVehicleLocationProvider_onLeechedLocation___block_invoke;
  v7[3] = &unk_1E9297540;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (RTVehicleLocationProvider)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithLocationManager_motionActivityManager_mapsSupportManager_metricManager_managedObjectContext_persistenceManager_vehicleLocationHistoryController_learnedLocationManager_managedConfiguration_defaultsManager_keychainManager_companionLink_);
}

- (RTVehicleLocationProvider)initWithLocationManager:(id)a3 motionActivityManager:(id)a4 mapsSupportManager:(id)a5 metricManager:(id)a6 managedObjectContext:(id)a7 persistenceManager:(id)a8 vehicleLocationHistoryController:(id)a9 learnedLocationManager:(id)a10 managedConfiguration:(id)a11 defaultsManager:(id)a12 keychainManager:(id)a13
{
  unint64_t v18;
  unint64_t v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  NSObject *v26;
  RTVehicleLocationProvider *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  int v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v33 = a3;
  v32 = a4;
  v31 = a5;
  v30 = a6;
  v18 = (unint64_t)a7;
  v19 = (unint64_t)a8;
  v20 = a9;
  v21 = a10;
  v22 = a11;
  v23 = a12;
  v24 = a13;
  v25 = (void *)v18;
  if (!(v18 | v19))
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v35 = "-[RTVehicleLocationProvider initWithLocationManager:motionActivityManager:mapsSupportManager:metricManager:m"
            "anagedObjectContext:persistenceManager:vehicleLocationHistoryController:learnedLocationManager:managedConfig"
            "uration:defaultsManager:keychainManager:]";
      v36 = 1024;
      v37 = 196;
      _os_log_error_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: managedObjectContext || persistenceManager (in %s:%d)", buf, 0x12u);
    }

  }
  v29 = -[RTVehicleLocationProvider initWithLocationManager:motionActivityManager:mapsSupportManager:metricManager:managedObjectContext:persistenceManager:vehicleLocationHistoryController:learnedLocationManager:managedConfiguration:defaultsManager:keychainManager:companionLink:](self, "initWithLocationManager:motionActivityManager:mapsSupportManager:metricManager:managedObjectContext:persistenceManager:vehicleLocationHistoryController:learnedLocationManager:managedConfiguration:defaultsManager:keychainManager:companionLink:", v33, v32, v31, v30, v25, v19, v20, v21, v22, v23, v24, 0);

  return v29;
}

- (RTVehicleLocationProvider)initWithLocationManager:(id)a3 motionActivityManager:(id)a4 mapsSupportManager:(id)a5 metricManager:(id)a6 managedObjectContext:(id)a7 persistenceManager:(id)a8 vehicleLocationHistoryController:(id)a9 learnedLocationManager:(id)a10 managedConfiguration:(id)a11 defaultsManager:(id)a12 keychainManager:(id)a13 companionLink:(id)a14
{
  unint64_t v19;
  unint64_t v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  RTVehicleLocationProvider *v25;
  RTVehicleLocationProvider *v26;
  void *v27;
  uint64_t v28;
  NSDate *lastCompanionSyncDate;
  uint64_t v30;
  NSDate *lastCompanionSyncRequestDate;
  RTFMCScoreBoard *v32;
  RTFMCScoreBoard *scoreBoard;
  RTFMCScoreBoard *v34;
  RTFMCScoreBoard *scoreBoardForUsualLocation;
  RTFMCScoreBoard *v36;
  RTFMCScoreBoard *scoreBoardForUnusualLocation;
  NSManagedObjectContext *v38;
  NSManagedObjectContext *managedObjectContext;
  id v40;
  NSObject *v41;
  RTVehicleLocationProvider *v42;
  RTVehicleLocationProvider *v43;
  RTPersistenceManager *persistenceManager;
  uint64_t v45;
  NSMutableArray *locationsCache;
  uint64_t v47;
  NSMutableArray *locationsCacheLeeched;
  id v50;
  id v52;
  id v53;
  id v54;
  id v56;
  id v57;
  id v58;
  void *v59;
  id v60;
  id v61;
  id v62;
  id v63;
  void *v64;
  _QWORD v65[4];
  RTVehicleLocationProvider *v66;
  objc_super v67;
  uint8_t buf[4];
  const char *v69;
  __int16 v70;
  int v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v63 = a3;
  v52 = a4;
  v62 = a4;
  v61 = a5;
  v53 = a6;
  v60 = a6;
  v19 = (unint64_t)a7;
  v54 = a8;
  v20 = (unint64_t)a8;
  v21 = a9;
  v58 = a10;
  v57 = a11;
  v56 = a12;
  v22 = a13;
  v23 = a14;
  v59 = (void *)v20;
  v64 = (void *)v19;
  if (!(v19 | v20))
  {
    v40 = v23;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v69 = "-[RTVehicleLocationProvider initWithLocationManager:motionActivityManager:mapsSupportManager:metricManager:m"
            "anagedObjectContext:persistenceManager:vehicleLocationHistoryController:learnedLocationManager:managedConfig"
            "uration:defaultsManager:keychainManager:companionLink:]";
      v70 = 1024;
      v71 = 225;
      _os_log_error_impl(&dword_1D1A22000, v41, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: managedObjectContext || persistenceManager (in %s:%d)", buf, 0x12u);
    }

    v42 = 0;
    v27 = v21;
    v24 = v22;
    v23 = v40;
    goto LABEL_10;
  }
  v24 = v22;
  if (!v22)
  {
    v42 = 0;
    v27 = v21;
LABEL_10:
    v43 = self;
    goto LABEL_16;
  }
  v50 = v23;
  v67.receiver = self;
  v67.super_class = (Class)RTVehicleLocationProvider;
  v25 = -[RTNotifier init](&v67, sel_init);
  v26 = v25;
  v27 = v21;
  if (v25)
  {
    objc_storeStrong((id *)&v25->_locationManager, a3);
    objc_storeStrong((id *)&v26->_motionActivityManager, v52);
    objc_storeStrong((id *)&v26->_mapsSupportManager, a5);
    objc_storeStrong((id *)&v26->_metricManager, v53);
    objc_storeStrong((id *)&v26->_persistenceManager, v54);
    objc_storeStrong((id *)&v26->_learnedLocationManager, a10);
    objc_storeStrong((id *)&v26->_managedConfiguration, a11);
    objc_storeStrong((id *)&v26->_defaultsManager, a12);
    objc_storeStrong((id *)&v26->_keychainManager, a13);
    objc_storeStrong((id *)&v26->_companionLink, a14);
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v28 = objc_claimAutoreleasedReturnValue();
    lastCompanionSyncDate = v26->_lastCompanionSyncDate;
    v26->_lastCompanionSyncDate = (NSDate *)v28;

    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v30 = objc_claimAutoreleasedReturnValue();
    lastCompanionSyncRequestDate = v26->_lastCompanionSyncRequestDate;
    v26->_lastCompanionSyncRequestDate = (NSDate *)v30;

    v32 = -[RTFMCScoreBoard initWithLocationType:]([RTFMCScoreBoard alloc], "initWithLocationType:", 0xFFFFFFFFLL);
    scoreBoard = v26->_scoreBoard;
    v26->_scoreBoard = v32;

    v34 = -[RTFMCScoreBoard initWithLocationType:]([RTFMCScoreBoard alloc], "initWithLocationType:", 1);
    scoreBoardForUsualLocation = v26->_scoreBoardForUsualLocation;
    v26->_scoreBoardForUsualLocation = v34;

    v36 = -[RTFMCScoreBoard initWithLocationType:]([RTFMCScoreBoard alloc], "initWithLocationType:", 0);
    scoreBoardForUnusualLocation = v26->_scoreBoardForUnusualLocation;
    v26->_scoreBoardForUnusualLocation = v36;

    if (v64)
    {
      v38 = v64;
      managedObjectContext = v26->_managedObjectContext;
      v26->_managedObjectContext = v38;
    }
    else
    {
      persistenceManager = v26->_persistenceManager;
      v65[0] = MEMORY[0x1E0C809B0];
      v65[1] = 3221225472;
      v65[2] = __271__RTVehicleLocationProvider_initWithLocationManager_motionActivityManager_mapsSupportManager_metricManager_managedObjectContext_persistenceManager_vehicleLocationHistoryController_learnedLocationManager_managedConfiguration_defaultsManager_keychainManager_companionLink___block_invoke;
      v65[3] = &unk_1E929CF08;
      v66 = v26;
      -[RTPersistenceManager createManagedObjectContext:](persistenceManager, "createManagedObjectContext:", v65);
      managedObjectContext = (NSManagedObjectContext *)v66;
    }

    if (v21)
      objc_storeStrong((id *)&v26->_vehicleLocationHistoryController, a9);
    v45 = objc_opt_new();
    locationsCache = v26->_locationsCache;
    v26->_locationsCache = (NSMutableArray *)v45;

    v47 = objc_opt_new();
    locationsCacheLeeched = v26->_locationsCacheLeeched;
    v26->_locationsCacheLeeched = (NSMutableArray *)v47;

    -[RTService setup](v26, "setup");
    -[RTManagedConfiguration setDelegate:](v26->_managedConfiguration, "setDelegate:", v26);
  }
  v43 = v26;
  v42 = v43;
  v23 = v50;
LABEL_16:

  return v42;
}

void __271__RTVehicleLocationProvider_initWithLocationManager_motionActivityManager_mapsSupportManager_metricManager_managedObjectContext_persistenceManager_vehicleLocationHistoryController_learnedLocationManager_managedConfiguration_defaultsManager_keychainManager_companionLink___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __271__RTVehicleLocationProvider_initWithLocationManager_motionActivityManager_mapsSupportManager_metricManager_managedObjectContext_persistenceManager_vehicleLocationHistoryController_learnedLocationManager_managedConfiguration_defaultsManager_keychainManager_companionLink___block_invoke_2;
  v6[3] = &unk_1E9297540;
  v7 = *(id *)(a1 + 32);
  v8 = v3;
  v5 = v3;
  dispatch_async(v4, v6);

}

uint64_t __271__RTVehicleLocationProvider_initWithLocationManager_motionActivityManager_mapsSupportManager_metricManager_managedObjectContext_persistenceManager_vehicleLocationHistoryController_learnedLocationManager_managedConfiguration_defaultsManager_keychainManager_companionLink___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onManagedObjectContextCreated:", *(_QWORD *)(a1 + 40));
}

- (void)_setup
{
  RTVehicleLocationCompanionLink *v3;
  RTVehicleLocationCompanionLink *companionLink;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[RTVehicleLocationProvider _updateFeatureEnablement](self, "_updateFeatureEnablement");
  if (!self->_companionLink)
  {
    -[RTVehicleLocationProvider createCompanionLink](self, "createCompanionLink");
    v3 = (RTVehicleLocationCompanionLink *)objc_claimAutoreleasedReturnValue();
    companionLink = self->_companionLink;
    self->_companionLink = v3;

  }
  -[RTVehicleLocationProvider learnedLocationManager](self, "learnedLocationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTLearnedLocationManagerNotificationAvailabilityDidChange, "notificationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:", self, sel_onLearnedLocationManagerNotification_, v6);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel_onDailyMetricNotification_, CFSTR("RTMetricManagerDailyMetricNotification"), 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:selector:name:object:", self, sel_onNanoRegistryNotification_, *MEMORY[0x1E0D517C0], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserver:selector:name:object:", self, sel_onNanoRegistryNotification_, *MEMORY[0x1E0D517D0], 0);

}

- (void)_updateFeatureEnablement
{
  NSObject *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  int v9;
  const __CFString *v10;
  __int16 v11;
  const __CFString *v12;
  __int16 v13;
  const __CFString *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  const __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[RTVehicleLocationProvider setMonitorVehicleLocation:](self, "setMonitorVehicleLocation:", -[RTVehicleLocationProvider isFeatureSupported](self, "isFeatureSupported"));
  self->_monitorExternalVehicleLocation = 0;
  _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    if (-[RTVehicleLocationProvider monitorVehicleLocation](self, "monitorVehicleLocation"))
      v4 = CFSTR("yes");
    else
      v4 = CFSTR("no");
    if (-[RTVehicleLocationProvider monitorExternalVehicleLocation](self, "monitorExternalVehicleLocation"))
      v5 = CFSTR("yes");
    else
      v5 = CFSTR("no");
    if (-[RTVehicleLocationProvider monitorVehicleConnection](self, "monitorVehicleConnection"))
      v6 = CFSTR("yes");
    else
      v6 = CFSTR("no");
    if (-[RTVehicleLocationProvider monitorVehicleExit](self, "monitorVehicleExit"))
      v7 = CFSTR("yes");
    else
      v7 = CFSTR("no");
    v9 = 138413314;
    if (-[RTVehicleLocationProvider monitorLocation](self, "monitorLocation"))
      v8 = CFSTR("yes");
    else
      v8 = CFSTR("no");
    v10 = v4;
    v11 = 2112;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    v15 = 2112;
    v16 = v7;
    v17 = 2112;
    v18 = v8;
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "monitoring states, local vehicle event, %@, external vehicle event, %@, vehicle connection, %@, vehicle exit, %@, location, %@", (uint8_t *)&v9, 0x34u);
  }

}

- (BOOL)isFeatureSupported
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  int v7;
  _BOOL4 v8;
  NSObject *v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;
  NSObject *v13;
  const __CFString *v15;
  int v16;
  const __CFString *v17;
  __int16 v18;
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[RTDefaultsManager objectForKey:](self->_defaultsManager, "objectForKey:", CFSTR("RTDefaultsVehicleEventSupportDynamicEnablementPolicy"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3
    && (-[RTDefaultsManager objectForKey:](self->_defaultsManager, "objectForKey:", CFSTR("RTDefaultsVehicleEventSupportDynamicEnablementPolicy")), v4 = (void *)objc_claimAutoreleasedReturnValue(), v5 = objc_msgSend(v4, "BOOLValue"), v4, !v5))
  {
    -[RTVehicleLocationProvider managedConfiguration](self, "managedConfiguration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v12, "isFindMyCarAllowed");

    _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v15 = CFSTR("no");
      if (v7)
        v15 = CFSTR("yes");
      v16 = 138412290;
      v17 = v15;
      _os_log_debug_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_DEBUG, "isFeatureSupported states, hasEligibleClient, %@", (uint8_t *)&v16, 0xCu);
    }

  }
  else
  {
    -[RTVehicleLocationProvider managedConfiguration](self, "managedConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isFindMyCarAllowed");

    v8 = -[RTVehicleLocationProvider pairedWithEligibleDevices](self, "pairedWithEligibleDevices");
    _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = CFSTR("no");
      if (v7)
        v11 = CFSTR("yes");
      else
        v11 = CFSTR("no");
      if (v8)
        v10 = CFSTR("yes");
      v16 = 138412546;
      v17 = v11;
      v18 = 2112;
      v19 = v10;
      _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "isFeatureSupported states, hasEligibleClient, %@, hasEligibleDevices, %@", (uint8_t *)&v16, 0x16u);
    }

    LOBYTE(v7) = v7 | v8;
  }
  return v7;
}

- (BOOL)isEligibleDevice
{
  return 0;
}

- (BOOL)pairedWithEligibleDevices
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2050000000;
  v2 = (void *)_MergedGlobals_5_0;
  v20 = _MergedGlobals_5_0;
  if (!_MergedGlobals_5_0)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __getNRPairedDeviceRegistryClass_block_invoke;
    v16[3] = &unk_1E9298BF8;
    v16[4] = &v17;
    __getNRPairedDeviceRegistryClass_block_invoke((uint64_t)v16);
    v2 = (void *)v18[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v17, 8);
  objc_msgSend(v3, "sharedInstance", (_QWORD)v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getPairedDevices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v21, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("4AF61239-2126-4FD6-8E7A-CDA2D7A0BFE9"));
        LOBYTE(v9) = objc_msgSend(v9, "supportsCapability:", v10);

        if ((v9 & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_13;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v21, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_13:

  return v6;
}

+ (int64_t)periodicPurgePolicy
{
  return 2;
}

- (id)createCompanionLink
{
  NSObject *v3;
  RTVehicleLocationCompanionLink *v4;
  void *v5;
  RTVehicleLocationCompanionLink *v6;
  _QWORD v8[5];
  uint8_t buf[16];

  _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "RTVehicleLocationCompanionLink init iphone", buf, 2u);
  }

  v4 = [RTVehicleLocationCompanionLink alloc];
  -[RTNotifier queue](self, "queue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__RTVehicleLocationProvider_createCompanionLink__block_invoke;
  v8[3] = &unk_1E929BEB0;
  v8[4] = self;
  v6 = -[RTVehicleLocationCompanionLink initWithQueue:deviceConnectionUpdateHandler:](v4, "initWithQueue:deviceConnectionUpdateHandler:", v5, v8);

  return v6;
}

uint64_t __48__RTVehicleLocationProvider_createCompanionLink__block_invoke(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "_resendVehicleEventIfNecessary");
  return result;
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
  v13[2] = __73__RTVehicleLocationProvider_performPurgeOfType_referenceDate_completion___block_invoke;
  v13[3] = &unk_1E9297590;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a3;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

void __73__RTVehicleLocationProvider_performPurgeOfType_referenceDate_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  if (*(_QWORD *)(a1 + 56) == 2)
    objc_msgSend(*(id *)(a1 + 32), "_clearAllVehicleEvents");
  objc_msgSend(*(id *)(a1 + 32), "vehicleLocationHistoryController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "vehicleLocationHistoryController");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "performPurgeOfType:referenceDate:completion:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

- (void)_shutdownWithHandler:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *finalizeLocationEstimateTimer;
  OS_dispatch_source *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[RTVehicleLocationProvider setMonitorVehicleConnection:](self, "setMonitorVehicleConnection:", 0);
  -[RTVehicleLocationProvider setMonitorVehicleExit:](self, "setMonitorVehicleExit:", 0);
  -[RTVehicleLocationProvider locationManager](self, "locationManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  -[RTVehicleLocationProvider learnedLocationManager](self, "learnedLocationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:", self);

  finalizeLocationEstimateTimer = self->_finalizeLocationEstimateTimer;
  if (finalizeLocationEstimateTimer)
  {
    dispatch_source_cancel(finalizeLocationEstimateTimer);
    v8 = self->_finalizeLocationEstimateTimer;
    self->_finalizeLocationEstimateTimer = 0;

  }
  v9 = v10;
  if (v10)
  {
    (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
    v9 = v10;
  }

}

- (void)setMonitorVehicleLocation:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (self->_monitorVehicleLocation != a3)
  {
    v3 = a3;
    _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v9[0] = 67109120;
      v9[1] = v3;
      _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "monitorVehicleLocation changed to, %d", (uint8_t *)v9, 8u);
    }

    self->_monitorVehicleLocation = v3;
    if (v3)
    {
      -[RTVehicleLocationProvider setMonitorVehicleConnection:](self, "setMonitorVehicleConnection:", 1);
      -[RTVehicleLocationProvider setMonitorVehicleExit:](self, "setMonitorVehicleExit:", 1);
      -[RTVehicleLocationProvider locationManager](self, "locationManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[RTNotification notificationName](RTLocationManagerNotificationLocationsLeeched, "notificationName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObserver:selector:name:", self, sel_onLeechedLocation_, v7);

    }
    else
    {
      -[RTVehicleLocationProvider setMonitorVehicleConnection:](self, "setMonitorVehicleConnection:", 0);
      -[RTVehicleLocationProvider setMonitorVehicleExit:](self, "setMonitorVehicleExit:", 0);
      -[RTVehicleLocationProvider locationManager](self, "locationManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeObserver:", self);

      -[RTVehicleLocationProvider _clearAllVehicleEvents](self, "_clearAllVehicleEvents");
    }
  }
}

- (void)setMonitorVehicleConnection:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;

  if (self->_monitorVehicleConnection != a3)
  {
    v3 = a3;
    self->_monitorVehicleConnection = a3;
    -[RTVehicleLocationProvider motionActivityManager](self, "motionActivityManager");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    +[RTNotification notificationName](RTMotionActivityManagerNotificationVehicleConnected, "notificationName");
    if (v3)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObserver:selector:name:", self, sel_onVehicleConnectedNotification_, v5);
    }
    else
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeObserver:fromNotification:", self, v5);
    }

  }
}

- (void)setMonitorVehicleExit:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  uint8_t v9[16];
  uint8_t buf[16];

  if (self->_monitorVehicleExit != a3)
  {
    v3 = a3;
    self->_monitorVehicleExit = a3;
    _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
    if (v3)
    {
      if (v6)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "Start monitoring vehicle exit.", buf, 2u);
      }

      -[RTVehicleLocationProvider motionActivityManager](self, "motionActivityManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[RTNotification notificationName](RTMotionActivityManagerNotificationVehicleExit, "notificationName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObserver:selector:name:", self, sel_onVehicleExitNotification_, v8);
    }
    else
    {
      if (v6)
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "Stop monitoring vehicle exit.", v9, 2u);
      }

      -[RTVehicleLocationProvider motionActivityManager](self, "motionActivityManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[RTNotification notificationName](RTMotionActivityManagerNotificationVehicleExit, "notificationName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeObserver:fromNotification:", self, v8);
    }

  }
}

- (void)setMonitorLocation:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  uint8_t v9[16];
  uint8_t buf[16];

  if (self->_monitorLocation != a3)
  {
    v3 = a3;
    self->_monitorLocation = a3;
    _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
    if (v3)
    {
      if (v6)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "Start monitoring location", buf, 2u);
      }

      -[RTVehicleLocationProvider locationManager](self, "locationManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[RTNotification notificationName](RTLocationManagerNotificationLocationsAccuracyBest, "notificationName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObserver:selector:name:", self, sel_onLocationNotification_, v8);
    }
    else
    {
      if (v6)
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "Stop monitoring location", v9, 2u);
      }

      -[RTVehicleLocationProvider locationManager](self, "locationManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[RTNotification notificationName](RTLocationManagerNotificationLocationsAccuracyBest, "notificationName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeObserver:fromNotification:", self, v8);
    }

  }
}

- (void)onLocationNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  RTVehicleLocationProvider *v9;

  v4 = a3;
  -[RTNotifier queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__RTVehicleLocationProvider_onLocationNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __52__RTVehicleLocationProvider_onLocationNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTLocationManagerNotificationLocationsAccuracyBest, "notificationName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  if (v4)
  {
    v8 = *(id *)(a1 + 32);
    objc_msgSend(v8, "locations");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __52__RTVehicleLocationProvider_onLocationNotification___block_invoke_2;
    v9[3] = &unk_1E929A988;
    v9[4] = *(_QWORD *)(a1 + 40);
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v11 = v7;
      _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "unhandled notification, %@", buf, 0xCu);

    }
  }
}

uint64_t __52__RTVehicleLocationProvider_onLocationNotification___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onLocation:", a2);
}

- (void)_onLocation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[RTVehicleLocationProvider pendingVehicleParkedEvent](self, "pendingVehicleParkedEvent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[RTVehicleLocationProvider locationsCache](self, "locationsCache");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v4);

      _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v4, "toString");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTVehicleLocationProvider locationsCache](self, "locationsCache");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 138412546;
        v11 = v8;
        v12 = 2048;
        v13 = objc_msgSend(v9, "count");
        _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "Adding new location, %@, total locations in cache, %lu", (uint8_t *)&v10, 0x16u);

      }
    }
    else
    {
      -[RTVehicleLocationProvider setMonitorLocation:](self, "setMonitorLocation:", 0);
    }
  }

}

- (void)_finalizeLocationEstimate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  NSObject *v11;
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
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  -[RTVehicleLocationProvider setMonitorLocation:](self, "setMonitorLocation:", 0);
  v3 = (void *)objc_opt_new();
  -[RTVehicleLocationProvider locationsCache](self, "locationsCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTVehicleLocationProvider pendingVehicleParkedEvent](self, "pendingVehicleParkedEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "estimateVehicleLocationWithLocations:parkingTimestamp:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "horizontalAccuracy");
    if (v8 > 0.0)
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D183B0]), "initWithCLLocation:", v7);
      -[RTVehicleLocationProvider pendingVehicleParkedEvent](self, "pendingVehicleParkedEvent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setLocation:", v9);

    }
  }
  _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    -[RTVehicleLocationProvider pendingVehicleParkedEvent](self, "pendingVehicleParkedEvent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTVehicleLocationProvider pendingVehicleParkedEvent](self, "pendingVehicleParkedEvent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "location");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 138412546;
    v31 = v13;
    v32 = 2112;
    v33 = (uint64_t)v15;
    _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "Parking, timestamp, %@, final location, %@", (uint8_t *)&v30, 0x16u);

  }
  v16 = (void *)objc_opt_new();
  -[RTVehicleLocationProvider locationsCache](self, "locationsCache");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTVehicleLocationProvider pendingVehicleParkedEvent](self, "pendingVehicleParkedEvent");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "date");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "timeIntervalSinceReferenceDate");
  v20 = objc_msgSend(v16, "calculateParkingQualityWithLocations:parkingTimestamp:", v17);

  -[RTVehicleLocationProvider pendingVehicleParkedEvent](self, "pendingVehicleParkedEvent");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setLocationQuality:", v20);

  _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    -[RTVehicleLocationProvider pendingVehicleParkedEvent](self, "pendingVehicleParkedEvent");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "date");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTVehicleLocationProvider locationsCache](self, "locationsCache");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "count");
    v30 = 138412802;
    v31 = v24;
    v32 = 2048;
    v33 = v26;
    v34 = 2048;
    v35 = v20;
    _os_log_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_INFO, "Parking, timestamp, %@, quality based on %lu samples is %lu.", (uint8_t *)&v30, 0x20u);

  }
  -[RTVehicleLocationProvider locationsCache](self, "locationsCache");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "removeAllObjects");

  -[RTVehicleLocationProvider pendingVehicleParkedEvent](self, "pendingVehicleParkedEvent");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "location");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    -[RTVehicleLocationProvider _processPendingVehicleEventAfterLocationFinalization](self, "_processPendingVehicleEventAfterLocationFinalization");
  }
  else
  {
    -[RTVehicleLocationProvider setPendingVehicleParkedEvent:](self, "setPendingVehicleParkedEvent:", 0);
    -[RTVehicleLocationProvider _recordMetricSuppressedEvent](self, "_recordMetricSuppressedEvent");
  }

}

- (void)_processPendingVehicleEventAfterLocationFinalization
{
  void *v4;
  _QWORD v5[6];

  -[RTVehicleLocationProvider pendingVehicleParkedEvent](self, "pendingVehicleParkedEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __81__RTVehicleLocationProvider__processPendingVehicleEventAfterLocationFinalization__block_invoke;
  v5[3] = &unk_1E9297628;
  v5[4] = self;
  v5[5] = a2;
  -[RTVehicleLocationProvider _updateNearbyLocationOfInterestOfVehicleEvent:handler:](self, "_updateNearbyLocationOfInterestOfVehicleEvent:handler:", v4, v5);

}

void __81__RTVehicleLocationProvider__processPendingVehicleEventAfterLocationFinalization__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "pendingVehicleParkedEvent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "nearbyLocationOfInterest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412802;
    v12 = v5;
    v13 = 2112;
    v14 = v7;
    v15 = 2112;
    v16 = v3;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "%@, nearbyLOI, %@, error, %@", (uint8_t *)&v11, 0x20u);

  }
  v8 = *(void **)(a1 + 32);
  objc_msgSend(v8, "pendingVehicleParkedEvent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_updateUsualLocationOfVehicleEvent:", v9);

  objc_msgSend(*(id *)(a1 + 32), "pendingVehicleParkedEvent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setLocationFinalized:", 1);

  objc_msgSend(*(id *)(a1 + 32), "_finalizeLastVehicleEventIfAppropriate");
}

- (void)_onFinalizeLocationEstimateTimerExpiry
{
  NSObject *v3;
  NSObject *finalizeLocationEstimateTimer;
  OS_dispatch_source *v5;
  uint8_t v6[16];

  _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "finalize location estimate timer expiry", v6, 2u);
  }

  finalizeLocationEstimateTimer = self->_finalizeLocationEstimateTimer;
  if (finalizeLocationEstimateTimer)
  {
    dispatch_source_cancel(finalizeLocationEstimateTimer);
    v5 = self->_finalizeLocationEstimateTimer;
    self->_finalizeLocationEstimateTimer = 0;

  }
  -[RTVehicleLocationProvider _finalizeLocationEstimate](self, "_finalizeLocationEstimate");
}

- (void)_finalizeLastVehicleEventIfAppropriate
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint8_t v27[16];
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v27 = 0;
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "_finalizeLastVehicleEventIfAppropriate called.", v27, 2u);
  }

  -[RTVehicleLocationProvider pendingVehicleParkedEvent](self, "pendingVehicleParkedEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "location");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_9;
  v6 = (void *)v5;
  -[RTVehicleLocationProvider pendingVehicleParkedEvent](self, "pendingVehicleParkedEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "locationFinalized") & 1) == 0)
  {

LABEL_9:
    return;
  }
  -[RTVehicleLocationProvider pendingVehicleParkedEvent](self, "pendingVehicleParkedEvent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "confirmed");

  if (!v9)
    return;
  -[RTVehicleLocationProvider pendingVehicleParkedEvent](self, "pendingVehicleParkedEvent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "nearbyLocationOfInterest");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[RTVehicleLocationProvider pendingVehicleParkedEvent](self, "pendingVehicleParkedEvent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "nearbyLocationOfInterest");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "type") == 0;

  }
  else
  {
    v14 = 0;
  }

  -[RTVehicleLocationProvider lastVehicleParkedEvent](self, "lastVehicleParkedEvent");
  v15 = objc_claimAutoreleasedReturnValue();
  if (!v15)
    goto LABEL_18;
  v16 = (void *)v15;
  -[RTVehicleLocationProvider pendingVehicleParkedEvent](self, "pendingVehicleParkedEvent");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "vehicleIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTVehicleLocationProvider lastVehicleParkedEvent](self, "lastVehicleParkedEvent");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "vehicleIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[RTVehicleLocationProvider _sameVehicleWithDeviceId:otherDeviceId:](self, "_sameVehicleWithDeviceId:otherDeviceId:", v18, v20))
  {

LABEL_17:
    goto LABEL_18;
  }
  -[RTVehicleLocationProvider pendingVehicleParkedEvent](self, "pendingVehicleParkedEvent");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "userSetLocation") | v14;

  if ((v22 & 1) == 0)
  {
    -[RTVehicleLocationProvider pendingVehicleParkedEvent](self, "pendingVehicleParkedEvent");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTVehicleLocationProvider lastVehicleParkedEvent](self, "lastVehicleParkedEvent");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTVehicleLocationProvider _postVehicleReplacementBulletinNotificationWithVehicleEvent:replacingEvent:](self, "_postVehicleReplacementBulletinNotificationWithVehicleEvent:replacingEvent:", v16, v17);
    v14 = 1;
    goto LABEL_17;
  }
LABEL_18:
  -[RTVehicleLocationProvider pendingVehicleParkedEvent](self, "pendingVehicleParkedEvent");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTVehicleLocationProvider setLastVehicleParkedEvent:](self, "setLastVehicleParkedEvent:", v23);

  -[RTVehicleLocationProvider setPendingVehicleParkedEvent:](self, "setPendingVehicleParkedEvent:", 0);
  -[RTVehicleLocationProvider lastVehicleParkedEvent](self, "lastVehicleParkedEvent");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTVehicleLocationProvider _submitFMCCarParkedInstanceWithParkedEvents:](self, "_submitFMCCarParkedInstanceWithParkedEvents:", v25);

  -[RTVehicleLocationProvider lastVehicleParkedEvent](self, "lastVehicleParkedEvent");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTVehicleLocationProvider _submitFMCParkingEventMetric:](self, "_submitFMCParkingEventMetric:", v26);

  if (!v14)
    -[RTVehicleLocationProvider _postBulletinNotificationIfAppropriate](self, "_postBulletinNotificationIfAppropriate");
  -[RTVehicleLocationProvider _persistLastVehicleEvent](self, "_persistLastVehicleEvent");
  -[RTVehicleLocationProvider _notifyClients](self, "_notifyClients");
}

- (void)_onVehicleParkedWithDeviceId:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v4;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "onVehicleParked, deviceId, %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTVehicleLocationProvider pendingVehicleParkedEvent](self, "pendingVehicleParkedEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    -[RTVehicleLocationProvider pendingVehicleParkedEvent](self, "pendingVehicleParkedEvent");
  else
    -[RTVehicleLocationProvider lastVehicleParkedEvent](self, "lastVehicleParkedEvent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && (objc_msgSend(v6, "timeIntervalSinceDate:", v9), v10 < 10.0))
  {
    _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v6, "timeIntervalSinceDate:", v9);
      *(_DWORD *)buf = 134217984;
      v18 = v12;
      _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "Got onVehicleParked too soon. Last event was %f seconds ago. Not updating.", buf, 0xCu);
    }

  }
  else
  {
    v13 = objc_alloc(MEMORY[0x1E0D18570]);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v16) = 0;
    v15 = (void *)objc_msgSend(v13, "initWithDate:location:vehicleIdentifier:userSetLocation:notes:identifier:photo:mapItem:confirmed:", v6, 0, v4, 0, 0, v14, 0, 0, v16);
    -[RTVehicleLocationProvider setPendingVehicleParkedEvent:](self, "setPendingVehicleParkedEvent:", v15);

    -[RTVehicleLocationProvider requestLocations](self, "requestLocations");
  }

}

- (void)requestLocations
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *finalizeLocationEstimateTimer;
  dispatch_time_t v9;
  NSObject *v10;
  OS_dispatch_source *v11;
  OS_dispatch_source *v12;
  NSObject *v13;
  dispatch_time_t v14;
  NSObject *v15;
  NSObject *v16;
  _QWORD handler[4];
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[RTVehicleLocationProvider locationsCache](self, "locationsCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTVehicleLocationProvider locationsCacheLeeched](self, "locationsCacheLeeched");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

  _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    -[RTVehicleLocationProvider locationsCacheLeeched](self, "locationsCacheLeeched");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134217984;
    v20 = objc_msgSend(v6, "count");
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "Added %lu leeched locations to the locations array.", buf, 0xCu);

  }
  -[RTVehicleLocationProvider locationsCacheLeeched](self, "locationsCacheLeeched");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAllObjects");

  -[RTVehicleLocationProvider setMonitorLocation:](self, "setMonitorLocation:", 1);
  finalizeLocationEstimateTimer = self->_finalizeLocationEstimateTimer;
  if (finalizeLocationEstimateTimer)
  {
    v9 = dispatch_time(0, 15000000000);
    dispatch_source_set_timer(finalizeLocationEstimateTimer, v9, 0xFFFFFFFFFFFFFFFFLL, 0xEE6B280uLL);
  }
  else
  {
    -[RTNotifier queue](self, "queue");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v10);
    v12 = self->_finalizeLocationEstimateTimer;
    self->_finalizeLocationEstimateTimer = v11;

    v13 = self->_finalizeLocationEstimateTimer;
    v14 = dispatch_time(0, 15000000000);
    dispatch_source_set_timer(v13, v14, 0xFFFFFFFFFFFFFFFFLL, 0xEE6B280uLL);
    objc_initWeak((id *)buf, self);
    v15 = self->_finalizeLocationEstimateTimer;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __45__RTVehicleLocationProvider_requestLocations__block_invoke;
    handler[3] = &unk_1E92983E8;
    objc_copyWeak(&v18, (id *)buf);
    dispatch_source_set_event_handler(v15, handler);
    dispatch_resume((dispatch_object_t)self->_finalizeLocationEstimateTimer);
    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)buf);
  }
  _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v20 = 0x402E000000000000;
    _os_log_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_INFO, "Set timer to fire in %f seconds", buf, 0xCu);
  }

}

void __45__RTVehicleLocationProvider_requestLocations__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_onFinalizeLocationEstimateTimerExpiry");

}

- (void)_onVehicleStartedWithDeviceId:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  id v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v4;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "onVehicleStarted, deviceId, %@", buf, 0xCu);
  }

  -[RTVehicleLocationProvider setPendingVehicleParkedEvent:](self, "setPendingVehicleParkedEvent:", 0);
  -[RTVehicleLocationProvider lastVehicleParkedEvent](self, "lastVehicleParkedEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[RTVehicleLocationProvider lastVehicleParkedEvent](self, "lastVehicleParkedEvent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "location");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[RTVehicleLocationProvider lastVehicleParkedEvent](self, "lastVehicleParkedEvent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[RTVehicleLocationProvider locationManager](self, "locationManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __59__RTVehicleLocationProvider__onVehicleStartedWithDeviceId___block_invoke;
    v22[3] = &unk_1E929CF30;
    v22[4] = self;
    v23 = v8;
    v24 = v11;
    v13 = v11;
    v14 = v8;
    objc_msgSend(v12, "fetchCachedLocationWithHandler:", v22);

    -[RTVehicleLocationProvider lastVehicleParkedEvent](self, "lastVehicleParkedEvent");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "vehicleIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[RTVehicleLocationProvider _sameVehicleWithDeviceId:otherDeviceId:](self, "_sameVehicleWithDeviceId:otherDeviceId:", v4, v16);

    if (v17)
    {
      -[RTVehicleLocationProvider setLastVehicleParkedEvent:](self, "setLastVehicleParkedEvent:", 0);
      -[RTVehicleLocationProvider _deleteLastVehicleEvent](self, "_deleteLastVehicleEvent");
      -[RTVehicleLocationProvider _clearBulletinNotifications](self, "_clearBulletinNotifications");
      -[RTVehicleLocationProvider _notifyClients](self, "_notifyClients");
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        -[RTVehicleLocationProvider lastVehicleParkedEvent](self, "lastVehicleParkedEvent");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "vehicleIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v26 = v4;
        v27 = 2112;
        v28 = v21;
        _os_log_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_INFO, "onVehicleStarted, different vehicle, deviceId, %@, old deviceId, %@", buf, 0x16u);

      }
    }

  }
  else
  {
    -[RTVehicleLocationProvider managedObjectContext](self, "managedObjectContext");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
      -[RTVehicleLocationProvider _deleteLastVehicleEvent](self, "_deleteLastVehicleEvent");
    _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_INFO, "Metric: No existing parking information. no return to car metric is submitted.", buf, 2u);
    }
  }

}

void __59__RTVehicleLocationProvider__onVehicleStartedWithDeviceId___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;

  v5 = a2;
  v6 = a3;
  objc_msgSend(a1[4], "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__RTVehicleLocationProvider__onVehicleStartedWithDeviceId___block_invoke_2;
  block[3] = &unk_1E929BF50;
  v13 = v6;
  v14 = v5;
  v8 = a1[5];
  v9 = a1[4];
  v15 = v8;
  v16 = v9;
  v17 = a1[6];
  v10 = v5;
  v11 = v6;
  dispatch_async(v7, block);

}

void __59__RTVehicleLocationProvider__onVehicleStartedWithDeviceId___block_invoke_2(uint64_t a1)
{
  NSObject *v1;
  const char *v2;
  NSObject *v3;
  uint32_t v4;
  double Current;
  void *v7;
  double v8;
  double v9;
  _BOOL4 v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  double v19;
  double v20;
  uint8_t buf[4];
  double v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v2 = "Metric: No cached location is found. no return to car metric is submitted.";
      v3 = v1;
      v4 = 2;
LABEL_13:
      _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, v2, buf, v4);
    }
  }
  else
  {
    Current = CFAbsoluteTimeGetCurrent();
    v7 = *(void **)(a1 + 40);
    if (v7)
    {
      objc_msgSend(v7, "clientLocation");
      v8 = v20;
    }
    else
    {
      v8 = 0.0;
    }
    v9 = Current - v8;
    _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
    v1 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v1, OS_LOG_TYPE_INFO);
    if (v9 >= 15.0)
    {
      if (v10)
      {
        *(_DWORD *)buf = 134217984;
        v22 = v9;
        v2 = "Metric: The cached location is too old. no return to car metric is submitted. (%f seconds)";
        v3 = v1;
        v4 = 12;
        goto LABEL_13;
      }
    }
    else
    {
      if (v10)
      {
        *(_DWORD *)buf = 134217984;
        v22 = v9;
        _os_log_impl(&dword_1D1A22000, v1, OS_LOG_TYPE_INFO, "Metric: A valid cached location is found. a return to car metric will be submitted. (%f seconds)", buf, 0xCu);
      }

      v11 = objc_alloc(MEMORY[0x1E0C9E3B8]);
      objc_msgSend(*(id *)(a1 + 48), "latitude");
      v13 = v12;
      objc_msgSend(*(id *)(a1 + 48), "longitude");
      v1 = objc_msgSend(v11, "initWithLatitude:longitude:", v13, v14);
      -[NSObject distanceFromLocation:](v1, "distanceFromLocation:", *(_QWORD *)(a1 + 40));
      v16 = v15;
      v17 = *(void **)(a1 + 56);
      v18 = *(_QWORD *)(a1 + 64);
      objc_msgSend(*(id *)(a1 + 40), "horizontalAccuracy");
      objc_msgSend(v17, "_submitFMCReturnToCarInstanceWithIdentifier:horizontalAccuracy:horizontalDistance:", v18, (int)v19, (int)fmin(v16, 2147483650.0));
    }
  }

}

- (void)_onVehicleConnectedNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTMotionActivityManagerNotificationVehicleConnected, "notificationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7)
  {
    v8 = v4;
    if (objc_msgSend(v8, "vehicleConnectedState") == 1)
    {
      objc_msgSend(v8, "deviceId");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTVehicleLocationProvider _onVehicleParkedWithDeviceId:](self, "_onVehicleParkedWithDeviceId:", v9);
      v10 = 2;
    }
    else
    {
      if (objc_msgSend(v8, "vehicleConnectedState") != 2)
      {
LABEL_10:

        goto LABEL_11;
      }
      objc_msgSend(v8, "deviceId");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTVehicleLocationProvider _onVehicleStartedWithDeviceId:](self, "_onVehicleStartedWithDeviceId:", v9);
      v10 = 1;
    }

    -[RTVehicleLocationProvider _submitFMCVehicleConnectionEventInstanceWithConnectionStatus:](self, "_submitFMCVehicleConnectionEventInstanceWithConnectionStatus:", v10);
    goto LABEL_10;
  }
  _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412290;
    v14 = v12;
    _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "unsupported notification, %@", (uint8_t *)&v13, 0xCu);

  }
LABEL_11:

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
  v7[2] = __60__RTVehicleLocationProvider_onVehicleConnectedNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __60__RTVehicleLocationProvider_onVehicleConnectedNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onVehicleConnectedNotification:", *(_QWORD *)(a1 + 40));
}

- (void)_onVehicleExit
{
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  double v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[RTVehicleLocationProvider pendingVehicleParkedEvent](self, "pendingVehicleParkedEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4
    && (-[RTVehicleLocationProvider pendingVehicleParkedEvent](self, "pendingVehicleParkedEvent"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "confirmed"),
        v5,
        v4,
        !v6))
  {
    -[RTVehicleLocationProvider pendingVehicleParkedEvent](self, "pendingVehicleParkedEvent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSinceNow");
    v11 = v10;

    _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v23 = v13;
      v24 = 2048;
      v25 = -v11;
      _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_INFO, "%@ called after %f seconds of the vehicle event.", buf, 0x16u);

    }
    objc_initWeak((id *)buf, self);
    v14 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __43__RTVehicleLocationProvider__onVehicleExit__block_invoke;
    v20[3] = &unk_1E92983E8;
    objc_copyWeak(&v21, (id *)buf);
    v15 = MEMORY[0x1D8232094](v20);
    v16 = (void *)v15;
    if (v11 <= -300.0)
    {
      -[RTVehicleLocationProvider locationManager](self, "locationManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = v14;
      v18[1] = 3221225472;
      v18[2] = __43__RTVehicleLocationProvider__onVehicleExit__block_invoke_134;
      v18[3] = &unk_1E929AAC0;
      v18[4] = self;
      v19 = v16;
      objc_msgSend(v17, "fetchCurrentLocationWithHandler:", v18);

    }
    else
    {
      (*(void (**)(uint64_t))(v15 + 16))(v15);
    }

    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "No vehicle event to confirm or vehicle event already confirmed.", buf, 2u);
    }

  }
}

void __43__RTVehicleLocationProvider__onVehicleExit__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v2;
  void *v3;
  void *v4;
  char v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "pendingVehicleParkedEvent");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2
    && (v3 = (void *)v2,
        objc_msgSend(WeakRetained, "pendingVehicleParkedEvent"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "confirmed"),
        v4,
        v3,
        (v5 & 1) == 0))
  {
    objc_msgSend(WeakRetained, "pendingVehicleParkedEvent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setConfirmed:", 1);

    objc_msgSend(WeakRetained, "_finalizeLastVehicleEventIfAppropriate");
    _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(WeakRetained, "pendingVehicleParkedEvent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v8;
      _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "Confirming the vehicle event, %@", (uint8_t *)&v9, 0xCu);

    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "No vehicle event to confirm, or vehicle event already confirmed.", (uint8_t *)&v9, 2u);
    }
  }

}

void __43__RTVehicleLocationProvider__onVehicleExit__block_invoke_134(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __43__RTVehicleLocationProvider__onVehicleExit__block_invoke_2;
  v12[3] = &unk_1E9297EB8;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v15 = v5;
  v16 = v9;
  v10 = v5;
  v11 = v6;
  dispatch_async(v7, v12);

}

void __43__RTVehicleLocationProvider__onVehicleExit__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  const char *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  NSObject *v12;
  int v13;
  double v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (v3)
  {
    objc_msgSend(v2, "setPendingVehicleParkedEvent:", 0);
    objc_msgSend(*(id *)(a1 + 40), "_recordMetricSuppressedEvent");
    _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      LOWORD(v13) = 0;
      v5 = "Sanity check failed. No location fix on vehicle exit.";
LABEL_10:
      _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, v5, (uint8_t *)&v13, 2u);
    }
  }
  else
  {
    objc_msgSend(v2, "pendingVehicleParkedEvent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "location");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "latitude");
    objc_msgSend(*(id *)(a1 + 40), "pendingVehicleParkedEvent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "location");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "longitude");
    objc_msgSend(*(id *)(a1 + 48), "coordinate");
    objc_msgSend(*(id *)(a1 + 48), "coordinate");
    RTCommonCalculateDistance();
    v11 = v10;

    _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = 134217984;
      v14 = v11;
      _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_INFO, "Sanity check, distance between exit and disconnect, %f", (uint8_t *)&v13, 0xCu);
    }

    if (v11 < 700.0)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      return;
    }
    objc_msgSend(*(id *)(a1 + 40), "setPendingVehicleParkedEvent:", 0);
    _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      LOWORD(v13) = 0;
      v5 = "Sanity check failed. Removing pending vehicle event since we're not confident about it.";
      goto LABEL_10;
    }
  }

}

- (void)_onVehicleExitNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTMotionActivityManagerNotificationVehicleExit, "notificationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v7)
  {
    if (v9)
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "Got onVehicleExitNotification.", (uint8_t *)&v11, 2u);
    }

    -[RTVehicleLocationProvider _onVehicleExit](self, "_onVehicleExit");
    -[RTVehicleLocationProvider _submitFMCVehicleConnectionEventInstanceWithConnectionStatus:](self, "_submitFMCVehicleConnectionEventInstanceWithConnectionStatus:", 3);
  }
  else
  {
    if (v9)
    {
      objc_msgSend(v4, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = v10;
      _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "unsupported notification, %@", (uint8_t *)&v11, 0xCu);

    }
  }

}

- (void)onVehicleExitNotification:(id)a3
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
  v7[2] = __55__RTVehicleLocationProvider_onVehicleExitNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __55__RTVehicleLocationProvider_onVehicleExitNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onVehicleExitNotification:", *(_QWORD *)(a1 + 40));
}

- (void)internalAddObserver:(id)a3 name:(id)a4
{
  id v4;
  id v5;

  v4 = a4;
  +[RTNotification notificationName](RTVehicleEventNotification, "notificationName");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "isEqualToString:", v5);

}

- (void)internalRemoveObserver:(id)a3 name:(id)a4
{
  id v4;
  id v5;

  v4 = a4;
  +[RTNotification notificationName](RTVehicleEventNotification, "notificationName");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "isEqualToString:", v5);

}

- (id)_getLastVehicleEvents
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  -[RTVehicleLocationProvider lastVehicleParkedEvent](self, "lastVehicleParkedEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "location");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[RTVehicleLocationProvider lastVehicleParkedEvent](self, "lastVehicleParkedEvent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "confirmed");

    if (v7)
    {
      -[RTVehicleLocationProvider lastVehicleParkedEvent](self, "lastVehicleParkedEvent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v8, "copy");
      v12[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      return v10;
    }
  }
  else
  {

  }
  return 0;
}

- (void)fetchLastVehicleEventsWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (v4)
  {
    -[RTNotifier queue](self, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __63__RTVehicleLocationProvider_fetchLastVehicleEventsWithHandler___block_invoke;
    v6[3] = &unk_1E9297650;
    v6[4] = self;
    v7 = v4;
    dispatch_async(v5, v6);

  }
}

void __63__RTVehicleLocationProvider_fetchLastVehicleEventsWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;

  if ((objc_msgSend(*(id *)(a1 + 32), "monitorVehicleLocation") & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 32), "monitorExternalVehicleLocation") & 1) != 0)
  {
    v2 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "_getLastVehicleEvents");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, _QWORD))(v2 + 16))(v2, v4, 0);
  }
  else
  {
    v3 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 2, 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v3 + 16))(v3, 0, v4);
  }

}

- (void)vehicleEventAtLocation:(id)a3 notes:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[RTNotifier queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __66__RTVehicleLocationProvider_vehicleEventAtLocation_notes_handler___block_invoke;
  v15[3] = &unk_1E9297EB8;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

uint64_t __66__RTVehicleLocationProvider_vehicleEventAtLocation_notes_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_vehicleEventAtLocation:notes:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_vehicleEventAtLocation:(id)a3 notes:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t);
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t))a5;
  _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v34 = v8;
    v35 = 2112;
    v36 = v9;
    _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "_vehicleEventAtLocation, %@, notes, %@", buf, 0x16u);
  }

  if (-[RTVehicleLocationProvider monitorVehicleLocation](self, "monitorVehicleLocation"))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTVehicleLocationProvider pendingVehicleParkedEvent](self, "pendingVehicleParkedEvent");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
      goto LABEL_17;
    v14 = (void *)v13;
    -[RTVehicleLocationProvider pendingVehicleParkedEvent](self, "pendingVehicleParkedEvent");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "date");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "timeIntervalSinceDate:", v16);
    v18 = v17;

    if (v18 < 10.0)
    {
      _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_INFO, "Found recent parking event. Merging into existing event.", buf, 2u);
      }

      if (v8)
      {
        v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D183B0]), "initWithCLLocation:", v8);
        -[RTVehicleLocationProvider pendingVehicleParkedEvent](self, "pendingVehicleParkedEvent");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setLocation:", v20);

        -[RTVehicleLocationProvider pendingVehicleParkedEvent](self, "pendingVehicleParkedEvent");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setUserSetLocation:", 1);

      }
      if (v9)
      {
        -[RTVehicleLocationProvider pendingVehicleParkedEvent](self, "pendingVehicleParkedEvent");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setNotes:", v9);

      }
      -[RTVehicleLocationProvider pendingVehicleParkedEvent](self, "pendingVehicleParkedEvent");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setConfirmed:", 1);
    }
    else
    {
LABEL_17:
      v27 = objc_alloc(MEMORY[0x1E0D18570]);
      v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D183B0]), "initWithCLLocation:", v8);
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v32) = 1;
      v29 = (void *)objc_msgSend(v27, "initWithDate:location:vehicleIdentifier:userSetLocation:notes:identifier:photo:mapItem:confirmed:", v12, v24, 0, v8 != 0, v9, v28, 0, 0, v32);
      -[RTVehicleLocationProvider setPendingVehicleParkedEvent:](self, "setPendingVehicleParkedEvent:", v29);

    }
    -[RTVehicleLocationProvider pendingVehicleParkedEvent](self, "pendingVehicleParkedEvent");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "location");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      -[RTVehicleLocationProvider _processPendingVehicleEventAfterLocationFinalization](self, "_processPendingVehicleEventAfterLocationFinalization");
      if (!v10)
        goto LABEL_24;
    }
    else
    {
      -[RTVehicleLocationProvider requestLocations](self, "requestLocations");
      if (!v10)
      {
LABEL_24:

        goto LABEL_25;
      }
    }
    v26 = 0;
LABEL_23:
    v10[2](v10, v26);
    goto LABEL_24;
  }
  _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_INFO, "FMC disabled, not creating vehicle event.", buf, 2u);
  }

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 2, 0);
    v26 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v26;
    goto LABEL_23;
  }
LABEL_25:

}

- (void)_clearAllVehicleEvents
{
  void *v3;
  void *v4;

  -[RTVehicleLocationProvider lastVehicleParkedEvent](self, "lastVehicleParkedEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

  }
  else
  {
    -[RTVehicleLocationProvider pendingVehicleParkedEvent](self, "pendingVehicleParkedEvent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
      return;
  }
  -[RTVehicleLocationProvider setLastVehicleParkedEvent:](self, "setLastVehicleParkedEvent:", 0);
  -[RTVehicleLocationProvider setPendingVehicleParkedEvent:](self, "setPendingVehicleParkedEvent:", 0);
  -[RTVehicleLocationProvider setMonitorLocation:](self, "setMonitorLocation:", 0);
  -[RTVehicleLocationProvider _deleteLastVehicleEvent](self, "_deleteLastVehicleEvent");
  -[RTVehicleLocationProvider _notifyClients](self, "_notifyClients");
}

- (void)clearAllVehicleEvents
{
  NSObject *v3;
  _QWORD block[5];

  -[RTNotifier queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__RTVehicleLocationProvider_clearAllVehicleEvents__block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __50__RTVehicleLocationProvider_clearAllVehicleEvents__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_clearAllVehicleEvents");
}

- (void)updateVehicleEventWithIdentifier:(id)a3 notes:(id)a4
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
  -[RTNotifier queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__RTVehicleLocationProvider_updateVehicleEventWithIdentifier_notes___block_invoke;
  block[3] = &unk_1E9299D78;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __68__RTVehicleLocationProvider_updateVehicleEventWithIdentifier_notes___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(*(id *)(a1 + 32), "lastVehicleParkedEvent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 40));

  if (v4)
  {
    v5 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "lastVehicleParkedEvent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNotes:", v5);

    v7 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "UUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_submitFMCAssistanceInstanceWithIdentifier:uiPlacement:assistanceType:assistanceValue:", v8, 0, 1, 0);

    objc_msgSend(*(id *)(a1 + 32), "_persistLastVehicleEvent");
    objc_msgSend(*(id *)(a1 + 32), "_notifyClients");
  }
}

- (void)updateVehicleEventWithIdentifier:(id)a3 photo:(id)a4
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
  -[RTNotifier queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__RTVehicleLocationProvider_updateVehicleEventWithIdentifier_photo___block_invoke;
  block[3] = &unk_1E9299D78;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __68__RTVehicleLocationProvider_updateVehicleEventWithIdentifier_photo___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(*(id *)(a1 + 32), "lastVehicleParkedEvent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 40));

  if (v4)
  {
    v5 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "lastVehicleParkedEvent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPhoto:", v5);

    v7 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "UUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_submitFMCAssistanceInstanceWithIdentifier:uiPlacement:assistanceType:assistanceValue:", v8, 0, 2, 0);

    objc_msgSend(*(id *)(a1 + 32), "_persistLastVehicleEvent");
    objc_msgSend(*(id *)(a1 + 32), "_notifyClients");
  }
}

- (void)updateVehicleEventWithIdentifier:(id)a3 mapItem:(id)a4
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
  -[RTNotifier queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__RTVehicleLocationProvider_updateVehicleEventWithIdentifier_mapItem___block_invoke;
  block[3] = &unk_1E9299D78;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __70__RTVehicleLocationProvider_updateVehicleEventWithIdentifier_mapItem___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  int v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  id v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  void *v21;
  double v22;
  uint64_t v23;
  id v24;
  void *v25;
  id v26;

  objc_msgSend(a1[4], "lastVehicleParkedEvent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", a1[5]);

  if (v4)
  {
    v5 = a1[6];
    objc_msgSend(a1[4], "lastVehicleParkedEvent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setMapItem:", v5);

    v7 = objc_alloc(MEMORY[0x1E0C9E3B8]);
    objc_msgSend(a1[4], "lastVehicleParkedEvent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "location");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "latitude");
    v11 = v10;
    objc_msgSend(a1[4], "lastVehicleParkedEvent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "location");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "longitude");
    v26 = (id)objc_msgSend(v7, "initWithLatitude:longitude:", v11, v14);

    v15 = objc_alloc(MEMORY[0x1E0C9E3B8]);
    objc_msgSend(a1[6], "location");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "latitude");
    v18 = v17;
    objc_msgSend(a1[6], "location");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "longitude");
    v21 = (void *)objc_msgSend(v15, "initWithLatitude:longitude:", v18, v20);

    objc_msgSend(v26, "distanceFromLocation:", v21);
    v23 = (int)v22;
    v24 = a1[4];
    objc_msgSend(a1[5], "UUIDString");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "_submitFMCAssistanceInstanceWithIdentifier:uiPlacement:assistanceType:assistanceValue:", v25, 1, 3, v23);

    objc_msgSend(a1[4], "_persistLastVehicleEvent");
    objc_msgSend(a1[4], "_notifyClients");

  }
}

- (void)updateVehicleEventWithIdentifier:(id)a3 location:(id)a4
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
  -[RTNotifier queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__RTVehicleLocationProvider_updateVehicleEventWithIdentifier_location___block_invoke;
  block[3] = &unk_1E9299D78;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __71__RTVehicleLocationProvider_updateVehicleEventWithIdentifier_location___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  objc_msgSend(*(id *)(a1 + 32), "lastVehicleParkedEvent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 40));

  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0C9E3B8]);
    objc_msgSend(*(id *)(a1 + 32), "lastVehicleParkedEvent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "location");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "latitude");
    v9 = v8;
    objc_msgSend(*(id *)(a1 + 32), "lastVehicleParkedEvent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "location");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "longitude");
    v21 = (id)objc_msgSend(v5, "initWithLatitude:longitude:", v9, v12);

    objc_msgSend(v21, "distanceFromLocation:", *(_QWORD *)(a1 + 48));
    v14 = (int)v13;
    v15 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "UUIDString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_submitFMCAssistanceInstanceWithIdentifier:uiPlacement:assistanceType:assistanceValue:", v16, 1, 4, v14);

    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D183B0]), "initWithCLLocation:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "lastVehicleParkedEvent");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setLocation:", v17);

    objc_msgSend(*(id *)(a1 + 32), "lastVehicleParkedEvent");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setUserSetLocation:", 1);

    objc_msgSend(*(id *)(a1 + 32), "lastVehicleParkedEvent");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setLocationQuality:", 0);

    objc_msgSend(*(id *)(a1 + 32), "_persistLastVehicleEvent");
    objc_msgSend(*(id *)(a1 + 32), "_notifyClients");

  }
}

- (void)engageInVehicleEventWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[RTNotifier queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__RTVehicleLocationProvider_engageInVehicleEventWithIdentifier___block_invoke;
  block[3] = &unk_1E9298210;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __64__RTVehicleLocationProvider_engageInVehicleEventWithIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "lastVehicleParkedEvent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "UUIDString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_submitFMCAssistanceInstanceWithIdentifier:uiPlacement:assistanceType:assistanceValue:", v5, 1, 5, 0);

  }
}

- (void)_postBulletinNotificationIfAppropriate
{
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  RTDefaultsManager *defaultsManager;
  int v19;
  _BYTE v20[10];
  _WORD v21[9];

  *(_QWORD *)&v21[5] = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LOWORD(v19) = 0;
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "_postNotificationIfAppropriate called.", (uint8_t *)&v19, 2u);
  }

  -[RTVehicleLocationProvider lastVehicleParkedEvent](self, "lastVehicleParkedEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "userSetLocation") & 1) != 0)
    goto LABEL_6;
  -[RTVehicleLocationProvider lastVehicleParkedEvent](self, "lastVehicleParkedEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "usualLocation"))
  {

LABEL_6:
    goto LABEL_7;
  }
  -[RTVehicleLocationProvider lastVehicleParkedEvent](self, "lastVehicleParkedEvent");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "locationQuality");

  if (v14 != 1)
  {
LABEL_7:
    _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      -[RTVehicleLocationProvider lastVehicleParkedEvent](self, "lastVehicleParkedEvent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "userSetLocation");
      -[RTVehicleLocationProvider lastVehicleParkedEvent](self, "lastVehicleParkedEvent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "usualLocation");
      -[RTVehicleLocationProvider lastVehicleParkedEvent](self, "lastVehicleParkedEvent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "locationQuality");
      v19 = 67109632;
      *(_DWORD *)v20 = v8;
      *(_WORD *)&v20[4] = 1024;
      *(_DWORD *)&v20[6] = v10;
      v21[0] = 2048;
      *(_QWORD *)&v21[1] = v12;
      _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "Not posting bulletin board notification, userSetLocation, %d, usualLocation, %d, locationQuality, %lu", (uint8_t *)&v19, 0x18u);

LABEL_9:
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  -[RTDefaultsManager objectForKey:](self->_defaultsManager, "objectForKey:", CFSTR("RTDefaultsVehicleEventBulletinNotificationPosted"));
  v6 = objc_claimAutoreleasedReturnValue();
  _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v19 = 138412546;
    *(_QWORD *)v20 = CFSTR("RTDefaultsVehicleEventBulletinNotificationPosted");
    *(_WORD *)&v20[8] = 2112;
    *(_QWORD *)v21 = v6;
    _os_log_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_INFO, "default, %@, value, %@", (uint8_t *)&v19, 0x16u);
  }

  if (!-[NSObject integerValue](v6, "integerValue"))
  {
    -[RTVehicleLocationProvider mapsSupportManager](self, "mapsSupportManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTVehicleLocationProvider lastVehicleParkedEvent](self, "lastVehicleParkedEvent");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "showParkedCarBulletinForEvent:", v17);

    defaultsManager = self->_defaultsManager;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[NSObject integerValue](v6, "integerValue") + 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTDefaultsManager setObject:forKey:](defaultsManager, "setObject:forKey:", v7, CFSTR("RTDefaultsVehicleEventBulletinNotificationPosted"));
    goto LABEL_9;
  }
LABEL_10:

}

- (void)_postVehicleReplacementBulletinNotificationWithVehicleEvent:(id)a3 replacingEvent:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[RTVehicleLocationProvider mapsSupportManager](self, "mapsSupportManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "showParkedCarReplacementBulletinForEvent:replacingEvent:", v7, v6);

}

- (void)_clearBulletinNotifications
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "_clearBulletinNotifications called.", v5, 2u);
  }

  -[RTVehicleLocationProvider mapsSupportManager](self, "mapsSupportManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clearParkedCarBulletin");

}

- (void)_onExternalVehicleEventReceived:(id)a3
{
  id v4;
  NSObject *v5;
  RTVehicleEventNotification *v6;
  void *v7;
  RTVehicleEventNotification *v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v4;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "Notifying clients about an external vehicle event. %@", buf, 0xCu);
  }

  if (v4)
  {
    -[RTVehicleLocationProvider setLastVehicleParkedEvent:](self, "setLastVehicleParkedEvent:", v4);
    -[RTVehicleLocationProvider _persistLastVehicleEvent](self, "_persistLastVehicleEvent");
    v6 = [RTVehicleEventNotification alloc];
    v9 = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[RTVehicleEventNotification initWithVehicleEvents:](v6, "initWithVehicleEvents:", v7);

    -[RTNotifier postNotification:](self, "postNotification:", v8);
  }
  else
  {
    -[RTVehicleLocationProvider _clearAllVehicleEvents](self, "_clearAllVehicleEvents");
  }

}

- (void)_notifyClients
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  RTVehicleEventNotification *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[4];
  uint64_t v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[RTVehicleLocationProvider _getLastVehicleEvents](self, "_getLastVehicleEvents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v7++), "setPhoto:", 0);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
    }
    while (v5);
  }
  v8 = -[RTVehicleEventNotification initWithVehicleEvents:]([RTVehicleEventNotification alloc], "initWithVehicleEvents:", v3);
  _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = objc_msgSend(v3, "count");
    *(_DWORD *)buf = 134217984;
    v17 = v10;
    _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "Notifying clients about %lu vehicle events.", buf, 0xCu);
  }

  -[RTNotifier postNotification:](self, "postNotification:", v8);
  objc_msgSend(v3, "lastObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTVehicleLocationProvider _sendVehicleEventToCompanionDevice:](self, "_sendVehicleEventToCompanionDevice:", v11);

}

- (void)_sendVehicleEventToCompanionDevice:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  RTVehicleLocationProvider *v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[RTVehicleLocationProvider companionLink](self, "companionLink");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    v7 = -[RTVehicleLocationProvider monitorExternalVehicleLocation](self, "monitorExternalVehicleLocation");

    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTVehicleLocationProvider setLastCompanionSyncRequestDate:](self, "setLastCompanionSyncRequestDate:", v8);

      _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v4, "date");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTVehicleLocationProvider lastCompanionSyncDate](self, "lastCompanionSyncDate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTVehicleLocationProvider lastCompanionSyncRequestDate](self, "lastCompanionSyncRequestDate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v18 = v10;
        v19 = 2112;
        v20 = v11;
        v21 = 2112;
        v22 = v12;
        _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "CompanionSync, vehicle.date, %@, last.sync.date, %@, request.date, %@", buf, 0x20u);

      }
      -[RTVehicleLocationProvider companionLink](self, "companionLink");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __64__RTVehicleLocationProvider__sendVehicleEventToCompanionDevice___block_invoke;
      v14[3] = &unk_1E9297D58;
      v15 = v4;
      v16 = self;
      objc_msgSend(v13, "sendVehicleEvent:handler:", v15, v14);

    }
  }

}

void __64__RTVehicleLocationProvider__sendVehicleEventToCompanionDevice___block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  const __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "lastCompanionSyncDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "lastCompanionSyncRequestDate");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    v9 = CFSTR("failure");
    v11 = 138413058;
    v12 = v5;
    if (a2)
      v9 = CFSTR("success");
    v13 = 2112;
    v14 = v6;
    v15 = 2112;
    v16 = v7;
    v17 = 2112;
    v18 = v9;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "CompanionSync, vehicle.date, %@, last.sync.date, %@, request.date, %@, result, %@", (uint8_t *)&v11, 0x2Au);

  }
  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setLastCompanionSyncDate:", v10);

  }
}

- (void)_resendVehicleEventIfNecessary
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  id v7;

  -[RTVehicleLocationProvider lastCompanionSyncDate](self, "lastCompanionSyncDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTVehicleLocationProvider lastCompanionSyncRequestDate](self, "lastCompanionSyncRequestDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isBeforeDate:", v4);

  if (v5)
  {
    -[RTVehicleLocationProvider _getLastVehicleEvents](self, "_getLastVehicleEvents");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTVehicleLocationProvider _sendVehicleEventToCompanionDevice:](self, "_sendVehicleEventToCompanionDevice:", v6);

  }
}

- (BOOL)_deleteLastVehicleEvent
{
  void *v3;
  void *v4;
  uint64_t v5;
  BOOL v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  _QWORD v11[6];
  uint8_t v12[8];
  uint8_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[RTVehicleLocationProvider managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    *(_QWORD *)v12 = 0;
    v13 = v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__62;
    v16 = __Block_byref_object_dispose__62;
    v17 = 0;
    -[RTVehicleLocationProvider managedObjectContext](self, "managedObjectContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __52__RTVehicleLocationProvider__deleteLastVehicleEvent__block_invoke;
    v11[3] = &unk_1E92977E0;
    v11[4] = self;
    v11[5] = v12;
    objc_msgSend(v4, "performBlockAndWait:", v11);

    v5 = *((_QWORD *)v13 + 5);
    v6 = v5 == 0;
    if (v5)
    {
      _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(*((id *)v13 + 5), "description");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v19 = v8;
        _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "Error deleting last parked event, %@", buf, 0xCu);

      }
    }
    _Block_object_dispose(v12, 8);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "No managed object context, not deleting.", v12, 2u);
    }

    -[RTVehicleLocationProvider setVehicleEventPendingPersist:](self, "setVehicleEventPendingPersist:", 0);
    -[RTVehicleLocationProvider setVehicleEventPendingDeletion:](self, "setVehicleEventPendingDeletion:", 1);
    return 0;
  }
  return v6;
}

void __52__RTVehicleLocationProvider__deleteLastVehicleEvent__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSManagedObject entityName](RTVehicleEventMO, "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v2, "deleteAllWithEntityName:predicate:error:", v3, 0, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(id *)(v6 + 40);
    objc_msgSend(v5, "save:", &v7);
    objc_storeStrong((id *)(v6 + 40), v7);

  }
}

- (BOOL)_persistLastVehicleEvent
{
  RTVehicleLocationProvider *v2;
  void *v3;

  v2 = self;
  -[RTVehicleLocationProvider lastVehicleParkedEvent](self, "lastVehicleParkedEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[RTVehicleLocationProvider _persistVehicleEvent:](v2, "_persistVehicleEvent:", v3);

  return (char)v2;
}

- (BOOL)_persistVehicleEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  BOOL v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  NSObject *v16;
  NSObject *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  RTVehicleLocationProvider *v22;
  uint8_t *v23;
  uint8_t v24[8];
  uint8_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
LABEL_10:
    _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v24 = 0;
      _os_log_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_INFO, "Not persisting last vehicle event without a date, location or identifier.", v24, 2u);
    }
    goto LABEL_12;
  }
  objc_msgSend(v4, "location");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {

    goto LABEL_10;
  }
  objc_msgSend(v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_10;
  -[RTVehicleLocationProvider managedObjectContext](self, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v24 = 0;
      _os_log_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_INFO, "No managed object context, not persisting.", v24, 2u);
    }

    -[RTVehicleLocationProvider lastVehicleParkedEvent](self, "lastVehicleParkedEvent");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTVehicleLocationProvider setVehicleEventPendingPersist:](self, "setVehicleEventPendingPersist:", v19);

    goto LABEL_13;
  }
  if (!-[RTVehicleLocationProvider _deleteLastVehicleEvent](self, "_deleteLastVehicleEvent"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v24 = 0;
      _os_log_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_INFO, "Can't delete previous parked event, not saving.", v24, 2u);
    }
LABEL_12:

LABEL_13:
    v12 = 0;
    goto LABEL_14;
  }
  *(_QWORD *)v24 = 0;
  v25 = v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__62;
  v28 = __Block_byref_object_dispose__62;
  v29 = 0;
  -[RTVehicleLocationProvider managedObjectContext](self, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __50__RTVehicleLocationProvider__persistVehicleEvent___block_invoke;
  v20[3] = &unk_1E9297AD0;
  v10 = v4;
  v21 = v10;
  v22 = self;
  v23 = v24;
  objc_msgSend(v9, "performBlockAndWait:", v20);

  v11 = *((_QWORD *)v25 + 5);
  v12 = v11 == 0;
  _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
  if (v11)
  {
    if (v14)
    {
      objc_msgSend(*((id *)v25 + 5), "description");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v31 = v10;
      v32 = 2112;
      v33 = v15;
      _os_log_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_INFO, "Error persisting last vehicle event, %@, error, %@", buf, 0x16u);

    }
  }
  else if (v14)
  {
    *(_DWORD *)buf = 138412290;
    v31 = v10;
    _os_log_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_INFO, "Persisted last vehicle event, %@", buf, 0xCu);
  }

  _Block_object_dispose(v24, 8);
LABEL_14:

  return v12;
}

void __50__RTVehicleLocationProvider__persistVehicleEvent___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  id obj;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTVehicleEventMO managedObjectWithVehicleEvent:inManagedObjectContext:](RTVehicleEventMO, "managedObjectWithVehicleEvent:inManagedObjectContext:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "mapItem");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    objc_msgSend(v4, "mapItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      objc_msgSend(*(id *)(a1 + 32), "mapItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = +[RTMapItemMO managedObjectWithMapItem:inManagedObjectContext:](RTMapItemMO, "managedObjectWithMapItem:inManagedObjectContext:", v8, v9);

    }
  }
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v12 + 40);
  objc_msgSend(v11, "save:", &obj);
  objc_storeStrong((id *)(v12 + 40), obj);

}

- (void)persistLastVehicleEvent
{
  NSObject *v3;
  _QWORD block[5];

  -[RTNotifier queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__RTVehicleLocationProvider_persistLastVehicleEvent__block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __52__RTVehicleLocationProvider_persistLastVehicleEvent__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_persistLastVehicleEvent");
}

- (void)_onManagedObjectContextCreated:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  RTVehicleLocationHistoryController *v9;
  void *v10;
  void *v11;
  RTVehicleLocationHistoryController *v12;
  _DWORD v13[2];
  __int16 v14;
  _BOOL4 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    -[RTVehicleLocationProvider setManagedObjectContext:](self, "setManagedObjectContext:");
    _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      -[RTVehicleLocationProvider vehicleEventPendingPersist](self, "vehicleEventPendingPersist");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = 67109376;
      v13[1] = v5 != 0;
      v14 = 1024;
      v15 = -[RTVehicleLocationProvider vehicleEventPendingDeletion](self, "vehicleEventPendingDeletion");
      _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "_onManagedObjectContextCreated, vehicleEventPendingPersist, %d, vehicleEventPendingDeletion, %d.", (uint8_t *)v13, 0xEu);

    }
    -[RTVehicleLocationProvider vehicleEventPendingPersist](self, "vehicleEventPendingPersist");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[RTVehicleLocationProvider vehicleEventPendingPersist](self, "vehicleEventPendingPersist");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTVehicleLocationProvider _persistVehicleEvent:](self, "_persistVehicleEvent:", v7);

    }
    else if (-[RTVehicleLocationProvider vehicleEventPendingDeletion](self, "vehicleEventPendingDeletion"))
    {
      -[RTVehicleLocationProvider _deleteLastVehicleEvent](self, "_deleteLastVehicleEvent");
    }
    else
    {
      -[RTVehicleLocationProvider _restoreLastVehicleEvent](self, "_restoreLastVehicleEvent");
    }
    v9 = [RTVehicleLocationHistoryController alloc];
    -[RTNotifier queue](self, "queue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTVehicleLocationProvider managedObjectContext](self, "managedObjectContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[RTVehicleLocationHistoryController initWithQueue:managedObjectContext:](v9, "initWithQueue:managedObjectContext:", v10, v11);
    -[RTVehicleLocationProvider setVehicleLocationHistoryController:](self, "setVehicleLocationHistoryController:", v12);

    -[RTVehicleLocationProvider _updateAuxiliaryDataIfAppropriate](self, "_updateAuxiliaryDataIfAppropriate");
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LOWORD(v13[0]) = 0;
      _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "Failed to create managed object context.", (uint8_t *)v13, 2u);
    }

  }
}

- (void)_restoreLastVehicleEvent
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  _QWORD v8[6];
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[RTVehicleLocationProvider managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[RTVehicleLocationProvider lastVehicleParkedEvent](self, "lastVehicleParkedEvent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      v9[0] = 0;
      v9[1] = v9;
      v9[2] = 0x3032000000;
      v9[3] = __Block_byref_object_copy__62;
      v9[4] = __Block_byref_object_dispose__62;
      v10 = 0;
      -[RTVehicleLocationProvider managedObjectContext](self, "managedObjectContext");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __53__RTVehicleLocationProvider__restoreLastVehicleEvent__block_invoke;
      v8[3] = &unk_1E92977E0;
      v8[4] = self;
      v8[5] = v9;
      objc_msgSend(v5, "performBlockAndWait:", v8);

      _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        -[RTVehicleLocationProvider lastVehicleParkedEvent](self, "lastVehicleParkedEvent");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v12 = v7;
        _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "Restored last vehicle event, %@.", buf, 0xCu);

      }
      _Block_object_dispose(v9, 8);

    }
  }
}

void __53__RTVehicleLocationProvider__restoreLastVehicleEvent__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id obj;
  uint8_t buf[4];
  uint64_t v50;
  __int16 v51;
  uint64_t v52;
  _QWORD v53[2];

  v53[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("date"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSManagedObject entityName](RTVehicleEventMO, "entityName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v6 + 40);
  objc_msgSend(v4, "fetchAllWithEntityName:predicate:sortDescriptors:error:", v5, 0, v3, &obj);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v6 + 40), obj);

  _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = objc_msgSend(v7, "count");
    v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    *(_DWORD *)buf = 134218242;
    v50 = v9;
    v51 = 2112;
    v52 = v10;
    _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "Retrieved %lu vehicle events from disk, error, %@.", buf, 0x16u);
  }

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) && objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0D183E8];
    objc_msgSend(v11, "mapItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "createWithManagedObject:", v13);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_alloc(MEMORY[0x1E0D183B0]);
    objc_msgSend(v11, "locLatitude");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "doubleValue");
    v17 = v16;
    objc_msgSend(v11, "locLongitude");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "doubleValue");
    v20 = v19;
    objc_msgSend(v11, "locUncertainty");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "doubleValue");
    v23 = v22;
    objc_msgSend(v11, "locDate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "locReferenceFrame");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = (void *)objc_msgSend(v14, "initWithLatitude:longitude:horizontalUncertainty:date:referenceFrame:", v24, objc_msgSend(v25, "intValue"), v17, v20, v23);

    v43 = objc_alloc(MEMORY[0x1E0D18570]);
    objc_msgSend(v11, "date");
    v45 = v3;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "vehicleIdentifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "userSetLocation");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v44, "BOOLValue");
    objc_msgSend(v11, "notes");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_alloc(MEMORY[0x1E0CB3A28]);
    objc_msgSend(v11, "identifier");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)objc_msgSend(v30, "initWithUUIDString:", v31);
    objc_msgSend(v11, "photoData");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v42) = 1;
    v34 = (void *)objc_msgSend(v43, "initWithDate:location:vehicleIdentifier:userSetLocation:notes:identifier:photo:mapItem:confirmed:", v26, v46, v27, v28, v29, v32, v33, v47, v42);
    objc_msgSend(*(id *)(a1 + 32), "setLastVehicleParkedEvent:", v34);

    v3 = v45;
    objc_msgSend(v11, "locationQuality");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "integerValue");
    objc_msgSend(*(id *)(a1 + 32), "lastVehicleParkedEvent");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setLocationQuality:", v36);

    objc_msgSend(v11, "usualLocation");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "BOOLValue");
    objc_msgSend(*(id *)(a1 + 32), "lastVehicleParkedEvent");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setUsualLocation:", v39);

    objc_msgSend(*(id *)(a1 + 32), "lastVehicleParkedEvent");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setLocationFinalized:", 1);

  }
}

- (void)restoreLastVehicleEvent
{
  NSObject *v3;
  _QWORD block[5];

  -[RTNotifier queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__RTVehicleLocationProvider_restoreLastVehicleEvent__block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __52__RTVehicleLocationProvider_restoreLastVehicleEvent__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_restoreLastVehicleEvent");
}

- (void)_updateNearbyLocationOfInterestOfVehicleEvent:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "location");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[RTVehicleLocationProvider learnedLocationManager](self, "learnedLocationManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "location");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __83__RTVehicleLocationProvider__updateNearbyLocationOfInterestOfVehicleEvent_handler___block_invoke;
    v11[3] = &unk_1E929CF80;
    v11[4] = self;
    v12 = v6;
    v13 = v7;
    objc_msgSend(v9, "fetchLocationOfInterestAtLocation:handler:", v10, v11);

  }
  else if (v7)
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

void __83__RTVehicleLocationProvider__updateNearbyLocationOfInterestOfVehicleEvent_handler___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  objc_msgSend(a1[4], "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __83__RTVehicleLocationProvider__updateNearbyLocationOfInterestOfVehicleEvent_handler___block_invoke_2;
  v11[3] = &unk_1E929CF58;
  v12 = a1[5];
  v13 = v5;
  v8 = a1[6];
  v14 = v6;
  v15 = v8;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, v11);

}

uint64_t __83__RTVehicleLocationProvider__updateNearbyLocationOfInterestOfVehicleEvent_handler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t result;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D183C0]), "initWithLearnedLocationOfInterest:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setNearbyLocationOfInterest:", v2);

  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 48));
  return result;
}

- (void)_updateUsualLocationOfVehicleEvent:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  _BOOL4 v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[RTVehicleLocationProvider vehicleLocationHistoryController](self, "vehicleLocationHistoryController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUsualLocation:", objc_msgSend(v6, "_evaluateUsualLocationWithVehicleEvent:", v5));

  -[RTVehicleLocationProvider vehicleLocationHistoryController](self, "vehicleLocationHistoryController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_persistVehicleEventToHistory:", v5);

  _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTVehicleLocationProvider vehicleLocationHistoryController](self, "vehicleLocationHistoryController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412802;
    v12 = v9;
    v13 = 1024;
    v14 = v10 != 0;
    v15 = 1024;
    v16 = objc_msgSend(v5, "usualLocation");
    _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "%@, vehicleLocationHistoryController created, %d, usualLocation, %d", (uint8_t *)&v11, 0x18u);

  }
}

- (void)_updateAuxiliaryDataIfAppropriate
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[6];
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  _BOOL4 v17;
  __int16 v18;
  _BOOL4 v19;
  __int16 v20;
  _BOOL4 v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[RTVehicleLocationProvider lastVehicleParkedEvent](self, "lastVehicleParkedEvent");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[RTVehicleLocationProvider managedObjectContext](self, "managedObjectContext");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      v8 = -[RTVehicleLocationProvider locationsOfInterestAvailable](self, "locationsOfInterestAvailable");

      if (v8)
      {
        -[RTVehicleLocationProvider lastVehicleParkedEvent](self, "lastVehicleParkedEvent");
        v9 = objc_claimAutoreleasedReturnValue();
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __62__RTVehicleLocationProvider__updateAuxiliaryDataIfAppropriate__block_invoke;
        v13[3] = &unk_1E9297628;
        v13[4] = self;
        v13[5] = a2;
        -[RTVehicleLocationProvider _updateNearbyLocationOfInterestOfVehicleEvent:handler:](self, "_updateNearbyLocationOfInterestOfVehicleEvent:handler:", v9, v13);
        goto LABEL_8;
      }
    }
    else
    {

    }
  }
  _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTVehicleLocationProvider lastVehicleParkedEvent](self, "lastVehicleParkedEvent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTVehicleLocationProvider managedObjectContext](self, "managedObjectContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v15 = v10;
    v16 = 1024;
    v17 = v11 != 0;
    v18 = 1024;
    v19 = v12 != 0;
    v20 = 1024;
    v21 = -[RTVehicleLocationProvider locationsOfInterestAvailable](self, "locationsOfInterestAvailable");
    _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "%@, lastVehicleParkedEvent, %d, managedObjectContext, %d, locationsOfInterestAvailable, %d", buf, 0x1Eu);

  }
LABEL_8:

}

void __62__RTVehicleLocationProvider__updateAuxiliaryDataIfAppropriate__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "lastVehicleParkedEvent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "nearbyLocationOfInterest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412802;
    v16 = v5;
    v17 = 2112;
    v18 = v7;
    v19 = 2112;
    v20 = v3;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "%@, nearbyLOI, %@, error, %@", (uint8_t *)&v15, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 32), "lastVehicleParkedEvent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "usualLocation");

  v10 = *(void **)(a1 + 32);
  objc_msgSend(v10, "lastVehicleParkedEvent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_updateUsualLocationOfVehicleEvent:", v11);

  objc_msgSend(*(id *)(a1 + 32), "lastVehicleParkedEvent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 != objc_msgSend(v12, "usualLocation"))
  {

LABEL_6:
    objc_msgSend(*(id *)(a1 + 32), "_notifyClients");
    goto LABEL_7;
  }
  objc_msgSend(*(id *)(a1 + 32), "lastVehicleParkedEvent");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "nearbyLocationOfInterest");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    goto LABEL_6;
LABEL_7:

}

- (BOOL)_sameVehicleWithDeviceId:(id)a3 otherDeviceId:(id)a4
{
  if (a3 && a4)
    return objc_msgSend(a3, "isEqualToString:", a4);
  else
    return 1;
}

- (void)didReceiveEffectiveSettingsChangedNotification
{
  NSObject *v3;
  _QWORD block[5];

  -[RTNotifier queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__RTVehicleLocationProvider_didReceiveEffectiveSettingsChangedNotification__block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __75__RTVehicleLocationProvider_didReceiveEffectiveSettingsChangedNotification__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateFeatureEnablement");
}

- (void)onNanoRegistryNotification:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[RTNotifier queue](self, "queue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__RTVehicleLocationProvider_onNanoRegistryNotification___block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_async(v4, block);

}

uint64_t __56__RTVehicleLocationProvider_onNanoRegistryNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateFeatureEnablement");
}

- (void)onLearnedLocationManagerNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  RTVehicleLocationProvider *v9;

  v4 = a3;
  -[RTNotifier queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__RTVehicleLocationProvider_onLearnedLocationManagerNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __66__RTVehicleLocationProvider_onLearnedLocationManagerNotification___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  int v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "name");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412290;
    v12 = v3;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "received %@", (uint8_t *)&v11, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTLearnedLocationManagerNotificationAvailabilityDidChange, "notificationName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if (v6)
  {
    v7 = objc_msgSend(*(id *)(a1 + 32), "available");
    v8 = *(void **)(a1 + 40);
    if (v7)
    {
      objc_msgSend(v8, "setLocationsOfInterestAvailable:", 1);
      objc_msgSend(*(id *)(a1 + 40), "_updateAuxiliaryDataIfAppropriate");
    }
    else
    {
      objc_msgSend(v8, "setLocationsOfInterestAvailable:", 0);
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = v10;
      _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "unhandled notification, %@", (uint8_t *)&v11, 0xCu);

    }
  }
}

- (void)fetchAutomaticVehicleEventDetectionSupportedWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD block[4];
  NSObject *v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[RTNotifier queue](self, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __85__RTVehicleLocationProvider_fetchAutomaticVehicleEventDetectionSupportedWithHandler___block_invoke;
    block[3] = &unk_1E9297178;
    v8 = v4;
    dispatch_async(v5, block);

    v6 = v8;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v10 = "-[RTVehicleLocationProvider fetchAutomaticVehicleEventDetectionSupportedWithHandler:]";
      v11 = 1024;
      v12 = 1508;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }

}

uint64_t __85__RTVehicleLocationProvider_fetchAutomaticVehicleEventDetectionSupportedWithHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E0CA5700], "isAvailable");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchFMCEnabledWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[5];
  NSObject *v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[RTNotifier queue](self, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __56__RTVehicleLocationProvider_fetchFMCEnabledWithHandler___block_invoke;
    v7[3] = &unk_1E9297678;
    v7[4] = self;
    v8 = v4;
    dispatch_async(v5, v7);

    v6 = v8;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v10 = "-[RTVehicleLocationProvider fetchFMCEnabledWithHandler:]";
      v11 = 1024;
      v12 = 1528;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }

}

uint64_t __56__RTVehicleLocationProvider_fetchFMCEnabledWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "monitorVehicleLocation"), 0);
}

- (void)_submitFMCParkingEventMetric:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  -[RTVehicleLocationProvider _createMetricFromParkingEvent:](self, "_createMetricFromParkingEvent:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = (void *)objc_msgSend(v3, "initWithCString:encoding:", RTAnalyticsEventFindMyCarParkingEvent, 1);
  log_analytics_submission(v4, v6);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

}

- (id)_createMetricFromParkingEvent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "location");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "horizontalUncertainty");
  objc_msgSend(v5, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("horizontalAccuracy"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "locationQuality"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("qualityIndicator"));

  v9 = (void *)MEMORY[0x1E0CB37E8];
  LODWORD(v6) = objc_msgSend(v3, "userSetLocation");

  if ((_DWORD)v6)
    v10 = 2;
  else
    v10 = 1;
  objc_msgSend(v9, "numberWithUnsignedInteger:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("triggerType"));

  objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("userAssistanceRequired"));
  return v4;
}

- (void)_onDailyMetricNotification:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  char v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("RTMetricManagerDailyMetricNotification"));

  if ((v6 & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "name");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v20 = v18;
      v21 = 2080;
      v22 = "-[RTVehicleLocationProvider _onDailyMetricNotification:]";
      v23 = 1024;
      v24 = 1560;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "unknown notification name, %@ (in %s:%d)", buf, 0x1Cu);

    }
  }
  objc_msgSend(v4, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("RTMetricManagerDailyMetricNotification"));

  if ((v9 & 1) != 0)
  {
    -[RTVehicleLocationProvider scoreBoard](self, "scoreBoard");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTVehicleLocationProvider _createMetricFromScoreBoard:](self, "_createMetricFromScoreBoard:", v10);
    v11 = objc_claimAutoreleasedReturnValue();

    -[RTVehicleLocationProvider scoreBoardForUnusualLocation](self, "scoreBoardForUnusualLocation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "clearScoreBoard");

    -[RTVehicleLocationProvider scoreBoardForUsualLocation](self, "scoreBoardForUsualLocation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "clearScoreBoard");

    -[RTVehicleLocationProvider scoreBoard](self, "scoreBoard");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "clearScoreBoard");

    v15 = objc_alloc(MEMORY[0x1E0CB3940]);
    v16 = (void *)objc_msgSend(v15, "initWithCString:encoding:", RTAnalyticsEventFindMyCarReports, 1);
    log_analytics_submission(v16, v11);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.%@"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    AnalyticsSendEvent();

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    objc_msgSend(v4, "name");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v20 = v16;
    _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "unknown notification name, %@", buf, 0xCu);
  }

LABEL_9:
}

- (void)onDailyMetricNotification:(id)a3
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
  v7[2] = __55__RTVehicleLocationProvider_onDailyMetricNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __55__RTVehicleLocationProvider_onDailyMetricNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onDailyMetricNotification:", *(_QWORD *)(a1 + 40));
}

- (id)_createMetricFromScoreBoard:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint8_t v20[16];

  v3 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v20 = 0;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "create mertric from scoreBoard", v20, 2u);
  }

  v5 = (void *)objc_opt_new();
  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "creationDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceDate:", v8);
  objc_msgSend(v6, "numberWithInt:", (int)v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("duration"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v3, "parkingEvents"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("parkingEvents"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v3, "engagedParkingEvents"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("engagedParkingEvents"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v3, "assistedParkingEvents"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("assistedParkingEvents"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v3, "engagements"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, CFSTR("engagements"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v3, "assistances"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, CFSTR("assistances"));

  v16 = (void *)MEMORY[0x1E0CB37E8];
  v17 = objc_msgSend(v3, "suppressedEvents");

  objc_msgSend(v16, "numberWithInt:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v18, CFSTR("suppressedParkingEvents"));

  return v5;
}

- (OS_dispatch_source)finalizeLocationEstimateTimer
{
  return self->_finalizeLocationEstimateTimer;
}

- (void)setFinalizeLocationEstimateTimer:(id)a3
{
  objc_storeStrong((id *)&self->_finalizeLocationEstimateTimer, a3);
}

- (RTLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_locationManager, a3);
}

- (RTMotionActivityManager)motionActivityManager
{
  return self->_motionActivityManager;
}

- (void)setMotionActivityManager:(id)a3
{
  objc_storeStrong((id *)&self->_motionActivityManager, a3);
}

- (RTMapsSupportManager)mapsSupportManager
{
  return self->_mapsSupportManager;
}

- (void)setMapsSupportManager:(id)a3
{
  objc_storeStrong((id *)&self->_mapsSupportManager, a3);
}

- (RTMetricManager)metricManager
{
  return self->_metricManager;
}

- (void)setMetricManager:(id)a3
{
  objc_storeStrong((id *)&self->_metricManager, a3);
}

- (NSManagedObjectContext)managedObjectContext
{
  return self->_managedObjectContext;
}

- (void)setManagedObjectContext:(id)a3
{
  objc_storeStrong((id *)&self->_managedObjectContext, a3);
}

- (RTPersistenceManager)persistenceManager
{
  return self->_persistenceManager;
}

- (void)setPersistenceManager:(id)a3
{
  objc_storeStrong((id *)&self->_persistenceManager, a3);
}

- (RTVehicleLocationHistoryController)vehicleLocationHistoryController
{
  return self->_vehicleLocationHistoryController;
}

- (void)setVehicleLocationHistoryController:(id)a3
{
  objc_storeStrong((id *)&self->_vehicleLocationHistoryController, a3);
}

- (RTLearnedLocationManager)learnedLocationManager
{
  return self->_learnedLocationManager;
}

- (void)setLearnedLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_learnedLocationManager, a3);
}

- (RTManagedConfiguration)managedConfiguration
{
  return self->_managedConfiguration;
}

- (void)setManagedConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_managedConfiguration, a3);
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void)setDefaultsManager:(id)a3
{
  objc_storeStrong((id *)&self->_defaultsManager, a3);
}

- (RTKeychainManager)keychainManager
{
  return self->_keychainManager;
}

- (void)setKeychainManager:(id)a3
{
  objc_storeStrong((id *)&self->_keychainManager, a3);
}

- (RTVehicleLocationCompanionLink)companionLink
{
  return self->_companionLink;
}

- (void)setCompanionLink:(id)a3
{
  objc_storeStrong((id *)&self->_companionLink, a3);
}

- (NSDate)lastCompanionSyncRequestDate
{
  return self->_lastCompanionSyncRequestDate;
}

- (void)setLastCompanionSyncRequestDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastCompanionSyncRequestDate, a3);
}

- (NSDate)lastCompanionSyncDate
{
  return self->_lastCompanionSyncDate;
}

- (void)setLastCompanionSyncDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastCompanionSyncDate, a3);
}

- (BOOL)monitorVehicleLocation
{
  return self->_monitorVehicleLocation;
}

- (BOOL)monitorExternalVehicleLocation
{
  return self->_monitorExternalVehicleLocation;
}

- (void)setMonitorExternalVehicleLocation:(BOOL)a3
{
  self->_monitorExternalVehicleLocation = a3;
}

- (BOOL)monitorVehicleConnection
{
  return self->_monitorVehicleConnection;
}

- (BOOL)monitorVehicleExit
{
  return self->_monitorVehicleExit;
}

- (BOOL)monitorLocation
{
  return self->_monitorLocation;
}

- (RTVehicleEvent)lastVehicleParkedEvent
{
  return self->_lastVehicleParkedEvent;
}

- (void)setLastVehicleParkedEvent:(id)a3
{
  objc_storeStrong((id *)&self->_lastVehicleParkedEvent, a3);
}

- (RTVehicleEvent)pendingVehicleParkedEvent
{
  return self->_pendingVehicleParkedEvent;
}

- (void)setPendingVehicleParkedEvent:(id)a3
{
  objc_storeStrong((id *)&self->_pendingVehicleParkedEvent, a3);
}

- (RTVehicleEvent)vehicleEventPendingPersist
{
  return self->_vehicleEventPendingPersist;
}

- (void)setVehicleEventPendingPersist:(id)a3
{
  objc_storeStrong((id *)&self->_vehicleEventPendingPersist, a3);
}

- (BOOL)vehicleEventPendingDeletion
{
  return self->_vehicleEventPendingDeletion;
}

- (void)setVehicleEventPendingDeletion:(BOOL)a3
{
  self->_vehicleEventPendingDeletion = a3;
}

- (BOOL)locationsOfInterestAvailable
{
  return self->_locationsOfInterestAvailable;
}

- (void)setLocationsOfInterestAvailable:(BOOL)a3
{
  self->_locationsOfInterestAvailable = a3;
}

- (NSMutableArray)locationsCache
{
  return self->_locationsCache;
}

- (void)setLocationsCache:(id)a3
{
  objc_storeStrong((id *)&self->_locationsCache, a3);
}

- (NSMutableArray)locationsCacheLeeched
{
  return self->_locationsCacheLeeched;
}

- (void)setLocationsCacheLeeched:(id)a3
{
  objc_storeStrong((id *)&self->_locationsCacheLeeched, a3);
}

- (RTFMCScoreBoard)scoreBoard
{
  return self->_scoreBoard;
}

- (void)setScoreBoard:(id)a3
{
  objc_storeStrong((id *)&self->_scoreBoard, a3);
}

- (RTFMCScoreBoard)scoreBoardForUnusualLocation
{
  return self->_scoreBoardForUnusualLocation;
}

- (void)setScoreBoardForUnusualLocation:(id)a3
{
  objc_storeStrong((id *)&self->_scoreBoardForUnusualLocation, a3);
}

- (RTFMCScoreBoard)scoreBoardForUsualLocation
{
  return self->_scoreBoardForUsualLocation;
}

- (void)setScoreBoardForUsualLocation:(id)a3
{
  objc_storeStrong((id *)&self->_scoreBoardForUsualLocation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scoreBoardForUsualLocation, 0);
  objc_storeStrong((id *)&self->_scoreBoardForUnusualLocation, 0);
  objc_storeStrong((id *)&self->_scoreBoard, 0);
  objc_storeStrong((id *)&self->_locationsCacheLeeched, 0);
  objc_storeStrong((id *)&self->_locationsCache, 0);
  objc_storeStrong((id *)&self->_vehicleEventPendingPersist, 0);
  objc_storeStrong((id *)&self->_pendingVehicleParkedEvent, 0);
  objc_storeStrong((id *)&self->_lastVehicleParkedEvent, 0);
  objc_storeStrong((id *)&self->_lastCompanionSyncDate, 0);
  objc_storeStrong((id *)&self->_lastCompanionSyncRequestDate, 0);
  objc_storeStrong((id *)&self->_companionLink, 0);
  objc_storeStrong((id *)&self->_keychainManager, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_managedConfiguration, 0);
  objc_storeStrong((id *)&self->_learnedLocationManager, 0);
  objc_storeStrong((id *)&self->_vehicleLocationHistoryController, 0);
  objc_storeStrong((id *)&self->_persistenceManager, 0);
  objc_storeStrong((id *)&self->_managedObjectContext, 0);
  objc_storeStrong((id *)&self->_metricManager, 0);
  objc_storeStrong((id *)&self->_mapsSupportManager, 0);
  objc_storeStrong((id *)&self->_motionActivityManager, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_finalizeLocationEstimateTimer, 0);
}

- (void)_recordMetricParkingEvent:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[RTVehicleLocationProvider scoreBoard](self, "scoreBoard");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "parkingEvent");

  LODWORD(v5) = objc_msgSend(v4, "usualLocation");
  if ((_DWORD)v5)
    -[RTVehicleLocationProvider scoreBoardForUsualLocation](self, "scoreBoardForUsualLocation");
  else
    -[RTVehicleLocationProvider scoreBoardForUnusualLocation](self, "scoreBoardForUnusualLocation");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "parkingEvent");

}

- (void)_recordMetricAssistanceEvent:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[RTVehicleLocationProvider scoreBoard](self, "scoreBoard");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assistanceEvent");

  LODWORD(v5) = objc_msgSend(v4, "usualLocation");
  if ((_DWORD)v5)
    -[RTVehicleLocationProvider scoreBoardForUsualLocation](self, "scoreBoardForUsualLocation");
  else
    -[RTVehicleLocationProvider scoreBoardForUnusualLocation](self, "scoreBoardForUnusualLocation");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assistanceEvent");

}

- (void)_recordMetricEngagementEvent:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[RTVehicleLocationProvider scoreBoard](self, "scoreBoard");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "engagementEvent");

  LODWORD(v5) = objc_msgSend(v4, "usualLocation");
  if ((_DWORD)v5)
    -[RTVehicleLocationProvider scoreBoardForUsualLocation](self, "scoreBoardForUsualLocation");
  else
    -[RTVehicleLocationProvider scoreBoardForUnusualLocation](self, "scoreBoardForUnusualLocation");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "engagementEvent");

}

- (void)_recordMetricSuppressedEvent
{
  id v2;

  -[RTVehicleLocationProvider scoreBoard](self, "scoreBoard");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "suppressedEvent");

}

- (void)_submitFMCDailyAssessments
{
  -[RTVehicleLocationProvider _submitFMCDailyAssessmentsWithSubmissionHandler:](self, "_submitFMCDailyAssessmentsWithSubmissionHandler:", 0);
}

- (void)_submitFMCDailyAssessmentsWithSubmissionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id location;

  v4 = a3;
  -[RTVehicleLocationProvider metricManager](self, "metricManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __94__RTVehicleLocationProvider_RTMetricManager___submitFMCDailyAssessmentsWithSubmissionHandler___block_invoke;
  v8[3] = &unk_1E929CFC8;
  objc_copyWeak(&v11, &location);
  v6 = v4;
  v10 = v6;
  v7 = v5;
  v9 = v7;
  objc_msgSend(v7, "fetchDiagnosticsEnabled:", v8);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __94__RTVehicleLocationProvider_RTMetricManager___submitFMCDailyAssessmentsWithSubmissionHandler___block_invoke(id *a1, int a2)
{
  id WeakRetained;
  NSObject *v4;
  _QWORD block[5];
  id v6;
  id v7;

  if (a2)
  {
    WeakRetained = objc_loadWeakRetained(a1 + 6);
    objc_msgSend(WeakRetained, "queue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __94__RTVehicleLocationProvider_RTMetricManager___submitFMCDailyAssessmentsWithSubmissionHandler___block_invoke_2;
    block[3] = &unk_1E9299330;
    block[4] = WeakRetained;
    v7 = a1[5];
    v6 = a1[4];
    dispatch_async(v4, block);

  }
}

void __94__RTVehicleLocationProvider_RTMetricManager___submitFMCDailyAssessmentsWithSubmissionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD v18[3];
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  +[RTMetricManager metricForType:](RTMetricManager, "metricForType:", 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "scoreBoard", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v3;
  objc_msgSend(*(id *)(a1 + 32), "scoreBoardForUsualLocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v4;
  objc_msgSend(*(id *)(a1 + 32), "scoreBoardForUnusualLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v10);
        +[RTMetricManager metricForType:](RTMetricManager, "metricForType:", 2);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "copyToMetric:", v12);
        objc_msgSend(v11, "clearScoreBoard");
        objc_msgSend(v2, "addAssessment:", v12);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v8);
  }

  v13 = *(_QWORD *)(a1 + 48);
  if (v13)
    (*(void (**)(uint64_t, void *, _QWORD, void *))(v13 + 16))(v13, v2, 0, &__block_literal_global_46);
  else
    objc_msgSend(*(id *)(a1 + 40), "submitMetric:withHandler:", v2, &__block_literal_global_46);

}

- (void)_registerScoreBoardSubmission
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[RTVehicleLocationProvider metricManager](self, "metricManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __75__RTVehicleLocationProvider_RTMetricManager___registerScoreBoardSubmission__block_invoke;
  v4[3] = &unk_1E929D018;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "registerQueriableMetric:withHandler:", 3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __75__RTVehicleLocationProvider_RTMetricManager___registerScoreBoardSubmission__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;
  id *v7;
  id WeakRetained;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a4;
  if (!a3)
  {
    v7 = (id *)(a1 + 32);
    WeakRetained = objc_loadWeakRetained(v7);
    objc_msgSend(WeakRetained, "queue");
    v9 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __75__RTVehicleLocationProvider_RTMetricManager___registerScoreBoardSubmission__block_invoke_2;
    v10[3] = &unk_1E929CFF0;
    objc_copyWeak(&v12, v7);
    v11 = v6;
    dispatch_async(v9, v10);

    objc_destroyWeak(&v12);
  }

}

void __75__RTVehicleLocationProvider_RTMetricManager___registerScoreBoardSubmission__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_submitFMCDailyAssessmentsWithSubmissionHandler:", *(_QWORD *)(a1 + 32));

}

- (void)_submitFMCCarParkedInstanceWithParkedEvents:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;

  v4 = a3;
  -[RTVehicleLocationProvider metricManager](self, "metricManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __90__RTVehicleLocationProvider_RTMetricManager___submitFMCCarParkedInstanceWithParkedEvents___block_invoke;
  v8[3] = &unk_1E929D068;
  v8[4] = self;
  v9 = v4;
  v10 = v5;
  v6 = v5;
  v7 = v4;
  objc_msgSend(v6, "fetchDiagnosticsEnabled:", v8);

}

void __90__RTVehicleLocationProvider_RTMetricManager___submitFMCCarParkedInstanceWithParkedEvents___block_invoke(id *a1, int a2)
{
  NSObject *v3;
  id v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;

  if (a2)
  {
    objc_msgSend(a1[4], "queue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __90__RTVehicleLocationProvider_RTMetricManager___submitFMCCarParkedInstanceWithParkedEvents___block_invoke_2;
    block[3] = &unk_1E9299D78;
    v7 = a1[5];
    v4 = a1[6];
    v5 = a1[4];
    v8 = v4;
    v9 = v5;
    dispatch_async(v3, block);

  }
}

void __90__RTVehicleLocationProvider_RTMetricManager___submitFMCCarParkedInstanceWithParkedEvents___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __90__RTVehicleLocationProvider_RTMetricManager___submitFMCCarParkedInstanceWithParkedEvents___block_invoke_3;
  v5[3] = &unk_1E929D040;
  v2 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v6 = v3;
  v7 = v4;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v5);

}

void __90__RTVehicleLocationProvider_RTMetricManager___submitFMCCarParkedInstanceWithParkedEvents___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  unint64_t v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[RTMetricManager metricForType:](RTMetricManager, "metricForType:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "horizontalUncertainty");
  objc_msgSend(v4, "setHorizontalAccuracy:", (int)v6);

  v7 = objc_msgSend(v3, "locationQuality");
  if (v7 >> 31)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = 136315394;
      v11 = "-[RTVehicleLocationProvider(RTMetricManager) _submitFMCCarParkedInstanceWithParkedEvents:]_block_invoke_3";
      v12 = 1024;
      v13 = 1709;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "locationQuality cannot be greater than INT32_MAX (in %s:%d)", (uint8_t *)&v10, 0x12u);
    }

  }
  objc_msgSend(v4, "setQualityIndicator:", v7);
  if (objc_msgSend(v3, "userSetLocation"))
    v9 = 2;
  else
    v9 = 1;
  objc_msgSend(v4, "setTriggerTypes:", v9);
  objc_msgSend(v4, "setUserAssistanceRequired:", 0);
  objc_msgSend(v4, "setLocationType:", objc_msgSend(v3, "usualLocation"));
  objc_msgSend(*(id *)(a1 + 32), "submitMetric:", v4);
  objc_msgSend(*(id *)(a1 + 40), "_recordMetricParkingEvent:", v3);

}

- (void)_submitFMCViewedInstanceWithIdentifier:(id)a3 uiPlacement:(int)a4
{
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  int v10;

  -[RTVehicleLocationProvider metricManager](self, "metricManager", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __97__RTVehicleLocationProvider_RTMetricManager___submitFMCViewedInstanceWithIdentifier_uiPlacement___block_invoke;
  v8[3] = &unk_1E929D0B8;
  v10 = a4;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  objc_msgSend(v7, "fetchDiagnosticsEnabled:", v8);

}

void __97__RTVehicleLocationProvider_RTMetricManager___submitFMCViewedInstanceWithIdentifier_uiPlacement___block_invoke(uint64_t a1, int a2)
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  int v6;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "queue");
    v3 = objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __97__RTVehicleLocationProvider_RTMetricManager___submitFMCViewedInstanceWithIdentifier_uiPlacement___block_invoke_2;
    v4[3] = &unk_1E929D090;
    v6 = *(_DWORD *)(a1 + 48);
    v5 = *(id *)(a1 + 40);
    dispatch_async(v3, v4);

  }
}

void __97__RTVehicleLocationProvider_RTMetricManager___submitFMCViewedInstanceWithIdentifier_uiPlacement___block_invoke_2(uint64_t a1)
{
  id v2;

  +[RTMetricManager metricForType:](RTMetricManager, "metricForType:", 6);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setUiPlacement:", *(unsigned int *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "submitMetric:", v2);

}

- (void)_submitFMCAssistanceInstanceWithIdentifier:(id)a3 uiPlacement:(int)a4 assistanceType:(int)a5 assistanceValue:(int)a6
{
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  int v14;
  int v15;
  int v16;

  -[RTVehicleLocationProvider metricManager](self, "metricManager", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __132__RTVehicleLocationProvider_RTMetricManager___submitFMCAssistanceInstanceWithIdentifier_uiPlacement_assistanceType_assistanceValue___block_invoke;
  v12[3] = &unk_1E929D108;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v12[4] = self;
  v13 = v10;
  v11 = v10;
  objc_msgSend(v11, "fetchDiagnosticsEnabled:", v12);

}

void __132__RTVehicleLocationProvider_RTMetricManager___submitFMCAssistanceInstanceWithIdentifier_uiPlacement_assistanceType_assistanceValue___block_invoke(uint64_t a1, int a2)
{
  NSObject *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  uint64_t v9;
  int v10;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "queue");
    v3 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __132__RTVehicleLocationProvider_RTMetricManager___submitFMCAssistanceInstanceWithIdentifier_uiPlacement_assistanceType_assistanceValue___block_invoke_2;
    v6[3] = &unk_1E929D0E0;
    v9 = *(_QWORD *)(a1 + 48);
    v10 = *(_DWORD *)(a1 + 56);
    v4 = *(id *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 32);
    v7 = v4;
    v8 = v5;
    dispatch_async(v3, v6);

  }
}

void __132__RTVehicleLocationProvider_RTMetricManager___submitFMCAssistanceInstanceWithIdentifier_uiPlacement_assistanceType_assistanceValue___block_invoke_2(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  id v5;

  +[RTMetricManager metricForType:](RTMetricManager, "metricForType:", 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUiPlacement:", *(unsigned int *)(a1 + 48));
  objc_msgSend(v5, "setAssistanceType:", *(unsigned int *)(a1 + 52));
  objc_msgSend(v5, "setAssistanceValue:", *(unsigned int *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "submitMetric:", v5);
  v2 = *(_DWORD *)(a1 + 52);
  v3 = *(void **)(a1 + 40);
  objc_msgSend(v3, "lastVehicleParkedEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 == 5)
    objc_msgSend(v3, "_recordMetricEngagementEvent:", v4);
  else
    objc_msgSend(v3, "_recordMetricAssistanceEvent:", v4);

}

- (void)_submitFMCReturnToCarInstanceWithIdentifier:(id)a3 horizontalAccuracy:(int)a4 horizontalDistance:(int)a5
{
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  int v12;
  int v13;

  -[RTVehicleLocationProvider metricManager](self, "metricManager", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __128__RTVehicleLocationProvider_RTMetricManager___submitFMCReturnToCarInstanceWithIdentifier_horizontalAccuracy_horizontalDistance___block_invoke;
  v10[3] = &unk_1E929D130;
  v12 = a4;
  v13 = a5;
  v10[4] = self;
  v11 = v8;
  v9 = v8;
  objc_msgSend(v9, "fetchDiagnosticsEnabled:", v10);

}

void __128__RTVehicleLocationProvider_RTMetricManager___submitFMCReturnToCarInstanceWithIdentifier_horizontalAccuracy_horizontalDistance___block_invoke(uint64_t a1, int a2)
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  uint64_t v6;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "queue");
    v3 = objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __128__RTVehicleLocationProvider_RTMetricManager___submitFMCReturnToCarInstanceWithIdentifier_horizontalAccuracy_horizontalDistance___block_invoke_2;
    v4[3] = &unk_1E9297BF0;
    v6 = *(_QWORD *)(a1 + 48);
    v5 = *(id *)(a1 + 40);
    dispatch_async(v3, v4);

  }
}

void __128__RTVehicleLocationProvider_RTMetricManager___submitFMCReturnToCarInstanceWithIdentifier_horizontalAccuracy_horizontalDistance___block_invoke_2(uint64_t a1)
{
  id v2;

  +[RTMetricManager metricForType:](RTMetricManager, "metricForType:", 4);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHorizontalAccuracy:", *(unsigned int *)(a1 + 40));
  objc_msgSend(v2, "setHorizontalDistance:", *(unsigned int *)(a1 + 44));
  objc_msgSend(*(id *)(a1 + 32), "submitMetric:", v2);

}

- (void)_submitFMCVehicleConnectionEventInstanceWithConnectionStatus:(int)a3
{
  RTVehicleLocationProvider *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;

  v3 = self;
  if (a3 == 3)
  {
    -[RTVehicleLocationProvider lastVehicleParkedEvent](self, "lastVehicleParkedEvent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTVehicleLocationProvider lastVehicleParkedEvent](v3, "lastVehicleParkedEvent");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[RTVehicleLocationProvider pendingVehicleParkedEvent](v3, "pendingVehicleParkedEvent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
        v12 = -1.0;
        goto LABEL_8;
      }
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTVehicleLocationProvider pendingVehicleParkedEvent](v3, "pendingVehicleParkedEvent");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v9 = v6;
    objc_msgSend(v6, "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSinceDate:", v10);
    v12 = v11;

LABEL_8:
    self = v3;
    *(_QWORD *)&a3 = 3;
    v7 = v12;
    goto LABEL_9;
  }
  v7 = 0.0;
LABEL_9:
  -[RTVehicleLocationProvider _submitFMCVehicleConnectionEventInstanceWithConnectionStatus:value:](self, "_submitFMCVehicleConnectionEventInstanceWithConnectionStatus:value:", *(_QWORD *)&a3, v7);
}

- (void)_submitFMCVehicleConnectionEventInstanceWithConnectionStatus:(int)a3 value:(double)a4
{
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  double v11;
  int v12;

  -[RTVehicleLocationProvider metricManager](self, "metricManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __113__RTVehicleLocationProvider_RTMetricManager___submitFMCVehicleConnectionEventInstanceWithConnectionStatus_value___block_invoke;
  v9[3] = &unk_1E929D108;
  v12 = a3;
  v11 = a4;
  v9[4] = self;
  v10 = v7;
  v8 = v7;
  objc_msgSend(v8, "fetchDiagnosticsEnabled:", v9);

}

void __113__RTVehicleLocationProvider_RTMetricManager___submitFMCVehicleConnectionEventInstanceWithConnectionStatus_value___block_invoke(uint64_t a1, int a2)
{
  NSObject *v3;
  _QWORD block[4];
  id v5;
  uint64_t v6;
  int v7;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "queue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __113__RTVehicleLocationProvider_RTMetricManager___submitFMCVehicleConnectionEventInstanceWithConnectionStatus_value___block_invoke_2;
    block[3] = &unk_1E929D158;
    v7 = *(_DWORD *)(a1 + 56);
    v6 = *(_QWORD *)(a1 + 48);
    v5 = *(id *)(a1 + 40);
    dispatch_async(v3, block);

  }
}

void __113__RTVehicleLocationProvider_RTMetricManager___submitFMCVehicleConnectionEventInstanceWithConnectionStatus_value___block_invoke_2(uint64_t a1)
{
  double v2;
  uint64_t v3;
  id v4;

  +[RTMetricManager metricForType:](RTMetricManager, "metricForType:", 5);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEventType:", *(unsigned int *)(a1 + 48));
  v2 = *(double *)(a1 + 40);
  if (v2 < 0.0)
    v3 = 0xFFFFFFFFLL;
  else
    v3 = (10 * (int)(v2 * 10.0));
  objc_msgSend(v4, "setValue:", v3);
  objc_msgSend(*(id *)(a1 + 32), "submitMetric:", v4);

}

@end
