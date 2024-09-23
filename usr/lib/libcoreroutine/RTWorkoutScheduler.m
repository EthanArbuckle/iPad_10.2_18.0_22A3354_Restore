@implementation RTWorkoutScheduler

+ (id)taskStateToString:(unint64_t)a3
{
  if (a3 - 1 > 2)
    return CFSTR("RTWorkoutSchedulerTaskStateUnknown");
  else
    return off_1E92A6230[a3 - 1];
}

+ (id)taskTypeToString:(unint64_t)a3
{
  if (a3 - 1 > 2)
    return CFSTR("Unknown");
  else
    return off_1E92A6248[a3 - 1];
}

- (RTWorkoutScheduler)initWithBatteryManager:(id)a3 dataProtectionManager:(id)a4 workoutRouteManager:(id)a5 healthKitManager:(id)a6 locationManager:(id)a7 defaultsManager:(id)a8 platform:(id)a9 xpcActivityManager:(id)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  RTTimerManager *v25;
  RTWorkoutScheduler *v26;

  v17 = a10;
  v18 = a9;
  v19 = a8;
  v20 = a7;
  v21 = a6;
  v22 = a5;
  v23 = a4;
  v24 = a3;
  v25 = objc_alloc_init(RTTimerManager);
  v26 = -[RTWorkoutScheduler initWithBatteryManager:dataProtectionManager:workoutRouteManager:healthKitManager:locationManager:defaultsManager:timerManager:platform:xpcActivityManager:](self, "initWithBatteryManager:dataProtectionManager:workoutRouteManager:healthKitManager:locationManager:defaultsManager:timerManager:platform:xpcActivityManager:", v24, v23, v22, v21, v20, v19, v25, v18, v17);

  return v26;
}

- (RTWorkoutScheduler)initWithBatteryManager:(id)a3 dataProtectionManager:(id)a4 workoutRouteManager:(id)a5 healthKitManager:(id)a6 locationManager:(id)a7 defaultsManager:(id)a8 timerManager:(id)a9 platform:(id)a10 xpcActivityManager:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  RTWorkoutScheduler *v26;
  id *p_isa;
  RTWorkoutScheduler *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  const char *v32;
  NSObject *v34;
  id v35;
  id obj;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  objc_super v43;
  uint8_t buf[16];

  v17 = a3;
  obj = a4;
  v18 = a4;
  v37 = a5;
  v19 = a5;
  v38 = a6;
  v20 = a6;
  v39 = a7;
  v21 = a7;
  v40 = a8;
  v22 = a8;
  v23 = a9;
  v24 = a10;
  v25 = a11;
  v41 = v17;
  if (!v17)
  {
    v30 = v25;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v31 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      goto LABEL_30;
    *(_WORD *)buf = 0;
    v32 = "Invalid parameter not satisfying: batteryManager";
LABEL_29:
    _os_log_error_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_ERROR, v32, buf, 2u);
    goto LABEL_30;
  }
  if (!v18)
  {
    v30 = v25;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v31 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      goto LABEL_30;
    *(_WORD *)buf = 0;
    v32 = "Invalid parameter not satisfying: dataProtectionManager";
    goto LABEL_29;
  }
  if (!v19)
  {
    v30 = v25;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v31 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      goto LABEL_30;
    *(_WORD *)buf = 0;
    v32 = "Invalid parameter not satisfying: workoutRouteManager";
    goto LABEL_29;
  }
  if (!v20)
  {
    v30 = v25;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v31 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      goto LABEL_30;
    *(_WORD *)buf = 0;
    v32 = "Invalid parameter not satisfying: healthKitManager";
    goto LABEL_29;
  }
  if (!v21)
  {
    v30 = v25;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v31 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      goto LABEL_30;
    *(_WORD *)buf = 0;
    v32 = "Invalid parameter not satisfying: locationManager";
    goto LABEL_29;
  }
  if (!v22)
  {
    v30 = v25;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v31 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      goto LABEL_30;
    *(_WORD *)buf = 0;
    v32 = "Invalid parameter not satisfying: defaultsManager";
    goto LABEL_29;
  }
  if (!v23)
  {
    v30 = v25;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v31 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      goto LABEL_30;
    *(_WORD *)buf = 0;
    v32 = "Invalid parameter not satisfying: timerManager";
    goto LABEL_29;
  }
  if (!v24)
  {
    v30 = v25;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v32 = "Invalid parameter not satisfying: platform";
      goto LABEL_29;
    }
LABEL_30:

    v28 = 0;
    v29 = v41;
    goto LABEL_31;
  }
  v35 = v25;
  if (v25)
  {
    v43.receiver = self;
    v43.super_class = (Class)RTWorkoutScheduler;
    v26 = -[RTNotifier init](&v43, sel_init);
    p_isa = (id *)&v26->super.super.super.isa;
    if (v26)
    {
      objc_storeStrong((id *)&v26->_batteryManager, a3);
      objc_storeStrong(p_isa + 6, obj);
      objc_storeStrong(p_isa + 7, v37);
      objc_storeStrong(p_isa + 8, v38);
      objc_storeStrong(p_isa + 9, v39);
      objc_storeStrong(p_isa + 11, v40);
      objc_storeStrong(p_isa + 10, a9);
      objc_storeStrong(p_isa + 12, a10);
      objc_storeStrong(p_isa + 5, a11);
      objc_msgSend(p_isa, "setup");
    }
    v28 = p_isa;
    self = v28;
    v29 = v17;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v34 = objc_claimAutoreleasedReturnValue();
    v29 = v17;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v34, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: xpcActivityManager", buf, 2u);
    }

    v28 = 0;
  }
  v30 = v35;
LABEL_31:

  return v28;
}

- (void)_setup
{
  RTWorkoutSchedulerMetrics *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  RTXPCActivityCriteria *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  RTDataProtectionManager *dataProtectionManager;
  void *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = -[RTWorkoutSchedulerMetrics initWithDefaultsManager:]([RTWorkoutSchedulerMetrics alloc], "initWithDefaultsManager:", self->_defaultsManager);
  -[RTWorkoutScheduler setMetrics:](self, "setMetrics:", v4);

  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    if (-[RTWorkoutScheduler _deviceEligible](self, "_deviceEligible"))
    {
      -[RTWorkoutScheduler defaultsManager](self, "defaultsManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("RTDefaultsWorkoutSchedulerMetricsIsDeviceEligibleKey"));

      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "Starting Workout Scheduler", buf, 2u);
      }

      self->_singleWorkoutClusteringTaskState = 0;
      self->_updateRelevanceScoreTaskState = 0;
      self->_currentNWorkouts = 0;
      -[RTWorkoutScheduler readTaskStates](self, "readTaskStates");
      -[RTWorkoutScheduler lastPruneDistanceMatrixDate](self, "lastPruneDistanceMatrixDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTWorkoutScheduler setLastPruneDistanceMatrixDate:](self, "setLastPruneDistanceMatrixDate:", v8);

      }
      -[RTWorkoutScheduler healthKitManager](self, "healthKitManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[RTNotification notificationName](RTHealthKitManagerNewWorkoutForRaceRouteNotification, "notificationName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObserver:selector:name:", self, sel_onHealthKitNotification, v10);

      v11 = -[RTXPCActivityCriteria initWithInterval:gracePeriod:priority:requireNetworkConnectivity:requireInexpensiveNetworkConnectivity:networkTransferDirection:allowBattery:powerNap:]([RTXPCActivityCriteria alloc], "initWithInterval:gracePeriod:priority:requireNetworkConnectivity:requireInexpensiveNetworkConnectivity:networkTransferDirection:allowBattery:powerNap:", 1, 0, 0, 0, 1, 1, 86400.0, 60.0);
      -[RTWorkoutScheduler xpcActivityManager](self, "xpcActivityManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __28__RTWorkoutScheduler__setup__block_invoke;
      v22[3] = &unk_1E92A6150;
      v22[4] = self;
      objc_msgSend(v12, "registerActivityWithIdentifier:criteria:handler:", CFSTR("com.apple.routined.workoutScheduler.daily"), v11, v22);

      -[RTWorkoutScheduler _registerForCircularRegionEvents](self, "_registerForCircularRegionEvents");
      -[RTWorkoutScheduler _getCurrentLocationAndMonitorForRegion](self, "_getCurrentLocationAndMonitorForRegion");
      if (-[RTWorkoutScheduler _isPasscodeDisabled](self, "_isPasscodeDisabled"))
      {
        -[RTWorkoutScheduler _setupDisplayLayoutMonitor](self, "_setupDisplayLayoutMonitor");
      }
      else
      {
        dataProtectionManager = self->_dataProtectionManager;
        +[RTNotification notificationName](RTDataProtectionManagerNotificationEncryptedDataAvailability, "notificationName");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTNotifier addObserver:selector:name:](dataProtectionManager, "addObserver:selector:name:", self, sel_onDataProtectionNotification_, v18);

      }
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v19 = (objc_class *)objc_opt_class();
        NSStringFromClass(v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v24 = v20;
        v25 = 2112;
        v26 = v21;
        _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "%@, %@, feature not supported on this device", buf, 0x16u);

      }
      -[RTWorkoutScheduler defaultsManager](self, "defaultsManager");
      v11 = (RTXPCActivityCriteria *)objc_claimAutoreleasedReturnValue();
      -[RTXPCActivityCriteria setObject:forKey:](v11, "setObject:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("RTDefaultsWorkoutSchedulerMetricsIsDeviceEligibleKey"));
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v11 = (RTXPCActivityCriteria *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v11->super, OS_LOG_TYPE_ERROR))
    {
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v24 = v14;
      v25 = 2112;
      v26 = v15;
      _os_log_error_impl(&dword_1D1A22000, &v11->super, OS_LOG_TYPE_ERROR, "%@, %@, feature not enabled", buf, 0x16u);

    }
  }

}

void __28__RTWorkoutScheduler__setup__block_invoke(uint64_t a1, void *a2)
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
  v6[2] = __28__RTWorkoutScheduler__setup__block_invoke_2;
  v6[3] = &unk_1E9297650;
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, v6);

}

uint64_t __28__RTWorkoutScheduler__setup__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_onDailyXPCActivity");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (BOOL)_deviceEligible
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  BOOL v14;

  -[RTWorkoutScheduler platform](self, "platform");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "internalInstall") & 1) != 0)
  {
    -[RTWorkoutScheduler defaultsManager](self, "defaultsManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("RTDefaultsWorkoutSchedulerBypassPlatformCheckKey"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[RTWorkoutScheduler defaultsManager](self, "defaultsManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("RTDefaultsWorkoutSchedulerBypassPlatformCheckKey");
LABEL_8:
      objc_msgSend(v6, "objectForKey:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "BOOLValue");
      goto LABEL_12;
    }
  }
  else
  {

  }
  -[RTWorkoutScheduler platform](self, "platform");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "internalInstall") & 1) != 0)
  {
    -[RTWorkoutScheduler defaultsManager](self, "defaultsManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", CFSTR("RTDefaultsWorkoutSchedulerBypassDeviceEligibility"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[RTWorkoutScheduler defaultsManager](self, "defaultsManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("RTDefaultsWorkoutSchedulerBypassDeviceEligibility");
      goto LABEL_8;
    }
  }
  else
  {

  }
  -[RTWorkoutScheduler platform](self, "platform");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "iPhoneDevice"))
  {
    v14 = 0;
    goto LABEL_14;
  }
  -[RTWorkoutScheduler platform](self, "platform");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isWatchPaired");
LABEL_12:
  v14 = v13;

LABEL_14:
  return v14;
}

- (BOOL)_isPasscodeDisabled
{
  dispatch_semaphore_t v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  dispatch_time_t v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  char v22;
  id v23;
  BOOL v24;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, char, id);
  void *v29;
  NSObject *v30;
  uint64_t *v31;
  uint64_t *v32;
  uint64_t v33;
  id *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  uint8_t buf[8];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v39 = 0;
  v40 = &v39;
  v41 = 0x2020000000;
  v42 = 0;
  v33 = 0;
  v34 = (id *)&v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__172;
  v37 = __Block_byref_object_dispose__172;
  v38 = 0;
  v3 = dispatch_semaphore_create(0);
  -[RTWorkoutScheduler dataProtectionManager](self, "dataProtectionManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = MEMORY[0x1E0C809B0];
  v27 = 3221225472;
  v28 = __41__RTWorkoutScheduler__isPasscodeDisabled__block_invoke;
  v29 = &unk_1E9298CF8;
  v31 = &v39;
  v32 = &v33;
  v5 = v3;
  v30 = v5;
  objc_msgSend(v4, "fetchLockStateDisabledWithHandler:", &v26);

  v6 = v5;
  objc_msgSend(MEMORY[0x1E0C99D68], "now", v26, v27, v28, v29);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v6, v8))
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervalSinceDate:", v7);
  v11 = v10;
  v12 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_125);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "filteredArrayUsingPredicate:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "submitToCoreAnalytics:type:duration:", v16, 1, v11);
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  v18 = (void *)MEMORY[0x1E0CB35C8];
  v43 = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)buf = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v43, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    v21 = objc_retainAutorelease(v20);

    v22 = 0;
  }
  else
  {
LABEL_6:
    v21 = 0;
    v22 = 1;
  }

  v23 = v21;
  if ((v22 & 1) == 0)
    objc_storeStrong(v34 + 5, v21);
  v24 = *((_BYTE *)v40 + 24) != 0;

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v39, 8);
  return v24;
}

void __41__RTWorkoutScheduler__isPasscodeDisabled__block_invoke(uint64_t a1, char a2, id obj)
{
  id v5;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), obj);
  v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (BOOL)_isVersionChangeDetected
{
  void *v2;
  void *v3;
  BOOL v4;

  -[RTWorkoutScheduler defaultsManager](self, "defaultsManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("RTDefaultsWorkoutSchedulerVersionRaceRouteKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = (unint64_t)objc_msgSend(v3, "unsignedIntegerValue") < 9;
  else
    v4 = 1;

  return v4;
}

- (void)_evaluateVersionChange
{
  if (-[RTWorkoutScheduler _isVersionChangeDetected](self, "_isVersionChangeDetected"))
    -[RTWorkoutScheduler _handleVersionChange](self, "_handleVersionChange");
}

- (void)_handleVersionChange
{
  dispatch_semaphore_t v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  dispatch_time_t v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  NSObject *v24;
  objc_class *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  objc_class *v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  uint64_t v35;
  _QWORD v36[4];
  NSObject *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  _BYTE buf[12];
  __int16 v46;
  id v47;
  __int16 v48;
  void *v49;
  _QWORD v50[3];

  v50[1] = *MEMORY[0x1E0C80C00];
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__172;
  v43 = __Block_byref_object_dispose__172;
  v44 = 0;
  v4 = dispatch_semaphore_create(0);
  -[RTWorkoutScheduler workoutRouteManager](self, "workoutRouteManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __42__RTWorkoutScheduler__handleVersionChange__block_invoke;
  v36[3] = &unk_1E9297038;
  v38 = &v39;
  v6 = v4;
  v37 = v6;
  LOBYTE(v35) = 1;
  objc_msgSend(v5, "processWorkoutsClearClusters:clearExistingDistanceMatrix:buildDistanceMatrix:syncClustersToHealhtKit:syncClustersToWatch:filteringDistanceThreshold:topNWorkouts:isSchedulerTriggered:handler:", 1, 1, 0, 1, 0, 0x7FFFFFFFLL, 1.79769313e308, v35, v36);

  v7 = v6;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v7, v9))
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSinceDate:", v8);
  v12 = v11;
  v13 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_125);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "filteredArrayUsingPredicate:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "firstObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "submitToCoreAnalytics:type:duration:", v17, 1, v12);
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  v19 = (void *)MEMORY[0x1E0CB35C8];
  v50[0] = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)buf = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v50, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    v22 = objc_retainAutorelease(v21);

  }
  else
  {
LABEL_6:
    v22 = 0;
  }

  v23 = v22;
  if (v40[5])
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = (objc_class *)objc_opt_class();
      NSStringFromClass(v25);
      v26 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)v40[5];
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v26;
      v46 = 2112;
      v47 = v27;
      v48 = 2112;
      v49 = v28;
      _os_log_error_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_ERROR, "%@, %@, Failed to clear out Workout related Routine and HealthKit Data, error, %@", buf, 0x20u);

    }
  }
  else
  {
    -[RTWorkoutScheduler _clearOutSchedulerState](self, "_clearOutSchedulerState");
    -[RTWorkoutScheduler defaultsManager](self, "defaultsManager");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setObject:forKey:", &unk_1E9329870, CFSTR("RTDefaultsWorkoutSchedulerVersionRaceRouteKey"));

    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      v30 = (objc_class *)objc_opt_class();
      NSStringFromClass(v30);
      v31 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v32 = (id)objc_claimAutoreleasedReturnValue();
      -[RTWorkoutScheduler defaultsManager](self, "defaultsManager");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "objectForKey:", CFSTR("RTDefaultsWorkoutSchedulerVersionRaceRouteKey"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v31;
      v46 = 2112;
      v47 = v32;
      v48 = 2112;
      v49 = v34;
      _os_log_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_INFO, "%@, %@, Successfully cleared out Routine Workout Data, Scheduler State and HealthKit Cluster data; updated versi"
        "on-key to disk to %@",
        buf,
        0x20u);

    }
  }

  _Block_object_dispose(&v39, 8);
}

void __42__RTWorkoutScheduler__handleVersionChange__block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)_clearOutSchedulerState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[RTWorkoutScheduler setCurrentNWorkouts:](self, "setCurrentNWorkouts:", 0);
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutScheduler setLastWorkoutComparisonDate:](self, "setLastWorkoutComparisonDate:", v3);

  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutScheduler setLastClusterAndSyncDate:](self, "setLastClusterAndSyncDate:", v4);

  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutScheduler setLastRelevanceScoreUpdateDate:](self, "setLastRelevanceScoreUpdateDate:", v5);

  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutScheduler setLastSingleWorkoutClusteringDate:](self, "setLastSingleWorkoutClusteringDate:", v6);

  -[RTWorkoutScheduler setUpdateRelevanceScoreTaskState:](self, "setUpdateRelevanceScoreTaskState:", 0);
  -[RTWorkoutScheduler setSingleWorkoutClusteringTaskState:](self, "setSingleWorkoutClusteringTaskState:", 0);
}

- (void)_startClusteringDeferralTimerWithLatency:(double)a3
{
  RTTimer *clusteringDeferralTimer;
  RTTimer *v7;
  RTTimerManager *timerManager;
  void *v9;
  RTTimer *v10;
  RTTimer *v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  double v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  clusteringDeferralTimer = self->_clusteringDeferralTimer;
  if (clusteringDeferralTimer)
  {
    -[RTTimer invalidate](clusteringDeferralTimer, "invalidate");
    v7 = self->_clusteringDeferralTimer;
    self->_clusteringDeferralTimer = 0;

  }
  timerManager = self->_timerManager;
  -[RTNotifier queue](self, "queue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __63__RTWorkoutScheduler__startClusteringDeferralTimerWithLatency___block_invoke;
  v16[3] = &unk_1E92977B8;
  v16[4] = self;
  -[RTTimerManager timerWithIdentifier:queue:handler:](timerManager, "timerWithIdentifier:queue:handler:", CFSTR("RTWorkoutSchedulerClusteringTimer"), v9, v16);
  v10 = (RTTimer *)objc_claimAutoreleasedReturnValue();
  v11 = self->_clusteringDeferralTimer;
  self->_clusteringDeferralTimer = v10;

  -[RTTimer fireWithInterval:](self->_clusteringDeferralTimer, "fireWithInterval:", a3);
  -[RTTimer resume](self->_clusteringDeferralTimer, "resume");
  _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v18 = v14;
    v19 = 2112;
    v20 = v15;
    v21 = 2048;
    v22 = a3;
    _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_INFO, "%@, %@, interval, %.2f", buf, 0x20u);

  }
}

uint64_t __63__RTWorkoutScheduler__startClusteringDeferralTimerWithLatency___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onClusteringTimerExpiry");
}

- (void)_onClusteringTimerExpiry
{
  RTTimer *clusteringDeferralTimer;

  -[RTTimer invalidate](self->_clusteringDeferralTimer, "invalidate");
  clusteringDeferralTimer = self->_clusteringDeferralTimer;
  self->_clusteringDeferralTimer = 0;

}

- (void)_shutdownWithHandler:(id)a3
{
  void (**v4)(id, _QWORD);
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint8_t buf[16];

  v4 = (void (**)(id, _QWORD))a3;
  _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "Shutdown Workout Scheduler", buf, 2u);
  }

  -[RTWorkoutScheduler dataProtectionManager](self, "dataProtectionManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:", self);

  -[RTWorkoutScheduler displayLayoutMonitor](self, "displayLayoutMonitor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "invalidate");

  -[RTWorkoutScheduler locationManager](self, "locationManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v8, "stopMonitoringAllRegionsForClientIdentifier:error:", CFSTR("RTWorkoutSchedulerRegionChange"), &v10);

  -[RTWorkoutScheduler healthKitManager](self, "healthKitManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObserver:", self);

  -[RTWorkoutScheduler saveTaskStates](self, "saveTaskStates");
  v4[2](v4, 0);

}

- (void)clearTaskStatesWithHandler:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  SEL v10;

  v5 = a3;
  -[RTNotifier queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__RTWorkoutScheduler_clearTaskStatesWithHandler___block_invoke;
  block[3] = &unk_1E9298E88;
  v9 = v5;
  v10 = a2;
  block[4] = self;
  v7 = v5;
  dispatch_async(v6, block);

}

void __49__RTWorkoutScheduler_clearTaskStatesWithHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412546;
    v15 = v4;
    v16 = 2112;
    v17 = v5;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, %@", (uint8_t *)&v14, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "platform");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "internalInstall");

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "setSingleWorkoutClusteringTaskState:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setUpdateRelevanceScoreTaskState:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setCurrentNWorkouts:", 0);
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setLastWorkoutComparisonDate:", v8);

    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setLastClusterAndSyncDate:", v9);

    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setLastSingleWorkoutClusteringDate:", v10);

    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setLastRelevanceScoreUpdateDate:", v11);

    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setLastPruneDistanceMatrixDate:", v12);

    objc_msgSend(*(id *)(a1 + 32), "saveTaskStates");
    v13 = *(_QWORD *)(a1 + 40);
    if (v13)
      (*(void (**)(uint64_t, _QWORD))(v13 + 16))(v13, 0);
  }
}

- (void)saveTaskStates
{
  RTDefaultsManager *defaultsManager;
  void *v4;
  RTDefaultsManager *v5;
  void *v6;
  RTDefaultsManager *v7;
  void *v8;

  defaultsManager = self->_defaultsManager;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_singleWorkoutClusteringTaskState);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTDefaultsManager setObject:forKey:](defaultsManager, "setObject:forKey:", v4, CFSTR("RTDefaultsWorkoutSchedulerSingleWorkoutClusteringKey"));

  v5 = self->_defaultsManager;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_updateRelevanceScoreTaskState);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTDefaultsManager setObject:forKey:](v5, "setObject:forKey:", v6, CFSTR("RTDefaultsWorkoutSchedulerUpdateRelevanceScoreKey"));

  v7 = self->_defaultsManager;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_currentNWorkouts);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTDefaultsManager setObject:forKey:](v7, "setObject:forKey:", v8, CFSTR("RTDefaultsWorkoutSchedulerTopNWorkoutsKey"));

  -[RTDefaultsManager setObject:forKey:](self->_defaultsManager, "setObject:forKey:", self->_lastWorkoutComparisonDate, CFSTR("RTDefaultsWorkoutSchedulerIncrementalWorkoutComparisonDateKey"));
  -[RTDefaultsManager setObject:forKey:](self->_defaultsManager, "setObject:forKey:", self->_lastClusterAndSyncDate, CFSTR("RTDefaultsWorkoutSchedulerClusterAndSyncDateKey"));
  -[RTDefaultsManager setObject:forKey:](self->_defaultsManager, "setObject:forKey:", self->_lastSingleWorkoutClusteringDate, CFSTR("RTDefaultsWorkoutSchedulerSingleWorkoutClusteringDateKey"));
  -[RTDefaultsManager setObject:forKey:](self->_defaultsManager, "setObject:forKey:", self->_lastRelevanceScoreUpdateDate, CFSTR("RTDefaultsWorkoutSchedulerUpdateRelevanceScoreDateKey"));
  -[RTDefaultsManager setObject:forKey:](self->_defaultsManager, "setObject:forKey:", self->_lastPruneDistanceMatrixDate, CFSTR("RTDefaultsWorkoutSchedulerPruneDistanceMatrixDateKey"));
}

- (void)readTaskStates
{
  void *v3;
  void *v4;
  void *v5;
  NSDate *v6;
  NSDate *lastWorkoutComparisonDate;
  NSDate *v8;
  NSDate *lastClusterAndSyncDate;
  NSDate *v10;
  NSDate *lastSingleWorkoutClusteringDate;
  NSDate *v12;
  NSDate *lastRelevanceScoreUpdateDate;
  NSDate *v14;
  NSDate *lastPruneDistanceMatrixDate;

  -[RTDefaultsManager objectForKey:](self->_defaultsManager, "objectForKey:", CFSTR("RTDefaultsWorkoutSchedulerSingleWorkoutClusteringKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  self->_singleWorkoutClusteringTaskState = objc_msgSend(v3, "unsignedIntegerValue");

  -[RTDefaultsManager objectForKey:](self->_defaultsManager, "objectForKey:", CFSTR("RTDefaultsWorkoutSchedulerUpdateRelevanceScoreKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  self->_updateRelevanceScoreTaskState = objc_msgSend(v4, "unsignedIntegerValue");

  -[RTDefaultsManager objectForKey:](self->_defaultsManager, "objectForKey:", CFSTR("RTDefaultsWorkoutSchedulerTopNWorkoutsKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->_currentNWorkouts = objc_msgSend(v5, "unsignedIntegerValue");

  -[RTDefaultsManager objectForKey:](self->_defaultsManager, "objectForKey:", CFSTR("RTDefaultsWorkoutSchedulerIncrementalWorkoutComparisonDateKey"));
  v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
  lastWorkoutComparisonDate = self->_lastWorkoutComparisonDate;
  self->_lastWorkoutComparisonDate = v6;

  -[RTDefaultsManager objectForKey:](self->_defaultsManager, "objectForKey:", CFSTR("RTDefaultsWorkoutSchedulerClusterAndSyncDateKey"));
  v8 = (NSDate *)objc_claimAutoreleasedReturnValue();
  lastClusterAndSyncDate = self->_lastClusterAndSyncDate;
  self->_lastClusterAndSyncDate = v8;

  -[RTDefaultsManager objectForKey:](self->_defaultsManager, "objectForKey:", CFSTR("RTDefaultsWorkoutSchedulerSingleWorkoutClusteringDateKey"));
  v10 = (NSDate *)objc_claimAutoreleasedReturnValue();
  lastSingleWorkoutClusteringDate = self->_lastSingleWorkoutClusteringDate;
  self->_lastSingleWorkoutClusteringDate = v10;

  -[RTDefaultsManager objectForKey:](self->_defaultsManager, "objectForKey:", CFSTR("RTDefaultsWorkoutSchedulerUpdateRelevanceScoreDateKey"));
  v12 = (NSDate *)objc_claimAutoreleasedReturnValue();
  lastRelevanceScoreUpdateDate = self->_lastRelevanceScoreUpdateDate;
  self->_lastRelevanceScoreUpdateDate = v12;

  -[RTDefaultsManager objectForKey:](self->_defaultsManager, "objectForKey:", CFSTR("RTDefaultsWorkoutSchedulerPruneDistanceMatrixDateKey"));
  v14 = (NSDate *)objc_claimAutoreleasedReturnValue();
  lastPruneDistanceMatrixDate = self->_lastPruneDistanceMatrixDate;
  self->_lastPruneDistanceMatrixDate = v14;

}

- (void)logTaskStates
{
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t currentNWorkouts;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  unint64_t v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDate stringFromDate](self->_lastClusterAndSyncDate, "stringFromDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDate stringFromDate](self->_lastWorkoutComparisonDate, "stringFromDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    currentNWorkouts = self->_currentNWorkouts;
    +[RTWorkoutScheduler taskStateToString:](RTWorkoutScheduler, "taskStateToString:", self->_singleWorkoutClusteringTaskState);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDate stringFromDate](self->_lastSingleWorkoutClusteringDate, "stringFromDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTWorkoutScheduler taskStateToString:](RTWorkoutScheduler, "taskStateToString:", self->_updateRelevanceScoreTaskState);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDate stringFromDate](self->_lastRelevanceScoreUpdateDate, "stringFromDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138414338;
    v16 = v14;
    v17 = 2112;
    v18 = v6;
    v19 = 2112;
    v20 = v7;
    v21 = 2112;
    v22 = v8;
    v23 = 2048;
    v24 = currentNWorkouts;
    v25 = 2112;
    v26 = v10;
    v27 = 2112;
    v28 = v11;
    v29 = 2112;
    v30 = v12;
    v31 = 2112;
    v32 = v13;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "%@, %@, lastClusterAndSyncDate, %@, lastWorkoutComparisonDate, %@, processed workouts, %lu, singleWorkoutClustering, %@, date, %@, relevanceScoreUpdate, %@, date, %@", buf, 0x5Cu);

  }
}

- (BOOL)_isSchedulingWorkDone
{
  uint64_t v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;

  -[RTWorkoutScheduler lastWorkoutComparisonDate](self, "lastWorkoutComparisonDate");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[RTWorkoutScheduler lastClusterAndSyncDate](self, "lastClusterAndSyncDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      goto LABEL_8;
    if (-[RTWorkoutScheduler _isEligibleForPruneDistanceMatrix](self, "_isEligibleForPruneDistanceMatrix"))
      goto LABEL_8;
    if (!-[RTWorkoutScheduler totalWorkouts](self, "totalWorkouts"))
      goto LABEL_7;
    v6 = -[RTWorkoutScheduler currentNWorkouts](self, "currentNWorkouts");
    if (v6 != -[RTWorkoutScheduler totalWorkouts](self, "totalWorkouts"))
      goto LABEL_8;
    -[RTWorkoutScheduler lastClusterAndSyncDate](self, "lastClusterAndSyncDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTWorkoutScheduler lastWorkoutComparisonDate](self, "lastWorkoutComparisonDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSinceDate:", v8);
    v10 = v9;

    if (v10 <= 0.0)
    {
LABEL_8:
      LOBYTE(v3) = 0;
    }
    else
    {
LABEL_7:
      -[RTWorkoutScheduler defaultsManager](self, "defaultsManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKey:", v12, CFSTR("RTDefaultsWorkoutSchedulerWorldBuildFinishTimeKey"));

      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

- (BOOL)_isEligibleForInitialClusterAndSync
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = -[RTWorkoutScheduler currentNWorkouts](self, "currentNWorkouts");
  if (!v3)
  {
    -[RTWorkoutScheduler defaultsManager](self, "defaultsManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("RTDefaultsWorkoutSchedulerWorldBuildStartTimeKey"));

    -[RTWorkoutScheduler defaultsManager](self, "defaultsManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("RTDefaultsWorkoutSchedulerWorldBuildFinishTimeKey"));

  }
  return v3 == 0;
}

- (BOOL)_isEligibleForWorkoutComparison
{
  unint64_t v3;

  v3 = -[RTWorkoutScheduler currentNWorkouts](self, "currentNWorkouts");
  return v3 < -[RTWorkoutScheduler totalWorkouts](self, "totalWorkouts");
}

- (BOOL)_didClusterAndSyncOccurInLastInterval
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  BOOL v12;

  -[RTWorkoutScheduler platform](self, "platform");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "internalInstall"))
  {
    -[RTWorkoutScheduler defaultsManager](self, "defaultsManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("RTWorkoutSchedulerClusterAndSyncIntervalOverrideKey"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v8 = 86400.0;
      goto LABEL_7;
    }
    -[RTWorkoutScheduler defaultsManager](self, "defaultsManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", CFSTR("RTWorkoutSchedulerClusterAndSyncIntervalOverrideKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "doubleValue");
    v8 = v7;

  }
  else
  {
    v8 = 86400.0;
  }

LABEL_7:
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutScheduler lastClusterAndSyncDate](self, "lastClusterAndSyncDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervalSinceDate:", v10);
  v12 = v11 < v8;

  return v12;
}

- (BOOL)_isEligibleForClusterAndSync
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  double v7;

  -[RTWorkoutScheduler lastClusterAndSyncDate](self, "lastClusterAndSyncDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if (-[RTWorkoutScheduler _didClusterAndSyncOccurInLastInterval](self, "_didClusterAndSyncOccurInLastInterval"))
    {
      v4 = 0;
    }
    else
    {
      -[RTWorkoutScheduler lastWorkoutComparisonDate](self, "lastWorkoutComparisonDate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTWorkoutScheduler lastClusterAndSyncDate](self, "lastClusterAndSyncDate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "timeIntervalSinceDate:", v6);
      v4 = v7 > 0.0;

    }
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (BOOL)_isEligibibleForRelevanceScoreUpdateRetry
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  double v10;
  double v11;

  -[RTWorkoutScheduler lastRelevanceScoreUpdateDate](self, "lastRelevanceScoreUpdateDate");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[RTWorkoutScheduler lastRelevanceScoreUpdateDate](self, "lastRelevanceScoreUpdateDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToDate:", v6);

    if ((v7 & 1) != 0)
      goto LABEL_5;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTWorkoutScheduler lastRelevanceScoreUpdateDate](self, "lastRelevanceScoreUpdateDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSinceDate:", v9);
    v11 = v10;

    if (v11 <= 86400.0)
LABEL_5:
      LOBYTE(v3) = 0;
    else
      LOBYTE(v3) = 1;
  }
  return v3;
}

- (BOOL)_isEligibleForPruneDistanceMatrix
{
  void *v3;
  void *v4;
  double v5;
  BOOL v6;

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutScheduler lastPruneDistanceMatrixDate](self, "lastPruneDistanceMatrixDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", v4);
  v6 = v5 > 604800.0;

  return v6;
}

- (void)onDataProtectionNotification:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[RTNotifier queue](self, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __51__RTWorkoutScheduler_onDataProtectionNotification___block_invoke;
    v10[3] = &unk_1E9297540;
    v10[4] = self;
    v11 = v4;
    dispatch_async(v5, v10);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v13 = v8;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "unknown notification name, %@", buf, 0xCu);

    }
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v13 = v9;
      v14 = 2080;
      v15 = "-[RTWorkoutScheduler onDataProtectionNotification:]";
      v16 = 1024;
      v17 = 588;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "unknown notification name, %@ (in %s:%d)", buf, 0x1Cu);

    }
  }

}

uint64_t __51__RTWorkoutScheduler_onDataProtectionNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onDataProtectionNotification:", *(_QWORD *)(a1 + 40));
}

- (void)_onDataProtectionNotification:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412802;
      v11 = v9;
      v12 = 2080;
      v13 = "-[RTWorkoutScheduler _onDataProtectionNotification:]";
      v14 = 1024;
      v15 = 595;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "unknown notification class, %@ (in %s:%d)", (uint8_t *)&v10, 0x1Cu);

    }
  }
  -[RTWorkoutScheduler setEncryptedDataAvailability:](self, "setEncryptedDataAvailability:", objc_msgSend(v4, "availability"));
  _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    +[RTDataProtectionManager encryptedDataAvailabilityToString:](RTDataProtectionManager, "encryptedDataAvailabilityToString:", -[RTWorkoutScheduler encryptedDataAvailability](self, "encryptedDataAvailability"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412290;
    v11 = v7;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "Received keybag notification, %@", (uint8_t *)&v10, 0xCu);

  }
  if (-[RTWorkoutScheduler encryptedDataAvailability](self, "encryptedDataAvailability") == 3)
  {
    -[RTWorkoutScheduler _evaluateVersionChange](self, "_evaluateVersionChange");
    -[RTWorkoutScheduler _evaluateSchedulingTaskPriority](self, "_evaluateSchedulingTaskPriority");
  }

}

- (void)_evaluateSchedulingTaskPriority
{
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  unint64_t v25;
  NSObject *v26;
  objc_class *v27;
  void *v28;
  void *v29;
  unint64_t v30;
  NSObject *v31;
  objc_class *v32;
  void *v33;
  void *v34;
  unint64_t v35;
  unint64_t v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  objc_class *v41;
  void *v42;
  void *v43;
  const char *v44;
  objc_class *v45;
  id v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  id v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  -[RTWorkoutScheduler logTaskStates](self, "logTaskStates");
  if (self->_clusteringDeferralTimer)
  {
    -[RTWorkoutScheduler defaultsManager](self, "defaultsManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("RTDefaultsWorkoutSchedulerBypassBackoffTimerKey"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "BOOLValue");

    if ((v6 & 1) == 0)
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        v27 = (objc_class *)objc_opt_class();
        NSStringFromClass(v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v48 = v28;
        v49 = 2112;
        v50 = v29;
        v51 = 2048;
        v52 = 0x40AC200000000000;
        _os_log_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_INFO, "%@, %@, defering attempt to perform tasks; pending backoff timer:  main entry point happens only once per %.2f sec",
          buf,
          0x20u);

      }
      -[RTWorkoutScheduler metrics](self, "metrics");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      v14 = CFSTR("RTDefaultsWorkoutSchedulerMetricsBackoffTimerDeferralDailyCount");
      goto LABEL_16;
    }
  }
  -[RTWorkoutScheduler _startClusteringDeferralTimerWithLatency:](self, "_startClusteringDeferralTimerWithLatency:", 3600.0);
  if (-[RTWorkoutScheduler checkRoutinedFootprint](self, "checkRoutinedFootprint"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[RTRuntime footprint](RTRuntime, "footprint");
      *(_DWORD *)buf = 138413058;
      v48 = v9;
      v49 = 2112;
      v50 = v10;
      v51 = 2048;
      v52 = v11;
      v53 = 2048;
      v54 = 18;
      _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%@, %@, defering attempt to cluster; exceeding memory threshold, current footprint, %.4f MB, footprint threshold, %lu MB",
        buf,
        0x2Au);

    }
    -[RTWorkoutScheduler metrics](self, "metrics");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v14 = CFSTR("RTDefaultsWorkoutSchedulerMetricsMemoryFootprintDeferralDailyCount");
LABEL_16:
    objc_msgSend(v12, "incrementMetricDefaultForKey:", v14);
    goto LABEL_17;
  }
  -[RTWorkoutScheduler healthKitManager](self, "healthKitManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "createNewWorkoutClusterStore");

  -[RTWorkoutScheduler healthKitManager](self, "healthKitManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutScheduler healthKitManager](self, "healthKitManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_getWorkoutDefaultStartDateForRaceRoute");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0;
  v19 = objc_msgSend(v16, "getWorkoutsCountWithStartDate:nearLocation:distanceThreshold:onlySourcedFromFitnessApp:includePastureModeRoutes:error:", v18, 0, 1, 0, &v46, 1.79769313e308);
  v13 = v46;
  -[RTWorkoutScheduler setTotalWorkouts:](self, "setTotalWorkouts:", v19);

  _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[RTWorkoutScheduler currentNWorkouts](self, "currentNWorkouts");
    v25 = -[RTWorkoutScheduler totalWorkouts](self, "totalWorkouts");
    *(_DWORD *)buf = 138413314;
    v48 = v22;
    v49 = 2112;
    v50 = v23;
    v51 = 2048;
    v52 = v24;
    v53 = 2048;
    v54 = v25;
    v55 = 2112;
    v56 = v13;
    _os_log_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_INFO, "%@, %@, remaining work, current, %lu, total, %lu, error, %@", buf, 0x34u);

  }
  if (!v13)
  {
    if (-[RTWorkoutScheduler _isEligibibleForRelevanceScoreUpdateRetry](self, "_isEligibibleForRelevanceScoreUpdateRetry"))
    {
      -[RTWorkoutScheduler setUpdateRelevanceScoreTaskState:](self, "setUpdateRelevanceScoreTaskState:", 2);
LABEL_12:
      -[RTWorkoutScheduler _scheduleUpdateRelevanceScore](self, "_scheduleUpdateRelevanceScore");
LABEL_24:
      v13 = 0;
      goto LABEL_17;
    }
    v30 = -[RTWorkoutScheduler currentNWorkouts](self, "currentNWorkouts");
    if (v30 > -[RTWorkoutScheduler totalWorkouts](self, "totalWorkouts"))
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        v32 = (objc_class *)objc_opt_class();
        NSStringFromClass(v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = -[RTWorkoutScheduler currentNWorkouts](self, "currentNWorkouts");
        v36 = -[RTWorkoutScheduler totalWorkouts](self, "totalWorkouts");
        *(_DWORD *)buf = 138413314;
        v48 = v33;
        v49 = 2112;
        v50 = v34;
        v51 = 2048;
        v52 = v35;
        v53 = 2048;
        v54 = v36;
        v55 = 2112;
        v56 = 0;
        _os_log_error_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_ERROR, "%@, %@, Failed Scheduler State; currentNWorkouts(topN) shouldn't be more than totalWorkouts, current %lu, tota"
          "l, %lu, error, %@",
          buf,
          0x34u);

      }
      goto LABEL_23;
    }
    if (-[RTWorkoutScheduler _isSchedulingWorkDone](self, "_isSchedulingWorkDone"))
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v31 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        goto LABEL_23;
      v45 = (objc_class *)objc_opt_class();
      NSStringFromClass(v45);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v48 = v42;
      v49 = 2112;
      v50 = v43;
      v44 = "%@, %@, scheduling work is done";
    }
    else
    {
      if (-[RTWorkoutScheduler _isEligibleForInitialClusterAndSync](self, "_isEligibleForInitialClusterAndSync"))
      {
        -[RTWorkoutScheduler _scheduleClusteringTask:](self, "_scheduleClusteringTask:", 1);
        goto LABEL_12;
      }
      if (-[RTWorkoutScheduler _isEligibleForClusterAndSync](self, "_isEligibleForClusterAndSync"))
      {
        -[RTWorkoutScheduler _scheduleClusteringTask:](self, "_scheduleClusteringTask:", 3);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTWorkoutScheduler lastRelevanceScoreUpdateDate](self, "lastRelevanceScoreUpdateDate");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "timeIntervalSinceDate:", v38);
        v40 = v39;

        if (v40 <= 86400.0
          || -[RTWorkoutScheduler updateRelevanceScoreTaskState](self, "updateRelevanceScoreTaskState") == 1)
        {
          goto LABEL_24;
        }
        goto LABEL_12;
      }
      if (-[RTWorkoutScheduler _isEligibleForWorkoutComparison](self, "_isEligibleForWorkoutComparison"))
      {
        -[RTWorkoutScheduler _scheduleClusteringTask:](self, "_scheduleClusteringTask:", 2);
        goto LABEL_24;
      }
      if (-[RTWorkoutScheduler _isEligibleForPruneDistanceMatrix](self, "_isEligibleForPruneDistanceMatrix"))
      {
        -[RTWorkoutScheduler _schedulePruneDistanceMatrix](self, "_schedulePruneDistanceMatrix");
        goto LABEL_24;
      }
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v31 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
LABEL_23:

        goto LABEL_24;
      }
      v41 = (objc_class *)objc_opt_class();
      NSStringFromClass(v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v48 = v42;
      v49 = 2112;
      v50 = v43;
      v44 = "%@, %@, no eligble tasks at this time";
    }
    _os_log_debug_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_DEBUG, v44, buf, 0x16u);

    goto LABEL_23;
  }
LABEL_17:

}

- (BOOL)checkRoutinedFootprint
{
  double v2;

  +[RTRuntime footprint](RTRuntime, "footprint");
  return v2 > 18.0;
}

- (void)onHealthKitNotification
{
  NSObject *v3;
  _QWORD block[5];

  -[RTNotifier queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__RTWorkoutScheduler_onHealthKitNotification__block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __45__RTWorkoutScheduler_onHealthKitNotification__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onHealthKitNotification");
}

- (void)_onHealthKitNotification
{
  NSObject *v3;
  uint8_t v4[16];

  _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "Received new workout from HK", v4, 2u);
  }

  if (-[RTWorkoutScheduler encryptedDataAvailability](self, "encryptedDataAvailability") == 2)
  {
    -[RTWorkoutScheduler _scheduleSingleWorkoutClustering](self, "_scheduleSingleWorkoutClustering");
  }
  else
  {
    -[RTWorkoutScheduler setSingleWorkoutClusteringTaskState:](self, "setSingleWorkoutClusteringTaskState:", 2);
    if (self->_clusteringDeferralTimer)
      -[RTWorkoutScheduler _startClusteringDeferralTimerWithLatency:](self, "_startClusteringDeferralTimerWithLatency:", 600.0);
  }
}

- (void)_scheduleSingleWorkoutClustering
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[6];
  id v14;

  -[RTWorkoutScheduler setSingleWorkoutClusteringTaskState:](self, "setSingleWorkoutClusteringTaskState:", 3);
  -[RTWorkoutScheduler metrics](self, "metrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startCollectMetricsTaskType:totalNAtStart:", 6, -[RTWorkoutScheduler totalWorkouts](self, "totalWorkouts"));

  -[RTWorkoutScheduler healthKitManager](self, "healthKitManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -86400.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutScheduler healthKitManager](self, "healthKitManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_getRTWorkoutDefaultTypesForRaceRoute");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v5, "getLatestWorkoutWithStartDate:nearLocation:distanceThreshold:onlySourcedFromFitnessApp:includePastureModeRoutes:workoutTypes:error:", v6, 0, 1, 0, v8, &v14, 1.79769313e308);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v14;

  if (v9)
  {
    -[RTWorkoutScheduler workoutRouteManager](self, "workoutRouteManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __54__RTWorkoutScheduler__scheduleSingleWorkoutClustering__block_invoke;
    v13[3] = &unk_1E9297628;
    v13[4] = self;
    v13[5] = a2;
    objc_msgSend(v11, "processNewlyAddedWorkout:handler:", v12, v13);

  }
}

void __54__RTWorkoutScheduler__scheduleSingleWorkoutClustering__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD block[5];
  id v9;
  uint64_t v10;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__RTWorkoutScheduler__scheduleSingleWorkoutClustering__block_invoke_2;
  block[3] = &unk_1E9297BC8;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v9 = v3;
  v10 = v6;
  block[4] = v5;
  v7 = v3;
  dispatch_async(v4, block);

}

void __54__RTWorkoutScheduler__scheduleSingleWorkoutClustering__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  objc_class *v3;
  void *v4;
  void *v5;
  uint64_t v6;
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
  _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v9 = 138412802;
    v10 = v4;
    v11 = 2112;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, %@, finished, error, %@", (uint8_t *)&v9, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 32), "metrics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stopCollectMetricsTaskType:", 6);

  if (!*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setLastSingleWorkoutClusteringDate:", v8);

    objc_msgSend(*(id *)(a1 + 32), "setSingleWorkoutClusteringTaskState:", 1);
  }
}

- (void)_scheduleClusteringTask:(unint64_t)a3
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  _QWORD v15[9];
  uint8_t buf[16];

  v6 = 1;
  switch(a3)
  {
    case 1uLL:
      v7 = 30;
      goto LABEL_6;
    case 3uLL:
      v9 = 0;
      v8 = 0;
      v10 = 1;
      goto LABEL_8;
    case 2uLL:
      v6 = 0;
      v7 = 10;
LABEL_6:
      v8 = -[RTWorkoutScheduler topNWorkoutsWithIncrement:](self, "topNWorkoutsWithIncrement:", v7);
      v9 = 1;
      v10 = a3;
LABEL_8:
      -[RTWorkoutScheduler metrics](self, "metrics");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "startCollectMetricsTaskType:totalNAtStart:", v10, -[RTWorkoutScheduler totalWorkouts](self, "totalWorkouts"));

      -[RTWorkoutScheduler workoutRouteManager](self, "workoutRouteManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __46__RTWorkoutScheduler__scheduleClusteringTask___block_invoke;
      v15[3] = &unk_1E92A61A0;
      v15[4] = self;
      v15[5] = a2;
      v15[6] = a3;
      v15[7] = v8;
      v15[8] = v10;
      LOBYTE(v14) = 1;
      objc_msgSend(v12, "processWorkoutsClearClusters:clearExistingDistanceMatrix:buildDistanceMatrix:syncClustersToHealhtKit:syncClustersToWatch:filteringDistanceThreshold:topNWorkouts:isSchedulerTriggered:handler:", 0, 0, v9, v6, v6, v8, 1.79769313e308, v14, v15);

      return;
  }
  _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "RTWorkoutSchedulerTaskTypeUnknown Error", buf, 2u);
  }

}

void __46__RTWorkoutScheduler__scheduleClusteringTask___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[2] = __46__RTWorkoutScheduler__scheduleClusteringTask___block_invoke_2;
  v8[3] = &unk_1E92A6178;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v9 = v3;
  v10 = v6;
  v8[1] = 3221225472;
  v11 = *(_OWORD *)(a1 + 48);
  v8[4] = v5;
  v12 = *(_QWORD *)(a1 + 64);
  v7 = v3;
  dispatch_async(v4, v8);

}

void __46__RTWorkoutScheduler__scheduleClusteringTask___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  NSObject *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "taskTypeToString:", *(_QWORD *)(a1 + 56));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 64);
    v8 = *(_QWORD *)(a1 + 40);
    v19 = 138413314;
    v20 = v4;
    v21 = 2112;
    v22 = v5;
    v23 = 2112;
    v24 = v6;
    v25 = 2048;
    v26 = v7;
    v27 = 2112;
    v28 = v8;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, %@, taskType, %@, processed %lu workouts, error, %@", (uint8_t *)&v19, 0x34u);

  }
  objc_msgSend(*(id *)(a1 + 32), "metrics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stopCollectMetricsTaskType:", *(_QWORD *)(a1 + 72));

  if (!*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 56);
    if (v11 != 3)
    {
      if (v11 == 2)
      {
        objc_msgSend(*(id *)(a1 + 32), "setCurrentNWorkouts:", *(_QWORD *)(a1 + 64));
        objc_msgSend(*(id *)(a1 + 32), "setLastWorkoutComparisonDate:", v10);
LABEL_10:
        objc_msgSend(*(id *)(a1 + 32), "logTaskStates");
        objc_msgSend(*(id *)(a1 + 32), "saveTaskStates");
        if (*(_QWORD *)(a1 + 56) != 1)
        {
          v12 = objc_msgSend(*(id *)(a1 + 32), "currentNWorkouts");
          if (v12 < objc_msgSend(*(id *)(a1 + 32), "totalWorkouts"))
          {
            v13 = *(_QWORD *)(a1 + 56);
            if (v13 != 3)
            {
              if (v13 == 2)
              {
                objc_msgSend(*(id *)(a1 + 32), "_scheduleWorkoutComparisonIfCharging");
              }
              else
              {
                _rt_log_facility_get_os_log(RTLogFacilityWorkout);
                v14 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
                {
                  v15 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v15);
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  NSStringFromSelector(*(SEL *)(a1 + 48));
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  v18 = *(void **)(a1 + 56);
                  v19 = 138412802;
                  v20 = v16;
                  v21 = 2112;
                  v22 = v17;
                  v23 = 2048;
                  v24 = v18;
                  _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "%@, %@, Unhandled task state transition, taskType, %lu", (uint8_t *)&v19, 0x20u);

                }
              }
            }
          }
        }

        return;
      }
      if (v11 != 1)
        goto LABEL_10;
      objc_msgSend(*(id *)(a1 + 32), "setCurrentNWorkouts:", *(_QWORD *)(a1 + 64));
      objc_msgSend(*(id *)(a1 + 32), "setLastWorkoutComparisonDate:", v10);
    }
    objc_msgSend(*(id *)(a1 + 32), "setLastClusterAndSyncDate:", v10);
    goto LABEL_10;
  }
}

- (int64_t)_chargerConnectionState
{
  dispatch_semaphore_t v3;
  RTBatteryManager *batteryManager;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  dispatch_time_t v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  int64_t v21;
  _QWORD v23[4];
  NSObject *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint8_t buf[8];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v3 = dispatch_semaphore_create(0);
  batteryManager = self->_batteryManager;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __45__RTWorkoutScheduler__chargerConnectionState__block_invoke;
  v23[3] = &unk_1E92A61C8;
  v25 = &v26;
  v5 = v3;
  v24 = v5;
  -[RTBatteryManager fetchCurrentChargerConnectionState:](batteryManager, "fetchCurrentChargerConnectionState:", v23);
  v6 = v5;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = dispatch_time(0, 3600000000000);
  if (dispatch_semaphore_wait(v6, v8))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSinceDate:", v7);
    v11 = v10;
    v12 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_125);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "filteredArrayUsingPredicate:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "submitToCoreAnalytics:type:duration:", v16, 1, v11);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    v18 = (void *)MEMORY[0x1E0CB35C8];
    v30 = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)buf = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v30, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
  }

  v21 = v27[3];
  _Block_object_dispose(&v26, 8);
  return v21;
}

void __45__RTWorkoutScheduler__chargerConnectionState__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412290;
      v8 = v5;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "Error fetching battery state, error ,%@", (uint8_t *)&v7, 0xCu);
    }

  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)_scheduleWorkoutComparisonIfCharging
{
  void *v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  int64_t v8;
  NSObject *v9;
  _BOOL4 v10;
  objc_class *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  dispatch_semaphore_t v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  dispatch_time_t v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  uint64_t v37;
  NSObject *v38;
  objc_class *v39;
  id v40;
  void *v41;
  unint64_t v42;
  void *v43;
  objc_class *v44;
  id v45;
  id v46;
  unint64_t v47;
  unint64_t v48;
  BOOL v49;
  BOOL v50;
  void *v51;
  double v52;
  double v53;
  objc_class *v54;
  void *v55;
  void *v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  objc_class *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  uint64_t v66;
  _QWORD v67[4];
  NSObject *v68;
  _BYTE *v69;
  _BYTE v70[12];
  __int16 v71;
  id v72;
  __int16 v73;
  unint64_t v74;
  __int16 v75;
  unint64_t v76;
  _BYTE buf[24];
  uint64_t (*v78)(uint64_t, uint64_t);
  __int128 v79;
  _QWORD v80[3];

  v80[1] = *MEMORY[0x1E0C80C00];
  -[RTWorkoutScheduler metrics](self, "metrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startCollectMetricsTaskType:totalNAtStart:", 3, -[RTWorkoutScheduler totalWorkouts](self, "totalWorkouts"));

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = *MEMORY[0x1E0D18598];
  v63 = *MEMORY[0x1E0CB2D50];
  v66 = 1;
  while (1)
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v6;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v7;
      *(_WORD *)&buf[22] = 2048;
      v78 = (uint64_t (*)(uint64_t, uint64_t))v66;
      _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "%@, %@, iteration, %lu", buf, 0x20u);

    }
    if (-[RTWorkoutScheduler encryptedDataAvailability](self, "encryptedDataAvailability") == 2)
      break;
    v8 = -[RTWorkoutScheduler _chargerConnectionState](self, "_chargerConnectionState");
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
    if (v8 != 1)
    {
      if (v10)
      {
        v58 = (objc_class *)objc_opt_class();
        NSStringFromClass(v58);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v59;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v60;
        _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "%@, %@, no retry, reason, battery sate, disconnected", buf, 0x16u);

      }
      goto LABEL_28;
    }
    if (v10)
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[RTWorkoutScheduler currentNWorkouts](self, "currentNWorkouts");
      v15 = -[RTWorkoutScheduler totalWorkouts](self, "totalWorkouts");
      *(_DWORD *)buf = 138413058;
      *(_QWORD *)&buf[4] = v12;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v13;
      *(_WORD *)&buf[22] = 2048;
      v78 = (uint64_t (*)(uint64_t, uint64_t))v14;
      LOWORD(v79) = 2048;
      *(_QWORD *)((char *)&v79 + 2) = v15;
      _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "%@, %@, Battery State Connected and processing additional workout, current, %lu, total, %lu", buf, 0x2Au);

    }
    v16 = -[RTWorkoutScheduler topNWorkoutsWithIncrement:](self, "topNWorkoutsWithIncrement:", 5);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v78 = __Block_byref_object_copy__172;
    *(_QWORD *)&v79 = __Block_byref_object_dispose__172;
    *((_QWORD *)&v79 + 1) = 0;
    v17 = dispatch_semaphore_create(0);
    -[RTWorkoutScheduler workoutRouteManager](self, "workoutRouteManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v67[0] = MEMORY[0x1E0C809B0];
    v67[1] = 3221225472;
    v67[2] = __58__RTWorkoutScheduler__scheduleWorkoutComparisonIfCharging__block_invoke;
    v67[3] = &unk_1E9297038;
    v69 = buf;
    v19 = v17;
    v68 = v19;
    LOBYTE(v61) = 1;
    objc_msgSend(v18, "processWorkoutsClearClusters:clearExistingDistanceMatrix:buildDistanceMatrix:syncClustersToHealhtKit:syncClustersToWatch:filteringDistanceThreshold:topNWorkouts:isSchedulerTriggered:handler:", 0, 0, 1, 0, 0, v16, 1.79769313e308, v61, v67);

    v20 = v19;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v20, v22))
      goto LABEL_13;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "timeIntervalSinceDate:", v21);
    v25 = v24;
    v26 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_125);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "filteredArrayUsingPredicate:", v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "firstObject");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v26, "submitToCoreAnalytics:type:duration:", v30, 1, v25);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v70 = 0;
      _os_log_fault_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v70, 2u);
    }

    v32 = (void *)MEMORY[0x1E0CB35C8];
    v80[0] = v63;
    *(_QWORD *)v70 = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v70, v80, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "errorWithDomain:code:userInfo:", v62, 15, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      v35 = objc_retainAutorelease(v34);

    }
    else
    {
LABEL_13:
      v35 = 0;
    }

    v36 = v35;
    v37 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
    if (v37)
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        v39 = (objc_class *)objc_opt_class();
        NSStringFromClass(v39);
        v40 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
        *(_DWORD *)v70 = 138412802;
        *(_QWORD *)&v70[4] = v40;
        v71 = 2112;
        v72 = v41;
        v73 = 2112;
        v74 = v42;
        _os_log_impl(&dword_1D1A22000, v38, OS_LOG_TYPE_INFO, "%@, %@, incremental workout comparison failed, error, %@", v70, 0x20u);

      }
    }
    else
    {
      -[RTWorkoutScheduler setCurrentNWorkouts:](self, "setCurrentNWorkouts:", v16);
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTWorkoutScheduler setLastWorkoutComparisonDate:](self, "setLastWorkoutComparisonDate:", v43);

      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        v44 = (objc_class *)objc_opt_class();
        NSStringFromClass(v44);
        v45 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v46 = (id)objc_claimAutoreleasedReturnValue();
        v47 = -[RTWorkoutScheduler currentNWorkouts](self, "currentNWorkouts");
        v48 = -[RTWorkoutScheduler totalWorkouts](self, "totalWorkouts");
        *(_DWORD *)v70 = 138413058;
        *(_QWORD *)&v70[4] = v45;
        v71 = 2112;
        v72 = v46;
        v73 = 2048;
        v74 = v47;
        v75 = 2048;
        v76 = v48;
        _os_log_impl(&dword_1D1A22000, v38, OS_LOG_TYPE_INFO, "%@, %@, completed incremental workout comparison, current %lu, total, %lu", v70, 0x2Au);

      }
    }

    v49 = -[RTWorkoutScheduler _isEligibleForWorkoutComparison](self, "_isEligibleForWorkoutComparison");
    if (v37)
      v50 = 0;
    else
      v50 = v49;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "timeIntervalSinceDate:", v64);
    v53 = v52;

    _Block_object_dispose(buf, 8);
    ++v66;
    if (v53 > 600.0 || !v50)
    {
      -[RTWorkoutScheduler metrics](self, "metrics");
      v9 = objc_claimAutoreleasedReturnValue();
      -[NSObject stopCollectMetricsTaskType:](v9, "stopCollectMetricsTaskType:", 3);
      goto LABEL_28;
    }
  }
  _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v54 = (objc_class *)objc_opt_class();
    NSStringFromClass(v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTDataProtectionManager encryptedDataAvailabilityToString:](RTDataProtectionManager, "encryptedDataAvailabilityToString:", -[RTWorkoutScheduler encryptedDataAvailability](self, "encryptedDataAvailability"));
    v57 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v55;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v56;
    *(_WORD *)&buf[22] = 2112;
    v78 = v57;
    _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "%@, %@, no retry, reason, lock state, %@", buf, 0x20u);

  }
LABEL_28:

}

void __58__RTWorkoutScheduler__scheduleWorkoutComparisonIfCharging__block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)_scheduleUpdateRelevanceScore
{
  void *v4;
  void *v5;
  _QWORD v6[6];

  -[RTWorkoutScheduler metrics](self, "metrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startCollectMetricsTaskType:totalNAtStart:", 5, -[RTWorkoutScheduler totalWorkouts](self, "totalWorkouts"));

  -[RTWorkoutScheduler setUpdateRelevanceScoreTaskState:](self, "setUpdateRelevanceScoreTaskState:", 3);
  -[RTWorkoutScheduler workoutRouteManager](self, "workoutRouteManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__RTWorkoutScheduler__scheduleUpdateRelevanceScore__block_invoke;
  v6[3] = &unk_1E9297628;
  v6[4] = self;
  v6[5] = a2;
  objc_msgSend(v5, "updateRelevanceScoresWithHandler:", v6);

}

void __51__RTWorkoutScheduler__scheduleUpdateRelevanceScore__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD block[5];
  id v9;
  uint64_t v10;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__RTWorkoutScheduler__scheduleUpdateRelevanceScore__block_invoke_2;
  block[3] = &unk_1E9297BC8;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v9 = v3;
  v10 = v6;
  block[4] = v5;
  v7 = v3;
  dispatch_async(v4, block);

}

void __51__RTWorkoutScheduler__scheduleUpdateRelevanceScore__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  objc_class *v3;
  void *v4;
  void *v5;
  uint64_t v6;
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
  _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v9 = 138412802;
    v10 = v4;
    v11 = 2112;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, %@, finished, error, %@", (uint8_t *)&v9, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 32), "metrics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stopCollectMetricsTaskType:", 5);

  if (!*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setLastRelevanceScoreUpdateDate:", v8);

    objc_msgSend(*(id *)(a1 + 32), "setUpdateRelevanceScoreTaskState:", 1);
  }
}

- (void)_onDailyXPCActivity
{
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (-[RTWorkoutScheduler updateRelevanceScoreTaskState](self, "updateRelevanceScoreTaskState") == 2
    || -[RTWorkoutScheduler updateRelevanceScoreTaskState](self, "updateRelevanceScoreTaskState") == 3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[RTWorkoutScheduler taskStateToString:](RTWorkoutScheduler, "taskStateToString:", -[RTWorkoutScheduler updateRelevanceScoreTaskState](self, "updateRelevanceScoreTaskState"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[RTWorkoutScheduler taskStateToString:](RTWorkoutScheduler, "taskStateToString:", 2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138413314;
      v15 = v6;
      v16 = 2112;
      v17 = v7;
      v18 = 2112;
      v19 = CFSTR("RTDefaultsWorkoutSchedulerUpdateRelevanceScoreKey");
      v20 = 2112;
      v21 = v8;
      v22 = 2112;
      v23 = v9;
      _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "%@, %@, not changing task state, %@, from %@ to %@", (uint8_t *)&v14, 0x34u);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTWorkoutScheduler lastRelevanceScoreUpdateDate](self, "lastRelevanceScoreUpdateDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeIntervalSinceDate:", v11);
    v13 = v12;

    if (v13 > 86400.0)
    {
      -[RTWorkoutScheduler setUpdateRelevanceScoreTaskState:](self, "setUpdateRelevanceScoreTaskState:", 2);
      -[RTWorkoutScheduler _scheduleUpdateRelevanceScore](self, "_scheduleUpdateRelevanceScore");
    }
  }
}

- (void)_getCurrentLocationAndMonitorForRegion
{
  RTLocationManager *locationManager;
  id v4;
  NSObject *v5;
  RTLocationManager *v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  locationManager = self->_locationManager;
  v8 = 0;
  -[RTLocationManager stopMonitoringAllRegionsForClientIdentifier:error:](locationManager, "stopMonitoringAllRegionsForClientIdentifier:error:", CFSTR("RTWorkoutSchedulerRegionChange"), &v8);
  v4 = v8;
  if (v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v4;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "Error stopping monitoring for regions, %@", buf, 0xCu);
    }

  }
  v6 = self->_locationManager;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__RTWorkoutScheduler__getCurrentLocationAndMonitorForRegion__block_invoke;
  v7[3] = &unk_1E929E678;
  v7[4] = self;
  -[RTLocationManager fetchCurrentLocationWithHandler:](v6, "fetchCurrentLocationWithHandler:", v7);

}

void __60__RTWorkoutScheduler__getCurrentLocationAndMonitorForRegion__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412290;
      v8 = v5;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "Error fetching current location, %@", (uint8_t *)&v7, 0xCu);
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "onCurrentLocationUpdate:", a2);
  }

}

- (void)onCurrentLocationUpdate:(id)a3
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
  v7[2] = __46__RTWorkoutScheduler_onCurrentLocationUpdate___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __46__RTWorkoutScheduler_onCurrentLocationUpdate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onCurrentLocationUpdate:", *(_QWORD *)(a1 + 40));
}

- (void)_onCurrentLocationUpdate:(id)a3
{
  id v5;
  double v6;
  NSObject *v7;
  objc_class *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  id v15;
  RTLocationManager *locationManager;
  _BOOL4 v17;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  NSObject *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "horizontalAccuracy");
  if (v6 <= 200.0)
  {
    v15 = objc_alloc(MEMORY[0x1E0C9E368]);
    objc_msgSend(v5, "coordinate");
    v7 = objc_msgSend(v15, "initForLowPowerWithCenter:radius:identifier:", CFSTR("RTWorkoutSchedulerBoundingRegion"));
    locationManager = self->_locationManager;
    v18 = 0;
    -[RTLocationManager startMonitoringForRegion:clientIdentifier:error:](locationManager, "startMonitoringForRegion:clientIdentifier:error:", v7, CFSTR("RTWorkoutSchedulerRegionChange"), &v18);
    v9 = v18;
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v10 = objc_claimAutoreleasedReturnValue();
    v17 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
    if (v9)
    {
      if (v17)
      {
        *(_DWORD *)buf = 138412290;
        v20 = v9;
        v12 = "error setting up fence, %@";
        v13 = v10;
        v14 = 12;
        goto LABEL_9;
      }
    }
    else if (v17)
    {
      *(_DWORD *)buf = 138412546;
      v20 = v5;
      v21 = 2112;
      v22 = v7;
      v12 = "Start Low Power Fence Monitoring for workouts, location, %@, region, %@";
      v13 = v10;
      v14 = 22;
      goto LABEL_9;
    }
LABEL_10:

    goto LABEL_11;
  }
  _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "horizontalAccuracy");
    *(_DWORD *)buf = 138412802;
    v20 = v9;
    v21 = 2112;
    v22 = v10;
    v23 = 2048;
    v24 = v11;
    v12 = "%@, %@, Not monitoring for fence due to high location uncertainty, %f";
    v13 = v7;
    v14 = 32;
LABEL_9:
    _os_log_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_INFO, v12, buf, v14);
    goto LABEL_10;
  }
LABEL_11:

}

- (void)handleCircularRegionCallback:(int64_t)a3 region:(id)a4 clientIdentifier:(id)a5
{
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  RTWorkoutScheduler *v17;
  uint64_t v18;
  SEL v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
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
    v21 = "-[RTWorkoutScheduler handleCircularRegionCallback:region:clientIdentifier:]";
    v22 = 1024;
    v23 = 1105;
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
      v21 = "-[RTWorkoutScheduler handleCircularRegionCallback:region:clientIdentifier:]";
      v22 = 1024;
      v23 = 1106;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: clientIdentifier (in %s:%d)", buf, 0x12u);
    }

  }
LABEL_10:
  if (a3 == 2)
  {
    -[RTNotifier queue](self, "queue");
    v14 = objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __75__RTWorkoutScheduler_handleCircularRegionCallback_region_clientIdentifier___block_invoke;
    v15[3] = &unk_1E929F6D8;
    v18 = 2;
    v16 = v9;
    v17 = self;
    v19 = a2;
    dispatch_async(v14, v15);

  }
}

uint64_t __75__RTWorkoutScheduler_handleCircularRegionCallback_region_clientIdentifier___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    +[RTLocationManager stringForRegionCallbackType:](RTLocationManager, "stringForRegionCallbackType:", *(_QWORD *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(a1 + 32);
    v12 = 138412546;
    v13 = v3;
    v14 = 2112;
    v15 = v4;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "Received event, %@, region, %@", (uint8_t *)&v12, 0x16u);

  }
  if (objc_msgSend(*(id *)(a1 + 40), "updateRelevanceScoreTaskState") == 2
    || objc_msgSend(*(id *)(a1 + 40), "updateRelevanceScoreTaskState") == 3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[RTWorkoutScheduler taskStateToString:](RTWorkoutScheduler, "taskStateToString:", objc_msgSend(*(id *)(a1 + 40), "updateRelevanceScoreTaskState"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[RTWorkoutScheduler taskStateToString:](RTWorkoutScheduler, "taskStateToString:", 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138413314;
      v13 = v7;
      v14 = 2112;
      v15 = v8;
      v16 = 2112;
      v17 = CFSTR("RTDefaultsWorkoutSchedulerUpdateRelevanceScoreKey");
      v18 = 2112;
      v19 = v9;
      v20 = 2112;
      v21 = v10;
      _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%@, %@, not changing task state, %@, from %@ to %@", (uint8_t *)&v12, 0x34u);

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "setUpdateRelevanceScoreTaskState:", 2);
  }
  return objc_msgSend(*(id *)(a1 + 40), "_getCurrentLocationAndMonitorForRegion");
}

- (void)_registerForCircularRegionEvents
{
  NSObject *v4;
  void *v5;
  _QWORD v6[6];
  uint8_t buf[16];

  _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "Registering for Circular Region Events", buf, 2u);
  }

  -[RTWorkoutScheduler locationManager](self, "locationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__RTWorkoutScheduler__registerForCircularRegionEvents__block_invoke;
  v6[3] = &unk_1E9297B78;
  v6[4] = self;
  v6[5] = a2;
  objc_msgSend(v5, "registerForRegionEventsWithClientIdentifier:handler:", CFSTR("RTWorkoutSchedulerRegionChange"), v6);

}

void __54__RTWorkoutScheduler__registerForCircularRegionEvents__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  const char *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  v9 = v8;
  if (a3 == 4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[RTLocationManager stringForRegionCallbackType:](RTLocationManager, "stringForRegionCallbackType:", 4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412802;
      v15 = v11;
      v16 = 2112;
      v17 = v12;
      v18 = 2112;
      v19 = v9;
      v13 = "%@, regionMonitoring failure, %@, error, %@";
      goto LABEL_10;
    }
  }
  else if (a3 == 3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[RTLocationManager stringForRegionCallbackType:](RTLocationManager, "stringForRegionCallbackType:", 3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412802;
      v15 = v11;
      v16 = 2112;
      v17 = v12;
      v18 = 2112;
      v19 = v9;
      v13 = "%@, regionMonitoring client registration failure, %@, error, %@";
LABEL_10:
      _os_log_fault_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_FAULT, v13, (uint8_t *)&v14, 0x20u);

    }
  }
  else
  {
    if (!v8)
    {
      objc_msgSend(*(id *)(a1 + 32), "handleCircularRegionCallback:region:clientIdentifier:", a3, v7, CFSTR("RTWorkoutSchedulerRegionChange"));
      goto LABEL_12;
    }
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[RTLocationManager stringForRegionCallbackType:](RTLocationManager, "stringForRegionCallbackType:", a3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412802;
      v15 = v11;
      v16 = 2112;
      v17 = v12;
      v18 = 2112;
      v19 = v9;
      v13 = "%@, regionMonitoring %@, error, %@";
      goto LABEL_10;
    }
  }

LABEL_12:
}

- (void)_schedulePruneDistanceMatrix
{
  void *v4;
  _QWORD v5[6];

  -[RTWorkoutScheduler workoutRouteManager](self, "workoutRouteManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__RTWorkoutScheduler__schedulePruneDistanceMatrix__block_invoke;
  v5[3] = &unk_1E9297628;
  v5[4] = self;
  v5[5] = a2;
  objc_msgSend(v4, "pruneDistanceMatrixWithHandler:", v5);

}

void __50__RTWorkoutScheduler__schedulePruneDistanceMatrix__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD block[5];
  id v9;
  uint64_t v10;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__RTWorkoutScheduler__schedulePruneDistanceMatrix__block_invoke_2;
  block[3] = &unk_1E9297BC8;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v9 = v3;
  v10 = v6;
  block[4] = v5;
  v7 = v3;
  dispatch_async(v4, block);

}

void __50__RTWorkoutScheduler__schedulePruneDistanceMatrix__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  objc_class *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v8 = 138412802;
    v9 = v4;
    v10 = 2112;
    v11 = v5;
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, %@, finished, error, %@", (uint8_t *)&v8, 0x20u);

  }
  if (!*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setLastPruneDistanceMatrixDate:", v7);

  }
}

- (unint64_t)topNWorkoutsWithIncrement:(unint64_t)a3
{
  unint64_t v4;
  unint64_t result;

  v4 = -[RTWorkoutScheduler currentNWorkouts](self, "currentNWorkouts") + a3;
  result = -[RTWorkoutScheduler totalWorkouts](self, "totalWorkouts");
  if (v4 < result)
    return v4;
  return result;
}

- (void)setSingleWorkoutClusteringTaskState:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  const __CFString *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_singleWorkoutClusteringTaskState != a3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      +[RTWorkoutScheduler taskStateToString:](RTWorkoutScheduler, "taskStateToString:", self->_singleWorkoutClusteringTaskState);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[RTWorkoutScheduler taskStateToString:](RTWorkoutScheduler, "taskStateToString:", a3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412802;
      v9 = CFSTR("RTDefaultsWorkoutSchedulerSingleWorkoutClusteringKey");
      v10 = 2112;
      v11 = v6;
      v12 = 2112;
      v13 = v7;
      _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%@, changed from %@ to %@", (uint8_t *)&v8, 0x20u);

    }
    self->_singleWorkoutClusteringTaskState = a3;
    -[RTWorkoutScheduler saveTaskStates](self, "saveTaskStates");
  }
}

- (void)setUpdateRelevanceScoreTaskState:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  const __CFString *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_updateRelevanceScoreTaskState != a3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      +[RTWorkoutScheduler taskStateToString:](RTWorkoutScheduler, "taskStateToString:", self->_updateRelevanceScoreTaskState);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[RTWorkoutScheduler taskStateToString:](RTWorkoutScheduler, "taskStateToString:", a3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412802;
      v9 = CFSTR("RTDefaultsWorkoutSchedulerUpdateRelevanceScoreKey");
      v10 = 2112;
      v11 = v6;
      v12 = 2112;
      v13 = v7;
      _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%@, changed from %@ to %@", (uint8_t *)&v8, 0x20u);

    }
    self->_updateRelevanceScoreTaskState = a3;
    -[RTWorkoutScheduler saveTaskStates](self, "saveTaskStates");
  }
}

- (void)setCurrentNWorkouts:(unint64_t)a3
{
  NSObject *v5;
  unint64_t currentNWorkouts;
  int v7;
  const __CFString *v8;
  __int16 v9;
  unint64_t v10;
  __int16 v11;
  unint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_currentNWorkouts != a3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      currentNWorkouts = self->_currentNWorkouts;
      v7 = 138412802;
      v8 = CFSTR("RTDefaultsWorkoutSchedulerTopNWorkoutsKey");
      v9 = 2048;
      v10 = currentNWorkouts;
      v11 = 2048;
      v12 = a3;
      _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%@, changed from %lu to %lu", (uint8_t *)&v7, 0x20u);
    }

    self->_currentNWorkouts = a3;
    -[RTWorkoutScheduler saveTaskStates](self, "saveTaskStates");
  }
}

- (void)setLastWorkoutComparisonDate:(id)a3
{
  NSDate *v5;
  NSDate **p_lastWorkoutComparisonDate;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  const __CFString *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = (NSDate *)a3;
  p_lastWorkoutComparisonDate = &self->_lastWorkoutComparisonDate;
  if (self->_lastWorkoutComparisonDate != v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      -[NSDate stringFromDate](*p_lastWorkoutComparisonDate, "stringFromDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDate stringFromDate](v5, "stringFromDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412802;
      v11 = CFSTR("RTDefaultsWorkoutSchedulerIncrementalWorkoutComparisonDateKey");
      v12 = 2112;
      v13 = v8;
      v14 = 2112;
      v15 = v9;
      _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%@, changed from %@ to %@", (uint8_t *)&v10, 0x20u);

    }
    objc_storeStrong((id *)&self->_lastWorkoutComparisonDate, a3);
    -[RTDefaultsManager setObject:forKey:](self->_defaultsManager, "setObject:forKey:", *p_lastWorkoutComparisonDate, CFSTR("RTDefaultsWorkoutSchedulerIncrementalWorkoutComparisonDateKey"));
  }

}

- (void)setLastClusterAndSyncDate:(id)a3
{
  NSDate *v5;
  NSDate **p_lastClusterAndSyncDate;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  const __CFString *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = (NSDate *)a3;
  p_lastClusterAndSyncDate = &self->_lastClusterAndSyncDate;
  if (self->_lastClusterAndSyncDate != v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      -[NSDate stringFromDate](*p_lastClusterAndSyncDate, "stringFromDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDate stringFromDate](v5, "stringFromDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412802;
      v11 = CFSTR("RTDefaultsWorkoutSchedulerClusterAndSyncDateKey");
      v12 = 2112;
      v13 = v8;
      v14 = 2112;
      v15 = v9;
      _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%@, changed from %@ to %@", (uint8_t *)&v10, 0x20u);

    }
    objc_storeStrong((id *)&self->_lastClusterAndSyncDate, a3);
    -[RTDefaultsManager setObject:forKey:](self->_defaultsManager, "setObject:forKey:", *p_lastClusterAndSyncDate, CFSTR("RTDefaultsWorkoutSchedulerClusterAndSyncDateKey"));
  }

}

- (void)setLastSingleWorkoutClusteringDate:(id)a3
{
  NSDate *v5;
  NSDate **p_lastSingleWorkoutClusteringDate;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  const __CFString *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = (NSDate *)a3;
  p_lastSingleWorkoutClusteringDate = &self->_lastSingleWorkoutClusteringDate;
  if (self->_lastSingleWorkoutClusteringDate != v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      -[NSDate stringFromDate](*p_lastSingleWorkoutClusteringDate, "stringFromDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDate stringFromDate](v5, "stringFromDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412802;
      v11 = CFSTR("RTDefaultsWorkoutSchedulerSingleWorkoutClusteringDateKey");
      v12 = 2112;
      v13 = v8;
      v14 = 2112;
      v15 = v9;
      _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%@, changed from %@ to %@", (uint8_t *)&v10, 0x20u);

    }
    objc_storeStrong((id *)&self->_lastSingleWorkoutClusteringDate, a3);
    -[RTDefaultsManager setObject:forKey:](self->_defaultsManager, "setObject:forKey:", *p_lastSingleWorkoutClusteringDate, CFSTR("RTDefaultsWorkoutSchedulerSingleWorkoutClusteringDateKey"));
  }

}

- (void)setLastRelevanceScoreUpdateDate:(id)a3
{
  NSDate *v5;
  NSDate **p_lastRelevanceScoreUpdateDate;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  const __CFString *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = (NSDate *)a3;
  p_lastRelevanceScoreUpdateDate = &self->_lastRelevanceScoreUpdateDate;
  if (self->_lastRelevanceScoreUpdateDate != v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      -[NSDate stringFromDate](*p_lastRelevanceScoreUpdateDate, "stringFromDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDate stringFromDate](v5, "stringFromDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412802;
      v11 = CFSTR("RTDefaultsWorkoutSchedulerUpdateRelevanceScoreDateKey");
      v12 = 2112;
      v13 = v8;
      v14 = 2112;
      v15 = v9;
      _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%@, changed from %@ to %@", (uint8_t *)&v10, 0x20u);

    }
    objc_storeStrong((id *)&self->_lastRelevanceScoreUpdateDate, a3);
    -[RTDefaultsManager setObject:forKey:](self->_defaultsManager, "setObject:forKey:", *p_lastRelevanceScoreUpdateDate, CFSTR("RTDefaultsWorkoutSchedulerUpdateRelevanceScoreDateKey"));
  }

}

- (void)setLastPruneDistanceMatrixDate:(id)a3
{
  NSDate *v5;
  NSDate **p_lastPruneDistanceMatrixDate;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  const __CFString *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = (NSDate *)a3;
  p_lastPruneDistanceMatrixDate = &self->_lastPruneDistanceMatrixDate;
  if (self->_lastPruneDistanceMatrixDate != v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      -[NSDate stringFromDate](*p_lastPruneDistanceMatrixDate, "stringFromDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDate stringFromDate](v5, "stringFromDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412802;
      v11 = CFSTR("RTDefaultsWorkoutSchedulerUpdateRelevanceScoreDateKey");
      v12 = 2112;
      v13 = v8;
      v14 = 2112;
      v15 = v9;
      _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%@, changed from %@ to %@", (uint8_t *)&v10, 0x20u);

    }
    objc_storeStrong((id *)&self->_lastPruneDistanceMatrixDate, a3);
    -[RTDefaultsManager setObject:forKey:](self->_defaultsManager, "setObject:forKey:", *p_lastPruneDistanceMatrixDate, CFSTR("RTDefaultsWorkoutSchedulerPruneDistanceMatrixDateKey"));
  }

}

- (void)_setupDisplayLayoutMonitor
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, void *, void *);
  void *v8;
  id v9;
  id location;

  objc_msgSend(MEMORY[0x1E0D230E0], "configurationForDefaultMainDisplayMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v5 = MEMORY[0x1E0C809B0];
  v6 = 3221225472;
  v7 = __48__RTWorkoutScheduler__setupDisplayLayoutMonitor__block_invoke;
  v8 = &unk_1E92A61F0;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v3, "setTransitionHandler:", &v5);
  objc_msgSend(MEMORY[0x1E0D230D0], "monitorWithConfiguration:", v3, v5, v6, v7, v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutScheduler setDisplayLayoutMonitor:](self, "setDisplayLayoutMonitor:", v4);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __48__RTWorkoutScheduler__setupDisplayLayoutMonitor__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;

  v5 = (id *)(a1 + 32);
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "layoutMonitorDidUpdateDisplayLayout:withContext:", v7, v6);

}

- (void)layoutMonitorDidUpdateDisplayLayout:(id)a3 withContext:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  int v13;
  NSObject *v14;
  _QWORD v15[5];
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v5, "elements");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    v10 = *MEMORY[0x1E0D22C78];
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", v10);

        if (v13)
        {
          -[RTNotifier queue](self, "queue");
          v14 = objc_claimAutoreleasedReturnValue();
          v15[0] = MEMORY[0x1E0C809B0];
          v15[1] = 3221225472;
          v15[2] = __70__RTWorkoutScheduler_layoutMonitorDidUpdateDisplayLayout_withContext___block_invoke;
          v15[3] = &unk_1E9297540;
          v15[4] = self;
          v16 = v5;
          dispatch_async(v14, v15);

          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

}

uint64_t __70__RTWorkoutScheduler_layoutMonitorDidUpdateDisplayLayout_withContext___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onLayoutMonitorUpdateDisplayBacklightLevelNotification:", objc_msgSend(*(id *)(a1 + 40), "displayBacklightLevel"));
}

- (void)_onLayoutMonitorUpdateDisplayBacklightLevelNotification:(int64_t)a3
{
  NSObject *v5;
  int v6;
  int64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = 134217984;
    v7 = a3;
    _os_log_debug_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_DEBUG, "Received display backlight level notification, %lu", (uint8_t *)&v6, 0xCu);
  }

  if (!a3)
  {
    -[RTWorkoutScheduler _evaluateVersionChange](self, "_evaluateVersionChange");
    -[RTWorkoutScheduler _evaluateSchedulingTaskPriority](self, "_evaluateSchedulingTaskPriority");
  }
}

- (RTBatteryManager)batteryManager
{
  return self->_batteryManager;
}

- (void)setBatteryManager:(id)a3
{
  objc_storeStrong((id *)&self->_batteryManager, a3);
}

- (RTXPCActivityManager)xpcActivityManager
{
  return self->_xpcActivityManager;
}

- (void)setXpcActivityManager:(id)a3
{
  objc_storeStrong((id *)&self->_xpcActivityManager, a3);
}

- (RTDataProtectionManager)dataProtectionManager
{
  return self->_dataProtectionManager;
}

- (void)setDataProtectionManager:(id)a3
{
  objc_storeStrong((id *)&self->_dataProtectionManager, a3);
}

- (RTWorkoutRouteManager)workoutRouteManager
{
  return self->_workoutRouteManager;
}

- (void)setWorkoutRouteManager:(id)a3
{
  objc_storeStrong((id *)&self->_workoutRouteManager, a3);
}

- (RTHealthKitManager)healthKitManager
{
  return self->_healthKitManager;
}

- (void)setHealthKitManager:(id)a3
{
  objc_storeStrong((id *)&self->_healthKitManager, a3);
}

- (RTLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_locationManager, a3);
}

- (RTTimerManager)timerManager
{
  return self->_timerManager;
}

- (void)setTimerManager:(id)a3
{
  objc_storeStrong((id *)&self->_timerManager, a3);
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void)setDefaultsManager:(id)a3
{
  objc_storeStrong((id *)&self->_defaultsManager, a3);
}

- (RTPlatform)platform
{
  return self->_platform;
}

- (void)setPlatform:(id)a3
{
  objc_storeStrong((id *)&self->_platform, a3);
}

- (unint64_t)singleWorkoutClusteringTaskState
{
  return self->_singleWorkoutClusteringTaskState;
}

- (unint64_t)updateRelevanceScoreTaskState
{
  return self->_updateRelevanceScoreTaskState;
}

- (unint64_t)currentNWorkouts
{
  return self->_currentNWorkouts;
}

- (unint64_t)totalWorkouts
{
  return self->_totalWorkouts;
}

- (void)setTotalWorkouts:(unint64_t)a3
{
  self->_totalWorkouts = a3;
}

- (NSDate)lastClusterAndSyncDate
{
  return self->_lastClusterAndSyncDate;
}

- (NSDate)lastWorkoutComparisonDate
{
  return self->_lastWorkoutComparisonDate;
}

- (NSDate)lastRelevanceScoreUpdateDate
{
  return self->_lastRelevanceScoreUpdateDate;
}

- (NSDate)lastSingleWorkoutClusteringDate
{
  return self->_lastSingleWorkoutClusteringDate;
}

- (NSDate)lastPruneDistanceMatrixDate
{
  return self->_lastPruneDistanceMatrixDate;
}

- (RTTimer)clusteringDeferralTimer
{
  return self->_clusteringDeferralTimer;
}

- (void)setClusteringDeferralTimer:(id)a3
{
  objc_storeStrong((id *)&self->_clusteringDeferralTimer, a3);
}

- (int64_t)encryptedDataAvailability
{
  return self->_encryptedDataAvailability;
}

- (void)setEncryptedDataAvailability:(int64_t)a3
{
  self->_encryptedDataAvailability = a3;
}

- (RTWorkoutSchedulerMetrics)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_metrics, a3);
}

- (FBSDisplayLayoutMonitor)layoutMonitor
{
  return self->_layoutMonitor;
}

- (void)setLayoutMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_layoutMonitor, a3);
}

- (FBSDisplayLayoutMonitor)displayLayoutMonitor
{
  return self->_displayLayoutMonitor;
}

- (void)setDisplayLayoutMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_displayLayoutMonitor, a3);
}

- (FBSDisplayLayoutMonitorConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_displayLayoutMonitor, 0);
  objc_storeStrong((id *)&self->_layoutMonitor, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_clusteringDeferralTimer, 0);
  objc_storeStrong((id *)&self->_lastPruneDistanceMatrixDate, 0);
  objc_storeStrong((id *)&self->_lastSingleWorkoutClusteringDate, 0);
  objc_storeStrong((id *)&self->_lastRelevanceScoreUpdateDate, 0);
  objc_storeStrong((id *)&self->_lastWorkoutComparisonDate, 0);
  objc_storeStrong((id *)&self->_lastClusterAndSyncDate, 0);
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_timerManager, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_healthKitManager, 0);
  objc_storeStrong((id *)&self->_workoutRouteManager, 0);
  objc_storeStrong((id *)&self->_dataProtectionManager, 0);
  objc_storeStrong((id *)&self->_xpcActivityManager, 0);
  objc_storeStrong((id *)&self->_batteryManager, 0);
}

@end
